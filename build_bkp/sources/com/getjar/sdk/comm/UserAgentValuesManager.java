package com.getjar.sdk.comm;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Handler;
import android.webkit.WebView;
import com.getjar.sdk.comm.auth.AuthMetadataUtility;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.BuildVersion;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.ManualResetEvent;
import com.getjar.sdk.utilities.OverridesUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.util.Locale;

public class UserAgentValuesManager {
    private static volatile UserAgentValuesManager _Instance = null;
    private static final String _PrefsKeyUserAgent = "UserAgent";
    private volatile String _sdkUserAgent = null;
    private Object _sdkUserAgentLock = new Object();
    /* access modifiers changed from: private */
    public ManualResetEvent _uiWorkEvent = new ManualResetEvent(false);
    /* access modifiers changed from: private */
    public volatile String _webKitUserAgent = null;
    private Object _webKitUserAgentLock = new Object();

    private UserAgentValuesManager() {
    }

    private static synchronized void makeTheInstance() {
        synchronized (UserAgentValuesManager.class) {
            if (_Instance == null) {
                _Instance = new UserAgentValuesManager();
            }
        }
    }

    public static UserAgentValuesManager getInstance() {
        if (_Instance == null) {
            makeTheInstance();
        }
        return _Instance;
    }

    public String getSdkUserAgent(Context context, String applicationKey) {
        if (StringUtility.isNullOrEmpty(this._sdkUserAgent)) {
            synchronized (this._sdkUserAgentLock) {
                if (StringUtility.isNullOrEmpty(this._sdkUserAgent)) {
                    StringBuilder uaBuffer = new StringBuilder();
                    uaBuffer.append(Constants.USER_AGENT_APP);
                    uaBuffer.append("/");
                    uaBuffer.append(BuildVersion.BUILD_VERSION);
                    uaBuffer.append(" (");
                    uaBuffer.append(AuthMetadataUtility.SDK_LEVEL);
                    uaBuffer.append(") ");
                    try {
                        PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getApplicationContext().getPackageName(), 0);
                        uaBuffer.append(packageInfo.packageName).append("/").append(packageInfo.versionCode);
                    } catch (Exception e) {
                        uaBuffer.append(Constants.USER_AGENT_UNKOWN_APP);
                    }
                    uaBuffer.append(" ").append("android").append("/").append(Build.VERSION.RELEASE).append(" (").append(Build.BRAND).append("; ").append(Build.PRODUCT).append("; ").append(Build.MODEL).append(")");
                    this._sdkUserAgent = uaBuffer.toString();
                    Logger.m644i(Area.COMM.value(), String.format(Locale.US, "SDK User Agent value: '%1$s'", new Object[]{this._sdkUserAgent}));
                }
            }
        }
        return this._sdkUserAgent;
    }

    public String getWebKitUserAgent(Context context) {
        String str;
        String overrideUserAgent;
        Logger.m646v(Area.COMM.value(), "UserAgentValuesManager: getWebKitUserAgent() START");
        try {
            if (StringUtility.isNullOrEmpty(this._webKitUserAgent)) {
                synchronized (this._webKitUserAgentLock) {
                    if (StringUtility.isNullOrEmpty(this._webKitUserAgent)) {
                        Logger.m646v(Area.COMM.value(), "UserAgentValuesManager: getWebKitUserAgent() checking overrides");
                        OverridesUtility.initialize(context);
                        overrideUserAgent = OverridesUtility.getValue("webkit.user.agent");
                        if (!StringUtility.isNullOrEmpty(overrideUserAgent)) {
                            Logger.m646v(Area.COMM.value(), String.format(Locale.US, "[*** OVERRIDE ***] Override value being used: 'webkit.user.agent' = '%1$s'", new Object[]{overrideUserAgent}));
                        } else {
                            Logger.m646v(Area.COMM.value(), "UserAgentValuesManager: getWebKitUserAgent() checking shared prefs");
                            final SharedPreferences prefs = context.getSharedPreferences("GetJarClientPrefs", 0);
                            if (prefs.contains(_PrefsKeyUserAgent)) {
                                this._webKitUserAgent = prefs.getString(_PrefsKeyUserAgent, "");
                            }
                            if (StringUtility.isNullOrEmpty(this._webKitUserAgent)) {
                                Logger.m646v(Area.COMM.value(), "UserAgentValuesManager: getWebKitUserAgent() creating WebView instance");
                                if (!Utility.isCurrentThreadTheUIThread()) {
                                    Logger.m646v(Area.COMM.value(), "UserAgentValuesManager: getWebKitUserAgent() sending work to the UI thread");
                                    final Context xThreadContext = context;
                                    this._uiWorkEvent.close();
                                    new Handler(context.getMainLooper()).post(new Runnable() {
                                        public void run() {
                                            String str;
                                            Logger.m646v(Area.COMM.value(), "UserAgentValuesManager: getWebKitUserAgent() work starting on UI thread");
                                            try {
                                                String unused = UserAgentValuesManager.this._webKitUserAgent = UserAgentValuesManager.this.getWebKitUserAgentInternal(xThreadContext);
                                                if (!StringUtility.isNullOrEmpty(UserAgentValuesManager.this._webKitUserAgent)) {
                                                    prefs.edit().putString(UserAgentValuesManager._PrefsKeyUserAgent, UserAgentValuesManager.this._webKitUserAgent).commit();
                                                }
                                            } catch (Exception e) {
                                                Logger.m643e(Area.COMM.value(), "UserAgentValuesManager: getWebKitUserAgent() failed", e);
                                            } finally {
                                                str = "UserAgentValuesManager: getWebKitUserAgent() work finished on UI thread";
                                                Logger.m646v(Area.COMM.value(), str);
                                                UserAgentValuesManager.this._uiWorkEvent.open();
                                            }
                                        }
                                    });
                                    try {
                                        Logger.m646v(Area.COMM.value(), "UserAgentValuesManager: getWebKitUserAgent() waiting for UI thread work");
                                        this._uiWorkEvent.waitForOpen(250);
                                        if (StringUtility.isNullOrEmpty(this._webKitUserAgent)) {
                                            Logger.m646v(Area.COMM.value(), "UserAgentValuesManager: getWebKitUserAgent() failed to get value from UI thread work, returning empty string");
                                            overrideUserAgent = "";
                                            Logger.m646v(Area.COMM.value(), "UserAgentValuesManager: getWebKitUserAgent() FINISHED");
                                        }
                                    } catch (InterruptedException e) {
                                        throw new CommunicationException((Throwable) e);
                                    }
                                } else {
                                    this._webKitUserAgent = getWebKitUserAgentInternal(context);
                                }
                                if (!StringUtility.isNullOrEmpty(this._webKitUserAgent)) {
                                    prefs.edit().putString(_PrefsKeyUserAgent, this._webKitUserAgent).commit();
                                }
                            }
                            Logger.m644i(Area.COMM.value(), String.format(Locale.US, "WebKit User Agent value: '%1$s'", new Object[]{this._webKitUserAgent}));
                        }
                    }
                }
                return overrideUserAgent;
            }
            overrideUserAgent = this._webKitUserAgent;
            Logger.m646v(Area.COMM.value(), "UserAgentValuesManager: getWebKitUserAgent() FINISHED");
            return overrideUserAgent;
        } finally {
            str = "UserAgentValuesManager: getWebKitUserAgent() FINISHED";
            Logger.m646v(Area.COMM.value(), str);
        }
    }

    /* access modifiers changed from: private */
    public String getWebKitUserAgentInternal(Context context) {
        if (context != null) {
            return new WebView(context).getSettings().getUserAgentString();
        }
        throw new IllegalArgumentException("Must have a valid context.");
    }
}
