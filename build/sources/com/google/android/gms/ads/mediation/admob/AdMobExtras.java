package com.google.android.gms.ads.mediation.admob;

import android.os.Bundle;
import com.google.ads.mediation.NetworkExtras;

public final class AdMobExtras implements NetworkExtras {

    /* renamed from: jh */
    private final Bundle f1121jh;

    public AdMobExtras(Bundle extras) {
        this.f1121jh = extras != null ? new Bundle(extras) : null;
    }

    public Bundle getExtras() {
        return this.f1121jh;
    }
}
