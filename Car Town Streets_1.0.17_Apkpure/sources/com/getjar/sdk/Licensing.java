package com.getjar.sdk;

import com.getjar.sdk.License;
import com.getjar.sdk.data.LicenseEngine;
import com.getjar.sdk.data.LicenseInternal;
import com.getjar.sdk.listener.AcquireUnmanagedProductLicenseListener;
import com.getjar.sdk.listener.GetUnmanagedProductLicensesListener;
import com.getjar.sdk.listener.IsUnmanagedProductLicensedListener;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.SetExceptionFutureTask;
import com.getjar.sdk.utilities.StringUtility;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
/* loaded from: classes.dex */
public class Licensing {
    private static final ExecutorService _ExecutorService = Executors.newCachedThreadPool();
    private LicenseEngine mLicenseEngine;

    public Licensing(GetJarContext getJarContext) {
        this.mLicenseEngine = null;
        if (getJarContext == null) {
            throw new IllegalArgumentException("'getJarContext' can not be NULL");
        }
        this.mLicenseEngine = new LicenseEngine(getJarContext.getCommContext());
    }

    @Deprecated
    public License acquireUnmanagedProductLicense(String theProductId, License.LicenseScope licenseScope) throws InterruptedException, ExecutionException {
        Logger.i(Area.LICENSING.value() | Area.DEVELOPER_API.value(), "Licensing acquireUnmanagedProductLicense started");
        return acquireUnmanagedProductLicenseAsync(theProductId, licenseScope).get();
    }

