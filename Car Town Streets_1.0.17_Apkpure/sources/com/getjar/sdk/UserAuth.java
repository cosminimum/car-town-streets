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
/* loaded from: classes.dex */
public class UserAuth {
    private static final ExecutorService _ExecutorService = Executors.newCachedThreadPool();
    private CommContext commContext;

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
        }
        if (userAuthListener == null) {
            throw new IllegalArgumentException("'userAuthListener' cannot be null");
        }
        SetExceptionFutureTask<User> future = new SetExceptionFutureTask<>(new EnsureUserAuthCallable(this, theTitle, userAuthListener));
        _ExecutorService.execute(future);
        return future;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class EnsureUserAuthCallable implements Callable<User> {
        private String theTitle;
        private EnsureUserAuthListener userAuthListener;

        public EnsureUserAuthCallable(UserAuth userAuth, String theTitle, EnsureUserAuthListener userAuthListener) {
            this(theTitle);
            if (userAuthListener == null) {
                throw new IllegalArgumentException("userAuthListener cannot be null");
            }
            this.userAuthListener = userAuthListener;
        }

        public EnsureUserAuthCallable(String theTitle) {
            this.userAuthListener = null;
            if (StringUtility.isNullOrEmpty(theTitle)) {
                throw new IllegalArgumentException("theTitle cannot be null");
            }
            this.theTitle = theTitle;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public User mo33call() throws Exception {
            Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() START");
            User user = null;
            try {
                try {
                    AuthManager.initialize(UserAuth.this.commContext.getApplicationContext());
                    Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: waitOnAuthWithUI() start");
                    AuthManager.getInstance().waitOnAuthWithUI(this.theTitle);
                    Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: waitOnAuthWithUI() finished");
                    Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: Creating User instance");
                    User user2 = new User();
                    try {
                        if (this.userAuthListener != null) {
                            this.userAuthListener.userAuthCompleted(user2);
                        }
                    } catch (Exception e) {
                        Logger.e(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: callback failed", e);
                    }
                    if (user2 != null) {
                        Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning user instance]");
                        return user2;
                    }
                    Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning null]");
                    user = user2;
                    return user;
                } catch (Exception e2) {
                    Logger.w(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: failed", e2);
                    try {
                        if (this.userAuthListener != null) {
                            this.userAuthListener.userAuthCompleted(null);
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
                }
            } catch (Throwable th) {
                try {
                    if (this.userAuthListener != null) {
                        this.userAuthListener.userAuthCompleted(user);
                    }
                } catch (Exception e4) {
                    Logger.e(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: callback failed", e4);
                }
                if (user == null) {
                    Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning null]");
                } else {
                    Logger.d(Area.AUTH.value(), "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning user instance]");
                }
                throw th;
            }
        }
    }
}
