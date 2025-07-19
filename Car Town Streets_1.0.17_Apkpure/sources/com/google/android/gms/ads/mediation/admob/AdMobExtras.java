package com.google.android.gms.ads.mediation.admob;

import android.os.Bundle;
import com.google.ads.mediation.NetworkExtras;
/* loaded from: classes.dex */
public final class AdMobExtras implements NetworkExtras {
    private final Bundle jh;

    public AdMobExtras(Bundle extras) {
        this.jh = extras != null ? new Bundle(extras) : null;
    }

    public Bundle getExtras() {
        return this.jh;
    }
}
