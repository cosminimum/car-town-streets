.class public Lcom/getjar/sdk/comm/UserAgentValuesManager;
.super Ljava/lang/Object;
.source "UserAgentValuesManager.java"


# static fields
.field private static volatile _Instance:Lcom/getjar/sdk/comm/UserAgentValuesManager; = null

.field private static final _PrefsKeyUserAgent:Ljava/lang/String; = "UserAgent"


# instance fields
.field private volatile _sdkUserAgent:Ljava/lang/String;

.field private _sdkUserAgentLock:Ljava/lang/Object;

.field private _uiWorkEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

.field private volatile _webKitUserAgent:Ljava/lang/String;

.field private _webKitUserAgentLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_Instance:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object v1, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_sdkUserAgent:Ljava/lang/String;

    .line 42
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_sdkUserAgentLock:Ljava/lang/Object;

    .line 43
    iput-object v1, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    .line 44
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgentLock:Ljava/lang/Object;

    .line 45
    new-instance v0, Lcom/getjar/sdk/utilities/ManualResetEvent;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/ManualResetEvent;-><init>(Z)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_uiWorkEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    .line 30
    return-void
.end method

.method static synthetic access$000(Lcom/getjar/sdk/comm/UserAgentValuesManager;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/UserAgentValuesManager;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$002(Lcom/getjar/sdk/comm/UserAgentValuesManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/UserAgentValuesManager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/getjar/sdk/comm/UserAgentValuesManager;Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/UserAgentValuesManager;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getWebKitUserAgentInternal(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/getjar/sdk/comm/UserAgentValuesManager;)Lcom/getjar/sdk/utilities/ManualResetEvent;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/UserAgentValuesManager;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_uiWorkEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    return-object v0
.end method

.method public static getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_Instance:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->makeTheInstance()V

    .line 38
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_Instance:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    return-object v0
.end method

.method private getWebKitUserAgentInternal(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 211
    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Must have a valid context."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 212
    :cond_0
    new-instance v1, Landroid/webkit/WebView;

    invoke-direct {v1, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 213
    .local v1, "webView":Landroid/webkit/WebView;
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 214
    .local v0, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static declared-synchronized makeTheInstance()V
    .locals 2

    .prologue
    .line 33
    const-class v1, Lcom/getjar/sdk/comm/UserAgentValuesManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_Instance:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/getjar/sdk/comm/UserAgentValuesManager;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/UserAgentValuesManager;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_Instance:Lcom/getjar/sdk/comm/UserAgentValuesManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    :cond_0
    monitor-exit v1

    return-void

    .line 33
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public getSdkUserAgent(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "applicationKey"    # Ljava/lang/String;

    .prologue
    .line 51
    iget-object v3, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_sdkUserAgent:Ljava/lang/String;

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 52
    iget-object v4, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_sdkUserAgentLock:Ljava/lang/Object;

    monitor-enter v4

    .line 53
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_sdkUserAgent:Ljava/lang/String;

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 56
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .local v2, "uaBuffer":Ljava/lang/StringBuilder;
    const-string v3, "GetJarSDK"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    const-string v3, "20130814.07"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    const-string v3, "10"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    const-string v3, ") "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 67
    .local v1, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v3, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "/"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v5, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    .end local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    :try_start_2
    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "android"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "/"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v5, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " ("

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v5, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "; "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v5, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "; "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ")"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_sdkUserAgent:Ljava/lang/String;

    .line 90
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "SDK User Agent value: \'%1$s\'"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_sdkUserAgent:Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-static {v3, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 92
    .end local v2    # "uaBuffer":Ljava/lang/StringBuilder;
    :cond_0
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 94
    :cond_1
    iget-object v3, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_sdkUserAgent:Ljava/lang/String;

    return-object v3

    .line 71
    .restart local v2    # "uaBuffer":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v0

    .line 72
    .local v0, "e":Ljava/lang/Exception;
    :try_start_3
    const-string v3, "unknown/0000"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 92
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "uaBuffer":Ljava/lang/StringBuilder;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3
.end method

.method public getWebKitUserAgent(Landroid/content/Context;)Ljava/lang/String;
    .locals 12
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 104
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "UserAgentValuesManager: getWebKitUserAgent() START"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 108
    :try_start_0
    iget-object v4, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 109
    iget-object v5, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgentLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 110
    :try_start_1
    iget-object v4, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 113
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v4, "UserAgentValuesManager: getWebKitUserAgent() checking overrides"

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 114
    invoke-static {p1}, Lcom/getjar/sdk/utilities/OverridesUtility;->initialize(Landroid/content/Context;)V

    .line 115
    const-string v4, "webkit.user.agent"

    invoke-static {v4}, Lcom/getjar/sdk/utilities/OverridesUtility;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, "overrideUserAgent":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 117
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "[*** OVERRIDE ***] Override value being used: \'webkit.user.agent\' = \'%1$s\'"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    invoke-static {v4, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 118
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 202
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "UserAgentValuesManager: getWebKitUserAgent() FINISHED"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .end local v1    # "overrideUserAgent":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 122
    .restart local v1    # "overrideUserAgent":Ljava/lang/String;
    :cond_0
    :try_start_2
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v4, "UserAgentValuesManager: getWebKitUserAgent() checking shared prefs"

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 123
    const-string v4, "GetJarClientPrefs"

    const/4 v6, 0x0

    invoke-virtual {p1, v4, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 124
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const-string v4, "UserAgent"

    invoke-interface {v2, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 125
    const-string v4, "UserAgent"

    const-string v6, ""

    invoke-interface {v2, v4, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    .line 129
    :cond_1
    iget-object v4, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 130
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v4, "UserAgentValuesManager: getWebKitUserAgent() creating WebView instance"

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 133
    invoke-static {}, Lcom/getjar/sdk/utilities/Utility;->isCurrentThreadTheUIThread()Z

    move-result v4

    if-nez v4, :cond_2

    .line 134
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v4, "UserAgentValuesManager: getWebKitUserAgent() sending work to the UI thread"

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 135
    move-object v3, p1

    .line 138
    .local v3, "xThreadContext":Landroid/content/Context;
    iget-object v4, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_uiWorkEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/ManualResetEvent;->close()V

    .line 139
    new-instance v4, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v4, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v6, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;

    invoke-direct {v6, p0, v3, v2}, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;-><init>(Lcom/getjar/sdk/comm/UserAgentValuesManager;Landroid/content/Context;Landroid/content/SharedPreferences;)V

    invoke-virtual {v4, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 168
    :try_start_3
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v4, "UserAgentValuesManager: getWebKitUserAgent() waiting for UI thread work"

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 169
    iget-object v4, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_uiWorkEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    const-wide/16 v6, 0xfa

    invoke-virtual {v4, v6, v7}, Lcom/getjar/sdk/utilities/ManualResetEvent;->waitForOpen(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 175
    :try_start_4
    iget-object v4, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 176
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v4, "UserAgentValuesManager: getWebKitUserAgent() failed to get value from UI thread work, returning empty string"

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 177
    const-string v1, ""

    .end local v1    # "overrideUserAgent":Ljava/lang/String;
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 202
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "UserAgentValuesManager: getWebKitUserAgent() FINISHED"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 170
    .restart local v1    # "overrideUserAgent":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 171
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_5
    new-instance v4, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v4, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 195
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v1    # "overrideUserAgent":Ljava/lang/String;
    .end local v2    # "prefs":Landroid/content/SharedPreferences;
    .end local v3    # "xThreadContext":Landroid/content/Context;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 202
    :catchall_1
    move-exception v4

    sget-object v5, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "UserAgentValuesManager: getWebKitUserAgent() FINISHED"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v4

    .line 183
    .restart local v1    # "overrideUserAgent":Ljava/lang/String;
    .restart local v2    # "prefs":Landroid/content/SharedPreferences;
    :cond_2
    :try_start_7
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getWebKitUserAgentInternal(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    .line 187
    :cond_3
    iget-object v4, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 188
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v6, "UserAgent"

    iget-object v7, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 193
    :cond_4
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "WebKit User Agent value: \'%1$s\'"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-static {v4, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v7, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 195
    .end local v1    # "overrideUserAgent":Ljava/lang/String;
    .end local v2    # "prefs":Landroid/content/SharedPreferences;
    :cond_5
    monitor-exit v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 199
    :cond_6
    :try_start_8
    iget-object v1, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager;->_webKitUserAgent:Ljava/lang/String;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 202
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "UserAgentValuesManager: getWebKitUserAgent() FINISHED"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_0
.end method
