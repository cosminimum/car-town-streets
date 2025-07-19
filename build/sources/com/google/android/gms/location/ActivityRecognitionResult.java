package com.google.android.gms.location;

import android.content.Intent;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1102eg;
import java.util.Collections;
import java.util.List;

public class ActivityRecognitionResult implements SafeParcelable {
    public static final ActivityRecognitionResultCreator CREATOR = new ActivityRecognitionResultCreator();
    public static final String EXTRA_ACTIVITY_RESULT = "com.google.android.location.internal.EXTRA_ACTIVITY_RESULT";

    /* renamed from: kg */
    private final int f3490kg;

    /* renamed from: xm */
    List<DetectedActivity> f3491xm;

    /* renamed from: xn */
    long f3492xn;

    /* renamed from: xo */
    long f3493xo;

    public ActivityRecognitionResult(int versionCode, List<DetectedActivity> probableActivities, long timeMillis, long elapsedRealtimeMillis) {
        this.f3490kg = 1;
        this.f3491xm = probableActivities;
        this.f3492xn = timeMillis;
        this.f3493xo = elapsedRealtimeMillis;
    }

    public ActivityRecognitionResult(DetectedActivity mostProbableActivity, long time, long elapsedRealtimeMillis) {
        this((List<DetectedActivity>) Collections.singletonList(mostProbableActivity), time, elapsedRealtimeMillis);
    }

    public ActivityRecognitionResult(List<DetectedActivity> probableActivities, long time, long elapsedRealtimeMillis) {
        C1102eg.m2615b(probableActivities != null && probableActivities.size() > 0, (Object) "Must have at least 1 detected activity");
        this.f3490kg = 1;
        this.f3491xm = probableActivities;
        this.f3492xn = time;
        this.f3493xo = elapsedRealtimeMillis;
    }

    public static ActivityRecognitionResult extractResult(Intent intent) {
        if (!hasResult(intent)) {
            return null;
        }
        return (ActivityRecognitionResult) intent.getExtras().get(EXTRA_ACTIVITY_RESULT);
    }

    public static boolean hasResult(Intent intent) {
        if (intent == null) {
            return false;
        }
        return intent.hasExtra(EXTRA_ACTIVITY_RESULT);
    }

    public int describeContents() {
        return 0;
    }

    public int getActivityConfidence(int activityType) {
        for (DetectedActivity next : this.f3491xm) {
            if (next.getType() == activityType) {
                return next.getConfidence();
            }
        }
        return 0;
    }

    public long getElapsedRealtimeMillis() {
        return this.f3493xo;
    }

    public DetectedActivity getMostProbableActivity() {
        return this.f3491xm.get(0);
    }

    public List<DetectedActivity> getProbableActivities() {
        return this.f3491xm;
    }

    public long getTime() {
        return this.f3492xn;
    }

    public int getVersionCode() {
        return this.f3490kg;
    }

    public String toString() {
        return "ActivityRecognitionResult [probableActivities=" + this.f3491xm + ", timeMillis=" + this.f3492xn + ", elapsedRealtimeMillis=" + this.f3493xo + "]";
    }

    public void writeToParcel(Parcel out, int flags) {
        ActivityRecognitionResultCreator.m4083a(this, out, flags);
    }
}
