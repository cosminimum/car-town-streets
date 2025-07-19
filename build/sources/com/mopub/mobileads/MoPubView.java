package com.mopub.mobileads;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.location.Location;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.webkit.WebViewDatabase;
import android.widget.FrameLayout;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;

public class MoPubView extends FrameLayout {
    public static final String AD_HANDLER = "/m/ad";
    public static final int DEFAULT_LOCATION_PRECISION = 6;
    public static final String HOST = "ads.mopub.com";
    private boolean mAdLoaded;
    protected AdView mAdView;
    protected BaseAdapter mAdapter;
    protected boolean mBlockAutoRefresh;
    private Context mContext;
    /* access modifiers changed from: private */
    public boolean mIsInForeground;
    private LocationAwareness mLocationAwareness;
    private int mLocationPrecision;
    private OnAdClickedListener mOnAdClickedListener;
    private OnAdClosedListener mOnAdClosedListener;
    private OnAdFailedListener mOnAdFailedListener;
    private OnAdLoadedListener mOnAdLoadedListener;
    private OnAdPresentedOverlayListener mOnAdPresentedOverlayListener;
    private OnAdWillLoadListener mOnAdWillLoadListener;
    /* access modifiers changed from: private */
    public boolean mPreviousAutorefreshSetting;
    private BroadcastReceiver mScreenStateReceiver;

    public enum LocationAwareness {
        LOCATION_AWARENESS_NORMAL,
        LOCATION_AWARENESS_TRUNCATED,
        LOCATION_AWARENESS_DISABLED
    }

    public interface OnAdClickedListener {
        void OnAdClicked(MoPubView moPubView);
    }

    public interface OnAdClosedListener {
        void OnAdClosed(MoPubView moPubView);
    }

    public interface OnAdFailedListener {
        void OnAdFailed(MoPubView moPubView);
    }

    public interface OnAdLoadedListener {
        void OnAdLoaded(MoPubView moPubView);
    }

    public interface OnAdPresentedOverlayListener {
        void OnAdPresentedOverlay(MoPubView moPubView);
    }

    public interface OnAdWillLoadListener {
        void OnAdWillLoad(MoPubView moPubView, String str);
    }

    public MoPubView(Context context) {
        this(context, (AttributeSet) null);
    }

