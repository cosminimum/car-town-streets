package com.google.android.gms.wallet;

import android.app.Activity;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.internal.iu;

@Deprecated
public class WalletClient implements GooglePlayServicesClient {
    private final iu Hj;

    public WalletClient(Activity activity, int environment, String accountName, int theme, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
        this.Hj = new iu(activity, connectionCallbacks, connectionFailedListener, environment, accountName, theme);
    }

    public WalletClient(Activity activity, int environment, String accountName, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
        this(activity, environment, accountName, 0, connectionCallbacks, connectionFailedListener);
    }

    public void changeMaskedWallet(String googleTransactionId, String merchantTransactionId, int requestCode) {
        this.Hj.changeMaskedWallet(googleTransactionId, merchantTransactionId, requestCode);
    }

    public void checkForPreAuthorization(int requestCode) {
        this.Hj.checkForPreAuthorization(requestCode);
    }

    public void connect() {
        this.Hj.connect();
    }

    public void disconnect() {
        this.Hj.disconnect();
    }

    public boolean isConnected() {
        return this.Hj.isConnected();
    }

    public boolean isConnecting() {
        return this.Hj.isConnecting();
    }

    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.Hj.isConnectionCallbacksRegistered(listener);
    }

    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.Hj.isConnectionFailedListenerRegistered(listener);
    }

    public void loadFullWallet(FullWalletRequest request, int requestCode) {
        this.Hj.loadFullWallet(request, requestCode);
    }

    public void loadMaskedWallet(MaskedWalletRequest request, int requestCode) {
        this.Hj.loadMaskedWallet(request, requestCode);
    }

    public void notifyTransactionStatus(NotifyTransactionStatusRequest request) {
        this.Hj.notifyTransactionStatus(request);
    }

    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.Hj.registerConnectionCallbacks(listener);
    }

    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.Hj.registerConnectionFailedListener(listener);
    }

    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.Hj.unregisterConnectionCallbacks(listener);
    }

    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.Hj.unregisterConnectionFailedListener(listener);
    }
}
