package com.google.android.gms.common.api;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Parcel;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1098ee;

public final class Status implements Result, SafeParcelable {
    public static final StatusCreator CREATOR = new StatusCreator();

    /* renamed from: nA */
    public static final Status f1350nA = new Status(0, (String) null, (PendingIntent) null);

    /* renamed from: nB */
    public static final Status f1351nB = new Status(14, (String) null, (PendingIntent) null);

    /* renamed from: nC */
    public static final Status f1352nC = new Status(15, (String) null, (PendingIntent) null);

    /* renamed from: kg */
    private final int f1353kg;

    /* renamed from: mC */
    private final int f1354mC;
    private final PendingIntent mPendingIntent;

    /* renamed from: nD */
    private final String f1355nD;

    public Status(int statusCode) {
        this(1, statusCode, (String) null, (PendingIntent) null);
    }

    Status(int versionCode, int statusCode, String statusMessage, PendingIntent pendingIntent) {
        this.f1353kg = versionCode;
        this.f1354mC = statusCode;
        this.f1355nD = statusMessage;
        this.mPendingIntent = pendingIntent;
    }

    public Status(int statusCode, String statusMessage, PendingIntent pendingIntent) {
        this(1, statusCode, statusMessage, pendingIntent);
    }

    /* renamed from: bh */
    private String m1275bh() {
        return this.f1355nD != null ? this.f1355nD : CommonStatusCodes.getStatusCodeString(this.f1354mC);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: bs */
    public PendingIntent mo5906bs() {
        return this.mPendingIntent;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: bt */
    public String mo5907bt() {
        return this.f1355nD;
    }

    @Deprecated
    /* renamed from: bu */
    public ConnectionResult mo5908bu() {
        return new ConnectionResult(this.f1354mC, this.mPendingIntent);
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof Status)) {
            return false;
        }
        Status status = (Status) obj;
        return this.f1353kg == status.f1353kg && this.f1354mC == status.f1354mC && C1098ee.equal(this.f1355nD, status.f1355nD) && C1098ee.equal(this.mPendingIntent, status.mPendingIntent);
    }

    public PendingIntent getResolution() {
        return this.mPendingIntent;
    }

    public Status getStatus() {
        return this;
    }

    public int getStatusCode() {
        return this.f1354mC;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f1353kg;
    }

    public boolean hasResolution() {
        return this.mPendingIntent != null;
    }

    public int hashCode() {
        return C1098ee.hashCode(Integer.valueOf(this.f1353kg), Integer.valueOf(this.f1354mC), this.f1355nD, this.mPendingIntent);
    }

    public boolean isInterrupted() {
        return this.f1354mC == 14;
    }

    public boolean isSuccess() {
        return this.f1354mC <= 0;
    }

    public void startResolutionForResult(Activity activity, int requestCode) throws IntentSender.SendIntentException {
        if (hasResolution()) {
            activity.startIntentSenderForResult(this.mPendingIntent.getIntentSender(), requestCode, (Intent) null, 0, 0, 0);
        }
    }

    public String toString() {
        return C1098ee.m2604e(this).mo7535a("statusCode", m1275bh()).mo7535a("resolution", this.mPendingIntent).toString();
    }

    public void writeToParcel(Parcel out, int flags) {
        StatusCreator.m1279a(this, out, flags);
    }
}
