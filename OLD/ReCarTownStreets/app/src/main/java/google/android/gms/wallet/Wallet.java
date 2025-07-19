package google.android.gms.wallet;

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

public final class Wallet {
    public static final Api API = new Api(jO, new Scope[0]);
    static final Api.b<iu> jO = new Api.b<iu>() {
        public int getPriority() {
            return Integer.MAX_VALUE;
        }

        /* renamed from: h */
        public iu b(Context context, dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            eg.b(context instanceof Activity, (Object) "An Activity must be used for Wallet APIs");
            Activity activity = (Activity) context;
            eg.b(apiOptions == null || (apiOptions instanceof WalletOptions), (Object) "WalletOptions must be used for Wallet APIs");
            WalletOptions walletOptions = apiOptions != null ? (WalletOptions) apiOptions : new WalletOptions();
            return new iu(activity, connectionCallbacks, onConnectionFailedListener, walletOptions.environment, dtVar.getAccountName(), walletOptions.theme);
        }
    };

    public static final class WalletOptions implements GoogleApiClient.ApiOptions {
        public final int environment;
        public final int theme;

        public static final class Builder {
            /* access modifiers changed from: private */
            public int Hi = 0;
            /* access modifiers changed from: private */
            public int mTheme = 0;

            public WalletOptions build() {
                return new WalletOptions(this);
            }

            public Builder setEnvironment(int environment) {
                if (environment == 0 || environment == 2 || environment == 1) {
                    this.Hi = environment;
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
            this.environment = builder.Hi;
            this.theme = builder.mTheme;
        }
    }

    private static abstract class a extends a.C0011a<Status, iu> {
        public a() {
            super(Wallet.jO);
        }

        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    private Wallet() {
    }

    public static void changeMaskedWallet(GoogleApiClient googleApiClient, final String googleTransactionId, final String merchantTransactionId, final int requestCode) {
        googleApiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(iu iuVar) {
                iuVar.changeMaskedWallet(googleTransactionId, merchantTransactionId, requestCode);
                a(Status.nA);
            }
        });
    }

    public static void checkForPreAuthorization(GoogleApiClient googleApiClient, final int requestCode) {
        googleApiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(iu iuVar) {
                iuVar.checkForPreAuthorization(requestCode);
                a(Status.nA);
            }
        });
    }

    public static void loadFullWallet(GoogleApiClient googleApiClient, final FullWalletRequest request, final int requestCode) {
        googleApiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(iu iuVar) {
                iuVar.loadFullWallet(request, requestCode);
                a(Status.nA);
            }
        });
    }

    public static void loadMaskedWallet(GoogleApiClient googleApiClient, final MaskedWalletRequest request, final int requestCode) {
        googleApiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(iu iuVar) {
                iuVar.loadMaskedWallet(request, requestCode);
                a(Status.nA);
            }
        });
    }

    public static void notifyTransactionStatus(GoogleApiClient googleApiClient, final NotifyTransactionStatusRequest request) {
        googleApiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(iu iuVar) {
                iuVar.notifyTransactionStatus(request);
                a(Status.nA);
            }
        });
    }
}
