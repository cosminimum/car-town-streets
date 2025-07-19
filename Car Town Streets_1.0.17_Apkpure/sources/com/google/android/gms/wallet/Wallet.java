package com.google.android.gms.wallet;

import android.app.Activity;
import android.content.Context;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.internal.dt;
import com.google.android.gms.internal.eg;
import com.google.android.gms.internal.iu;
/* loaded from: classes.dex */
public final class Wallet {
    static final Api.b<iu> jO = new Api.b<iu>() { // from class: com.google.android.gms.wallet.Wallet.1
        @Override // com.google.android.gms.common.api.Api.b
        public int getPriority() {
            return Integer.MAX_VALUE;
        }

        @Override // com.google.android.gms.common.api.Api.b
        /* renamed from: h */
        public iu b(Context context, dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            eg.b(context instanceof Activity, "An Activity must be used for Wallet APIs");
            Activity activity = (Activity) context;
            eg.b(apiOptions == null || (apiOptions instanceof WalletOptions), "WalletOptions must be used for Wallet APIs");
            WalletOptions walletOptions = apiOptions != null ? (WalletOptions) apiOptions : new WalletOptions();
            return new iu(activity, connectionCallbacks, onConnectionFailedListener, walletOptions.environment, dtVar.getAccountName(), walletOptions.theme);
        }
    };
    public static final Api API = new Api(jO, new Scope[0]);

    /* loaded from: classes.dex */
    public static final class WalletOptions implements GoogleApiClient.ApiOptions {
        public final int environment;
        public final int theme;

        /* loaded from: classes.dex */
        public static final class Builder {
            private int Hi = 0;
            private int mTheme = 0;

            public WalletOptions build() {
                return new WalletOptions(this);
            }

            public Builder setEnvironment(int environment) {
                if (environment == 0 || environment == 2 || environment == 1) {
                    this.Hi = environment;
                    return this;
                }
                throw new IllegalArgumentException(String.format("Invalid environment value %d", Integer.valueOf(environment)));
            }

            public Builder setTheme(int theme) {
                if (theme == 0 || theme == 1) {
                    this.mTheme = theme;
                    return this;
                }
                throw new IllegalArgumentException(String.format("Invalid theme value %d", Integer.valueOf(theme)));
            }
        }

        private WalletOptions() {
            this(new Builder());
        }

        private WalletOptions(Builder builder) {
            this.environment = builder.Hi;
            this.theme = builder.mTheme;
        }
    }

    /* loaded from: classes.dex */
    private static abstract class a extends a.AbstractC0011a<Status, iu> {
        public a() {
            super(Wallet.jO);
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    private Wallet() {
    }

    public static void changeMaskedWallet(GoogleApiClient googleApiClient, final String googleTransactionId, final String merchantTransactionId, final int requestCode) {
        googleApiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.wallet.Wallet.5
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(iu iuVar) {
                iuVar.changeMaskedWallet(googleTransactionId, merchantTransactionId, requestCode);
                a((AnonymousClass5) Status.nA);
            }
        });
    }

    public static void checkForPreAuthorization(GoogleApiClient googleApiClient, final int requestCode) {
        googleApiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.wallet.Wallet.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(iu iuVar) {
                iuVar.checkForPreAuthorization(requestCode);
                a((AnonymousClass2) Status.nA);
            }
        });
    }

    public static void loadFullWallet(GoogleApiClient googleApiClient, final FullWalletRequest request, final int requestCode) {
        googleApiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.wallet.Wallet.4
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(iu iuVar) {
                iuVar.loadFullWallet(FullWalletRequest.this, requestCode);
                a((AnonymousClass4) Status.nA);
            }
        });
    }

    public static void loadMaskedWallet(GoogleApiClient googleApiClient, final MaskedWalletRequest request, final int requestCode) {
        googleApiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.wallet.Wallet.3
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(iu iuVar) {
                iuVar.loadMaskedWallet(MaskedWalletRequest.this, requestCode);
                a((AnonymousClass3) Status.nA);
            }
        });
    }

    public static void notifyTransactionStatus(GoogleApiClient googleApiClient, final NotifyTransactionStatusRequest request) {
        googleApiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.wallet.Wallet.6
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(iu iuVar) {
                iuVar.notifyTransactionStatus(NotifyTransactionStatusRequest.this);
                a((AnonymousClass6) Status.nA);
            }
        });
    }
}
