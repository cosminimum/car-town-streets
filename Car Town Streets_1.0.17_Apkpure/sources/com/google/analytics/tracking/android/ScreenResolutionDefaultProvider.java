package com.google.analytics.tracking.android;

import android.content.Context;
import android.util.DisplayMetrics;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.common.util.VisibleForTesting;
/* loaded from: classes.dex */
class ScreenResolutionDefaultProvider implements DefaultProvider {
    private static ScreenResolutionDefaultProvider sInstance;
    private static Object sInstanceLock = new Object();
    private final Context mContext;

    public static void initializeProvider(Context c) {
        synchronized (sInstanceLock) {
            if (sInstance == null) {
                sInstance = new ScreenResolutionDefaultProvider(c);
            }
        }
    }

    public static ScreenResolutionDefaultProvider getProvider() {
        ScreenResolutionDefaultProvider screenResolutionDefaultProvider;
        synchronized (sInstanceLock) {
            screenResolutionDefaultProvider = sInstance;
        }
        return screenResolutionDefaultProvider;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @VisibleForTesting
    public static void dropInstance() {
        synchronized (sInstanceLock) {
            sInstance = null;
        }
    }

    @VisibleForTesting
    protected ScreenResolutionDefaultProvider(Context c) {
        this.mContext = c;
    }

    @Override // com.google.analytics.tracking.android.DefaultProvider
    public boolean providesField(String field) {
        return Fields.SCREEN_RESOLUTION.equals(field);
    }

    @Override // com.google.analytics.tracking.android.DefaultProvider
    public String getValue(String field) {
        if (field != null && field.equals(Fields.SCREEN_RESOLUTION)) {
            return getScreenResolutionString();
        }
        return null;
    }

    protected String getScreenResolutionString() {
        DisplayMetrics dm = this.mContext.getResources().getDisplayMetrics();
        return dm.widthPixels + Constants.X + dm.heightPixels;
    }
}
