package com.getjar.sdk.comm;

import android.content.Context;
import android.content.Intent;
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
import com.getjar.sdk.exceptions.TransactionException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.response.PurchaseSucceededResponse;
import com.getjar.sdk.rewards.InAppPurchaseManager;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.NotificationsUtility;
import com.getjar.sdk.utilities.SetExceptionFutureTask;
import com.getjar.sdk.utilities.StringUtility;
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

public final class TransactionManager {
    private static ConcurrentLinkedQueue<String> _CanceledClientTransactionIDs = new ConcurrentLinkedQueue<>();
    private static final ExecutorService _ExecutorService = Executors.newSingleThreadExecutor();
    private static final ExecutorService _ExecutorServiceInternal = Executors.newCachedThreadPool();
    private static final Object _ManagedOfferTransactionStateLock = new Object();
    private static final Object _PurchaseTransactionStateLock = new Object();
    private static final Object _TransactionFlowLock = new Object();
    /* access modifiers changed from: private */
    public static final Object _UploadBuyGoldLock = new Object();
    /* access modifiers changed from: private */
    public Context _applicationContext;

    public TransactionManager(Context applicationContext) {
        if (applicationContext == null) {
            throw new IllegalArgumentException("'applicationContext' can not be NULL");
        }
        this._applicationContext = applicationContext.getApplicationContext();
    }

