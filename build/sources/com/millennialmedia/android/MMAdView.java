package com.millennialmedia.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.location.Location;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.getjar.sdk.utilities.Utility;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.millennialmedia.android.AdCache;
import com.millennialmedia.android.MMAdViewSDK;
import com.millennialmedia.android.MMMedia;
import java.util.Hashtable;
import java.util.Map;
import java.util.Random;

public class MMAdView extends FrameLayout implements View.OnClickListener, Animation.AnimationListener {
    public static final String BANNER_AD_BOTTOM = "MMBannerAdBottom";
    public static final String BANNER_AD_RECTANGLE = "MMBannerAdRectangle";
    public static final String BANNER_AD_TOP = "MMBannerAdTop";
    public static final String FULLSCREEN_AD_LAUNCH = "MMFullScreenAdLaunch";
    public static final String FULLSCREEN_AD_TRANSITION = "MMFullScreenAdTransition";
    public static final String KEY_AGE = "age";
    public static final String KEY_CHILDREN = "children";
    public static final String KEY_EDUCATION = "education";
    public static final String KEY_ETHNICITY = "ethnicity";
    public static final String KEY_GENDER = "gender";
    public static final String KEY_HEIGHT = "height";
    public static final String KEY_INCOME = "income";
    public static final String KEY_KEYWORDS = "keywords";
    public static final String KEY_MARITAL_STATUS = "marital";
    public static final String KEY_ORIENTATION = "orientation";
    public static final String KEY_POLITICS = "politics";
    public static final String KEY_VENDOR = "vendor";
    public static final String KEY_WIDTH = "width";
    public static final String KEY_ZIP_CODE = "zip";
    public static final int REFRESH_INTERVAL_OFF = -1;
    public static final int TRANSITION_DOWN = 3;
    public static final int TRANSITION_FADE = 1;
    public static final int TRANSITION_NONE = 0;
    public static final int TRANSITION_RANDOM = 4;
    public static final int TRANSITION_UP = 2;
    private static boolean appInit;
    private static long nextAdViewId = 1;
    String acid;
    String adType;
    Long adViewId;
    String apid;
    MMAdViewController controller;
    Request deferedRequest;
    private GestureDetector gestureDetector;
    String goalId;
    String height;
    boolean ignoreDensityScaling;
    ImageView imageView;
    long lastAdRequest;
    MMAdListener listener;
    String mxsdk;
    int refreshInterval;
    int transitionType;
    public String userData;
    String width;
    boolean xmlLayout;

    public interface MMAdListener {
        void MMAdCachingCompleted(MMAdView mMAdView, boolean z);

        void MMAdClickedToOverlay(MMAdView mMAdView);

        void MMAdFailed(MMAdView mMAdView);

        void MMAdOverlayLaunched(MMAdView mMAdView);

        void MMAdRequestIsCaching(MMAdView mMAdView);

        void MMAdReturned(MMAdView mMAdView);
    }

    public MMAdView(Context context) {
        super(context);
        this.refreshInterval = 60;
        this.apid = MMAdViewSDK.DEFAULT_APID;
        this.acid = null;
        this.mxsdk = null;
        this.height = null;
        this.width = null;
        this.xmlLayout = false;
        this.ignoreDensityScaling = false;
        this.transitionType = 4;
        MMAdViewSDK.Log.m4416d("Creating new MMAdView for conversion tracking.");
        checkPermissions(context);
    }

