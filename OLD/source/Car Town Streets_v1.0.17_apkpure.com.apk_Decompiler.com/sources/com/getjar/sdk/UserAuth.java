package com.getjar.sdk;

import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.listener.EnsureUserAuthListener;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.SetExceptionFutureTask;
import com.getjar.sdk.utilities.StringUtility;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class UserAuth {
    private static final ExecutorService _ExecutorService = Executors.newCachedThreadPool();
    /* access modifiers changed from: private */
    public CommContext commContext;

    public UserAuth(GetJarContext getJarContext) {
        if (getJarContext == null) {
            throw new IllegalArgumentException("'getJarContext' cannot be NULL");
        }
        this.commContext = getJarContext.getCommContext();
    }

    public User ensureUser(String theTitle) throws InterruptedException, ExecutionException {
        return ensureUserAsync(theTitle).get();
    }

    public Future<User> ensureUserAsync(String theTitle) {
        if (StringUtility.isNullOrEmpty(theTitle)) {
            throw new IllegalArgumentException("theTitle cannot be null or empty");
        }
        SetExceptionFutureTask<User> future = new SetExceptionFutureTask<>(new EnsureUserAuthCallable(theTitle));
        _ExecutorService.execute(future);
        return future;
    }

    public Future<User> ensureUserAsync(String theTitle, EnsureUserAuthListener userAuthListener) {
        if (StringUtility.isNullOrEmpty(theTitle)) {
            throw new IllegalArgumentException("theTitle cannot be null or empty");
        } else if (userAuthListener == null) {
            throw new IllegalArgumentException("'userAuthListener' cannot be null");
        } else {
            SetExceptionFutureTask<User> future = new SetExceptionFutureTask<>(new EnsureUserAuthCallable(this, theTitle, userAuthListener));
            _ExecutorService.execute(future);
            return future;
        }
    }

    private class EnsureUserAuthCallable implements Callable<User> {
        private String theTitle;
        private EnsureUserAuthListener userAuthListener;

        public EnsureUserAuthCallable(UserAuth userAuth, String theTitle2, EnsureUserAuthListener userAuthListener2) {
            this(theTitle2);
            if (userAuthListener2 == null) {
                throw new IllegalArgumentException("userAuthListener cannot be null");
            }
            this.userAuthListener = userAuthListener2;
        }

        public EnsureUserAuthCallable(String theTitle2) {
            this.userAuthListener = null;
            if (StringUtility.isNullOrEmpty(theTitle2)) {
                throw new IllegalArgumentException("theTitle cannot be null");
            }
            this.theTitle = theTitle2;
        }

        public User call() throws Exception {
            Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() START");
            try {
                AuthManager.initialize(UserAuth.this.commContext.getApplicationContext());
                Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: waitOnAuthWithUI() start");
                AuthManager.getInstance().waitOnAuthWithUI(this.theTitle);
                Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: waitOnAuthWithUI() finished");
                Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: Creating User instance");
                User user = new User();
                try {
                    if (this.userAuthListener != null) {
                        this.userAuthListener.userAuthCompleted(user);
                    }
                } catch (Exception e) {
                    Logger.e(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: callback failed", e);
                }
                if (user == null) {
                    Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning null]");
                    return user;
                }
                Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning user instance]");
                return user;
            } catch (Exception e2) {
                Logger.w(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: failed", e2);
                try {
                    if (this.userAuthListener != null) {
                        this.userAuthListener.userAuthCompleted((User) null);
                    }
                } catch (Exception e3) {
                    Logger.e(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: callback failed", e3);
                }
                if (0 == 0) {
                    Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning null]");
                    return null;
                }
                Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning user instance]");
                return null;
            } catch (Throwable th) {
                try {
                    if (this.userAuthListener != null) {
                        this.userAuthListener.userAuthCompleted((User) null);
                    }
                } catch (Exception e4) {
                    Logger.e(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: callback failed", e4);
                }
                if (0 == 0) {
                    Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning null]");
                } else {
                    Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning user instance]");
                }
                throw th;
            }
        }
    }
}
