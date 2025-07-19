package com.google.android.gms.location;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class DetectedActivity implements SafeParcelable {
    public static final DetectedActivityCreator CREATOR = new DetectedActivityCreator();
    public static final int IN_VEHICLE = 0;
    public static final int ON_BICYCLE = 1;
    public static final int ON_FOOT = 2;
    public static final int STILL = 3;
    public static final int TILTING = 5;
    public static final int UNKNOWN = 4;

    /* renamed from: kg */
    private final int f3494kg;

    /* renamed from: xp */
    int f3495xp;

    /* renamed from: xq */
    int f3496xq;

    public DetectedActivity(int activityType, int confidence) {
        this.f3494kg = 1;
        this.f3495xp = activityType;
        this.f3496xq = confidence;
    }

    public DetectedActivity(int versionCode, int activityType, int confidence) {
        this.f3494kg = versionCode;
        this.f3495xp = activityType;
        this.f3496xq = confidence;
    }

    /* renamed from: aM */
    private int m4084aM(int i) {
        if (i > 6) {
            return 4;
        }
        return i;
    }

    public int describeContents() {
        return 0;
    }

    public int getConfidence() {
        return this.f3496xq;
    }

    public int getType() {
        return m4084aM(this.f3495xp);
    }

    public int getVersionCode() {
        return this.f3494kg;
    }

    public String toString() {
        return "DetectedActivity [type=" + getType() + ", confidence=" + this.f3496xq + "]";
    }

    public void writeToParcel(Parcel out, int flags) {
        DetectedActivityCreator.m4085a(this, out, flags);
    }
}