    public MoPubView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mAdLoaded = false;
        this.mBlockAutoRefresh = false;
        this.mPreviousAutorefreshSetting = false;
        this.mContext = context;
        this.mIsInForeground = getVisibility() == 0;
        this.mLocationAwareness = LocationAwareness.LOCATION_AWARENESS_NORMAL;
        this.mLocationPrecision = 6;
        setHorizontalScrollBarEnabled(false);
        setVerticalScrollBarEnabled(false);
        if (WebViewDatabase.getInstance(context) == null) {
            Log.e("MoPub", "Disabling MoPub. Local cache file is inaccessible so MoPub will fail if we try to create a WebView. Details of this Android bug found at:http://code.google.com/p/android/issues/detail?id=10789");
            return;
        }
        initVersionDependentAdView(context);
        registerScreenStateBroadcastReceiver();
    }

    public boolean AdLoaded() {
        return this.mAdLoaded;
    }

    private void initVersionDependentAdView(Context context) {
        if (new Integer(Build.VERSION.SDK).intValue() < 7) {
            this.mAdView = new AdView(context, this);
            return;
        }
        try {
            try {
                this.mAdView = (AdView) Class.forName("com.mopub.mobileads.HTML5AdView").getConstructor(new Class[]{Context.class, MoPubView.class}).newInstance(new Object[]{context, this});
            } catch (SecurityException e) {
                Log.e("MoPub", "Could not load HTML5AdView.");
            } catch (NoSuchMethodException e2) {
                Log.e("MoPub", "Could not load HTML5AdView.");
            } catch (IllegalArgumentException e3) {
                Log.e("MoPub", "Could not load HTML5AdView.");
            } catch (InstantiationException e4) {
                Log.e("MoPub", "Could not load HTML5AdView.");
            } catch (IllegalAccessException e5) {
                Log.e("MoPub", "Could not load HTML5AdView.");
            } catch (InvocationTargetException e6) {
                Log.e("MoPub", "Could not load HTML5AdView.");
            }
            if (this.mAdView == null) {
                this.mAdView = new AdView(context, this);
            }
        } catch (ClassNotFoundException e7) {
            this.mAdView = new AdView(context, this);
        }
    }

    private void registerScreenStateBroadcastReceiver() {
        if (this.mAdView != null) {
            this.mScreenStateReceiver = new BroadcastReceiver() {
                public void onReceive(Context context, Intent intent) {
                    if (intent.getAction().equals("android.intent.action.SCREEN_OFF")) {
                        if (MoPubView.this.mIsInForeground) {
                            Log.d("MoPub", "Screen sleep with ad in foreground, disable refresh");
                            if (MoPubView.this.mAdView != null) {
                                boolean unused = MoPubView.this.mPreviousAutorefreshSetting = MoPubView.this.mAdView.getAutorefreshEnabled();
                                MoPubView.this.setAutorefreshEnabled(false);
                                return;
                            }
                            return;
                        }
                        Log.d("MoPub", "Screen sleep but ad in background; refresh should already be disabled");
                    } else if (!intent.getAction().equals("android.intent.action.USER_PRESENT")) {
                    } else {
                        if (MoPubView.this.mIsInForeground) {
                            Log.d("MoPub", "Screen wake / ad in foreground, reset refresh");
                            if (MoPubView.this.mAdView != null) {
                                MoPubView.this.setAutorefreshEnabled(MoPubView.this.mPreviousAutorefreshSetting);
                                return;
                            }
                            return;
                        }
                        Log.d("MoPub", "Screen wake but ad in background; don't enable refresh");
                    }
                }
            };
            IntentFilter filter = new IntentFilter("android.intent.action.SCREEN_OFF");
            filter.addAction("android.intent.action.USER_PRESENT");
            this.mContext.registerReceiver(this.mScreenStateReceiver, filter);
        }
    }

    private void unregisterScreenStateBroadcastReceiver() {
        try {
            this.mContext.unregisterReceiver(this.mScreenStateReceiver);
        } catch (Exception e) {
            Log.d("MoPub", "Failed to unregister screen state broadcast receiver (never registered).");
        }
    }

    public void loadAd() {
        if (this.mAdView != null) {
            this.mAdView.loadAd();
        }
    }

    public void destroy() {
        unregisterScreenStateBroadcastReceiver();
        if (this.mAdView != null) {
            this.mAdView.cleanup();
            this.mAdView = null;
        }
        if (this.mAdapter != null) {
            this.mAdapter.invalidate();
            this.mAdapter = null;
        }
    }

    /* access modifiers changed from: protected */
    public void loadFailUrl() {
        if (this.mAdView != null) {
            this.mAdView.loadFailUrl();
        }
    }

    /* access modifiers changed from: protected */
    public void loadNativeSDK(HashMap<String, String> paramsHash) {
        if (this.mAdapter != null) {
            this.mAdapter.invalidate();
        }
        String type = paramsHash.get("X-Adtype");
        this.mAdapter = BaseAdapter.getAdapterForType(type);
        if (this.mAdapter != null) {
            Log.i("MoPub", "Loading native adapter for type: " + type);
            this.mAdapter.init(this, paramsHash.get("X-Nativeparams"));
            this.mAdapter.loadAd();
            return;
        }
        Log.i("MoPub", "Couldn't load native adapter. Trying next ad...");
        loadFailUrl();
    }

    /* access modifiers changed from: protected */
    public void registerClick() {
        if (this.mAdView != null) {
            this.mAdView.registerClick();
            adClicked();
        }
    }

    /* access modifiers changed from: protected */
    public void loadHtmlString(String html) {
        if (this.mAdView != null) {
            this.mAdView.loadResponseString(html);
        }
    }

    /* access modifiers changed from: protected */
    public void trackNativeImpression() {
        Log.d("MoPub", "Tracking impression for native adapter.");
        if (this.mAdView != null) {
            this.mAdView.trackImpression();
        }
    }

    /* access modifiers changed from: protected */
    public void onWindowVisibilityChanged(int visibility) {
        if (this.mAdView != null) {
            if (visibility == 0) {
                Log.d("MoPub", "Ad Unit (" + this.mAdView.getAdUnitId() + ") going visible: enabling refresh");
                this.mIsInForeground = true;
                setAutorefreshEnabled(true);
                return;
            }
            Log.d("MoPub", "Ad Unit (" + this.mAdView.getAdUnitId() + ") going invisible: disabling refresh");
            this.mIsInForeground = false;
            setAutorefreshEnabled(false);
        }
    }

    /* access modifiers changed from: protected */
    public void adWillLoad(String url) {
        Log.d("MoPub", "adWillLoad: " + url);
        if (this.mOnAdWillLoadListener != null) {
            this.mOnAdWillLoadListener.OnAdWillLoad(this, url);
        }
    }

    /* access modifiers changed from: protected */
    public void adLoaded() {
        this.mAdLoaded = true;
        Log.d("MoPub", "adLoaded");
        if (this.mOnAdLoadedListener != null) {
            this.mOnAdLoadedListener.OnAdLoaded(this);
        }
    }

    /* access modifiers changed from: protected */
    public void adFailed() {
        this.mAdLoaded = false;
        if (this.mOnAdFailedListener != null) {
            this.mOnAdFailedListener.OnAdFailed(this);
        }
    }

    /* access modifiers changed from: protected */
    public void adPresentedOverlay() {
        if (this.mOnAdPresentedOverlayListener != null) {
            this.mOnAdPresentedOverlayListener.OnAdPresentedOverlay(this);
        }
    }

    /* access modifiers changed from: protected */
    public void adClosed() {
        if (this.mOnAdClosedListener != null) {
            this.mOnAdClosedListener.OnAdClosed(this);
        }
    }

    /* access modifiers changed from: protected */
    public void adClicked() {
        if (this.mOnAdClickedListener != null) {
            this.mOnAdClickedListener.OnAdClicked(this);
        }
    }

    /* access modifiers changed from: protected */
    public void nativeAdLoaded() {
        if (this.mAdView != null) {
            this.mAdView.scheduleRefreshTimerIfEnabled();
        }
        adLoaded();
    }

    /* access modifiers changed from: protected */
    public void adAppeared() {
        if (this.mAdView != null) {
            this.mAdView.adAppeared();
        }
    }

    public void customEventDidLoadAd() {
        if (this.mAdView != null) {
            this.mAdView.customEventDidLoadAd();
        }
    }

    public void customEventDidFailToLoadAd() {
        if (this.mAdView != null) {
            this.mAdView.customEventDidFailToLoadAd();
        }
    }

    public void customEventActionWillBegin() {
        if (this.mAdView != null) {
            this.mAdView.customEventActionWillBegin();
        }
    }

    public void setAdUnitId(String adUnitId) {
        if (this.mAdView != null) {
            this.mAdView.setAdUnitId(adUnitId);
        }
    }

    public String getAdUnitId() {
        if (this.mAdView != null) {
            return this.mAdView.getAdUnitId();
        }
        return null;
    }

    public void setKeywords(String keywords) {
        if (this.mAdView != null) {
            this.mAdView.setKeywords(keywords);
        }
    }

    public String getKeywords() {
        if (this.mAdView != null) {
            return this.mAdView.getKeywords();
        }
        return null;
    }

    public void setLocation(Location location) {
        if (this.mAdView != null) {
            this.mAdView.setLocation(location);
        }
    }

    public Location getLocation() {
        if (this.mAdView != null) {
            return this.mAdView.getLocation();
        }
        return null;
    }

    public void setTimeout(int milliseconds) {
        if (this.mAdView != null) {
            this.mAdView.setTimeout(milliseconds);
        }
    }

    public int getAdWidth() {
        if (this.mAdView != null) {
            return this.mAdView.getAdWidth();
        }
        return 0;
    }

    public int getAdHeight() {
        if (this.mAdView != null) {
            return this.mAdView.getAdHeight();
        }
        return 0;
    }

    public String getResponseString() {
        if (this.mAdView != null) {
            return this.mAdView.getResponseString();
        }
        return null;
    }

    public void setClickthroughUrl(String url) {
        if (this.mAdView != null) {
            this.mAdView.setClickthroughUrl(url);
        }
    }

    public String getClickthroughUrl() {
        if (this.mAdView != null) {
            return this.mAdView.getClickthroughUrl();
        }
        return null;
    }

    public Activity getActivity() {
        return (Activity) this.mContext;
    }

    public void setOnAdWillLoadListener(OnAdWillLoadListener listener) {
        this.mOnAdWillLoadListener = listener;
    }

    public void setOnAdLoadedListener(OnAdLoadedListener listener) {
        this.mOnAdLoadedListener = listener;
    }

    public void setOnAdFailedListener(OnAdFailedListener listener) {
        this.mOnAdFailedListener = listener;
    }

    public void setOnAdPresentedOverlayListener(OnAdPresentedOverlayListener listener) {
        this.mOnAdPresentedOverlayListener = listener;
    }

    public void setOnAdClosedListener(OnAdClosedListener listener) {
        this.mOnAdClosedListener = listener;
    }

    public void setOnAdClickedListener(OnAdClickedListener listener) {
        this.mOnAdClickedListener = listener;
    }

    public void setLocationAwareness(LocationAwareness awareness) {
        this.mLocationAwareness = awareness;
    }

    public LocationAwareness getLocationAwareness() {
        return this.mLocationAwareness;
    }

    public void setLocationPrecision(int precision) {
        if (precision < 0) {
            precision = 0;
        }
        this.mLocationPrecision = precision;
    }

    public int getLocationPrecision() {
        return this.mLocationPrecision;
    }

    public void setAutorefreshEnabled(boolean enabled) {
        if (!this.mBlockAutoRefresh && this.mAdView != null) {
            this.mAdView.setAutorefreshEnabled(enabled);
        }
    }

    public boolean getAutorefreshEnabled() {
        if (this.mAdView != null) {
            return this.mAdView.getAutorefreshEnabled();
        }
        Log.d("MoPub", "Can't get autorefresh status for destroyed MoPubView. Returning false.");
        return false;
    }

    public void setAdContentView(View view) {
        if (this.mAdView != null) {
            this.mAdView.setAdContentView(view);
        }
    }

    public void setBlockAutoRefresh(boolean blocked) {
        this.mBlockAutoRefresh = blocked;
    }

    public void resetRefreshTime() {
        this.mAdView.resetRefreshTime();
    }

    public AdView getAdView() {
        return this.mAdView;
    }
}