    public Future<Operation> startPurchaseTransaction(String clientTransactionId, final CommContext commContext, String productId, String productName, String productDescription, Integer amount, String developerPayload, License.LicenseScope licenseScope, HashMap<String, String> trackingMetadata) throws IOException {
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        } else if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        } else if (StringUtility.isNullOrEmpty(productId)) {
            throw new IllegalArgumentException("'productId' can not be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(productName)) {
            throw new IllegalArgumentException("'productName' can not be NULL or empty");
        } else if (amount == null || amount.intValue() < 0) {
            throw new IllegalArgumentException("'amount' can not be NULL or less than 0");
        } else {
            Logger.m646v(Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: startPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]", new Object[]{clientTransactionId, Long.valueOf(Thread.currentThread().getId())}));
            try {
                DBTransactions.getInstance(this._applicationContext).insertPurchaseTransaction(clientTransactionId, new RelatedPurchaseData(productId, productName, productDescription, amount.intValue(), developerPayload, licenseScope, trackingMetadata));
            } catch (IllegalStateException e) {
            }
            final TransactionBucket transaction = DBTransactions.getInstance(this._applicationContext).loadTransaction(clientTransactionId);
            SetExceptionFutureTask<Operation> future = new SetExceptionFutureTask<>(new Callable<Operation>() {
                public Operation call() throws Exception {
                    try {
                        return TransactionManager.this.runPurchaseTransaction((PurchaseUnmanagedBucket) transaction, commContext, false);
                    } catch (Exception e) {
                        Logger.m643e(Area.PURCHASE.value() | Area.TRANSACTION.value(), "TransactionManager: runPurchaseTransaction() failed", e);
                        return null;
                    }
                }
            });
            _ExecutorService.execute(future);
            _ExecutorService.submit(new Runnable() {
                public void run() {
                    try {
                        Future unused = TransactionManager.this.runTransactions(commContext, false, false);
                    } catch (Exception e) {
                        Logger.m643e(Area.PURCHASE.value() | Area.TRANSACTION.value(), "TransactionManager: runTransactions() failed", e);
                    }
                }
            });
            Logger.m646v(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: startPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d] finished", new Object[]{clientTransactionId, Long.valueOf(Thread.currentThread().getId())}));
            return future;
        }
    }

    public Future<Operation> startManagedOfferTransaction(final CommContext commContext, String clientTransactionId, String offerId, HashMap<String, String> purchaseMetadata, HashMap<String, String> trackingMetadata) {
        AuthManager.initialize(commContext.getApplicationContext());
        if (AuthManager.getInstance().getClaimsManager(commContext.getApplicationContext()).canPurchaseManagedProducts()) {
            try {
                DBTransactions.getInstance(commContext.getApplicationContext()).insertManagedOfferTransaction(clientTransactionId, new RelatedManagedOfferData(offerId, purchaseMetadata, trackingMetadata), DBTransactions.ManagedOfferState.CREATED);
            } catch (IllegalStateException e) {
            } catch (IOException e2) {
                Logger.m643e(Area.OFFER.value() | Area.TRANSACTION.value(), "Error occured while creating transaction", e2);
                return null;
            }
            final String str = clientTransactionId;
            SetExceptionFutureTask<Operation> future = new SetExceptionFutureTask<>(new Callable<Operation>() {
                public Operation call() throws Exception {
                    try {
                        return TransactionManager.this.runManagedOfferTransaction(str, commContext, false);
                    } catch (Exception e) {
                        Logger.m643e(Area.OFFER.value() | Area.TRANSACTION.value(), "TransactionManager: startManagedOfferTransaction() failed", e);
                        return null;
                    }
                }
            });
            _ExecutorService.execute(future);
            _ExecutorService.submit(new Runnable() {
                public void run() {
                    try {
                        Future unused = TransactionManager.this.runTransactions(commContext, false, false);
                    } catch (Exception e) {
                        Logger.m643e(Area.OFFER.value() | Area.TRANSACTION.value(), "TransactionManager: runTransactions() failed", e);
                    }
                }
            });
            Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: startManagedOfferTransaction() [clientTransactionId: %1$s] [thread: %2$d] finished", new Object[]{clientTransactionId, Long.valueOf(Thread.currentThread().getId())}));
            return future;
        }
        Logger.m648w(Area.OFFER.value() | Area.TRANSACTION.value(), "TransactionManager startManagedOfferTransaction: Does not have valid claim(s) to purchase managed offer");
        return null;
    }

    public Future<Operation> runEarnTransaction(String clientTransactionId, CommContext commContext, String itemId, String packageName, HashMap<String, String> itemMetadata, HashMap<String, String> trackingMetadata) throws IOException {
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        } else if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        } else if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("'itemId' can not be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' can not be NULL or empty");
        } else if (itemMetadata == null || itemMetadata.size() <= 0) {
            throw new IllegalArgumentException("'itemMetadata' can not be NULL or empty");
        } else {
            Logger.m646v(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: startEarnTransaction() [clientTransactionId: %1$s] [thread: %2$d]", new Object[]{clientTransactionId, Long.valueOf(Thread.currentThread().getId())}));
            try {
                DBTransactions.getInstance(this._applicationContext).insertEarnTransaction(clientTransactionId, new RelatedEarnData(itemId, packageName, itemMetadata, trackingMetadata));
            } catch (IllegalStateException e) {
            }
            final TransactionBucket transaction = DBTransactions.getInstance(this._applicationContext).loadTransaction(clientTransactionId);
            final CommContext commContext2 = commContext;
            SetExceptionFutureTask<Operation> future = new SetExceptionFutureTask<>(new Callable<Operation>() {
                public Operation call() throws Exception {
                    try {
                        return TransactionManager.this.runEarnTransaction((EarnBucket) transaction, commContext2, new EarnCallback((EarnBucket) transaction, (RelatedEarnData) transaction.getRelatedObject()), false);
                    } catch (Exception e) {
                        Logger.m643e(Area.EARN.value() | Area.TRANSACTION.value(), "TransactionManager: runEarnTransactions() failed", e);
                        return null;
                    }
                }
            });
            _ExecutorService.execute(future);
            final CommContext commContext3 = commContext;
            _ExecutorService.submit(new Runnable() {
                public void run() {
                    try {
                        TransactionManager.this.runEarnAndManagedOfferTransactions(commContext3);
                    } catch (Exception e) {
                        Logger.m643e(Area.EARN.value() | Area.TRANSACTION.value(), "TransactionManager: runEarnTransactions() failed", e);
                    }
                }
            });
            return future;
        }
    }

    public Future<DBTransactions.ManagedOfferState> runManagedOfferTransaction(final String clientTransactionId, final CommContext commContext) {
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        } else if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        } else {
            Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: runManagedOfferTransaction() [clientTransactionId: %1$s] [thread: %2$d]", new Object[]{clientTransactionId, Long.valueOf(Thread.currentThread().getId())}));
            SetExceptionFutureTask<DBTransactions.ManagedOfferState> future = new SetExceptionFutureTask<>(new Callable<DBTransactions.ManagedOfferState>() {
                public DBTransactions.ManagedOfferState call() throws Exception {
                    try {
                        Operation unused = TransactionManager.this.runManagedOfferTransaction(clientTransactionId, commContext, false);
                        TransactionBucket transaction = DBTransactions.getInstance(TransactionManager.this._applicationContext).loadTransaction(clientTransactionId);
                        if (transaction != null) {
                            return ((ManagedOfferBucket) transaction).getState();
                        }
                        return null;
                    } catch (Exception e) {
                        Logger.m643e(Area.OFFER.value() | Area.TRANSACTION.value(), "TransactionManager: runManagedOfferTransaction() failed", e);
                        return null;
                    }
                }
            });
            _ExecutorService.execute(future);
            return future;
        }
    }

    public void cancelPurchaseTransaction(String clientTransactionId, CommContext commContext) {
        synchronized (_PurchaseTransactionStateLock) {
            Logger.m646v(Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: cancelPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]", new Object[]{clientTransactionId, Long.valueOf(Thread.currentThread().getId())}));
            TransactionBucket transaction = DBTransactions.getInstance(this._applicationContext).loadTransaction(clientTransactionId);
            if (transaction != null && DBTransactions.TransactionType.PURCHASE.equals(transaction.getType())) {
                DBTransactions.PurchaseState state = ((PurchaseUnmanagedBucket) transaction).getState();
                if (DBTransactions.PurchaseState.CREATED.equals(state) || DBTransactions.PurchaseState.RESERVING.equals(state) || DBTransactions.PurchaseState.CANCELING.equals(state)) {
                    Logger.m646v(Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: Transaction %1$s was found and is in the %2$s state, cancelling...", new Object[]{clientTransactionId, state.name()}));
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
            Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: cancelManagedPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]", new Object[]{clientTransactionId, Long.valueOf(Thread.currentThread().getId())}));
            TransactionBucket transaction = DBTransactions.getInstance(this._applicationContext).loadTransaction(clientTransactionId);
            if (transaction != null && DBTransactions.TransactionType.MANAGED_OFFER.equals(transaction.getType())) {
                DBTransactions.ManagedOfferState state = ((ManagedOfferBucket) transaction).getState();
                if (DBTransactions.ManagedOfferState.CREATED.equals(state) || DBTransactions.ManagedOfferState.RESERVING.equals(state) || DBTransactions.ManagedOfferState.RESERVED.equals(state) || DBTransactions.ManagedOfferState.PURCHASING.equals(state)) {
                    Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: Transaction %1$s was found and is in the %2$s state, cancelling...", new Object[]{clientTransactionId, state.name()}));
                    if (!_CanceledClientTransactionIDs.contains(clientTransactionId)) {
                        _CanceledClientTransactionIDs.add(clientTransactionId);
                    }
                    Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: cancelManagedOfferTransaction() CANCELING [clientTransactionId: %1$s] [%2$s]", new Object[]{transaction.getClientTransactionId(), Logger.getShortStack()}));
                    DBTransactions.getInstance(this._applicationContext).updateManagedOfferTransaction((ManagedOfferBucket) transaction, DBTransactions.ManagedOfferState.CANCELING);
                    runTransactions(commContext, false, false);
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:52:0x027c, code lost:
        com.getjar.sdk.logging.Logger.m640d(com.getjar.sdk.logging.Area.TRANSACTION.value() | com.getjar.sdk.logging.Area.STORAGE.value(), java.lang.String.format(java.util.Locale.US, "TransactionManager: Found %1$d total transactions and %2$d orphaned purchase transactions", new java.lang.Object[]{java.lang.Integer.valueOf(r13), java.lang.Integer.valueOf(r12)}));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x02ad, code lost:
        if (r12 <= 0) goto L_0x02c0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x02af, code lost:
        runTransactions(r27, false, true);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x02c0, code lost:
        if (r13 <= 0) goto L_0x02be;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:?, code lost:
        runTransactions(r27, true, true);
     */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x0219 A[SYNTHETIC, Splitter:B:47:0x0219] */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x0263 A[SYNTHETIC, Splitter:B:50:0x0263] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void recoverOrphanedTransactions(com.getjar.sdk.comm.CommContext r27) {
        /*
            r26 = this;
            monitor-enter(r26)
            com.getjar.sdk.logging.Area r18 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x01a7 }
            long r18 = r18.value()     // Catch:{ all -> 0x01a7 }
            java.util.Locale r20 = java.util.Locale.US     // Catch:{ all -> 0x01a7 }
            java.lang.String r21 = "TransactionManager: recoverOrphanedTransactions() [thread: %1$d]"
            r22 = 1
            r0 = r22
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x01a7 }
            r22 = r0
            r23 = 0
            java.lang.Thread r24 = java.lang.Thread.currentThread()     // Catch:{ all -> 0x01a7 }
            long r24 = r24.getId()     // Catch:{ all -> 0x01a7 }
            java.lang.Long r24 = java.lang.Long.valueOf(r24)     // Catch:{ all -> 0x01a7 }
            r22[r23] = r24     // Catch:{ all -> 0x01a7 }
            java.lang.String r20 = java.lang.String.format(r20, r21, r22)     // Catch:{ all -> 0x01a7 }
            com.getjar.sdk.logging.Logger.m646v(r18, r20)     // Catch:{ all -> 0x01a7 }
            r26.buyCurrencyForGoogleTransactions(r27)     // Catch:{ Exception -> 0x0195 }
        L_0x002d:
            r12 = 0
            r17 = 0
            r5 = 0
            r0 = r26
            android.content.Context r0 = r0._applicationContext     // Catch:{ all -> 0x01a7 }
            r18 = r0
            com.getjar.sdk.comm.persistence.DBTransactions r18 = com.getjar.sdk.comm.persistence.DBTransactions.getInstance(r18)     // Catch:{ all -> 0x01a7 }
            java.util.List r17 = r18.loadAllTransactions()     // Catch:{ all -> 0x01a7 }
            int r13 = r17.size()     // Catch:{ all -> 0x01a7 }
            java.util.Iterator r8 = r17.iterator()     // Catch:{ all -> 0x01a7 }
            r6 = r5
        L_0x0048:
            boolean r18 = r8.hasNext()     // Catch:{ all -> 0x01a7 }
            if (r18 == 0) goto L_0x027c
            java.lang.Object r14 = r8.next()     // Catch:{ all -> 0x01a7 }
            com.getjar.sdk.comm.persistence.TransactionBucket r14 = (com.getjar.sdk.comm.persistence.TransactionBucket) r14     // Catch:{ all -> 0x01a7 }
            long r10 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x0215 }
            long r18 = r14.getTimestampLastUpdated()     // Catch:{ Exception -> 0x0215 }
            long r15 = r10 - r18
            com.getjar.sdk.logging.Area r18 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0215 }
            long r18 = r18.value()     // Catch:{ Exception -> 0x0215 }
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ Exception -> 0x0215 }
            long r20 = r20.value()     // Catch:{ Exception -> 0x0215 }
            long r18 = r18 | r20
            java.util.Locale r20 = java.util.Locale.US     // Catch:{ Exception -> 0x0215 }
            java.lang.String r21 = "TransactionManager: recoverOrphanedTransactions() Transaction found in persistence [now:%1$d - lastUpdate:%2$d = age:%3$d]"
            r22 = 3
            r0 = r22
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0215 }
            r22 = r0
            r23 = 0
            java.lang.Long r24 = java.lang.Long.valueOf(r10)     // Catch:{ Exception -> 0x0215 }
            r22[r23] = r24     // Catch:{ Exception -> 0x0215 }
            r23 = 1
            long r24 = r14.getTimestampLastUpdated()     // Catch:{ Exception -> 0x0215 }
            java.lang.Long r24 = java.lang.Long.valueOf(r24)     // Catch:{ Exception -> 0x0215 }
            r22[r23] = r24     // Catch:{ Exception -> 0x0215 }
            r23 = 2
            java.lang.Long r24 = java.lang.Long.valueOf(r15)     // Catch:{ Exception -> 0x0215 }
            r22[r23] = r24     // Catch:{ Exception -> 0x0215 }
            java.lang.String r20 = java.lang.String.format(r20, r21, r22)     // Catch:{ Exception -> 0x0215 }
            com.getjar.sdk.logging.Logger.m646v(r18, r20)     // Catch:{ Exception -> 0x0215 }
            r18 = 300000(0x493e0, double:1.482197E-318)
            int r18 = (r15 > r18 ? 1 : (r15 == r18 ? 0 : -1))
            if (r18 <= 0) goto L_0x0212
            int r12 = r12 + 1
            com.getjar.sdk.comm.persistence.DBTransactions$TransactionType r18 = com.getjar.sdk.comm.persistence.DBTransactions.TransactionType.PURCHASE     // Catch:{ Exception -> 0x0215 }
            com.getjar.sdk.comm.persistence.DBTransactions$TransactionType r19 = r14.getType()     // Catch:{ Exception -> 0x0215 }
            boolean r18 = r18.equals(r19)     // Catch:{ Exception -> 0x0215 }
            if (r18 == 0) goto L_0x0212
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r19 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.CREATED     // Catch:{ Exception -> 0x0215 }
            r0 = r14
            com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket r0 = (com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket) r0     // Catch:{ Exception -> 0x0215 }
            r18 = r0
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r18 = r18.getState()     // Catch:{ Exception -> 0x0215 }
            r0 = r19
            r1 = r18
            boolean r18 = r0.equals(r1)     // Catch:{ Exception -> 0x0215 }
            if (r18 == 0) goto L_0x01aa
            com.getjar.sdk.logging.Area r18 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0215 }
            long r18 = r18.value()     // Catch:{ Exception -> 0x0215 }
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ Exception -> 0x0215 }
            long r20 = r20.value()     // Catch:{ Exception -> 0x0215 }
            long r18 = r18 | r20
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.PURCHASE     // Catch:{ Exception -> 0x0215 }
            long r20 = r20.value()     // Catch:{ Exception -> 0x0215 }
            long r18 = r18 | r20
            java.util.Locale r20 = java.util.Locale.US     // Catch:{ Exception -> 0x0215 }
            java.lang.String r21 = "TransactionManager: Orphaned purchase found in the CREATED state, deleting [clientTransactionId: %1$s]"
            r22 = 1
            r0 = r22
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0215 }
            r22 = r0
            r23 = 0
            java.lang.String r24 = r14.getClientTransactionId()     // Catch:{ Exception -> 0x0215 }
            r22[r23] = r24     // Catch:{ Exception -> 0x0215 }
            java.lang.String r20 = java.lang.String.format(r20, r21, r22)     // Catch:{ Exception -> 0x0215 }
            com.getjar.sdk.logging.Logger.m640d(r18, r20)     // Catch:{ Exception -> 0x0215 }
            r0 = r26
            android.content.Context r0 = r0._applicationContext     // Catch:{ Exception -> 0x0215 }
            r18 = r0
            com.getjar.sdk.comm.persistence.DBTransactions r18 = com.getjar.sdk.comm.persistence.DBTransactions.getInstance(r18)     // Catch:{ Exception -> 0x0215 }
            java.lang.String r19 = r14.getClientTransactionId()     // Catch:{ Exception -> 0x0215 }
            r18.deleteTransaction(r19)     // Catch:{ Exception -> 0x0215 }
            java.lang.Class<com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket> r18 = com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket.class
            java.lang.Class r19 = r14.getClass()     // Catch:{ Exception -> 0x0215 }
            boolean r18 = r18.isAssignableFrom(r19)     // Catch:{ Exception -> 0x0215 }
            if (r18 == 0) goto L_0x0212
            r0 = r14
            com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket r0 = (com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket) r0     // Catch:{ Exception -> 0x0215 }
            r4 = r0
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r18 = r4.getRelatedObject()     // Catch:{ Exception -> 0x0215 }
            if (r18 == 0) goto L_0x0212
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r18 = r4.getRelatedObject()     // Catch:{ Exception -> 0x0215 }
            com.getjar.sdk.License$LicenseScope r18 = r18.getLicenseScope()     // Catch:{ Exception -> 0x0215 }
            if (r18 == 0) goto L_0x0212
            if (r6 != 0) goto L_0x02d5
            com.getjar.sdk.comm.LicenseCachingManager r5 = new com.getjar.sdk.comm.LicenseCachingManager     // Catch:{ Exception -> 0x0215 }
            r0 = r27
            r5.<init>(r0)     // Catch:{ Exception -> 0x0215 }
        L_0x0130:
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r18 = r4.getRelatedObject()     // Catch:{ Exception -> 0x02d2 }
            java.lang.String r18 = r18.getProductId()     // Catch:{ Exception -> 0x02d2 }
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r19 = r4.getRelatedObject()     // Catch:{ Exception -> 0x02d2 }
            com.getjar.sdk.License$LicenseScope r19 = r19.getLicenseScope()     // Catch:{ Exception -> 0x02d2 }
            r0 = r18
            r1 = r19
            com.getjar.sdk.data.LicenseInternal r9 = r5.getCachedLicense(r0, r1)     // Catch:{ Exception -> 0x02d2 }
            if (r9 == 0) goto L_0x0192
            com.getjar.sdk.data.LicenseInternal$InternalLicenseState r18 = r9.getInternalLicenseState()     // Catch:{ Exception -> 0x02d2 }
            com.getjar.sdk.data.LicenseInternal$InternalLicenseState r19 = com.getjar.sdk.data.LicenseInternal.InternalLicenseState.UNSYNCED     // Catch:{ Exception -> 0x02d2 }
            boolean r18 = r18.equals(r19)     // Catch:{ Exception -> 0x02d2 }
            if (r18 == 0) goto L_0x0192
            com.getjar.sdk.logging.Area r18 = com.getjar.sdk.logging.Area.LICENSING     // Catch:{ Exception -> 0x02d2 }
            long r18 = r18.value()     // Catch:{ Exception -> 0x02d2 }
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x02d2 }
            long r20 = r20.value()     // Catch:{ Exception -> 0x02d2 }
            long r18 = r18 | r20
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ Exception -> 0x02d2 }
            long r20 = r20.value()     // Catch:{ Exception -> 0x02d2 }
            long r18 = r18 | r20
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.PURCHASE     // Catch:{ Exception -> 0x02d2 }
            long r20 = r20.value()     // Catch:{ Exception -> 0x02d2 }
            long r18 = r18 | r20
            java.util.Locale r20 = java.util.Locale.US     // Catch:{ Exception -> 0x02d2 }
            java.lang.String r21 = "TransactionManager: Deleting UNSYNCED license for expired purchase transaction [clientTransactionId: %1$s]"
            r22 = 1
            r0 = r22
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x02d2 }
            r22 = r0
            r23 = 0
            java.lang.String r24 = r14.getClientTransactionId()     // Catch:{ Exception -> 0x02d2 }
            r22[r23] = r24     // Catch:{ Exception -> 0x02d2 }
            java.lang.String r20 = java.lang.String.format(r20, r21, r22)     // Catch:{ Exception -> 0x02d2 }
            com.getjar.sdk.logging.Logger.m646v(r18, r20)     // Catch:{ Exception -> 0x02d2 }
            r5.removeCachedLicense(r9)     // Catch:{ Exception -> 0x02d2 }
        L_0x0192:
            r6 = r5
            goto L_0x0048
        L_0x0195:
            r7 = move-exception
            com.getjar.sdk.logging.Area r18 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x01a7 }
            long r18 = r18.value()     // Catch:{ all -> 0x01a7 }
            java.lang.String r20 = "TransactionManager: recoverOrphanedTransactions() buyCurrencyForGoogleTransactions() failed"
            r0 = r18
            r2 = r20
            com.getjar.sdk.logging.Logger.m643e(r0, r2, r7)     // Catch:{ all -> 0x01a7 }
            goto L_0x002d
        L_0x01a7:
            r18 = move-exception
            monitor-exit(r26)
            throw r18
        L_0x01aa:
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r19 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.RESERVING     // Catch:{ Exception -> 0x0215 }
            r0 = r14
            com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket r0 = (com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket) r0     // Catch:{ Exception -> 0x0215 }
            r18 = r0
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r18 = r18.getState()     // Catch:{ Exception -> 0x0215 }
            r0 = r19
            r1 = r18
            boolean r18 = r0.equals(r1)     // Catch:{ Exception -> 0x0215 }
            if (r18 == 0) goto L_0x0212
            com.getjar.sdk.logging.Area r18 = com.getjar.sdk.logging.Area.LICENSING     // Catch:{ Exception -> 0x0215 }
            long r18 = r18.value()     // Catch:{ Exception -> 0x0215 }
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0215 }
            long r20 = r20.value()     // Catch:{ Exception -> 0x0215 }
            long r18 = r18 | r20
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ Exception -> 0x0215 }
            long r20 = r20.value()     // Catch:{ Exception -> 0x0215 }
            long r18 = r18 | r20
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.PURCHASE     // Catch:{ Exception -> 0x0215 }
            long r20 = r20.value()     // Catch:{ Exception -> 0x0215 }
            long r18 = r18 | r20
            java.util.Locale r20 = java.util.Locale.US     // Catch:{ Exception -> 0x0215 }
            java.lang.String r21 = "TransactionManager: Orphaned purchase found in the RESERVING state, updating to CANCELING [clientTransactionId: %1$s]"
            r22 = 1
            r0 = r22
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0215 }
            r22 = r0
            r23 = 0
            java.lang.String r24 = r14.getClientTransactionId()     // Catch:{ Exception -> 0x0215 }
            r22[r23] = r24     // Catch:{ Exception -> 0x0215 }
            java.lang.String r20 = java.lang.String.format(r20, r21, r22)     // Catch:{ Exception -> 0x0215 }
            com.getjar.sdk.logging.Logger.m640d(r18, r20)     // Catch:{ Exception -> 0x0215 }
            r0 = r26
            android.content.Context r0 = r0._applicationContext     // Catch:{ Exception -> 0x0215 }
            r18 = r0
            com.getjar.sdk.comm.persistence.DBTransactions r19 = com.getjar.sdk.comm.persistence.DBTransactions.getInstance(r18)     // Catch:{ Exception -> 0x0215 }
            r0 = r14
            com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket r0 = (com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket) r0     // Catch:{ Exception -> 0x0215 }
            r18 = r0
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r20 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.CANCELING     // Catch:{ Exception -> 0x0215 }
            r0 = r19
            r1 = r18
            r2 = r20
            r0.updatePurchaseTransaction(r1, r2)     // Catch:{ Exception -> 0x0215 }
        L_0x0212:
            r5 = r6
            goto L_0x0192
        L_0x0215:
            r7 = move-exception
            r5 = r6
        L_0x0217:
            if (r14 == 0) goto L_0x0263
            com.getjar.sdk.logging.Area r18 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0260 }
            long r18 = r18.value()     // Catch:{ Exception -> 0x0260 }
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ Exception -> 0x0260 }
            long r20 = r20.value()     // Catch:{ Exception -> 0x0260 }
            long r18 = r18 | r20
            java.util.Locale r20 = java.util.Locale.US     // Catch:{ Exception -> 0x0260 }
            java.lang.String r21 = "TransactionManager persistence cleanup failed for transaction %1$s [created:%2$d updated:%3$d]"
            r22 = 3
            r0 = r22
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0260 }
            r22 = r0
            r23 = 0
            java.lang.String r24 = r14.getClientTransactionId()     // Catch:{ Exception -> 0x0260 }
            r22[r23] = r24     // Catch:{ Exception -> 0x0260 }
            r23 = 1
            long r24 = r14.getTimestampCreated()     // Catch:{ Exception -> 0x0260 }
            java.lang.Long r24 = java.lang.Long.valueOf(r24)     // Catch:{ Exception -> 0x0260 }
            r22[r23] = r24     // Catch:{ Exception -> 0x0260 }
            r23 = 2
            long r24 = r14.getTimestampLastUpdated()     // Catch:{ Exception -> 0x0260 }
            java.lang.Long r24 = java.lang.Long.valueOf(r24)     // Catch:{ Exception -> 0x0260 }
            r22[r23] = r24     // Catch:{ Exception -> 0x0260 }
            java.lang.String r20 = java.lang.String.format(r20, r21, r22)     // Catch:{ Exception -> 0x0260 }
            r0 = r18
            r2 = r20
            com.getjar.sdk.logging.Logger.m643e(r0, r2, r7)     // Catch:{ Exception -> 0x0260 }
            goto L_0x0192
        L_0x0260:
            r18 = move-exception
            goto L_0x0192
        L_0x0263:
            com.getjar.sdk.logging.Area r18 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x01a7 }
            long r18 = r18.value()     // Catch:{ all -> 0x01a7 }
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x01a7 }
            long r20 = r20.value()     // Catch:{ all -> 0x01a7 }
            long r18 = r18 | r20
            java.lang.String r20 = "TransactionManager persistence cleanup failed for a transaction"
            r0 = r18
            r2 = r20
            com.getjar.sdk.logging.Logger.m643e(r0, r2, r7)     // Catch:{ all -> 0x01a7 }
            goto L_0x0192
        L_0x027c:
            com.getjar.sdk.logging.Area r18 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x01a7 }
            long r18 = r18.value()     // Catch:{ all -> 0x01a7 }
            com.getjar.sdk.logging.Area r20 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x01a7 }
            long r20 = r20.value()     // Catch:{ all -> 0x01a7 }
            long r18 = r18 | r20
            java.util.Locale r20 = java.util.Locale.US     // Catch:{ all -> 0x01a7 }
            java.lang.String r21 = "TransactionManager: Found %1$d total transactions and %2$d orphaned purchase transactions"
            r22 = 2
            r0 = r22
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x01a7 }
            r22 = r0
            r23 = 0
            java.lang.Integer r24 = java.lang.Integer.valueOf(r13)     // Catch:{ all -> 0x01a7 }
            r22[r23] = r24     // Catch:{ all -> 0x01a7 }
            r23 = 1
            java.lang.Integer r24 = java.lang.Integer.valueOf(r12)     // Catch:{ all -> 0x01a7 }
            r22[r23] = r24     // Catch:{ all -> 0x01a7 }
            java.lang.String r20 = java.lang.String.format(r20, r21, r22)     // Catch:{ all -> 0x01a7 }
            com.getjar.sdk.logging.Logger.m640d(r18, r20)     // Catch:{ all -> 0x01a7 }
            if (r12 <= 0) goto L_0x02c0
            r18 = 0
            r19 = 1
            r0 = r26
            r1 = r27
            r2 = r18
            r3 = r19
            r0.runTransactions(r1, r2, r3)     // Catch:{ all -> 0x01a7 }
        L_0x02be:
            monitor-exit(r26)
            return
        L_0x02c0:
            if (r13 <= 0) goto L_0x02be
            r18 = 1
            r19 = 1
            r0 = r26
            r1 = r27
            r2 = r18
            r3 = r19
            r0.runTransactions(r1, r2, r3)     // Catch:{ all -> 0x01a7 }
            goto L_0x02be
        L_0x02d2:
            r7 = move-exception
            goto L_0x0217
        L_0x02d5:
            r5 = r6
            goto L_0x0130
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.TransactionManager.recoverOrphanedTransactions(com.getjar.sdk.comm.CommContext):void");
    }

    public List<TransactionBucket> runEarnAndManagedOfferTransactions(CommContext commContext) {
        try {
            return runTransactions(commContext, true, false).get();
        } catch (InterruptedException e) {
            throw new TransactionException((Throwable) e);
        } catch (ExecutionException e2) {
            throw new TransactionException((Throwable) e2);
        }
    }

    public static String getTransactionState(Result result, String defaultValue) {
        return getTransactionValue(result, defaultValue, "state");
    }

    public static String getTransactionSubstate(Result result, String defaultValue) {
        return getTransactionValue(result, defaultValue, "substate");
    }

    private static String getTransactionValue(Result result, String defaultValue, String key) {
        String state = defaultValue;
        if (result == null) {
            return state;
        }
        try {
            JSONObject responseJson = result.getResponseJson();
            if (responseJson == null || responseJson.length() <= 0) {
                return state;
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
            if (!StringUtility.isNullOrEmpty(temp)) {
                return temp;
            }
            return state;
        } catch (JSONException e) {
            Logger.m643e(Area.COMM.value() | Area.TRANSACTION.value(), "getTransactionState() failed", e);
            return state;
        }
    }

    /* access modifiers changed from: private */
    public Future<List<TransactionBucket>> runTransactions(final CommContext commContext, final boolean earnAndManagedPurchaseOnly, final boolean suppressInternalCallbacks) {
        Logger.m646v(Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: runTransactions() [thread: %1$d]", new Object[]{Long.valueOf(Thread.currentThread().getId())}));
        SetExceptionFutureTask<List<TransactionBucket>> future = new SetExceptionFutureTask<>(new Callable<List<TransactionBucket>>() {
            public List<TransactionBucket> call() throws Exception {
                try {
                    return TransactionManager.this.runTransactionsInternal(commContext, earnAndManagedPurchaseOnly, suppressInternalCallbacks);
                } catch (Exception e) {
                    Logger.m643e(Area.TRANSACTION.value(), "TransactionManager: Worker Thread failed", e);
                    return null;
                }
            }
        });
        _ExecutorServiceInternal.execute(future);
        return future;
    }

    /* access modifiers changed from: private */
    /*  JADX ERROR: IndexOutOfBoundsException in pass: RegionMakerVisitor
        java.lang.IndexOutOfBoundsException: Index 0 out of bounds for length 0
        	at java.base/jdk.internal.util.Preconditions.outOfBounds(Preconditions.java:64)
        	at java.base/jdk.internal.util.Preconditions.outOfBoundsCheckIndex(Preconditions.java:70)
        	at java.base/jdk.internal.util.Preconditions.checkIndex(Preconditions.java:248)
        	at java.base/java.util.Objects.checkIndex(Objects.java:372)
        	at java.base/java.util.ArrayList.get(ArrayList.java:458)
        	at jadx.core.dex.nodes.InsnNode.getArg(InsnNode.java:101)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:611)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.processMonitorEnter(RegionMaker.java:561)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:133)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processIf(RegionMaker.java:693)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:123)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processIf(RegionMaker.java:698)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:123)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processIf(RegionMaker.java:693)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:123)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processLoop(RegionMaker.java:225)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processMonitorEnter(RegionMaker.java:598)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:133)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:49)
        */
    public java.util.List<com.getjar.sdk.comm.persistence.TransactionBucket> runTransactionsInternal(com.getjar.sdk.comm.CommContext r23, boolean r24, boolean r25) {
        /*
            r22 = this;
            java.util.ArrayList r12 = new java.util.ArrayList
            r12.<init>()
            java.util.ArrayList r9 = new java.util.ArrayList
            r9.<init>()
            java.lang.Object r15 = _TransactionFlowLock
            monitor-enter(r15)
            r0 = r22
            android.content.Context r13 = r0._applicationContext     // Catch:{ all -> 0x01a2 }
            com.getjar.sdk.comm.persistence.DBTransactions r13 = com.getjar.sdk.comm.persistence.DBTransactions.getInstance(r13)     // Catch:{ all -> 0x01a2 }
            java.util.List r12 = r13.loadAllTransactions()     // Catch:{ all -> 0x01a2 }
            com.getjar.sdk.logging.Area r13 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x01a2 }
            long r13 = r13.value()     // Catch:{ all -> 0x01a2 }
            com.getjar.sdk.logging.Area r16 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x01a2 }
            long r16 = r16.value()     // Catch:{ all -> 0x01a2 }
            long r13 = r13 | r16
            java.util.Locale r16 = java.util.Locale.US     // Catch:{ all -> 0x01a2 }
            java.lang.String r17 = "TransactionManager: runTransactionsInternal() loaded %1$d persisted transactions [thread: %2$d]"
            r18 = 2
            r0 = r18
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x01a2 }
            r18 = r0
            r19 = 0
            int r20 = r12.size()     // Catch:{ all -> 0x01a2 }
            java.lang.Integer r20 = java.lang.Integer.valueOf(r20)     // Catch:{ all -> 0x01a2 }
            r18[r19] = r20     // Catch:{ all -> 0x01a2 }
            r19 = 1
            java.lang.Thread r20 = java.lang.Thread.currentThread()     // Catch:{ all -> 0x01a2 }
            long r20 = r20.getId()     // Catch:{ all -> 0x01a2 }
            java.lang.Long r20 = java.lang.Long.valueOf(r20)     // Catch:{ all -> 0x01a2 }
            r18[r19] = r20     // Catch:{ all -> 0x01a2 }
            java.lang.String r16 = java.lang.String.format(r16, r17, r18)     // Catch:{ all -> 0x01a2 }
            r0 = r16
            com.getjar.sdk.logging.Logger.m646v(r13, r0)     // Catch:{ all -> 0x01a2 }
            r11 = 0
            r13 = 1
            r0 = r23
            com.getjar.sdk.comm.GetJarConfig r13 = com.getjar.sdk.comm.GetJarConfig.getInstance(r0, r13)     // Catch:{ Exception -> 0x01a5 }
            java.lang.String r14 = "transaction.fail.abandon.time"
            java.lang.String r13 = r13.getDirectiveValue(r14)     // Catch:{ Exception -> 0x01a5 }
            long r13 = java.lang.Long.parseLong(r13)     // Catch:{ Exception -> 0x01a5 }
            long r13 = com.getjar.sdk.utilities.Utility.convertMillSec(r13)     // Catch:{ Exception -> 0x01a5 }
            java.lang.Long r11 = java.lang.Long.valueOf(r13)     // Catch:{ Exception -> 0x01a5 }
            com.getjar.sdk.logging.Area r13 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x01a5 }
            long r13 = r13.value()     // Catch:{ Exception -> 0x01a5 }
            com.getjar.sdk.logging.Area r16 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ Exception -> 0x01a5 }
            long r16 = r16.value()     // Catch:{ Exception -> 0x01a5 }
            long r13 = r13 | r16
            java.util.Locale r16 = java.util.Locale.US     // Catch:{ Exception -> 0x01a5 }
            java.lang.String r17 = "TransactionManager: Loaded a transaction TTL of %1$d milliseconds"
            r18 = 1
            r0 = r18
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x01a5 }
            r18 = r0
            r19 = 0
            r18[r19] = r11     // Catch:{ Exception -> 0x01a5 }
            java.lang.String r16 = java.lang.String.format(r16, r17, r18)     // Catch:{ Exception -> 0x01a5 }
            r0 = r16
            com.getjar.sdk.logging.Logger.m646v(r13, r0)     // Catch:{ Exception -> 0x01a5 }
        L_0x0099:
            java.util.Iterator r5 = r12.iterator()     // Catch:{ all -> 0x01a2 }
        L_0x009d:
            boolean r13 = r5.hasNext()     // Catch:{ all -> 0x01a2 }
            if (r13 == 0) goto L_0x026d
            java.lang.Object r10 = r5.next()     // Catch:{ all -> 0x01a2 }
            com.getjar.sdk.comm.persistence.TransactionBucket r10 = (com.getjar.sdk.comm.persistence.TransactionBucket) r10     // Catch:{ all -> 0x01a2 }
            r8 = 0
            long r6 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x0168 }
            if (r11 == 0) goto L_0x0102
            long r13 = r10.getTimestampCreated()     // Catch:{ Exception -> 0x0168 }
            long r16 = r11.longValue()     // Catch:{ Exception -> 0x0168 }
            long r13 = r13 + r16
            int r13 = (r13 > r6 ? 1 : (r13 == r6 ? 0 : -1))
            if (r13 >= 0) goto L_0x0102
            com.getjar.sdk.logging.Area r13 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0168 }
            long r13 = r13.value()     // Catch:{ Exception -> 0x0168 }
            com.getjar.sdk.logging.Area r16 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ Exception -> 0x0168 }
            long r16 = r16.value()     // Catch:{ Exception -> 0x0168 }
            long r13 = r13 | r16
            java.util.Locale r16 = java.util.Locale.US     // Catch:{ Exception -> 0x0168 }
            java.lang.String r17 = "TransactionManager: Transaction %1$s has exceeded the TTL [created:%2$d + ttl:%3$d < now:%4$d]"
            r18 = 4
            r0 = r18
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0168 }
            r18 = r0
            r19 = 0
            java.lang.String r20 = r10.getClientTransactionId()     // Catch:{ Exception -> 0x0168 }
            r18[r19] = r20     // Catch:{ Exception -> 0x0168 }
            r19 = 1
            long r20 = r10.getTimestampCreated()     // Catch:{ Exception -> 0x0168 }
            java.lang.Long r20 = java.lang.Long.valueOf(r20)     // Catch:{ Exception -> 0x0168 }
            r18[r19] = r20     // Catch:{ Exception -> 0x0168 }
            r19 = 2
            r18[r19] = r11     // Catch:{ Exception -> 0x0168 }
            r19 = 3
            java.lang.Long r20 = java.lang.Long.valueOf(r6)     // Catch:{ Exception -> 0x0168 }
            r18[r19] = r20     // Catch:{ Exception -> 0x0168 }
            java.lang.String r16 = java.lang.String.format(r16, r17, r18)     // Catch:{ Exception -> 0x0168 }
            r0 = r16
            com.getjar.sdk.logging.Logger.m646v(r13, r0)     // Catch:{ Exception -> 0x0168 }
            r8 = 1
        L_0x0102:
            com.getjar.sdk.comm.persistence.DBTransactions$TransactionType r13 = com.getjar.sdk.comm.persistence.DBTransactions.TransactionType.PURCHASE     // Catch:{ Exception -> 0x0168 }
            com.getjar.sdk.comm.persistence.DBTransactions$TransactionType r14 = r10.getType()     // Catch:{ Exception -> 0x0168 }
            boolean r13 = r13.equals(r14)     // Catch:{ Exception -> 0x0168 }
            if (r13 == 0) goto L_0x01c0
            if (r24 != 0) goto L_0x009d
            if (r8 == 0) goto L_0x0156
            com.getjar.sdk.logging.Area r13 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0168 }
            long r13 = r13.value()     // Catch:{ Exception -> 0x0168 }
            com.getjar.sdk.logging.Area r16 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ Exception -> 0x0168 }
            long r16 = r16.value()     // Catch:{ Exception -> 0x0168 }
            long r13 = r13 | r16
            com.getjar.sdk.logging.Area r16 = com.getjar.sdk.logging.Area.PURCHASE     // Catch:{ Exception -> 0x0168 }
            long r16 = r16.value()     // Catch:{ Exception -> 0x0168 }
            long r13 = r13 | r16
            java.util.Locale r16 = java.util.Locale.US     // Catch:{ Exception -> 0x0168 }
            java.lang.String r17 = "TransactionManager: Transaction %1$s has exceeded the TTL and timed out, removing it..."
            r18 = 1
            r0 = r18
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0168 }
            r18 = r0
            r19 = 0
            java.lang.String r20 = r10.getClientTransactionId()     // Catch:{ Exception -> 0x0168 }
            r18[r19] = r20     // Catch:{ Exception -> 0x0168 }
            java.lang.String r16 = java.lang.String.format(r16, r17, r18)     // Catch:{ Exception -> 0x0168 }
            r0 = r16
            com.getjar.sdk.logging.Logger.m646v(r13, r0)     // Catch:{ Exception -> 0x0168 }
            java.lang.Object r14 = _PurchaseTransactionStateLock     // Catch:{ Exception -> 0x0168 }
            monitor-enter(r14)     // Catch:{ Exception -> 0x0168 }
            r0 = r10
            com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket r0 = (com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket) r0     // Catch:{ all -> 0x01bd }
            r13 = r0
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r16 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.DONE     // Catch:{ all -> 0x01bd }
            r0 = r23
            r1 = r16
            updatePurchaseTransactionState(r0, r13, r1)     // Catch:{ all -> 0x01bd }
            monitor-exit(r14)     // Catch:{ all -> 0x01bd }
        L_0x0156:
            r0 = r10
            com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket r0 = (com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket) r0     // Catch:{ Exception -> 0x0168 }
            r13 = r0
            r0 = r22
            r1 = r23
            r2 = r25
            r0.runPurchaseTransaction(r13, r1, r2)     // Catch:{ Exception -> 0x0168 }
        L_0x0163:
            r9.add(r10)     // Catch:{ Exception -> 0x0168 }
            goto L_0x009d
        L_0x0168:
            r4 = move-exception
            com.getjar.sdk.logging.Area r13 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x01a2 }
            long r13 = r13.value()     // Catch:{ all -> 0x01a2 }
            com.getjar.sdk.logging.Area r16 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x01a2 }
            long r16 = r16.value()     // Catch:{ all -> 0x01a2 }
            long r13 = r13 | r16
            java.util.Locale r16 = java.util.Locale.US     // Catch:{ all -> 0x01a2 }
            java.lang.String r17 = "TransactionManager: A persisted '%1$s' transaction failed [ClientTransactionId: %2$s]"
            r18 = 2
            r0 = r18
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x01a2 }
            r18 = r0
            r19 = 0
            com.getjar.sdk.comm.persistence.DBTransactions$TransactionType r20 = r10.getType()     // Catch:{ all -> 0x01a2 }
            java.lang.String r20 = r20.name()     // Catch:{ all -> 0x01a2 }
            r18[r19] = r20     // Catch:{ all -> 0x01a2 }
            r19 = 1
            java.lang.String r20 = r10.getClientTransactionId()     // Catch:{ all -> 0x01a2 }
            r18[r19] = r20     // Catch:{ all -> 0x01a2 }
            java.lang.String r16 = java.lang.String.format(r16, r17, r18)     // Catch:{ all -> 0x01a2 }
            r0 = r16
            com.getjar.sdk.logging.Logger.m643e(r13, r0, r4)     // Catch:{ all -> 0x01a2 }
            goto L_0x009d
        L_0x01a2:
            r13 = move-exception
            monitor-exit(r15)     // Catch:{ all -> 0x01a2 }
            throw r13
        L_0x01a5:
            r4 = move-exception
            com.getjar.sdk.logging.Area r13 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x01a2 }
            long r13 = r13.value()     // Catch:{ all -> 0x01a2 }
            com.getjar.sdk.logging.Area r16 = com.getjar.sdk.logging.Area.CONFIG     // Catch:{ all -> 0x01a2 }
            long r16 = r16.value()     // Catch:{ all -> 0x01a2 }
            long r13 = r13 | r16
            java.lang.String r16 = "TransactionManager: Failed to get transaction TTL from config"
            r0 = r16
            com.getjar.sdk.logging.Logger.m643e(r13, r0, r4)     // Catch:{ all -> 0x01a2 }
            goto L_0x0099
        L_0x01bd:
            r13 = move-exception
            monitor-exit(r14)     // Catch:{ all -> 0x01bd }
            throw r13     // Catch:{ Exception -> 0x0168 }
        L_0x01c0:
            com.getjar.sdk.comm.persistence.DBTransactions$TransactionType r13 = com.getjar.sdk.comm.persistence.DBTransactions.TransactionType.EARN     // Catch:{ Exception -> 0x0168 }
            com.getjar.sdk.comm.persistence.DBTransactions$TransactionType r14 = r10.getType()     // Catch:{ Exception -> 0x0168 }
            boolean r13 = r13.equals(r14)     // Catch:{ Exception -> 0x0168 }
            if (r13 == 0) goto L_0x022c
            if (r8 == 0) goto L_0x020c
            com.getjar.sdk.logging.Area r13 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0168 }
            long r13 = r13.value()     // Catch:{ Exception -> 0x0168 }
            com.getjar.sdk.logging.Area r16 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ Exception -> 0x0168 }
            long r16 = r16.value()     // Catch:{ Exception -> 0x0168 }
            long r13 = r13 | r16
            com.getjar.sdk.logging.Area r16 = com.getjar.sdk.logging.Area.EARN     // Catch:{ Exception -> 0x0168 }
            long r16 = r16.value()     // Catch:{ Exception -> 0x0168 }
            long r13 = r13 | r16
            java.util.Locale r16 = java.util.Locale.US     // Catch:{ Exception -> 0x0168 }
            java.lang.String r17 = "TransactionManager: Transaction %1$s has exceeded the TTL and timed out, removing it..."
            r18 = 1
            r0 = r18
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0168 }
            r18 = r0
            r19 = 0
            java.lang.String r20 = r10.getClientTransactionId()     // Catch:{ Exception -> 0x0168 }
            r18[r19] = r20     // Catch:{ Exception -> 0x0168 }
            java.lang.String r16 = java.lang.String.format(r16, r17, r18)     // Catch:{ Exception -> 0x0168 }
            r0 = r16
            com.getjar.sdk.logging.Logger.m646v(r13, r0)     // Catch:{ Exception -> 0x0168 }
            r0 = r10
            com.getjar.sdk.comm.persistence.EarnBucket r0 = (com.getjar.sdk.comm.persistence.EarnBucket) r0     // Catch:{ Exception -> 0x0168 }
            r13 = r0
            com.getjar.sdk.comm.persistence.DBTransactions$EarnState r14 = com.getjar.sdk.comm.persistence.DBTransactions.EarnState.DONE     // Catch:{ Exception -> 0x0168 }
            r0 = r23
            updateEarnTransactionState(r0, r13, r14)     // Catch:{ Exception -> 0x0168 }
        L_0x020c:
            com.getjar.sdk.comm.TransactionManager$EarnCallback r3 = new com.getjar.sdk.comm.TransactionManager$EarnCallback     // Catch:{ Exception -> 0x0168 }
            r0 = r10
            com.getjar.sdk.comm.persistence.EarnBucket r0 = (com.getjar.sdk.comm.persistence.EarnBucket) r0     // Catch:{ Exception -> 0x0168 }
            r13 = r0
            java.io.Serializable r14 = r10.getRelatedObject()     // Catch:{ Exception -> 0x0168 }
            com.getjar.sdk.comm.persistence.RelatedEarnData r14 = (com.getjar.sdk.comm.persistence.RelatedEarnData) r14     // Catch:{ Exception -> 0x0168 }
            r0 = r22
            r3.<init>(r13, r14)     // Catch:{ Exception -> 0x0168 }
            r0 = r10
            com.getjar.sdk.comm.persistence.EarnBucket r0 = (com.getjar.sdk.comm.persistence.EarnBucket) r0     // Catch:{ Exception -> 0x0168 }
            r13 = r0
            r0 = r22
            r1 = r23
            r2 = r25
            r0.runEarnTransaction(r13, r1, r3, r2)     // Catch:{ Exception -> 0x0168 }
            goto L_0x0163
        L_0x022c:
            com.getjar.sdk.comm.persistence.DBTransactions$TransactionType r13 = com.getjar.sdk.comm.persistence.DBTransactions.TransactionType.MANAGED_OFFER     // Catch:{ Exception -> 0x0168 }
            com.getjar.sdk.comm.persistence.DBTransactions$TransactionType r14 = r10.getType()     // Catch:{ Exception -> 0x0168 }
            boolean r13 = r13.equals(r14)     // Catch:{ Exception -> 0x0168 }
            if (r13 == 0) goto L_0x0247
            java.lang.String r13 = r10.getClientTransactionId()     // Catch:{ Exception -> 0x0168 }
            r0 = r22
            r1 = r23
            r2 = r25
            r0.runManagedOfferTransaction(r13, r1, r2)     // Catch:{ Exception -> 0x0168 }
            goto L_0x0163
        L_0x0247:
            java.lang.IllegalStateException r13 = new java.lang.IllegalStateException     // Catch:{ Exception -> 0x0168 }
            java.util.Locale r14 = java.util.Locale.US     // Catch:{ Exception -> 0x0168 }
            java.lang.String r16 = "Unrecognized trnasaction type: %1$s"
            r17 = 1
            r0 = r17
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0168 }
            r17 = r0
            r18 = 0
            com.getjar.sdk.comm.persistence.DBTransactions$TransactionType r19 = r10.getType()     // Catch:{ Exception -> 0x0168 }
            java.lang.String r19 = r19.name()     // Catch:{ Exception -> 0x0168 }
            r17[r18] = r19     // Catch:{ Exception -> 0x0168 }
            r0 = r16
            r1 = r17
            java.lang.String r14 = java.lang.String.format(r14, r0, r1)     // Catch:{ Exception -> 0x0168 }
            r13.<init>(r14)     // Catch:{ Exception -> 0x0168 }
            throw r13     // Catch:{ Exception -> 0x0168 }
        L_0x026d:
            monitor-exit(r15)     // Catch:{ all -> 0x01a2 }
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.TransactionManager.runTransactionsInternal(com.getjar.sdk.comm.CommContext, boolean, boolean):java.util.List");
    }

    private void checkAndCancelManagedOffer(CommContext commContext, ManagedOfferBucket transaction, boolean suppressInternalCallbacks) throws Exception {
        String clientTransactionId = transaction.getClientTransactionId();
        if (DBTransactions.ManagedOfferState.CANCELING.equals(transaction.getState())) {
            boolean shouldTryCanceling = true;
            HashMap<String, String> purchaseMetadata = transaction.getRelatedObject().getPurchaseMetadata();
            if (purchaseMetadata != null && purchaseMetadata.containsKey(Constants.GOOGLE_PLAY_SIGNED_DATA)) {
                shouldTryCanceling = InAppPurchaseManager.getInstance(this._applicationContext).consumeManagedOffer(transaction, true);
            }
            if (shouldTryCanceling) {
                Result result = TransactionServiceProxy.getInstance().cancelTransaction(commContext, clientTransactionId, suppressInternalCallbacks).get();
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
        if (!DBTransactions.ManagedOfferState.DONE.equals(transaction.getState())) {
            return;
        }
        if (!DBTransactions.getInstance(this._applicationContext).deleteTransaction(clientTransactionId)) {
            Logger.m642e(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: checkAndCancelManagedOffer() failed to delete a Managed Offer transaction in the DONE state [clientTransactionId: %1$s]", new Object[]{clientTransactionId}));
            return;
        }
        Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: checkAndCancelManagedOffer() deleted a Managed Offer transaction in the DONE state [clientTransactionId: %1$s]", new Object[]{clientTransactionId}));
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x021a, code lost:
        if (r20.equalsIgnoreCase(com.getjar.sdk.comm.auth.AuthManager.getInstance().getUserDeviceId()) != false) goto L_0x021c;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.getjar.sdk.comm.Operation runManagedOfferTransaction(java.lang.String r24, com.getjar.sdk.comm.CommContext r25, boolean r26) throws java.lang.Exception {
        /*
            r23 = this;
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.OFFER
            long r4 = r4.value()
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.TRANSACTION
            long r6 = r6.value()
            long r4 = r4 | r6
            java.util.Locale r6 = java.util.Locale.US
            java.lang.String r7 = "TransactionManager: runManagedPurchaseTransaction() [clientTransactionId: %1$s] [thread: %2$d]"
            r8 = 2
            java.lang.Object[] r8 = new java.lang.Object[r8]
            r9 = 0
            r8[r9] = r24
            r9 = 1
            java.lang.Thread r10 = java.lang.Thread.currentThread()
            long r21 = r10.getId()
            java.lang.Long r10 = java.lang.Long.valueOf(r21)
            r8[r9] = r10
            java.lang.String r6 = java.lang.String.format(r6, r7, r8)
            com.getjar.sdk.logging.Logger.m646v(r4, r6)
            r16 = 0
            r0 = r23
            android.content.Context r4 = r0._applicationContext
            com.getjar.sdk.comm.persistence.DBTransactions r4 = com.getjar.sdk.comm.persistence.DBTransactions.getInstance(r4)
            r0 = r24
            com.getjar.sdk.comm.persistence.TransactionBucket r12 = r4.loadTransaction(r0)
            if (r12 == 0) goto L_0x028c
            r19 = r12
            com.getjar.sdk.comm.persistence.ManagedOfferBucket r19 = (com.getjar.sdk.comm.persistence.ManagedOfferBucket) r19
            r0 = r23
            r1 = r19
            r0.checkCancelling((com.getjar.sdk.comm.persistence.ManagedOfferBucket) r1)
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.CREATED
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r5 = r19.getState()
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L_0x0062
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.RESERVING
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r5 = r19.getState()
            boolean r4 = r4.equals(r5)
            if (r4 == 0) goto L_0x010e
        L_0x0062:
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.CREATED
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r5 = r19.getState()
            boolean r4 = r4.equals(r5)
            if (r4 == 0) goto L_0x007b
            java.lang.Object r5 = _ManagedOfferTransactionStateLock
            monitor-enter(r5)
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.RESERVING     // Catch:{ all -> 0x028d }
            r0 = r25
            r1 = r19
            updateOfferTransactionState(r0, r1, r4)     // Catch:{ all -> 0x028d }
            monitor-exit(r5)     // Catch:{ all -> 0x028d }
        L_0x007b:
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.OFFER
            long r4 = r4.value()
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.TRANSACTION
            long r6 = r6.value()
            long r4 = r4 | r6
            java.util.Locale r6 = java.util.Locale.US
            java.lang.String r7 = "TransactionManager: RESERVING [clientTransactionId: %1$s] [state: %2$s] [thread: %3$d]"
            r8 = 3
            java.lang.Object[] r8 = new java.lang.Object[r8]
            r9 = 0
            r8[r9] = r24
            r9 = 1
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r10 = r19.getState()
            java.lang.String r10 = r10.name()
            r8[r9] = r10
            r9 = 2
            java.lang.Thread r10 = java.lang.Thread.currentThread()
            long r21 = r10.getId()
            java.lang.Long r10 = java.lang.Long.valueOf(r21)
            r8[r9] = r10
            java.lang.String r6 = java.lang.String.format(r6, r7, r8)
            com.getjar.sdk.logging.Logger.m646v(r4, r6)
            r0 = r23
            r1 = r19
            boolean r4 = r0.checkCancelling((com.getjar.sdk.comm.persistence.ManagedOfferBucket) r1)
            if (r4 != 0) goto L_0x010e
            com.getjar.sdk.comm.TransactionServiceProxy r4 = com.getjar.sdk.comm.TransactionServiceProxy.getInstance()
            com.getjar.sdk.comm.persistence.RelatedManagedOfferData r5 = r19.getRelatedObject()
            java.lang.String r6 = r5.getOfferToken()
            com.getjar.sdk.comm.persistence.RelatedManagedOfferData r5 = r19.getRelatedObject()
            java.util.HashMap r8 = r5.getPurchaseMetadata()
            com.getjar.sdk.comm.persistence.RelatedManagedOfferData r5 = r19.getRelatedObject()
            java.util.HashMap r9 = r5.getTrackingMetadata()
            r5 = r25
            r7 = r24
            r10 = r26
            com.getjar.sdk.comm.Operation r16 = r4.reserveManagedOffer(r5, r6, r7, r8, r9, r10)
            com.getjar.sdk.comm.Result r18 = r16.get()
            if (r18 == 0) goto L_0x02b4
            boolean r4 = r18.isSuccessfulResponse()
            if (r4 == 0) goto L_0x02b4
            java.lang.Object r5 = _ManagedOfferTransactionStateLock     // Catch:{ Exception -> 0x0293 }
            monitor-enter(r5)     // Catch:{ Exception -> 0x0293 }
            if (r19 == 0) goto L_0x010d
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.RESERVING     // Catch:{ all -> 0x0290 }
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r6 = r19.getState()     // Catch:{ all -> 0x0290 }
            boolean r4 = r4.equals(r6)     // Catch:{ all -> 0x0290 }
            if (r4 == 0) goto L_0x010d
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.RESERVED     // Catch:{ all -> 0x0290 }
            r0 = r23
            r1 = r25
            r2 = r18
            r3 = r19
            r0.updateOfferStateFromResponseState(r1, r2, r3, r4)     // Catch:{ all -> 0x0290 }
        L_0x010d:
            monitor-exit(r5)     // Catch:{ all -> 0x0290 }
        L_0x010e:
            r0 = r23
            r1 = r19
            r0.checkCancelling((com.getjar.sdk.comm.persistence.ManagedOfferBucket) r1)
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.PURCHASED
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r5 = r19.getState()
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L_0x012d
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.CONFIRMING
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r5 = r19.getState()
            boolean r4 = r4.equals(r5)
            if (r4 == 0) goto L_0x0244
        L_0x012d:
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.OFFER
            long r4 = r4.value()
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.TRANSACTION
            long r6 = r6.value()
            long r4 = r4 | r6
            java.util.Locale r6 = java.util.Locale.US
            java.lang.String r7 = "TransactionManager: CONFIRMING [clientTransactionId: %1$s] [thread: %2$d]"
            r8 = 2
            java.lang.Object[] r8 = new java.lang.Object[r8]
            r9 = 0
            r8[r9] = r24
            r9 = 1
            java.lang.Thread r10 = java.lang.Thread.currentThread()
            long r21 = r10.getId()
            java.lang.Long r10 = java.lang.Long.valueOf(r21)
            r8[r9] = r10
            java.lang.String r6 = java.lang.String.format(r6, r7, r8)
            com.getjar.sdk.logging.Logger.m646v(r4, r6)
            com.getjar.sdk.comm.persistence.RelatedManagedOfferData r4 = r19.getRelatedObject()
            java.util.HashMap r17 = r4.getPurchaseMetadata()
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.OFFER
            long r4 = r4.value()
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.TRANSACTION
            long r6 = r6.value()
            long r4 = r4 | r6
            java.lang.String r6 = "TransactionManager runManagedPurchaseTransaction starting runManagedPurchaseTransaction()"
            com.getjar.sdk.logging.Logger.m640d(r4, r6)
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.CONFIRMING
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r5 = r19.getState()
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L_0x018d
            java.lang.Object r5 = _ManagedOfferTransactionStateLock
            monitor-enter(r5)
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.CONFIRMING     // Catch:{ all -> 0x02cd }
            r0 = r25
            r1 = r19
            updateOfferTransactionState(r0, r1, r4)     // Catch:{ all -> 0x02cd }
            monitor-exit(r5)     // Catch:{ all -> 0x02cd }
        L_0x018d:
            com.getjar.sdk.comm.TransactionServiceProxy r4 = com.getjar.sdk.comm.TransactionServiceProxy.getInstance()
            r0 = r25
            r1 = r24
            r2 = r17
            r3 = r26
            com.getjar.sdk.comm.Operation r16 = r4.confirmManagedOffer(r0, r1, r2, r3)
            com.getjar.sdk.comm.Result r18 = r16.get()
            r0 = r23
            android.content.Context r4 = r0._applicationContext
            com.getjar.sdk.rewards.InAppPurchaseManager r4 = com.getjar.sdk.rewards.InAppPurchaseManager.getInstance(r4)
            java.lang.String r13 = r4.getCurrentClientTransactionId()
            if (r18 == 0) goto L_0x02fd
            boolean r4 = r18.isSuccessfulResponse()
            if (r4 == 0) goto L_0x02fd
            java.lang.Object r5 = _ManagedOfferTransactionStateLock
            monitor-enter(r5)
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.CONFIRMED     // Catch:{ all -> 0x02d0 }
            r0 = r23
            r1 = r25
            r2 = r18
            r3 = r19
            r0.updateOfferStateFromResponseState(r1, r2, r3, r4)     // Catch:{ all -> 0x02d0 }
            monitor-exit(r5)     // Catch:{ all -> 0x02d0 }
            r0 = r23
            r1 = r18
            java.lang.Long r11 = r0.getEarnOnPurchaseAmount(r1)
            if (r11 == 0) goto L_0x01e6
            long r4 = r11.longValue()
            r6 = 0
            int r4 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
            if (r4 <= 0) goto L_0x01e6
            r0 = r23
            android.content.Context r4 = r0._applicationContext
            r5 = 0
            long r6 = r11.longValue()
            com.getjar.sdk.utilities.NotificationsUtility.showEarnedFromPurchaseNotification(r4, r5, r6)
        L_0x01e6:
            r20 = 0
            org.json.JSONObject r5 = new org.json.JSONObject     // Catch:{ Exception -> 0x02d3 }
            java.lang.String r4 = "order.google_play.signed_data"
            r0 = r17
            java.lang.Object r4 = r0.get(r4)     // Catch:{ Exception -> 0x02d3 }
            java.lang.String r4 = (java.lang.String) r4     // Catch:{ Exception -> 0x02d3 }
            r5.<init>(r4)     // Catch:{ Exception -> 0x02d3 }
            java.lang.String r4 = "developerPayload"
            java.lang.String r14 = r5.getString(r4)     // Catch:{ Exception -> 0x02d3 }
            java.lang.String r4 = ","
            java.lang.String[] r4 = r14.split(r4)     // Catch:{ Exception -> 0x02d3 }
            r5 = 2
            r20 = r4[r5]     // Catch:{ Exception -> 0x02d3 }
        L_0x0206:
            boolean r4 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r20)     // Catch:{ Exception -> 0x02e8 }
            if (r4 != 0) goto L_0x021c
            com.getjar.sdk.comm.auth.AuthManager r4 = com.getjar.sdk.comm.auth.AuthManager.getInstance()     // Catch:{ Exception -> 0x02e8 }
            java.lang.String r4 = r4.getUserDeviceId()     // Catch:{ Exception -> 0x02e8 }
            r0 = r20
            boolean r4 = r0.equalsIgnoreCase(r4)     // Catch:{ Exception -> 0x02e8 }
            if (r4 == 0) goto L_0x0223
        L_0x021c:
            r0 = r23
            android.content.Context r4 = r0._applicationContext     // Catch:{ Exception -> 0x02e8 }
            com.getjar.sdk.utilities.NotificationsUtility.showRedeemReminderNotification(r4)     // Catch:{ Exception -> 0x02e8 }
        L_0x0223:
            boolean r4 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r13)
            if (r4 != 0) goto L_0x0244
            r0 = r24
            boolean r4 = r0.equals(r13)
            if (r4 == 0) goto L_0x0244
            r0 = r23
            android.content.Context r4 = r0._applicationContext
            com.getjar.sdk.rewards.InAppPurchaseManager$ManagedOfferStatus r5 = com.getjar.sdk.rewards.InAppPurchaseManager.ManagedOfferStatus.SUCCESS
            org.json.JSONObject r6 = r18.getResponseJson()
            java.lang.String r7 = "return"
            org.json.JSONObject r6 = r6.getJSONObject(r7)
            com.getjar.sdk.rewards.GetJarWebViewSubActivity.updateUIwithOfferResults(r4, r5, r6)
        L_0x0244:
            r0 = r23
            r1 = r19
            r0.checkCancelling((com.getjar.sdk.comm.persistence.ManagedOfferBucket) r1)
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.CONFIRMED
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r5 = r19.getState()
            boolean r4 = r4.equals(r5)
            if (r4 == 0) goto L_0x0260
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.CONSUMING
            r0 = r25
            r1 = r19
            updateOfferTransactionState(r0, r1, r4)
        L_0x0260:
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.CONSUMING
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r5 = r19.getState()
            boolean r4 = r4.equals(r5)
            if (r4 == 0) goto L_0x027a
            r0 = r23
            android.content.Context r4 = r0._applicationContext
            com.getjar.sdk.rewards.InAppPurchaseManager r4 = com.getjar.sdk.rewards.InAppPurchaseManager.getInstance(r4)
            r5 = 0
            r0 = r19
            r4.consumeManagedOffer(r0, r5)
        L_0x027a:
            r0 = r23
            r1 = r19
            r0.checkCancelling((com.getjar.sdk.comm.persistence.ManagedOfferBucket) r1)
            r0 = r23
            r1 = r25
            r2 = r19
            r3 = r26
            r0.checkAndCancelManagedOffer(r1, r2, r3)
        L_0x028c:
            return r16
        L_0x028d:
            r4 = move-exception
            monitor-exit(r5)     // Catch:{ all -> 0x028d }
            throw r4
        L_0x0290:
            r4 = move-exception
            monitor-exit(r5)     // Catch:{ all -> 0x0290 }
            throw r4     // Catch:{ Exception -> 0x0293 }
        L_0x0293:
            r15 = move-exception
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.OFFER
            long r4 = r4.value()
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.TRANSACTION
            long r6 = r6.value()
            long r4 = r4 | r6
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.STORAGE
            long r6 = r6.value()
            long r4 = r4 | r6
            java.lang.String r6 = "TransactionManager: failure"
            com.getjar.sdk.logging.Logger.m643e(r4, r6, r15)
            r0 = r25
            r0.addException(r15)
            goto L_0x010e
        L_0x02b4:
            java.util.concurrent.ConcurrentLinkedQueue<java.lang.String> r4 = _CanceledClientTransactionIDs
            r0 = r24
            r4.add(r0)
            java.lang.Object r5 = _ManagedOfferTransactionStateLock
            monitor-enter(r5)
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.CANCELING     // Catch:{ all -> 0x02ca }
            r0 = r25
            r1 = r19
            updateOfferTransactionState(r0, r1, r4)     // Catch:{ all -> 0x02ca }
            monitor-exit(r5)     // Catch:{ all -> 0x02ca }
            goto L_0x010e
        L_0x02ca:
            r4 = move-exception
            monitor-exit(r5)     // Catch:{ all -> 0x02ca }
            throw r4
        L_0x02cd:
            r4 = move-exception
            monitor-exit(r5)     // Catch:{ all -> 0x02cd }
            throw r4
        L_0x02d0:
            r4 = move-exception
            monitor-exit(r5)     // Catch:{ all -> 0x02d0 }
            throw r4
        L_0x02d3:
            r15 = move-exception
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.OFFER     // Catch:{ Exception -> 0x02e8 }
            long r4 = r4.value()     // Catch:{ Exception -> 0x02e8 }
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x02e8 }
            long r6 = r6.value()     // Catch:{ Exception -> 0x02e8 }
            long r4 = r4 | r6
            java.lang.String r6 = "Failed to get User Device ID from Google Play data"
            com.getjar.sdk.logging.Logger.m645i(r4, r6, r15)     // Catch:{ Exception -> 0x02e8 }
            goto L_0x0206
        L_0x02e8:
            r15 = move-exception
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.OFFER
            long r4 = r4.value()
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.TRANSACTION
            long r6 = r6.value()
            long r4 = r4 | r6
            java.lang.String r6 = "Failed to send redeem reminder notification"
            com.getjar.sdk.logging.Logger.m643e(r4, r6, r15)
            goto L_0x0223
        L_0x02fd:
            if (r18 == 0) goto L_0x034d
            com.getjar.sdk.exceptions.ServiceException r4 = com.getjar.sdk.comm.RequestUtilities.getServicesException(r18)
            if (r4 == 0) goto L_0x034d
            int r4 = r18.getResponseCode()
            r5 = 500(0x1f4, float:7.0E-43)
            if (r4 == r5) goto L_0x034d
            java.util.concurrent.ConcurrentLinkedQueue<java.lang.String> r4 = _CanceledClientTransactionIDs
            r0 = r24
            r4.add(r0)
            java.lang.Object r5 = _ManagedOfferTransactionStateLock
            monitor-enter(r5)
            com.getjar.sdk.comm.persistence.DBTransactions$ManagedOfferState r4 = com.getjar.sdk.comm.persistence.DBTransactions.ManagedOfferState.CANCELING     // Catch:{ all -> 0x034a }
            r0 = r25
            r1 = r19
            updateOfferTransactionState(r0, r1, r4)     // Catch:{ all -> 0x034a }
            monitor-exit(r5)     // Catch:{ all -> 0x034a }
            boolean r4 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r13)
            if (r4 != 0) goto L_0x033d
            r0 = r24
            boolean r4 = r0.equals(r13)
            if (r4 == 0) goto L_0x033d
            r0 = r23
            android.content.Context r4 = r0._applicationContext
            com.getjar.sdk.rewards.InAppPurchaseManager$ManagedOfferStatus r5 = com.getjar.sdk.rewards.InAppPurchaseManager.ManagedOfferStatus.SERVER_ERROR
            org.json.JSONObject r6 = new org.json.JSONObject
            r6.<init>()
            com.getjar.sdk.rewards.GetJarWebViewSubActivity.updateUIwithOfferResults(r4, r5, r6)
        L_0x033d:
            r0 = r23
            android.content.Context r4 = r0._applicationContext
            com.getjar.sdk.rewards.InAppPurchaseManager r4 = com.getjar.sdk.rewards.InAppPurchaseManager.getInstance(r4)
            r4.removeLastClientTransactionId()
            goto L_0x0244
        L_0x034a:
            r4 = move-exception
            monitor-exit(r5)     // Catch:{ all -> 0x034a }
            throw r4
        L_0x034d:
            boolean r4 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r13)
            if (r4 != 0) goto L_0x033d
            r0 = r24
            boolean r4 = r0.equals(r13)
            if (r4 == 0) goto L_0x033d
            r0 = r23
            android.content.Context r4 = r0._applicationContext
            com.getjar.sdk.rewards.InAppPurchaseManager$ManagedOfferStatus r5 = com.getjar.sdk.rewards.InAppPurchaseManager.ManagedOfferStatus.SERVER_ERROR_RECOVERABLE
            org.json.JSONObject r6 = new org.json.JSONObject
            r6.<init>()
            com.getjar.sdk.rewards.GetJarWebViewSubActivity.updateUIwithOfferResults(r4, r5, r6)
            goto L_0x033d
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.TransactionManager.runManagedOfferTransaction(java.lang.String, com.getjar.sdk.comm.CommContext, boolean):com.getjar.sdk.comm.Operation");
    }

    private Long getEarnOnPurchaseAmount(Result result) {
        JSONObject root;
        JSONArray lines;
        if (result != null) {
            try {
                if (!(result.getResponseJson() == null || !result.getResponseJson().has("return") || (root = result.getResponseJson().getJSONObject("return")) == null || !root.has("lines") || (lines = root.getJSONArray("lines")) == null)) {
                    for (int i = 0; i < lines.length(); i++) {
                        JSONObject line = lines.getJSONObject(i);
                        if (line != null && line.has(ServerProtocol.DIALOG_PARAM_TYPE) && line.has("amount") && "BUY_CURRENCY".equals(line.getString(ServerProtocol.DIALOG_PARAM_TYPE))) {
                            return Long.valueOf(line.getLong("amount"));
                        }
                    }
                }
            } catch (Exception e) {
                Logger.m643e(Area.OFFER.value() | Area.TRANSACTION.value() | Area.PURCHASE.value(), "getEarnOnPurchaseAmount() failed", e);
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0077, code lost:
        r14 = com.getjar.sdk.comm.TransactionServiceProxy.getInstance().reserveUnmanagedPurchase(r19, r18.getRelatedObject().getProductId(), r18.getRelatedObject().getProductName(), r18.getRelatedObject().getProductDescription(), r18.getRelatedObject().getAmount(), r18.getRelatedObject().getDeveloperPayload(), r10, r18.getRelatedObject().getTrackingMetadata(), r20);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.getjar.sdk.comm.Operation runPurchaseTransaction(com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket r18, com.getjar.sdk.comm.CommContext r19, boolean r20) throws java.lang.Exception {
        /*
            r17 = this;
            java.lang.String r10 = r18.getClientTransactionId()
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.PURCHASE
            long r3 = r3.value()
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION
            long r5 = r5.value()
            long r3 = r3 | r5
            java.util.Locale r5 = java.util.Locale.US
            java.lang.String r6 = "TransactionManager: runPurchaseTransaction() [clientTransactionId: %1$s] [state: %2$s] [thread: %3$d]"
            r7 = 3
            java.lang.Object[] r7 = new java.lang.Object[r7]
            r8 = 0
            r7[r8] = r10
            r8 = 1
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r9 = r18.getState()
            java.lang.String r9 = r9.name()
            r7[r8] = r9
            r8 = 2
            java.lang.Thread r9 = java.lang.Thread.currentThread()
            long r11 = r9.getId()
            java.lang.Long r9 = java.lang.Long.valueOf(r11)
            r7[r8] = r9
            java.lang.String r5 = java.lang.String.format(r5, r6, r7)
            com.getjar.sdk.logging.Logger.m646v(r3, r5)
            r14 = 0
            r17.checkCancelling((com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket) r18)
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.CREATED
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r4 = r18.getState()
            boolean r3 = r3.equals(r4)
            if (r3 != 0) goto L_0x0058
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.RESERVING
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r4 = r18.getState()
            boolean r3 = r3.equals(r4)
            if (r3 == 0) goto L_0x00c8
        L_0x0058:
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.CREATED
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r4 = r18.getState()
            boolean r3 = r3.equals(r4)
            if (r3 == 0) goto L_0x0071
            java.lang.Object r4 = _PurchaseTransactionStateLock
            monitor-enter(r4)
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.RESERVING     // Catch:{ all -> 0x01dd }
            r0 = r19
            r1 = r18
            updatePurchaseTransactionState(r0, r1, r3)     // Catch:{ all -> 0x01dd }
            monitor-exit(r4)     // Catch:{ all -> 0x01dd }
        L_0x0071:
            boolean r3 = r17.checkCancelling((com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket) r18)
            if (r3 != 0) goto L_0x00c8
            com.getjar.sdk.comm.TransactionServiceProxy r3 = com.getjar.sdk.comm.TransactionServiceProxy.getInstance()
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r4 = r18.getRelatedObject()
            java.lang.String r5 = r4.getProductId()
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r4 = r18.getRelatedObject()
            java.lang.String r6 = r4.getProductName()
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r4 = r18.getRelatedObject()
            java.lang.String r7 = r4.getProductDescription()
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r4 = r18.getRelatedObject()
            java.lang.Integer r8 = r4.getAmount()
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r4 = r18.getRelatedObject()
            java.lang.String r9 = r4.getDeveloperPayload()
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r4 = r18.getRelatedObject()
            java.util.HashMap r11 = r4.getTrackingMetadata()
            r4 = r19
            r12 = r20
            com.getjar.sdk.comm.Operation r14 = r3.reserveUnmanagedPurchase(r4, r5, r6, r7, r8, r9, r10, r11, r12)
            com.getjar.sdk.comm.Result r15 = r14.get()
            if (r15 == 0) goto L_0x00c8
            boolean r3 = r15.isSuccessfulResponse()
            if (r3 == 0) goto L_0x01e0
            r0 = r17
            r1 = r19
            r2 = r18
            r0.handleSuccessfulReserveResult(r15, r1, r2)
        L_0x00c8:
            r17.checkCancelling((com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket) r18)
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.CONFIRMING
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r4 = r18.getState()
            boolean r3 = r3.equals(r4)
            if (r3 == 0) goto L_0x0168
            r13 = 0
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r3 = r18.getRelatedObject()
            com.getjar.sdk.License$LicenseScope r3 = r3.getLicenseScope()
            if (r3 != 0) goto L_0x01f8
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.PURCHASE
            long r3 = r3.value()
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION
            long r5 = r5.value()
            long r3 = r3 | r5
            java.lang.String r5 = "TransactionManager runPurchaseTransaction starting confirmUnmanagedPurchase()"
            com.getjar.sdk.logging.Logger.m640d(r3, r5)
            com.getjar.sdk.comm.TransactionServiceProxy r3 = com.getjar.sdk.comm.TransactionServiceProxy.getInstance()
            r0 = r19
            r1 = r20
            com.getjar.sdk.comm.Operation r13 = r3.confirmUnmanagedPurchase(r0, r10, r1)
        L_0x0100:
            com.getjar.sdk.comm.Result r15 = r13.get()
            if (r15 == 0) goto L_0x0168
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.PURCHASE
            long r3 = r3.value()
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION
            long r5 = r5.value()
            long r3 = r3 | r5
            java.lang.StringBuilder r5 = new java.lang.StringBuilder
            r5.<init>()
            java.lang.String r6 = "TransactionManager runPurchaseTransaction -- Response "
            java.lang.StringBuilder r5 = r5.append(r6)
            java.lang.String r6 = r15.getResponseBody()
            java.lang.StringBuilder r5 = r5.append(r6)
            java.lang.String r5 = r5.toString()
            com.getjar.sdk.logging.Logger.m640d(r3, r5)
            boolean r3 = r15.isSuccessfulResponse()
            if (r3 == 0) goto L_0x022f
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r3 = r18.getRelatedObject()
            com.getjar.sdk.License$LicenseScope r3 = r3.getLicenseScope()
            if (r3 == 0) goto L_0x0159
            com.getjar.sdk.data.LicenseEngine r3 = new com.getjar.sdk.data.LicenseEngine
            r0 = r19
            r3.<init>(r0)
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r4 = r18.getRelatedObject()
            java.lang.String r4 = r4.getProductId()
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r5 = r18.getRelatedObject()
            com.getjar.sdk.License$LicenseScope r5 = r5.getLicenseScope()
            com.getjar.sdk.data.LicenseInternal$InternalLicenseState r6 = com.getjar.sdk.data.LicenseInternal.InternalLicenseState.SYNCED
            r3.updateLicenseState(r4, r5, r6, r15)
        L_0x0159:
            java.lang.Object r4 = _PurchaseTransactionStateLock
            monitor-enter(r4)
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.DONE     // Catch:{ all -> 0x022c }
            r0 = r17
            r1 = r19
            r2 = r18
            r0.updatePurchaseStateFromResponseState(r1, r15, r2, r3)     // Catch:{ all -> 0x022c }
            monitor-exit(r4)     // Catch:{ all -> 0x022c }
        L_0x0168:
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.CANCELING
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r4 = r18.getState()
            boolean r3 = r3.equals(r4)
            if (r3 == 0) goto L_0x01a4
            com.getjar.sdk.comm.TransactionServiceProxy r3 = com.getjar.sdk.comm.TransactionServiceProxy.getInstance()
            r0 = r19
            r1 = r20
            com.getjar.sdk.comm.Operation r13 = r3.cancelTransaction(r0, r10, r1)
            com.getjar.sdk.comm.Result r15 = r13.get()
            if (r15 == 0) goto L_0x01a4
            boolean r3 = r15.isSuccessfulResponse()
            if (r3 == 0) goto L_0x024a
            java.lang.Object r4 = _PurchaseTransactionStateLock
            monitor-enter(r4)
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.DONE     // Catch:{ all -> 0x0247 }
            r0 = r17
            r1 = r19
            r2 = r18
            r0.updatePurchaseStateFromResponseState(r1, r15, r2, r3)     // Catch:{ all -> 0x0247 }
            monitor-exit(r4)     // Catch:{ all -> 0x0247 }
            java.util.concurrent.ConcurrentLinkedQueue<java.lang.String> r3 = _CanceledClientTransactionIDs
            java.lang.Class r4 = r18.getClass()
            r3.remove(r4)
        L_0x01a4:
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.DONE
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r4 = r18.getState()
            boolean r3 = r3.equals(r4)
            if (r3 == 0) goto L_0x01dc
            r0 = r17
            android.content.Context r3 = r0._applicationContext
            com.getjar.sdk.comm.persistence.DBTransactions r3 = com.getjar.sdk.comm.persistence.DBTransactions.getInstance(r3)
            boolean r3 = r3.deleteTransaction(r10)
            if (r3 != 0) goto L_0x026b
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.PURCHASE
            long r3 = r3.value()
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION
            long r5 = r5.value()
            long r3 = r3 | r5
            java.util.Locale r5 = java.util.Locale.US
            java.lang.String r6 = "TransactionManager: runPurchaseTransaction() failed to delete a Purchase transaction in the DONE state [clientTransactionId: %1$s]"
            r7 = 1
            java.lang.Object[] r7 = new java.lang.Object[r7]
            r8 = 0
            r7[r8] = r10
            java.lang.String r5 = java.lang.String.format(r5, r6, r7)
            com.getjar.sdk.logging.Logger.m642e(r3, r5)
        L_0x01dc:
            return r14
        L_0x01dd:
            r3 = move-exception
            monitor-exit(r4)     // Catch:{ all -> 0x01dd }
            throw r3
        L_0x01e0:
            com.getjar.sdk.exceptions.ServiceException r16 = com.getjar.sdk.comm.RequestUtilities.getServicesException(r15)
            if (r16 == 0) goto L_0x00c8
            java.lang.Object r4 = _PurchaseTransactionStateLock
            monitor-enter(r4)
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.DONE     // Catch:{ all -> 0x01f5 }
            r0 = r19
            r1 = r18
            updatePurchaseTransactionState(r0, r1, r3)     // Catch:{ all -> 0x01f5 }
            monitor-exit(r4)     // Catch:{ all -> 0x01f5 }
            goto L_0x00c8
        L_0x01f5:
            r3 = move-exception
            monitor-exit(r4)     // Catch:{ all -> 0x01f5 }
            throw r3
        L_0x01f8:
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.PURCHASE
            long r3 = r3.value()
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION
            long r5 = r5.value()
            long r3 = r3 | r5
            java.lang.String r5 = "TransactionManager runPurchaseTransaction starting confirmAndLicense()"
            com.getjar.sdk.logging.Logger.m640d(r3, r5)
            com.getjar.sdk.comm.TransactionServiceProxy r3 = com.getjar.sdk.comm.TransactionServiceProxy.getInstance()
            java.lang.String r5 = r18.getClientTransactionId()
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r4 = r18.getRelatedObject()
            java.lang.String r6 = r4.getProductId()
            com.getjar.sdk.comm.persistence.RelatedPurchaseData r4 = r18.getRelatedObject()
            com.getjar.sdk.License$LicenseScope r7 = r4.getLicenseScope()
            r4 = r19
            r8 = r20
            com.getjar.sdk.comm.Operation r13 = r3.confirmAndLicense(r4, r5, r6, r7, r8)
            goto L_0x0100
        L_0x022c:
            r3 = move-exception
            monitor-exit(r4)     // Catch:{ all -> 0x022c }
            throw r3
        L_0x022f:
            com.getjar.sdk.exceptions.ServiceException r16 = com.getjar.sdk.comm.RequestUtilities.getServicesException(r15)
            if (r16 == 0) goto L_0x0168
            java.lang.Object r4 = _PurchaseTransactionStateLock
            monitor-enter(r4)
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.DONE     // Catch:{ all -> 0x0244 }
            r0 = r19
            r1 = r18
            updatePurchaseTransactionState(r0, r1, r3)     // Catch:{ all -> 0x0244 }
            monitor-exit(r4)     // Catch:{ all -> 0x0244 }
            goto L_0x0168
        L_0x0244:
            r3 = move-exception
            monitor-exit(r4)     // Catch:{ all -> 0x0244 }
            throw r3
        L_0x0247:
            r3 = move-exception
            monitor-exit(r4)     // Catch:{ all -> 0x0247 }
            throw r3
        L_0x024a:
            com.getjar.sdk.exceptions.ServiceException r16 = com.getjar.sdk.comm.RequestUtilities.getServicesException(r15)
            if (r16 == 0) goto L_0x01a4
            java.lang.Object r4 = _PurchaseTransactionStateLock
            monitor-enter(r4)
            com.getjar.sdk.comm.persistence.DBTransactions$PurchaseState r3 = com.getjar.sdk.comm.persistence.DBTransactions.PurchaseState.DONE     // Catch:{ all -> 0x0268 }
            r0 = r19
            r1 = r18
            updatePurchaseTransactionState(r0, r1, r3)     // Catch:{ all -> 0x0268 }
            monitor-exit(r4)     // Catch:{ all -> 0x0268 }
            java.util.concurrent.ConcurrentLinkedQueue<java.lang.String> r3 = _CanceledClientTransactionIDs
            java.lang.Class r4 = r18.getClass()
            r3.remove(r4)
            goto L_0x01a4
        L_0x0268:
            r3 = move-exception
            monitor-exit(r4)     // Catch:{ all -> 0x0268 }
            throw r3
        L_0x026b:
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.PURCHASE
            long r3 = r3.value()
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION
            long r5 = r5.value()
            long r3 = r3 | r5
            java.util.Locale r5 = java.util.Locale.US
            java.lang.String r6 = "TransactionManager: runPurchaseTransaction() deleted a Purchase transaction in the DONE state [clientTransactionId: %1$s]"
            r7 = 1
            java.lang.Object[] r7 = new java.lang.Object[r7]
            r8 = 0
            r7[r8] = r10
            java.lang.String r5 = java.lang.String.format(r5, r6, r7)
            com.getjar.sdk.logging.Logger.m646v(r3, r5)
            goto L_0x01dc
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.TransactionManager.runPurchaseTransaction(com.getjar.sdk.comm.persistence.PurchaseUnmanagedBucket, com.getjar.sdk.comm.CommContext, boolean):com.getjar.sdk.comm.Operation");
    }

    /* access modifiers changed from: private */
    public Operation runEarnTransaction(EarnBucket transaction, CommContext commContext, CallbackInterface callbacks, boolean suppressInternalCallbacks) throws Exception {
        String clientTransactionId = transaction.getClientTransactionId();
        Logger.m646v(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: runEarnTransaction() [clientTransactionId: %1$s] [state: %2$s] [callback: %3$s] [thread: %4$d]", new Object[]{clientTransactionId, transaction.getState().name(), callbacks.getClass().getName(), Long.valueOf(Thread.currentThread().getId())}));
        Operation operation = null;
        if (DBTransactions.EarnState.CREATED.equals(transaction.getState()) || DBTransactions.EarnState.EARNING.equals(transaction.getState())) {
            if (DBTransactions.EarnState.CREATED.equals(transaction.getState())) {
                updateEarnTransactionState(commContext, transaction, DBTransactions.EarnState.EARNING);
            }
            RelatedEarnData earnData = transaction.getRelatedObject();
            operation = TransactionServiceProxy.getInstance().earn(commContext, earnData.getItemId(), earnData.getPackageName(), clientTransactionId, earnData.getItemMetadata(), earnData.getTrackingMetadata(), suppressInternalCallbacks);
            try {
                operation.mapResultToCallbacks(callbacks);
            } catch (Exception e) {
                Logger.m643e(Area.EARN.value() | Area.TRANSACTION.value(), "TransactionManager: runEarnTransaction() Result to callback mapping failed", e);
            }
            Result earnResult = operation.get();
            if (earnResult != null) {
                Logger.m640d(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: runEarnTransaction() Earn received a %1$d result", new Object[]{Integer.valueOf(earnResult.getResponseCode())}));
                if (earnResult.isSuccessfulResponse()) {
                    String substate = getTransactionSubstate(earnResult, Constants.RequestInstallSubState.NONE.toString());
                    if (!"INCOMPLETE_RECONCILE_WARNING".equalsIgnoreCase(substate) && !"DEPENDENT_SERVICE_FAILURE".equalsIgnoreCase(substate) && !"UNKNOWN_RETRY_WARNING".equalsIgnoreCase(substate)) {
                        updateEarnTransactionState(commContext, transaction, DBTransactions.EarnState.DONE);
                    }
                } else if (!(earnResult.getResponseCode() == 202 || RequestUtilities.getServicesException(earnResult) == null)) {
                    updateEarnTransactionState(commContext, transaction, DBTransactions.EarnState.DONE);
                }
            } else {
                Logger.m642e(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: runEarnTransaction() Earn operation %1$d failed to get results", new Object[]{Integer.valueOf(operation.getId())}));
            }
        }
        if (DBTransactions.EarnState.DONE.equals(transaction.getState())) {
            if (!DBTransactions.getInstance(this._applicationContext).deleteTransaction(clientTransactionId)) {
                Logger.m642e(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: runEarnTransaction() failed to delete a Earn transaction in the DONE state [clientTransactionId: %1$s]", new Object[]{clientTransactionId}));
            } else {
                Logger.m646v(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: runEarnTransaction() deleted a Earn transaction in the DONE state [clientTransactionId: %1$s]", new Object[]{clientTransactionId}));
            }
        }
        return operation;
    }

    private static void updatePurchaseTransactionState(CommContext commContext, PurchaseUnmanagedBucket transaction, DBTransactions.PurchaseState newState) {
        Logger.m646v(Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: updatePurchaseTransactionState() [clientTransactionId: %1$s] [old: %2$s] [new: %3$s] [thread: %4$d]", new Object[]{transaction.getClientTransactionId(), transaction.getState().name(), newState.name(), Long.valueOf(Thread.currentThread().getId())}));
        if (!_CanceledClientTransactionIDs.contains(transaction.getClientTransactionId()) || DBTransactions.PurchaseState.CANCELING.equals(newState)) {
            DBTransactions.getInstance(commContext.getApplicationContext()).updatePurchaseTransaction(transaction, newState);
        } else {
            transaction.setState(DBTransactions.PurchaseState.CANCELING);
        }
    }

    public static void updateOfferTransactionState(CommContext commContext, ManagedOfferBucket transaction, DBTransactions.ManagedOfferState newState) {
        Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: updateOfferTransactionState() [clientTransactionId: %1$s] [old: %2$s] [new: %3$s] [thread: %4$d]", new Object[]{transaction.getClientTransactionId(), transaction.getState().name(), newState.name(), Long.valueOf(Thread.currentThread().getId())}));
        if (!_CanceledClientTransactionIDs.contains(transaction.getClientTransactionId()) || DBTransactions.ManagedOfferState.CANCELING.equals(newState)) {
            Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: updateOfferTransactionState() [clientTransactionId: %1$s] [new: %2$s]", new Object[]{transaction.getClientTransactionId(), newState.name()}));
            DBTransactions.getInstance(commContext.getApplicationContext()).updateManagedOfferTransaction(transaction, newState);
            return;
        }
        Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: updateOfferTransactionState() [clientTransactionId: %1$s] CANCELING [%2$s]", new Object[]{transaction.getClientTransactionId(), Logger.getShortStack()}));
        transaction.setState(DBTransactions.ManagedOfferState.CANCELING);
    }

    private static void updateEarnTransactionState(CommContext commContext, EarnBucket transaction, DBTransactions.EarnState newState) {
        Logger.m646v(Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "TransactionManager: updateEarnTransactionState() [clientTransactionId: %1$s] [old: %2$s] [new: %3$s] [thread: %4$d]", new Object[]{transaction.getClientTransactionId(), transaction.getState().name(), newState.name(), Long.valueOf(Thread.currentThread().getId())}));
        DBTransactions.getInstance(commContext.getApplicationContext()).updateEarnTransaction(transaction, newState);
        transaction.setState(newState);
    }

    private boolean checkCancelling(PurchaseUnmanagedBucket transaction) {
        if (_CanceledClientTransactionIDs.contains(transaction.getClientTransactionId())) {
            transaction.setState(DBTransactions.PurchaseState.CANCELING);
            Logger.m646v(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: checkCancelling() returning TRUE [clientTransactionId: %1$s] [thread: %2$d]", new Object[]{transaction.getClientTransactionId(), Long.valueOf(Thread.currentThread().getId())}));
            return true;
        }
        Logger.m646v(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: checkCancelling() returning FALSE [clientTransactionId: %1$s] [thread: %2$d]", new Object[]{transaction.getClientTransactionId(), Long.valueOf(Thread.currentThread().getId())}));
        return false;
    }

    private boolean checkCancelling(ManagedOfferBucket transaction) {
        if (_CanceledClientTransactionIDs.contains(transaction.getClientTransactionId())) {
            Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: checkCancelling() CANCELING [clientTransactionId: %1$s] [%2$s]", new Object[]{transaction.getClientTransactionId(), Logger.getShortStack()}));
            transaction.setState(DBTransactions.ManagedOfferState.CANCELING);
            Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: checkCancelling() returning TRUE [clientTransactionId: %1$s] [thread: %2$d]", new Object[]{transaction.getClientTransactionId(), Long.valueOf(Thread.currentThread().getId())}));
            return true;
        }
        Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "TransactionManager: checkCancelling() returning FALSE [clientTransactionId: %1$s] [thread: %2$d]", new Object[]{transaction.getClientTransactionId(), Long.valueOf(Thread.currentThread().getId())}));
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
            Logger.m643e(Area.PURCHASE.value() | Area.STORAGE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "updatePurchaseStateFromResponseState() failed, setting state to: %1$s", new Object[]{newState.name()}), e);
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
            Logger.m643e(Area.OFFER.value() | Area.STORAGE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "updateOfferStateFromResponseState() failed, setting state to: %1$s", new Object[]{newState.name()}), e);
        }
        updateOfferTransactionState(commContext, purchaseBucket, newState);
        return newState;
    }

    private void handleSuccessfulReserveResult(Result result, CommContext commContext, PurchaseUnmanagedBucket transactionBucket) {
        boolean wasReserving = false;
        try {
            synchronized (_PurchaseTransactionStateLock) {
                TransactionBucket transaction = DBTransactions.getInstance(this._applicationContext).loadTransaction(transactionBucket.getClientTransactionId());
                if (transaction != null && DBTransactions.PurchaseState.RESERVING.equals(((PurchaseUnmanagedBucket) transaction).getState())) {
                    wasReserving = true;
                    updatePurchaseStateFromResponseState(commContext, result, transactionBucket, DBTransactions.PurchaseState.CONFIRMING);
                    if (transactionBucket.getRelatedObject().getLicenseScope() != null) {
                        new LicenseEngine(commContext).updateLicenseState(transactionBucket.getRelatedObject().getProductId(), transactionBucket.getRelatedObject().getLicenseScope(), LicenseInternal.InternalLicenseState.UNSYNCED, result);
                    }
                }
            }
        } catch (Exception e) {
            Logger.m643e(Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), "TransactionManager: failure", e);
            commContext.addException(e);
        }
        if (wasReserving) {
            try {
                if (!getTransactionSubstate(result, Constants.RequestInstallSubState.NONE.name()).equals(Constants.RequestInstallSubState.FUNDS_INSUFFICIENT_FAILURE.name())) {
                    try {
                        commContext.postResponse(new PurchaseSucceededResponse(transactionBucket.getRelatedObject().getProductId(), (long) transactionBucket.getRelatedObject().getAmount().intValue(), transactionBucket.getRelatedObject().getProductName(), transactionBucket.getClientTransactionId(), result.getSignedPayload(), result.getSignature()));
                    } catch (Exception e2) {
                        Logger.m643e(Area.PURCHASE.value() | Area.TRANSACTION.value(), "TransactionManager: failure", e2);
                        commContext.addException(e2);
                    }
                }
            } catch (Exception e3) {
                Logger.m643e(Area.PURCHASE.value() | Area.TRANSACTION.value(), "TransactionManager: failure", e3);
                commContext.addException(e3);
            }
        }
    }

    public void buyCurrencyForGoogleTransactions(final CommContext commContext) {
        if (commContext == null) {
            throw new IllegalArgumentException("commContext cannot be null");
        }
        new Thread(new Runnable() {
            public void run() {
                synchronized (TransactionManager._UploadBuyGoldLock) {
                    try {
                        Iterator i$ = ((ArrayList) InAppPurchaseManager.getInstance(commContext.getApplicationContext()).getAllPurchaseResponses()).iterator();
                        while (i$.hasNext()) {
                            GooglePurchaseResponse purchaseResponse = i$.next();
                            HashMap<String, String> purchaseDetailsMap = (HashMap) purchaseResponse.getResponseAsMap(TransactionManager.this._applicationContext);
                            String productId = purchaseResponse.getProductId();
                            String developerPayload = purchaseResponse.getDeveloperPayload();
                            Logger.m640d(Area.TRANSACTION.value(), "TransactionManager buyGold dev payload: " + developerPayload + " " + productId);
                            if (StringUtility.isNullOrEmpty(developerPayload)) {
                                if (productId.startsWith("android.test")) {
                                    Logger.m640d(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() putting in demo clientTransactionId");
                                    developerPayload = Constants.BUYING_GOLD_PAYLOAD_PREFIX + UUID.randomUUID().toString();
                                } else {
                                    Logger.m642e(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() buying gold failed [null payload]");
                                    InAppPurchaseManager.getInstance(commContext.getApplicationContext()).removePurchaseResponse(purchaseResponse.getOrderId());
                                }
                            }
                            if (!developerPayload.startsWith(Constants.BUYING_GOLD_PAYLOAD_PREFIX) || (!productId.startsWith(GetJarManager.GetjarIntentKey) && !productId.startsWith("android.test"))) {
                                Logger.m642e(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() buying gold failed [not getjar]");
                                InAppPurchaseManager.getInstance(commContext.getApplicationContext()).removePurchaseResponse(purchaseResponse.getOrderId());
                            } else {
                                try {
                                    Result result = TransactionServiceProxy.getInstance().buyCurrency(commContext, developerPayload.substring(Constants.BUYING_GOLD_PAYLOAD_PREFIX.length()), productId, purchaseDetailsMap, new HashMap(), true).get();
                                    if (result == null) {
                                        InAppPurchaseManager.getInstance(commContext.getApplicationContext()).handleFailure(productId, InAppPurchaseManager.InAppBillingFailure.NETWORK_ERROR, TransactionManager.this._applicationContext);
                                    } else if (result.checkForCallerUnauthorized()) {
                                        InAppPurchaseManager.getInstance(commContext.getApplicationContext()).handleFailure(productId, InAppPurchaseManager.InAppBillingFailure.UNAUTHORIZED, TransactionManager.this._applicationContext);
                                        InAppPurchaseManager.getInstance(commContext.getApplicationContext()).removePurchaseResponse(purchaseResponse.getOrderId());
                                    } else if (result.isSuccessfulResponse()) {
                                        Logger.m644i(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() -- Successfully bought currency!");
                                        InAppPurchaseManager.getInstance(commContext.getApplicationContext()).removePurchaseResponse(purchaseResponse.getOrderId());
                                        NotificationsUtility.pushSuccessNotification(commContext, String.format(Locale.US, Constants.NOTIFICATION_BILLING_SUCCESS, new Object[]{purchaseDetailsMap.get(Constants.BUY_CURRENCY_GOLD_VALUE)}));
                                        Intent intent = new Intent(Constants.ACTION_NOTIFY_BUY_GOLD);
                                        intent.putExtra("ITEM_ID", productId);
                                        intent.putExtra(Constants.BUY_CURRENCY_GOLD_VALUE, purchaseDetailsMap.get(Constants.BUY_CURRENCY_GOLD_VALUE));
                                        TransactionManager.this._applicationContext.sendBroadcast(intent);
                                    } else {
                                        InAppPurchaseManager.getInstance(commContext.getApplicationContext()).handleFailure(productId, InAppPurchaseManager.InAppBillingFailure.GETJAR_SERVICE_FAILURE, TransactionManager.this._applicationContext);
                                    }
                                } catch (InterruptedException e) {
                                    InAppPurchaseManager.getInstance(commContext.getApplicationContext()).handleFailure(productId, InAppPurchaseManager.InAppBillingFailure.GETJAR_SERVICE_FAILURE, TransactionManager.this._applicationContext);
                                    Logger.m643e(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() failed", e);
                                } catch (ExecutionException e2) {
                                    InAppPurchaseManager.getInstance(commContext.getApplicationContext()).handleFailure(productId, InAppPurchaseManager.InAppBillingFailure.GETJAR_SERVICE_FAILURE, TransactionManager.this._applicationContext);
                                    Logger.m643e(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() failed", e2);
                                }
                            }
                        }
                    } catch (Exception e3) {
                        Logger.m643e(Area.TRANSACTION.value(), "TransactionManager: buyCurrencyForGoogleTransactions() failed", e3);
                    }
                }
            }
        }).start();
    }

    private class EarnCallback implements CallbackInterface {
        private EarnBucket _earnBucket = null;
        private RelatedEarnData _earnData = null;

        public EarnCallback(EarnBucket earnBucket, RelatedEarnData earn) {
            if (earn == null) {
                throw new IllegalArgumentException("'earn' can not be NULL");
            } else if (earnBucket == null) {
                throw new IllegalArgumentException("'earnBucket' can not be NULL");
            } else if (StringUtility.isNullOrEmpty(earnBucket.getClientTransactionId())) {
                throw new IllegalArgumentException("'earnBucket.getClientTransactionId()' can not be NULL or empty");
            } else {
                this._earnData = earn;
                this._earnBucket = earnBucket;
            }
        }

        /* JADX WARNING: type inference failed for: r8v42, types: [java.lang.CharSequence] */
        /* JADX WARNING: type inference failed for: r8v75, types: [java.lang.CharSequence] */
        /* JADX WARNING: Multi-variable type inference failed */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void serviceRequestSucceeded(com.getjar.sdk.comm.Result r21, java.lang.String r22, com.getjar.sdk.comm.CommContext r23) {
            /*
                r20 = this;
                com.getjar.sdk.logging.Area r8 = com.getjar.sdk.logging.Area.TRANSACTION
                long r8 = r8.value()
                com.getjar.sdk.logging.Area r15 = com.getjar.sdk.logging.Area.EARN
                long r15 = r15.value()
                long r8 = r8 | r15
                java.util.Locale r15 = java.util.Locale.US
                java.lang.String r16 = "TransactionManager: EarnCallback: request succeeded [clientTransactionId: %1$s]"
                r17 = 1
                r0 = r17
                java.lang.Object[] r0 = new java.lang.Object[r0]
                r17 = r0
                r18 = 0
                r0 = r20
                com.getjar.sdk.comm.persistence.EarnBucket r0 = r0._earnBucket
                r19 = r0
                java.lang.String r19 = r19.getClientTransactionId()
                r17[r18] = r19
                java.lang.String r15 = java.lang.String.format(r15, r16, r17)
                com.getjar.sdk.logging.Logger.m640d(r8, r15)
                java.lang.String r8 = ""
                r0 = r21
                java.lang.String r3 = com.getjar.sdk.comm.TransactionManager.getTransactionState(r0, r8)
                com.getjar.sdk.utilities.Constants$RequestInstallSubState r8 = com.getjar.sdk.utilities.Constants.RequestInstallSubState.NONE
                java.lang.String r8 = r8.toString()
                r0 = r21
                java.lang.String r4 = com.getjar.sdk.comm.TransactionManager.getTransactionSubstate(r0, r8)
                r8 = -1
                r0 = r21
                long r6 = com.getjar.sdk.utilities.Utility.getResponseAmount((com.getjar.sdk.comm.Result) r0, (long) r8)
                r0 = r20
                com.getjar.sdk.comm.persistence.RelatedEarnData r8 = r0._earnData
                java.lang.String r5 = r8.getPackageName()
                android.content.Context r8 = r23.getApplicationContext()     // Catch:{ Exception -> 0x027f }
                android.content.pm.PackageManager r13 = r8.getPackageManager()     // Catch:{ Exception -> 0x027f }
                r0 = r20
                com.getjar.sdk.comm.persistence.RelatedEarnData r8 = r0._earnData     // Catch:{ Exception -> 0x027f }
                java.lang.String r8 = r8.getPackageName()     // Catch:{ Exception -> 0x027f }
                r9 = 128(0x80, float:1.794E-43)
                android.content.pm.PackageInfo r12 = r13.getPackageInfo(r8, r9)     // Catch:{ Exception -> 0x027f }
                android.content.pm.ApplicationInfo r8 = r12.applicationInfo     // Catch:{ Exception -> 0x027f }
                java.lang.CharSequence r8 = r8.loadLabel(r13)     // Catch:{ Exception -> 0x027f }
                r0 = r8
                java.lang.String r0 = (java.lang.String) r0     // Catch:{ Exception -> 0x027f }
                r5 = r0
            L_0x0072:
                com.getjar.sdk.logging.Area r8 = com.getjar.sdk.logging.Area.TRANSACTION
                long r8 = r8.value()
                com.getjar.sdk.logging.Area r15 = com.getjar.sdk.logging.Area.EARN
                long r15 = r15.value()
                long r8 = r8 | r15
                java.util.Locale r15 = java.util.Locale.US
                java.lang.String r16 = "TransactionManager: Pushing Earn notification [amount: %1$d] [state: %2$s] [substate: %3$s]"
                r17 = 3
                r0 = r17
                java.lang.Object[] r0 = new java.lang.Object[r0]
                r17 = r0
                r18 = 0
                java.lang.Long r19 = java.lang.Long.valueOf(r6)
                r17[r18] = r19
                r18 = 1
                r17[r18] = r3
                r18 = 2
                r17[r18] = r4
                java.lang.String r15 = java.lang.String.format(r15, r16, r17)
                com.getjar.sdk.logging.Logger.m640d(r8, r15)
                java.lang.String r8 = "CAP_REACHED_FAILURE"
                boolean r8 = r8.equalsIgnoreCase(r4)
                if (r8 == 0) goto L_0x0113
                r0 = r20
                com.getjar.sdk.comm.persistence.RelatedEarnData r8 = r0._earnData
                java.lang.String r8 = r8.getPackageName()
                java.lang.String r9 = "com.getjar.rewards"
                boolean r8 = r8.equals(r9)
                if (r8 != 0) goto L_0x0113
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r8 = com.getjar.sdk.comm.persistence.DBTransactions.NotificationState.SUCCEEDED
                r0 = r20
                com.getjar.sdk.comm.persistence.EarnBucket r9 = r0._earnBucket
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r9 = r9.getNotificationState()
                boolean r8 = r8.equals(r9)
                if (r8 != 0) goto L_0x00ff
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r8 = com.getjar.sdk.comm.persistence.DBTransactions.NotificationState.FAILED
                r0 = r20
                com.getjar.sdk.comm.persistence.EarnBucket r9 = r0._earnBucket
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r9 = r9.getNotificationState()
                boolean r8 = r8.equals(r9)
                if (r8 != 0) goto L_0x00ff
                java.util.Locale r8 = java.util.Locale.US
                java.lang.String r9 = "Thank you for installing %1$s. You must spend gold before you can earn more."
                r15 = 1
                java.lang.Object[] r15 = new java.lang.Object[r15]
                r16 = 0
                r15[r16] = r5
                java.lang.String r8 = java.lang.String.format(r8, r9, r15)
                r0 = r23
                com.getjar.sdk.utilities.NotificationsUtility.pushFailNotification(r0, r8)
                android.content.Context r8 = r23.getApplicationContext()
                com.getjar.sdk.comm.persistence.DBTransactions r8 = com.getjar.sdk.comm.persistence.DBTransactions.getInstance(r8)
                r0 = r20
                com.getjar.sdk.comm.persistence.EarnBucket r9 = r0._earnBucket
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r15 = com.getjar.sdk.comm.persistence.DBTransactions.NotificationState.FAILED
                r8.updateEarnTransactionNotificationState(r9, r15)
            L_0x00ff:
                r0 = r20
                com.getjar.sdk.comm.persistence.RelatedEarnData r8 = r0._earnData
                java.lang.String r8 = r8.getPackageName()
                com.getjar.sdk.data.earning.EarnStateDatabase$EarnState r9 = com.getjar.sdk.data.earning.EarnStateDatabase.EarnState.FAIL
                r0 = r20
                r1 = r23
                r2 = r21
                r0.updateEarnStateInAppStatePersistence(r1, r8, r2, r9)
            L_0x0112:
                return
            L_0x0113:
                java.lang.String r8 = "ALREADY_REDEEMED_FAILURE"
                boolean r8 = r8.equalsIgnoreCase(r4)
                if (r8 != 0) goto L_0x0123
                java.lang.String r8 = "ALREADY_USED_FAILURE"
                boolean r8 = r8.equalsIgnoreCase(r4)
                if (r8 == 0) goto L_0x018c
            L_0x0123:
                r0 = r20
                com.getjar.sdk.comm.persistence.RelatedEarnData r8 = r0._earnData
                java.lang.String r8 = r8.getPackageName()
                java.lang.String r9 = "com.getjar.rewards"
                boolean r8 = r8.equals(r9)
                if (r8 != 0) goto L_0x018c
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r8 = com.getjar.sdk.comm.persistence.DBTransactions.NotificationState.SUCCEEDED
                r0 = r20
                com.getjar.sdk.comm.persistence.EarnBucket r9 = r0._earnBucket
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r9 = r9.getNotificationState()
                boolean r8 = r8.equals(r9)
                if (r8 != 0) goto L_0x0178
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r8 = com.getjar.sdk.comm.persistence.DBTransactions.NotificationState.FAILED
                r0 = r20
                com.getjar.sdk.comm.persistence.EarnBucket r9 = r0._earnBucket
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r9 = r9.getNotificationState()
                boolean r8 = r8.equals(r9)
                if (r8 != 0) goto L_0x0178
                java.util.Locale r8 = java.util.Locale.US
                java.lang.String r9 = "Thank you for installing %1$s again. No gold was earned."
                r15 = 1
                java.lang.Object[] r15 = new java.lang.Object[r15]
                r16 = 0
                r15[r16] = r5
                java.lang.String r8 = java.lang.String.format(r8, r9, r15)
                r0 = r23
                com.getjar.sdk.utilities.NotificationsUtility.pushFailNotification(r0, r8)
                android.content.Context r8 = r23.getApplicationContext()
                com.getjar.sdk.comm.persistence.DBTransactions r8 = com.getjar.sdk.comm.persistence.DBTransactions.getInstance(r8)
                r0 = r20
                com.getjar.sdk.comm.persistence.EarnBucket r9 = r0._earnBucket
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r15 = com.getjar.sdk.comm.persistence.DBTransactions.NotificationState.FAILED
                r8.updateEarnTransactionNotificationState(r9, r15)
            L_0x0178:
                r0 = r20
                com.getjar.sdk.comm.persistence.RelatedEarnData r8 = r0._earnData
                java.lang.String r8 = r8.getPackageName()
                com.getjar.sdk.data.earning.EarnStateDatabase$EarnState r9 = com.getjar.sdk.data.earning.EarnStateDatabase.EarnState.FAIL
                r0 = r20
                r1 = r23
                r2 = r21
                r0.updateEarnStateInAppStatePersistence(r1, r8, r2, r9)
                goto L_0x0112
            L_0x018c:
                r8 = 0
                int r8 = (r6 > r8 ? 1 : (r6 == r8 ? 0 : -1))
                if (r8 <= 0) goto L_0x0112
                r11 = 0
                r12 = 0
                android.content.Context r8 = r23.getApplicationContext()     // Catch:{ Exception -> 0x0251 }
                android.content.pm.PackageManager r13 = r8.getPackageManager()     // Catch:{ Exception -> 0x0251 }
                android.content.Context r8 = r23.getApplicationContext()     // Catch:{ Exception -> 0x0251 }
                java.lang.String r8 = r8.getPackageName()     // Catch:{ Exception -> 0x0251 }
                r9 = 128(0x80, float:1.794E-43)
                android.content.pm.PackageInfo r12 = r13.getPackageInfo(r8, r9)     // Catch:{ Exception -> 0x0251 }
                android.content.pm.ApplicationInfo r8 = r12.applicationInfo     // Catch:{ Exception -> 0x0251 }
                java.lang.CharSequence r8 = r8.loadLabel(r13)     // Catch:{ Exception -> 0x0251 }
                r0 = r8
                java.lang.String r0 = (java.lang.String) r0     // Catch:{ Exception -> 0x0251 }
                r11 = r0
            L_0x01b4:
                r14 = 0
                boolean r8 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r11)
                if (r8 == 0) goto L_0x0266
                java.util.Locale r8 = java.util.Locale.US
                java.lang.String r9 = "You've earned %1$d Gold!"
                r15 = 1
                java.lang.Object[] r15 = new java.lang.Object[r15]
                r16 = 0
                java.lang.Long r17 = java.lang.Long.valueOf(r6)
                r15[r16] = r17
                java.lang.String r14 = java.lang.String.format(r8, r9, r15)
            L_0x01ce:
                r0 = r20
                com.getjar.sdk.comm.persistence.EarnBucket r8 = r0._earnBucket
                boolean r8 = r8.getIsNewTransaction()
                if (r8 != 0) goto L_0x01ed
                java.util.Locale r8 = java.util.Locale.US
                java.lang.String r9 = "%1$s %2$s"
                r15 = 2
                java.lang.Object[] r15 = new java.lang.Object[r15]
                r16 = 0
                r15[r16] = r14
                r16 = 1
                java.lang.String r17 = "Thanks for your patience!"
                r15[r16] = r17
                java.lang.String r14 = java.lang.String.format(r8, r9, r15)
            L_0x01ed:
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r8 = com.getjar.sdk.comm.persistence.DBTransactions.NotificationState.SUCCEEDED
                r0 = r20
                com.getjar.sdk.comm.persistence.EarnBucket r9 = r0._earnBucket
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r9 = r9.getNotificationState()
                boolean r8 = r8.equals(r9)
                if (r8 != 0) goto L_0x0229
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r8 = com.getjar.sdk.comm.persistence.DBTransactions.NotificationState.FAILED
                r0 = r20
                com.getjar.sdk.comm.persistence.EarnBucket r9 = r0._earnBucket
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r9 = r9.getNotificationState()
                boolean r8 = r8.equals(r9)
                if (r8 != 0) goto L_0x0229
                r0 = r23
                com.getjar.sdk.utilities.NotificationsUtility.pushSuccessNotification(r0, r14)
                android.content.Context r8 = r23.getApplicationContext()
                com.getjar.sdk.comm.persistence.DBTransactions r8 = com.getjar.sdk.comm.persistence.DBTransactions.getInstance(r8)
                r0 = r20
                com.getjar.sdk.comm.persistence.EarnBucket r9 = r0._earnBucket
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r15 = com.getjar.sdk.comm.persistence.DBTransactions.NotificationState.SUCCEEDED
                r8.updateEarnTransactionNotificationState(r9, r15)
                java.lang.String r8 = r12.packageName
                r9 = 0
                com.getjar.sdk.rewards.GetJarWebViewSubActivity.updateUIWithEarnResults(r3, r4, r5, r6, r8, r9)
            L_0x0229:
                r0 = r20
                com.getjar.sdk.comm.persistence.RelatedEarnData r8 = r0._earnData
                java.lang.String r8 = r8.getPackageName()
                com.getjar.sdk.data.earning.EarnStateDatabase$EarnState r9 = com.getjar.sdk.data.earning.EarnStateDatabase.EarnState.SUCCESS
                r0 = r20
                r1 = r23
                r2 = r21
                r0.updateEarnStateInAppStatePersistence(r1, r8, r2, r9)
                android.content.Context r8 = r23.getApplicationContext()
                com.getjar.sdk.data.earning.EarnStateDatabase r8 = com.getjar.sdk.data.earning.EarnStateDatabase.getInstance(r8)
                r0 = r20
                com.getjar.sdk.comm.persistence.RelatedEarnData r9 = r0._earnData
                java.lang.String r9 = r9.getPackageName()
                r8.updateEarnAmount(r9, r6)
                goto L_0x0112
            L_0x0251:
                r10 = move-exception
                com.getjar.sdk.logging.Area r8 = com.getjar.sdk.logging.Area.TRANSACTION
                long r8 = r8.value()
                com.getjar.sdk.logging.Area r15 = com.getjar.sdk.logging.Area.EARN
                long r15 = r15.value()
                long r8 = r8 | r15
                java.lang.String r15 = "TransactionManager: EarnCallback: Failed to get the name of the Hosting Application"
                com.getjar.sdk.logging.Logger.m643e(r8, r15, r10)
                goto L_0x01b4
            L_0x0266:
                java.util.Locale r8 = java.util.Locale.US
                java.lang.String r9 = "%1$d Gold earned via %2$s!"
                r15 = 2
                java.lang.Object[] r15 = new java.lang.Object[r15]
                r16 = 0
                java.lang.Long r17 = java.lang.Long.valueOf(r6)
                r15[r16] = r17
                r16 = 1
                r15[r16] = r11
                java.lang.String r14 = java.lang.String.format(r8, r9, r15)
                goto L_0x01ce
            L_0x027f:
                r8 = move-exception
                goto L_0x0072
            */
            throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.TransactionManager.EarnCallback.serviceRequestSucceeded(com.getjar.sdk.comm.Result, java.lang.String, com.getjar.sdk.comm.CommContext):void");
        }

        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v2, resolved type: java.lang.String} */
        /* JADX WARNING: Multi-variable type inference failed */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void serviceRequestFailed(com.getjar.sdk.comm.Result r13, java.lang.Exception r14, java.lang.String r15, com.getjar.sdk.comm.CommContext r16) {
            /*
                r12 = this;
                com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION
                long r5 = r5.value()
                com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.EARN
                long r7 = r7.value()
                long r5 = r5 | r7
                java.util.Locale r7 = java.util.Locale.US
                java.lang.String r8 = "TransactionManager: EarnCallback: request failed [clientTransactionId: %1$s]"
                r9 = 1
                java.lang.Object[] r9 = new java.lang.Object[r9]
                r10 = 0
                com.getjar.sdk.comm.persistence.EarnBucket r11 = r12._earnBucket
                java.lang.String r11 = r11.getClientTransactionId()
                r9[r10] = r11
                java.lang.String r7 = java.lang.String.format(r7, r8, r9)
                com.getjar.sdk.logging.Logger.m640d(r5, r7)
                android.content.Context r5 = r16.getApplicationContext()
                android.content.pm.PackageManager r4 = r5.getPackageManager()
                com.getjar.sdk.comm.persistence.RelatedEarnData r5 = r12._earnData
                java.lang.String r2 = r5.getPackageName()
                com.getjar.sdk.comm.persistence.RelatedEarnData r5 = r12._earnData     // Catch:{ NameNotFoundException -> 0x00a8 }
                java.lang.String r5 = r5.getPackageName()     // Catch:{ NameNotFoundException -> 0x00a8 }
                r6 = 128(0x80, float:1.794E-43)
                android.content.pm.PackageInfo r3 = r4.getPackageInfo(r5, r6)     // Catch:{ NameNotFoundException -> 0x00a8 }
                android.content.pm.ApplicationInfo r5 = r3.applicationInfo     // Catch:{ NameNotFoundException -> 0x00a8 }
                java.lang.CharSequence r5 = r5.loadLabel(r4)     // Catch:{ NameNotFoundException -> 0x00a8 }
                r0 = r5
                java.lang.String r0 = (java.lang.String) r0     // Catch:{ NameNotFoundException -> 0x00a8 }
                r2 = r0
            L_0x0048:
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r5 = com.getjar.sdk.comm.persistence.DBTransactions.NotificationState.NONE
                com.getjar.sdk.comm.persistence.EarnBucket r6 = r12._earnBucket
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r6 = r6.getNotificationState()
                boolean r5 = r5.equals(r6)
                if (r5 == 0) goto L_0x0086
                com.getjar.sdk.comm.persistence.RelatedEarnData r5 = r12._earnData
                java.lang.String r5 = r5.getPackageName()
                java.lang.String r6 = "com.getjar.rewards"
                boolean r5 = r5.equals(r6)
                if (r5 != 0) goto L_0x0086
                java.util.Locale r5 = java.util.Locale.US
                java.lang.String r6 = "Thank you for installing %1$s! No gold was earned."
                r7 = 1
                java.lang.Object[] r7 = new java.lang.Object[r7]
                r8 = 0
                r7[r8] = r2
                java.lang.String r5 = java.lang.String.format(r5, r6, r7)
                r0 = r16
                com.getjar.sdk.utilities.NotificationsUtility.pushFailNotification(r0, r5)
                android.content.Context r5 = r16.getApplicationContext()
                com.getjar.sdk.comm.persistence.DBTransactions r5 = com.getjar.sdk.comm.persistence.DBTransactions.getInstance(r5)
                com.getjar.sdk.comm.persistence.EarnBucket r6 = r12._earnBucket
                com.getjar.sdk.comm.persistence.DBTransactions$NotificationState r7 = com.getjar.sdk.comm.persistence.DBTransactions.NotificationState.NO_GOLD
                r5.updateEarnTransactionNotificationState(r6, r7)
            L_0x0086:
                if (r14 == 0) goto L_0x00a7
                java.lang.Class<com.getjar.sdk.exceptions.ServiceException> r5 = com.getjar.sdk.exceptions.ServiceException.class
                java.lang.Class r6 = r14.getClass()
                boolean r5 = r5.isAssignableFrom(r6)
                if (r5 == 0) goto L_0x00a7
                com.getjar.sdk.comm.persistence.RelatedEarnData r5 = r12._earnData
                java.lang.String r5 = r5.getPackageName()
                com.getjar.sdk.exceptions.ServiceException r14 = (com.getjar.sdk.exceptions.ServiceException) r14
                com.getjar.sdk.comm.Result r6 = r14.getRequestResult()
                com.getjar.sdk.data.earning.EarnStateDatabase$EarnState r7 = com.getjar.sdk.data.earning.EarnStateDatabase.EarnState.FAIL
                r0 = r16
                r12.updateEarnStateInAppStatePersistence(r0, r5, r6, r7)
            L_0x00a7:
                return
            L_0x00a8:
                r1 = move-exception
                com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION
                long r5 = r5.value()
                com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.EARN
                long r7 = r7.value()
                long r5 = r5 | r7
                java.lang.String r7 = "Package info not found"
                com.getjar.sdk.logging.Logger.m643e(r5, r7, r1)
                goto L_0x0048
            */
            throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.TransactionManager.EarnCallback.serviceRequestFailed(com.getjar.sdk.comm.Result, java.lang.Exception, java.lang.String, com.getjar.sdk.comm.CommContext):void");
        }

        public void serviceRequestRetry(Exception cause, String requestId, CommContext commContext, int retryCount) {
            Logger.m640d(Area.TRANSACTION.value() | Area.EARN.value(), String.format(Locale.US, "TransactionManager: EarnCallback: retrying request [clientTransactionId: %1$s]", new Object[]{this._earnBucket.getClientTransactionId()}));
        }

        private void updateEarnStateInAppStatePersistence(CommContext commContext, String packageName, Result result, EarnStateDatabase.EarnState state) {
            if (result != null) {
                EarnStateDatabase.getInstance(commContext.getApplicationContext()).updateEarnState(packageName, state, TransactionManager.getTransactionSubstate(result, "NONE"));
            }
        }
    }
}
