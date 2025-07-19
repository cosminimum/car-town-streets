package com.google.android.gms.internal;

import android.accounts.Account;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.auth.GoogleAuthUtil;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.internal.C1071dw;
import com.google.android.gms.internal.C1429is;
import com.google.android.gms.internal.C1432it;
import com.google.android.gms.wallet.FullWallet;
import com.google.android.gms.wallet.FullWalletRequest;
import com.google.android.gms.wallet.MaskedWallet;
import com.google.android.gms.wallet.MaskedWalletRequest;
import com.google.android.gms.wallet.NotifyTransactionStatusRequest;
import com.google.android.gms.wallet.WalletConstants;

/* renamed from: com.google.android.gms.internal.iu */
public class C1435iu extends C1071dw<C1429is> {

    /* renamed from: Hi */
    private final int f3420Hi;
    /* access modifiers changed from: private */

    /* renamed from: gs */
    public final Activity f3421gs;

    /* renamed from: jG */
    private final String f3422jG;
    private final int mTheme;

    /* renamed from: com.google.android.gms.internal.iu$a */
    final class C1436a extends C1432it.C1433a {

        /* renamed from: oZ */
        private final int f3424oZ;

        public C1436a(int i) {
            this.f3424oZ = i;
        }

        /* renamed from: a */
        public void mo8761a(int i, FullWallet fullWallet, Bundle bundle) {
            int i2;
            Intent intent;
            PendingIntent pendingIntent = null;
            if (bundle != null) {
                pendingIntent = (PendingIntent) bundle.getParcelable("com.google.android.gms.wallet.EXTRA_PENDING_INTENT");
            }
            ConnectionResult connectionResult = new ConnectionResult(i, pendingIntent);
            if (connectionResult.hasResolution()) {
                try {
                    connectionResult.startResolutionForResult(C1435iu.this.f3421gs, this.f3424oZ);
                } catch (IntentSender.SendIntentException e) {
                    Log.w("WalletClientImpl", "Exception starting pending intent", e);
                }
            } else {
                if (connectionResult.isSuccess()) {
                    i2 = -1;
                    intent = new Intent();
                    intent.putExtra(WalletConstants.EXTRA_FULL_WALLET, fullWallet);
                } else {
                    i2 = i == 408 ? 0 : 1;
                    intent = new Intent();
                    intent.putExtra(WalletConstants.EXTRA_ERROR_CODE, i);
                }
                PendingIntent createPendingResult = C1435iu.this.f3421gs.createPendingResult(this.f3424oZ, intent, 1073741824);
                if (createPendingResult == null) {
                    Log.w("WalletClientImpl", "Null pending result returned for onFullWalletLoaded");
                    return;
                }
                try {
                    createPendingResult.send(i2);
                } catch (PendingIntent.CanceledException e2) {
                    Log.w("WalletClientImpl", "Exception setting pending result", e2);
                }
            }
        }

        /* renamed from: a */
        public void mo8762a(int i, MaskedWallet maskedWallet, Bundle bundle) {
            int i2;
            Intent intent;
            PendingIntent pendingIntent = null;
            if (bundle != null) {
                pendingIntent = (PendingIntent) bundle.getParcelable("com.google.android.gms.wallet.EXTRA_PENDING_INTENT");
            }
            ConnectionResult connectionResult = new ConnectionResult(i, pendingIntent);
            if (connectionResult.hasResolution()) {
                try {
                    connectionResult.startResolutionForResult(C1435iu.this.f3421gs, this.f3424oZ);
                } catch (IntentSender.SendIntentException e) {
                    Log.w("WalletClientImpl", "Exception starting pending intent", e);
                }
            } else {
                if (connectionResult.isSuccess()) {
                    i2 = -1;
                    intent = new Intent();
                    intent.putExtra(WalletConstants.EXTRA_MASKED_WALLET, maskedWallet);
                } else {
                    i2 = i == 408 ? 0 : 1;
                    intent = new Intent();
                    intent.putExtra(WalletConstants.EXTRA_ERROR_CODE, i);
                }
                PendingIntent createPendingResult = C1435iu.this.f3421gs.createPendingResult(this.f3424oZ, intent, 1073741824);
                if (createPendingResult == null) {
                    Log.w("WalletClientImpl", "Null pending result returned for onMaskedWalletLoaded");
                    return;
                }
                try {
                    createPendingResult.send(i2);
                } catch (PendingIntent.CanceledException e2) {
                    Log.w("WalletClientImpl", "Exception setting pending result", e2);
                }
            }
        }

