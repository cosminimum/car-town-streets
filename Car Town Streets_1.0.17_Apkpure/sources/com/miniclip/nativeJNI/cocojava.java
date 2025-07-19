package com.miniclip.nativeJNI;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.opengl.GLES10;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.os.StatFs;
import android.os.Vibrator;
import android.text.ClipboardManager;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextWatcher;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.LinearInterpolator;
import android.view.animation.RotateAnimation;
import android.view.animation.ScaleAnimation;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.AccessToken;
import com.facebook.FacebookException;
import com.facebook.FacebookOperationCanceledException;
import com.facebook.HttpMethod;
import com.facebook.Request;
import com.facebook.RequestAsyncTask;
import com.facebook.Response;
import com.facebook.Session;
import com.facebook.SessionDefaultAudience;
import com.facebook.SessionLoginBehavior;
import com.facebook.SessionState;
import com.facebook.android.DialogError;
import com.facebook.android.Facebook;
import com.facebook.android.FacebookError;
import com.facebook.widget.ProfilePictureView;
import com.facebook.widget.WebDialog;
import com.flurry.android.Constants;
import com.flurry.android.FlurryAgent;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.millennialmedia.android.MMError;
import com.miniclip.NTP.NtpHandler;
import com.miniclip.Ping.PingHandler;
import com.miniclip.newsfeed.Newsfeed;
import com.miniclip.newsfeed.NewsfeedDialog;
import com.mopub.mobileads.MoPubConversionTracker;
import com.mopub.mobileads.MoPubInterstitial;
import com.mopub.mobileads.MoPubView;
import com.tapjoy.TapjoyConnect;
import com.tapjoy.TapjoyFeaturedAppNotifier;
import com.tapjoy.TapjoyFeaturedAppObject;
import com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class cocojava extends EasyAppConnectOffers implements MoPubInterstitial.MoPubInterstitialListener, DialogInterface.OnClickListener, View.OnClickListener, MoPubView.OnAdLoadedListener, MoPubView.OnAdFailedListener, MoPubView.OnAdClickedListener {
    static final /* synthetic */ boolean $assertionsDisabled;
    public static int ALIGN_LEFT = 0;
    public static int ALIGN_RIGHT = 0;
    public static String FILENAME = null;
    private static int GAME_MENU_STATE = 0;
    private static final int HANDLER_CLOSE_DIALOG = 3;
    private static final int HANDLER_EXIT_APP = 5;
    private static final int HANDLER_HIDE_DIALOG = 2;
    private static final int HANDLER_OPEN_URL = 4;
    private static final int HANDLER_SHOW_DIALOG = 1;
    protected static cocoaccel accelerometer;
    private static boolean accelerometerEnabled;
    public static RelativeLayout adLayout;
    public static RelativeLayout adLayoutH;
    private static MoPubView adViewGame;
    private static MoPubView adViewMenu;
    private static cocomusic backgroundMusicPlayer;
    private static MoPubView bigAd;
    private static boolean inAppsRemoveAds;
    private static MoPubInterstitial interstitial;
    public static RelativeLayout layout;
    protected static boolean mADS_BLOCKED_NOW;
    private static Handler mAdDelayHandler;
    private static RelativeLayout mBigAdView;
    public static boolean mBlockNewsButton;
    private static RelativeLayout mCenterdAd;
    protected static boolean mConstantAd;
    protected static Context mContext;
    protected static Newsfeed mCurrentNewsfeed;
    protected static NewsfeedDialog mCurrentNewsfeedDialog;
    protected static boolean mCustomInApp;
    protected static boolean mCustomLeaderboard;
    public static float mDensity;
    public static String mDeviceID;
    protected static boolean mENOUGH_MEMORY;
    public static EditText mEditText;
    private static boolean mFB_AuthenticationRequested;
    public static Session mFB_Session;
    public static String mFacebookAPP_ID;
    private static Handler mFacebookHandler;
    protected static TapjoyFeaturedAppObject mFeaturedApObject;
    protected static interstitialMopubView mFullscreenInterstitial;
    public static ClearGLSurfaceView mGLView;
    private static int mGameState;
    protected static boolean mHAS_RETINA;
    private static Handler mHandler;
    protected static boolean mHasSecondIntro;
    private static boolean mHasWindowFocus;
    public static int mHeight;
    private static Runnable mHideAdsRun;
    private static horizontalBanner mHorizontalBanner;
    public static boolean mHorizontalBannerDisplayed;
    protected static float mINGAME_HEIGHT;
    public static boolean mINGAME_LANDSCAPE;
    protected static boolean mINGAME_SCALE;
    protected static float mINGAME_WIDTH;
    public static int mInAppCallback;
    public static boolean mInAppManaged;
    public static String mInAppProductId;
    public static int mInAppResponce;
    public static int mInAppSelf;
    public static String mInAppTitle;
    private static infoTransmitter mInfoTransmitter;
    private static RelativeLayout mInitView;
    private static interstitialBanner mInterstitialBanner;
    public static boolean mKEYBOARD_CUSTOM_BACKGROUND;
    public static boolean mKEYBOARD_FULLSCREEN;
    public static boolean mKEYBOARD_INPUT_HIDE;
    public static boolean mKEYBOARD_INPUT_SINGLE_LINE;
    public static boolean mKEYBOARD_OVERRIDE_VISIBILITY;
    private static Handler mKeyboardHandler;
    protected static int mLastBigAdType;
    protected static boolean mMinimumResolutionSD;
    private static MopubInterstitial mMopubInterstitial;
    private static MopubView mMopubView;
    private static NtpHandler mNtpHandler;
    protected static int mNumCrashes;
    protected static int mNumUpSellsThisSession;
    private static PingHandler mPingHandler;
    public static SharedPreferences mPrefs;
    private static Button mRemove1;
    public static ImageView mRemoveAdsButton;
    public static boolean mRemoveAdsButtonHidden;
    public static RelativeLayout mRemoveAdsButtonLayout;
    public static ClearRenderer mRenderer;
    private static boolean mResumeOnFocus;
    private static rotatedBannerImg mRotatedBanner;
    public static int mRotatedBannerDisplayed;
    public static boolean mSHOW_KEYBOARD_INPUT;
    public static boolean mSPINNING_ANIMATION;
    protected static boolean mSTORE_PENDING_PURCHASES;
    protected static boolean mSTORE_PENDING_PURCHASES_SIGNATURE;
    private static Button mSkip1;
    public static boolean mTEST_INAPPS;
    protected static boolean mUSE_ADS;
    protected static boolean mUSE_ADS_BIG;
    protected static boolean mUSE_ADS_HORIZONTAL;
    protected static float mUSE_ADS_HORIZONTAL_BANNER_OFFSET;
    protected static boolean mUSE_ADS_INTERSTITIAL_BANNER;
    protected static boolean mUSE_ADS_INTERSTITIAL_FULLSCREEN;
    protected static boolean mUSE_ADS_VERTICAL;
    protected static float mUSE_ADS_VERTICAL_BANNER_OFFSET;
    public static boolean mUSE_C2DM;
    protected static boolean mUSE_DEVICEID;
    public static boolean mUSE_FACEBOOK;
    protected static boolean mUSE_NEWSFEED;
    protected static boolean mUSE_PRESERVE_CONTEXT;
    public static boolean mUSE_REMOVE_ADS;
    public static int mWidth;
    public static RelativeLayout sideBar1;
    public static RelativeLayout sideBar2;
    protected static cocosound soundPlayer;
    private static cocotexture texture;
    private HashMap<Integer, Dialog> mDialogs;
    private boolean isFirstRun = true;
    private Handler mScreenFixHandler = new Handler();

    static {
        $assertionsDisabled = !cocojava.class.desiredAssertionStatus();
        GAME_MENU_STATE = 0;
        ALIGN_LEFT = 0;
        ALIGN_RIGHT = 1;
        mRenderer = null;
        mUSE_PRESERVE_CONTEXT = true;
        mUSE_ADS = true;
        mINGAME_WIDTH = 480.0f;
        mINGAME_HEIGHT = 320.0f;
        mINGAME_SCALE = false;
        mMinimumResolutionSD = false;
        mINGAME_LANDSCAPE = true;
        mMopubInterstitial = null;
        mRemoveAdsButtonHidden = true;
        mUSE_REMOVE_ADS = false;
        mBlockNewsButton = false;
        mTEST_INAPPS = false;
        mSPINNING_ANIMATION = false;
        mSHOW_KEYBOARD_INPUT = false;
        mKEYBOARD_INPUT_SINGLE_LINE = false;
        mKEYBOARD_INPUT_HIDE = true;
        mKEYBOARD_OVERRIDE_VISIBILITY = false;
        mKEYBOARD_FULLSCREEN = true;
        mKEYBOARD_CUSTOM_BACKGROUND = false;
        mMopubView = null;
        mHandler = null;
        mAdDelayHandler = new Handler();
        mKeyboardHandler = new Handler();
        mFacebookHandler = new Handler();
        inAppsRemoveAds = false;
        mLastBigAdType = 0;
        mConstantAd = true;
        mRotatedBannerDisplayed = 0;
        mNumUpSellsThisSession = 0;
        mDeviceID = "";
        mUSE_ADS_BIG = true;
        mUSE_ADS_VERTICAL = false;
        mUSE_ADS_INTERSTITIAL_BANNER = false;
        mUSE_ADS_INTERSTITIAL_FULLSCREEN = false;
        mADS_BLOCKED_NOW = false;
        mFullscreenInterstitial = null;
        mUSE_ADS_VERTICAL_BANNER_OFFSET = BitmapDescriptorFactory.HUE_RED;
        mUSE_ADS_HORIZONTAL = false;
        mUSE_ADS_HORIZONTAL_BANNER_OFFSET = BitmapDescriptorFactory.HUE_RED;
        mHorizontalBanner = null;
        mHorizontalBannerDisplayed = false;
        mEditText = null;
        FILENAME = "AndroidSSO_data";
        mFB_AuthenticationRequested = false;
        mResumeOnFocus = false;
        mHAS_RETINA = false;
        mCustomInApp = false;
        mUSE_NEWSFEED = true;
        mUSE_DEVICEID = true;
        mUSE_C2DM = false;
        mSTORE_PENDING_PURCHASES = false;
        mSTORE_PENDING_PURCHASES_SIGNATURE = false;
        mCurrentNewsfeedDialog = null;
        mCurrentNewsfeed = null;
        mHasSecondIntro = false;
        mENOUGH_MEMORY = true;
        mCustomLeaderboard = false;
        mNumCrashes = 0;
        mUSE_FACEBOOK = false;
        mNtpHandler = new NtpHandler();
        mPingHandler = new PingHandler();
        mHideAdsRun = new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.29
            @Override // java.lang.Runnable
            public void run() {
                cocojava.hideAds();
            }
        };
        accelerometerEnabled = false;
    }

    protected String getMoPubBannerId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getMoPubGameplayBannerId() {
        return "ERROR! OVERRIDE ME!";
    }

    protected String getMoPubMenuBannerId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getMoPubInterstitialId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getMoPubFullScreenInterstitialId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getMoPubInterstitialBannerId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getFullAppURI() {
        return "ERROR! OVERRIDE ME!";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getFullVersionGameImageId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getTapJoyHtmlOffer(TapjoyFeaturedAppObject featApObj) {
        return "ERROR! OVERRIDE ME!";
    }

    protected void callGetJar(String itemID, int price, String title, int callback, int self, int showDialog) {
        Log.i("cocojava", "ERROR! OVERRIDE ME!");
    }

    protected int getJarRecommendedPrice(int price) {
        Log.i("cocojava", "ERROR! OVERRIDE ME!");
        return 0;
    }

    protected void createCustomNotification(int nid, String title, String text, int seconds) {
        Log.i("cocojava", "ERROR! OVERRIDE ME!");
    }

    protected void cancelCustomNotification(int nid) {
        Log.i("cocojava", "ERROR! OVERRIDE ME!");
    }

    @Override // com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mContext = this;
        if (mUSE_FACEBOOK) {
            mFB_Session = Session.openActiveSessionFromCache(mContext);
            if (mFB_Session == null) {
                Log.i("cocojava", "FB: Cannot open session from cache");
                mFB_Session = new Session(mContext);
            }
        }
        if (getTotalRAM() < 512000000) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.1
                @Override // java.lang.Runnable
                public void run() {
                    AlertDialog dialog = new AlertDialog.Builder(cocojava.mContext).create();
                    dialog.setTitle("Memory warning");
                    dialog.setMessage("Car Town Streets needs more than 512MB of RAM for an optimal gameplay experience. You might experience some problems.");
                    dialog.setButton(-1, "Ok", new DialogInterface.OnClickListener() { // from class: com.miniclip.nativeJNI.cocojava.1.1
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog2, int id) {
                        }
                    });
                    dialog.show();
                }
            });
        }
        if (Build.VERSION.SDK_INT >= 19) {
            getWindow().getDecorView().setOnSystemUiVisibilityChangeListener(new View.OnSystemUiVisibilityChangeListener() { // from class: com.miniclip.nativeJNI.cocojava.2
                @Override // android.view.View.OnSystemUiVisibilityChangeListener
                public void onSystemUiVisibilityChange(int visibility) {
                    cocojava.this.setSystemUiVisibility();
                }
            });
            setSystemUiVisibility();
        }
        setVolumeControlStream(3);
        mInitView = new RelativeLayout(this);
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-1, -1);
        mInitView.setLayoutParams(params);
        mInitView.setPadding(0, 0, 0, 0);
        int resourceId2 = mContext.getResources().getIdentifier("default2", "drawable", mContext.getPackageName());
        if (resourceId2 != 0) {
            mHasSecondIntro = true;
        }
        ImageView bg1 = new ImageView(this);
        int resourceId = mContext.getResources().getIdentifier("default1", "drawable", mContext.getPackageName());
        bg1.setImageDrawable(getResources().getDrawable(resourceId));
        bg1.setLayoutParams(new Gallery.LayoutParams(-1, -1));
        bg1.setScaleType(ImageView.ScaleType.FIT_XY);
        mInitView.addView(bg1);
        float f = getResources().getDisplayMetrics().density;
        float f2 = getResources().getDisplayMetrics().widthPixels;
        float height = getResources().getDisplayMetrics().heightPixels;
        RelativeLayout mainContainer = new RelativeLayout(this);
        RelativeLayout.LayoutParams mainContainerParams = new RelativeLayout.LayoutParams((int) (height / 2.0f), (int) (height / 2.0f));
        mainContainerParams.addRule(14);
        mainContainerParams.addRule(12);
        mainContainer.setLayoutParams(mainContainerParams);
        mInitView.addView(mainContainer);
        if (mSPINNING_ANIMATION) {
            ImageView ball = new ImageView(this);
            int ballResourceId = mContext.getResources().getIdentifier("spinning_ball", "drawable", mContext.getPackageName());
            ball.setImageDrawable(getResources().getDrawable(ballResourceId));
            RelativeLayout.LayoutParams ballParams = new RelativeLayout.LayoutParams((int) (height / 10.0f), (int) (height / 10.0f));
            ballParams.addRule(13);
            ball.setLayoutParams(ballParams);
            ball.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            mainContainer.addView(ball);
            ImageView ballSpin = new ImageView(this);
            int ballSpinResourceId = mContext.getResources().getIdentifier("spinning_ball_effect", "drawable", mContext.getPackageName());
            ballSpin.setImageDrawable(getResources().getDrawable(ballSpinResourceId));
            RelativeLayout.LayoutParams ballSpinParams = new RelativeLayout.LayoutParams((int) (height / 8.0f), (int) (height / 8.0f));
            ballSpinParams.addRule(13);
            ballSpin.setLayoutParams(ballSpinParams);
            ballSpin.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            mainContainer.addView(ballSpin);
            Animation anim = new RotateAnimation(BitmapDescriptorFactory.HUE_RED, 360.0f, ((int) (height / 8.0f)) / 2, ((int) (height / 8.0f)) / 2);
            anim.setDuration(1000L);
            anim.setRepeatCount(-1);
            anim.setInterpolator(new LinearInterpolator());
            anim.setFillAfter(true);
            ballSpin.startAnimation(anim);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSystemUiVisibility() {
        getWindow().getDecorView().setSystemUiVisibility(5894);
    }

    public static boolean isInstalledOnSdCard() {
        try {
            String filesDir = mContext.getFilesDir().getAbsolutePath();
            if (filesDir.startsWith("/data/")) {
                return false;
            }
            if (!filesDir.contains("/mnt/")) {
                if (!filesDir.contains("/sdcard/")) {
                    return false;
                }
            }
            return true;
        } catch (Throwable th) {
            return false;
        }
    }

    public static long getAvailableMemory(boolean onSDcard) {
        File path;
        if (onSDcard) {
            path = Environment.getExternalStorageDirectory();
        } else {
            path = Environment.getDataDirectory();
        }
        StatFs stat = new StatFs(path.getPath());
        long availableSpace = stat.getAvailableBlocks() * stat.getBlockSize();
        Log.i("cocojava", "Available " + (onSDcard ? "sdcard" : "internal") + " memory: " + (availableSpace / 1048576));
        return availableSpace / 1048576;
    }

    public static void displayFreeSpaceWarning(String message) {
        AlertDialog dialog = new AlertDialog.Builder(mContext).create();
        dialog.setTitle("Not enough memory");
        dialog.setMessage(message);
        dialog.setButton(-1, "Ok", new DialogInterface.OnClickListener() { // from class: com.miniclip.nativeJNI.cocojava.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog2, int id) {
                dialog2.cancel();
                cocojava.exitApplication();
            }
        });
        dialog.show();
    }

    public static void displayIntro(String s) {
        mInitView.removeAllViews();
        ImageView bg1 = new ImageView(mContext);
        int resourceId = mContext.getResources().getIdentifier(s, "drawable", mContext.getPackageName());
        bg1.setImageDrawable(mContext.getResources().getDrawable(resourceId));
        bg1.setLayoutParams(new Gallery.LayoutParams(-1, -1));
        bg1.setScaleType(ImageView.ScaleType.FIT_XY);
        mInitView.addView(bg1);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.app.Activity
    public void onStart() {
        super.onStart();
        firstRun();
    }

    @Override // android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        Log.i("cocojava", "onActivityResult");
        if (mUSE_FACEBOOK) {
            mFB_Session.onActivityResult(this, requestCode, resultCode, data);
        }
    }

    public void firstRun() {
        if (this.isFirstRun) {
            this.isFirstRun = false;
            Log.i("JAVAINFO", "firstRun");
            if (mUSE_DEVICEID) {
                mDeviceID = getDeviceId();
            }
            CocoJNI.MsetMainActivity(mContext);
            CocoJNI.MsetCountryCode(Locale.getDefault().getLanguage());
            mFeaturedApObject = null;
            if (mUSE_ADS) {
                new MoPubConversionTracker().reportAppOpen(this);
                adViewGame = null;
                adViewMenu = null;
                mBigAdView = null;
                mInterstitialBanner = null;
                mFullscreenInterstitial = null;
                mRotatedBanner = null;
                mHorizontalBanner = null;
            }
            CocoJNI.MsetAppVersionNumber(getAppVersionNumber());
            if (getFilesDir() == null) {
                new File("/data/data/" + getPackageName() + "/files/").mkdirs();
            }
            CocoJNI.MsetFilesPath(getFilesDir().getAbsolutePath(), getExternalStorageDirectory());
            Log.i("Files Path", getFilesDir().getAbsolutePath());
            mWidth = getResources().getDisplayMetrics().widthPixels;
            mHeight = getResources().getDisplayMetrics().heightPixels;
            if (mMinimumResolutionSD) {
                if (!mINGAME_LANDSCAPE) {
                    mWidth = 320;
                    mHeight = 480;
                } else {
                    mWidth = 480;
                    mHeight = 320;
                }
            }
            mDensity = getResources().getDisplayMetrics().density;
            Log.i("Dim", String.format("width: %d, height: %d, density: %f", Integer.valueOf(mWidth), Integer.valueOf(mHeight), Float.valueOf(mDensity)));
            CocoJNI.MsetDensity(mDensity);
            CocoJNI.MdisplayInfo(mWidth, mHeight);
            backgroundMusicPlayer = new cocomusic(this);
            soundPlayer = new cocosound(this);
            accelerometer = new cocoaccel(this);
            enableAccelerometer();
            texture = new cocotexture(this);
            mGLView = new ClearGLSurfaceView(this);
            mRenderer = new ClearRenderer();
            mRenderer.setContext(mContext);
            mGLView.setRenderer(mRenderer);
            adLayout = new RelativeLayout(this);
            adLayout.setMinimumWidth(mWidth);
            adLayout.setMinimumHeight(mHeight);
            adLayoutH = new RelativeLayout(this);
            RelativeLayout.LayoutParams paramsH = new RelativeLayout.LayoutParams(-1, -1);
            adLayoutH.setLayoutParams(paramsH);
            adLayoutH.addView(adLayout);
            layout = new RelativeLayout(this);
            layout.setMinimumWidth(mWidth);
            layout.setMinimumHeight(mHeight);
            if (mUSE_ADS_VERTICAL) {
                int resourceIdSide1 = mContext.getResources().getIdentifier("side1", "drawable", mContext.getPackageName());
                int resourceIdSide2 = mContext.getResources().getIdentifier("side2", "drawable", mContext.getPackageName());
                int resourceIdSide3 = mContext.getResources().getIdentifier("side3", "drawable", mContext.getPackageName());
                mContext.getResources().getIdentifier("a100x640", "drawable", mContext.getPackageName());
                sideBar1 = new RelativeLayout(this);
                RelativeLayout.LayoutParams sideBar1Params = new RelativeLayout.LayoutParams((int) (50.0f * mDensity), (int) ((mHeight - (320.0f * mDensity)) * 0.5f));
                sideBar1.setLayoutParams(sideBar1Params);
                ImageView sideBar1Image1 = new ImageView(this);
                sideBar1Image1.setImageDrawable(getResources().getDrawable(resourceIdSide2));
                sideBar1Image1.setLayoutParams(new Gallery.LayoutParams(-1, -1));
                sideBar1Image1.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar1.addView(sideBar1Image1);
                ImageView sideBar1Image2 = new ImageView(this);
                sideBar1Image2.setImageDrawable(getResources().getDrawable(resourceIdSide1));
                sideBar1Image2.setLayoutParams(new Gallery.LayoutParams(-1, (int) (20.0f * mDensity)));
                sideBar1Image2.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar1.addView(sideBar1Image2);
                RelativeLayout sideBar1Layout1 = new RelativeLayout(this);
                RelativeLayout.LayoutParams sideBar1Layout1Params = new RelativeLayout.LayoutParams(-1, (int) (20.0f * mDensity));
                sideBar1Layout1Params.addRule(12);
                sideBar1Layout1.setLayoutParams(sideBar1Layout1Params);
                ImageView sideBar1Image3 = new ImageView(this);
                sideBar1Image3.setImageDrawable(getResources().getDrawable(resourceIdSide3));
                sideBar1Image3.setLayoutParams(new Gallery.LayoutParams(-1, (int) (20.0f * mDensity)));
                sideBar1Image3.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar1Layout1.addView(sideBar1Image3);
                sideBar1.addView(sideBar1Layout1);
                sideBar2 = new RelativeLayout(this);
                RelativeLayout.LayoutParams sideBar2Params = new RelativeLayout.LayoutParams((int) (50.0d * mDensity), (int) ((mHeight - (320.0f * mDensity)) * 0.5f));
                sideBar2Params.addRule(12);
                sideBar2.setLayoutParams(sideBar2Params);
                ImageView sideBar2Image1 = new ImageView(this);
                sideBar2Image1.setImageDrawable(getResources().getDrawable(resourceIdSide2));
                sideBar2Image1.setLayoutParams(new Gallery.LayoutParams(-1, -1));
                sideBar2Image1.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar2.addView(sideBar2Image1);
                RelativeLayout sideBar2Layout1 = new RelativeLayout(this);
                RelativeLayout.LayoutParams sideBar2Layout1Params = new RelativeLayout.LayoutParams(-1, (int) (20.0f * mDensity));
                sideBar2Layout1Params.addRule(12);
                sideBar2Layout1.setLayoutParams(sideBar2Layout1Params);
                ImageView sideBar2Image3 = new ImageView(this);
                sideBar2Image3.setImageDrawable(getResources().getDrawable(resourceIdSide3));
                sideBar2Image3.setLayoutParams(new Gallery.LayoutParams(-1, (int) (20.0f * mDensity)));
                sideBar2Image3.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar2Layout1.addView(sideBar2Image3);
                sideBar2.addView(sideBar2Layout1);
                ImageView sideBar2Image2 = new ImageView(this);
                sideBar2Image2.setImageDrawable(getResources().getDrawable(resourceIdSide1));
                sideBar2Image2.setLayoutParams(new Gallery.LayoutParams(-1, (int) (20.0f * mDensity)));
                sideBar2Image2.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar2.addView(sideBar2Image2);
                mRotatedBanner = new rotatedBannerImg(this, ALIGN_LEFT);
                layout.addView(mRotatedBanner);
                layout.addView(sideBar1);
                layout.addView(sideBar2);
                mRotatedBanner.setBlockAutoRefresh(false);
                mRotatedBanner.setAutorefreshEnabled(false);
                mRotatedBanner.setBlockAutoRefresh(true);
            } else if (mUSE_ADS_HORIZONTAL) {
                int resourceIdSide12 = mContext.getResources().getIdentifier("side1", "drawable", mContext.getPackageName());
                int resourceIdSide22 = mContext.getResources().getIdentifier("side2", "drawable", mContext.getPackageName());
                int resourceIdSide32 = mContext.getResources().getIdentifier("side3", "drawable", mContext.getPackageName());
                RelativeLayout sideBar12 = new RelativeLayout(this);
                RelativeLayout.LayoutParams sideBar1Params2 = new RelativeLayout.LayoutParams((int) ((mWidth - (320.0f * mDensity)) * 0.5f), (int) (50.0d * mDensity));
                sideBar12.setLayoutParams(sideBar1Params2);
                ImageView sideBar1Image12 = new ImageView(this);
                sideBar1Image12.setImageDrawable(getResources().getDrawable(resourceIdSide22));
                sideBar1Image12.setLayoutParams(new Gallery.LayoutParams(-1, -1));
                sideBar1Image12.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar12.addView(sideBar1Image12);
                ImageView sideBar1Image22 = new ImageView(this);
                sideBar1Image22.setImageDrawable(getResources().getDrawable(resourceIdSide12));
                sideBar1Image22.setLayoutParams(new Gallery.LayoutParams((int) (20.0f * mDensity), -1));
                sideBar1Image22.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar12.addView(sideBar1Image22);
                RelativeLayout sideBar1Layout12 = new RelativeLayout(this);
                RelativeLayout.LayoutParams sideBar1Layout1Params2 = new RelativeLayout.LayoutParams((int) (20.0f * mDensity), -1);
                sideBar1Layout1Params2.addRule(11);
                sideBar1Layout12.setLayoutParams(sideBar1Layout1Params2);
                ImageView sideBar1Image32 = new ImageView(this);
                sideBar1Image32.setImageDrawable(getResources().getDrawable(resourceIdSide32));
                sideBar1Image32.setLayoutParams(new Gallery.LayoutParams((int) (20.0f * mDensity), -1));
                sideBar1Image32.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar1Layout12.addView(sideBar1Image32);
                sideBar12.addView(sideBar1Layout12);
                RelativeLayout sideBar22 = new RelativeLayout(this);
                RelativeLayout.LayoutParams sideBar2Params2 = new RelativeLayout.LayoutParams((int) ((mWidth - (320.0f * mDensity)) * 0.5f), (int) (50.0d * mDensity));
                sideBar2Params2.addRule(11);
                sideBar22.setLayoutParams(sideBar2Params2);
                ImageView sideBar2Image12 = new ImageView(this);
                sideBar2Image12.setImageDrawable(getResources().getDrawable(resourceIdSide22));
                sideBar2Image12.setLayoutParams(new Gallery.LayoutParams(-1, -1));
                sideBar2Image12.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar22.addView(sideBar2Image12);
                RelativeLayout sideBar2Layout12 = new RelativeLayout(this);
                RelativeLayout.LayoutParams sideBar2Layout1Params2 = new RelativeLayout.LayoutParams((int) (20.0f * mDensity), -1);
                sideBar2Layout1Params2.addRule(11);
                sideBar2Layout12.setLayoutParams(sideBar2Layout1Params2);
                ImageView sideBar2Image32 = new ImageView(this);
                sideBar2Image32.setImageDrawable(getResources().getDrawable(resourceIdSide32));
                sideBar2Image32.setLayoutParams(new Gallery.LayoutParams((int) (20.0f * mDensity), -1));
                sideBar2Image32.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar2Layout12.addView(sideBar2Image32);
                sideBar22.addView(sideBar2Layout12);
                ImageView sideBar2Image22 = new ImageView(this);
                sideBar2Image22.setImageDrawable(getResources().getDrawable(resourceIdSide12));
                sideBar2Image22.setLayoutParams(new Gallery.LayoutParams((int) (20.0f * mDensity), -1));
                sideBar2Image22.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar22.addView(sideBar2Image22);
                mHorizontalBanner = new horizontalBanner(this);
                layout.addView(sideBar12);
                layout.addView(sideBar22);
                layout.addView(mHorizontalBanner);
                mHorizontalBanner.setBlockAutoRefresh(false);
                mHorizontalBanner.setAutorefreshEnabled(false);
                mHorizontalBanner.setBlockAutoRefresh(true);
            }
            layout.addView(mGLView);
            layout.addView(adLayoutH);
            layout.addView(mInitView);
            setContentView(layout);
            showTapFeatureAd();
            if (mUSE_ADS_BIG) {
            }
            if (mUSE_ADS) {
            }
            if (mUSE_ADS_INTERSTITIAL_FULLSCREEN) {
                mFullscreenInterstitial = new interstitialMopubView(mContext);
                mFullscreenInterstitial.loadAd();
                layout.addView(mFullscreenInterstitial);
            }
            if (mUSE_ADS_INTERSTITIAL_BANNER) {
                mInterstitialBanner = new interstitialBanner(this);
                mInterstitialBanner.loadAd();
                layout.addView(mInterstitialBanner);
            }
            mHandler = new Handler() { // from class: com.miniclip.nativeJNI.cocojava.4
                @Override // android.os.Handler
                public void handleMessage(Message msg) {
                    switch (msg.what) {
                        case 1:
                            DialogMessage dm = (DialogMessage) msg.obj;
                            cocojava.this.showDialog(dm.msgId, dm.title, dm.message, dm.buttonTitles);
                            return;
                        case 2:
                            DialogMessage dm2 = (DialogMessage) msg.obj;
                            cocojava.this.hideDialog(dm2.msgId);
                            return;
                        case 3:
                            DialogMessage dm3 = (DialogMessage) msg.obj;
                            cocojava.this.closeDialog(dm3.msgId);
                            return;
                        case 4:
                            cocojava.this.openURL((String) msg.obj);
                            return;
                        case 5:
                            cocojava.this.finish();
                            return;
                        default:
                            return;
                    }
                }
            };
            if (mEditText == null) {
                mEditText = new EditText(mContext) { // from class: com.miniclip.nativeJNI.cocojava.5
                    @Override // android.widget.TextView, android.view.View
                    public boolean onKeyPreIme(int keyCode, KeyEvent event) {
                        return true;
                    }
                };
                if (mKEYBOARD_INPUT_HIDE) {
                    RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(1, 1);
                    mEditText.setLayoutParams(params);
                }
                mEditText.setImeOptions(6);
                mEditText.addTextChangedListener(new TextWatcher() { // from class: com.miniclip.nativeJNI.cocojava.6
                    @Override // android.text.TextWatcher
                    public void onTextChanged(CharSequence s, int start, int before, int count) {
                        if (cocojava.mEditText.getVisibility() != 4) {
                            cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.6.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    CocoJNI.MkeyboardInputResponse(cocojava.mEditText.getText().toString());
                                }
                            });
                        }
                    }

                    @Override // android.text.TextWatcher
                    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                    }

                    @Override // android.text.TextWatcher
                    public void afterTextChanged(Editable s) {
                    }
                });
                mEditText.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: com.miniclip.nativeJNI.cocojava.7
                    @Override // android.widget.TextView.OnEditorActionListener
                    public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                        if (cocojava.mEditText.getVisibility() != 4) {
                            if (actionId == 6 || event.getKeyCode() == 66 || actionId == 5) {
                                ((Activity) cocojava.mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.7.1
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        if (!cocojava.mKEYBOARD_OVERRIDE_VISIBILITY) {
                                            cocojava.mEditText.setVisibility(4);
                                        }
                                        InputMethodManager imm = (InputMethodManager) cocojava.mContext.getSystemService("input_method");
                                        imm.hideSoftInputFromWindow(cocojava.mEditText.getWindowToken(), 0);
                                    }
                                });
                            }
                            cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.7.2
                                @Override // java.lang.Runnable
                                public void run() {
                                    CocoJNI.MkeyboardInputClosed(cocojava.mEditText.getText().toString());
                                }
                            });
                        }
                        return false;
                    }
                });
                mEditText.setWidth(2000);
                if (!mKEYBOARD_OVERRIDE_VISIBILITY) {
                    mEditText.setVisibility(4);
                }
                if (mSHOW_KEYBOARD_INPUT) {
                    layout.addView(mEditText);
                } else {
                    if (mKEYBOARD_INPUT_SINGLE_LINE) {
                        mEditText.setMaxLines(1);
                    }
                    RelativeLayout hideEditText = new RelativeLayout(mContext);
                    RelativeLayout.LayoutParams hideEditTestParams = new RelativeLayout.LayoutParams(-2, -2);
                    hideEditText.setLayoutParams(hideEditTestParams);
                    hideEditText.addView(mEditText);
                    int i = Build.VERSION.SDK_INT;
                    layout.addView(hideEditText);
                }
                if (!mKEYBOARD_FULLSCREEN) {
                    mEditText.setImeOptions(268435462);
                }
                mEditText.setOnClickListener(new View.OnClickListener() { // from class: com.miniclip.nativeJNI.cocojava.8
                    @Override // android.view.View.OnClickListener
                    public void onClick(View arg0) {
                    }
                });
                if (mKEYBOARD_CUSTOM_BACKGROUND) {
                    int resourceIdInputBackground = mContext.getResources().getIdentifier("roundsquare", "drawable", mContext.getPackageName());
                    mEditText.setBackgroundDrawable(getResources().getDrawable(resourceIdInputBackground));
                }
            }
            this.mDialogs = new HashMap<>();
            isSDcardPresent();
            availableMemoryOnDevice();
            availableMemoryOnSDcard();
            if (mUSE_REMOVE_ADS) {
                int height = getResources().getDisplayMetrics().heightPixels;
                float scaleF = height / 480.0f;
                RelativeLayout.LayoutParams paramsnb = new RelativeLayout.LayoutParams((int) (100.0f * scaleF), (int) (59.0f * scaleF));
                paramsnb.addRule(12);
                paramsnb.leftMargin = (int) (5.0f * scaleF);
                paramsnb.bottomMargin = (int) (200.0f * scaleF);
                mRemoveAdsButton = new ImageView(this);
                int resourceIda = getResources().getIdentifier("remove_ads", "drawable", getPackageName());
                mRemoveAdsButton.setImageDrawable(getResources().getDrawable(resourceIda));
                mRemoveAdsButton.setOnClickListener(this);
                mRemoveAdsButton.setLayoutParams(paramsnb);
                mRemoveAdsButtonLayout = new RelativeLayout(this);
                layout.addView(mRemoveAdsButtonLayout);
            }
            if (mUSE_NEWSFEED) {
                mCurrentNewsfeed = new Newsfeed(mContext, mDeviceID);
                Handler handler = new Handler();
                handler.postDelayed(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.9
                    @Override // java.lang.Runnable
                    public void run() {
                        cocojava.mCurrentNewsfeed.update();
                    }
                }, 2000L);
            }
        }
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onLowMemory() {
        Log.i("MEMORY WARNING", "LOW MEMORY");
        mNumCrashes++;
        if (mNumCrashes >= 3) {
            mNumCrashes = 0;
            mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.10
                @Override // java.lang.Runnable
                public void run() {
                    CocoJNI.MlowMemory();
                }
            });
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(final int keyCode, KeyEvent event) {
        switch (keyCode) {
            case 4:
                if (event.isAltPressed()) {
                    mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.11
                        @Override // java.lang.Runnable
                        public void run() {
                            CocoJNI.MpressedKey(keyCode, 1);
                        }
                    });
                    return true;
                }
                mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.12
                    @Override // java.lang.Runnable
                    public void run() {
                        CocoJNI.MpressedBackButton();
                    }
                });
                return true;
            case 19:
            case MMError.DISPLAY_AD_NOT_READY /* 20 */:
            case MMError.DISPLAY_AD_EXPIRED /* 21 */:
            case MMError.DISPLAY_AD_NOT_FOUND /* 22 */:
            case MMError.DISPLAY_AD_ALREADY_DISPLAYED /* 23 */:
            case 82:
            case 99:
            case 100:
            case 108:
            case 109:
                mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.13
                    @Override // java.lang.Runnable
                    public void run() {
                        CocoJNI.MpressedKey(keyCode, 1);
                    }
                });
                return true;
            default:
                return super.onKeyDown(keyCode, event);
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyUp(final int keyCode, KeyEvent event) {
        switch (keyCode) {
            case 19:
            case MMError.DISPLAY_AD_NOT_READY /* 20 */:
            case MMError.DISPLAY_AD_EXPIRED /* 21 */:
            case MMError.DISPLAY_AD_NOT_FOUND /* 22 */:
            case MMError.DISPLAY_AD_ALREADY_DISPLAYED /* 23 */:
            case 82:
            case 99:
            case 100:
            case 108:
            case 109:
                mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.14
                    @Override // java.lang.Runnable
                    public void run() {
                        CocoJNI.MpressedKey(keyCode, 0);
                    }
                });
                return true;
            default:
                return super.onKeyUp(keyCode, event);
        }
    }

    int buttonValue2Int(int value) {
        switch (value) {
            case ProfilePictureView.NORMAL /* -3 */:
                return 2;
            case -2:
                return 1;
            case -1:
                return 0;
            default:
                if ($assertionsDisabled) {
                    return 0;
                }
                throw new AssertionError();
        }
    }

    int int2ButtonValue(int value) {
        switch (value) {
            case 0:
                return -1;
            case 1:
                return -2;
            case 2:
                return -3;
            default:
                if ($assertionsDisabled) {
                    return -2;
                }
                throw new AssertionError();
        }
    }

    void showDialog(int msgId, String title, String message, String[] buttonTitles) {
        Dialog dialog;
        if (!this.mDialogs.containsKey(Integer.valueOf(msgId))) {
            if (buttonTitles.length < 4) {
                AlertDialog.Builder builder = new AlertDialog.Builder(this).setTitle(title).setMessage(message);
                for (int i = 0; i < buttonTitles.length; i++) {
                    if (int2ButtonValue(i) == -1) {
                        builder.setPositiveButton(buttonTitles[i], this);
                    } else if (int2ButtonValue(i) == -2) {
                        builder.setNegativeButton(buttonTitles[i], this);
                    } else if (int2ButtonValue(i) == -3) {
                        builder.setNeutralButton(buttonTitles[i], this);
                    }
                }
                dialog = builder.create();
            } else {
                dialog = new AlertDialog.Builder(this).create();
                dialog.setTitle(title);
                ((AlertDialog) dialog).setMessage(message);
                for (int i2 = 0; i2 < buttonTitles.length; i2++) {
                    ((AlertDialog) dialog).setButton(int2ButtonValue(i2), buttonTitles[i2], this);
                }
            }
            this.mDialogs.put(Integer.valueOf(msgId), dialog);
        } else {
            Dialog dialog2 = this.mDialogs.get(Integer.valueOf(msgId));
            dialog = dialog2;
        }
        dialog.show();
    }

    void hideDialog(int msgId) {
        Dialog dialog;
        if (this.mDialogs.containsKey(Integer.valueOf(msgId)) && (dialog = this.mDialogs.get(Integer.valueOf(msgId))) != null) {
            dialog.hide();
        }
    }

    void closeDialog(int msgId) {
        if (this.mDialogs.containsKey(Integer.valueOf(msgId))) {
            Dialog dialog = this.mDialogs.get(Integer.valueOf(msgId));
            if (dialog != null) {
                dialog.dismiss();
            }
            this.mDialogs.remove(Integer.valueOf(msgId));
        }
    }

    public static void showMessageBox(int msgId, String title, String message, String[] buttonTitles) {
        DialogMessage dm = new DialogMessage(msgId);
        dm.title = title;
        dm.message = message;
        dm.buttonTitles = buttonTitles;
        Message msg = new Message();
        msg.what = 1;
        msg.obj = dm;
        mHandler.sendMessage(msg);
    }

    public static void hideMessageBox(int msgId) {
        Message msg = new Message();
        msg.what = 2;
        msg.obj = new DialogMessage(msgId);
        mHandler.sendMessage(msg);
    }

    public static void closeMessageBox(int msgId) {
        Message msg = new Message();
        msg.what = 3;
        msg.obj = new DialogMessage(msgId);
        mHandler.sendMessage(msg);
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialog, int buttonIndex) {
        for (Map.Entry<Integer, Dialog> entry : this.mDialogs.entrySet()) {
            if (entry.getValue() == dialog) {
                CocoJNI.MonMessageBoxButtonPressed(entry.getKey().intValue(), buttonValue2Int(buttonIndex));
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.app.Activity
    public void onStop() {
        super.onStop();
        FlurryAgent.onEndSession(this);
    }

    public static void showTapJoyOffers() {
        if (mUSE_TAPJOY) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.15
                @Override // java.lang.Runnable
                public void run() {
                    TapjoyConnect.getTapjoyConnectInstance().showOffers();
                }
            });
        }
    }

    public static void spendTapPoints(final int points) {
        if (mUSE_TAPJOY) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.16
                @Override // java.lang.Runnable
                public void run() {
                    TapjoyConnect.getTapjoyConnectInstance().spendTapPoints(points, null);
                }
            });
        }
    }

    public static void showTapJoyView(TapjoyFeaturedAppObject featuredApObject) {
        mFeaturedApObject = featuredApObject;
    }

    protected void showMiniclipViewInternal() {
        MiniclipUpsellView upView = new MiniclipUpsellView(mContext);
        layout.removeView(upView);
        layout.addView(upView);
    }

    public static void showMiniclipView() {
        if (mUSE_ADS) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.17
                @Override // java.lang.Runnable
                public void run() {
                    ((cocojava) cocojava.mContext).showMiniclipViewInternal();
                }
            });
        }
    }

    public static void showTapFeatureAd() {
        if (mUSE_TAPJOY) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.18
                @Override // java.lang.Runnable
                public void run() {
                    TapjoyConnect.getTapjoyConnectInstance().getFeaturedApp((TapjoyFeaturedAppNotifier) cocojava.mContext);
                }
            });
        }
    }

    public static void showSimpleTapjoyFeatureAd() {
        if (mUSE_TAPJOY) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.19
                @Override // java.lang.Runnable
                public void run() {
                    if (cocojava.mFeaturedApObject != null) {
                        cocojava.showTJOfferDialog();
                    } else {
                        cocojava.showTapFeatureAd();
                    }
                }
            });
        }
    }

    public static void tapjoy_showTapFeatureAdFailed() {
        mFeaturedApObject = null;
    }

    public static void mopub_showAdFailed() {
        Log.i("mopub", "showAdFailed");
        showMiniclipView();
    }

    public static void showInterstitialMopubView() {
        if (mUSE_ADS_INTERSTITIAL_FULLSCREEN && mUSE_ADS) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.20
                @Override // java.lang.Runnable
                public void run() {
                    cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.20.1
                        @Override // java.lang.Runnable
                        public void run() {
                            CocoJNI.MsetGamePause(1);
                        }
                    });
                    if (cocojava.adLayout.getParent() == cocojava.adLayoutH) {
                        cocojava.adLayoutH.removeView(cocojava.adLayout);
                    }
                    cocojava.mFullscreenInterstitial.showAd();
                }
            });
        }
    }

    public static void showMopubView() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.21
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.mBigAdView != null) {
                    cocojava.mBigAdView.removeAllViews();
                } else {
                    RelativeLayout unused = cocojava.mBigAdView = new RelativeLayout(cocojava.mContext);
                    RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-1, -1);
                    cocojava.mBigAdView.setHorizontalGravity(17);
                    cocojava.mBigAdView.setVerticalGravity(80);
                    cocojava.mBigAdView.setLayoutParams(params);
                    cocojava.layout.addView(cocojava.mBigAdView);
                }
                RelativeLayout unused2 = cocojava.mCenterdAd = new RelativeLayout(cocojava.mContext);
                RelativeLayout.LayoutParams params2 = new RelativeLayout.LayoutParams(((int) (300.0d * cocojava.mDensity)) + 40, -1);
                cocojava.mCenterdAd.setLayoutParams(params2);
                cocojava.mCenterdAd.setOnClickListener((View.OnClickListener) cocojava.mContext);
                cocojava.mBigAdView.addView(cocojava.mCenterdAd);
                ImageView bg1 = new ImageView(cocojava.mContext);
                int resourceId = cocojava.mContext.getResources().getIdentifier("full_dialog1", "drawable", cocojava.mContext.getPackageName());
                bg1.setImageDrawable(cocojava.mContext.getResources().getDrawable(resourceId));
                bg1.setScaleType(ImageView.ScaleType.FIT_XY);
                bg1.setLayoutParams(new Gallery.LayoutParams(-1, -1));
                cocojava.mCenterdAd.addView(bg1);
                RelativeLayout centerdButton = new RelativeLayout(cocojava.mContext);
                RelativeLayout.LayoutParams paramsB = new RelativeLayout.LayoutParams(-1, -2);
                centerdButton.setVerticalGravity(80);
                paramsB.addRule(12);
                centerdButton.setLayoutParams(paramsB);
                centerdButton.setPadding(20, 0, 20, 5);
                cocojava.mCenterdAd.addView(centerdButton);
                Button unused3 = cocojava.mSkip1 = new Button(cocojava.mContext);
                new RelativeLayout.LayoutParams(((int) ((300.0d * cocojava.mDensity) * 0.5d)) - 40, -2);
                cocojava.mSkip1.setText("Skip");
                centerdButton.addView(cocojava.mSkip1);
                cocojava.mSkip1.setOnClickListener((View.OnClickListener) cocojava.mContext);
                Button unused4 = cocojava.mRemove1 = new Button(cocojava.mContext);
                RelativeLayout.LayoutParams paramsR = new RelativeLayout.LayoutParams(((int) ((300.0d * cocojava.mDensity) * 0.5d)) - 40, -2);
                paramsR.addRule(11);
                cocojava.mRemove1.setLayoutParams(paramsR);
                cocojava.mRemove1.setText("Remove Ads");
                centerdButton.addView(cocojava.mRemove1);
                cocojava.mRemove1.setOnClickListener((View.OnClickListener) cocojava.mContext);
                cocojava.mBigAdView.setOnClickListener((View.OnClickListener) cocojava.mContext);
                cocojava.mBigAdView.setClickable(true);
                cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.21.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CocoJNI.MsetGamePause(1);
                    }
                });
            }
        });
    }

    protected void showInterstitial() {
    }

    public static void pushInterstitial() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.22
            @Override // java.lang.Runnable
            public void run() {
                ((cocojava) cocojava.mContext).showInterstitial();
            }
        });
    }

    public static void showBigAd() {
        if (mUSE_ADS_BIG && mUSE_ADS) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.23
                @Override // java.lang.Runnable
                public void run() {
                    MoPubView bigAd2 = new MoPubView(cocojava.mContext);
                    bigAd2.setOnAdLoadedListener((cocojava) cocojava.mContext);
                    bigAd2.setAdUnitId(((cocojava) cocojava.mContext).getMoPubInterstitialId());
                    bigAd2.loadAd();
                    if (cocojava.mMopubView != null) {
                        cocojava.layout.removeView(cocojava.mMopubView);
                    }
                    MopubView unused = cocojava.mMopubView = new MopubView(cocojava.mContext, bigAd2);
                    cocojava.layout.addView(cocojava.mMopubView);
                }
            });
        }
    }

    public static void loadFullScreenAd() {
        if (mUSE_ADS) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.24
                @Override // java.lang.Runnable
                public void run() {
                    if (cocojava.mMopubInterstitial == null || cocojava.mMopubInterstitial.hasFinished().booleanValue()) {
                        MopubInterstitial unused = cocojava.mMopubInterstitial = new MopubInterstitial(cocojava.mContext);
                    }
                    cocojava.mMopubInterstitial.loadInterstitialAd();
                }
            });
        }
    }

    public static void showFullScreenAd() {
        Log.i("MopubFULLSCREEN", "showfullscreenAd");
        if (mUSE_ADS) {
            Log.i("MopubFULLSCREEN", "Going to show ad!");
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.25
                @Override // java.lang.Runnable
                public void run() {
                    if (cocojava.mMopubInterstitial == null || cocojava.mMopubInterstitial.hasFinished().booleanValue()) {
                        MopubInterstitial unused = cocojava.mMopubInterstitial = new MopubInterstitial(cocojava.mContext);
                    }
                    cocojava.mMopubInterstitial.showInterstitialAd();
                }
            });
        }
    }

    public static void enableAds() {
        showAds();
    }

    public static void enableAdsWithPosition(final float x, final float y, final float anchorX, final float anchorY, final float currentWidth, final String adId) {
        if (mUSE_ADS) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.26
                @Override // java.lang.Runnable
                public void run() {
                    MoPubView adView;
                    int adViewType;
                    if (cocojava.adLayout != null && cocojava.adLayout.getParent() != cocojava.adLayoutH) {
                        cocojava.adLayoutH.addView(cocojava.adLayout);
                    }
                    final RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams((int) (320.0d * cocojava.mDensity), (int) (50.0d * cocojava.mDensity));
                    float screenWidth = cocojava.mINGAME_WIDTH;
                    float screenHeight = cocojava.mINGAME_HEIGHT;
                    if (currentWidth == BitmapDescriptorFactory.HUE_RED) {
                        if (cocojava.mINGAME_LANDSCAPE && !cocojava.mINGAME_SCALE) {
                            screenWidth = (cocojava.mINGAME_HEIGHT / cocojava.mHeight) * cocojava.mWidth;
                        } else if (!cocojava.mINGAME_SCALE) {
                            screenHeight = (cocojava.mINGAME_WIDTH / cocojava.mWidth) * cocojava.mHeight;
                        }
                        if ((cocojava.mWidth > 799 || cocojava.mHeight > 799) && cocojava.mHAS_RETINA) {
                            screenWidth *= 1.0f;
                            screenHeight *= 1.0f;
                        }
                    } else {
                        screenWidth = currentWidth;
                    }
                    int adOffsetX = (int) (cocojava.mUSE_ADS_VERTICAL_BANNER_OFFSET * cocojava.mDensity);
                    int adOffsetY = (int) (cocojava.mUSE_ADS_HORIZONTAL_BANNER_OFFSET * cocojava.mDensity);
                    params.leftMargin = ((int) ((x * (cocojava.mWidth / screenWidth)) - (anchorX * (320.0f * cocojava.mDensity)))) + adOffsetX;
                    params.topMargin = ((int) ((y * (cocojava.mHeight / screenHeight)) - ((1.0f - anchorY) * (50.0f * cocojava.mDensity)))) + adOffsetY;
                    if (adId.compareTo(((cocojava) cocojava.mContext).getMoPubGameplayBannerId()) == 0) {
                        adView = cocojava.adViewGame;
                        cocojava.hideAd(cocojava.adViewMenu);
                        adViewType = 1;
                    } else {
                        adView = cocojava.adViewMenu;
                        cocojava.hideAd(cocojava.adViewGame);
                        adViewType = 2;
                    }
                    if (adView != null && adView.getParent() == cocojava.adLayout && adView.isShown() && adView.AdLoaded() && adId.compareTo(adView.getAdUnitId()) == 0) {
                        RelativeLayout.LayoutParams paramsCur = (RelativeLayout.LayoutParams) adView.getLayoutParams();
                        final MoPubView adViewFinal = adView;
                        if (paramsCur.leftMargin != params.leftMargin || paramsCur.topMargin != params.topMargin) {
                            Animation anim = new ScaleAnimation(1.0f, BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 160.0f * cocojava.mDensity, BitmapDescriptorFactory.HUE_RED);
                            anim.setDuration(500L);
                            anim.setAnimationListener(new Animation.AnimationListener() { // from class: com.miniclip.nativeJNI.cocojava.26.1
                                @Override // android.view.animation.Animation.AnimationListener
                                public void onAnimationStart(Animation animation) {
                                }

                                @Override // android.view.animation.Animation.AnimationListener
                                public void onAnimationRepeat(Animation animation) {
                                }

                                @Override // android.view.animation.Animation.AnimationListener
                                public void onAnimationEnd(Animation animation) {
                                    Animation anim2 = new ScaleAnimation(BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 1.0f, 160.0f * cocojava.mDensity, BitmapDescriptorFactory.HUE_RED);
                                    anim2.setDuration(500L);
                                    adViewFinal.setLayoutParams(params);
                                    adViewFinal.startAnimation(anim2);
                                }
                            });
                            adView.startAnimation(anim);
                            return;
                        }
                        return;
                    }
                    if (cocojava.mConstantAd) {
                        if (adView == null) {
                            if (adViewType == 1) {
                                MoPubView unused = cocojava.adViewGame = new MoPubView(cocojava.mContext);
                                adView = cocojava.adViewGame;
                            } else {
                                MoPubView unused2 = cocojava.adViewMenu = new MoPubView(cocojava.mContext);
                                adView = cocojava.adViewMenu;
                            }
                            adView.setOnAdLoadedListener((cocojava) cocojava.mContext);
                            adView.setOnAdFailedListener((cocojava) cocojava.mContext);
                            adView.setOnAdClickedListener((cocojava) cocojava.mContext);
                            adView.setAdUnitId(adId);
                            adView.setVisibility(0);
                            adView.loadAd();
                        } else {
                            cocojava.adLayout.removeView(adView);
                        }
                    } else {
                        if (adView != null) {
                            cocojava.adLayout.removeView(adView);
                            adView.destroy();
                        }
                        if (adViewType == 1) {
                            MoPubView unused3 = cocojava.adViewGame = new MoPubView(cocojava.mContext);
                            adView = cocojava.adViewGame;
                        } else {
                            MoPubView unused4 = cocojava.adViewMenu = new MoPubView(cocojava.mContext);
                            adView = cocojava.adViewMenu;
                        }
                        adView.setOnAdLoadedListener((cocojava) cocojava.mContext);
                        adView.setOnAdFailedListener((cocojava) cocojava.mContext);
                        adView.setOnAdClickedListener((cocojava) cocojava.mContext);
                        adView.setAdUnitId(adId);
                        adView.setVisibility(0);
                        adView.loadAd();
                    }
                    cocojava.adLayout.addView(adView, params);
                    if (adView.AdLoaded()) {
                        Animation anim2 = new ScaleAnimation(BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 1.0f, 160.0f * cocojava.mDensity, BitmapDescriptorFactory.HUE_RED);
                        anim2.setDuration(500L);
                        adView.setVisibility(1);
                        adView.startAnimation(anim2);
                    }
                }
            });
        }
    }

    public static void enableAdsWithPositionForGameplay(float x, float y, float anchorX, float anchorY) {
        enableAdsWithPosition(x, y, anchorX, anchorY, BitmapDescriptorFactory.HUE_RED, ((cocojava) mContext).getMoPubGameplayBannerId());
    }

    public static void enableAdsWithPositionForGameplayGivenWidth(float x, float y, float anchorX, float anchorY, float currentWidth) {
        enableAdsWithPosition(x, y, anchorX, anchorY, currentWidth, ((cocojava) mContext).getMoPubGameplayBannerId());
    }

    public static void enableAdsWithPositionForMenu(float x, float y, float anchorX, float anchorY) {
        enableAdsWithPosition(x, y, anchorX, anchorY, BitmapDescriptorFactory.HUE_RED, ((cocojava) mContext).getMoPubMenuBannerId());
    }

    public static void enableAdsWithPositionForMenuGivenWidth(float x, float y, float anchorX, float anchorY, float currentWidth) {
        enableAdsWithPosition(x, y, anchorX, anchorY, currentWidth, ((cocojava) mContext).getMoPubMenuBannerId());
    }

    public static void disableAds() {
        hideAds();
    }

    public static void hideAds() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.27
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.adLayout != null && cocojava.adLayout.getParent() == cocojava.adLayoutH) {
                    cocojava.adLayoutH.removeView(cocojava.adLayout);
                }
                cocojava.hideAd(cocojava.adViewGame);
                cocojava.hideAd(cocojava.adViewMenu);
            }
        });
    }

    public static void hideAd(final MoPubView adView) {
        if (adView != null && adView.getParent() == adLayout && adView.getAnimation() == null) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.28
                @Override // java.lang.Runnable
                public void run() {
                    Animation anim = new ScaleAnimation(1.0f, BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 160.0f * cocojava.mDensity, BitmapDescriptorFactory.HUE_RED);
                    anim.setDuration(500L);
                    anim.setAnimationListener(new Animation.AnimationListener() { // from class: com.miniclip.nativeJNI.cocojava.28.1
                        @Override // android.view.animation.Animation.AnimationListener
                        public void onAnimationStart(Animation animation) {
                        }

                        @Override // android.view.animation.Animation.AnimationListener
                        public void onAnimationRepeat(Animation animation) {
                        }

                        @Override // android.view.animation.Animation.AnimationListener
                        public void onAnimationEnd(Animation animation) {
                            if (MoPubView.this != null) {
                                cocojava.adLayout.removeView(MoPubView.this);
                            }
                        }
                    });
                    cocojava.adLayout.removeView(MoPubView.this);
                }
            });
        }
    }

    public static void hideAdsInSeconds(int seconds) {
        mAdDelayHandler.removeCallbacks(mHideAdsRun);
        mAdDelayHandler.postDelayed(mHideAdsRun, seconds * 1000);
    }

    public static void showAds() {
        Log.i("showAds", "deprecated use enableAdsWithPosition");
    }

    public static void showAd(final MoPubView adView) {
        if (mUSE_ADS && adView != null) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.30
                @Override // java.lang.Runnable
                public void run() {
                    if (MoPubView.this != null) {
                        cocojava.adLayout.removeView(MoPubView.this);
                        cocojava.adLayout.addView(MoPubView.this);
                    }
                }
            });
        }
    }

    public static void enableNewsfeed() {
    }

    public static void disableNewsfeed() {
    }

    public static void createNotification(final int nid, final String title, final String text, final int when) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.31
            @Override // java.lang.Runnable
            public void run() {
                ((cocojava) cocojava.mContext).createCustomNotification(nid, title, text, when);
            }
        });
    }

    public static void cancelNotification(final int nid) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.32
            @Override // java.lang.Runnable
            public void run() {
                ((cocojava) cocojava.mContext).cancelCustomNotification(nid);
            }
        });
    }

    public static int getRecommendedPriceGetJar(int price) {
        return ((cocojava) mContext).getJarRecommendedPrice(price);
    }

    public static void callInAppGetJar(final String itemID, final int price, final String title, final int callback, final int self, final int showDialog) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.33
            @Override // java.lang.Runnable
            public void run() {
                ((cocojava) cocojava.mContext).callGetJar(itemID, price, title, callback, self, showDialog);
            }
        });
    }

    public int callInAppPurchaseManagedCustom(String itemID) {
        Log.i("callInAppPurchaseManagedCustom", "ERROR! OVERRIDE ME!");
        return 0;
    }

    public int callInAppPurchaseCustom(String itemID) {
        Log.i("callInAppPurchaseCustom", "ERROR! OVERRIDE ME!");
        return 0;
    }

    public static int callInAppPurchaseRemoveAdsManaged(String itemID, int callback, int self) {
        return callInAppPurchaseManaged(itemID, callback, self, true);
    }

    public static int callInAppPurchaseManaged(String itemID, int callback, int self) {
        return callInAppPurchaseManaged(itemID, callback, self, false);
    }

    public static int callInAppPurchaseManaged(final String itemID, int callback, int self, boolean removeAds) {
        Log.i("callInAppPurchaseManaged", itemID);
        inAppsRemoveAds = removeAds;
        mInAppCallback = callback;
        mInAppResponce = -1;
        mInAppSelf = self;
        mInAppProductId = itemID;
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.34
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.mCustomInApp) {
                    ((cocojava) cocojava.mContext).callInAppPurchaseManagedCustom(itemID);
                } else if (cocojava.mTEST_INAPPS) {
                    ((InAppActivity) cocojava.mContext).requestPurchaseActManaged("android.test.purchased");
                } else {
                    ((InAppActivity) cocojava.mContext).requestPurchaseActManaged(itemID);
                }
            }
        });
        return 0;
    }

    public static int callInAppPurchase(final String itemID, int callback, int self, boolean removeAds) {
        Log.i("callInAppPurchase", itemID);
        inAppsRemoveAds = removeAds;
        mInAppCallback = callback;
        mInAppResponce = -1;
        mInAppSelf = self;
        mInAppProductId = itemID;
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.35
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.mCustomInApp) {
                    ((cocojava) cocojava.mContext).callInAppPurchaseCustom(itemID);
                } else if (cocojava.mTEST_INAPPS) {
                    ((InAppActivity) cocojava.mContext).requestPurchaseAct("android.test.purchased");
                } else {
                    ((InAppActivity) cocojava.mContext).requestPurchaseAct(itemID);
                }
            }
        });
        return 0;
    }

    public static int callInAppPurchaseRemoveAds(String itemID, int callback, int self) {
        return callInAppPurchase(itemID, callback, self, true);
    }

    public static int callInAppPurchase(String itemID, int callback, int self) {
        return callInAppPurchase(itemID, callback, self, false);
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        accelerometer.disable();
        pauseBackgroundMusic();
        soundPlayer.pauseAllSounds();
        mGLView.onPause();
        if (mRotatedBanner != null && mUSE_ADS_VERTICAL && mRotatedBannerDisplayed == 1) {
            mRotatedBanner.setBlockAutoRefresh(false);
            mRotatedBanner.setAutorefreshEnabled(false);
            mRotatedBanner.setBlockAutoRefresh(true);
        }
        if (mHorizontalBanner != null && mUSE_ADS_HORIZONTAL && mHorizontalBannerDisplayed) {
            mHorizontalBanner.setBlockAutoRefresh(false);
            mHorizontalBanner.setAutorefreshEnabled(false);
            mHorizontalBanner.setBlockAutoRefresh(true);
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        mHasWindowFocus = hasWindowFocus;
        if (mHasWindowFocus && mResumeOnFocus) {
            mResumeOnFocus = false;
            accelerometer.enable();
            resumeBackgroundMusic();
            soundPlayer.resumeAllSounds();
            mGLView.onResume();
        }
        if (mHasWindowFocus) {
            fixScreen();
        }
        if (mHasWindowFocus && Build.VERSION.SDK_INT >= 19) {
            setSystemUiVisibility();
        }
    }

    @Override // com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers, android.app.Activity
    protected void onResume() {
        super.onResume();
        if (mHasWindowFocus) {
            mResumeOnFocus = false;
            accelerometer.enable();
            resumeBackgroundMusic();
            soundPlayer.resumeAllSounds();
            mGLView.onResume();
        } else {
            mResumeOnFocus = true;
        }
        if (mRenderer != null && mRenderer.hasStarted) {
            onRealResume();
        }
        mNumUpSellsThisSession = 0;
        if (mRotatedBanner != null && mUSE_ADS_VERTICAL && mRotatedBannerDisplayed == 1) {
            mRotatedBanner.setBlockAutoRefresh(false);
            mRotatedBanner.resetRefreshTime();
            mRotatedBanner.setAutorefreshEnabled(true);
            mRotatedBanner.setBlockAutoRefresh(true);
        }
        if (mHorizontalBanner != null && mUSE_ADS_HORIZONTAL && mHorizontalBannerDisplayed) {
            mHorizontalBanner.setBlockAutoRefresh(false);
            mHorizontalBanner.setAutorefreshEnabled(false);
            mHorizontalBanner.setBlockAutoRefresh(true);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onRealResume() {
        if (mUSE_TAPJOY) {
            TapjoyConnect.getTapjoyConnectInstance().getTapPoints(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        System.runFinalizersOnExit(true);
        System.exit(0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void createResources() {
        Log.i("JAVAINFO", getFilesDir().getAbsolutePath());
        File contRes = new File(getFilesDir(), "Contents/Resources");
        Log.i("JAVAINFO", contRes.getAbsolutePath());
        contRes.mkdirs();
        try {
            try {
                ApplicationInfo ai = getPackageManager().getApplicationInfo(getPackageName(), 0);
                CocoJNI.MsetAPKPath(ai.sourceDir);
                Log.i("JAVAINFO", ai.sourceDir);
                Log.i("JAVAINFO", ai.dataDir);
                ZipFile zf = new ZipFile(ai.sourceDir);
                Enumeration<? extends ZipEntry> entries = zf.entries();
                while (entries.hasMoreElements()) {
                    ZipEntry entry = entries.nextElement();
                    if (entry.getName().length() >= 15 && "assets/unpack/".equals(entry.getName().substring(0, 14))) {
                        File newPath = new File(contRes, entry.getName().substring(14));
                        File parentPath = newPath.getParentFile();
                        if (parentPath != null) {
                            parentPath.mkdirs();
                        }
                        if (!newPath.exists()) {
                            InputStream ris = zf.getInputStream(entry);
                            try {
                                File newRes = new File(contRes, entry.getName().substring(14));
                                newRes.delete();
                                FileOutputStream fos = new FileOutputStream(newRes);
                                byte[] buf = new byte[4096];
                                while (true) {
                                    int numRead = ris.read(buf);
                                    if (numRead < 0) {
                                        break;
                                    }
                                    fos.write(buf, 0, numRead);
                                }
                                fos.close();
                            } catch (FileNotFoundException e) {
                                e.printStackTrace();
                            } catch (IOException e2) {
                                e2.printStackTrace();
                            }
                        }
                    }
                }
            } catch (IOException e3) {
                e3.printStackTrace();
            }
        } catch (PackageManager.NameNotFoundException e1) {
            e1.printStackTrace();
        }
    }

    public static void enableAccelerometer() {
        accelerometerEnabled = true;
        accelerometer.enable();
    }

    public static void disableAccelerometer() {
        accelerometerEnabled = false;
        accelerometer.disable();
    }

    public static int getDurationForSound(String path) {
        return backgroundMusicPlayer.getDurationForSound(path);
    }

    public static void playBackgroundMusic(String path, boolean isLoop) {
        backgroundMusicPlayer.playBackgroundMusic(path, isLoop);
    }

    public static void stopBackgroundMusic() {
        backgroundMusicPlayer.stopBackgroundMusic();
    }

    public static void pauseBackgroundMusic() {
        backgroundMusicPlayer.pauseBackgroundMusic();
    }

    public static void resumeBackgroundMusic() {
        backgroundMusicPlayer.resumeBackgroundMusic();
    }

    public static void rewindBackgroundMusic() {
        backgroundMusicPlayer.rewindBackgroundMusic();
    }

    public static boolean isBackgroundMusicPlaying() {
        return backgroundMusicPlayer.isBackgroundMusicPlaying();
    }

    public static float getBackgroundMusicVolume() {
        return backgroundMusicPlayer.getBackgroundVolume();
    }

    public static void setBackgroundMusicVolume(float volume) {
        backgroundMusicPlayer.setBackgroundVolume(volume);
    }

    public static int getAndroidVersion() {
        return Build.VERSION.SDK_INT;
    }

    public static void playEffect(int soundId) {
        soundPlayer.playEffect(soundId);
    }

    public static void playEffect(int soundId, int loopTime, float pitch) {
        cocosound cocosoundVar = soundPlayer;
        float f = soundPlayer.mLeftVolume;
        float f2 = soundPlayer.mRightVolume;
        soundPlayer.getClass();
        cocosoundVar.playEffect(soundId, f, f2, 1, loopTime, pitch);
    }

    public static void playEffect(int soundId, int priority, int loopTime, float pitch) {
        soundPlayer.playEffect(soundId, soundPlayer.mLeftVolume, soundPlayer.mRightVolume, priority, loopTime, pitch);
    }

    public static void playEffect(int soundId, float leftGain, float rightGain, int loopTime, float pitch) {
        cocosound cocosoundVar = soundPlayer;
        soundPlayer.getClass();
        cocosoundVar.playEffect(soundId, leftGain, rightGain, 1, loopTime, pitch);
    }

    public static void playEffect(int soundId, float leftGain, float rightGain, int priority, int loopTime, float pitch) {
        soundPlayer.playEffect(soundId, leftGain, rightGain, priority, loopTime, pitch);
    }

    public static void pauseEffect(int soundId) {
        soundPlayer.pauseEffect(soundId);
    }

    public static void stopEffect(int soundId) {
        soundPlayer.stopEffect(soundId);
    }

    public static void setEffectLooping(int soundId, boolean loop) {
        soundPlayer.setEffectLooping(soundId, loop);
    }

    public static void setEffectGain(int soundId, float gain) {
        soundPlayer.setEffectGain(soundId, gain);
    }

    public static void setEffectPitch(int soundId, float pitch) {
        soundPlayer.setEffectPitch(soundId, pitch);
    }

    public static float getEffectsVolume() {
        return soundPlayer.getEffectsVolume();
    }

    public static void setEffectsVolume(float volume) {
        soundPlayer.setEffectsVolume(volume);
    }

    public static int preloadEffect(String path) {
        return soundPlayer.preloadEffect(path);
    }

    public static void unloadEffect(String path) {
        soundPlayer.unloadEffect(path);
    }

    public static void end() {
        backgroundMusicPlayer.end();
        soundPlayer.end();
    }

    public static void pauseAllSounds() {
        soundPlayer.pauseAllSounds();
    }

    public static void resumeAllSounds() {
        soundPlayer.resumeAllSounds();
    }

    public static void loadTexture(String path) {
        texture.readBitmap(path);
    }

    public static void SharedPreferences_setInt(String key, int value) {
        SharedPreferences settings = ((Activity) mContext).getSharedPreferences("GAME_INFO", 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putInt(key, value);
        editor.commit();
    }

    public static int SharedPreferences_getInt(String key) {
        SharedPreferences prefs = ((Activity) mContext).getSharedPreferences("GAME_INFO", 0);
        return prefs.getInt(key, 0);
    }

    public static void SharedPreferences_setString(String key, String value) {
        SharedPreferences settings = ((Activity) mContext).getSharedPreferences("GAME_INFO", 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString(key, value);
        editor.commit();
    }

    public static String SharedPreferences_getString(String key) {
        SharedPreferences prefs = ((Activity) mContext).getSharedPreferences("GAME_INFO", 0);
        return prefs.getString(key, "");
    }

    public void showInterstitialAd() {
        interstitial.setListener(this);
        interstitial.showAd();
    }

    @Override // com.mopub.mobileads.MoPubInterstitial.MoPubInterstitialListener
    public void OnInterstitialLoaded() {
    }

    @Override // com.mopub.mobileads.MoPubInterstitial.MoPubInterstitialListener
    public void OnInterstitialFailed() {
        Toast.makeText(this, "No ad available", 0).show();
    }

    public static void startFlurrySession(String productId) {
        Log.i("flurry", String.format("startFlurrySession %s", productId));
        FlurryAgent.onStartSession(mContext, productId);
    }

    private static Map<String, String> convertToMap(String[] keys, String[] values) {
        int len;
        HashMap<String, String> map = null;
        if (keys != null && values != null && (len = keys.length) == values.length) {
            map = new HashMap<>();
            for (int i = 0; i < len; i++) {
                map.put(keys[i], values[i]);
            }
        }
        return map;
    }

    public static void logFlurryEvent(String eventId, String[] keys, String[] values, boolean timed) {
        Log.i("flurry", "logFlurryEvent: " + eventId + " timed: " + timed);
        Map<String, String> map = convertToMap(keys, values);
        FlurryAgent.logEvent(eventId, map, timed);
        if (!timed && map != null) {
            String s = "Flurry/" + eventId + "/";
            if (map != null) {
                for (int i = 0; i < map.size(); i++) {
                    String eventStr = s + keys[i] + "->" + values[i];
                    Log.i("sendGoogleEvent", "logGoogleEventFromFlurry: " + eventStr);
                    sendGoogleEvent(eventStr, 1);
                }
            }
        }
    }

    public static void endFlurryTimedEvent(String eventId) {
        FlurryAgent.endTimedEvent(eventId);
    }

    public void logCustomEvent(String eventId, String jsonString) {
        Log.i("cocojava", "OVERRIDE logCustomEvent");
    }

    public static void custom_logEvent(final String eventId, final String jsonString) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.36
            @Override // java.lang.Runnable
            public void run() {
                ((cocojava) cocojava.mContext).logCustomEvent(eventId, jsonString);
            }
        });
    }

    public static void openLink(String url) {
        Message msg = new Message();
        msg.what = 4;
        msg.obj = url;
        mHandler.sendMessage(msg);
    }

    private void showNoInternetDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage("Please enable internet").setCancelable(false).setPositiveButton("Back", new DialogInterface.OnClickListener() { // from class: com.miniclip.nativeJNI.cocojava.37
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        Dialog alert = builder.create();
        alert.show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openURL(String url) {
        if (!isOnline()) {
            showNoInternetDialog();
            return;
        }
        try {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(url));
            startActivity(intent);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected static JSONObject stringToJSON(String jsonString) {
        try {
            JSONObject jsn = new JSONObject(jsonString);
            return jsn;
        } catch (JSONException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void exitApplication() {
        Message msg = new Message();
        msg.what = 5;
        mHandler.sendMessage(msg);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (view == mRemoveAdsButton) {
            callInAppPurchaseManaged("remove_ads", 0, 0);
        }
        if (view == mSkip1) {
            mBigAdView.removeAllViews();
            mBigAdView.setOnClickListener(null);
            mBigAdView.setClickable(false);
            mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.38
                @Override // java.lang.Runnable
                public void run() {
                    CocoJNI.MsetGamePause(0);
                }
            });
        } else if (view == mRemove1) {
            mBigAdView.removeAllViews();
            mBigAdView.setOnClickListener(null);
            mBigAdView.setClickable(false);
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(getFullAppURI()));
            mContext.startActivity(intent);
            mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.39
                @Override // java.lang.Runnable
                public void run() {
                    CocoJNI.MsetGamePause(0);
                }
            });
        } else if (view == mCenterdAd) {
            mBigAdView.removeAllViews();
            mBigAdView.setOnClickListener(null);
            mBigAdView.setClickable(false);
        }
    }

    public static void flashScreen(int color) {
    }

    static void updateNotificationStatus(final int enabled) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.40
            @Override // java.lang.Runnable
            public void run() {
                SharedPreferences settings = cocojava.mContext.getSharedPreferences(Newsfeed.PREFS_NAME_C2DM, 0);
                SharedPreferences.Editor editor = settings.edit();
                editor.putInt("C2DM_ENABLE", enabled);
                editor.commit();
            }
        });
    }

    static int getNotificationStatus() {
        SharedPreferences settings = mContext.getSharedPreferences(Newsfeed.PREFS_NAME_C2DM, 0);
        return settings.getInt("C2DM_ENABLE", 0);
    }

    public boolean isOnline() {
        ConnectivityManager cm = (ConnectivityManager) getSystemService("connectivity");
        NetworkInfo ni = cm.getActiveNetworkInfo();
        if (ni == null) {
            return false;
        }
        return ni.isConnectedOrConnecting();
    }

    public static void vibrateForMS(int time) {
        Vibrator v = (Vibrator) mContext.getSystemService("vibrator");
        v.vibrate(time);
    }

    public static boolean isSDcardPresent() {
        return "mounted".equals("mounted");
    }

    public static float availableMemoryOnDevice() {
        StatFs statFs = new StatFs(mContext.getFilesDir().getAbsolutePath());
        long blockSize = statFs.getBlockSize();
        long blockCount = statFs.getBlockCount() * blockSize;
        long availableBlocks = statFs.getAvailableBlocks() * blockSize;
        long freeSize = statFs.getFreeBlocks() * blockSize;
        return (float) (freeSize / 1048576);
    }

    public static float availableMemoryOnSDcard() {
        StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getAbsolutePath());
        long blockSize = statFs.getBlockSize();
        long blockCount = statFs.getBlockCount() * blockSize;
        long availableBlocks = statFs.getAvailableBlocks() * blockSize;
        long freeSize = statFs.getFreeBlocks() * blockSize;
        return (float) (freeSize / 1048576);
    }

    public static String getExternalStorageDirectory() {
        String packageName = mContext.getPackageName();
        String externalRoot = Environment.getExternalStorageDirectory().getAbsolutePath();
        String path = (externalRoot + "/Android/data/" + packageName) + "/Contents/Resources";
        File folder = new File(path);
        boolean success = false;
        if (!folder.exists()) {
            success = folder.mkdirs();
        }
        if (!success) {
        }
        return path;
    }

    protected static int getAdsDisabled(Context context) {
        SharedPreferences settings = context.getSharedPreferences("ADS_DISABLED", 0);
        String adsDisabled = settings.getString("disabled", "false");
        return adsDisabled.equals("true") ? 1 : 0;
    }

    protected static int getAdsDisabled() {
        return getAdsDisabled(mContext);
    }

    protected static void setAdsDisabled(int disabled) {
        SharedPreferences settings = mContext.getSharedPreferences("ADS_DISABLED", 0);
        SharedPreferences.Editor editor = settings.edit();
        if (disabled == 1) {
            editor.putString("disabled", "true");
        } else {
            editor.putString("disabled", "false");
        }
        editor.commit();
    }

    public static void showRemoveAds() {
        if (mRemoveAdsButtonHidden) {
            mRemoveAdsButtonHidden = false;
            if (mUSE_ADS) {
                ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.41
                    @Override // java.lang.Runnable
                    public void run() {
                        cocojava.mRemoveAdsButtonLayout.removeView(cocojava.mRemoveAdsButton);
                        cocojava.mRemoveAdsButtonLayout.addView(cocojava.mRemoveAdsButton);
                    }
                });
            }
        }
    }

    public static void hideRemoveAds() {
        if (!mRemoveAdsButtonHidden) {
            mRemoveAdsButtonHidden = true;
            if (mUSE_ADS) {
                ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.42
                    @Override // java.lang.Runnable
                    public void run() {
                        cocojava.mRemoveAdsButtonLayout.removeView(cocojava.mRemoveAdsButton);
                    }
                });
            }
        }
    }

    public void restoreOriginalAspectRatio() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.43
            @Override // java.lang.Runnable
            public void run() {
                RelativeLayout.LayoutParams gLLayout = new RelativeLayout.LayoutParams(cocojava.mWidth, cocojava.mHeight);
                gLLayout.addRule(11);
                cocojava.mGLView.setLayoutParams(gLLayout);
            }
        });
        mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.44
            @Override // java.lang.Runnable
            public void run() {
                Log.i("INFO", String.format("RES FIX width:%d height:%d", Integer.valueOf(cocojava.mWidth), Integer.valueOf(cocojava.mHeight)));
                GLES10.glViewport(0, 0, cocojava.mWidth, cocojava.mHeight);
                cocojava.mADS_BLOCKED_NOW = true;
                CocoJNI.MdisplayInfo(cocojava.mWidth, cocojava.mHeight);
                CocoJNI.MnotifyAspectRatioChange();
            }
        });
    }

    public void inAppResponce(int responce, String productId) {
        Log.i("inAppResponce", String.format("id: %s responce: %d", productId, Integer.valueOf(responce)));
        if (responce == 1) {
            FlurryAgent.logEvent(String.format("InAppSuccess: %s", productId));
            if (inAppsRemoveAds && getAdsDisabled() == 0) {
                Log.i("callInAppPurchase", "Removing ads due to IAP!");
                permanentlyRemoveAds();
                restoreOriginalAspectRatio();
                return;
            }
            return;
        }
        FlurryAgent.logEvent(String.format("InAppFailed: %s", productId));
    }

    public static void permanentlyRemoveAds() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.45
            @Override // java.lang.Runnable
            public void run() {
                cocojava.setAdsDisabled(1);
                cocojava.disableAds();
                cocojava.hideRemoveAds();
                cocojava.hideRotatedBanner();
                cocojava.hideHorizontalBanner();
                cocojava.mUSE_ADS = false;
                cocojava.mUSE_ADS_VERTICAL = false;
                cocojava.mUSE_ADS_HORIZONTAL = false;
            }
        });
    }

    public static int isPurchaseOwned(String purchaseId) {
        return ((InAppActivity) mContext).isPurchaseReallyOwned(purchaseId);
    }

    public static String[] getPurchasedOwnedItems() {
        return ((InAppActivity) mContext).getOwnedItems();
    }

    public static String getProductPrice(String productId) {
        return ((InAppActivity) mContext).getPurchasePrice(productId);
    }

    public static void setContentToGl() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.46
            @Override // java.lang.Runnable
            public void run() {
                cocojava.layout.removeView(cocojava.mInitView);
            }
        });
    }

    public static void setFPS(float fps) {
        long animationInterval = (long) ((1.0d / fps) * 1000000000);
        ClearRenderer.animationInterval = animationInterval;
    }

    public static int isAppInstalled(String appId) {
        List<ApplicationInfo> apps = mContext.getPackageManager().getInstalledApplications(8192);
        for (ApplicationInfo app : apps) {
            if (app.packageName.compareTo(appId) == 0) {
                return 1;
            }
        }
        return 0;
    }

    public static void showRotatedBanner() {
        showRotatedBanner(ALIGN_LEFT);
    }

    public static void showRotatedBanner(final int alignment) {
        if (mRotatedBannerDisplayed != 1 && mUSE_ADS_VERTICAL) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.47
                @Override // java.lang.Runnable
                public void run() {
                    Log.i("rotatedBanner", "showRotatedBanner");
                    if (alignment == cocojava.ALIGN_RIGHT) {
                        RelativeLayout.LayoutParams p1 = new RelativeLayout.LayoutParams(cocojava.sideBar1.getLayoutParams());
                        p1.addRule(11);
                        cocojava.sideBar1.setLayoutParams(p1);
                        RelativeLayout.LayoutParams p2 = new RelativeLayout.LayoutParams(cocojava.sideBar2.getLayoutParams());
                        p2.addRule(11);
                        p2.addRule(12);
                        cocojava.sideBar2.setLayoutParams(p2);
                    }
                    RelativeLayout.LayoutParams gLLayout = new RelativeLayout.LayoutParams(cocojava.mWidth - ((int) (50.0f * cocojava.mDensity)), cocojava.mHeight);
                    if (alignment == cocojava.ALIGN_LEFT) {
                        gLLayout.addRule(11);
                    }
                    cocojava.mGLView.setLayoutParams(gLLayout);
                    if (cocojava.mRotatedBanner == null) {
                        rotatedBannerImg unused = cocojava.mRotatedBanner = new rotatedBannerImg(cocojava.mContext, alignment);
                        cocojava.layout.addView(cocojava.mRotatedBanner);
                    } else {
                        cocojava.mRotatedBanner.setAlignment(alignment);
                    }
                    cocojava.mRotatedBanner.setBlockAutoRefresh(false);
                    cocojava.mRotatedBanner.resetRefreshTime();
                    cocojava.mRotatedBanner.setAutorefreshEnabled(true);
                    cocojava.mRotatedBanner.setBlockAutoRefresh(true);
                    if (alignment == cocojava.ALIGN_RIGHT) {
                        RelativeLayout.LayoutParams glLayout2 = new RelativeLayout.LayoutParams(cocojava.mRotatedBanner.getLayoutParams());
                        glLayout2.width = (int) (cocojava.mDensity * 320.0f);
                        glLayout2.height = (int) (cocojava.mDensity * 320.0f);
                        glLayout2.addRule(11);
                        glLayout2.addRule(15);
                        cocojava.mRotatedBanner.setLayoutParams(glLayout2);
                    }
                    cocojava.mRotatedBannerDisplayed = 1;
                }
            });
        }
    }

    public static void hideRotatedBanner() {
        if (mRotatedBannerDisplayed != 0) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.48
                @Override // java.lang.Runnable
                public void run() {
                    Log.i("rotatedBanner", "hideRotatedBanner");
                    RelativeLayout.LayoutParams gLLayout = new RelativeLayout.LayoutParams(cocojava.mWidth, cocojava.mHeight);
                    gLLayout.addRule(11);
                    cocojava.mGLView.setLayoutParams(gLLayout);
                    if (cocojava.mRotatedBanner != null) {
                        cocojava.mRotatedBanner.setBlockAutoRefresh(false);
                        cocojava.mRotatedBanner.setAutorefreshEnabled(false);
                        cocojava.mRotatedBanner.setBlockAutoRefresh(true);
                    }
                    cocojava.mRotatedBannerDisplayed = 0;
                }
            });
        }
    }

    public static void showHorizontalBanner() {
        if (!mHorizontalBannerDisplayed && mUSE_ADS_HORIZONTAL) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.49
                @Override // java.lang.Runnable
                public void run() {
                    Log.i("horizontalBanner", "showHorizontalBanner");
                    RelativeLayout.LayoutParams gLLayout = new RelativeLayout.LayoutParams(cocojava.mWidth, cocojava.mHeight - ((int) (50.0f * cocojava.mDensity)));
                    gLLayout.addRule(12);
                    cocojava.mGLView.setLayoutParams(gLLayout);
                    if (cocojava.mHorizontalBanner == null) {
                        horizontalBanner unused = cocojava.mHorizontalBanner = new horizontalBanner(cocojava.mContext);
                        cocojava.layout.addView(cocojava.mHorizontalBanner);
                    }
                    cocojava.mHorizontalBanner.setBlockAutoRefresh(false);
                    cocojava.mHorizontalBanner.resetRefreshTime();
                    cocojava.mHorizontalBanner.setAutorefreshEnabled(true);
                    cocojava.mHorizontalBanner.setBlockAutoRefresh(true);
                    cocojava.mHorizontalBannerDisplayed = true;
                }
            });
        }
    }

    public static void hideHorizontalBanner() {
        if (mHorizontalBannerDisplayed) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.50
                @Override // java.lang.Runnable
                public void run() {
                    Log.i("horizontalBanner", "hideHorizontalBanner");
                    RelativeLayout.LayoutParams gLLayout = new RelativeLayout.LayoutParams(cocojava.mWidth, cocojava.mHeight);
                    gLLayout.addRule(10);
                    cocojava.mGLView.setLayoutParams(gLLayout);
                    if (cocojava.mHorizontalBanner != null) {
                        cocojava.mHorizontalBanner.setBlockAutoRefresh(false);
                        cocojava.mHorizontalBanner.setAutorefreshEnabled(false);
                        cocojava.mHorizontalBanner.setBlockAutoRefresh(true);
                    }
                    cocojava.mHorizontalBannerDisplayed = false;
                }
            });
        }
    }

    protected String getUpSellDialogTitle() {
        return "Upgrade to premium?";
    }

    protected String getUpSellDialogMessage() {
        return "Do you want to get the premium version?";
    }

    protected void getUpSellDialogAction() {
        openLink("https://market.android.com/developer?pub=Miniclip.com");
    }

    protected void showUpSellDialogInternal() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.51
            @Override // java.lang.Runnable
            public void run() {
                cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.51.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CocoJNI.MsetGamePause(1);
                    }
                });
                AlertDialog.Builder builder = new AlertDialog.Builder(cocojava.mContext);
                builder.setTitle(((cocojava) cocojava.mContext).getUpSellDialogTitle()).setMessage(((cocojava) cocojava.mContext).getUpSellDialogMessage()).setCancelable(false).setPositiveButton("Later", new DialogInterface.OnClickListener() { // from class: com.miniclip.nativeJNI.cocojava.51.3
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                        cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.51.3.1
                            @Override // java.lang.Runnable
                            public void run() {
                                CocoJNI.MinterstitialClosed(0);
                                CocoJNI.MsetGamePause(0);
                            }
                        });
                    }
                }).setNegativeButton("Get it now", new DialogInterface.OnClickListener() { // from class: com.miniclip.nativeJNI.cocojava.51.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                        ((cocojava) cocojava.mContext).getUpSellDialogAction();
                        cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.51.2.1
                            @Override // java.lang.Runnable
                            public void run() {
                                CocoJNI.MinterstitialClosed(1);
                                CocoJNI.MsetGamePause(0);
                            }
                        });
                    }
                });
                Dialog alert = builder.create();
                alert.show();
            }
        });
    }

    protected static void showUpSellDialog() {
        ((cocojava) mContext).showUpSellDialogInternal();
    }

    protected String getTapjoyOfferDialogTitle(TapjoyFeaturedAppObject featuredAppObject) {
        return "Do you want to get free stuff?";
    }

    protected String getTapjoyOfferDialogMessage(TapjoyFeaturedAppObject featuredAppObject) {
        return String.format("Download and run this app for free stuff:\n%s", featuredAppObject.name);
    }

    public static void showTJOfferDialog() {
        if (mUSE_ADS && mFeaturedApObject != null && mUSE_TAPJOY) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.52
                @Override // java.lang.Runnable
                public void run() {
                    cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.52.1
                        @Override // java.lang.Runnable
                        public void run() {
                            CocoJNI.MsetGamePause(1);
                        }
                    });
                    AlertDialog.Builder builder = new AlertDialog.Builder(cocojava.mContext);
                    builder.setTitle(((cocojava) cocojava.mContext).getTapjoyOfferDialogTitle(cocojava.mFeaturedApObject)).setMessage(((cocojava) cocojava.mContext).getTapjoyOfferDialogMessage(cocojava.mFeaturedApObject)).setCancelable(false).setPositiveButton("Later", new DialogInterface.OnClickListener() { // from class: com.miniclip.nativeJNI.cocojava.52.3
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int id) {
                            dialog.cancel();
                            cocojava.showTapFeatureAd();
                            cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.52.3.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    CocoJNI.MinterstitialClosed(0);
                                    CocoJNI.MsetGamePause(0);
                                }
                            });
                        }
                    }).setNegativeButton("Download now", new DialogInterface.OnClickListener() { // from class: com.miniclip.nativeJNI.cocojava.52.2
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int id) {
                            dialog.cancel();
                            cocojava.showTapFeatureAd();
                            cocojava.openLink(cocojava.mFeaturedApObject.redirectURL);
                            cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.52.2.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    CocoJNI.MinterstitialClosed(1);
                                    CocoJNI.MsetGamePause(0);
                                }
                            });
                        }
                    });
                    Dialog alert = builder.create();
                    alert.show();
                }
            });
        }
    }

    private String md5(String s) {
        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(s.getBytes());
            byte[] messageDigest = digest.digest();
            StringBuffer hexString = new StringBuffer();
            for (byte b : messageDigest) {
                hexString.append(Integer.toHexString(b & Constants.UNKNOWN));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override // com.mopub.mobileads.MoPubView.OnAdLoadedListener
    public void OnAdLoaded(final MoPubView m) {
        if (mUSE_ADS) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.53
                @Override // java.lang.Runnable
                @SuppressLint({"NewApi"})
                public void run() {
                    MoPubView adView = cocojava.adViewMenu;
                    if (m.getAdUnitId().compareTo(((cocojava) cocojava.mContext).getMoPubGameplayBannerId()) == 0) {
                        adView = cocojava.adViewGame;
                    }
                    if (Build.VERSION.SDK_INT > 10) {
                        adView.setLayerType(1, null);
                    }
                    if (adView != null && m == adView && adView.getVisibility() == 0) {
                        Animation anim = new ScaleAnimation(BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 1.0f, 160.0f * cocojava.mDensity, BitmapDescriptorFactory.HUE_RED);
                        anim.setDuration(500L);
                        adView.setVisibility(1);
                        adView.startAnimation(anim);
                    }
                }
            });
            mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.54
                @Override // java.lang.Runnable
                public void run() {
                    CocoJNI.MsetAdLoadFailed(0);
                }
            });
        }
    }

    @Override // com.mopub.mobileads.MoPubView.OnAdFailedListener
    public void OnAdFailed(MoPubView m) {
        if (mUSE_ADS) {
            Log.i("OnAdFailed", "Failed to load the ad");
            mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.55
                @Override // java.lang.Runnable
                public void run() {
                    CocoJNI.MsetAdLoadFailed(1);
                }
            });
        }
    }

    @Override // com.mopub.mobileads.MoPubView.OnAdClickedListener
    public void OnAdClicked(MoPubView m) {
        if (mUSE_ADS) {
            Log.i("OnAdClicked", "Ad Clicked");
            mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.56
                @Override // java.lang.Runnable
                public void run() {
                    CocoJNI.MadClicked();
                }
            });
        }
    }

    public static void showInterstitialBanner() {
        if (mUSE_ADS_INTERSTITIAL_BANNER) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.57
                @Override // java.lang.Runnable
                public void run() {
                    cocojava.mInterstitialBanner.showAd();
                }
            });
        }
    }

    public void onInterstitialMopubViewExit() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.58
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.adLayout.getParent() != cocojava.adLayoutH) {
                    cocojava.adLayoutH.addView(cocojava.adLayout);
                }
                cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.58.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CocoJNI.MsetGamePause(0);
                    }
                });
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void callRemoveAds() {
    }

    public void fixScreen() {
        Runnable fixScreenRunnable = new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.59
            @Override // java.lang.Runnable
            public void run() {
                Log.i("cocojava", "fixScreen");
                cocojava.layout.requestLayout();
            }
        };
        this.mScreenFixHandler.removeCallbacks(fixScreenRunnable);
        this.mScreenFixHandler.postDelayed(fixScreenRunnable, 1000L);
    }

    public static int faceBook_isSessionValid() {
        return (mUSE_FACEBOOK && mFB_Session.isOpened()) ? 1 : 0;
    }

    public static String faceBook_getAccessToken() {
        return !mUSE_FACEBOOK ? "" : mFB_Session.getAccessToken();
    }

    public static void faceBook_logout() {
        if (mUSE_FACEBOOK) {
            mFB_Session.closeAndClearTokenInformation();
            Session.setActiveSession(null);
        }
    }

    public static void faceBook_authorize(String permissions) {
        faceBook_authorizeAndRun(permissions, new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.60
            @Override // java.lang.Runnable
            public void run() {
            }
        });
    }

    public static void faceBook_authorizeAndRun(String permissions, final Runnable runAfterLogin) {
        if (mUSE_FACEBOOK) {
            mFB_AuthenticationRequested = true;
            mFB_Session = new Session(mContext);
            mPrefs = ((Activity) mContext).getPreferences(0);
            String access_token = mPrefs.getString("access_token", null);
            if (access_token == null) {
                final String[] permissionsArray = permissions.split(",");
                ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.61
                    @Override // java.lang.Runnable
                    public void run() {
                        Session.OpenRequest openRequest;
                        if (cocojava.mFB_Session != null && !cocojava.mFB_Session.isOpened() && (openRequest = new Session.OpenRequest((Activity) cocojava.mContext).mo19setCallback(new Session.StatusCallback() { // from class: com.miniclip.nativeJNI.cocojava.61.1
                            @Override // com.facebook.Session.StatusCallback
                            public void call(Session session, SessionState state, Exception exception) {
                                if (cocojava.mFB_AuthenticationRequested && state.isOpened()) {
                                    cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.61.1.1
                                        @Override // java.lang.Runnable
                                        public void run() {
                                            boolean unused = cocojava.mFB_AuthenticationRequested = false;
                                            CocoJNI.MfacebookLoginComplete();
                                        }
                                    });
                                    cocojava.mFacebookHandler.postDelayed(runAfterLogin, 500L);
                                }
                            }
                        })) != null) {
                            openRequest.mo20setDefaultAudience(SessionDefaultAudience.FRIENDS);
                            openRequest.mo22setPermissions(Arrays.asList(permissionsArray));
                            openRequest.mo21setLoginBehavior(SessionLoginBehavior.SSO_WITH_FALLBACK);
                            cocojava.mFB_Session.openForRead(openRequest);
                            Session.setActiveSession(cocojava.mFB_Session);
                        }
                    }
                });
                return;
            }
            SharedPreferences.Editor editor = mPrefs.edit();
            editor.putString("access_token", null);
            editor.commit();
            final AccessToken accessToken = AccessToken.createFromExistingAccessToken(access_token, null, null, null, null);
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.62
                @Override // java.lang.Runnable
                public void run() {
                    cocojava.mFB_Session.open(AccessToken.this, new Session.StatusCallback() { // from class: com.miniclip.nativeJNI.cocojava.62.1
                        @Override // com.facebook.Session.StatusCallback
                        public void call(Session session, SessionState state, Exception exception) {
                        }
                    });
                    Session.setActiveSession(cocojava.mFB_Session);
                    cocojava.mFacebookHandler.postDelayed(runAfterLogin, 500L);
                }
            });
        }
    }

    public static void faceBook_reauthorizeWithPublishPermissions(String permissions) {
        if (mUSE_FACEBOOK) {
            final String[] permissionsArray = permissions.split(",");
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.63
                @Override // java.lang.Runnable
                public void run() {
                    if (cocojava.mFB_Session != null && cocojava.mFB_Session.getState().isOpened()) {
                        Session.NewPermissionsRequest newPermissionsRequest = new Session.NewPermissionsRequest((Activity) cocojava.mContext, Arrays.asList(permissionsArray));
                        cocojava.mFB_Session.requestNewPublishPermissions(newPermissionsRequest);
                    }
                }
            });
        }
    }

    public static void faceBook_request(String graphPath, int object) {
        faceBook_request(graphPath, "", object);
    }

    public static void faceBook_request(String graphPath, String paramsStr, int object) {
        if (mUSE_FACEBOOK) {
            ((Activity) mContext).runOnUiThread(new AnonymousClass64(paramsStr, graphPath, object));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.miniclip.nativeJNI.cocojava$64  reason: invalid class name */
    /* loaded from: classes.dex */
    public static class AnonymousClass64 implements Runnable {
        final /* synthetic */ String val$graphPath;
        final /* synthetic */ int val$object;
        final /* synthetic */ String val$paramsStr;

        AnonymousClass64(String str, String str2, int i) {
            this.val$paramsStr = str;
            this.val$graphPath = str2;
            this.val$object = i;
        }

        @Override // java.lang.Runnable
        public void run() {
            Bundle params = new Bundle();
            String[] paramsArray = this.val$paramsStr.split("#");
            for (int i = 0; i < paramsArray.length - 1; i += 2) {
                params.putString(paramsArray[i], paramsArray[i + 1]);
            }
            Request request = new Request(cocojava.mFB_Session, this.val$graphPath, params, HttpMethod.GET, new Request.Callback() { // from class: com.miniclip.nativeJNI.cocojava.64.1
                @Override // com.facebook.Request.Callback
                public void onCompleted(Response response) {
                    final String data = response.getGraphObject().getInnerJSONObject().toString();
                    Log.i("Facebook:", data);
                    cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.64.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            CocoJNI.MfacebookRequestComplete(AnonymousClass64.this.val$object, data.getBytes().length, data.getBytes());
                        }
                    });
                }
            });
            RequestAsyncTask task = new RequestAsyncTask(request);
            task.execute(new Void[0]);
        }
    }

    public static int faceBook_hasPermission(String permission) {
        if (!mUSE_FACEBOOK) {
            return 0;
        }
        List<String> permissions = mFB_Session.getPermissions();
        boolean contains = permissions.contains(permission);
        return contains ? 1 : 0;
    }

    public static void faceBook_dialogWithLogin(final String action, final String params) {
        faceBook_authorizeAndRun("email,user_birthday", new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.65
            @Override // java.lang.Runnable
            public void run() {
                cocojava.faceBook_dialog(action, params);
            }
        });
    }

    public static void faceBook_dialog(final String action, String params) {
        if (mUSE_FACEBOOK) {
            Log.i("FACEBOOK", "faceBook_dialog");
            final Bundle parBundle = new Bundle();
            String[] individualItems = params.split("#");
            for (int i = 0; i < individualItems.length / 2; i++) {
                parBundle.putString(individualItems[i * 2], individualItems[(i * 2) + 1]);
            }
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.66
                @Override // java.lang.Runnable
                public void run() {
                    WebDialog dialog = new WebDialog.Builder((Activity) cocojava.mContext, cocojava.mFB_Session, action, parBundle).setOnCompleteListener(new WebDialog.OnCompleteListener() { // from class: com.miniclip.nativeJNI.cocojava.66.1
                        @Override // com.facebook.widget.WebDialog.OnCompleteListener
                        public void onComplete(Bundle values, FacebookException error) {
                            boolean posted;
                            if (error == null) {
                                if (values.getString("request") != null || values.getString("post_id") != null) {
                                    posted = true;
                                } else {
                                    posted = false;
                                }
                            } else if (error instanceof FacebookOperationCanceledException) {
                                posted = false;
                            } else {
                                posted = false;
                            }
                            if (posted) {
                                cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.66.1.1
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        CocoJNI.MfacebookShareComplete();
                                    }
                                });
                            } else {
                                cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.66.1.2
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        CocoJNI.MfacebookShareCanceled();
                                    }
                                });
                            }
                        }
                    }).build();
                    dialog.show();
                }
            });
        }
    }

    public static void showHtmlDialog(final String htmlContent, final int _path) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.67
            @Override // java.lang.Runnable
            public void run() {
                HtmlDialog dialog = new HtmlDialog(cocojava.mContext, htmlContent, _path, new Facebook.DialogListener() { // from class: com.miniclip.nativeJNI.cocojava.67.1
                    @Override // com.facebook.android.Facebook.DialogListener
                    public void onComplete(Bundle values) {
                    }

                    @Override // com.facebook.android.Facebook.DialogListener
                    public void onFacebookError(FacebookError error) {
                    }

                    @Override // com.facebook.android.Facebook.DialogListener
                    public void onError(DialogError e) {
                    }

                    @Override // com.facebook.android.Facebook.DialogListener
                    public void onCancel() {
                    }
                });
                dialog.show();
            }
        });
    }

    public static int Newsfeed_getNumber() {
        return 0;
    }

    public static void Newsfeed_showDialog() {
    }

    public static int DeviceSupportsMultitouch() {
        return mContext.getPackageManager().hasSystemFeature("android.hardware.touchscreen.multitouch") ? 1 : 0;
    }

    public static String getAppVersionNumber() {
        String app_version_name = "";
        try {
            PackageInfo pi = mContext.getPackageManager().getPackageInfo(mContext.getPackageName(), 0);
            if (pi != null) {
                app_version_name = pi.versionName;
                String.valueOf(pi.versionCode);
                return app_version_name;
            }
            return app_version_name;
        } catch (PackageManager.NameNotFoundException e) {
            return app_version_name;
        }
    }

    public static int getAppVersionCode() {
        try {
            PackageInfo pi = mContext.getPackageManager().getPackageInfo(mContext.getPackageName(), 0);
            if (pi == null) {
                return 0;
            }
            int app_version_code = pi.versionCode;
            return app_version_code;
        } catch (PackageManager.NameNotFoundException e) {
            return 0;
        }
    }

    public static int getPendingPurchaseSignatureAmount() {
        SharedPreferences settingsT = mContext.getSharedPreferences("INAPP_PURCHASED_TEMP_SIGNATURE", 0);
        int amountT = settingsT.getInt("amount", 0);
        Log.i("cocojava", String.format("getPendingPurchaseSignatureAmount: %d", Integer.valueOf(amountT)));
        if (amountT >= 0 && settingsT.contains("pid" + String.valueOf(amountT - 1))) {
            return amountT;
        }
        return 0;
    }

    public static int callLastPendingPurchaseSignature(final int function) {
        SharedPreferences settingsT = mContext.getSharedPreferences("INAPP_PURCHASED_TEMP_SIGNATURE", 0);
        int amountT = settingsT.getInt("amount", 0) - 1;
        if (amountT >= 0 && settingsT.contains("pid" + String.valueOf(amountT))) {
            final String pid = settingsT.getString("pid" + String.valueOf(amountT), "");
            final String data = settingsT.getString("data" + String.valueOf(amountT), "");
            final String sig = settingsT.getString("sig" + String.valueOf(amountT), "");
            mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.68
                @Override // java.lang.Runnable
                public void run() {
                    CocoJNI.MsetInAppResponce(1, function, 0, pid, data, sig);
                }
            });
            Log.i("cocojava", String.format("callLastPendingPurchaseSignature: %d pid: %s data: %s sig: %s", Integer.valueOf(amountT), pid, data, sig));
            return amountT;
        }
        return 0;
    }

    public static int removeLastPendingPurchaseSignature() {
        SharedPreferences settingsT = mContext.getSharedPreferences("INAPP_PURCHASED_TEMP_SIGNATURE", 0);
        int amountT = settingsT.getInt("amount", 0) - 1;
        if (amountT >= 0 && settingsT.contains("pid" + String.valueOf(amountT))) {
            SharedPreferences.Editor editorT = settingsT.edit();
            editorT.remove("pid" + String.valueOf(amountT));
            editorT.remove("data" + String.valueOf(amountT));
            editorT.remove("sig" + String.valueOf(amountT));
            editorT.putInt("amount", amountT);
            editorT.commit();
            Log.i("cocojava", String.format("removePendingPurchaseSignature: %d", Integer.valueOf(amountT)));
            return 1;
        }
        return 0;
    }

    public static int getPendingPurchaseAmount(String key) {
        SharedPreferences settings = mContext.getSharedPreferences("INAPP_PURCHASED_TEMP", 0);
        int amount = settings.getInt(key, 0);
        Log.i("cocojava", String.format("getPendingPurchaseAmount: %s, %d", key, Integer.valueOf(amount)));
        return amount;
    }

    public static void setPendingPurchaseAmount(String key, int amount) {
        SharedPreferences settings = mContext.getSharedPreferences("INAPP_PURCHASED_TEMP", 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putInt(key, amount);
        editor.commit();
    }

    public static void sendEmail(final String destination, final String subject, final String text) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.69
            @Override // java.lang.Runnable
            public void run() {
                Intent intent = new Intent("android.intent.action.SEND");
                intent.setType("text/plain");
                if (destination != null) {
                    intent.putExtra("android.intent.extra.EMAIL", new String[]{destination});
                }
                if (subject != null) {
                    intent.putExtra("android.intent.extra.SUBJECT", subject);
                }
                if (text != null) {
                    intent.putExtra("android.intent.extra.TEXT", text);
                }
                cocojava.mContext.startActivity(Intent.createChooser(intent, "Send email..."));
            }
        });
    }

    public static void sendSMS(final String text) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.70
            @Override // java.lang.Runnable
            public void run() {
                Intent sendIntent = new Intent("android.intent.action.VIEW");
                if (text != null) {
                    sendIntent.putExtra("sms_body", text);
                }
                sendIntent.setType("vnd.android-dir/mms-sms");
                cocojava.mContext.startActivity(sendIntent);
            }
        });
    }

    public static void setFullVersion() {
        SharedPreferences_setInt("FULL_VERSION", 1);
    }

    public static int isFullVersion() {
        int i = SharedPreferences_getInt("FULL_VERSION");
        return i;
    }

    public static void sendGoogleEvent(String string, int value) {
        String[] event = string.split("/");
        if (event.length >= 3) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.71
                @Override // java.lang.Runnable
                public void run() {
                }
            });
        }
    }

    public static double NTP_JAVA_getOffsetFromServer(String serverName) {
        try {
            return mNtpHandler.getOffsetFromServer(serverName);
        } catch (IOException e) {
            e.printStackTrace();
            return 0.0d;
        }
    }

    public static void NTP_JAVA_getOffsetFromServerListAsync(String serverNames, int callback, int timeout) {
        mNtpHandler.getOffsetFromServerListAsync(serverNames, callback, timeout);
    }

    public static void PING_JAVA_simplePingAsync(String serverName, int callback, int timeout) {
        mPingHandler.simplePingAsync(serverName, callback, timeout);
    }

    public static int NF_showBoard() {
        if (!mUSE_NEWSFEED || mCurrentNewsfeed.messagesNum < 1) {
            return 0;
        }
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.72
            @Override // java.lang.Runnable
            public void run() {
                Log.i("cocojava", "Show NewsfeedDialog Non-urgent");
                cocojava.mCurrentNewsfeed.mIsVisible = true;
                if (cocojava.layout != null) {
                    cocojava.layout.removeView(cocojava.mCurrentNewsfeedDialog);
                }
                cocojava.mCurrentNewsfeedDialog = new NewsfeedDialog(cocojava.mContext, cocojava.mCurrentNewsfeed, false);
                cocojava.layout.addView(cocojava.mCurrentNewsfeedDialog);
            }
        });
        mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.73
            @Override // java.lang.Runnable
            public void run() {
                CocoJNI.NFcallBoardWillAppear();
                CocoJNI.NFcallBoardDidAppear();
                CocoJNI.MsetGamePause(1);
            }
        });
        return 1;
    }

    public static int NF_showUrgentBoard() {
        if (!mUSE_NEWSFEED || mCurrentNewsfeed.messagesNumUrgent < 1) {
            return 0;
        }
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.74
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.mCurrentNewsfeed.messagesNumUrgent < 1) {
                    cocojava.mCurrentNewsfeed.removeUrgentTimer();
                }
                Log.i("cocojava", "Show NewsfeedDialog Urgent");
                cocojava.mCurrentNewsfeed.mIsVisible = true;
                cocojava.mCurrentNewsfeed.removeUrgentTimer();
                if (cocojava.layout != null) {
                    cocojava.layout.removeView(cocojava.mCurrentNewsfeedDialog);
                }
                cocojava.mCurrentNewsfeedDialog = new NewsfeedDialog(cocojava.mContext, cocojava.mCurrentNewsfeed, true);
                cocojava.layout.addView(cocojava.mCurrentNewsfeedDialog);
            }
        });
        mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.75
            @Override // java.lang.Runnable
            public void run() {
                CocoJNI.NFcallBoardWillAppear();
                CocoJNI.NFcallBoardDidAppear();
                CocoJNI.MsetGamePause(1);
            }
        });
        return 1;
    }

    public static void NF_dismissBoard() {
        if (mUSE_NEWSFEED && mCurrentNewsfeedDialog != null) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.76
                @Override // java.lang.Runnable
                public void run() {
                    cocojava.mCurrentNewsfeed.mIsVisible = false;
                    cocojava.layout.removeView(cocojava.mCurrentNewsfeedDialog);
                    cocojava.mCurrentNewsfeedDialog = null;
                }
            });
            mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.77
                @Override // java.lang.Runnable
                public void run() {
                    CocoJNI.NFcallBoardWillDisappear();
                    CocoJNI.NFcallBoardDidDisappear();
                    CocoJNI.MsetGamePause(0);
                }
            });
        }
    }

    public static void NF_setSandBox(final int sandBoxMode) {
        if (mUSE_NEWSFEED && mCurrentNewsfeed != null) {
            ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.78
                @Override // java.lang.Runnable
                public void run() {
                    if (sandBoxMode != 0) {
                        cocojava.mCurrentNewsfeed.setSandBoxMode(true);
                    } else {
                        cocojava.mCurrentNewsfeed.setSandBoxMode(false);
                    }
                }
            });
        }
    }

    public static void NF_setShowBadge(int showBadge) {
        Log.i("cocojava", "NF_setShowBadge: deprecated method");
    }

    public static void keyboardInput_Show(final String text) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.79
            @Override // java.lang.Runnable
            public void run() {
                cocojava.mEditText.setText(text);
                cocojava.mEditText.setVisibility(0);
                InputMethodManager imm = (InputMethodManager) cocojava.mContext.getSystemService("input_method");
                imm.toggleSoftInput(2, 2);
                cocojava.mEditText.setSelection(cocojava.mEditText.getText().length());
            }
        });
    }

    public static void setCaretPosition(final int position) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.80
            @Override // java.lang.Runnable
            public void run() {
                cocojava.mEditText.setSelection(position);
                Log.i("KeyboardInput", String.format("setCaretPosition position: %d", Integer.valueOf(position)));
            }
        });
    }

    public static int getCaretPosition() {
        int position = mEditText.getSelectionStart();
        Log.i("KeyboardInput", String.format("getCaretPosition position: %d", Integer.valueOf(position)));
        return position;
    }

    public static void keyboardInput_Show_withMaxLengthLocked(final String text, final int maxLength) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.81
            @Override // java.lang.Runnable
            public void run() {
                cocojava.mEditText.setText(text);
                cocojava.mEditText.setVisibility(0);
                InputFilter[] FilterArray = {new InputFilter.LengthFilter(maxLength)};
                cocojava.mEditText.setFilters(FilterArray);
                InputMethodManager imm = (InputMethodManager) cocojava.mContext.getSystemService("input_method");
                imm.toggleSoftInput(2, 2);
                cocojava.mEditText.setSelection(cocojava.mEditText.getText().length());
            }
        });
    }

    public static String getDeviceId() {
        String deviceId = SharedPreferences_getString("Device Id");
        if (deviceId == "") {
            Log.i("JAVAINFO", "Trying to get miniclipId from sdcard");
            String aBuffer = "";
            try {
                FileInputStream fIn = new FileInputStream(new File("/sdcard/miniclipId.txt"));
                BufferedReader myReader = new BufferedReader(new InputStreamReader(fIn));
                while (true) {
                    String aDataRow = myReader.readLine();
                    if (aDataRow == null) {
                        break;
                    }
                    aBuffer = aBuffer + aDataRow;
                }
                myReader.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
            if (aBuffer != "") {
                deviceId = aBuffer;
                SharedPreferences_setString("Device Id", deviceId);
                Log.i("JAVAINFO", "DeviceID from SD Card = " + deviceId);
            }
        }
        if (deviceId == "") {
            Log.i("JAVAINFO", "Generating miniclipId");
            Date newDate = new Date();
            String deviceId2 = String.valueOf(newDate.getTime());
            Random rn = new Random();
            char[] text = new char[10];
            for (int i = 0; i < 10; i++) {
                text[i] = "abcdefghijmnopqrstuvxz0123456789".charAt(rn.nextInt("abcdefghijmnopqrstuvxz0123456789".length()));
            }
            deviceId = deviceId2 + "-" + new String(text);
            SharedPreferences_setString("Device Id", deviceId);
        }
        File myFile = new File("/sdcard/miniclipId.txt");
        if (deviceId != "" && !myFile.exists()) {
            Log.i("JAVAINFO", "Saving miniclipId to sdcard");
            try {
                myFile.createNewFile();
                FileOutputStream fOut = new FileOutputStream(myFile);
                OutputStreamWriter myOutWriter = new OutputStreamWriter(fOut);
                myOutWriter.append((CharSequence) deviceId);
                myOutWriter.close();
                fOut.close();
                Log.i("JAVAINFO", "DeviceID stored to sdcard = " + deviceId);
            } catch (IOException e3) {
                e3.printStackTrace();
            }
        }
        Log.i("JAVAINFO", "DeviceID = " + deviceId);
        return deviceId;
    }

    public static void setClipboardText(final String text) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.82
            @Override // java.lang.Runnable
            public void run() {
                ClipboardManager clipboard = (ClipboardManager) cocojava.mContext.getSystemService("clipboard");
                clipboard.setText(text);
            }
        });
    }

    public static void setKeyboardInputPosition(final float x, final float y, final float width, final float height, final float anchorX, final float anchorY) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.83
            @Override // java.lang.Runnable
            public void run() {
                float newHeight = height;
                if (height == BitmapDescriptorFactory.HUE_RED) {
                    newHeight = cocojava.mEditText.getHeight();
                }
                RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams((int) width, (int) newHeight);
                params.leftMargin = (int) (x - (width * anchorX));
                params.topMargin = (int) (y - (anchorY * newHeight));
                Log.i("setKeyboardInputPosition", String.format("newHeight: %f, anchorY: %f", Float.valueOf(newHeight), Float.valueOf(anchorY)));
            }
        });
    }

    public static void setKeyboardInputStyle(final int background, final int text, final float size) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.84
            @Override // java.lang.Runnable
            public void run() {
                cocojava.mEditText.setBackgroundColor(background);
                cocojava.mEditText.setTextColor(text);
                cocojava.mEditText.setTextSize(size);
            }
        });
    }

    public static void setKeyboardInputVisible(final int visible) {
        Log.i("setKeyboardInputVisible", String.format("visible: %d", Integer.valueOf(visible)));
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.85
            @Override // java.lang.Runnable
            public void run() {
                if (visible == 0) {
                    cocojava.mEditText.setVisibility(4);
                } else {
                    cocojava.mEditText.setVisibility(0);
                }
            }
        });
    }

    public static void setKeyboardInputVisibleDelayed(final int visible, int millisecs) {
        mKeyboardHandler.postDelayed(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.86
            @Override // java.lang.Runnable
            public void run() {
                cocojava.setKeyboardInputVisible(visible);
            }
        }, millisecs);
    }

    public static void setKeyboardInputText(final String text) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.87
            @Override // java.lang.Runnable
            public void run() {
                cocojava.mEditText.setText(text);
            }
        });
    }

    public static void keyboardInput_Hide() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.88
            @Override // java.lang.Runnable
            public void run() {
                InputMethodManager imm = (InputMethodManager) cocojava.mContext.getSystemService("input_method");
                imm.hideSoftInputFromWindow(cocojava.mEditText.getWindowToken(), 0);
            }
        });
    }

    public static void setKeyboardInputSingleLine(final int singleLine) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.89
            @Override // java.lang.Runnable
            public void run() {
                int i = 1;
                EditText editText = cocojava.mEditText;
                if (singleLine != 1) {
                    i = 100;
                }
                editText.setMaxLines(i);
            }
        });
    }

    public static void setKeyboardInputTypePassword(final int password) {
        Log.i("cocojava", String.format("setKeyboardInputTypePassword: %d", Integer.valueOf(password)));
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.90
            @Override // java.lang.Runnable
            public void run() {
                if (password == 0) {
                    cocojava.mEditText.setInputType(145);
                } else {
                    cocojava.mEditText.setInputType(129);
                }
            }
        });
    }

    public static void setKeyboardInputMaxLength(final int maxLength) {
        Log.i("cocojava", String.format("setKeyboardInputMaxLength: %d", Integer.valueOf(maxLength)));
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.91
            @Override // java.lang.Runnable
            public void run() {
                InputFilter[] FilterArray = {new InputFilter.LengthFilter(maxLength)};
                cocojava.mEditText.setFilters(FilterArray);
            }
        });
    }

    public static void custom_updateScore(final String leaderboardId, final int scoreValue, final Object userData) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.92
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).updateScoreCustom(leaderboardId, scoreValue, userData);
                }
            }
        });
    }

    public static void custom_updateScore(String leaderboardId, int scoreValue) {
        custom_updateScore(leaderboardId, scoreValue, null);
    }

    public static void custom_showLeaderboard(final String leaderboardId) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.93
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).showLeaderboardCustom(leaderboardId);
                }
            }
        });
    }

    public static void custom_showLeaderboards() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.94
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).showLeaderboardsCustom();
                }
            }
        });
    }

    public static void custom_updateAchievement(final String achievementId, final float progressValue, final Object userData) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.95
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).updateAchievementCustom(achievementId, progressValue, userData);
                }
            }
        });
    }

    public static void custom_updateAchievement(String achievementId, float progressValue) {
        custom_updateAchievement(achievementId, progressValue, null);
    }

    public static void custom_showAchievements() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.96
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).showAchievementsCustom();
                }
            }
        });
    }

    public void updateScoreCustom(String leaderboardId, long scoreValue, Object userData) {
        Log.i("cocojava", "OVERRIDE updateScoreCustom");
    }

    public void showLeaderboardCustom(String leaderboardId) {
        Log.i("cocojava", "OVERRIDE showLeaderboardCustom");
    }

    public void showLeaderboardsCustom() {
        Log.i("cocojava", "OVERRIDE showLeaderboardsCustom");
    }

    public void updateAchievementCustom(String achievementId, float progressValue, Object userData) {
        Log.i("cocojava", "OVERRIDE updateAchievementCustom");
    }

    public void showAchievementsCustom() {
        Log.i("cocojava", "OVERRIDE showAchievementsCustom");
    }

    public static void login_GooglePlayServices() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.97
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).googlePlayServicesLoginCustom();
                }
            }
        });
    }

    public static void logout_GooglePlayServices() {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.98
            @Override // java.lang.Runnable
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).googlePlayServicesLogoutCustom();
                }
            }
        });
    }

    public static int isSignedIn_GooglePlayServices() {
        return ((cocojava) mContext).googlePlayServicesIsSignedInCustom();
    }

    public int googlePlayServicesIsSignedInCustom() {
        Log.i("cocojava", "OVERRIDE googlePlayServicesIsSignedInCustom");
        return 0;
    }

    public void googlePlayServicesLoginCustom() {
        Log.i("cocojava", "OVERRIDE googlePlayServicesLoginCustom");
    }

    public void googlePlayServicesLogoutCustom() {
        Log.i("cocojava", "OVERRIDE googlePlayServicesLoginCustom");
    }

    public static void copyAsset(String filename) {
        AssetManager assetManager = ((Activity) mContext).getAssets();
        try {
            InputStream in = assetManager.open(filename);
            OutputStream out = new FileOutputStream("/sdcard/" + filename);
            try {
                copyFile(in, out);
                in.close();
                out.flush();
                out.close();
            } catch (Exception e) {
                e = e;
                Log.e("tag", e.getMessage());
            }
        } catch (Exception e2) {
            e = e2;
        }
    }

    public static void copyFile(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[1024];
        while (true) {
            int read = in.read(buffer);
            if (read != -1) {
                out.write(buffer, 0, read);
            } else {
                return;
            }
        }
    }

    public void showDatePickerDialog(int year, int month, int day) {
        DatePickerDialog dialog = new DatePickerDialog(mContext, new DatePickerDialog.OnDateSetListener() { // from class: com.miniclip.nativeJNI.cocojava.99
            @Override // android.app.DatePickerDialog.OnDateSetListener
            public void onDateSet(DatePicker view, final int year2, final int month2, final int day2) {
                cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.99.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CocoJNI.MdatePickerResponce(year2, month2 + 1, day2);
                        CocoJNI.MdatePickerClosed();
                    }
                });
            }
        }, year, month - 1, day);
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.miniclip.nativeJNI.cocojava.100
            @Override // android.content.DialogInterface.OnDismissListener
            public void onDismiss(DialogInterface dialog2) {
                cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.100.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CocoJNI.MdatePickerClosed();
                    }
                });
            }
        });
        dialog.show();
    }

    public static void showDatePickerDialog_JNI(final int year, final int month, final int day) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.cocojava.101
            @Override // java.lang.Runnable
            public void run() {
                ((cocojava) cocojava.mContext).showDatePickerDialog(year, month, day);
            }
        });
    }

    public static int getNumCores() {
        try {
            File dir = new File("/sys/devices/system/cpu/");
            File[] files = dir.listFiles(new FileFilter() { // from class: com.miniclip.nativeJNI.cocojava.1CpuFilter
                @Override // java.io.FileFilter
                public boolean accept(File pathname) {
                    return Pattern.matches("cpu[0-9]", pathname.getName());
                }
            });
            int cores = files.length;
            return cores;
        } catch (Exception e) {
            return 1;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String[] getInAppSkus() {
        Log.i("cocojava", "getInAppSkus: Override to get price info.");
        return new String[0];
    }

    public static String getDeviceInfo(String type) {
        if (type.contentEquals("device")) {
            return Build.DEVICE;
        }
        if (type.contentEquals("version")) {
            return Build.VERSION.RELEASE;
        }
        if (type.contentEquals("brand")) {
            return Build.BRAND;
        }
        return "";
    }

    public static long getFreeRAM() {
        ActivityManager activityManager = (ActivityManager) ((Activity) mContext).getSystemService("activity");
        ActivityManager.MemoryInfo mi = new ActivityManager.MemoryInfo();
        activityManager.getMemoryInfo(mi);
        Log.i("memory free", "" + mi.availMem);
        return mi.availMem;
    }

    public static int getTotalRAM() {
        try {
            FileReader localFileReader = new FileReader("/proc/meminfo");
            BufferedReader localBufferedReader = new BufferedReader(localFileReader, 8192);
            String str2 = localBufferedReader.readLine();
            String[] arrayOfString = str2.split("\\s+");
            long initial_memory = Integer.valueOf(arrayOfString[1]).intValue() * 1024;
            localBufferedReader.close();
            Log.i("cocojava - RAM", "" + initial_memory);
            return (int) initial_memory;
        } catch (IOException e) {
            return -1;
        }
    }
}
