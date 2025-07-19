package com.mopub.mobileads;

import android.util.Log;
import java.lang.reflect.Constructor;
import java.util.HashMap;
/* loaded from: classes.dex */
public abstract class BaseAdapter {
    private static final HashMap<String, String> sAdapterMap = new HashMap<>();
    protected boolean mInvalidated;
    protected String mJsonParams;
    protected MoPubView mMoPubView;

    public abstract void loadAd();

    static {
        sAdapterMap.put("admob_native", "com.mopub.mobileads.GoogleAdMobAdapter");
        sAdapterMap.put("millennial_native", "com.mopub.mobileads.MillennialAdapter");
        sAdapterMap.put("mraid", "com.mopub.mobileads.MraidAdapter");
    }

    public void init(MoPubView view, String jsonParams) {
        this.mMoPubView = view;
        this.mJsonParams = jsonParams;
        this.mInvalidated = false;
    }

    public void invalidate() {
        this.mMoPubView = null;
        this.mInvalidated = true;
    }

    public boolean isInvalidated() {
        return this.mInvalidated;
    }

    public static BaseAdapter getAdapterForType(String type) {
        Class<?> adapterClass;
        if (type != null && (adapterClass = classForAdapterType(type)) != null) {
            try {
                Constructor<?> constructor = adapterClass.getConstructor(new Class[0]);
                return (BaseAdapter) constructor.newInstance(new Object[0]);
            } catch (Exception e) {
                Log.d("MoPub", "Couldn't create native adapter for type: " + type);
                return null;
            }
        }
        return null;
    }

    private static String classStringForAdapterType(String type) {
        return sAdapterMap.get(type);
    }

    private static Class<?> classForAdapterType(String type) {
        String className = classStringForAdapterType(type);
        if (className == null) {
            Log.d("MoPub", "Couldn't find a handler for this ad type: " + type + ". MoPub for Android does not support it at this time.");
            return null;
        }
        try {
            return Class.forName(className);
        } catch (ClassNotFoundException e) {
            Log.d("MoPub", "Couldn't find " + className + " class. Make sure the project includes the adapter library for " + className + " from the extras folder");
            return null;
        }
    }
}
