package com.google.tagmanager;

import android.text.TextUtils;
/* loaded from: classes.dex */
class Hit {
    private final long mHitFirstDispatchTime;
    private final long mHitId;
    private final long mHitTime;
    private String mHitUrl;

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getHitId() {
        return this.mHitId;
    }

    long getHitTime() {
        return this.mHitTime;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getHitFirstDispatchTime() {
        return this.mHitFirstDispatchTime;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Hit(long hitId, long hitTime, long firstDispatchTime) {
        this.mHitId = hitId;
        this.mHitTime = hitTime;
        this.mHitFirstDispatchTime = firstDispatchTime;
    }

    Hit(long hitId, long hitTime) {
        this.mHitId = hitId;
        this.mHitTime = hitTime;
        this.mHitFirstDispatchTime = 0L;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getHitUrl() {
        return this.mHitUrl;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setHitUrl(String hitUrl) {
        if (hitUrl != null && !TextUtils.isEmpty(hitUrl.trim())) {
            this.mHitUrl = hitUrl;
        }
    }
}
