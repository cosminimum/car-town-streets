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
import android.graphics.Paint;
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
import com.facebook.AccessTokenSource;
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
import com.tapjoy.TapjoySpendPointsNotifier;
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
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

public class cocojava extends EasyAppConnectOffers implements MoPubInterstitial.MoPubInterstitialListener, DialogInterface.OnClickListener, View.OnClickListener, MoPubView.OnAdLoadedListener, MoPubView.OnAdFailedListener, MoPubView.OnAdClickedListener {
    static final /* synthetic */ boolean $assertionsDisabled = (!cocojava.class.desiredAssertionStatus());
    public static int ALIGN_LEFT = 0;
    public static int ALIGN_RIGHT = 1;
    public static String FILENAME = "AndroidSSO_data";
    private static int GAME_MENU_STATE = 0;
    private static final int HANDLER_CLOSE_DIALOG = 3;
    private static final int HANDLER_EXIT_APP = 5;
    private static final int HANDLER_HIDE_DIALOG = 2;
    private static final int HANDLER_OPEN_URL = 4;
    private static final int HANDLER_SHOW_DIALOG = 1;
    protected static cocoaccel accelerometer;
    private static boolean accelerometerEnabled = false;
    public static RelativeLayout adLayout;
    public static RelativeLayout adLayoutH;
    /* access modifiers changed from: private */
    public static MoPubView adViewGame;
    /* access modifiers changed from: private */
    public static MoPubView adViewMenu;
    private static cocomusic backgroundMusicPlayer;
    private static MoPubView bigAd;
    private static boolean inAppsRemoveAds = false;
    private static MoPubInterstitial interstitial;
    public static RelativeLayout layout;
    protected static boolean mADS_BLOCKED_NOW = false;
    private static Handler mAdDelayHandler = new Handler();
    /* access modifiers changed from: private */
    public static RelativeLayout mBigAdView;
    public static boolean mBlockNewsButton = false;
    /* access modifiers changed from: private */
    public static RelativeLayout mCenterdAd;
    protected static boolean mConstantAd = true;
    /* access modifiers changed from: protected */
    public static Context mContext;
    protected static Newsfeed mCurrentNewsfeed = null;
    protected static NewsfeedDialog mCurrentNewsfeedDialog = null;
    protected static boolean mCustomInApp = false;
    protected static boolean mCustomLeaderboard = false;
    public static float mDensity;
    public static String mDeviceID = "";
    protected static boolean mENOUGH_MEMORY = true;
    public static EditText mEditText = null;
    /* access modifiers changed from: private */
    public static boolean mFB_AuthenticationRequested = false;
    public static Session mFB_Session;
    public static String mFacebookAPP_ID;
    /* access modifiers changed from: private */
    public static Handler mFacebookHandler = new Handler();
    protected static TapjoyFeaturedAppObject mFeaturedApObject;
    protected static interstitialMopubView mFullscreenInterstitial = null;
    public static ClearGLSurfaceView mGLView;
    private static int mGameState;
    protected static boolean mHAS_RETINA = false;
    private static Handler mHandler = null;
    protected static boolean mHasSecondIntro = false;
    private static boolean mHasWindowFocus;
    public static int mHeight;
    private static Runnable mHideAdsRun = new Runnable() {
        public void run() {
            cocojava.hideAds();
        }
    };
    /* access modifiers changed from: private */
    public static horizontalBanner mHorizontalBanner = null;
    public static boolean mHorizontalBannerDisplayed = false;
    protected static float mINGAME_HEIGHT = 320.0f;
    public static boolean mINGAME_LANDSCAPE = true;
    protected static boolean mINGAME_SCALE = false;
    protected static float mINGAME_WIDTH = 480.0f;
    public static int mInAppCallback;
    public static boolean mInAppManaged;
    public static String mInAppProductId;
    public static int mInAppResponce;
    public static int mInAppSelf;
    public static String mInAppTitle;
    private static infoTransmitter mInfoTransmitter;
    /* access modifiers changed from: private */
    public static RelativeLayout mInitView;
    /* access modifiers changed from: private */
    public static interstitialBanner mInterstitialBanner;
    public static boolean mKEYBOARD_CUSTOM_BACKGROUND = false;
    public static boolean mKEYBOARD_FULLSCREEN = true;
    public static boolean mKEYBOARD_INPUT_HIDE = true;
    public static boolean mKEYBOARD_INPUT_SINGLE_LINE = false;
    public static boolean mKEYBOARD_OVERRIDE_VISIBILITY = false;
    private static Handler mKeyboardHandler = new Handler();
    protected static int mLastBigAdType = 0;
    protected static boolean mMinimumResolutionSD = false;
    /* access modifiers changed from: private */
    public static MopubInterstitial mMopubInterstitial = null;
    /* access modifiers changed from: private */
    public static MopubView mMopubView = null;
    private static NtpHandler mNtpHandler = new NtpHandler();
    protected static int mNumCrashes = 0;
    protected static int mNumUpSellsThisSession = 0;
    private static PingHandler mPingHandler = new PingHandler();
    public static SharedPreferences mPrefs;
    /* access modifiers changed from: private */
    public static Button mRemove1;
    public static ImageView mRemoveAdsButton;
    public static boolean mRemoveAdsButtonHidden = true;
    public static RelativeLayout mRemoveAdsButtonLayout;
    public static ClearRenderer mRenderer = null;
    private static boolean mResumeOnFocus = false;
    /* access modifiers changed from: private */
    public static rotatedBannerImg mRotatedBanner;
    public static int mRotatedBannerDisplayed = 0;
    public static boolean mSHOW_KEYBOARD_INPUT = false;
    public static boolean mSPINNING_ANIMATION = false;
    protected static boolean mSTORE_PENDING_PURCHASES = false;
    protected static boolean mSTORE_PENDING_PURCHASES_SIGNATURE = false;
    /* access modifiers changed from: private */
    public static Button mSkip1;
    public static boolean mTEST_INAPPS = false;
    protected static boolean mUSE_ADS = true;
    protected static boolean mUSE_ADS_BIG = true;
    protected static boolean mUSE_ADS_HORIZONTAL = false;
    protected static float mUSE_ADS_HORIZONTAL_BANNER_OFFSET = BitmapDescriptorFactory.HUE_RED;
    protected static boolean mUSE_ADS_INTERSTITIAL_BANNER = false;
    protected static boolean mUSE_ADS_INTERSTITIAL_FULLSCREEN = false;
    protected static boolean mUSE_ADS_VERTICAL = false;
    protected static float mUSE_ADS_VERTICAL_BANNER_OFFSET = BitmapDescriptorFactory.HUE_RED;
    public static boolean mUSE_C2DM = false;
    protected static boolean mUSE_DEVICEID = true;
    public static boolean mUSE_FACEBOOK = false;
    protected static boolean mUSE_NEWSFEED = true;
    protected static boolean mUSE_PRESERVE_CONTEXT = true;
    public static boolean mUSE_REMOVE_ADS = false;
    public static int mWidth;
    public static RelativeLayout sideBar1;
    public static RelativeLayout sideBar2;
    protected static cocosound soundPlayer;
    private static cocotexture texture;
    private boolean isFirstRun = true;
    private HashMap<Integer, Dialog> mDialogs;
    private Handler mScreenFixHandler = new Handler();

    /* access modifiers changed from: protected */
    public String getMoPubBannerId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* access modifiers changed from: protected */
    public String getMoPubGameplayBannerId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* access modifiers changed from: protected */
    public String getMoPubMenuBannerId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* access modifiers changed from: protected */
    public String getMoPubInterstitialId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* access modifiers changed from: protected */
    public String getMoPubFullScreenInterstitialId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* access modifiers changed from: protected */
    public String getMoPubInterstitialBannerId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* access modifiers changed from: protected */
    public String getFullAppURI() {
        return "ERROR! OVERRIDE ME!";
    }

    /* access modifiers changed from: protected */
    public String getFullVersionGameImageId() {
        return "ERROR! OVERRIDE ME!";
    }

    /* access modifiers changed from: protected */
    public String getTapJoyHtmlOffer(TapjoyFeaturedAppObject featApObj) {
        return "ERROR! OVERRIDE ME!";
    }

    /* access modifiers changed from: protected */
    public void callGetJar(String itemID, int price, String title, int callback, int self, int showDialog) {
        Log.i("cocojava", "ERROR! OVERRIDE ME!");
    }

    /* access modifiers changed from: protected */
    public int getJarRecommendedPrice(int price) {
        Log.i("cocojava", "ERROR! OVERRIDE ME!");
        return 0;
    }

    /* access modifiers changed from: protected */
    public void createCustomNotification(int nid, String title, String text, int seconds) {
        Log.i("cocojava", "ERROR! OVERRIDE ME!");
    }

