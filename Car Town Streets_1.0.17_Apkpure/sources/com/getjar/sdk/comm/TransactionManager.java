package com.getjar.sdk.comm;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.GetJarManager;
import com.getjar.sdk.License;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.comm.persistence.DBTransactions;
import com.getjar.sdk.comm.persistence.EarnBucket;
import com.getjar.sdk.comm.persistence.ManagedOfferBucket;
import com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket;
import com.getjar.sdk.comm.persistence.RelatedEarnData;
import com.getjar.sdk.comm.persistence.RelatedManagedOfferData;
import com.getjar.sdk.comm.persistence.RelatedPurchaseData;
import com.getjar.sdk.comm.persistence.TransactionBucket;
import com.getjar.sdk.data.GooglePurchaseResponse;
import com.getjar.sdk.data.LicenseEngine;
import com.getjar.sdk.data.LicenseInternal;
import com.getjar.sdk.data.earning.EarnStateDatabase;
import com.getjar.sdk.exceptions.ServiceException;
import com.getjar.sdk.exceptions.TransactionException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.response.PurchaseSucceededResponse;
import com.getjar.sdk.rewards.GetJarWebViewSubActivity;
import com.getjar.sdk.rewards.InAppPurchaseManager;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.NotificationsUtility;
import com.getjar.sdk.utilities.SetExceptionFutureTask;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import com.google.analytics.tracking.android.HitTypes;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class TransactionManager {
    private Context _applicationContext;
    private static final ExecutorService _ExecutorService = Executors.newSingleThreadExecutor();
    private static final ExecutorService _ExecutorServiceInternal = Executors.newCachedThreadPool();
    private static ConcurrentLinkedQueue<String> _CanceledClientTransactionIDs = new ConcurrentLinkedQueue<>();
    private static final Object _UploadBuyGoldLock = new Object();
    private static final Object _TransactionFlowLock = new Object();
    private static final Object _PurchaseTransactionStateLock = new Object();
    private static final Object _ManagedOfferTransactionStateLock = new Object();

    public TransactionManager(Context applicationContext) {
        if (applicationContext == null) {
            throw new IllegalArgumentException("'applicationContext' can not be NULL");
        }
        this._applicationContext = applicationContext.getApplicationContext();
    }

    public Future<Operation> startPurchaseTransaction(String clientTransactionId, final CommContext commContext, String productId, String productName, String productDescription, Integer amount, String developerPayload, License.LicenseScope licenseScope, HashMap<String, String> trackingMetadata) throws IOException {
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        }
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        }
        if (StringUtility.isNullOrEmpty(productId)) {
            throw new IllegalArgumentException("'productId' can not be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(productName)) {
            throw new IllegalArgumentException("'productName' can not be NULL or empty");
        }
        if (amount == null || amount.intValue() < 0) {
            throw new IllegalArgumentException("'amount' can not be NULL or less than 0");
        }
        Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: startPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]", clientTransactionId, Long.valueOf(Thread.currentThread().getId())));
        RelatedPurchaseData purchase = new RelatedPurchaseData(productId, productName, productDescription, amount.intValue(), developerPayload, licenseScope, trackingMetadata);
        try {
            DBTransactions.getInstance(this._applicationContext).insertPurchaseTransaction(clientTransactionId, purchase);
        } catch (IllegalStateException e) {
        }
        final TransactionBucket transaction = DBTransactions.getInstance(this._applicationContext).loadTransaction(clientTransactionId);
        SetExceptionFutureTask<Operation> future = new SetExceptionFutureTask<>(new Callable<Operation>() { // from class: com.getjar.sdk.comm.TransactionManager.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.concurrent.Callable
            /* renamed from: call */
            public Operation mo40call() throws Exception {
                try {
                    return TransactionManager.this.runPurchaseTransaction((PurchaseUnmanagedBucket) transaction, commContext, false);
                } catch (Exception e2) {
                    Logger.e(Area.PURCHASE.value() | Area.TRANSACTION.value(), "TransactionManager: runPurchaseTransaction() failed", e2);
                    return null;
                }
            }
        });
        _ExecutorService.execute(future);
        _ExecutorService.submit(new Runnable() { // from class: com.getjar.sdk.comm.TransactionManager.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    TransactionManager.this.runTransactions(commContext, false, false);
                } catch (Exception e2) {
                    Logger.e(Area.PURCHASE.value() | Area.TRANSACTION.value(), "TransactionManager: runTransactions() failed", e2);
                }
            }
        });
        Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: startPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d] finished", clientTransactionId, Long.valueOf(Thread.currentThread().getId())));
        return future;
    }

    public Future<Operation> startManagedOfferTransaction(final CommContext commContext, final String clientTransactionId, String offerId, HashMap<String, String> purchaseMetadata, HashMap<String, String> trackingMetadata) {
        AuthManager.initialize(commContext.getApplicationContext());
        if (AuthManager.getInstance().getClaimsManager(commContext.getApplicationContext()).canPurchaseManagedProducts()) {
            RelatedManagedOfferData purchaseData = new RelatedManagedOfferData(offerId, purchaseMetadata, trackingMetadata);
            try {
                DBTransactions.getInstance(commContext.getApplicationContext()).insertManagedOfferTransaction(clientTransactionId, purchaseData, DBTransactions.ManagedOfferState.CREATED);
            } catch (IOException e) {
                Logger.e(Area.OFFER.value() | Area.TRANSACTION.value(), "Error occured while creating transaction", e);
                return null;
            } catch (IllegalStateException e2) {
            }
            SetExceptionFutureTask<Operation> future = new SetExceptionFutureTask<>(new Callable<Operation>() { // from class: com.getjar.sdk.comm.TransactionManager.3
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // java.util.concurrent.Callable
                /* renamed from: call */
                public Operation mo41call() throws Exception {
                    try {
                        return TransactionManager.this.runManagedOfferTransaction(clientTransactionId, commContext, false);
                    } catch (Exception e3) {
                        Logger.e(Area.OFFER.value() | Area.TRANSACTION.value(), "TransactionManager: startManagedOfferTransaction() failed", e3);
                        return null;
                    }
                }
            });
            _ExecutorService.execute(future);
            _ExecutorService.submit(new Runnable() { // from class: com.getjar.sdk.comm.TransactionManager.4
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        TransactionManager.this.runTransactions(commContext, false, false);
                    } catch (Exception e3) {
                        Logger.e(Area.OFFER.value() | Area.TRANSACTION.value(), "TransactionManager: runTransactions() failed", e3);
                    }
                }
            });
            Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: startManagedOfferTransaction() [clientTransactionId: %1$s] [thread: %2$d] finished", clientTransactionId, Long.valueOf(Thread.currentThread().getId())));
            return future;
        }
        Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "TransactionManager startManagedOfferTransaction: Does not have valid claim(s) to purchase managed offer");
        return null;
    }

    public Future<Operation> runEarnTransaction(String clientTransactionId, final CommContext commContext, String itemId, String packageName, HashMap<String, String> itemMetadata, HashMap<String, String> trackingMetadata) throws IOException {
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        }
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        }
        if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("'itemId' can not be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' can not be NULL or empty");
        }
        if (itemMetadata == null || itemMetadata.size() <= 0) {
            throw new IllegalArgumentException("'itemMetadata' can not be NULL or empty");
        }
        Logger.v(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: startEarnTransaction() [clientTransactionId: %1$s] [thread: %2$d]", clientTransactionId, Long.valueOf(Thread.currentThread().getId())));
        RelatedEarnData earn = new RelatedEarnData(itemId, packageName, itemMetadata, trackingMetadata);
        try {
            DBTransactions.getInstance(this._applicationContext).insertEarnTransaction(clientTransactionId, earn);
        } catch (IllegalStateException e) {
        }
        final TransactionBucket transaction = DBTransactions.getInstance(this._applicationContext).loadTransaction(clientTransactionId);
        SetExceptionFutureTask<Operation> future = new SetExceptionFutureTask<>(new Callable<Operation>() { // from class: com.getjar.sdk.comm.TransactionManager.5
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.concurrent.Callable
            /* renamed from: call */
            public Operation mo42call() throws Exception {
                try {
                    CallbackInterface callback = new EarnCallback((EarnBucket) transaction, (RelatedEarnData) transaction.mo46getRelatedObject());
                    return TransactionManager.this.runEarnTransaction((EarnBucket) transaction, commContext, callback, false);
                } catch (Exception e2) {
                    Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "TransactionManager: runEarnTransactions() failed", e2);
                    return null;
                }
            }
        });
        _ExecutorService.execute(future);
        _ExecutorService.submit(new Runnable() { // from class: com.getjar.sdk.comm.TransactionManager.6
            @Override // java.lang.Runnable
            public void run() {
                try {
                    TransactionManager.this.runEarnAndManagedOfferTransactions(commContext);
                } catch (Exception e2) {
                    Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "TransactionManager: runEarnTransactions() failed", e2);
                }
            }
        });
        return future;
    }

    public Future<DBTransactions.ManagedOfferState> runManagedOfferTransaction(final String clientTransactionId, final CommContext commContext) {
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        }
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        }
        Logger.v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: runManagedOfferTransaction() [clientTransactionId: %1$s] [thread: %2$d]", clientTransactionId, Long.valueOf(Thread.currentThread().getId())));
        SetExceptionFutureTask<DBTransactions.ManagedOfferState> future = new SetExceptionFutureTask<>(new Callable<DBTransactions.ManagedOfferState>() { // from class: com.getjar.sdk.comm.TransactionManager.7
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.concurrent.Callable
            /* renamed from: call */
            public DBTransactions.ManagedOfferState mo43call() throws Exception {
                try {
                    TransactionManager.this.runManagedOfferTransaction(clientTransactionId, commContext, false);
                    TransactionBucket transaction = DBTransactions.getInstance(TransactionManager.this._applicationContext).loadTransaction(clientTransactionId);
                    if (transaction == null) {
                        return null;
                    }
                    return ((ManagedOfferBucket) transaction).getState();
                } catch (Exception e) {
                    Logger.e(Area.OFFER.value() | Area.TRANSACTION.value(), "TransactionManager: runManagedOfferTransaction() failed", e);
                    return null;
                }
            }
        });
        _ExecutorService.execute(future);
        return future;
    }

    public void cancelPurchaseTransaction(String clientTransactionId, CommContext commContext) {
        synchronized (_PurchaseTransactionStateLock) {
            Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: cancelPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]", clientTransactionId, Long.valueOf(Thread.currentThread().getId())));
            TransactionBucket transaction = DBTransactions.getInstance(this._applicationContext).loadTransaction(clientTransactionId);
            if (transaction != null && DBTransactions.TransactionType.PURCHASE.equals(transaction.getType())) {
                DBTransactions.PurchaseState state = ((PurchaseUnmanagedBucket) transaction).getState();
                if (DBTransactions.PurchaseState.CREATED.equals(state) || DBTransactions.PurchaseState.RESERVING.equals(state) || DBTransactions.PurchaseState.CANCELING.equals(state)) {
                    Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: Transaction %1$s was found and is in the %2$s state, cancelling...", clientTransactionId, state.name()));
                    if (!_CanceledClientTransactionIDs.contains(clientTransactionId)) {
                        _CanceledClientTransactionIDs.add(clientTransactionId);
                    }
                    DBTransactions.getInstance(this._applicationContext).updatePurchaseTransaction((PurchaseUnmanagedBucket) transaction, DBTransactions.PurchaseState.CANCELING);
                    runTransactions(commContext, false, false);
                }
            }
        }
    }

    public void cancelManagedOfferTransaction(String clientTransactionId, CommContext commContext) {
        synchronized (_ManagedOfferTransactionStateLock) {
            Logger.v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: cancelManagedPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]", clientTransactionId, Long.valueOf(Thread.currentThread().getId())));
            TransactionBucket transaction = DBTransactions.getInstance(this._applicationContext).loadTransaction(clientTransactionId);
            if (transaction != null && DBTransactions.TransactionType.MANAGED_OFFER.equals(transaction.getType())) {
                DBTransactions.ManagedOfferState state = ((ManagedOfferBucket) transaction).getState();
                if (DBTransactions.ManagedOfferState.CREATED.equals(state) || DBTransactions.ManagedOfferState.RESERVING.equals(state) || DBTransactions.ManagedOfferState.RESERVED.equals(state) || DBTransactions.ManagedOfferState.PURCHASING.equals(state)) {
                    Logger.v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: Transaction %1$s was found and is in the %2$s state, cancelling...", clientTransactionId, state.name()));
                    if (!_CanceledClientTransactionIDs.contains(clientTransactionId)) {
                        _CanceledClientTransactionIDs.add(clientTransactionId);
                    }
                    Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: cancelManagedOfferTransaction() CANCELING [clientTransactionId: %1$s] [%2$s]", transaction.getClientTransactionId(), Logger.getShortStack()));
                    DBTransactions.getInstance(this._applicationContext).updateManagedOfferTransaction((ManagedOfferBucket) transaction, DBTransactions.ManagedOfferState.CANCELING);
                    runTransactions(commContext, false, false);
                }
            }
        }
    }

    public synchronized void recoverOrphanedTransactions(CommContext commContext) {
        long transactionAge;
        Logger.v(Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: recoverOrphanedTransactions() [thread: %1$d]", Long.valueOf(Thread.currentThread().getId())));
        try {
            buyCurrencyForGoogleTransactions(commContext);
        } catch (Exception e) {
            Logger.e(Area.TRANSACTION.value(), "TransactionManager: recoverOrphanedTransactions() buyCurrencyForGoogleTransactions() failed", e);
        }
        int orphanedPurchaseCount = 0;
        LicenseCachingManager cachingManager = null;
        List<TransactionBucket> transactions = DBTransactions.getInstance(this._applicationContext).loadAllTransactions();
        int totalTransactionCount = transactions.size();
        Iterator i$ = transactions.iterator();
        while (true) {
            LicenseCachingManager cachingManager2 = cachingManager;
            if (!i$.hasNext()) {
                break;
            }
            TransactionBucket transaction = i$.next();
            try {
                long now = System.currentTimeMillis();
                transactionAge = now - transaction.getTimestampLastUpdated();
                Logger.v(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: recoverOrphanedTransactions() Transaction found in persistence [now:%1$d - lastUpdate:%2$d = age:%3$d]", Long.valueOf(now), Long.valueOf(transaction.getTimestampLastUpdated()), Long.valueOf(transactionAge)));
            } catch (Exception e2) {
                e = e2;
                cachingManager = cachingManager2;
            }
            if (transactionAge > 300000) {
                orphanedPurchaseCount++;
                if (DBTransactions.TransactionType.PURCHASE.equals(transaction.getType())) {
                    if (DBTransactions.PurchaseState.CREATED.equals(((PurchaseUnmanagedBucket) transaction).getState())) {
                        Logger.d(Area.TRANSACTION.value() | Area.STORAGE.value() | Area.PURCHASE.value(), String.format(Locale.US, "TransactionManager: Orphaned purchase found in the CREATED state, deleting [clientTransactionId: %1$s]", transaction.getClientTransactionId()));
                        DBTransactions.getInstance(this._applicationContext).deleteTransaction(transaction.getClientTransactionId());
                        if (PurchaseUnmanagedBucket.class.isAssignableFrom(transaction.getClass())) {
                            PurchaseUnmanagedBucket bucket = (PurchaseUnmanagedBucket) transaction;
                            if (bucket.mo46getRelatedObject() != null && bucket.mo46getRelatedObject().getLicenseScope() != null) {
                                cachingManager = cachingManager2 == null ? new LicenseCachingManager(commContext) : cachingManager2;
                                try {
                                    LicenseInternal license = cachingManager.getCachedLicense(bucket.mo46getRelatedObject().getProductId(), bucket.mo46getRelatedObject().getLicenseScope());
                                    if (license != null && license.getInternalLicenseState().equals(LicenseInternal.InternalLicenseState.UNSYNCED)) {
                                        Logger.v(Area.LICENSING.value() | Area.TRANSACTION.value() | Area.STORAGE.value() | Area.PURCHASE.value(), String.format(Locale.US, "TransactionManager: Deleting UNSYNCED license for expired purchase transaction [clientTransactionId: %1$s]", transaction.getClientTransactionId()));
                                        cachingManager.removeCachedLicense(license);
                                    }
                                } catch (Exception e3) {
                                    e = e3;
                                    if (transaction != null) {
                                        try {
                                            Logger.e(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager persistence cleanup failed for transaction %1$s [created:%2$d updated:%3$d]", transaction.getClientTransactionId(), Long.valueOf(transaction.getTimestampCreated()), Long.valueOf(transaction.getTimestampLastUpdated())), e);
                                        } catch (Exception e4) {
                                        }
                                    } else {
                                        Logger.e(Area.TRANSACTION.value() | Area.STORAGE.value(), "TransactionManager persistence cleanup failed for a transaction", e);
                                    }
                                }
                            }
                        }
                    } else if (DBTransactions.PurchaseState.RESERVING.equals(((PurchaseUnmanagedBucket) transaction).getState())) {
                        Logger.d(Area.LICENSING.value() | Area.TRANSACTION.value() | Area.STORAGE.value() | Area.PURCHASE.value(), String.format(Locale.US, "TransactionManager: Orphaned purchase found in the RESERVING state, updating to CANCELING [clientTransactionId: %1$s]", transaction.getClientTransactionId()));
                        DBTransactions.getInstance(this._applicationContext).updatePurchaseTransaction((PurchaseUnmanagedBucket) transaction, DBTransactions.PurchaseState.CANCELING);
                    }
                }
            }
            cachingManager = cachingManager2;
        }
        Logger.d(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: Found %1$d total transactions and %2$d orphaned purchase transactions", Integer.valueOf(totalTransactionCount), Integer.valueOf(orphanedPurchaseCount)));
        if (orphanedPurchaseCount > 0) {
            runTransactions(commContext, false, true);
        } else if (totalTransactionCount > 0) {
            runTransactions(commContext, true, true);
        }
    }

    public List<TransactionBucket> runEarnAndManagedOfferTransactions(CommContext commContext) {
        Future<List<TransactionBucket>> future = runTransactions(commContext, true, false);
        try {
            return future.get();
        } catch (InterruptedException e) {
            throw new TransactionException(e);
        } catch (ExecutionException e2) {
            throw new TransactionException(e2);
        }
    }

    public static String getTransactionState(Result result, String defaultValue) {
        return getTransactionValue(result, defaultValue, "state");
    }

    public static String getTransactionSubstate(Result result, String defaultValue) {
        return getTransactionValue(result, defaultValue, "substate");
    }

    private static String getTransactionValue(Result result, String defaultValue, String key) {
        if (result == null) {
            return defaultValue;
        }
        try {
            JSONObject responseJson = result.getResponseJson();
            if (responseJson == null || responseJson.length() <= 0) {
                return defaultValue;
            }
            String temp = null;
            if (responseJson.has("return")) {
                JSONObject root = responseJson.getJSONObject("return");
                if (root.has(key)) {
                    temp = root.getString(key);
                } else if (root.has(HitTypes.TRANSACTION)) {
                    JSONObject root2 = root.getJSONObject(HitTypes.TRANSACTION);
                    if (root2.has(key)) {
                        temp = root2.getString(key);
                    }
                }
            }
            if (StringUtility.isNullOrEmpty(temp)) {
                return defaultValue;
            }
            String state = temp;
            return state;
        } catch (JSONException e) {
            Logger.e(Area.COMM.value() | Area.TRANSACTION.value(), "getTransactionState() failed", e);
            return defaultValue;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Future<List<TransactionBucket>> runTransactions(final CommContext commContext, final boolean earnAndManagedPurchaseOnly, final boolean suppressInternalCallbacks) {
        Logger.v(Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: runTransactions() [thread: %1$d]", Long.valueOf(Thread.currentThread().getId())));
        SetExceptionFutureTask<List<TransactionBucket>> future = new SetExceptionFutureTask<>(new Callable<List<TransactionBucket>>() { // from class: com.getjar.sdk.comm.TransactionManager.8
            @Override // java.util.concurrent.Callable
            public List<TransactionBucket> call() throws Exception {
                try {
                    return TransactionManager.this.runTransactionsInternal(commContext, earnAndManagedPurchaseOnly, suppressInternalCallbacks);
                } catch (Exception e) {
                    Logger.e(Area.TRANSACTION.value(), "TransactionManager: Worker Thread failed", e);
                    return null;
                }
            }
        });
        _ExecutorServiceInternal.execute(future);
        return future;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<TransactionBucket> runTransactionsInternal(CommContext commContext, boolean earnAndManagedPurchaseOnly, boolean suppressInternalCallbacks) {
        new ArrayList();
        List<TransactionBucket> returnTransactions = new ArrayList<>();
        synchronized (_TransactionFlowLock) {
            List<TransactionBucket> transactions = DBTransactions.getInstance(this._applicationContext).loadAllTransactions();
            Logger.v(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: runTransactionsInternal() loaded %1$d persisted transactions [thread: %2$d]", Integer.valueOf(transactions.size()), Long.valueOf(Thread.currentThread().getId())));
            Long transactionTTL = null;
            try {
                transactionTTL = Long.valueOf(Utility.convertMillSec(Long.parseLong(GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_TRANSACTION_FAIL_ABANDON_TIME))));
                Logger.v(Area.TRANSACTION.value() | Area.CONFIG.value(), String.format(Locale.US, "TransactionManager: Loaded a transaction TTL of %1$d milliseconds", transactionTTL));
            } catch (Exception e) {
                Logger.e(Area.TRANSACTION.value() | Area.CONFIG.value(), "TransactionManager: Failed to get transaction TTL from config", e);
            }
            for (TransactionBucket transaction : transactions) {
                boolean removeDueToTTLTimeout = false;
                try {
                    long now = System.currentTimeMillis();
                    if (transactionTTL != null && transaction.getTimestampCreated() + transactionTTL.longValue() < now) {
                        Logger.v(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: Transaction %1$s has exceeded the TTL [created:%2$d + ttl:%3$d < now:%4$d]", transaction.getClientTransactionId(), Long.valueOf(transaction.getTimestampCreated()), transactionTTL, Long.valueOf(now)));
                        removeDueToTTLTimeout = true;
                    }
                } catch (Exception e2) {
                    Logger.e(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: A persisted '%1$s' transaction failed [ClientTransactionId: %2$s]", transaction.getType().name(), transaction.getClientTransactionId()), e2);
                }
                if (DBTransactions.TransactionType.PURCHASE.equals(transaction.getType())) {
                    if (earnAndManagedPurchaseOnly) {
                        continue;
                    } else {
                        if (removeDueToTTLTimeout) {
                            Logger.v(Area.TRANSACTION.value() | Area.STORAGE.value() | Area.PURCHASE.value(), String.format(Locale.US, "TransactionManager: Transaction %1$s has exceeded the TTL and timed out, removing it...", transaction.getClientTransactionId()));
                            synchronized (_PurchaseTransactionStateLock) {
                                updatePurchaseTransactionState(commContext, (PurchaseUnmanagedBucket) transaction, DBTransactions.PurchaseState.DONE);
                            }
                        }
                        runPurchaseTransaction((PurchaseUnmanagedBucket) transaction, commContext, suppressInternalCallbacks);
                    }
                } else if (DBTransactions.TransactionType.EARN.equals(transaction.getType())) {
                    if (removeDueToTTLTimeout) {
                        Logger.v(Area.TRANSACTION.value() | Area.STORAGE.value() | Area.EARN.value(), String.format(Locale.US, "TransactionManager: Transaction %1$s has exceeded the TTL and timed out, removing it...", transaction.getClientTransactionId()));
                        updateEarnTransactionState(commContext, (EarnBucket) transaction, DBTransactions.EarnState.DONE);
                    }
                    CallbackInterface callback = new EarnCallback((EarnBucket) transaction, (RelatedEarnData) transaction.mo46getRelatedObject());
                    runEarnTransaction((EarnBucket) transaction, commContext, callback, suppressInternalCallbacks);
                } else if (DBTransactions.TransactionType.MANAGED_OFFER.equals(transaction.getType())) {
                    runManagedOfferTransaction(transaction.getClientTransactionId(), commContext, suppressInternalCallbacks);
                } else {
                    throw new IllegalStateException(String.format(Locale.US, "Unrecognized trnasaction type: %1$s", transaction.getType().name()));
                }
                returnTransactions.add(transaction);
            }
        }
        return returnTransactions;
    }

    private void checkAndCancelManagedOffer(CommContext commContext, ManagedOfferBucket transaction, boolean suppressInternalCallbacks) throws Exception {
        String clientTransactionId = transaction.getClientTransactionId();
        if (DBTransactions.ManagedOfferState.CANCELING.equals(transaction.getState())) {
            boolean shouldTryCanceling = true;
            HashMap<String, String> purchaseMetadata = transaction.mo46getRelatedObject().getPurchaseMetadata();
            if (purchaseMetadata != null && purchaseMetadata.containsKey(Constants.GOOGLE_PLAY_SIGNED_DATA)) {
                shouldTryCanceling = InAppPurchaseManager.getInstance(this._applicationContext).consumeManagedOffer(transaction, true);
            }
            if (shouldTryCanceling) {
                Operation operation = TransactionServiceProxy.getInstance().cancelTransaction(commContext, clientTransactionId, suppressInternalCallbacks);
                Result result = operation.mo38get();
                if (result != null && result.isSuccessfulResponse()) {
                    _CanceledClientTransactionIDs.remove(clientTransactionId);
                    synchronized (_ManagedOfferTransactionStateLock) {
                        updateOfferStateFromResponseState(commContext, result, transaction, DBTransactions.ManagedOfferState.CANCELLED);
                    }
                } else if (result != null && "TRANSACTION_NOT_FOUND".equals(result.getErrorResponseSubcode())) {
                    _CanceledClientTransactionIDs.remove(clientTransactionId);
                    synchronized (_ManagedOfferTransactionStateLock) {
                        updateOfferTransactionState(commContext, transaction, DBTransactions.ManagedOfferState.DONE);
                    }
                }
            }
        }
        if (DBTransactions.ManagedOfferState.CANCELLED.equals(transaction.getState())) {
            synchronized (_ManagedOfferTransactionStateLock) {
                updateOfferTransactionState(commContext, transaction, DBTransactions.ManagedOfferState.DONE);
            }
        }
        if (DBTransactions.ManagedOfferState.DONE.equals(transaction.getState())) {
            if (!DBTransactions.getInstance(this._applicationContext).deleteTransaction(clientTransactionId)) {
                Logger.e(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: checkAndCancelManagedOffer() failed to delete a Managed Offer transaction in the DONE state [clientTransactionId: %1$s]", clientTransactionId));
            } else {
                Logger.v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: checkAndCancelManagedOffer() deleted a Managed Offer transaction in the DONE state [clientTransactionId: %1$s]", clientTransactionId));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Operation runManagedOfferTransaction(String clientTransactionId, CommContext commContext, boolean suppressInternalCallbacks) throws Exception {
        Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: runManagedPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]", clientTransactionId, Long.valueOf(Thread.currentThread().getId())));
        Operation operation = null;
        TransactionBucket baseTransaction = DBTransactions.getInstance(this._applicationContext).loadTransaction(clientTransactionId);
        if (baseTransaction != null) {
            ManagedOfferBucket transaction = (ManagedOfferBucket) baseTransaction;
            checkCancelling(transaction);
            if (DBTransactions.ManagedOfferState.CREATED.equals(transaction.getState()) || DBTransactions.ManagedOfferState.RESERVING.equals(transaction.getState())) {
                if (DBTransactions.ManagedOfferState.CREATED.equals(transaction.getState())) {
                    synchronized (_ManagedOfferTransactionStateLock) {
                        updateOfferTransactionState(commContext, transaction, DBTransactions.ManagedOfferState.RESERVING);
                    }
                }
                Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: RESERVING [clientTransactionId: %1$s] [state: %2$s] [thread: %3$d]", clientTransactionId, transaction.getState().name(), Long.valueOf(Thread.currentThread().getId())));
                if (!checkCancelling(transaction)) {
                    operation = TransactionServiceProxy.getInstance().reserveManagedOffer(commContext, transaction.mo46getRelatedObject().getOfferToken(), clientTransactionId, transaction.mo46getRelatedObject().getPurchaseMetadata(), transaction.mo46getRelatedObject().getTrackingMetadata(), suppressInternalCallbacks);
                    Result result = operation.mo38get();
                    if (result != null && result.isSuccessfulResponse()) {
                        try {
                            synchronized (_ManagedOfferTransactionStateLock) {
                                if (transaction != null && DBTransactions.ManagedOfferState.RESERVING.equals(transaction.getState())) {
                                    updateOfferStateFromResponseState(commContext, result, transaction, DBTransactions.ManagedOfferState.RESERVED);
                                }
                            }
                        } catch (Exception e) {
                            Logger.e(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), "TransactionManager: failure", e);
                            commContext.addException(e);
                        }
                    } else {
                        _CanceledClientTransactionIDs.add(clientTransactionId);
                        synchronized (_ManagedOfferTransactionStateLock) {
                            updateOfferTransactionState(commContext, transaction, DBTransactions.ManagedOfferState.CANCELING);
                        }
                    }
                }
            }
            checkCancelling(transaction);
            if (DBTransactions.ManagedOfferState.PURCHASED.equals(transaction.getState()) || DBTransactions.ManagedOfferState.CONFIRMING.equals(transaction.getState())) {
                Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: CONFIRMING [clientTransactionId: %1$s] [thread: %2$d]", clientTransactionId, Long.valueOf(Thread.currentThread().getId())));
                HashMap<String, String> purchaseMetadata = transaction.mo46getRelatedObject().getPurchaseMetadata();
                Logger.d(Area.OFFER.value() | Area.TRANSACTION.value(), "TransactionManager runManagedPurchaseTransaction starting runManagedPurchaseTransaction()");
                if (!DBTransactions.ManagedOfferState.CONFIRMING.equals(transaction.getState())) {
                    synchronized (_ManagedOfferTransactionStateLock) {
                        updateOfferTransactionState(commContext, transaction, DBTransactions.ManagedOfferState.CONFIRMING);
                    }
                }
                operation = TransactionServiceProxy.getInstance().confirmManagedOffer(commContext, clientTransactionId, purchaseMetadata, suppressInternalCallbacks);
                Result result2 = operation.mo38get();
                String currentClientTransactionId = InAppPurchaseManager.getInstance(this._applicationContext).getCurrentClientTransactionId();
                if (result2 != null && result2.isSuccessfulResponse()) {
                    synchronized (_ManagedOfferTransactionStateLock) {
                        updateOfferStateFromResponseState(commContext, result2, transaction, DBTransactions.ManagedOfferState.CONFIRMED);
                    }
                    Long amount = getEarnOnPurchaseAmount(result2);
                    if (amount != null && amount.longValue() > 0) {
                        NotificationsUtility.showEarnedFromPurchaseNotification(this._applicationContext, null, amount.longValue());
                    }
                    String userDeviceIdFromGooglePlay = null;
                    try {
                        try {
                            String developerPayload = new JSONObject(purchaseMetadata.get(Constants.GOOGLE_PLAY_SIGNED_DATA)).getString("developerPayload");
                            userDeviceIdFromGooglePlay = developerPayload.split(",")[2];
                        } catch (Exception e2) {
                            Logger.e(Area.OFFER.value() | Area.TRANSACTION.value(), "Failed to send redeem reminder notification", e2);
                        }
                    } catch (Exception e3) {
                        Logger.i(Area.OFFER.value() | Area.TRANSACTION.value(), "Failed to get User Device ID from Google Play data", e3);
                    }
                    if (StringUtility.isNullOrEmpty(userDeviceIdFromGooglePlay) || userDeviceIdFromGooglePlay.equalsIgnoreCase(AuthManager.getInstance().getUserDeviceId())) {
                        NotificationsUtility.showRedeemReminderNotification(this._applicationContext);
                    }
                    if (!StringUtility.isNullOrEmpty(currentClientTransactionId) && clientTransactionId.equals(currentClientTransactionId)) {
                        GetJarWebViewSubActivity.updateUIwithOfferResults(this._applicationContext, InAppPurchaseManager.ManagedOfferStatus.SUCCESS, result2.getResponseJson().getJSONObject("return"));
                    }
                } else {
                    if (result2 != null && RequestUtilities.getServicesException(result2) != null && result2.getResponseCode() != 500) {
                        _CanceledClientTransactionIDs.add(clientTransactionId);
                        synchronized (_ManagedOfferTransactionStateLock) {
                            updateOfferTransactionState(commContext, transaction, DBTransactions.ManagedOfferState.CANCELING);
                        }
                        if (!StringUtility.isNullOrEmpty(currentClientTransactionId) && clientTransactionId.equals(currentClientTransactionId)) {
                            GetJarWebViewSubActivity.updateUIwithOfferResults(this._applicationContext, InAppPurchaseManager.ManagedOfferStatus.SERVER_ERROR, new JSONObject());
                        }
                    } else if (!StringUtility.isNullOrEmpty(currentClientTransactionId) && clientTransactionId.equals(currentClientTransactionId)) {
                        GetJarWebViewSubActivity.updateUIwithOfferResults(this._applicationContext, InAppPurchaseManager.ManagedOfferStatus.SERVER_ERROR_RECOVERABLE, new JSONObject());
                    }
                    InAppPurchaseManager.getInstance(this._applicationContext).removeLastClientTransactionId();
                }
            }
            checkCancelling(transaction);
            if (DBTransactions.ManagedOfferState.CONFIRMED.equals(transaction.getState())) {
                updateOfferTransactionState(commContext, transaction, DBTransactions.ManagedOfferState.CONSUMING);
            }
            if (DBTransactions.ManagedOfferState.CONSUMING.equals(transaction.getState())) {
                InAppPurchaseManager.getInstance(this._applicationContext).consumeManagedOffer(transaction, false);
            }
            checkCancelling(transaction);
            checkAndCancelManagedOffer(commContext, transaction, suppressInternalCallbacks);
        }
        return operation;
    }

    private Long getEarnOnPurchaseAmount(Result result) {
        JSONObject root;
        JSONArray lines;
        if (result != null) {
            try {
                if (result.getResponseJson() != null && result.getResponseJson().has("return") && (root = result.getResponseJson().getJSONObject("return")) != null && root.has("lines") && (lines = root.getJSONArray("lines")) != null) {
                    for (int i = 0; i < lines.length(); i++) {
                        JSONObject line = lines.getJSONObject(i);
                        if (line != null && line.has(ServerProtocol.DIALOG_PARAM_TYPE) && line.has("amount")) {
                            String type = line.getString(ServerProtocol.DIALOG_PARAM_TYPE);
                            if ("BUY_CURRENCY".equals(type)) {
                                return Long.valueOf(line.getLong("amount"));
                            }
                        }
                    }
                }
            } catch (Exception e) {
                Logger.e(Area.OFFER.value() | Area.TRANSACTION.value() | Area.PURCHASE.value(), "getEarnOnPurchaseAmount() failed", e);
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Operation runPurchaseTransaction(PurchaseUnmanagedBucket transaction, CommContext commContext, boolean suppressInternalCallbacks) throws Exception {
        Result result;
        Operation operation;
        String clientTransactionId = transaction.getClientTransactionId();
        Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: runPurchaseTransaction() [clientTransactionId: %1$s] [state: %2$s] [thread: %3$d]", clientTransactionId, transaction.getState().name(), Long.valueOf(Thread.currentThread().getId())));
        Operation reserveOperation = null;
        checkCancelling(transaction);
        if (DBTransactions.PurchaseState.CREATED.equals(transaction.getState()) || DBTransactions.PurchaseState.RESERVING.equals(transaction.getState())) {
            if (DBTransactions.PurchaseState.CREATED.equals(transaction.getState())) {
                synchronized (_PurchaseTransactionStateLock) {
                    updatePurchaseTransactionState(commContext, transaction, DBTransactions.PurchaseState.RESERVING);
                }
            }
            if (!checkCancelling(transaction) && (result = (reserveOperation = TransactionServiceProxy.getInstance().reserveUnmanagedPurchase(commContext, transaction.mo46getRelatedObject().getProductId(), transaction.mo46getRelatedObject().getProductName(), transaction.mo46getRelatedObject().getProductDescription(), transaction.mo46getRelatedObject().getAmount(), transaction.mo46getRelatedObject().getDeveloperPayload(), clientTransactionId, transaction.mo46getRelatedObject().getTrackingMetadata(), suppressInternalCallbacks)).mo38get()) != null) {
                if (result.isSuccessfulResponse()) {
                    handleSuccessfulReserveResult(result, commContext, transaction);
                } else {
                    ServiceException servicesException = RequestUtilities.getServicesException(result);
                    if (servicesException != null) {
                        synchronized (_PurchaseTransactionStateLock) {
                            updatePurchaseTransactionState(commContext, transaction, DBTransactions.PurchaseState.DONE);
                        }
                    }
                }
            }
        }
        checkCancelling(transaction);
        if (DBTransactions.PurchaseState.CONFIRMING.equals(transaction.getState())) {
            if (transaction.mo46getRelatedObject().getLicenseScope() == null) {
                Logger.d(Area.PURCHASE.value() | Area.TRANSACTION.value(), "TransactionManager runPurchaseTransaction starting confirmUnmanagedPurchase()");
                operation = TransactionServiceProxy.getInstance().confirmUnmanagedPurchase(commContext, clientTransactionId, suppressInternalCallbacks);
            } else {
                Logger.d(Area.PURCHASE.value() | Area.TRANSACTION.value(), "TransactionManager runPurchaseTransaction starting confirmAndLicense()");
                operation = TransactionServiceProxy.getInstance().confirmAndLicense(commContext, transaction.getClientTransactionId(), transaction.mo46getRelatedObject().getProductId(), transaction.mo46getRelatedObject().getLicenseScope(), suppressInternalCallbacks);
            }
            Result result2 = operation.mo38get();
            if (result2 != null) {
                Logger.d(Area.PURCHASE.value() | Area.TRANSACTION.value(), "TransactionManager runPurchaseTransaction -- Response " + result2.getResponseBody());
                if (result2.isSuccessfulResponse()) {
                    if (transaction.mo46getRelatedObject().getLicenseScope() != null) {
                        new LicenseEngine(commContext).updateLicenseState(transaction.mo46getRelatedObject().getProductId(), transaction.mo46getRelatedObject().getLicenseScope(), LicenseInternal.InternalLicenseState.SYNCED, result2);
                    }
                    synchronized (_PurchaseTransactionStateLock) {
                        updatePurchaseStateFromResponseState(commContext, result2, transaction, DBTransactions.PurchaseState.DONE);
                    }
                } else {
                    ServiceException servicesException2 = RequestUtilities.getServicesException(result2);
                    if (servicesException2 != null) {
                        synchronized (_PurchaseTransactionStateLock) {
                            updatePurchaseTransactionState(commContext, transaction, DBTransactions.PurchaseState.DONE);
                        }
                    }
                }
            }
        }
        if (DBTransactions.PurchaseState.CANCELING.equals(transaction.getState())) {
            Operation operation2 = TransactionServiceProxy.getInstance().cancelTransaction(commContext, clientTransactionId, suppressInternalCallbacks);
            Result result3 = operation2.mo38get();
            if (result3 != null) {
                if (result3.isSuccessfulResponse()) {
                    synchronized (_PurchaseTransactionStateLock) {
                        updatePurchaseStateFromResponseState(commContext, result3, transaction, DBTransactions.PurchaseState.DONE);
                    }
                    _CanceledClientTransactionIDs.remove(transaction.getClass());
                } else {
                    ServiceException servicesException3 = RequestUtilities.getServicesException(result3);
                    if (servicesException3 != null) {
                        synchronized (_PurchaseTransactionStateLock) {
                            updatePurchaseTransactionState(commContext, transaction, DBTransactions.PurchaseState.DONE);
                        }
                        _CanceledClientTransactionIDs.remove(transaction.getClass());
                    }
                }
            }
        }
        if (DBTransactions.PurchaseState.DONE.equals(transaction.getState())) {
            if (!DBTransactions.getInstance(this._applicationContext).deleteTransaction(clientTransactionId)) {
                Logger.e(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: runPurchaseTransaction() failed to delete a Purchase transaction in the DONE state [clientTransactionId: %1$s]", clientTransactionId));
            } else {
                Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: runPurchaseTransaction() deleted a Purchase transaction in the DONE state [clientTransactionId: %1$s]", clientTransactionId));
            }
        }
        return reserveOperation;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Operation runEarnTransaction(EarnBucket transaction, CommContext commContext, CallbackInterface callbacks, boolean suppressInternalCallbacks) throws Exception {
        String clientTransactionId = transaction.getClientTransactionId();
        Logger.v(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: runEarnTransaction() [clientTransactionId: %1$s] [state: %2$s] [callback: %3$s] [thread: %4$d]", clientTransactionId, transaction.getState().name(), callbacks.getClass().getName(), Long.valueOf(Thread.currentThread().getId())));
        Operation operation = null;
        if (DBTransactions.EarnState.CREATED.equals(transaction.getState()) || DBTransactions.EarnState.EARNING.equals(transaction.getState())) {
            if (DBTransactions.EarnState.CREATED.equals(transaction.getState())) {
                updateEarnTransactionState(commContext, transaction, DBTransactions.EarnState.EARNING);
            }
            RelatedEarnData earnData = transaction.mo46getRelatedObject();
            operation = TransactionServiceProxy.getInstance().earn(commContext, earnData.getItemId(), earnData.getPackageName(), clientTransactionId, earnData.getItemMetadata(), earnData.getTrackingMetadata(), suppressInternalCallbacks);
            try {
                operation.mapResultToCallbacks(callbacks);
            } catch (Exception e) {
                Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "TransactionManager: runEarnTransaction() Result to callback mapping failed", e);
            }
            Result earnResult = operation.mo38get();
            if (earnResult != null) {
                Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: runEarnTransaction() Earn received a %1$d result", Integer.valueOf(earnResult.getResponseCode())));
                if (earnResult.isSuccessfulResponse()) {
                    String substate = getTransactionSubstate(earnResult, Constants.RequestInstallSubState.NONE.toString());
                    if (!"INCOMPLETE_RECONCILE_WARNING".equalsIgnoreCase(substate) && !"DEPENDENT_SERVICE_FAILURE".equalsIgnoreCase(substate) && !"UNKNOWN_RETRY_WARNING".equalsIgnoreCase(substate)) {
                        updateEarnTransactionState(commContext, transaction, DBTransactions.EarnState.DONE);
                    }
                } else if (earnResult.getResponseCode() != 202) {
                    ServiceException servicesException = RequestUtilities.getServicesException(earnResult);
                    if (servicesException != null) {
                        updateEarnTransactionState(commContext, transaction, DBTransactions.EarnState.DONE);
                    }
                }
            } else {
                Logger.e(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: runEarnTransaction() Earn operation %1$d failed to get results", Integer.valueOf(operation.getId())));
            }
        }
        if (DBTransactions.EarnState.DONE.equals(transaction.getState())) {
            if (!DBTransactions.getInstance(this._applicationContext).deleteTransaction(clientTransactionId)) {
                Logger.e(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: runEarnTransaction() failed to delete a Earn transaction in the DONE state [clientTransactionId: %1$s]", clientTransactionId));
            } else {
                Logger.v(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: runEarnTransaction() deleted a Earn transaction in the DONE state [clientTransactionId: %1$s]", clientTransactionId));
            }
        }
        return operation;
    }

    private static void updatePurchaseTransactionState(CommContext commContext, PurchaseUnmanagedBucket transaction, DBTransactions.PurchaseState newState) {
        Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: updatePurchaseTransactionState() [clientTransactionId: %1$s] [old: %2$s] [new: %3$s] [thread: %4$d]", transaction.getClientTransactionId(), transaction.getState().name(), newState.name(), Long.valueOf(Thread.currentThread().getId())));
        if (_CanceledClientTransactionIDs.contains(transaction.getClientTransactionId()) && !DBTransactions.PurchaseState.CANCELING.equals(newState)) {
            transaction.setState(DBTransactions.PurchaseState.CANCELING);
        } else {
            DBTransactions.getInstance(commContext.getApplicationContext()).updatePurchaseTransaction(transaction, newState);
        }
    }

    public static void updateOfferTransactionState(CommContext commContext, ManagedOfferBucket transaction, DBTransactions.ManagedOfferState newState) {
        Logger.v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: updateOfferTransactionState() [clientTransactionId: %1$s] [old: %2$s] [new: %3$s] [thread: %4$d]", transaction.getClientTransactionId(), transaction.getState().name(), newState.name(), Long.valueOf(Thread.currentThread().getId())));
        if (_CanceledClientTransactionIDs.contains(transaction.getClientTransactionId()) && !DBTransactions.ManagedOfferState.CANCELING.equals(newState)) {
            Logger.v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: updateOfferTransactionState() [clientTransactionId: %1$s] CANCELING [%2$s]", transaction.getClientTransactionId(), Logger.getShortStack()));
            transaction.setState(DBTransactions.ManagedOfferState.CANCELING);
            return;
        }
        Logger.v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: updateOfferTransactionState() [clientTransactionId: %1$s] [new: %2$s]", transaction.getClientTransactionId(), newState.name()));
        DBTransactions.getInstance(commContext.getApplicationContext()).updateManagedOfferTransaction(transaction, newState);
    }

    private static void updateEarnTransactionState(CommContext commContext, EarnBucket transaction, DBTransactions.EarnState newState) {
        Logger.v(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: updateEarnTransactionState() [clientTransactionId: %1$s] [old: %2$s] [new: %3$s] [thread: %4$d]", transaction.getClientTransactionId(), transaction.getState().name(), newState.name(), Long.valueOf(Thread.currentThread().getId())));
        DBTransactions.getInstance(commContext.getApplicationContext()).updateEarnTransaction(transaction, newState);
        transaction.setState(newState);
    }

    private boolean checkCancelling(PurchaseUnmanagedBucket transaction) {
        if (_CanceledClientTransactionIDs.contains(transaction.getClientTransactionId())) {
            transaction.setState(DBTransactions.PurchaseState.CANCELING);
            Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: checkCancelling() returning TRUE [clientTransactionId: %1$s] [thread: %2$d]", transaction.getClientTransactionId(), Long.valueOf(Thread.currentThread().getId())));
            return true;
        }
        Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: checkCancelling() returning FALSE [clientTransactionId: %1$s] [thread: %2$d]", transaction.getClientTransactionId(), Long.valueOf(Thread.currentThread().getId())));
        return false;
    }

    private boolean checkCancelling(ManagedOfferBucket transaction) {
        if (_CanceledClientTransactionIDs.contains(transaction.getClientTransactionId())) {
            Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: checkCancelling() CANCELING [clientTransactionId: %1$s] [%2$s]", transaction.getClientTransactionId(), Logger.getShortStack()));
            transaction.setState(DBTransactions.ManagedOfferState.CANCELING);
            Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: checkCancelling() returning TRUE [clientTransactionId: %1$s] [thread: %2$d]", transaction.getClientTransactionId(), Long.valueOf(Thread.currentThread().getId())));
            return true;
        }
        Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: checkCancelling() returning FALSE [clientTransactionId: %1$s] [thread: %2$d]", transaction.getClientTransactionId(), Long.valueOf(Thread.currentThread().getId())));
        return false;
    }

    private DBTransactions.PurchaseState updatePurchaseStateFromResponseState(CommContext commContext, Result result, PurchaseUnmanagedBucket purchaseBucket, DBTransactions.PurchaseState failureDefault) {
        DBTransactions.PurchaseState newState = failureDefault;
        try {
            String state = getTransactionState(result, "");
            if ("SUCCESS".equalsIgnoreCase(state)) {
                newState = DBTransactions.PurchaseState.DONE;
            } else if ("FAIL".equalsIgnoreCase(state)) {
                newState = DBTransactions.PurchaseState.DONE;
            } else if ("CANCELED".equalsIgnoreCase(state)) {
                newState = DBTransactions.PurchaseState.DONE;
            } else if ("CREATED".equalsIgnoreCase(state)) {
                newState = DBTransactions.PurchaseState.RESERVING;
            } else if ("RESERVED".equalsIgnoreCase(state)) {
                newState = DBTransactions.PurchaseState.CONFIRMING;
            } else if ("CONFIRMED".equalsIgnoreCase(state)) {
                newState = DBTransactions.PurchaseState.CONFIRMING;
            }
        } catch (Exception e) {
            Logger.e(Area.PURCHASE.value() | Area.STORAGE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "updatePurchaseStateFromResponseState() failed, setting state to: %1$s", newState.name()), e);
        }
        updatePurchaseTransactionState(commContext, purchaseBucket, newState);
        return newState;
    }

    private DBTransactions.ManagedOfferState updateOfferStateFromResponseState(CommContext commContext, Result result, ManagedOfferBucket purchaseBucket, DBTransactions.ManagedOfferState failureDefault) {
        DBTransactions.ManagedOfferState newState = failureDefault;
        try {
            String state = getTransactionState(result, "");
            if ("SUCCESS".equalsIgnoreCase(state)) {
                newState = DBTransactions.ManagedOfferState.DONE;
            } else if ("FAIL".equalsIgnoreCase(state)) {
                newState = DBTransactions.ManagedOfferState.DONE;
            } else if ("CANCELED".equalsIgnoreCase(state)) {
                newState = DBTransactions.ManagedOfferState.DONE;
            } else if ("CREATED".equalsIgnoreCase(state)) {
                newState = DBTransactions.ManagedOfferState.RESERVING;
            } else if ("RESERVED".equalsIgnoreCase(state)) {
                newState = DBTransactions.ManagedOfferState.RESERVED;
            } else if ("CONFIRMED".equalsIgnoreCase(state)) {
                newState = DBTransactions.ManagedOfferState.CONSUMING;
            }
        } catch (Exception e) {
            Logger.e(Area.OFFER.value() | Area.STORAGE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "updateOfferStateFromResponseState() failed, setting state to: %1$s", newState.name()), e);
        }
        updateOfferTransactionState(commContext, purchaseBucket, newState);
        return newState;
    }

    private void handleSuccessfulReserveResult(Result result, CommContext commContext, PurchaseUnmanagedBucket transactionBucket) {
        boolean wasReserving = false;
        try {
            try {
                synchronized (_PurchaseTransactionStateLock) {
                    TransactionBucket transaction = DBTransactions.getInstance(this._applicationContext).loadTransaction(transactionBucket.getClientTransactionId());
                    if (transaction != null && DBTransactions.PurchaseState.RESERVING.equals(((PurchaseUnmanagedBucket) transaction).getState())) {
                        wasReserving = true;
                        updatePurchaseStateFromResponseState(commContext, result, transactionBucket, DBTransactions.PurchaseState.CONFIRMING);
                        if (transactionBucket.mo46getRelatedObject().getLicenseScope() != null) {
                            new LicenseEngine(commContext).updateLicenseState(transactionBucket.mo46getRelatedObject().getProductId(), transactionBucket.mo46getRelatedObject().getLicenseScope(), LicenseInternal.InternalLicenseState.UNSYNCED, result);
                        }
                    }
                }
            } catch (Exception e) {
                Logger.e(Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), "TransactionManager: failure", e);
                commContext.addException(e);
            }
            if (wasReserving) {
                String successSubState = getTransactionSubstate(result, Constants.RequestInstallSubState.NONE.name());
                if (!successSubState.equals(Constants.RequestInstallSubState.FUNDS_INSUFFICIENT_FAILURE.name())) {
                    try {
                        commContext.postResponse(new PurchaseSucceededResponse(transactionBucket.mo46getRelatedObject().getProductId(), transactionBucket.mo46getRelatedObject().getAmount().intValue(), transactionBucket.mo46getRelatedObject().getProductName(), transactionBucket.getClientTransactionId(), result.getSignedPayload(), result.getSignature()));
                    } catch (Exception e2) {
                        Logger.e(Area.PURCHASE.value() | Area.TRANSACTION.value(), "TransactionManager: failure", e2);
                        commContext.addException(e2);
                    }
                }
            }
        } catch (Exception e3) {
            Logger.e(Area.PURCHASE.value() | Area.TRANSACTION.value(), "TransactionManager: failure", e3);
            commContext.addException(e3);
        }
    }

    public void buyCurrencyForGoogleTransactions(final CommContext commContext) {
        if (commContext == null) {
            throw new IllegalArgumentException("commContext cannot be null");
        }
        new Thread(new Runnable() { // from class: com.getjar.sdk.comm.TransactionManager.9
            @Override // java.lang.Runnable
            public void run() {
                synchronized (TransactionManager._UploadBuyGoldLock) {
                    try {
                        ArrayList<GooglePurchaseResponse> responseItems = (ArrayList) InAppPurchaseManager.getInstance(commContext.getApplicationContext()).getAllPurchaseResponses();
                        Iterator i$ = responseItems.iterator();
                        while (i$.hasNext()) {
                            GooglePurchaseResponse purchaseResponse = i$.next();
                            HashMap<String, String> purchaseDetailsMap = (HashMap) purchaseResponse.getResponseAsMap(TransactionManager.this._applicationContext);
                            String productId = purchaseResponse.getProductId();
                            String developerPayload = purchaseResponse.getDeveloperPayload();
                            Logger.d(Area.TRANSACTION.value(), "TransactionManager buyGold dev payload: " + developerPayload + " " + productId);
                            if (StringUtility.isNullOrEmpty(developerPayload)) {
                                if (productId.startsWith("android.test")) {
                                    Logger.d(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() putting in demo clientTransactionId");
                                    developerPayload = Constants.BUYING_GOLD_PAYLOAD_PREFIX + UUID.randomUUID().toString();
                                } else {
                                    Logger.e(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() buying gold failed [null payload]");
                                    InAppPurchaseManager.getInstance(commContext.getApplicationContext()).removePurchaseResponse(purchaseResponse.getOrderId());
                                }
                            }
                            if (!developerPayload.startsWith(Constants.BUYING_GOLD_PAYLOAD_PREFIX) || (!productId.startsWith(GetJarManager.GetjarIntentKey) && !productId.startsWith("android.test"))) {
                                Logger.e(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() buying gold failed [not getjar]");
                                InAppPurchaseManager.getInstance(commContext.getApplicationContext()).removePurchaseResponse(purchaseResponse.getOrderId());
                            } else {
                                Operation operation = TransactionServiceProxy.getInstance().buyCurrency(commContext, developerPayload.substring(Constants.BUYING_GOLD_PAYLOAD_PREFIX.length()), productId, purchaseDetailsMap, new HashMap<>(), true);
                                try {
                                    Result result = operation.mo38get();
                                    if (result == null) {
                                        InAppPurchaseManager.getInstance(commContext.getApplicationContext()).handleFailure(productId, InAppPurchaseManager.InAppBillingFailure.NETWORK_ERROR, TransactionManager.this._applicationContext);
                                    } else if (result.checkForCallerUnauthorized()) {
                                        InAppPurchaseManager.getInstance(commContext.getApplicationContext()).handleFailure(productId, InAppPurchaseManager.InAppBillingFailure.UNAUTHORIZED, TransactionManager.this._applicationContext);
                                        InAppPurchaseManager.getInstance(commContext.getApplicationContext()).removePurchaseResponse(purchaseResponse.getOrderId());
                                    } else if (!result.isSuccessfulResponse()) {
                                        InAppPurchaseManager.getInstance(commContext.getApplicationContext()).handleFailure(productId, InAppPurchaseManager.InAppBillingFailure.GETJAR_SERVICE_FAILURE, TransactionManager.this._applicationContext);
                                    } else {
                                        Logger.i(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() -- Successfully bought currency!");
                                        InAppPurchaseManager.getInstance(commContext.getApplicationContext()).removePurchaseResponse(purchaseResponse.getOrderId());
                                        NotificationsUtility.pushSuccessNotification(commContext, String.format(Locale.US, Constants.NOTIFICATION_BILLING_SUCCESS, purchaseDetailsMap.get(Constants.BUY_CURRENCY_GOLD_VALUE)));
                                        Intent intent = new Intent(Constants.ACTION_NOTIFY_BUY_GOLD);
                                        intent.putExtra("ITEM_ID", productId);
                                        intent.putExtra(Constants.BUY_CURRENCY_GOLD_VALUE, purchaseDetailsMap.get(Constants.BUY_CURRENCY_GOLD_VALUE));
                                        TransactionManager.this._applicationContext.sendBroadcast(intent);
                                    }
                                } catch (InterruptedException e) {
                                    InAppPurchaseManager.getInstance(commContext.getApplicationContext()).handleFailure(productId, InAppPurchaseManager.InAppBillingFailure.GETJAR_SERVICE_FAILURE, TransactionManager.this._applicationContext);
                                    Logger.e(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() failed", e);
                                } catch (ExecutionException e2) {
                                    InAppPurchaseManager.getInstance(commContext.getApplicationContext()).handleFailure(productId, InAppPurchaseManager.InAppBillingFailure.GETJAR_SERVICE_FAILURE, TransactionManager.this._applicationContext);
                                    Logger.e(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() failed", e2);
                                }
                            }
                        }
                    } catch (Exception e3) {
                        Logger.e(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() failed", e3);
                    }
                }
            }
        }).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class EarnCallback implements CallbackInterface {
        private EarnBucket _earnBucket;
        private RelatedEarnData _earnData;

        public EarnCallback(EarnBucket earnBucket, RelatedEarnData earn) {
            this._earnData = null;
            this._earnBucket = null;
            if (earn == null) {
                throw new IllegalArgumentException("'earn' can not be NULL");
            }
            if (earnBucket == null) {
                throw new IllegalArgumentException("'earnBucket' can not be NULL");
            }
            if (StringUtility.isNullOrEmpty(earnBucket.getClientTransactionId())) {
                throw new IllegalArgumentException("'earnBucket.getClientTransactionId()' can not be NULL or empty");
            }
            this._earnData = earn;
            this._earnBucket = earnBucket;
        }

        @Override // com.getjar.sdk.comm.CallbackInterface
        public void serviceRequestSucceeded(Result result, String requestId, CommContext commContext) {
            String textMsg;
            Logger.d(Area.TRANSACTION.value() | Area.EARN.value(), String.format(Locale.US, "TransactionManager: EarnCallback: request succeeded [clientTransactionId: %1$s]", this._earnBucket.getClientTransactionId()));
            String state = TransactionManager.getTransactionState(result, "");
            String substate = TransactionManager.getTransactionSubstate(result, Constants.RequestInstallSubState.NONE.toString());
            long amount = Utility.getResponseAmount(result, -1L);
            String appNameForNotifications = this._earnData.getPackageName();
            try {
                PackageManager packageManager = commContext.getApplicationContext().getPackageManager();
                PackageInfo packageInfo = packageManager.getPackageInfo(this._earnData.getPackageName(), 128);
                appNameForNotifications = (String) packageInfo.applicationInfo.loadLabel(packageManager);
            } catch (Exception e) {
            }
            Logger.d(Area.TRANSACTION.value() | Area.EARN.value(), String.format(Locale.US, "TransactionManager: Pushing Earn notification [amount: %1$d] [state: %2$s] [substate: %3$s]", Long.valueOf(amount), state, substate));
            if (Constants.CAP_REACHED_FAILURE.equalsIgnoreCase(substate) && !this._earnData.getPackageName().equals(Constants.GREENJAR_PACKAGE)) {
                if (!DBTransactions.NotificationState.SUCCEEDED.equals(this._earnBucket.getNotificationState()) && !DBTransactions.NotificationState.FAILED.equals(this._earnBucket.getNotificationState())) {
                    NotificationsUtility.pushFailNotification(commContext, String.format(Locale.US, Constants.NOTIFICATION_FAIL_CAP_REACHED, appNameForNotifications));
                    DBTransactions.getInstance(commContext.getApplicationContext()).updateEarnTransactionNotificationState(this._earnBucket, DBTransactions.NotificationState.FAILED);
                }
                updateEarnStateInAppStatePersistence(commContext, this._earnData.getPackageName(), result, EarnStateDatabase.EarnState.FAIL);
            } else if ((Constants.ALREADY_REDEEMED_FAILURE.equalsIgnoreCase(substate) || Constants.ALREADY_USED_FAILURE.equalsIgnoreCase(substate)) && !this._earnData.getPackageName().equals(Constants.GREENJAR_PACKAGE)) {
                if (!DBTransactions.NotificationState.SUCCEEDED.equals(this._earnBucket.getNotificationState()) && !DBTransactions.NotificationState.FAILED.equals(this._earnBucket.getNotificationState())) {
                    NotificationsUtility.pushFailNotification(commContext, String.format(Locale.US, Constants.NOTIFICATION_FAIL_REDEEMED, appNameForNotifications));
                    DBTransactions.getInstance(commContext.getApplicationContext()).updateEarnTransactionNotificationState(this._earnBucket, DBTransactions.NotificationState.FAILED);
                }
                updateEarnStateInAppStatePersistence(commContext, this._earnData.getPackageName(), result, EarnStateDatabase.EarnState.FAIL);
            } else if (amount > 0) {
                String hostApplicationName = null;
                PackageInfo packageInfo2 = null;
                try {
                    PackageManager packageManager2 = commContext.getApplicationContext().getPackageManager();
                    packageInfo2 = packageManager2.getPackageInfo(commContext.getApplicationContext().getPackageName(), 128);
                    hostApplicationName = (String) packageInfo2.applicationInfo.loadLabel(packageManager2);
                } catch (Exception e2) {
                    Logger.e(Area.TRANSACTION.value() | Area.EARN.value(), "TransactionManager: EarnCallback: Failed to get the name of the Hosting Application", e2);
                }
                if (StringUtility.isNullOrEmpty(hostApplicationName)) {
                    textMsg = String.format(Locale.US, Constants.NOTIFICATION_PASS, Long.valueOf(amount));
                } else {
                    textMsg = String.format(Locale.US, Constants.NOTIFICATION_PASS_WITH_APP_NAME, Long.valueOf(amount), hostApplicationName);
                }
                if (!this._earnBucket.getIsNewTransaction()) {
                    textMsg = String.format(Locale.US, "%1$s %2$s", textMsg, Constants.NOTIFICATION_PASS_POST_RETRY_ADDENDUM);
                }
                if (!DBTransactions.NotificationState.SUCCEEDED.equals(this._earnBucket.getNotificationState()) && !DBTransactions.NotificationState.FAILED.equals(this._earnBucket.getNotificationState())) {
                    NotificationsUtility.pushSuccessNotification(commContext, textMsg);
                    DBTransactions.getInstance(commContext.getApplicationContext()).updateEarnTransactionNotificationState(this._earnBucket, DBTransactions.NotificationState.SUCCEEDED);
                    GetJarWebViewSubActivity.updateUIWithEarnResults(state, substate, appNameForNotifications, amount, packageInfo2.packageName, null);
                }
                updateEarnStateInAppStatePersistence(commContext, this._earnData.getPackageName(), result, EarnStateDatabase.EarnState.SUCCESS);
                EarnStateDatabase.getInstance(commContext.getApplicationContext()).updateEarnAmount(this._earnData.getPackageName(), amount);
            }
        }

        @Override // com.getjar.sdk.comm.CallbackInterface
        public void serviceRequestFailed(Result result, Exception cause, String requestId, CommContext commContext) {
            Logger.d(Area.TRANSACTION.value() | Area.EARN.value(), String.format(Locale.US, "TransactionManager: EarnCallback: request failed [clientTransactionId: %1$s]", this._earnBucket.getClientTransactionId()));
            PackageManager packageManager = commContext.getApplicationContext().getPackageManager();
            String hostApplicationName = this._earnData.getPackageName();
            try {
                PackageInfo packageInfo = packageManager.getPackageInfo(this._earnData.getPackageName(), 128);
                hostApplicationName = (String) packageInfo.applicationInfo.loadLabel(packageManager);
            } catch (PackageManager.NameNotFoundException e) {
                Logger.e(Area.TRANSACTION.value() | Area.EARN.value(), "Package info not found", e);
            }
            if (DBTransactions.NotificationState.NONE.equals(this._earnBucket.getNotificationState()) && !this._earnData.getPackageName().equals(Constants.GREENJAR_PACKAGE)) {
                NotificationsUtility.pushFailNotification(commContext, String.format(Locale.US, Constants.NOTIFICATION_FAIL_SUBMISSION, hostApplicationName));
                DBTransactions.getInstance(commContext.getApplicationContext()).updateEarnTransactionNotificationState(this._earnBucket, DBTransactions.NotificationState.NO_GOLD);
            }
            if (cause != null && ServiceException.class.isAssignableFrom(cause.getClass())) {
                updateEarnStateInAppStatePersistence(commContext, this._earnData.getPackageName(), ((ServiceException) cause).getRequestResult(), EarnStateDatabase.EarnState.FAIL);
            }
        }

        @Override // com.getjar.sdk.comm.CallbackInterface
        public void serviceRequestRetry(Exception cause, String requestId, CommContext commContext, int retryCount) {
            Logger.d(Area.TRANSACTION.value() | Area.EARN.value(), String.format(Locale.US, "TransactionManager: EarnCallback: retrying request [clientTransactionId: %1$s]", this._earnBucket.getClientTransactionId()));
        }

        private void updateEarnStateInAppStatePersistence(CommContext commContext, String packageName, Result result, EarnStateDatabase.EarnState state) {
            if (result != null) {
                String substate = TransactionManager.getTransactionSubstate(result, "NONE");
                EarnStateDatabase.getInstance(commContext.getApplicationContext()).updateEarnState(packageName, state, substate);
            }
        }
    }
}
