package com.miniclip.Chartboost;

import android.app.Activity;
import android.content.SharedPreferences;
import android.util.Log;
import com.miniclip.nativeJNI.cocojava;
/* loaded from: classes.dex */
public class Chartboost {
    private static com.chartboost.sdk.Chartboost cb;
    private static int sessionCount;
    private static int triggerCount;
    private static String TAG = "Chartboost";
    public static boolean DEBUG = true;
    public static String APP_ID = null;
    public static String APP_SIGNATURE = null;
    private static Activity activity = null;
    private static int minSessionCount = 2;
    private static int maxTriggerCount = 5;

    public static void onCreate(Activity activity2, String appId, String appSignature) {
        activity = activity2;
        APP_ID = appId;
        APP_SIGNATURE = appSignature;
        cb = com.chartboost.sdk.Chartboost.sharedChartboost();
        cb.onCreate(activity2, appId, appSignature, null);
        cb.startSession();
        SharedPreferences preferences = activity2.getSharedPreferences("chartboost", 0);
        SharedPreferences.Editor editor = preferences.edit();
        sessionCount = preferences.getInt("sessionCount", 0);
        sessionCount++;
        editor.putInt("sessionCount", sessionCount);
        editor.commit();
        triggerCount = 0;
    }

    public static void onStart() {
        cb.onStart(activity);
    }

    public static void onStop() {
        cb.onStop(activity);
    }

    public static void onDestroy() {
        cb.onDestroy(activity);
    }

    public static boolean onBackPressed() {
        return cb.onBackPressed();
    }

    public static void setMinSessionCount(int minSessionCount2) {
        minSessionCount = minSessionCount2;
    }

    public static void setMaxTriggerCount(int maxTriggerCount2) {
        maxTriggerCount = maxTriggerCount2;
    }

    public static void addTriggerCount() {
        triggerCount++;
    }

    public static int getTriggerCount() {
        return triggerCount;
    }

    public static int showInterstitial(int useFullversion, int useSessionCount, int useTriggerCount) {
        boolean fullversion = cocojava.isFullVersion() == 1;
        debugLog("Trying to show chartboost ad. Use Fullversion = " + useFullversion + " Use Session Count = " + useSessionCount + " Use Trigger Count = " + useTriggerCount);
        if ((useFullversion == 0 || (useFullversion == 1 && !fullversion)) && ((useSessionCount == 0 || (useSessionCount == 1 && sessionCount >= minSessionCount)) && (useTriggerCount == 0 || (useTriggerCount == 1 && triggerCount > 0 && triggerCount % maxTriggerCount == 0)))) {
            cb.showInterstitial();
            debugLog("Showing chartboost ad. Fullversion = " + fullversion + " Session = " + sessionCount + " (min: " + minSessionCount + " ) Trigger = " + triggerCount + " (max: " + maxTriggerCount + " )");
            return 1;
        }
        debugLog("Not showing chartboost ad. Fullversion = " + fullversion + " Session = " + sessionCount + " (min: " + minSessionCount + " ) Trigger = " + triggerCount + " (max: " + maxTriggerCount + " )");
        return 0;
    }

    static void debugLog(String message) {
        if (DEBUG) {
            Log.d(TAG, message);
        }
    }
}
