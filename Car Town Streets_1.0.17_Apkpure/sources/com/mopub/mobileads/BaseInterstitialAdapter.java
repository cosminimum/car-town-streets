package com.mopub.mobileads;

import android.util.Log;
import java.lang.reflect.Constructor;
import java.util.HashMap;
/* loaded from: classes.dex */
public abstract class BaseInterstitialAdapter {
    private static final HashMap<String, String> sInterstitialAdapterMap = new HashMap<>();
    protected BaseInterstitialAdapterListener mAdapterListener;
    protected MoPubInterstitial mInterstitial;
    protected boolean mInvalidated;
    protected String mJsonParams;

    /* loaded from: classes.dex */
    public interface BaseInterstitialAdapterListener {
        void onNativeInterstitialClicked(BaseInterstitialAdapter baseInterstitialAdapter);

        void onNativeInterstitialExpired(BaseInterstitialAdapter baseInterstitialAdapter);

        void onNativeInterstitialFailed(BaseInterstitialAdapter baseInterstitialAdapter);

        void onNativeInterstitialLoaded(BaseInterstitialAdapter baseInterstitialAdapter);
    }

    public abstract void loadInterstitial();

    public abstract void showInterstitial();

    static {
        sInterstitialAdapterMap.put("mraid", "com.mopub.mobileads.MraidInterstitialAdapter");
        sInterstitialAdapterMap.put("admob_full", "com.mopub.mobileads.GoogleAdMobInterstitialAdapter");
        sInterstitialAdapterMap.put("millennial_full", "com.mopub.mobileads.MillennialInterstitialAdapter");
    }

    public void init(MoPubInterstitial interstitial, String jsonParams) {
        this.mInterstitial = interstitial;
        this.mJsonParams = jsonParams;
        this.mInvalidated = false;
    }

    public void invalidate() {
        this.mInterstitial = null;
        this.mAdapterListener = null;
        this.mInvalidated = true;
    }

    public boolean isInvalidated() {
        return this.mInvalidated;
    }

    public void setAdapterListener(BaseInterstitialAdapterListener listener) {
        this.mAdapterListener = listener;
    }

    public static BaseInterstitialAdapter getAdapterForType(String type) {
        Class<?> adapterClass;
        if (type != null && (adapterClass = classForAdapterType(type)) != null) {
            try {
                Constructor<?> constructor = adapterClass.getConstructor(new Class[0]);
                return (BaseInterstitialAdapter) constructor.newInstance(new Object[0]);
            } catch (Exception e) {
                Log.d("MoPub", "Couldn't create native interstitial adapter for type: " + type);
                return null;
            }
        }
        return null;
    }

    private static String classStringForAdapterType(String type) {
        return sInterstitialAdapterMap.get(type);
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
            Log.d("MoPub", "Couldn't find " + className + "class. Make sure the project includes the adapter library for " + className + " from the extras folder");
            return null;
        }
    }
}