    /* access modifiers changed from: protected */
    public void cancelCustomNotification(int nid) {
        Log.i("cocojava", "ERROR! OVERRIDE ME!");
    }

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
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    AlertDialog dialog = new AlertDialog.Builder(cocojava.mContext).create();
                    dialog.setTitle("Memory warning");
                    dialog.setMessage("Car Town Streets needs more than 512MB of RAM for an optimal gameplay experience. You might experience some problems.");
                    dialog.setButton(-1, "Ok", new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int id) {
                        }
                    });
                    dialog.show();
                }
            });
        }
        if (Build.VERSION.SDK_INT >= 19) {
            getWindow().getDecorView().setOnSystemUiVisibilityChangeListener(new View.OnSystemUiVisibilityChangeListener() {
                public void onSystemUiVisibilityChange(int visibility) {
                    cocojava.this.setSystemUiVisibility();
                }
            });
            setSystemUiVisibility();
        }
        setVolumeControlStream(3);
        mInitView = new RelativeLayout(this);
        mInitView.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        mInitView.setPadding(0, 0, 0, 0);
        if (mContext.getResources().getIdentifier("default2", "drawable", mContext.getPackageName()) != 0) {
            mHasSecondIntro = true;
        }
        ImageView bg1 = new ImageView(this);
        bg1.setImageDrawable(getResources().getDrawable(mContext.getResources().getIdentifier("default1", "drawable", mContext.getPackageName())));
        bg1.setLayoutParams(new Gallery.LayoutParams(-1, -1));
        bg1.setScaleType(ImageView.ScaleType.FIT_XY);
        mInitView.addView(bg1);
        float f = getResources().getDisplayMetrics().density;
        float f2 = (float) getResources().getDisplayMetrics().widthPixels;
        float height = (float) getResources().getDisplayMetrics().heightPixels;
        RelativeLayout mainContainer = new RelativeLayout(this);
        RelativeLayout.LayoutParams mainContainerParams = new RelativeLayout.LayoutParams((int) (height / 2.0f), (int) (height / 2.0f));
        mainContainerParams.addRule(14);
        mainContainerParams.addRule(12);
        mainContainer.setLayoutParams(mainContainerParams);
        mInitView.addView(mainContainer);
        if (mSPINNING_ANIMATION) {
            ImageView ball = new ImageView(this);
            ball.setImageDrawable(getResources().getDrawable(mContext.getResources().getIdentifier("spinning_ball", "drawable", mContext.getPackageName())));
            RelativeLayout.LayoutParams ballParams = new RelativeLayout.LayoutParams((int) (height / 10.0f), (int) (height / 10.0f));
            ballParams.addRule(13);
            ball.setLayoutParams(ballParams);
            ball.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            mainContainer.addView(ball);
            ImageView ballSpin = new ImageView(this);
            ballSpin.setImageDrawable(getResources().getDrawable(mContext.getResources().getIdentifier("spinning_ball_effect", "drawable", mContext.getPackageName())));
            RelativeLayout.LayoutParams ballSpinParams = new RelativeLayout.LayoutParams((int) (height / 8.0f), (int) (height / 8.0f));
            ballSpinParams.addRule(13);
            ballSpin.setLayoutParams(ballSpinParams);
            ballSpin.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            mainContainer.addView(ballSpin);
            Animation anim = new RotateAnimation(BitmapDescriptorFactory.HUE_RED, 360.0f, (float) (((int) (height / 8.0f)) / 2), (float) (((int) (height / 8.0f)) / 2));
            anim.setDuration(1000);
            anim.setRepeatCount(-1);
            anim.setInterpolator(new LinearInterpolator());
            anim.setFillAfter(true);
            ballSpin.startAnimation(anim);
        }
    }

    /* access modifiers changed from: private */
    public void setSystemUiVisibility() {
        getWindow().getDecorView().setSystemUiVisibility(5894);
    }

    public static boolean isInstalledOnSdCard() {
        try {
            String filesDir = mContext.getFilesDir().getAbsolutePath();
            if (filesDir.startsWith("/data/")) {
                return false;
            }
            if (filesDir.contains("/mnt/") || filesDir.contains("/sdcard/")) {
                return true;
            }
            return false;
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
        long availableSpace = ((long) stat.getAvailableBlocks()) * ((long) stat.getBlockSize());
        Log.i("cocojava", "Available " + (onSDcard ? "sdcard" : "internal") + " memory: " + (availableSpace / 1048576));
        return availableSpace / 1048576;
    }

    public static void displayFreeSpaceWarning(String message) {
        AlertDialog dialog = new AlertDialog.Builder(mContext).create();
        dialog.setTitle("Not enough memory");
        dialog.setMessage(message);
        dialog.setButton(-1, "Ok", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
                cocojava.exitApplication();
            }
        });
        dialog.show();
    }

    public static void displayIntro(String s) {
        mInitView.removeAllViews();
        ImageView bg1 = new ImageView(mContext);
        bg1.setImageDrawable(mContext.getResources().getDrawable(mContext.getResources().getIdentifier(s, "drawable", mContext.getPackageName())));
        bg1.setLayoutParams(new Gallery.LayoutParams(-1, -1));
        bg1.setScaleType(ImageView.ScaleType.FIT_XY);
        mInitView.addView(bg1);
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        super.onStart();
        firstRun();
    }

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
            Log.i("Dim", String.format("width: %d, height: %d, density: %f", new Object[]{Integer.valueOf(mWidth), Integer.valueOf(mHeight), Float.valueOf(mDensity)}));
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
            adLayoutH.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
            adLayoutH.addView(adLayout);
            layout = new RelativeLayout(this);
            layout.setMinimumWidth(mWidth);
            layout.setMinimumHeight(mHeight);
            if (mUSE_ADS_VERTICAL) {
                int resourceIdSide1 = mContext.getResources().getIdentifier("side1", "drawable", mContext.getPackageName());
                int resourceIdSide2 = mContext.getResources().getIdentifier("side2", "drawable", mContext.getPackageName());
                int resourceIdSide3 = mContext.getResources().getIdentifier("side3", "drawable", mContext.getPackageName());
                int identifier = mContext.getResources().getIdentifier("a100x640", "drawable", mContext.getPackageName());
                sideBar1 = new RelativeLayout(this);
                sideBar1.setLayoutParams(new RelativeLayout.LayoutParams((int) (50.0f * mDensity), (int) ((((float) mHeight) - (320.0f * mDensity)) * 0.5f)));
                ImageView imageView = new ImageView(this);
                imageView.setImageDrawable(getResources().getDrawable(resourceIdSide2));
                imageView.setLayoutParams(new Gallery.LayoutParams(-1, -1));
                imageView.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar1.addView(imageView);
                ImageView imageView2 = new ImageView(this);
                imageView2.setImageDrawable(getResources().getDrawable(resourceIdSide1));
                imageView2.setLayoutParams(new Gallery.LayoutParams(-1, (int) (20.0f * mDensity)));
                imageView2.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar1.addView(imageView2);
                RelativeLayout relativeLayout = new RelativeLayout(this);
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, (int) (20.0f * mDensity));
                layoutParams.addRule(12);
                relativeLayout.setLayoutParams(layoutParams);
                ImageView imageView3 = new ImageView(this);
                imageView3.setImageDrawable(getResources().getDrawable(resourceIdSide3));
                imageView3.setLayoutParams(new Gallery.LayoutParams(-1, (int) (20.0f * mDensity)));
                imageView3.setScaleType(ImageView.ScaleType.FIT_XY);
                relativeLayout.addView(imageView3);
                sideBar1.addView(relativeLayout);
                sideBar2 = new RelativeLayout(this);
                RelativeLayout.LayoutParams sideBar2Params = new RelativeLayout.LayoutParams((int) (50.0d * ((double) mDensity)), (int) ((((float) mHeight) - (320.0f * mDensity)) * 0.5f));
                sideBar2Params.addRule(12);
                sideBar2.setLayoutParams(sideBar2Params);
                ImageView imageView4 = new ImageView(this);
                imageView4.setImageDrawable(getResources().getDrawable(resourceIdSide2));
                imageView4.setLayoutParams(new Gallery.LayoutParams(-1, -1));
                imageView4.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar2.addView(imageView4);
                RelativeLayout relativeLayout2 = new RelativeLayout(this);
                RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, (int) (20.0f * mDensity));
                layoutParams2.addRule(12);
                relativeLayout2.setLayoutParams(layoutParams2);
                ImageView imageView5 = new ImageView(this);
                imageView5.setImageDrawable(getResources().getDrawable(resourceIdSide3));
                imageView5.setLayoutParams(new Gallery.LayoutParams(-1, (int) (20.0f * mDensity)));
                imageView5.setScaleType(ImageView.ScaleType.FIT_XY);
                relativeLayout2.addView(imageView5);
                sideBar2.addView(relativeLayout2);
                ImageView imageView6 = new ImageView(this);
                imageView6.setImageDrawable(getResources().getDrawable(resourceIdSide1));
                imageView6.setLayoutParams(new Gallery.LayoutParams(-1, (int) (20.0f * mDensity)));
                imageView6.setScaleType(ImageView.ScaleType.FIT_XY);
                sideBar2.addView(imageView6);
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
                RelativeLayout relativeLayout3 = new RelativeLayout(this);
                relativeLayout3.setLayoutParams(new RelativeLayout.LayoutParams((int) ((((float) mWidth) - (320.0f * mDensity)) * 0.5f), (int) (50.0d * ((double) mDensity))));
                ImageView imageView7 = new ImageView(this);
                imageView7.setImageDrawable(getResources().getDrawable(resourceIdSide22));
                imageView7.setLayoutParams(new Gallery.LayoutParams(-1, -1));
                imageView7.setScaleType(ImageView.ScaleType.FIT_XY);
                relativeLayout3.addView(imageView7);
                ImageView imageView8 = new ImageView(this);
                imageView8.setImageDrawable(getResources().getDrawable(resourceIdSide12));
                imageView8.setLayoutParams(new Gallery.LayoutParams((int) (20.0f * mDensity), -1));
                imageView8.setScaleType(ImageView.ScaleType.FIT_XY);
                relativeLayout3.addView(imageView8);
                RelativeLayout relativeLayout4 = new RelativeLayout(this);
                RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams((int) (20.0f * mDensity), -1);
                layoutParams3.addRule(11);
                relativeLayout4.setLayoutParams(layoutParams3);
                ImageView imageView9 = new ImageView(this);
                imageView9.setImageDrawable(getResources().getDrawable(resourceIdSide32));
                imageView9.setLayoutParams(new Gallery.LayoutParams((int) (20.0f * mDensity), -1));
                imageView9.setScaleType(ImageView.ScaleType.FIT_XY);
                relativeLayout4.addView(imageView9);
                relativeLayout3.addView(relativeLayout4);
                RelativeLayout relativeLayout5 = new RelativeLayout(this);
                RelativeLayout.LayoutParams sideBar2Params2 = new RelativeLayout.LayoutParams((int) ((((float) mWidth) - (320.0f * mDensity)) * 0.5f), (int) (50.0d * ((double) mDensity)));
                sideBar2Params2.addRule(11);
                relativeLayout5.setLayoutParams(sideBar2Params2);
                ImageView imageView10 = new ImageView(this);
                imageView10.setImageDrawable(getResources().getDrawable(resourceIdSide22));
                imageView10.setLayoutParams(new Gallery.LayoutParams(-1, -1));
                imageView10.setScaleType(ImageView.ScaleType.FIT_XY);
                relativeLayout5.addView(imageView10);
                RelativeLayout relativeLayout6 = new RelativeLayout(this);
                RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams((int) (20.0f * mDensity), -1);
                layoutParams4.addRule(11);
                relativeLayout6.setLayoutParams(layoutParams4);
                ImageView imageView11 = new ImageView(this);
                imageView11.setImageDrawable(getResources().getDrawable(resourceIdSide32));
                imageView11.setLayoutParams(new Gallery.LayoutParams((int) (20.0f * mDensity), -1));
                imageView11.setScaleType(ImageView.ScaleType.FIT_XY);
                relativeLayout6.addView(imageView11);
                relativeLayout5.addView(relativeLayout6);
                ImageView imageView12 = new ImageView(this);
                imageView12.setImageDrawable(getResources().getDrawable(resourceIdSide12));
                imageView12.setLayoutParams(new Gallery.LayoutParams((int) (20.0f * mDensity), -1));
                imageView12.setScaleType(ImageView.ScaleType.FIT_XY);
                relativeLayout5.addView(imageView12);
                mHorizontalBanner = new horizontalBanner(this);
                layout.addView(relativeLayout3);
                layout.addView(relativeLayout5);
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
            mHandler = new Handler() {
                public void handleMessage(Message msg) {
                    switch (msg.what) {
                        case 1:
                            DialogMessage dm = (DialogMessage) msg.obj;
                            cocojava.this.showDialog(dm.msgId, dm.title, dm.message, dm.buttonTitles);
                            return;
                        case 2:
                            cocojava.this.hideDialog(((DialogMessage) msg.obj).msgId);
                            return;
                        case 3:
                            cocojava.this.closeDialog(((DialogMessage) msg.obj).msgId);
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
                mEditText = new EditText(mContext) {
                    public boolean onKeyPreIme(int keyCode, KeyEvent event) {
                        return true;
                    }
                };
                if (mKEYBOARD_INPUT_HIDE) {
                    mEditText.setLayoutParams(new RelativeLayout.LayoutParams(1, 1));
                }
                mEditText.setImeOptions(6);
                mEditText.addTextChangedListener(new TextWatcher() {
                    public void onTextChanged(CharSequence s, int start, int before, int count) {
                        if (cocojava.mEditText.getVisibility() != 4) {
                            cocojava.mGLView.queueEvent(new Runnable() {
                                public void run() {
                                    CocoJNI.MkeyboardInputResponse(cocojava.mEditText.getText().toString());
                                }
                            });
                        }
                    }

                    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                    }

                    public void afterTextChanged(Editable s) {
                    }
                });
                mEditText.setOnEditorActionListener(new TextView.OnEditorActionListener() {
                    public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                        if (cocojava.mEditText.getVisibility() != 4) {
                            if (actionId == 6 || event.getKeyCode() == 66 || actionId == 5) {
                                ((Activity) cocojava.mContext).runOnUiThread(new Runnable() {
                                    public void run() {
                                        if (!cocojava.mKEYBOARD_OVERRIDE_VISIBILITY) {
                                            cocojava.mEditText.setVisibility(4);
                                        }
                                        ((InputMethodManager) cocojava.mContext.getSystemService("input_method")).hideSoftInputFromWindow(cocojava.mEditText.getWindowToken(), 0);
                                    }
                                });
                            }
                            cocojava.mGLView.queueEvent(new Runnable() {
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
                    hideEditText.setLayoutParams(new RelativeLayout.LayoutParams(-2, -2));
                    hideEditText.addView(mEditText);
                    int i = Build.VERSION.SDK_INT;
                    layout.addView(hideEditText);
                }
                if (!mKEYBOARD_FULLSCREEN) {
                    mEditText.setImeOptions(268435462);
                }
                mEditText.setOnClickListener(new View.OnClickListener() {
                    public void onClick(View arg0) {
                    }
                });
                if (mKEYBOARD_CUSTOM_BACKGROUND) {
                    mEditText.setBackgroundDrawable(getResources().getDrawable(mContext.getResources().getIdentifier("roundsquare", "drawable", mContext.getPackageName())));
                }
            }
            this.mDialogs = new HashMap<>();
            boolean isSDcardPresent = isSDcardPresent();
            float availableMemoryOnDevice = availableMemoryOnDevice();
            float availableMemoryOnSDcard = availableMemoryOnSDcard();
            if (mUSE_REMOVE_ADS) {
                float scaleF = ((float) getResources().getDisplayMetrics().heightPixels) / 480.0f;
                RelativeLayout.LayoutParams paramsnb = new RelativeLayout.LayoutParams((int) (100.0f * scaleF), (int) (59.0f * scaleF));
                paramsnb.addRule(12);
                paramsnb.leftMargin = (int) (5.0f * scaleF);
                paramsnb.bottomMargin = (int) (200.0f * scaleF);
                mRemoveAdsButton = new ImageView(this);
                mRemoveAdsButton.setImageDrawable(getResources().getDrawable(getResources().getIdentifier("remove_ads", "drawable", getPackageName())));
                mRemoveAdsButton.setOnClickListener(this);
                mRemoveAdsButton.setLayoutParams(paramsnb);
                mRemoveAdsButtonLayout = new RelativeLayout(this);
                layout.addView(mRemoveAdsButtonLayout);
            }
            if (mUSE_NEWSFEED) {
                mCurrentNewsfeed = new Newsfeed(mContext, mDeviceID);
                new Handler().postDelayed(new Runnable() {
                    public void run() {
                        cocojava.mCurrentNewsfeed.update();
                    }
                }, 2000);
            }
        }
    }

    public void onLowMemory() {
        Log.i("MEMORY WARNING", "LOW MEMORY");
        mNumCrashes++;
        if (mNumCrashes >= 3) {
            mNumCrashes = 0;
            mGLView.queueEvent(new Runnable() {
                public void run() {
                    CocoJNI.MlowMemory();
                }
            });
        }
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        final int id = keyCode;
        switch (keyCode) {
            case 4:
                if (event.isAltPressed()) {
                    mGLView.queueEvent(new Runnable() {
                        public void run() {
                            CocoJNI.MpressedKey(id, 1);
                        }
                    });
                    return true;
                }
                mGLView.queueEvent(new Runnable() {
                    public void run() {
                        CocoJNI.MpressedBackButton();
                    }
                });
                return true;
            case 19:
            case MMError.DISPLAY_AD_NOT_READY:
            case MMError.DISPLAY_AD_EXPIRED:
            case MMError.DISPLAY_AD_NOT_FOUND:
            case MMError.DISPLAY_AD_ALREADY_DISPLAYED:
            case 82:
            case 99:
            case 100:
            case 108:
            case 109:
                mGLView.queueEvent(new Runnable() {
                    public void run() {
                        CocoJNI.MpressedKey(id, 1);
                    }
                });
                return true;
            default:
                return super.onKeyDown(keyCode, event);
        }
    }

    public boolean onKeyUp(int keyCode, KeyEvent event) {
        final int id = keyCode;
        switch (keyCode) {
            case 19:
            case MMError.DISPLAY_AD_NOT_READY:
            case MMError.DISPLAY_AD_EXPIRED:
            case MMError.DISPLAY_AD_NOT_FOUND:
            case MMError.DISPLAY_AD_ALREADY_DISPLAYED:
            case 82:
            case 99:
            case 100:
            case 108:
            case 109:
                mGLView.queueEvent(new Runnable() {
                    public void run() {
                        CocoJNI.MpressedKey(id, 0);
                    }
                });
                return true;
            default:
                return super.onKeyUp(keyCode, event);
        }
    }

    /* access modifiers changed from: package-private */
    public int buttonValue2Int(int value) {
        switch (value) {
            case ProfilePictureView.NORMAL:
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

    /* access modifiers changed from: package-private */
    public int int2ButtonValue(int value) {
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

    /* access modifiers changed from: package-private */
    public void showDialog(int msgId, String title, String message, String[] buttonTitles) {
        AlertDialog dialog;
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
                dialog.setMessage(message);
                for (int i2 = 0; i2 < buttonTitles.length; i2++) {
                    dialog.setButton(int2ButtonValue(i2), buttonTitles[i2], this);
                }
            }
            this.mDialogs.put(Integer.valueOf(msgId), dialog);
        } else {
            dialog = this.mDialogs.get(Integer.valueOf(msgId));
        }
        dialog.show();
    }

    /* access modifiers changed from: package-private */
    public void hideDialog(int msgId) {
        Dialog dialog;
        if (this.mDialogs.containsKey(Integer.valueOf(msgId)) && (dialog = this.mDialogs.get(Integer.valueOf(msgId))) != null) {
            dialog.hide();
        }
    }

    /* access modifiers changed from: package-private */
    public void closeDialog(int msgId) {
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

    public void onClick(DialogInterface dialog, int buttonIndex) {
        for (Map.Entry<Integer, Dialog> entry : this.mDialogs.entrySet()) {
            if (entry.getValue() == dialog) {
                CocoJNI.MonMessageBoxButtonPressed(entry.getKey().intValue(), buttonValue2Int(buttonIndex));
                return;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        super.onStop();
        FlurryAgent.onEndSession(this);
    }

    public static void showTapJoyOffers() {
        if (mUSE_TAPJOY) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    TapjoyConnect.getTapjoyConnectInstance().showOffers();
                }
            });
        }
    }

    public static void spendTapPoints(final int points) {
        if (mUSE_TAPJOY) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    TapjoyConnect.getTapjoyConnectInstance().spendTapPoints(points, (TapjoySpendPointsNotifier) null);
                }
            });
        }
    }

    public static void showTapJoyView(TapjoyFeaturedAppObject featuredApObject) {
        mFeaturedApObject = featuredApObject;
    }

    /* access modifiers changed from: protected */
    public void showMiniclipViewInternal() {
        MiniclipUpsellView upView = new MiniclipUpsellView(mContext);
        layout.removeView(upView);
        layout.addView(upView);
    }

    public static void showMiniclipView() {
        if (mUSE_ADS) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    ((cocojava) cocojava.mContext).showMiniclipViewInternal();
                }
            });
        }
    }

    public static void showTapFeatureAd() {
        if (mUSE_TAPJOY) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    TapjoyConnect.getTapjoyConnectInstance().getFeaturedApp((TapjoyFeaturedAppNotifier) cocojava.mContext);
                }
            });
        }
    }

    public static void showSimpleTapjoyFeatureAd() {
        if (mUSE_TAPJOY) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
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
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    cocojava.mGLView.queueEvent(new Runnable() {
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
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
                cocojava.mCenterdAd.setLayoutParams(new RelativeLayout.LayoutParams(((int) (300.0d * ((double) cocojava.mDensity))) + 40, -1));
                cocojava.mCenterdAd.setOnClickListener((View.OnClickListener) cocojava.mContext);
                cocojava.mBigAdView.addView(cocojava.mCenterdAd);
                ImageView bg1 = new ImageView(cocojava.mContext);
                bg1.setImageDrawable(cocojava.mContext.getResources().getDrawable(cocojava.mContext.getResources().getIdentifier("full_dialog1", "drawable", cocojava.mContext.getPackageName())));
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
                new RelativeLayout.LayoutParams(((int) ((300.0d * ((double) cocojava.mDensity)) * 0.5d)) - 40, -2);
                cocojava.mSkip1.setText("Skip");
                centerdButton.addView(cocojava.mSkip1);
                cocojava.mSkip1.setOnClickListener((View.OnClickListener) cocojava.mContext);
                Button unused4 = cocojava.mRemove1 = new Button(cocojava.mContext);
                RelativeLayout.LayoutParams paramsR = new RelativeLayout.LayoutParams(((int) ((300.0d * ((double) cocojava.mDensity)) * 0.5d)) - 40, -2);
                paramsR.addRule(11);
                cocojava.mRemove1.setLayoutParams(paramsR);
                cocojava.mRemove1.setText("Remove Ads");
                centerdButton.addView(cocojava.mRemove1);
                cocojava.mRemove1.setOnClickListener((View.OnClickListener) cocojava.mContext);
                cocojava.mBigAdView.setOnClickListener((View.OnClickListener) cocojava.mContext);
                cocojava.mBigAdView.setClickable(true);
                cocojava.mGLView.queueEvent(new Runnable() {
                    public void run() {
                        CocoJNI.MsetGamePause(1);
                    }
                });
            }
        });
    }

    /* access modifiers changed from: protected */
    public void showInterstitial() {
    }

    public static void pushInterstitial() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                ((cocojava) cocojava.mContext).showInterstitial();
            }
        });
    }

    public static void showBigAd() {
        if (mUSE_ADS_BIG && mUSE_ADS) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    MoPubView bigAd = new MoPubView(cocojava.mContext);
                    bigAd.setOnAdLoadedListener((cocojava) cocojava.mContext);
                    bigAd.setAdUnitId(((cocojava) cocojava.mContext).getMoPubInterstitialId());
                    bigAd.loadAd();
                    if (cocojava.mMopubView != null) {
                        cocojava.layout.removeView(cocojava.mMopubView);
                    }
                    MopubView unused = cocojava.mMopubView = new MopubView(cocojava.mContext, bigAd);
                    cocojava.layout.addView(cocojava.mMopubView);
                }
            });
        }
    }

    public static void loadFullScreenAd() {
        if (mUSE_ADS) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
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
            ((Activity) mContext).runOnUiThread(new Runnable() {
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

    public static void enableAdsWithPosition(float x, float y, float anchorX, float anchorY, float currentWidth, String adId) {
        if (mUSE_ADS) {
            final float f = currentWidth;
            final float f2 = x;
            final float f3 = anchorX;
            final float f4 = y;
            final float f5 = anchorY;
            final String str = adId;
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    MoPubView adView;
                    int adViewType;
                    MoPubView adView2;
                    MoPubView adView3;
                    if (!(cocojava.adLayout == null || cocojava.adLayout.getParent() == cocojava.adLayoutH)) {
                        cocojava.adLayoutH.addView(cocojava.adLayout);
                    }
                    RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams((int) (320.0d * ((double) cocojava.mDensity)), (int) (50.0d * ((double) cocojava.mDensity)));
                    float screenWidth = cocojava.mINGAME_WIDTH;
                    float screenHeight = cocojava.mINGAME_HEIGHT;
                    if (f == BitmapDescriptorFactory.HUE_RED) {
                        if (cocojava.mINGAME_LANDSCAPE && !cocojava.mINGAME_SCALE) {
                            screenWidth = (cocojava.mINGAME_HEIGHT / ((float) cocojava.mHeight)) * ((float) cocojava.mWidth);
                        } else if (!cocojava.mINGAME_SCALE) {
                            screenHeight = (cocojava.mINGAME_WIDTH / ((float) cocojava.mWidth)) * ((float) cocojava.mHeight);
                        }
                        if ((cocojava.mWidth > 799 || cocojava.mHeight > 799) && cocojava.mHAS_RETINA) {
                            screenWidth *= 1.0f;
                            screenHeight *= 1.0f;
                        }
                    } else {
                        screenWidth = f;
                    }
                    int adOffsetX = (int) (cocojava.mUSE_ADS_VERTICAL_BANNER_OFFSET * cocojava.mDensity);
                    int adOffsetY = (int) (cocojava.mUSE_ADS_HORIZONTAL_BANNER_OFFSET * cocojava.mDensity);
                    params.leftMargin = ((int) ((f2 * (((float) cocojava.mWidth) / screenWidth)) - (f3 * (320.0f * cocojava.mDensity)))) + adOffsetX;
                    params.topMargin = ((int) ((f4 * (((float) cocojava.mHeight) / screenHeight)) - ((1.0f - f5) * (50.0f * cocojava.mDensity)))) + adOffsetY;
                    if (str.compareTo(((cocojava) cocojava.mContext).getMoPubGameplayBannerId()) == 0) {
                        adView = cocojava.adViewGame;
                        cocojava.hideAd(cocojava.adViewMenu);
                        adViewType = 1;
                    } else {
                        adView = cocojava.adViewMenu;
                        cocojava.hideAd(cocojava.adViewGame);
                        adViewType = 2;
                    }
                    if (adView2 == null || adView2.getParent() != cocojava.adLayout || !adView2.isShown() || !adView2.AdLoaded() || str.compareTo(adView2.getAdUnitId()) != 0) {
                        if (!cocojava.mConstantAd) {
                            if (adView2 != null) {
                                cocojava.adLayout.removeView(adView2);
                                adView2.destroy();
                            }
                            if (adViewType == 1) {
                                MoPubView unused = cocojava.adViewGame = new MoPubView(cocojava.mContext);
                                adView3 = cocojava.adViewGame;
                            } else {
                                MoPubView unused2 = cocojava.adViewMenu = new MoPubView(cocojava.mContext);
                                adView3 = cocojava.adViewMenu;
                            }
                            adView2.setOnAdLoadedListener((cocojava) cocojava.mContext);
                            adView2.setOnAdFailedListener((cocojava) cocojava.mContext);
                            adView2.setOnAdClickedListener((cocojava) cocojava.mContext);
                            adView2.setAdUnitId(str);
                            adView2.setVisibility(0);
                            adView2.loadAd();
                        } else if (adView2 == null) {
                            if (adViewType == 1) {
                                MoPubView unused3 = cocojava.adViewGame = new MoPubView(cocojava.mContext);
                                adView2 = cocojava.adViewGame;
                            } else {
                                MoPubView unused4 = cocojava.adViewMenu = new MoPubView(cocojava.mContext);
                                adView2 = cocojava.adViewMenu;
                            }
                            adView2.setOnAdLoadedListener((cocojava) cocojava.mContext);
                            adView2.setOnAdFailedListener((cocojava) cocojava.mContext);
                            adView2.setOnAdClickedListener((cocojava) cocojava.mContext);
                            adView2.setAdUnitId(str);
                            adView2.setVisibility(0);
                            adView2.loadAd();
                        } else {
                            cocojava.adLayout.removeView(adView2);
                        }
                        cocojava.adLayout.addView(adView2, params);
                        if (adView2.AdLoaded()) {
                            Animation anim = new ScaleAnimation(BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 1.0f, 160.0f * cocojava.mDensity, BitmapDescriptorFactory.HUE_RED);
                            anim.setDuration(500);
                            adView2.setVisibility(1);
                            adView2.startAnimation(anim);
                            return;
                        }
                        return;
                    }
                    RelativeLayout.LayoutParams paramsCur = (RelativeLayout.LayoutParams) adView2.getLayoutParams();
                    final RelativeLayout.LayoutParams paramsFinal = params;
                    final MoPubView adViewFinal = adView2;
                    if (paramsCur.leftMargin != params.leftMargin || paramsCur.topMargin != params.topMargin) {
                        Animation anim2 = new ScaleAnimation(1.0f, BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 160.0f * cocojava.mDensity, BitmapDescriptorFactory.HUE_RED);
                        anim2.setDuration(500);
                        anim2.setAnimationListener(new Animation.AnimationListener() {
                            public void onAnimationStart(Animation animation) {
                            }

                            public void onAnimationRepeat(Animation animation) {
                            }

                            public void onAnimationEnd(Animation animation) {
                                Animation anim = new ScaleAnimation(BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 1.0f, 160.0f * cocojava.mDensity, BitmapDescriptorFactory.HUE_RED);
                                anim.setDuration(500);
                                adViewFinal.setLayoutParams(paramsFinal);
                                adViewFinal.startAnimation(anim);
                            }
                        });
                        adView2.startAnimation(anim2);
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                if (cocojava.adLayout != null && cocojava.adLayout.getParent() == cocojava.adLayoutH) {
                    cocojava.adLayoutH.removeView(cocojava.adLayout);
                }
                cocojava.hideAd(cocojava.adViewGame);
                cocojava.hideAd(cocojava.adViewMenu);
            }
        });
    }

    public static void hideAd(MoPubView adView) {
        if (adView != null && adView.getParent() == adLayout && adView.getAnimation() == null) {
            final MoPubView adViewFinal = adView;
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    Animation anim = new ScaleAnimation(1.0f, BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 160.0f * cocojava.mDensity, BitmapDescriptorFactory.HUE_RED);
                    anim.setDuration(500);
                    anim.setAnimationListener(new Animation.AnimationListener() {
                        public void onAnimationStart(Animation animation) {
                        }

                        public void onAnimationRepeat(Animation animation) {
                        }

                        public void onAnimationEnd(Animation animation) {
                            if (adViewFinal != null) {
                                cocojava.adLayout.removeView(adViewFinal);
                            }
                        }
                    });
                    cocojava.adLayout.removeView(adViewFinal);
                }
            });
        }
    }

    public static void hideAdsInSeconds(int seconds) {
        mAdDelayHandler.removeCallbacks(mHideAdsRun);
        mAdDelayHandler.postDelayed(mHideAdsRun, (long) (seconds * 1000));
    }

    public static void showAds() {
        Log.i("showAds", "deprecated use enableAdsWithPosition");
    }

    public static void showAd(final MoPubView adView) {
        if (mUSE_ADS && adView != null) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    if (adView != null) {
                        cocojava.adLayout.removeView(adView);
                        cocojava.adLayout.addView(adView);
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                ((cocojava) cocojava.mContext).createCustomNotification(nid, title, text, when);
            }
        });
    }

    public static void cancelNotification(final int nid) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                ((cocojava) cocojava.mContext).cancelCustomNotification(nid);
            }
        });
    }

    public static int getRecommendedPriceGetJar(int price) {
        return ((cocojava) mContext).getJarRecommendedPrice(price);
    }

    public static void callInAppGetJar(String itemID, int price, String title, int callback, int self, int showDialog) {
        final String str = itemID;
        final int i = price;
        final String str2 = title;
        final int i2 = callback;
        final int i3 = self;
        final int i4 = showDialog;
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                ((cocojava) cocojava.mContext).callGetJar(str, i, str2, i2, i3, i4);
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
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

    /* access modifiers changed from: protected */
    public void onPause() {
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

    /* access modifiers changed from: protected */
    public void onResume() {
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

    /* access modifiers changed from: protected */
    public void onRealResume() {
        if (mUSE_TAPJOY) {
            TapjoyConnect.getTapjoyConnectInstance().getTapPoints(this);
        }
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        System.runFinalizersOnExit(true);
        System.exit(0);
    }

    /* access modifiers changed from: package-private */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x00c9, code lost:
        r4 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x00ca, code lost:
        r4.printStackTrace();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x00d9, code lost:
        r3 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x00da, code lost:
        r3.printStackTrace();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:?, code lost:
        return;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x00c9 A[ExcHandler: NameNotFoundException (r4v0 'e1' android.content.pm.PackageManager$NameNotFoundException A[CUSTOM_DECLARE]), Splitter:B:1:0x0024] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void createResources() {
        /*
            r18 = this;
            java.lang.String r14 = "JAVAINFO"
            java.io.File r15 = r18.getFilesDir()
            java.lang.String r15 = r15.getAbsolutePath()
            android.util.Log.i(r14, r15)
            java.io.File r2 = new java.io.File
            java.io.File r14 = r18.getFilesDir()
            java.lang.String r15 = "Contents/Resources"
            r2.<init>(r14, r15)
            java.lang.String r14 = "JAVAINFO"
            java.lang.String r15 = r2.getAbsolutePath()
            android.util.Log.i(r14, r15)
            r2.mkdirs()
            android.content.pm.PackageManager r14 = r18.getPackageManager()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.lang.String r15 = r18.getPackageName()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            r16 = 0
            android.content.pm.ApplicationInfo r0 = r14.getApplicationInfo(r15, r16)     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.lang.String r14 = r0.sourceDir     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            com.miniclip.nativeJNI.CocoJNI.MsetAPKPath(r14)     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.lang.String r14 = "JAVAINFO"
            java.lang.String r15 = r0.sourceDir     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            android.util.Log.i(r14, r15)     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.lang.String r14 = "JAVAINFO"
            java.lang.String r15 = r0.dataDir     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            android.util.Log.i(r14, r15)     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.util.zip.ZipFile r13 = new java.util.zip.ZipFile     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.lang.String r14 = r0.sourceDir     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            r13.<init>(r14)     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.util.Enumeration r5 = r13.entries()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
        L_0x0050:
            boolean r14 = r5.hasMoreElements()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            if (r14 == 0) goto L_0x00cd
            java.lang.Object r6 = r5.nextElement()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.util.zip.ZipEntry r6 = (java.util.zip.ZipEntry) r6     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.lang.String r14 = r6.getName()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            int r14 = r14.length()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            r15 = 15
            if (r14 < r15) goto L_0x0050
            java.lang.String r14 = "assets/unpack/"
            java.lang.String r15 = r6.getName()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            r16 = 0
            r17 = 14
            java.lang.String r15 = r15.substring(r16, r17)     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            boolean r14 = r14.equals(r15)     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            if (r14 == 0) goto L_0x0050
            java.io.File r8 = new java.io.File     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.lang.String r14 = r6.getName()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            r15 = 14
            java.lang.String r14 = r14.substring(r15)     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            r8.<init>(r2, r14)     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.io.File r11 = r8.getParentFile()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            if (r11 == 0) goto L_0x0094
            r11.mkdirs()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
        L_0x0094:
            boolean r14 = r8.exists()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            if (r14 != 0) goto L_0x0050
            java.io.InputStream r12 = r13.getInputStream(r6)     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            java.io.File r9 = new java.io.File     // Catch:{ FileNotFoundException -> 0x00c4, IOException -> 0x00d3, NameNotFoundException -> 0x00c9 }
            java.lang.String r14 = r6.getName()     // Catch:{ FileNotFoundException -> 0x00c4, IOException -> 0x00d3, NameNotFoundException -> 0x00c9 }
            r15 = 14
            java.lang.String r14 = r14.substring(r15)     // Catch:{ FileNotFoundException -> 0x00c4, IOException -> 0x00d3, NameNotFoundException -> 0x00c9 }
            r9.<init>(r2, r14)     // Catch:{ FileNotFoundException -> 0x00c4, IOException -> 0x00d3, NameNotFoundException -> 0x00c9 }
            r9.delete()     // Catch:{ FileNotFoundException -> 0x00c4, IOException -> 0x00d3, NameNotFoundException -> 0x00c9 }
            java.io.FileOutputStream r7 = new java.io.FileOutputStream     // Catch:{ FileNotFoundException -> 0x00c4, IOException -> 0x00d3, NameNotFoundException -> 0x00c9 }
            r7.<init>(r9)     // Catch:{ FileNotFoundException -> 0x00c4, IOException -> 0x00d3, NameNotFoundException -> 0x00c9 }
            r14 = 4096(0x1000, float:5.74E-42)
            byte[] r1 = new byte[r14]     // Catch:{ FileNotFoundException -> 0x00c4, IOException -> 0x00d3, NameNotFoundException -> 0x00c9 }
        L_0x00b9:
            int r10 = r12.read(r1)     // Catch:{ FileNotFoundException -> 0x00c4, IOException -> 0x00d3, NameNotFoundException -> 0x00c9 }
            if (r10 < 0) goto L_0x00ce
            r14 = 0
            r7.write(r1, r14, r10)     // Catch:{ FileNotFoundException -> 0x00c4, IOException -> 0x00d3, NameNotFoundException -> 0x00c9 }
            goto L_0x00b9
        L_0x00c4:
            r3 = move-exception
            r3.printStackTrace()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            goto L_0x0050
        L_0x00c9:
            r4 = move-exception
            r4.printStackTrace()
        L_0x00cd:
            return
        L_0x00ce:
            r7.close()     // Catch:{ FileNotFoundException -> 0x00c4, IOException -> 0x00d3, NameNotFoundException -> 0x00c9 }
            goto L_0x0050
        L_0x00d3:
            r3 = move-exception
            r3.printStackTrace()     // Catch:{ NameNotFoundException -> 0x00c9, IOException -> 0x00d9 }
            goto L_0x0050
        L_0x00d9:
            r3 = move-exception
            r3.printStackTrace()
            goto L_0x00cd
        */
        throw new UnsupportedOperationException("Method not decompiled: com.miniclip.nativeJNI.cocojava.createResources():void");
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
        cocosound cocosound = soundPlayer;
        float f = soundPlayer.mLeftVolume;
        float f2 = soundPlayer.mRightVolume;
        soundPlayer.getClass();
        cocosound.playEffect(soundId, f, f2, 1, loopTime, pitch);
    }

    public static void playEffect(int soundId, int priority, int loopTime, float pitch) {
        soundPlayer.playEffect(soundId, soundPlayer.mLeftVolume, soundPlayer.mRightVolume, priority, loopTime, pitch);
    }

    public static void playEffect(int soundId, float leftGain, float rightGain, int loopTime, float pitch) {
        cocosound cocosound = soundPlayer;
        soundPlayer.getClass();
        cocosound.playEffect(soundId, leftGain, rightGain, 1, loopTime, pitch);
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
        SharedPreferences.Editor editor = ((Activity) mContext).getSharedPreferences("GAME_INFO", 0).edit();
        editor.putInt(key, value);
        editor.commit();
    }

    public static int SharedPreferences_getInt(String key) {
        return ((Activity) mContext).getSharedPreferences("GAME_INFO", 0).getInt(key, 0);
    }

    public static void SharedPreferences_setString(String key, String value) {
        SharedPreferences.Editor editor = ((Activity) mContext).getSharedPreferences("GAME_INFO", 0).edit();
        editor.putString(key, value);
        editor.commit();
    }

    public static String SharedPreferences_getString(String key) {
        return ((Activity) mContext).getSharedPreferences("GAME_INFO", 0).getString(key, "");
    }

    public void showInterstitialAd() {
        interstitial.setListener(this);
        interstitial.showAd();
    }

    public void OnInterstitialLoaded() {
    }

    public void OnInterstitialFailed() {
        Toast.makeText(this, "No ad available", 0).show();
    }

    public static void startFlurrySession(String productId) {
        Log.i("flurry", String.format("startFlurrySession %s", new Object[]{productId}));
        FlurryAgent.onStartSession(mContext, productId);
    }

    private static Map<String, String> convertToMap(String[] keys, String[] values) {
        int len;
        HashMap<String, String> map = null;
        if (!(keys == null || values == null || (len = keys.length) != values.length)) {
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
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
        builder.setMessage("Please enable internet").setCancelable(false).setPositiveButton("Back", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        builder.create().show();
    }

    /* access modifiers changed from: private */
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
            return new JSONObject(jsonString);
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

    public void onClick(View view) {
        if (view == mRemoveAdsButton) {
            callInAppPurchaseManaged("remove_ads", 0, 0);
        }
        if (view == mSkip1) {
            mBigAdView.removeAllViews();
            mBigAdView.setOnClickListener((View.OnClickListener) null);
            mBigAdView.setClickable(false);
            mGLView.queueEvent(new Runnable() {
                public void run() {
                    CocoJNI.MsetGamePause(0);
                }
            });
        } else if (view == mRemove1) {
            mBigAdView.removeAllViews();
            mBigAdView.setOnClickListener((View.OnClickListener) null);
            mBigAdView.setClickable(false);
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(getFullAppURI()));
            mContext.startActivity(intent);
            mGLView.queueEvent(new Runnable() {
                public void run() {
                    CocoJNI.MsetGamePause(0);
                }
            });
        } else if (view == mCenterdAd) {
            mBigAdView.removeAllViews();
            mBigAdView.setOnClickListener((View.OnClickListener) null);
            mBigAdView.setClickable(false);
        }
    }

    public static void flashScreen(int color) {
    }

    static void updateNotificationStatus(final int enabled) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                SharedPreferences.Editor editor = cocojava.mContext.getSharedPreferences(Newsfeed.PREFS_NAME_C2DM, 0).edit();
                editor.putInt("C2DM_ENABLE", enabled);
                editor.commit();
            }
        });
    }

    static int getNotificationStatus() {
        return mContext.getSharedPreferences(Newsfeed.PREFS_NAME_C2DM, 0).getInt("C2DM_ENABLE", 0);
    }

    public boolean isOnline() {
        NetworkInfo ni = ((ConnectivityManager) getSystemService("connectivity")).getActiveNetworkInfo();
        if (ni == null) {
            return false;
        }
        return ni.isConnectedOrConnecting();
    }

    public static void vibrateForMS(int time) {
        ((Vibrator) mContext.getSystemService("vibrator")).vibrate((long) time);
    }

    public static boolean isSDcardPresent() {
        return "mounted".equals("mounted");
    }

    public static float availableMemoryOnDevice() {
        StatFs statFs = new StatFs(mContext.getFilesDir().getAbsolutePath());
        long blockSize = (long) statFs.getBlockSize();
        long blockCount = ((long) statFs.getBlockCount()) * blockSize;
        long availableBlocks = ((long) statFs.getAvailableBlocks()) * blockSize;
        return (float) ((((long) statFs.getFreeBlocks()) * blockSize) / 1048576);
    }

    public static float availableMemoryOnSDcard() {
        StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getAbsolutePath());
        long blockSize = (long) statFs.getBlockSize();
        long blockCount = ((long) statFs.getBlockCount()) * blockSize;
        long availableBlocks = ((long) statFs.getAvailableBlocks()) * blockSize;
        return (float) ((((long) statFs.getFreeBlocks()) * blockSize) / 1048576);
    }

    public static String getExternalStorageDirectory() {
        String path = (Environment.getExternalStorageDirectory().getAbsolutePath() + "/Android/data/" + mContext.getPackageName()) + "/Contents/Resources";
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
        if (context.getSharedPreferences("ADS_DISABLED", 0).getString("disabled", "false").equals("true")) {
            return 1;
        }
        return 0;
    }

    protected static int getAdsDisabled() {
        return getAdsDisabled(mContext);
    }

    protected static void setAdsDisabled(int disabled) {
        SharedPreferences.Editor editor = mContext.getSharedPreferences("ADS_DISABLED", 0).edit();
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
                ((Activity) mContext).runOnUiThread(new Runnable() {
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
                ((Activity) mContext).runOnUiThread(new Runnable() {
                    public void run() {
                        cocojava.mRemoveAdsButtonLayout.removeView(cocojava.mRemoveAdsButton);
                    }
                });
            }
        }
    }

    public void restoreOriginalAspectRatio() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                RelativeLayout.LayoutParams gLLayout = new RelativeLayout.LayoutParams(cocojava.mWidth, cocojava.mHeight);
                gLLayout.addRule(11);
                cocojava.mGLView.setLayoutParams(gLLayout);
            }
        });
        mGLView.queueEvent(new Runnable() {
            public void run() {
                Log.i("INFO", String.format("RES FIX width:%d height:%d", new Object[]{Integer.valueOf(cocojava.mWidth), Integer.valueOf(cocojava.mHeight)}));
                GLES10.glViewport(0, 0, cocojava.mWidth, cocojava.mHeight);
                cocojava.mADS_BLOCKED_NOW = true;
                CocoJNI.MdisplayInfo(cocojava.mWidth, cocojava.mHeight);
                CocoJNI.MnotifyAspectRatioChange();
            }
        });
    }

    public void inAppResponce(int responce, String productId) {
        int responceFinal = responce;
        Log.i("inAppResponce", String.format("id: %s responce: %d", new Object[]{productId, Integer.valueOf(responceFinal)}));
        if (responceFinal == 1) {
            FlurryAgent.logEvent(String.format("InAppSuccess: %s", new Object[]{productId}));
            if (inAppsRemoveAds && getAdsDisabled() == 0) {
                Log.i("callInAppPurchase", "Removing ads due to IAP!");
                permanentlyRemoveAds();
                restoreOriginalAspectRatio();
                return;
            }
            return;
        }
        FlurryAgent.logEvent(String.format("InAppFailed: %s", new Object[]{productId}));
    }

    public static void permanentlyRemoveAds() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                cocojava.layout.removeView(cocojava.mInitView);
            }
        });
    }

    public static void setFPS(float fps) {
        ClearRenderer.animationInterval = (long) ((1.0d / ((double) fps)) * ((double) 1000000000));
    }

    public static int isAppInstalled(String appId) {
        for (ApplicationInfo app : mContext.getPackageManager().getInstalledApplications(8192)) {
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
            ((Activity) mContext).runOnUiThread(new Runnable() {
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
            ((Activity) mContext).runOnUiThread(new Runnable() {
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
            ((Activity) mContext).runOnUiThread(new Runnable() {
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
            ((Activity) mContext).runOnUiThread(new Runnable() {
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

    /* access modifiers changed from: protected */
    public String getUpSellDialogTitle() {
        return "Upgrade to premium?";
    }

    /* access modifiers changed from: protected */
    public String getUpSellDialogMessage() {
        return "Do you want to get the premium version?";
    }

    /* access modifiers changed from: protected */
    public void getUpSellDialogAction() {
        openLink("https://market.android.com/developer?pub=Miniclip.com");
    }

    /* access modifiers changed from: protected */
    public void showUpSellDialogInternal() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                cocojava.mGLView.queueEvent(new Runnable() {
                    public void run() {
                        CocoJNI.MsetGamePause(1);
                    }
                });
                AlertDialog.Builder builder = new AlertDialog.Builder(cocojava.mContext);
                builder.setTitle(((cocojava) cocojava.mContext).getUpSellDialogTitle()).setMessage(((cocojava) cocojava.mContext).getUpSellDialogMessage()).setCancelable(false).setPositiveButton("Later", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                        cocojava.mGLView.queueEvent(new Runnable() {
                            public void run() {
                                CocoJNI.MinterstitialClosed(0);
                                CocoJNI.MsetGamePause(0);
                            }
                        });
                    }
                }).setNegativeButton("Get it now", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                        ((cocojava) cocojava.mContext).getUpSellDialogAction();
                        cocojava.mGLView.queueEvent(new Runnable() {
                            public void run() {
                                CocoJNI.MinterstitialClosed(1);
                                CocoJNI.MsetGamePause(0);
                            }
                        });
                    }
                });
                builder.create().show();
            }
        });
    }

    protected static void showUpSellDialog() {
        ((cocojava) mContext).showUpSellDialogInternal();
    }

    /* access modifiers changed from: protected */
    public String getTapjoyOfferDialogTitle(TapjoyFeaturedAppObject featuredAppObject) {
        return "Do you want to get free stuff?";
    }

    /* access modifiers changed from: protected */
    public String getTapjoyOfferDialogMessage(TapjoyFeaturedAppObject featuredAppObject) {
        return String.format("Download and run this app for free stuff:\n%s", new Object[]{featuredAppObject.name});
    }

    public static void showTJOfferDialog() {
        if (mUSE_ADS && mFeaturedApObject != null && mUSE_TAPJOY) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    cocojava.mGLView.queueEvent(new Runnable() {
                        public void run() {
                            CocoJNI.MsetGamePause(1);
                        }
                    });
                    AlertDialog.Builder builder = new AlertDialog.Builder(cocojava.mContext);
                    builder.setTitle(((cocojava) cocojava.mContext).getTapjoyOfferDialogTitle(cocojava.mFeaturedApObject)).setMessage(((cocojava) cocojava.mContext).getTapjoyOfferDialogMessage(cocojava.mFeaturedApObject)).setCancelable(false).setPositiveButton("Later", new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int id) {
                            dialog.cancel();
                            cocojava.showTapFeatureAd();
                            cocojava.mGLView.queueEvent(new Runnable() {
                                public void run() {
                                    CocoJNI.MinterstitialClosed(0);
                                    CocoJNI.MsetGamePause(0);
                                }
                            });
                        }
                    }).setNegativeButton("Download now", new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int id) {
                            dialog.cancel();
                            cocojava.showTapFeatureAd();
                            cocojava.openLink(cocojava.mFeaturedApObject.redirectURL);
                            cocojava.mGLView.queueEvent(new Runnable() {
                                public void run() {
                                    CocoJNI.MinterstitialClosed(1);
                                    CocoJNI.MsetGamePause(0);
                                }
                            });
                        }
                    });
                    builder.create().show();
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

    public void OnAdLoaded(final MoPubView m) {
        if (mUSE_ADS) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
                @SuppressLint({"NewApi"})
                public void run() {
                    MoPubView adView = cocojava.adViewMenu;
                    if (m.getAdUnitId().compareTo(((cocojava) cocojava.mContext).getMoPubGameplayBannerId()) == 0) {
                        adView = cocojava.adViewGame;
                    }
                    if (Build.VERSION.SDK_INT > 10) {
                        adView.setLayerType(1, (Paint) null);
                    }
                    if (adView != null && m == adView && adView.getVisibility() == 0) {
                        Animation anim = new ScaleAnimation(BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 1.0f, 160.0f * cocojava.mDensity, BitmapDescriptorFactory.HUE_RED);
                        anim.setDuration(500);
                        adView.setVisibility(1);
                        adView.startAnimation(anim);
                    }
                }
            });
            mGLView.queueEvent(new Runnable() {
                public void run() {
                    CocoJNI.MsetAdLoadFailed(0);
                }
            });
        }
    }

    public void OnAdFailed(MoPubView m) {
        if (mUSE_ADS) {
            Log.i("OnAdFailed", "Failed to load the ad");
            mGLView.queueEvent(new Runnable() {
                public void run() {
                    CocoJNI.MsetAdLoadFailed(1);
                }
            });
        }
    }

    public void OnAdClicked(MoPubView m) {
        if (mUSE_ADS) {
            Log.i("OnAdClicked", "Ad Clicked");
            mGLView.queueEvent(new Runnable() {
                public void run() {
                    CocoJNI.MadClicked();
                }
            });
        }
    }

    public static void showInterstitialBanner() {
        if (mUSE_ADS_INTERSTITIAL_BANNER) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    cocojava.mInterstitialBanner.showAd();
                }
            });
        }
    }

    public void onInterstitialMopubViewExit() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                if (cocojava.adLayout.getParent() != cocojava.adLayoutH) {
                    cocojava.adLayoutH.addView(cocojava.adLayout);
                }
                cocojava.mGLView.queueEvent(new Runnable() {
                    public void run() {
                        CocoJNI.MsetGamePause(0);
                    }
                });
            }
        });
    }

    /* access modifiers changed from: protected */
    public void callRemoveAds() {
    }

    public void fixScreen() {
        Runnable fixScreenRunnable = new Runnable() {
            public void run() {
                Log.i("cocojava", "fixScreen");
                cocojava.layout.requestLayout();
            }
        };
        this.mScreenFixHandler.removeCallbacks(fixScreenRunnable);
        this.mScreenFixHandler.postDelayed(fixScreenRunnable, 1000);
    }

    public static int faceBook_isSessionValid() {
        if (mUSE_FACEBOOK && mFB_Session.isOpened()) {
            return 1;
        }
        return 0;
    }

    public static String faceBook_getAccessToken() {
        if (!mUSE_FACEBOOK) {
            return "";
        }
        return mFB_Session.getAccessToken();
    }

    public static void faceBook_logout() {
        if (mUSE_FACEBOOK) {
            mFB_Session.closeAndClearTokenInformation();
            Session.setActiveSession((Session) null);
        }
    }

    public static void faceBook_authorize(String permissions) {
        faceBook_authorizeAndRun(permissions, new Runnable() {
            public void run() {
            }
        });
    }

    public static void faceBook_authorizeAndRun(String permissions, final Runnable runAfterLogin) {
        if (mUSE_FACEBOOK) {
            mFB_AuthenticationRequested = true;
            mFB_Session = new Session(mContext);
            mPrefs = ((Activity) mContext).getPreferences(0);
            String access_token = mPrefs.getString("access_token", (String) null);
            if (access_token == null) {
                final String[] permissionsArray = permissions.split(",");
                ((Activity) mContext).runOnUiThread(new Runnable() {
                    public void run() {
                        Session.OpenRequest openRequest;
                        if (cocojava.mFB_Session != null && !cocojava.mFB_Session.isOpened() && (openRequest = new Session.OpenRequest((Activity) cocojava.mContext).setCallback((Session.StatusCallback) new Session.StatusCallback() {
                            public void call(Session session, SessionState state, Exception exception) {
                                if (cocojava.mFB_AuthenticationRequested && state.isOpened()) {
                                    cocojava.mGLView.queueEvent(new Runnable() {
                                        public void run() {
                                            boolean unused = cocojava.mFB_AuthenticationRequested = false;
                                            CocoJNI.MfacebookLoginComplete();
                                        }
                                    });
                                    cocojava.mFacebookHandler.postDelayed(runAfterLogin, 500);
                                }
                            }
                        })) != null) {
                            openRequest.setDefaultAudience(SessionDefaultAudience.FRIENDS);
                            openRequest.setPermissions(Arrays.asList(permissionsArray));
                            openRequest.setLoginBehavior(SessionLoginBehavior.SSO_WITH_FALLBACK);
                            cocojava.mFB_Session.openForRead(openRequest);
                            Session.setActiveSession(cocojava.mFB_Session);
                        }
                    }
                });
                return;
            }
            SharedPreferences.Editor editor = mPrefs.edit();
            editor.putString("access_token", (String) null);
            editor.commit();
            final AccessToken accessToken = AccessToken.createFromExistingAccessToken(access_token, (Date) null, (Date) null, (AccessTokenSource) null, (List<String>) null);
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    cocojava.mFB_Session.open(accessToken, (Session.StatusCallback) new Session.StatusCallback() {
                        public void call(Session session, SessionState state, Exception exception) {
                        }
                    });
                    Session.setActiveSession(cocojava.mFB_Session);
                    cocojava.mFacebookHandler.postDelayed(runAfterLogin, 500);
                }
            });
        }
    }

    public static void faceBook_reauthorizeWithPublishPermissions(String permissions) {
        if (mUSE_FACEBOOK) {
            final String[] permissionsArray = permissions.split(",");
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    if (cocojava.mFB_Session != null && cocojava.mFB_Session.getState().isOpened()) {
                        cocojava.mFB_Session.requestNewPublishPermissions(new Session.NewPermissionsRequest((Activity) cocojava.mContext, (List<String>) Arrays.asList(permissionsArray)));
                    }
                }
            });
        }
    }

    public static void faceBook_request(String graphPath, int object) {
        faceBook_request(graphPath, "", object);
    }

    public static void faceBook_request(final String graphPath, final String paramsStr, final int object) {
        if (mUSE_FACEBOOK) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    Bundle params = new Bundle();
                    String[] paramsArray = paramsStr.split("#");
                    for (int i = 0; i < paramsArray.length - 1; i += 2) {
                        params.putString(paramsArray[i], paramsArray[i + 1]);
                    }
                    new RequestAsyncTask(new Request(cocojava.mFB_Session, graphPath, params, HttpMethod.GET, new Request.Callback() {
                        public void onCompleted(Response response) {
                            final String data = response.getGraphObject().getInnerJSONObject().toString();
                            Log.i("Facebook:", data);
                            cocojava.mGLView.queueEvent(new Runnable() {
                                public void run() {
                                    CocoJNI.MfacebookRequestComplete(object, data.getBytes().length, data.getBytes());
                                }
                            });
                        }
                    })).execute(new Void[0]);
                }
            });
        }
    }

    public static int faceBook_hasPermission(String permission) {
        if (mUSE_FACEBOOK && mFB_Session.getPermissions().contains(permission)) {
            return 1;
        }
        return 0;
    }

    public static void faceBook_dialogWithLogin(final String action, final String params) {
        faceBook_authorizeAndRun("email,user_birthday", new Runnable() {
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
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    ((WebDialog.Builder) new WebDialog.Builder((Context) (Activity) cocojava.mContext, cocojava.mFB_Session, action, parBundle).setOnCompleteListener(new WebDialog.OnCompleteListener() {
                        public void onComplete(Bundle values, FacebookException error) {
                            boolean posted;
                            if (error == null) {
                                if (values.getString("request") == null && values.getString("post_id") == null) {
                                    posted = false;
                                } else {
                                    posted = true;
                                }
                            } else if (error instanceof FacebookOperationCanceledException) {
                                posted = false;
                            } else {
                                posted = false;
                            }
                            if (posted) {
                                cocojava.mGLView.queueEvent(new Runnable() {
                                    public void run() {
                                        CocoJNI.MfacebookShareComplete();
                                    }
                                });
                            } else {
                                cocojava.mGLView.queueEvent(new Runnable() {
                                    public void run() {
                                        CocoJNI.MfacebookShareCanceled();
                                    }
                                });
                            }
                        }
                    })).build().show();
                }
            });
        }
    }

    public static void showHtmlDialog(final String htmlContent, final int _path) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                new HtmlDialog(cocojava.mContext, htmlContent, _path, new Facebook.DialogListener() {
                    public void onComplete(Bundle values) {
                    }

                    public void onFacebookError(FacebookError error) {
                    }

                    public void onError(DialogError e) {
                    }

                    public void onCancel() {
                    }
                }).show();
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
        try {
            PackageInfo pi = mContext.getPackageManager().getPackageInfo(mContext.getPackageName(), 0);
            if (pi == null) {
                return "";
            }
            String app_version_name = pi.versionName;
            String app_version_code = String.valueOf(pi.versionCode);
            return app_version_name;
        } catch (PackageManager.NameNotFoundException e) {
            return "";
        }
    }

    public static int getAppVersionCode() {
        try {
            PackageInfo pi = mContext.getPackageManager().getPackageInfo(mContext.getPackageName(), 0);
            if (pi != null) {
                return pi.versionCode;
            }
            return 0;
        } catch (PackageManager.NameNotFoundException e) {
            return 0;
        }
    }

    public static int getPendingPurchaseSignatureAmount() {
        SharedPreferences settingsT = mContext.getSharedPreferences("INAPP_PURCHASED_TEMP_SIGNATURE", 0);
        int amountT = settingsT.getInt("amount", 0);
        Log.i("cocojava", String.format("getPendingPurchaseSignatureAmount: %d", new Object[]{Integer.valueOf(amountT)}));
        if (amountT < 0) {
            return 0;
        }
        if (!settingsT.contains("pid" + String.valueOf(amountT - 1))) {
            return 0;
        }
        return amountT;
    }

    public static int callLastPendingPurchaseSignature(final int function) {
        SharedPreferences settingsT = mContext.getSharedPreferences("INAPP_PURCHASED_TEMP_SIGNATURE", 0);
        int amountT = settingsT.getInt("amount", 0) - 1;
        if (amountT < 0) {
            return 0;
        }
        if (!settingsT.contains("pid" + String.valueOf(amountT))) {
            return 0;
        }
        final String pid = settingsT.getString("pid" + String.valueOf(amountT), "");
        final String data = settingsT.getString("data" + String.valueOf(amountT), "");
        final String sig = settingsT.getString("sig" + String.valueOf(amountT), "");
        mGLView.queueEvent(new Runnable() {
            public void run() {
                CocoJNI.MsetInAppResponce(1, function, 0, pid, data, sig);
            }
        });
        Log.i("cocojava", String.format("callLastPendingPurchaseSignature: %d pid: %s data: %s sig: %s", new Object[]{Integer.valueOf(amountT), pid, data, sig}));
        return amountT;
    }

    public static int removeLastPendingPurchaseSignature() {
        SharedPreferences settingsT = mContext.getSharedPreferences("INAPP_PURCHASED_TEMP_SIGNATURE", 0);
        int amountT = settingsT.getInt("amount", 0) - 1;
        if (amountT < 0 || !settingsT.contains("pid" + String.valueOf(amountT))) {
            return 0;
        }
        SharedPreferences.Editor editorT = settingsT.edit();
        editorT.remove("pid" + String.valueOf(amountT));
        editorT.remove("data" + String.valueOf(amountT));
        editorT.remove("sig" + String.valueOf(amountT));
        editorT.putInt("amount", amountT);
        editorT.commit();
        Log.i("cocojava", String.format("removePendingPurchaseSignature: %d", new Object[]{Integer.valueOf(amountT)}));
        return 1;
    }

    public static int getPendingPurchaseAmount(String key) {
        int amount = mContext.getSharedPreferences("INAPP_PURCHASED_TEMP", 0).getInt(key, 0);
        Log.i("cocojava", String.format("getPendingPurchaseAmount: %s, %d", new Object[]{key, Integer.valueOf(amount)}));
        return amount;
    }

    public static void setPendingPurchaseAmount(String key, int amount) {
        SharedPreferences.Editor editor = mContext.getSharedPreferences("INAPP_PURCHASED_TEMP", 0).edit();
        editor.putInt(key, amount);
        editor.commit();
    }

    public static void sendEmail(String destination, String subject, String text) {
        final String dest = destination;
        final String subj = subject;
        final String txt = text;
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                Intent intent = new Intent("android.intent.action.SEND");
                intent.setType("text/plain");
                if (dest != null) {
                    intent.putExtra("android.intent.extra.EMAIL", new String[]{dest});
                }
                if (subj != null) {
                    intent.putExtra("android.intent.extra.SUBJECT", subj);
                }
                if (txt != null) {
                    intent.putExtra("android.intent.extra.TEXT", txt);
                }
                cocojava.mContext.startActivity(Intent.createChooser(intent, "Send email..."));
            }
        });
    }

    public static void sendSMS(String text) {
        final String txt = text;
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                Intent sendIntent = new Intent("android.intent.action.VIEW");
                if (txt != null) {
                    sendIntent.putExtra("sms_body", txt);
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
        return SharedPreferences_getInt("FULL_VERSION");
    }

    public static void sendGoogleEvent(String string, int value) {
        if (string.split("/").length >= 3) {
            ((Activity) mContext).runOnUiThread(new Runnable() {
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
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
        mGLView.queueEvent(new Runnable() {
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
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
        mGLView.queueEvent(new Runnable() {
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
            ((Activity) mContext).runOnUiThread(new Runnable() {
                public void run() {
                    cocojava.mCurrentNewsfeed.mIsVisible = false;
                    cocojava.layout.removeView(cocojava.mCurrentNewsfeedDialog);
                    cocojava.mCurrentNewsfeedDialog = null;
                }
            });
            mGLView.queueEvent(new Runnable() {
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
            ((Activity) mContext).runOnUiThread(new Runnable() {
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                cocojava.mEditText.setText(text);
                cocojava.mEditText.setVisibility(0);
                ((InputMethodManager) cocojava.mContext.getSystemService("input_method")).toggleSoftInput(2, 2);
                cocojava.mEditText.setSelection(cocojava.mEditText.getText().length());
            }
        });
    }

    public static void setCaretPosition(final int position) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                cocojava.mEditText.setSelection(position);
                Log.i("KeyboardInput", String.format("setCaretPosition position: %d", new Object[]{Integer.valueOf(position)}));
            }
        });
    }

    public static int getCaretPosition() {
        int position = mEditText.getSelectionStart();
        Log.i("KeyboardInput", String.format("getCaretPosition position: %d", new Object[]{Integer.valueOf(position)}));
        return position;
    }

    public static void keyboardInput_Show_withMaxLengthLocked(final String text, final int maxLength) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                cocojava.mEditText.setText(text);
                cocojava.mEditText.setVisibility(0);
                cocojava.mEditText.setFilters(new InputFilter[]{new InputFilter.LengthFilter(maxLength)});
                ((InputMethodManager) cocojava.mContext.getSystemService("input_method")).toggleSoftInput(2, 2);
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
                BufferedReader myReader = new BufferedReader(new InputStreamReader(new FileInputStream(new File("/sdcard/miniclipId.txt"))));
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
            String deviceId2 = String.valueOf(new Date().getTime());
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
                myOutWriter.append(deviceId);
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                ((ClipboardManager) cocojava.mContext.getSystemService("clipboard")).setText(text);
            }
        });
    }

    public static void setKeyboardInputPosition(float x, float y, float width, float height, float anchorX, float anchorY) {
        final float f = height;
        final float f2 = width;
        final float f3 = x;
        final float f4 = anchorX;
        final float f5 = y;
        final float f6 = anchorY;
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                float newHeight = f;
                if (f == BitmapDescriptorFactory.HUE_RED) {
                    newHeight = (float) cocojava.mEditText.getHeight();
                }
                RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams((int) f2, (int) newHeight);
                params.leftMargin = (int) (f3 - (f2 * f4));
                params.topMargin = (int) (f5 - (f6 * newHeight));
                Log.i("setKeyboardInputPosition", String.format("newHeight: %f, anchorY: %f", new Object[]{Float.valueOf(newHeight), Float.valueOf(f6)}));
            }
        });
    }

    public static void setKeyboardInputStyle(final int background, final int text, final float size) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                cocojava.mEditText.setBackgroundColor(background);
                cocojava.mEditText.setTextColor(text);
                cocojava.mEditText.setTextSize(size);
            }
        });
    }

    public static void setKeyboardInputVisible(final int visible) {
        Log.i("setKeyboardInputVisible", String.format("visible: %d", new Object[]{Integer.valueOf(visible)}));
        ((Activity) mContext).runOnUiThread(new Runnable() {
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
        mKeyboardHandler.postDelayed(new Runnable() {
            public void run() {
                cocojava.setKeyboardInputVisible(visible);
            }
        }, (long) millisecs);
    }

    public static void setKeyboardInputText(final String text) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                cocojava.mEditText.setText(text);
            }
        });
    }

    public static void keyboardInput_Hide() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                ((InputMethodManager) cocojava.mContext.getSystemService("input_method")).hideSoftInputFromWindow(cocojava.mEditText.getWindowToken(), 0);
            }
        });
    }

    public static void setKeyboardInputSingleLine(final int singleLine) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
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
        Log.i("cocojava", String.format("setKeyboardInputTypePassword: %d", new Object[]{Integer.valueOf(password)}));
        ((Activity) mContext).runOnUiThread(new Runnable() {
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
        Log.i("cocojava", String.format("setKeyboardInputMaxLength: %d", new Object[]{Integer.valueOf(maxLength)}));
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                cocojava.mEditText.setFilters(new InputFilter[]{new InputFilter.LengthFilter(maxLength)});
            }
        });
    }

    public static void custom_updateScore(final String leaderboardId, final int scoreValue, final Object userData) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).updateScoreCustom(leaderboardId, (long) scoreValue, userData);
                }
            }
        });
    }

    public static void custom_updateScore(String leaderboardId, int scoreValue) {
        custom_updateScore(leaderboardId, scoreValue, (Object) null);
    }

    public static void custom_showLeaderboard(final String leaderboardId) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).showLeaderboardCustom(leaderboardId);
                }
            }
        });
    }

    public static void custom_showLeaderboards() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).showLeaderboardsCustom();
                }
            }
        });
    }

    public static void custom_updateAchievement(final String achievementId, final float progressValue, final Object userData) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).updateAchievementCustom(achievementId, progressValue, userData);
                }
            }
        });
    }

    public static void custom_updateAchievement(String achievementId, float progressValue) {
        custom_updateAchievement(achievementId, progressValue, (Object) null);
    }

    public static void custom_showAchievements() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
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
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                if (cocojava.mCustomLeaderboard) {
                    ((cocojava) cocojava.mContext).googlePlayServicesLoginCustom();
                }
            }
        });
    }

    public static void logout_GooglePlayServices() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
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
        try {
            InputStream in = ((Activity) mContext).getAssets().open(filename);
            FileOutputStream fileOutputStream = new FileOutputStream("/sdcard/" + filename);
            try {
                copyFile(in, fileOutputStream);
                in.close();
                fileOutputStream.flush();
                fileOutputStream.close();
            } catch (Exception e) {
                e = e;
                FileOutputStream fileOutputStream2 = fileOutputStream;
                Log.e("tag", e.getMessage());
            }
        } catch (Exception e2) {
            e = e2;
            Log.e("tag", e.getMessage());
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
        DatePickerDialog dialog = new DatePickerDialog(mContext, new DatePickerDialog.OnDateSetListener() {
            public void onDateSet(DatePicker view, final int year, final int month, final int day) {
                cocojava.mGLView.queueEvent(new Runnable() {
                    public void run() {
                        CocoJNI.MdatePickerResponce(year, month + 1, day);
                        CocoJNI.MdatePickerClosed();
                    }
                });
            }
        }, year, month - 1, day);
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
            public void onDismiss(DialogInterface dialog) {
                cocojava.mGLView.queueEvent(new Runnable() {
                    public void run() {
                        CocoJNI.MdatePickerClosed();
                    }
                });
            }
        });
        dialog.show();
    }

    public static void showDatePickerDialog_JNI(final int year, final int month, final int day) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                ((cocojava) cocojava.mContext).showDatePickerDialog(year, month, day);
            }
        });
    }

    public static int getNumCores() {
        try {
            return new File("/sys/devices/system/cpu/").listFiles(new FileFilter() {
                public boolean accept(File pathname) {
                    if (Pattern.matches("cpu[0-9]", pathname.getName())) {
                        return true;
                    }
                    return false;
                }
            }).length;
        } catch (Exception e) {
            return 1;
        }
    }

    /* access modifiers changed from: protected */
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
        ActivityManager.MemoryInfo mi = new ActivityManager.MemoryInfo();
        ((ActivityManager) ((Activity) mContext).getSystemService("activity")).getMemoryInfo(mi);
        Log.i("memory free", "" + mi.availMem);
        return mi.availMem;
    }

    public static int getTotalRAM() {
        try {
            BufferedReader localBufferedReader = new BufferedReader(new FileReader("/proc/meminfo"), 8192);
            long initial_memory = (long) (Integer.valueOf(localBufferedReader.readLine().split("\\s+")[1]).intValue() * 1024);
            localBufferedReader.close();
            Log.i("cocojava - RAM", "" + initial_memory);
            return (int) initial_memory;
        } catch (IOException e) {
            return -1;
        }
    }
}
