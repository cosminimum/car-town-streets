package com.google.android.gms.wallet;

import android.app.Activity;
import android.content.Context;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.C1067dt;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1435iu;

public final class Wallet {
    public static final Api API = new Api(f3896jO, new Scope[0]);

    /* renamed from: jO */
    static final Api.C0647b<C1435iu> f3896jO = new Api.C0647b<C1435iu>() {
        public int getPriority() {
            return Integer.MAX_VALUE;
        }

        /* renamed from: h */
        public C1435iu mo5621b(Context context, C1067dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            C1102eg.m2615b(context instanceof Activity, (Object) "An Activity must be used for Wallet APIs");
            Activity activity = (Activity) context;
            C1102eg.m2615b(apiOptions == null || (apiOptions instanceof WalletOptions), (Object) "WalletOptions must be used for Wallet APIs");
            WalletOptions walletOptions = apiOptions != null ? (WalletOptions) apiOptions : new WalletOptions();
            return new C1435iu(activity, connectionCallbacks, onConnectionFailedListener, walletOptions.environment, dtVar.getAccountName(), walletOptions.theme);
        }
    };

    public static final class WalletOptions implements GoogleApiClient.ApiOptions {
        public final int environment;
        public final int theme;

        public static final class Builder {
            /* access modifiers changed from: private */

            /* renamed from: Hi */
            public int f3906Hi = 0;
            /* access modifiers changed from: private */
            public int mTheme = 0;

            public WalletOptions build() {
                return new WalletOptions(this);
            }

            public Builder setEnvironment(int environment) {
                if (environment == 0 || environment == 2 || environment == 1) {
                    this.f3906Hi = environment;
                    return this;
                }
                throw new IllegalArgumentException(String.format("Invalid environment value %d", new Object[]{Integer.valueOf(environment)}));
            }

            public Builder setTheme(int theme) {
                if (theme == 0 || theme == 1) {
                    this.mTheme = theme;
                    return this;
                }
                throw new IllegalArgumentException(String.format("Invalid theme value %d", new Object[]{Integer.valueOf(theme)}));
            }
        }

        private WalletOptions() {
            this(new Builder());
        }

        private WalletOptions(Builder builder) {
            this.environment = builder.f3906Hi;
            this.theme = builder.mTheme;
        }
    }

    /* renamed from: com.google.android.gms.wallet.Wallet$a */
    private static abstract class C1629a extends C0655a.C0656a<Status, C1435iu> {
        public C1629a() {
            super(Wallet.f3896jO);
        }

        /* renamed from: g */
        public Status mo5631e(Status status) {
            return status;
        }
    }

    private Wallet() {
    }

    public static void changeMaskedWallet(GoogleApiClient googleApiClient, final String googleTransactionId, final String merchantTransactionId, final int requestCode) {
        googleApiClient.mo5867a(new C1629a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1435iu iuVar) {
                iuVar.changeMaskedWallet(googleTransactionId, merchantTransactionId, requestCode);
                mo5612a(Status.f1350nA);
            }
        });
    }

    public static void checkForPreAuthorization(GoogleApiClient googleApiClient, final int requestCode) {
        googleApiClient.mo5867a(new C1629a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1435iu iuVar) {
                iuVar.checkForPreAuthorization(requestCode);
                mo5612a(Status.f1350nA);
            }
        });
    }

    public static void loadFullWallet(GoogleApiClient googleApiClient, final FullWalletRequest request, final int requestCode) {
        googleApiClient.mo5867a(new C1629a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1435iu iuVar) {
                iuVar.loadFullWallet(request, requestCode);
                mo5612a(Status.f1350nA);
            }
        });
    }

    public static void loadMaskedWallet(GoogleApiClient googleApiClient, final MaskedWalletRequest request, final int requestCode) {
        googleApiClient.mo5867a(new C1629a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1435iu iuVar) {
                iuVar.loadMaskedWallet(request, requestCode);
                mo5612a(Status.f1350nA);
            }
        });
    }

    public static void notifyTransactionStatus(GoogleApiClient googleApiClient, final NotifyTransactionStatusRequest request) {
        googleApiClient.mo5867a(new C1629a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1435iu iuVar) {
                iuVar.notifyTransactionStatus(request);
                mo5612a(Status.f1350nA);
            }
        });
    }
}
