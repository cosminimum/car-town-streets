package com.getjar.sdk.utilities;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.Window;
import android.view.WindowManager;
import com.getjar.sdk.data.MetadataValue;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import java.text.DecimalFormat;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class ScreenUtility {
    private static DecimalFormat decimalFormat = new DecimalFormat("##.###");

    public static HashMap<String, MetadataValue> getDisplayDetails(Context androidContext) {
        if (androidContext == null) {
            throw new IllegalArgumentException("'context' cannot be null");
        }
        HashMap<String, MetadataValue> output = new HashMap<>();
        ScreenData screenData = getScreenData(androidContext);
        output.put(Constants.SCREEN_DPI_WIDTH, new MetadataValue(Double.toString(screenData.getXDpi()), MetadataValue.MetadataReliability.AVAILABLE));
        output.put(Constants.SCREEN_DPI_HEIGHT, new MetadataValue(Double.toString(screenData.getYDpi()), MetadataValue.MetadataReliability.AVAILABLE));
        output.put(Constants.SCREEN_RESOLUTION_WIDTH, new MetadataValue(Integer.toString(screenData.getResolutionX()), MetadataValue.MetadataReliability.AVAILABLE));
        output.put(Constants.SCREEN_RESOLUTION_HEIGHT, new MetadataValue(Integer.toString(screenData.getResolutionY()), MetadataValue.MetadataReliability.AVAILABLE));
        return output;
    }

    public static JSONObject getDisplayMetrics(Context androidContext) {
        if (androidContext == null) {
            throw new IllegalArgumentException("'context' cannot be null");
        }
        JSONObject output = new JSONObject();
        JSONObject screenRes = new JSONObject();
        JSONObject availableRes = new JSONObject();
        JSONObject screenDpi = new JSONObject();
        JSONObject screenSize = new JSONObject();
        ScreenData screenData = getScreenData(androidContext);
        try {
            availableRes.put("width", screenData.getAvailableResX());
            availableRes.put("height", screenData.getAvailableResY());
        } catch (JSONException e1) {
            Logger.d(Area.UI.value() | Area.CONFIG.value(), "ScreenUtility getDisplayMetrics() -- Error getting availableRes " + e1.getLocalizedMessage());
        }
        try {
            screenRes.put("width", screenData.getResolutionX());
            screenRes.put("height", screenData.getResolutionY());
        } catch (JSONException e12) {
            Logger.d(Area.UI.value() | Area.CONFIG.value(), "ScreenUtility getDisplayMetrics() -- Error getting screenRes " + e12.getLocalizedMessage());
        }
        try {
            screenDpi.put(Constants.X, decimalFormat.format(screenData.getXDpi()));
            screenDpi.put(Constants.Y, decimalFormat.format(screenData.getYDpi()));
        } catch (JSONException e13) {
            Logger.d(Area.UI.value() | Area.CONFIG.value(), "ScreenUtility getDisplayMetrics() -- Error getting screenDpi " + e13.getLocalizedMessage());
        }
        try {
            screenSize.put("height", decimalFormat.format(screenData.getScreenHeight()));
            screenSize.put("width", decimalFormat.format(screenData.getScreenWidth()));
        } catch (JSONException e14) {
            Logger.d(Area.UI.value() | Area.CONFIG.value(), "ScreenUtility getDisplayMetrics() -- Error getting screenSize " + e14.getLocalizedMessage());
        }
        try {
            output.put(Constants.SCREEN_DPI, screenDpi);
            output.put(Constants.SCREEN_RESOLUTION, screenRes);
            output.put(Constants.AVAILABLE_RESOLUTION, availableRes);
            output.put(Constants.SCREEN_SIZE, screenSize);
        } catch (JSONException e) {
            Logger.d(Area.UI.value() | Area.CONFIG.value(), "ScreenUtility getDisplayMetrics() -- Error getting all json objects together " + e.getLocalizedMessage());
        }
        Logger.d(Area.UI.value() | Area.CONFIG.value(), "Screen details: " + output.toString());
        return output;
    }

    private static ScreenData getScreenData(Context androidContext) {
        if (androidContext == null) {
            throw new IllegalArgumentException("'context' cannot be null");
        }
        DisplayMetrics displayMetrics = new DisplayMetrics();
        WindowManager window = (WindowManager) androidContext.getSystemService("window");
        Display display = window.getDefaultDisplay();
        display.getMetrics(displayMetrics);
        Activity activity = null;
        if (Activity.class.isAssignableFrom(androidContext.getClass())) {
            activity = (Activity) androidContext;
        }
        Integer availableResX = null;
        Integer availableResY = null;
        if (activity != null) {
            Rect rect = new Rect();
            Window win = activity.getWindow();
            win.getDecorView().getWindowVisibleDisplayFrame(rect);
            int contentViewTop = win.findViewById(16908290).getTop();
            availableResX = Integer.valueOf(displayMetrics.widthPixels);
            availableResY = Integer.valueOf(displayMetrics.heightPixels - contentViewTop);
        }
        double screenHeight = displayMetrics.heightPixels / displayMetrics.ydpi;
        double screenWidth = displayMetrics.widthPixels / displayMetrics.xdpi;
        ScreenData screenData = new ScreenData(displayMetrics.xdpi, displayMetrics.ydpi, displayMetrics.widthPixels, displayMetrics.heightPixels, screenWidth, screenHeight, availableResX, availableResY);
        return screenData;
    }
}