    public MMAdView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x01d8 A[SYNTHETIC, Splitter:B:28:0x01d8] */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x01dd A[Catch:{ Exception -> 0x0215 }] */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x0207 A[SYNTHETIC, Splitter:B:47:0x0207] */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x020c A[Catch:{ Exception -> 0x0210 }] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public MMAdView(android.content.Context r17, android.util.AttributeSet r18, int r19) {
        /*
            r16 = this;
            r16.<init>(r17, r18, r19)
            r13 = 60
            r0 = r16
            r0.refreshInterval = r13
            java.lang.String r13 = "28911"
            r0 = r16
            r0.apid = r13
            r13 = 0
            r0 = r16
            r0.acid = r13
            r13 = 0
            r0 = r16
            r0.mxsdk = r13
            r13 = 0
            r0 = r16
            r0.height = r13
            r13 = 0
            r0 = r16
            r0.width = r13
            r13 = 0
            r0 = r16
            r0.xmlLayout = r13
            r13 = 0
            r0 = r16
            r0.ignoreDensityScaling = r13
            r13 = 4
            r0 = r16
            r0.transitionType = r13
            boolean r13 = r16.isInEditMode()
            if (r13 != 0) goto L_0x0156
            java.lang.String r13 = "Creating MMAdView from XML layout."
            com.millennialmedia.android.MMAdViewSDK.Log.m4416d((java.lang.String) r13)
            if (r18 == 0) goto L_0x014d
            java.lang.String r10 = "http://millennialmedia.com/android/schema"
            java.lang.String r13 = "apid"
            r0 = r18
            java.lang.String r13 = r0.getAttributeValue(r10, r13)
            r0 = r16
            r0.apid = r13
            java.lang.String r13 = "acid"
            r0 = r18
            java.lang.String r13 = r0.getAttributeValue(r10, r13)
            r0 = r16
            r0.acid = r13
            java.lang.String r13 = "adType"
            r0 = r18
            java.lang.String r13 = r0.getAttributeValue(r10, r13)
            r0 = r16
            r0.adType = r13
            java.lang.String r13 = "refreshInterval"
            r14 = 60
            r0 = r18
            int r13 = r0.getAttributeIntValue(r10, r13, r14)
            r0 = r16
            r0.refreshInterval = r13
            java.lang.String r13 = "ignoreDensityScaling"
            r14 = 0
            r0 = r18
            boolean r13 = r0.getAttributeBooleanValue(r10, r13, r14)
            r0 = r16
            r0.ignoreDensityScaling = r13
            java.lang.String r13 = "height"
            r0 = r18
            java.lang.String r13 = r0.getAttributeValue(r10, r13)
            r0 = r16
            r0.height = r13
            java.lang.String r13 = "width"
            r0 = r18
            java.lang.String r13 = r0.getAttributeValue(r10, r13)
            r0 = r16
            r0.width = r13
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            if (r13 == 0) goto L_0x0141
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "gender"
            r0 = r18
            java.lang.String r14 = r0.getAttributeValue(r10, r14)
            r13.gender = r14
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "ethnicity"
            r0 = r18
            java.lang.String r14 = r0.getAttributeValue(r10, r14)
            r13.ethnicity = r14
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "orientation"
            r0 = r18
            java.lang.String r14 = r0.getAttributeValue(r10, r14)
            r13.orientation = r14
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "marital"
            r0 = r18
            java.lang.String r14 = r0.getAttributeValue(r10, r14)
            r13.marital = r14
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "education"
            r0 = r18
            java.lang.String r14 = r0.getAttributeValue(r10, r14)
            r13.education = r14
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "age"
            java.lang.String r15 = "age"
            r0 = r18
            java.lang.String r15 = r0.getAttributeValue(r10, r15)
            r13.put(r14, r15)
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "zip"
            java.lang.String r15 = "zip"
            r0 = r18
            java.lang.String r15 = r0.getAttributeValue(r10, r15)
            r13.put(r14, r15)
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "income"
            java.lang.String r15 = "income"
            r0 = r18
            java.lang.String r15 = r0.getAttributeValue(r10, r15)
            r13.put(r14, r15)
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "keywords"
            java.lang.String r15 = "keywords"
            r0 = r18
            java.lang.String r15 = r0.getAttributeValue(r10, r15)
            r13.put(r14, r15)
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "children"
            java.lang.String r15 = "children"
            r0 = r18
            java.lang.String r15 = r0.getAttributeValue(r10, r15)
            r13.put(r14, r15)
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "politics"
            java.lang.String r15 = "politics"
            r0 = r18
            java.lang.String r15 = r0.getAttributeValue(r10, r15)
            r13.put(r14, r15)
            com.millennialmedia.android.MMDemographic r13 = com.millennialmedia.android.MMAdViewSDK.demographic
            java.lang.String r14 = "vendor"
            java.lang.String r15 = "vendor"
            r0 = r18
            java.lang.String r15 = r0.getAttributeValue(r10, r15)
            r13.put(r14, r15)
        L_0x0141:
            java.lang.String r13 = "goalId"
            r0 = r18
            java.lang.String r13 = r0.getAttributeValue(r10, r13)
            r0 = r16
            r0.goalId = r13
        L_0x014d:
            r13 = 1
            r0 = r16
            r0.xmlLayout = r13
            r16.init(r17)
        L_0x0155:
            return
        L_0x0156:
            android.widget.ImageView r9 = new android.widget.ImageView
            r0 = r17
            r9.<init>(r0)
            java.lang.String r7 = "http://images.millennialmedia.com/9513/192134.gif"
            r8 = 0
            r11 = 0
            java.lang.String r13 = "java.io.tmpdir"
            java.lang.String r5 = java.lang.System.getProperty(r13)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            if (r5 == 0) goto L_0x0184
            java.lang.String r13 = java.io.File.separator     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            boolean r13 = r5.endsWith(r13)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            if (r13 != 0) goto L_0x0184
            java.lang.StringBuilder r13 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            r13.<init>()     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.lang.StringBuilder r13 = r13.append(r5)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.lang.String r14 = java.io.File.separator     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.lang.StringBuilder r13 = r13.append(r14)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.lang.String r5 = r13.toString()     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
        L_0x0184:
            java.io.File r6 = new java.io.File     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.lang.StringBuilder r13 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            r13.<init>()     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.lang.StringBuilder r13 = r13.append(r5)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.lang.String r14 = "millenial355jns6u3l1nmedia.png"
            java.lang.StringBuilder r13 = r13.append(r14)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.lang.String r13 = r13.toString()     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            r6.<init>(r13)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            boolean r13 = r6.exists()     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            if (r13 != 0) goto L_0x01e8
            java.net.URL r13 = new java.net.URL     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.lang.String r14 = "http://images.millennialmedia.com/9513/192134.gif"
            r13.<init>(r14)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.net.URLConnection r4 = r13.openConnection()     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.net.HttpURLConnection r4 = (java.net.HttpURLConnection) r4     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            r13 = 1
            r4.setDoOutput(r13)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            r13 = 3000(0xbb8, float:4.204E-42)
            r4.setConnectTimeout(r13)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            r4.connect()     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.io.InputStream r8 = r4.getInputStream()     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            java.io.FileOutputStream r12 = new java.io.FileOutputStream     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            r12.<init>(r6)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            r13 = 1024(0x400, float:1.435E-42)
            byte[] r2 = new byte[r13]     // Catch:{ Exception -> 0x01d4, all -> 0x0212 }
            r3 = 0
        L_0x01c9:
            int r3 = r8.read(r2)     // Catch:{ Exception -> 0x01d4, all -> 0x0212 }
            if (r3 <= 0) goto L_0x01e7
            r13 = 0
            r12.write(r2, r13, r3)     // Catch:{ Exception -> 0x01d4, all -> 0x0212 }
            goto L_0x01c9
        L_0x01d4:
            r13 = move-exception
            r11 = r12
        L_0x01d6:
            if (r8 == 0) goto L_0x01db
            r8.close()     // Catch:{ Exception -> 0x0215 }
        L_0x01db:
            if (r11 == 0) goto L_0x01e0
            r11.close()     // Catch:{ Exception -> 0x0215 }
        L_0x01e0:
            r0 = r16
            r0.addView(r9)
            goto L_0x0155
        L_0x01e7:
            r11 = r12
        L_0x01e8:
            java.lang.String r13 = r6.getAbsolutePath()     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            android.graphics.Bitmap r1 = android.graphics.BitmapFactory.decodeFile(r13)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
            if (r9 == 0) goto L_0x01f7
            if (r1 == 0) goto L_0x01f7
            r9.setImageBitmap(r1)     // Catch:{ Exception -> 0x0217, all -> 0x0204 }
        L_0x01f7:
            if (r8 == 0) goto L_0x01fc
            r8.close()     // Catch:{ Exception -> 0x0202 }
        L_0x01fc:
            if (r11 == 0) goto L_0x01e0
            r11.close()     // Catch:{ Exception -> 0x0202 }
            goto L_0x01e0
        L_0x0202:
            r13 = move-exception
            goto L_0x01e0
        L_0x0204:
            r13 = move-exception
        L_0x0205:
            if (r8 == 0) goto L_0x020a
            r8.close()     // Catch:{ Exception -> 0x0210 }
        L_0x020a:
            if (r11 == 0) goto L_0x020f
            r11.close()     // Catch:{ Exception -> 0x0210 }
        L_0x020f:
            throw r13
        L_0x0210:
            r14 = move-exception
            goto L_0x020f
        L_0x0212:
            r13 = move-exception
            r11 = r12
            goto L_0x0205
        L_0x0215:
            r13 = move-exception
            goto L_0x01e0
        L_0x0217:
            r13 = move-exception
            goto L_0x01d6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMAdView.<init>(android.content.Context, android.util.AttributeSet, int):void");
    }

    public MMAdView(Context context, String apid2, String adType2, int refreshInterval2) {
        super(context);
        this.refreshInterval = 60;
        this.apid = MMAdViewSDK.DEFAULT_APID;
        this.acid = null;
        this.mxsdk = null;
        this.height = null;
        this.width = null;
        this.xmlLayout = false;
        this.ignoreDensityScaling = false;
        this.transitionType = 4;
        MMAdViewSDK.Log.m4416d("Creating new MMAdView.");
        this.apid = apid2;
        this.adType = adType2;
        this.refreshInterval = refreshInterval2;
        init(context);
    }

    public MMAdView(Context context, String apid2, String adType2, int refreshInterval2, Hashtable<String, String> metaMap) {
        super(context);
        this.refreshInterval = 60;
        this.apid = MMAdViewSDK.DEFAULT_APID;
        this.acid = null;
        this.mxsdk = null;
        this.height = null;
        this.width = null;
        this.xmlLayout = false;
        this.ignoreDensityScaling = false;
        this.transitionType = 4;
        MMAdViewSDK.Log.m4416d("Creating new MMAdView.");
        this.apid = apid2;
        this.adType = adType2;
        this.refreshInterval = refreshInterval2;
        setMetaValues(metaMap);
        init(context);
    }

    public MMAdView(Context context, String apid2, String adType2, int refreshInterval2, Hashtable<String, String> metaMap, boolean accelerate) {
        super(context);
        this.refreshInterval = 60;
        this.apid = MMAdViewSDK.DEFAULT_APID;
        this.acid = null;
        this.mxsdk = null;
        this.height = null;
        this.width = null;
        this.xmlLayout = false;
        this.ignoreDensityScaling = false;
        this.transitionType = 4;
        MMAdViewSDK.Log.m4416d("Creating new MMAdView.");
        this.apid = apid2;
        this.adType = adType2;
        this.refreshInterval = refreshInterval2;
        setMetaValues(metaMap);
        init(context);
    }

    public MMAdView(Context context, String apid2, String adType2, boolean accelerate, Hashtable<String, String> metaMap) {
        super(context);
        this.refreshInterval = 60;
        this.apid = MMAdViewSDK.DEFAULT_APID;
        this.acid = null;
        this.mxsdk = null;
        this.height = null;
        this.width = null;
        this.xmlLayout = false;
        this.ignoreDensityScaling = false;
        this.transitionType = 4;
        MMAdViewSDK.Log.m4416d("Creating new MMAdView.");
        this.apid = apid2;
        this.adType = adType2;
        this.refreshInterval = -1;
        setMetaValues(metaMap);
        init(context);
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        if (getId() == -1 || isInterstitial()) {
            MMAdViewController.removeAdViewController(this, true);
        }
    }

    private void init(Context context) {
        try {
            MMAdViewSDK.Log.m4416d("Initializing MMAdView.");
            synchronized (MMAdView.class) {
                this.adViewId = new Long(nextAdViewId);
                nextAdViewId++;
                MMAdViewSDK.Log.m4429v("Assigning MMAdView internal id: %d", this.adViewId);
            }
            checkPermissions(context);
            checkActivity(context);
            setBackgroundColor(0);
            setOnClickListener(this);
            setFocusable(true);
            setDescendantFocusability(393216);
            if (this.apid == null) {
                MMAdViewSDK.Log.m4419e("MMAdView initialized without an apid. New ad requests will be disabled.");
                HandShake.apid = MMAdViewSDK.DEFAULT_APID;
            } else {
                HandShake.apid = this.apid;
            }
            HandShake.sharedHandShake(context).overrideAdRefresh(this);
            if ((this.adType == FULLSCREEN_AD_TRANSITION || this.adType == FULLSCREEN_AD_LAUNCH) && this.refreshInterval != -1) {
                MMAdViewSDK.Log.m4431w("Turning off interstitial refresh interval.");
                this.refreshInterval = -1;
            }
            this.imageView = new ImageView(context);
            this.imageView.setScaleType(ImageView.ScaleType.FIT_XY);
            this.imageView.setVisibility(8);
            addView(this.imageView, new FrameLayout.LayoutParams(-1, -1));
            setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
            this.gestureDetector = new GestureDetector(new GestureDetector.SimpleOnGestureListener() {
                public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
                    if (Math.abs((int) (e2.getX() - e1.getX())) <= 200 || Math.abs(velocityX) <= Math.abs(velocityY)) {
                        return false;
                    }
                    if (velocityX <= BitmapDescriptorFactory.HUE_RED) {
                        MMAdView.this.printDiagnostics();
                    } else if (MMAdViewSDK.logLevel == 0) {
                        MMAdViewSDK.Log.m4422i("Enabling debug and verbose logging.");
                        MMAdViewSDK.logLevel = 2;
                    } else {
                        MMAdViewSDK.Log.m4422i("Disabling debug and verbose logging.");
                        MMAdViewSDK.logLevel = 0;
                    }
                    return true;
                }
            });
        } catch (Exception e) {
            MMAdViewSDK.Log.m4420e("There was an exception initializing the MMAdView. %s", e.getMessage());
            e.printStackTrace();
        }
        if (!appInit) {
            MMAdViewSDK.Log.m4416d("********** Millennial Device Id *****************");
            MMAdViewSDK.Log.m4416d(MMAdViewSDK.getHdid(context));
            MMAdViewSDK.Log.m4416d("Use the above identifier to register this device and receive test ads. Test devices can be registered and administered through your account at http://mmedia.com.");
            MMAdViewSDK.Log.m4416d("*************************************************");
            AdCache.cleanUpExpiredAds(context);
            MMFileManager.cleanupCache(context, false);
            appInit = true;
        }
    }

    static String[] getAdTypes() {
        return new String[]{BANNER_AD_TOP, BANNER_AD_BOTTOM, BANNER_AD_RECTANGLE, FULLSCREEN_AD_LAUNCH, FULLSCREEN_AD_TRANSITION};
    }

    public void onWindowFocusChanged(boolean windowInFocus) {
        Activity activity;
        super.onWindowFocusChanged(windowInFocus);
        if (this.controller != null) {
            if (windowInFocus) {
                this.controller.resumeTimer(false);
                this.controller.settings.state = "default";
                this.controller.loadUrl("javascript:MMSDK.mraid.stateChange('default')");
                this.controller.loadUrl("javascript:MMSDK.mraid.viewableChange(true)");
                this.controller.loadUrl("javascript:MMSDK.mraid.ready()");
            } else {
                this.controller.pauseTimer(false);
                this.controller.settings.state = "hidden";
                this.controller.loadUrl("javascript:MMSDK.mraid.stateChange('hidden')");
                this.controller.loadUrl("javascript:MMSDK.mraid.viewableChange(false)");
            }
        }
        MMAdViewSDK.Log.m4417d("Window Focus Changed. Window in focus?: %b", Boolean.valueOf(windowInFocus));
        if (!windowInFocus && (getContext() instanceof Activity) && ((activity = (Activity) getContext()) == null || activity.isFinishing())) {
            MMAdViewController.removeAdViewController(this, true);
        }
        MMMedia.Audio.sharedAudio(getContext()).stop();
    }

    /* access modifiers changed from: protected */
    public void onVisibilityChanged(View changedView, int visibility) {
        boolean z = true;
        if (this.controller != null) {
            if (visibility == 0) {
                this.controller.resumeTimer(false);
            } else {
                this.controller.pauseTimer(false);
            }
        }
        Object[] objArr = new Object[1];
        if (visibility != 0) {
            z = false;
        }
        objArr[0] = Boolean.valueOf(z);
        MMAdViewSDK.Log.m4417d("Window Visibility Changed. Window is visible?: %b", objArr);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        if (this.width == null) {
            this.width = Integer.toString((int) (((float) getWidth()) / getContext().getResources().getDisplayMetrics().density));
        }
        if (this.height == null) {
            this.height = Integer.toString((int) (((float) getHeight()) / getContext().getResources().getDisplayMetrics().density));
        }
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (!isInEditMode()) {
            MMAdViewSDK.Log.m4416d("onAttachedToWindow");
            MMAdViewController.assignAdViewController(this);
            if (this.deferedRequest != null) {
                requestAd(this.deferedRequest);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        MMAdViewSDK.Log.m4416d("onDetachedFromWindow");
        MMAdViewController.removeAdViewController(this, false);
    }

    /* access modifiers changed from: protected */
    public Parcelable onSaveInstanceState() {
        MMAdViewSDK.Log.m4416d("onSaveInstanceState");
        Bundle bundle = new Bundle();
        bundle.putParcelable("super", super.onSaveInstanceState());
        bundle.putLong("MMAdView", this.adViewId.longValue());
        return bundle;
    }

    /* access modifiers changed from: protected */
    public void onRestoreInstanceState(Parcelable state) {
        Bundle bundle = (Bundle) state;
        MMAdViewSDK.Log.m4416d("onRestoreInstanceState");
        this.adViewId = new Long(bundle.getLong("MMAdView"));
        super.onRestoreInstanceState(bundle.getParcelable("super"));
    }

    public void onClick(View v) {
        onTouchEvent(MotionEvent.obtain(0, System.currentTimeMillis(), 1, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, 0));
    }

    public boolean onInterceptTouchEvent(MotionEvent e) {
        return true;
    }

    public boolean onTouchEvent(MotionEvent e) {
        if (!this.gestureDetector.onTouchEvent(e) && this.controller != null && isClickable()) {
            if (e.getAction() == 1) {
                MMAdViewSDK.Log.m4429v("Ad clicked: action=%d x=%f y=%f", Integer.valueOf(e.getAction()), Float.valueOf(e.getX()), Float.valueOf(e.getY()));
                if (this.controller.nextUrl != null) {
                    if (this.controller.nextUrl.startsWith("javascript") || this.controller.nextUrl.startsWith("mmsdk")) {
                        this.controller.loadUrl(this.controller.nextUrl);
                    } else {
                        if (this.controller.nextUrl.startsWith("mmvideo") || this.controller.nextUrl.endsWith("content.once")) {
                            this.controller.settings.shouldLaunchToOverlay = true;
                        }
                        if (this.controller.nextUrl.startsWith("https")) {
                            this.controller.settings.shouldLaunchToOverlay = false;
                        }
                    }
                }
                if (this.controller.settings.shouldLaunchToOverlay) {
                    if (this.listener != null) {
                        try {
                            this.listener.MMAdClickedToOverlay(this);
                        } catch (Exception exception) {
                            MMAdViewSDK.Log.m4432w("Exception raised in your MMAdListener: ", exception);
                        }
                    }
                    if (this.controller.nextUrl != null) {
                        this.controller.handleClick(this.controller.nextUrl);
                    } else {
                        this.controller.touchWebView(e);
                    }
                } else if (this.controller.nextUrl != null) {
                    MMAdViewSDK.Log.m4416d("Ad clicked, launching new browser");
                    Context context = getContext();
                    if (context == null) {
                        MMAdViewSDK.Log.m4419e("The reference to the ad view was broken.");
                    } else {
                        try {
                            Intent myIntent = new Intent("android.intent.action.VIEW", Uri.parse(this.controller.nextUrl));
                            myIntent.setFlags(603979776);
                            if (!(context instanceof Activity)) {
                                myIntent.addFlags(DriveFile.MODE_READ_ONLY);
                            }
                            if (this.controller.nextUrl.startsWith("http") || this.controller.nextUrl.startsWith("https")) {
                                MMAdViewSDK.Event.intentStarted(context, (MMAdView) null, MMAdViewSDK.Event.INTENT_EXTERNAL_BROWSER);
                            }
                            context.startActivity(myIntent);
                        } catch (ActivityNotFoundException e2) {
                            MMAdViewSDK.Log.m4417d("Could not find activity for: %s", this.controller.nextUrl);
                        }
                    }
                } else {
                    MMAdViewSDK.Log.m4419e("No ad returned, no new browser launched");
                }
            } else if (e.getAction() != 2) {
                this.controller.touchWebView(e);
            }
        }
        return true;
    }

    /* access modifiers changed from: package-private */
    public boolean isInterstitial() {
        return this.adType.equals(FULLSCREEN_AD_TRANSITION) || this.adType.equals(FULLSCREEN_AD_LAUNCH);
    }

    /* access modifiers changed from: package-private */
    public boolean canRequestAd() {
        if (MMAdViewSDK.disableAdMinRefresh) {
            return true;
        }
        if ((System.currentTimeMillis() - this.lastAdRequest) / 1000 >= 15) {
            this.lastAdRequest = System.currentTimeMillis();
            return true;
        }
        int lastRequest = (int) ((System.currentTimeMillis() - this.lastAdRequest) / 1000);
        MMAdViewSDK.Log.m4417d("Cannot request ad. Last ad request was %d seconds ago. Next ad can be requested in %d seconds.", Integer.valueOf(lastRequest), Integer.valueOf(15 - lastRequest));
        return false;
    }

    /* access modifiers changed from: package-private */
    public void requestAd(Request request) {
        if (!MMAdViewSDK.isUiThread()) {
            MMAdViewSDK.Log.m4419e("Only the main thread can access an MMAdView.");
            MMAdViewSDK.Event.requestFailed(getContext(), this, request, new MMError(3));
        } else if (HandShake.sharedHandShake(getContext()).kill) {
            MMAdViewSDK.Log.m4422i("The server is no longer allowing ads.");
            MMAdViewSDK.Event.requestFailed(getContext(), this, request, new MMError(16));
        } else {
            try {
                MMAdViewSDK.Log.m4416d("callForAd");
                if (getWindowToken() != null || !this.xmlLayout) {
                    if (this.refreshInterval < 0) {
                        MMAdViewController.assignAdViewController(this);
                        if (this.controller != null) {
                            if (request.fetch) {
                                this.controller.fetch(request);
                            } else {
                                this.controller.requestAd(request);
                            }
                        }
                    }
                    this.deferedRequest = null;
                    return;
                }
                this.deferedRequest = request;
            } catch (Exception e) {
                MMAdViewSDK.Log.m4420e("There was an exception with the ad request. %s", e.getMessage());
                e.printStackTrace();
            }
        }
    }

    public void callForAd() {
        Request request = new Request(this.apid, (RequestListener) null, false);
        if (!canRequestAd()) {
            MMAdViewSDK.Event.requestFailed(getContext(), this, request, new MMError(16));
        } else {
            requestAd(request);
        }
    }

    public void fetch() {
        if (check()) {
            MMAdViewSDK.Log.m4416d("Ad already fetched and ready for display...");
            if (this.listener != null) {
                try {
                    this.listener.MMAdFailed(this);
                } catch (Exception e) {
                    MMAdViewSDK.Log.m4431w("Exception raised in your MMAdListener: " + e.getMessage());
                }
            }
        } else {
            Request request = new Request(this.apid, (RequestListener) null, true);
            if (!canRequestAd()) {
                MMAdViewSDK.Event.requestFailed(getContext(), this, request, new MMError(16));
                return;
            }
            MMAdViewSDK.Log.m4416d("Fetching new ad...");
            requestAd(request);
        }
    }

    /* access modifiers changed from: package-private */
    public int checkInternal() {
        try {
            MMAdViewController.assignAdViewController(this);
            if (this.controller != null) {
                return this.controller.check(this);
            }
            return 100;
        } catch (Exception e) {
            MMAdViewSDK.Log.m4420e("There was an exception checking for a cached ad. %s", e.getMessage());
            e.printStackTrace();
            return 100;
        }
    }

    /* access modifiers changed from: package-private */
    public int displayInternal() {
        try {
            MMAdViewController.assignAdViewController(this);
            if (this.controller != null) {
                return this.controller.display(this);
            }
            return 100;
        } catch (Exception e) {
            MMAdViewSDK.Log.m4420e("There was an exception displaying a cached ad. %s", e.getMessage());
            e.printStackTrace();
            return 100;
        }
    }

    public boolean check() {
        if (!MMAdViewSDK.isUiThread()) {
            MMAdViewSDK.Log.m4419e("Only the main thread can access an MMAdView.");
            return false;
        } else if (checkInternal() == 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean display() {
        if (!MMAdViewSDK.isUiThread()) {
            MMAdViewSDK.Log.m4419e("Only the main thread can access an MMAdView.");
            return false;
        } else if (displayInternal() == 0) {
            return true;
        } else {
            return false;
        }
    }

    public void pause() {
        if (this.controller != null) {
            this.controller.pauseTimer(true);
        }
    }

    public void resume() {
        if (this.controller != null) {
            this.controller.resumeTimer(true);
        }
    }

    public void updateUserLocation(Location userLocation) {
        if (userLocation != null) {
            MMAdViewSDK.location = userLocation;
        }
    }

    public void setAdType(String adType2) {
        this.adType = adType2;
    }

    public void setAge(String age) {
        if (MMAdViewSDK.demographic != null) {
            MMAdViewSDK.demographic.put("age", age);
        }
    }

    public void setGender(String gender) {
        if (MMAdViewSDK.demographic != null) {
            MMAdViewSDK.demographic.gender = gender;
        }
    }

    public void setZip(String zip) {
        if (MMAdViewSDK.demographic != null) {
            MMAdViewSDK.demographic.put("zip", zip);
        }
    }

    public void setMarital(String marital) {
        if (MMAdViewSDK.demographic != null) {
            MMAdViewSDK.demographic.marital = marital;
        }
    }

    public void setIncome(String income) {
        if (MMAdViewSDK.demographic != null) {
            MMAdViewSDK.demographic.put("income", income);
        }
    }

    public void setEthnicity(String ethnicity) {
        if (MMAdViewSDK.demographic != null) {
            MMAdViewSDK.demographic.ethnicity = ethnicity;
        }
    }

    public void setOrientation(String orientation) {
        if (MMAdViewSDK.demographic != null) {
            MMAdViewSDK.demographic.orientation = orientation;
        }
    }

    public void setEducation(String education) {
        if (MMAdViewSDK.demographic != null) {
            MMAdViewSDK.demographic.education = education;
        }
    }

    public void setPolitics(String politics) {
        if (MMAdViewSDK.demographic != null) {
            MMAdViewSDK.demographic.put("politics", politics);
        }
    }

    public void setApid(String apid2) {
        this.apid = apid2;
    }

    public void setHeight(String height2) {
        this.height = height2;
    }

    public void setWidth(String width2) {
        this.width = width2;
    }

    public void setVendor(String vendor) {
        if (MMAdViewSDK.demographic != null) {
            MMAdViewSDK.demographic.put("vendor", vendor);
        }
    }

    public void setAcid(String acid2) {
        this.acid = acid2;
    }

    public void setMxsdk(String mxsdk2) {
        this.mxsdk = mxsdk2;
    }

    public void setMetaValues(Hashtable<String, String> metaHash) {
        if (metaHash != null) {
            if (metaHash.containsKey("mmacid")) {
                this.acid = metaHash.get("mmacid");
            }
            if (metaHash.containsKey("mxsdk")) {
                this.mxsdk = metaHash.get("mxsdk");
            }
            if (metaHash.containsKey("height")) {
                this.height = metaHash.get("height");
            }
            if (metaHash.containsKey("width")) {
                this.width = metaHash.get("width");
            }
            if (MMAdViewSDK.demographic != null) {
                for (Map.Entry<String, String> entry : metaHash.entrySet()) {
                    MMAdViewSDK.demographic.put(entry.getKey(), entry.getValue());
                }
            }
        }
    }

    public void setListener(MMAdListener listener2) {
        synchronized (this) {
            this.listener = listener2;
        }
    }

    public MMAdListener getListener() {
        return this.listener;
    }

    public void setIgnoresDensityScaling(boolean ignoresDensityScaling) {
        synchronized (this) {
            this.ignoreDensityScaling = ignoresDensityScaling;
        }
    }

    public void setTransitionType(int type) {
        this.transitionType = type;
    }

    private static void checkPermissions(Context context) {
        if (context.checkCallingOrSelfPermission(Utility.READ_PHONE_STATE_PERMISSION) == -1) {
            final AlertDialog phoneStateDialog = new AlertDialog.Builder(context).create();
            phoneStateDialog.setTitle("Whoops!");
            phoneStateDialog.setMessage("The developer has forgot to declare the READ_PHONE_STATE permission in the manifest file. Please reach out to the developer to remove this error.");
            phoneStateDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    phoneStateDialog.cancel();
                }
            });
            phoneStateDialog.show();
        }
        if (context.checkCallingOrSelfPermission("android.permission.INTERNET") == -1) {
            final AlertDialog internetDialog = new AlertDialog.Builder(context).create();
            internetDialog.setTitle("Whoops!");
            internetDialog.setMessage("The developer has forgot to declare the INTERNET permission in the manifest file. Please reach out to the developer to remove this error.");
            internetDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    internetDialog.cancel();
                }
            });
            internetDialog.show();
        }
        if (context.checkCallingOrSelfPermission("android.permission.ACCESS_NETWORK_STATE") == -1) {
            final AlertDialog networkStateDialog = new AlertDialog.Builder(context).create();
            networkStateDialog.setTitle("Whoops!");
            networkStateDialog.setMessage("The developer has forgot to declare the ACCESS_NETWORK_STATE permission in the manifest file. Please reach out to the developer to remove this error.");
            networkStateDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    networkStateDialog.cancel();
                }
            });
            networkStateDialog.show();
        }
    }

    private static void checkActivity(Context context) {
        PackageManager pm = context.getPackageManager();
        try {
            ActivityInfo activityInfo = pm.getActivityInfo(new ComponentName(context, "com.millennialmedia.android.MMActivity"), 128);
        } catch (PackageManager.NameNotFoundException e) {
            MMAdViewSDK.Log.m4419e("Activity MMActivity not declared in AndroidManifest.xml");
            e.printStackTrace();
            final AlertDialog activityDialog = new AlertDialog.Builder(context).create();
            activityDialog.setTitle("Whoops!");
            activityDialog.setMessage("The developer has forgot to declare the MMActivity in the manifest file. Please reach out to the developer to remove this error.");
            activityDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    activityDialog.cancel();
                }
            });
            activityDialog.show();
        }
        try {
            ActivityInfo activityInfo2 = pm.getActivityInfo(new ComponentName(context, "com.millennialmedia.android.VideoPlayer"), 128);
        } catch (PackageManager.NameNotFoundException e2) {
            MMAdViewSDK.Log.m4419e("Activity VideoPlayer not declared in AndroidManifest.xml");
            e2.printStackTrace();
            final AlertDialog activityDialog2 = new AlertDialog.Builder(context).create();
            activityDialog2.setTitle("Whoops!");
            activityDialog2.setMessage("The developer has forgot to declare the VideoPlayer in the manifest file. Please reach out to the developer to remove this error.");
            activityDialog2.setButton(-3, "OK", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    activityDialog2.cancel();
                }
            });
            activityDialog2.show();
        }
    }

    public static class RequestListener {
        public void requestSucceeded(MMAdView adView) {
            MMAdViewSDK.Log.m4416d("Ad request succeeded.");
        }

        public void requestFailed(MMAdView adView, MMError error) {
            MMAdViewSDK.Log.m4417d("Ad request failed with error: %d %s.", Integer.valueOf(error.getCode()), error.getMessage());
        }
    }

    static class Request {
        String apid;
        boolean fetch;
        RequestListener requestListener;

        Request(String apid2, RequestListener requestListener2, boolean fetch2) {
            this.apid = apid2;
            this.requestListener = requestListener2;
            this.fetch = fetch2;
        }
    }

    public void startConversionTrackerWithGoalId(String goalId2) {
        MMConversionTracker.trackConversion(getContext(), goalId2);
    }

    public static void startConversionTrackerWithGoalId(Context context, String goalId2) {
        checkPermissions(context);
        MMConversionTracker.trackConversion(context, goalId2);
    }

    /* access modifiers changed from: package-private */
    public void prepareTransition(Bitmap bitmap) {
        this.imageView.setImageBitmap(bitmap);
        this.imageView.setVisibility(0);
        this.imageView.bringToFront();
    }

    /* access modifiers changed from: package-private */
    public void animateTransition() {
        if (this.imageView.getDrawable() != null) {
            MMAdViewSDK.runOnUiThread(new Runnable() {
                public void run() {
                    Animation animation;
                    int type = MMAdView.this.transitionType;
                    if (type == 4) {
                        type = new Random().nextInt(4);
                    }
                    switch (type) {
                        case 2:
                            animation = new TranslateAnimation(BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, -((float) MMAdView.this.getHeight()));
                            break;
                        case 3:
                            animation = new TranslateAnimation(BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, (float) MMAdView.this.getHeight());
                            break;
                        default:
                            animation = new AlphaAnimation(1.0f, BitmapDescriptorFactory.HUE_RED);
                            break;
                    }
                    animation.setDuration(1000);
                    animation.setAnimationListener(MMAdView.this);
                    animation.setFillEnabled(true);
                    animation.setFillBefore(true);
                    animation.setFillAfter(true);
                    MMAdView.this.imageView.startAnimation(animation);
                }
            });
        }
    }

    public void onAnimationStart(Animation animation) {
    }

    public void onAnimationEnd(Animation animation) {
        this.imageView.setVisibility(8);
    }

    public void onAnimationRepeat(Animation animation) {
    }

    /* access modifiers changed from: private */
    public void printDiagnostics() {
        Context context = getContext();
        MMAdViewSDK.Log.m4423i("MMAdView ID: %d", Integer.valueOf(getId()));
        MMAdViewSDK.Log.m4423i("APID: %s", this.apid);
        Object[] objArr = new Object[1];
        objArr[0] = Environment.getExternalStorageState().equals("mounted") ? "" : "not ";
        MMAdViewSDK.Log.m4423i("SD card is %savailable.", objArr);
        if (context != null) {
            MMAdViewSDK.Log.m4423i("Package: %s", context.getPackageName());
            MMAdViewSDK.Log.m4423i("HDID: %s", MMAdViewSDK.getHdid(context));
            MMAdViewSDK.Log.m4422i("Permissions:");
            Object[] objArr2 = new Object[1];
            objArr2[0] = context.checkCallingOrSelfPermission(Utility.READ_PHONE_STATE_PERMISSION) == -1 ? "not " : "";
            MMAdViewSDK.Log.m4423i("android.permission.READ_PHONE_STATE is %spresent", objArr2);
            Object[] objArr3 = new Object[1];
            objArr3[0] = context.checkCallingOrSelfPermission("android.permission.ACCESS_NETWORK_STATE") == -1 ? "not " : "";
            MMAdViewSDK.Log.m4423i("android.permission.ACCESS_NETWORK_STATE is %spresent", objArr3);
            Object[] objArr4 = new Object[1];
            objArr4[0] = context.checkCallingOrSelfPermission("android.permission.INTERNET") == -1 ? "not " : "";
            MMAdViewSDK.Log.m4423i("android.permission.INTERNET is %spresent", objArr4);
            Object[] objArr5 = new Object[1];
            objArr5[0] = context.checkCallingOrSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") == -1 ? "not " : "";
            MMAdViewSDK.Log.m4423i("android.permission.WRITE_EXTERNAL_STORAGE is %spresent", objArr5);
            Object[] objArr6 = new Object[1];
            objArr6[0] = context.checkCallingOrSelfPermission("android.permission.VIBRATE") == -1 ? "not " : "";
            MMAdViewSDK.Log.m4423i("android.permission.VIBRATE is %spresent", objArr6);
            Object[] objArr7 = new Object[1];
            objArr7[0] = context.checkCallingOrSelfPermission("android.permission.ACCESS_COARSE_LOCATION") == -1 ? "not " : "";
            MMAdViewSDK.Log.m4423i("android.permission.ACCESS_COARSE_LOCATION is %spresent", objArr7);
            Object[] objArr8 = new Object[1];
            objArr8[0] = context.checkCallingOrSelfPermission("android.permission.ACCESS_FINE_LOCATION") == -1 ? "not " : "";
            MMAdViewSDK.Log.m4423i("android.permission.ACCESS_FINE_LOCATION is %spresent", objArr8);
            MMAdViewSDK.Log.m4422i("Cached Ads:");
            AdCache.iterateCachedAds(context, 2, new AdCache.Iterator() {
                /* access modifiers changed from: package-private */
                public boolean callback(CachedAd ad) {
                    Object[] objArr = new Object[4];
                    objArr[0] = ad.getTypeString();
                    objArr[1] = ad.f3958id;
                    objArr[2] = ad.isOnDisk(MMAdView.this.getContext()) ? "" : "not ";
                    objArr[3] = ad.isExpired() ? "" : "not ";
                    MMAdViewSDK.Log.m4423i("%s %s is %son disk. Is %sexpired.", objArr);
                    return true;
                }
            });
        }
    }

    /* access modifiers changed from: package-private */
    public String getCachedName() {
        if (this.adType == null || this.apid == null) {
            return null;
        }
        return this.adType + "_" + this.apid;
    }
}
