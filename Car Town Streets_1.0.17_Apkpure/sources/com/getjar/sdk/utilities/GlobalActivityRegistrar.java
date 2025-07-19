package com.getjar.sdk.utilities;

import android.app.Activity;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
/* loaded from: classes.dex */
public class GlobalActivityRegistrar {
    private List<Activity> _activitySet = new ArrayList();
    private static Object _InstanceLock = new Object();
    private static volatile GlobalActivityRegistrar _Instance = null;

    private GlobalActivityRegistrar() {
    }

    public static GlobalActivityRegistrar getInstance() {
        if (_Instance == null) {
            synchronized (_InstanceLock) {
                if (_Instance == null) {
                    _Instance = new GlobalActivityRegistrar();
                }
            }
        }
        return _Instance;
    }

    public void registerActivity(Activity activity) {
        try {
            this._activitySet.add(activity);
            Logger.v(Area.UI.value(), String.format(Locale.US, "GlobalActivityRegistrar: registerActivity() registered '%1$s'", activity.getClass().getSimpleName()));
        } catch (Exception e) {
            Logger.w(Area.UI.value(), String.format(Locale.US, "GlobalActivityRegistrar: add() failed [%1$s]", e.getMessage()));
        }
    }

    public void finishAllActivities() {
        for (Activity activity : this._activitySet) {
            try {
                activity.finish();
                Logger.v(Area.UI.value(), String.format(Locale.US, "GlobalActivityRegistrar: finishAllActivities() finished '%1$s'", activity.getClass().getSimpleName()));
            } catch (Exception e) {
                Logger.w(Area.UI.value(), String.format(Locale.US, "GlobalActivityRegistrar: activity.finish() failed [%1$s]", e.getMessage()));
            }
        }
        this._activitySet.clear();
        Logger.v(Area.UI.value(), "GlobalActivityRegistrar: finishAllActivities() registrar cleared");
    }
}
