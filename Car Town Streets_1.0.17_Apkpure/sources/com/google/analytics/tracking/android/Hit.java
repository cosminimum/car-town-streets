package com.google.analytics.tracking.android;

import android.text.TextUtils;
/* loaded from: classes.dex */
class Hit {
    private final long mHitId;
    private String mHitString;
    private final long mHitTime;
    private String mHitUrlScheme = "https:";

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getHitParams() {
        return this.mHitString;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setHitString(String hitString) {
        this.mHitString = hitString;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getHitId() {
        return this.mHitId;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getHitTime() {
        return this.mHitTime;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Hit(String hitString, long hitId, long hitTime) {
        this.mHitString = hitString;
        this.mHitId = hitId;
        this.mHitTime = hitTime;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getHitUrlScheme() {
        return this.mHitUrlScheme;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setHitUrl(String hitUrl) {
        if (hitUrl != null && !TextUtils.isEmpty(hitUrl.trim()) && hitUrl.toLowerCase().startsWith("http:")) {
            this.mHitUrlScheme = "http:";
        }
    }
}
