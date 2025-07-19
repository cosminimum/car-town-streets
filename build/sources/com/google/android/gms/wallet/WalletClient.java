package com.google.android.gms.wallet;

import android.app.Activity;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.internal.C1435iu;

@Deprecated
public class WalletClient implements GooglePlayServicesClient {

    /* renamed from: Hj */
    private final C1435iu f3907Hj;

    public WalletClient(Activity activity, int environment, String accountName, int theme, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
        this.f3907Hj = new C1435iu(activity, connectionCallbacks, connectionFailedListener, environment, accountName, theme);
    }

    public WalletClient(Activity activity, int environment, String accountName, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
        this(activity, environment, accountName, 0, connectionCallbacks, connectionFailedListener);
    }

    public void changeMaskedWallet(String googleTransactionId, String merchantTransactionId, int requestCode) {
        this.f3907Hj.changeMaskedWallet(googleTransactionId, merchantTransactionId, requestCode);
    }

    public void checkForPreAuthorization(int requestCode) {
        this.f3907Hj.checkForPreAuthorization(requestCode);
    }

    public void connect() {
        this.f3907Hj.connect();
    }

    public void disconnect() {
        this.f3907Hj.disconnect();
    }

    public boolean isConnected() {
        return this.f3907Hj.isConnected();
    }

    public boolean isConnecting() {
        return this.f3907Hj.isConnecting();
    }

    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.f3907Hj.isConnectionCallbacksRegistered(listener);
    }

    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.f3907Hj.isConnectionFailedListenerRegistered(listener);
    }

    public void loadFullWallet(FullWalletRequest request, int requestCode) {
        this.f3907Hj.loadFullWallet(request, requestCode);
    }

    public void loadMaskedWallet(MaskedWalletRequest request, int requestCode) {
        this.f3907Hj.loadMaskedWallet(request, requestCode);
    }

    public void notifyTransactionStatus(NotifyTransactionStatusRequest request) {
        this.f3907Hj.notifyTransactionStatus(request);
    }

    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f3907Hj.registerConnectionCallbacks(listener);
    }

    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f3907Hj.registerConnectionFailedListener(listener);
    }

    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f3907Hj.unregisterConnectionCallbacks(listener);
    }

    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f3907Hj.unregisterConnectionFailedListener(listener);
    }
}