    @Deprecated
    public Future<License> acquireUnmanagedProductLicenseAsync(String theProductId, License.LicenseScope licenseScope) {
        Product.validateProductId(theProductId);
        if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        }
        Logger.i(Area.LICENSING.value() | Area.DEVELOPER_API.value(), String.format(Locale.US, "Licensing acquireUnmanagedProductLicenseAsync(%s,%s) started", theProductId, licenseScope.name()));
        SetExceptionFutureTask<License> future = new SetExceptionFutureTask<>(new AcquireUnmanagedProductLicenseCallable(theProductId, licenseScope));
        _ExecutorService.execute(future);
        return future;
    }

    @Deprecated
    public Future<License> acquireUnmanagedProductLicenseAsync(String theProductId, License.LicenseScope licenseScope, AcquireUnmanagedProductLicenseListener licensingListener) {
        Product.validateProductId(theProductId);
        if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        }
        if (licensingListener == null) {
            throw new IllegalArgumentException("licensingListener cannot be null");
        }
        Logger.i(Area.LICENSING.value() | Area.DEVELOPER_API.value(), String.format(Locale.US, "Licensing acquireUnmanagedProductLicenseAsync(%s,%s,licensingListener) started", theProductId, licenseScope.name()));
        SetExceptionFutureTask<License> future = new SetExceptionFutureTask<>(new AcquireUnmanagedProductLicenseCallable(this, theProductId, licenseScope, licensingListener));
        _ExecutorService.execute(future);
        return future;
    }

    public Boolean isUnmanagedProductLicensed(String theProductId) throws InterruptedException, ExecutionException {
        Logger.i(Area.LICENSING.value() | Area.DEVELOPER_API.value(), "Licensing isUnmanagedProductLicensed started");
        return isUnmanagedProductLicensedAsync(theProductId).get();
    }

    public Future<Boolean> isUnmanagedProductLicensedAsync(String theProductId, IsUnmanagedProductLicensedListener licensingListener) {
        if (StringUtility.isNullOrEmpty(theProductId)) {
            throw new IllegalArgumentException("'theProductId' cannot be NULL or empty");
        }
        if (licensingListener == null) {
            throw new IllegalArgumentException("licensingListener cannot be null");
        }
        Logger.i(Area.LICENSING.value() | Area.DEVELOPER_API.value(), String.format(Locale.US, "Licensing isUnmanagedProductLicensedAsync(%s, licensingListener) started", theProductId));
        SetExceptionFutureTask<Boolean> future = new SetExceptionFutureTask<>(new IsUnmanagedProductLicensedCallable(this, theProductId, licensingListener));
        _ExecutorService.execute(future);
        return future;
    }

    public Future<Boolean> isUnmanagedProductLicensedAsync(String theProductId) {
        if (StringUtility.isNullOrEmpty(theProductId)) {
            throw new IllegalArgumentException("'theProductId' cannot be NULL or empty");
        }
        Logger.i(Area.LICENSING.value() | Area.DEVELOPER_API.value(), String.format(Locale.US, "Licensing isUnmanagedProductLicensedAsync(%s) started", theProductId));
        SetExceptionFutureTask<Boolean> future = new SetExceptionFutureTask<>(new IsUnmanagedProductLicensedCallable(theProductId));
        _ExecutorService.execute(future);
        return future;
    }

    public ArrayList<License> getUnmanagedProductLicenses(String[] theProductIds) throws InterruptedException, ExecutionException {
        Logger.i(Area.LICENSING.value() | Area.DEVELOPER_API.value(), "Licensing getUnmanagedProductLicenses(theProductIds) started");
        return getUnmanagedProductLicensesAsync(theProductIds).get();
    }

    public Future<ArrayList<License>> getUnmanagedProductLicensesAsync(String[] theProductIds) {
        if (theProductIds == null || theProductIds.length <= 0) {
            throw new IllegalArgumentException("theProductIds cannot be null or empty");
        }
        Logger.i(Area.LICENSING.value() | Area.DEVELOPER_API.value(), "Licensing getUnmanagedProductLicensesAsync(theProductIds) started");
        SetExceptionFutureTask<ArrayList<License>> future = new SetExceptionFutureTask<>(new GetUnmanagedProductLicensesCallable(theProductIds));
        _ExecutorService.execute(future);
        return future;
    }

    public Future<ArrayList<License>> getUnmanagedProductLicensesAsync(String[] theProductIds, GetUnmanagedProductLicensesListener licensingListener) {
        if (theProductIds == null || theProductIds.length <= 0) {
            throw new IllegalArgumentException("theProductIds cannot be null or empty");
        }
        if (licensingListener == null) {
            throw new IllegalArgumentException("licensingListener cannot be null");
        }
        Logger.i(Area.LICENSING.value() | Area.DEVELOPER_API.value(), "Licensing getUnmanagedProductLicensesAsync(theProductIds, licensingListener) started");
        SetExceptionFutureTask<ArrayList<License>> future = new SetExceptionFutureTask<>(new GetUnmanagedProductLicensesCallable(this, theProductIds, licensingListener));
        _ExecutorService.execute(future);
        return future;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Deprecated
    /* loaded from: classes.dex */
    public class AcquireUnmanagedProductLicenseCallable implements Callable<License> {
        private License.LicenseScope licenseScope;
        private AcquireUnmanagedProductLicenseListener licensingListener;
        private String theProductId;

        public AcquireUnmanagedProductLicenseCallable(Licensing licensing, String theProductId, License.LicenseScope licenseScope, AcquireUnmanagedProductLicenseListener licensingListener) {
            this(theProductId, licenseScope);
            if (licensingListener == null) {
                throw new IllegalArgumentException("licensingListener cannot be null");
            }
            this.licensingListener = licensingListener;
        }

        public AcquireUnmanagedProductLicenseCallable(String theProductId, License.LicenseScope licenseScope) {
            this.licensingListener = null;
            if (StringUtility.isNullOrEmpty(theProductId)) {
                throw new IllegalArgumentException("theProductId cannot be null or empty");
            }
            if (licenseScope == null) {
                throw new IllegalArgumentException("licenseScope cannot be null or empty");
            }
            this.theProductId = theProductId;
            this.licenseScope = licenseScope;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public License mo28call() throws Exception {
            License license = Licensing.this.mLicenseEngine.acquireUnmanagedProductLicense(this.theProductId, this.licenseScope);
            if (this.licensingListener != null) {
                Logger.i(Area.LICENSING.value(), String.format(Locale.US, "Licensing AcquireUnmanagedProductLicenseCallback sending callback for %s", this.theProductId));
                this.licensingListener.acquireUnmanagedProductLicenseEvent(license);
            }
            return license;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class IsUnmanagedProductLicensedCallable implements Callable<Boolean> {
        private IsUnmanagedProductLicensedListener licensingListener;
        private String theProductId;

        public IsUnmanagedProductLicensedCallable(Licensing licensing, String theProductId, IsUnmanagedProductLicensedListener licensingListener) {
            this(theProductId);
            if (licensingListener == null) {
                throw new IllegalArgumentException("licensingListener cannot be null");
            }
            this.licensingListener = licensingListener;
        }

        public IsUnmanagedProductLicensedCallable(String theProductId) {
            this.licensingListener = null;
            if (StringUtility.isNullOrEmpty(theProductId)) {
                throw new IllegalArgumentException("theProductId cannot be null or empty");
            }
            this.theProductId = theProductId;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public Boolean mo29call() throws Exception {
            Boolean isLicensed = Licensing.this.mLicenseEngine.isUnmanagedProductLicensed(this.theProductId);
            if (this.licensingListener != null) {
                Logger.i(Area.LICENSING.value(), String.format(Locale.US, "Licensing IsUnmanagedProductLicensedCallback sending callback for %s", this.theProductId));
                this.licensingListener.isUnmanagedProductLicensedEvent(this.theProductId, isLicensed);
            }
            return isLicensed;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class GetUnmanagedProductLicensesCallable implements Callable<ArrayList<License>> {
        private GetUnmanagedProductLicensesListener licensingListener;
        private String[] theProductIds;

        public GetUnmanagedProductLicensesCallable(Licensing licensing, String[] theProductIds, GetUnmanagedProductLicensesListener licensingListener) {
            this(theProductIds);
            if (licensingListener == null) {
                throw new IllegalArgumentException("licensingListener cannot be null");
            }
            this.licensingListener = licensingListener;
        }

        public GetUnmanagedProductLicensesCallable(String[] theProductIds) {
            this.licensingListener = null;
            if (theProductIds == null || theProductIds.length <= 0) {
                throw new IllegalArgumentException("theProductIds cannot be null or empty");
            }
            this.theProductIds = theProductIds;
        }

        @Override // java.util.concurrent.Callable
        public ArrayList<License> call() throws Exception {
            ArrayList<LicenseInternal> internalLicenses = Licensing.this.mLicenseEngine.getUnmanagedProductLicenses(this.theProductIds);
            ArrayList<License> licenses = new ArrayList<>(internalLicenses.size());
            Iterator i$ = internalLicenses.iterator();
            while (i$.hasNext()) {
                LicenseInternal internalLicense = i$.next();
                licenses.add(internalLicense);
            }
            if (this.licensingListener != null) {
                Logger.i(Area.LICENSING.value(), "Licensing GetUnmanagedProductLicensesCallback sending callback");
                this.licensingListener.getUnmanagedProductLicensesEvent(licenses);
            }
            return licenses;
        }
    }
}