        /* renamed from: a */
        public void mo8763a(int i, boolean z, Bundle bundle) {
            Intent intent = new Intent();
            intent.putExtra(WalletConstants.EXTRA_IS_USER_PREAUTHORIZED, z);
            PendingIntent createPendingResult = C1435iu.this.f3421gs.createPendingResult(this.f3424oZ, intent, 1073741824);
            if (createPendingResult == null) {
                Log.w("WalletClientImpl", "Null pending result returned for onPreAuthorizationDetermined");
                return;
            }
            try {
                createPendingResult.send(-1);
            } catch (PendingIntent.CanceledException e) {
                Log.w("WalletClientImpl", "Exception setting pending result", e);
            }
        }
    }

    @Deprecated
    public C1435iu(Activity activity, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, int i, String str, int i2) {
        this(activity, (GoogleApiClient.ConnectionCallbacks) new C1071dw.C1074c(connectionCallbacks), (GoogleApiClient.OnConnectionFailedListener) new C1071dw.C1078g(onConnectionFailedListener), i, str, i2);
    }

    public C1435iu(Activity activity, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, int i, String str, int i2) {
        super((Context) activity, connectionCallbacks, onConnectionFailedListener, new String[0]);
        this.f3421gs = activity;
        this.f3420Hi = i;
        this.f3422jG = str;
        this.mTheme = i2;
    }

    /* renamed from: fT */
    private Bundle m3922fT() {
        Bundle bundle = new Bundle();
        bundle.putInt("com.google.android.gms.wallet.EXTRA_ENVIRONMENT", this.f3420Hi);
        bundle.putString("androidPackageName", this.f3421gs.getPackageName());
        if (!TextUtils.isEmpty(this.f3422jG)) {
            bundle.putParcelable("com.google.android.gms.wallet.EXTRA_BUYER_ACCOUNT", new Account(this.f3422jG, GoogleAuthUtil.GOOGLE_ACCOUNT_TYPE));
        }
        bundle.putInt("com.google.android.gms.wallet.EXTRA_THEME", this.mTheme);
        return bundle;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6202a(C1092ec ecVar, C1071dw.C1076e eVar) throws RemoteException {
        ecVar.mo7509a(eVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE);
    }

    /* access modifiers changed from: protected */
    /* renamed from: aB */
    public C1429is mo6207p(IBinder iBinder) {
        return C1429is.C1430a.m3908az(iBinder);
    }

    /* access modifiers changed from: protected */
    /* renamed from: am */
    public String mo6203am() {
        return "com.google.android.gms.wallet.service.BIND";
    }

    /* access modifiers changed from: protected */
    /* renamed from: an */
    public String mo6204an() {
        return "com.google.android.gms.wallet.internal.IOwService";
    }

    public void changeMaskedWallet(String googleTransactionId, String merchantTransactionId, int requestCode) {
        Bundle fT = m3922fT();
        C1436a aVar = new C1436a(requestCode);
        try {
            ((C1429is) mo7454bQ()).mo8758a(googleTransactionId, merchantTransactionId, fT, aVar);
        } catch (RemoteException e) {
            Log.e("WalletClientImpl", "RemoteException changing masked wallet", e);
            aVar.mo8762a(8, (MaskedWallet) null, (Bundle) null);
        }
    }

    public void checkForPreAuthorization(int requestCode) {
        Bundle fT = m3922fT();
        C1436a aVar = new C1436a(requestCode);
        try {
            ((C1429is) mo7454bQ()).mo8754a(fT, (C1432it) aVar);
        } catch (RemoteException e) {
            Log.e("WalletClientImpl", "RemoteException during checkForPreAuthorization", e);
            aVar.mo8763a(8, false, (Bundle) null);
        }
    }

    public void loadFullWallet(FullWalletRequest request, int requestCode) {
        C1436a aVar = new C1436a(requestCode);
        try {
            ((C1429is) mo7454bQ()).mo8755a(request, m3922fT(), (C1432it) aVar);
        } catch (RemoteException e) {
            Log.e("WalletClientImpl", "RemoteException getting full wallet", e);
            aVar.mo8761a(8, (FullWallet) null, (Bundle) null);
        }
    }

    public void loadMaskedWallet(MaskedWalletRequest request, int requestCode) {
        Bundle fT = m3922fT();
        C1436a aVar = new C1436a(requestCode);
        try {
            ((C1429is) mo7454bQ()).mo8756a(request, fT, (C1432it) aVar);
        } catch (RemoteException e) {
            Log.e("WalletClientImpl", "RemoteException getting masked wallet", e);
            aVar.mo8762a(8, (MaskedWallet) null, (Bundle) null);
        }
    }

    public void notifyTransactionStatus(NotifyTransactionStatusRequest request) {
        try {
            ((C1429is) mo7454bQ()).mo8757a(request, m3922fT());
        } catch (RemoteException e) {
        }
    }
}
