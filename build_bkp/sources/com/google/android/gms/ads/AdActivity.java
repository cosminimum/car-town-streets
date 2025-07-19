package com.google.android.gms.ads;

import android.app.Activity;
import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.internal.C0951br;
import com.google.android.gms.internal.C0953bs;
import com.google.android.gms.internal.C1004ct;

public final class AdActivity extends Activity {
    public static final String CLASS_NAME = "com.google.android.gms.ads.AdActivity";
    public static final String SIMPLE_CLASS_NAME = "AdActivity";

    /* renamed from: dV */
    private C0953bs f1107dV;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.f1107dV = C0951br.m2073a(this);
        if (this.f1107dV == null) {
            C1004ct.m2218v("Could not create ad overlay.");
            finish();
            return;
        }
        try {
            this.f1107dV.onCreate(savedInstanceState);
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not forward onCreate to ad overlay:", e);
            finish();
        }
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        try {
            if (this.f1107dV != null) {
                this.f1107dV.onDestroy();
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not forward onDestroy to ad overlay:", e);
        }
        super.onDestroy();
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        try {
            if (this.f1107dV != null) {
                this.f1107dV.onPause();
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not forward onPause to ad overlay:", e);
            finish();
        }
        super.onPause();
    }

    /* access modifiers changed from: protected */
    public void onRestart() {
        super.onRestart();
        try {
            if (this.f1107dV != null) {
                this.f1107dV.onRestart();
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not forward onRestart to ad overlay:", e);
            finish();
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        try {
            if (this.f1107dV != null) {
                this.f1107dV.onResume();
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not forward onResume to ad overlay:", e);
            finish();
        }
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle outState) {
        try {
            if (this.f1107dV != null) {
                this.f1107dV.onSaveInstanceState(outState);
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not forward onSaveInstanceState to ad overlay:", e);
            finish();
        }
        super.onSaveInstanceState(outState);
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        super.onStart();
        try {
            if (this.f1107dV != null) {
                this.f1107dV.onStart();
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not forward onStart to ad overlay:", e);
            finish();
        }
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        try {
            if (this.f1107dV != null) {
                this.f1107dV.onStop();
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not forward onStop to ad overlay:", e);
            finish();
        }
        super.onStop();
    }
}
