.class public Lcom/miniclip/nativeJNI/infoTransmitter;
.super Ljava/lang/Object;
.source "infoTransmitter.java"


# static fields
.field static final DO_NOT_VERIFY:Ljavax/net/ssl/HostnameVerifier;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDeviceID:Ljava/lang/String;

.field private mSendJSON:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 339
    new-instance v0, Lcom/miniclip/nativeJNI/infoTransmitter$2;

    invoke-direct {v0}, Lcom/miniclip/nativeJNI/infoTransmitter$2;-><init>()V

    sput-object v0, Lcom/miniclip/nativeJNI/infoTransmitter;->DO_NOT_VERIFY:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "deviceID"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    .line 46
    iput-object p2, p0, Lcom/miniclip/nativeJNI/infoTransmitter;->mDeviceID:Ljava/lang/String;

    .line 48
    iget-object v6, p0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    const-string v7, "connectivity"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 49
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v4

    .line 50
    .local v4, "ni":Landroid/net/NetworkInfo;
    if-nez v4, :cond_1

    .line 71
    :cond_0
    :goto_0
    return-void

    .line 53
    :cond_1
    iget-object v6, p0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    const-string v7, "INFO_TRANSMITTER"

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 54
    .local v5, "settings":Landroid/content/SharedPreferences;
    const-string v6, "FIRST_RUN"

    const/4 v7, 0x1

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 55
    .local v3, "firstRun":Z
    if-eqz v3, :cond_0

    .line 58
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 59
    .local v2, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v6, "FIRST_RUN"

    invoke-interface {v2, v6, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 60
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 64
    :try_start_0
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/infoTransmitter;->generateJSON()V

    .line 65
    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/infoTransmitter;->send()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 67
    :catch_0
    move-exception v1

    .line 69
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/miniclip/nativeJNI/infoTransmitter;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/infoTransmitter;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    return-object v0
.end method

.method static synthetic access$100()V
    .locals 0

    .prologue
    .line 38
    invoke-static {}, Lcom/miniclip/nativeJNI/infoTransmitter;->trustAllHosts()V

    return-void
.end method

.method private static trustAllHosts()V
    .locals 5

    .prologue
    .line 346
    const/4 v3, 0x1

    new-array v2, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    new-instance v4, Lcom/miniclip/nativeJNI/infoTransmitter$3;

    invoke-direct {v4}, Lcom/miniclip/nativeJNI/infoTransmitter$3;-><init>()V

    aput-object v4, v2, v3

    .line 361
    .local v2, "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    :try_start_0
    const-string v3, "TLS"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 362
    .local v1, "sc":Ljavax/net/ssl/SSLContext;
    const/4 v3, 0x0

    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v3, v2, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 363
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    invoke-static {v3}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 368
    .end local v1    # "sc":Ljavax/net/ssl/SSLContext;
    :goto_0
    return-void

    .line 365
    :catch_0
    move-exception v0

    .line 366
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public generateJSON()V
    .locals 64

    .prologue
    .line 74
    new-instance v60, Lorg/json/JSONObject;

    invoke-direct/range {v60 .. v60}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v0, v60

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    .line 76
    const/16 v43, 0x0

    .line 77
    .local v43, "pi":Landroid/content/pm/PackageInfo;
    :try_start_0
    const-string v6, ""

    .line 78
    .local v6, "app_version_name":Ljava/lang/String;
    const-string v5, ""
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 80
    .local v5, "app_version_code":Ljava/lang/String;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v60

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v61, v0

    invoke-virtual/range {v61 .. v61}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v61

    const/16 v62, 0x0

    invoke-virtual/range {v60 .. v62}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v43

    .line 82
    if-eqz v43, :cond_0

    .line 83
    move-object/from16 v0, v43

    iget-object v6, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 84
    move-object/from16 v0, v43

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    move/from16 v60, v0

    invoke-static/range {v60 .. v60}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v5

    .line 89
    :cond_0
    :goto_0
    :try_start_2
    new-instance v41, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct/range {v41 .. v41}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 90
    .local v41, "mi":Landroid/app/ActivityManager$MemoryInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v60, v0

    const-string v61, "activity"

    invoke-virtual/range {v60 .. v61}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager;

    .line 92
    .local v3, "activityManager":Landroid/app/ActivityManager;
    move-object/from16 v0, v41

    invoke-virtual {v3, v0}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 93
    move-object/from16 v0, v41

    iget-wide v0, v0, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    move-wide/from16 v60, v0

    const-wide/32 v62, 0x100000

    div-long v45, v60, v62
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 94
    .local v45, "ram_free_mb":J
    const-wide/16 v47, 0x0

    .line 97
    .local v47, "ram_total_mb":J
    :try_start_3
    new-instance v49, Ljava/io/BufferedReader;

    new-instance v60, Ljava/io/InputStreamReader;

    new-instance v61, Ljava/io/FileInputStream;

    const-string v62, "/proc/meminfo"

    invoke-direct/range {v61 .. v62}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v60 .. v61}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v61, 0x3e8

    move-object/from16 v0, v49

    move-object/from16 v1, v60

    move/from16 v2, v61

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 100
    .local v49, "reader":Ljava/io/BufferedReader;
    new-instance v40, Ljava/lang/StringBuffer;

    invoke-direct/range {v40 .. v40}, Ljava/lang/StringBuffer;-><init>()V

    .line 102
    .local v40, "lines":Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual/range {v49 .. v49}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v36

    .local v36, "line":Ljava/lang/String;
    if-eqz v36, :cond_a

    .line 103
    invoke-virtual/range {v36 .. v36}, Ljava/lang/String;->length()I

    move-result v60

    const/16 v61, 0x9

    move/from16 v0, v60

    move/from16 v1, v61

    if-le v0, v1, :cond_1

    .line 104
    const/16 v60, 0x0

    const/16 v61, 0x8

    move-object/from16 v0, v36

    move/from16 v1, v60

    move/from16 v2, v61

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v37

    .line 105
    .local v37, "linea":Ljava/lang/String;
    const-string v60, "MemTotal"

    move-object/from16 v0, v37

    move-object/from16 v1, v60

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v60

    if-nez v60, :cond_1

    .line 106
    const-string v60, "\\s*:\\s*"

    move-object/from16 v0, v36

    move-object/from16 v1, v60

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v38

    .line 107
    .local v38, "lineb":[Ljava/lang/String;
    move-object/from16 v0, v38

    array-length v0, v0

    move/from16 v60, v0

    const/16 v61, 0x1

    move/from16 v0, v60

    move/from16 v1, v61

    if-le v0, v1, :cond_1

    .line 108
    const/16 v60, 0x1

    aget-object v60, v38, v60

    const-string v61, "[\\sa-zA-Z]*"

    const-string v62, ""

    invoke-virtual/range {v60 .. v62}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    .line 111
    .local v39, "linec":Ljava/lang/String;
    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v60

    move/from16 v0, v60

    int-to-long v0, v0

    move-wide/from16 v47, v0

    .line 112
    const-wide/16 v60, 0x400

    div-long v47, v47, v60

    .line 116
    .end local v37    # "linea":Ljava/lang/String;
    .end local v38    # "lineb":[Ljava/lang/String;
    .end local v39    # "linec":Ljava/lang/String;
    :cond_1
    new-instance v60, Ljava/lang/StringBuilder;

    invoke-direct/range {v60 .. v60}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v60

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v60

    const-string v61, "\n"

    invoke-virtual/range {v60 .. v61}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v60

    invoke-virtual/range {v60 .. v60}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v60

    move-object/from16 v0, v40

    move-object/from16 v1, v60

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    .line 120
    .end local v36    # "line":Ljava/lang/String;
    .end local v40    # "lines":Ljava/lang/StringBuffer;
    .end local v49    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v24

    .line 121
    .local v24, "ex":Ljava/io/IOException;
    :try_start_4
    invoke-virtual/range {v24 .. v24}, Ljava/io/IOException;->printStackTrace()V

    .line 124
    .end local v24    # "ex":Ljava/io/IOException;
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v60

    invoke-virtual/range {v60 .. v60}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v60

    move-object/from16 v0, v60

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    move/from16 v57, v0

    .line 125
    .local v57, "width":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v60

    invoke-virtual/range {v60 .. v60}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v60

    move-object/from16 v0, v60

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    move/from16 v29, v0

    .line 126
    .local v29, "height":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v60

    invoke-virtual/range {v60 .. v60}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v60

    move-object/from16 v0, v60

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    move/from16 v23, v0

    .line 127
    .local v23, "density":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v60

    invoke-virtual/range {v60 .. v60}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v60

    move-object/from16 v0, v60

    iget v0, v0, Landroid/util/DisplayMetrics;->xdpi:F

    move/from16 v58, v0

    .line 128
    .local v58, "xdpi":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v60

    invoke-virtual/range {v60 .. v60}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v60

    move-object/from16 v0, v60

    iget v0, v0, Landroid/util/DisplayMetrics;->xdpi:F

    move/from16 v59, v0

    .line 130
    .local v59, "ydpi":F
    const-string v22, ""
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    .line 131
    .local v22, "cpu_name":Ljava/lang/String;
    const/16 v20, 0x0

    .line 133
    .local v20, "cpu_cores":I
    :try_start_5
    new-instance v49, Ljava/io/BufferedReader;

    new-instance v60, Ljava/io/InputStreamReader;

    new-instance v61, Ljava/io/FileInputStream;

    const-string v62, "/proc/cpuinfo"

    invoke-direct/range {v61 .. v62}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v60 .. v61}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v61, 0x3e8

    move-object/from16 v0, v49

    move-object/from16 v1, v60

    move/from16 v2, v61

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 136
    .restart local v49    # "reader":Ljava/io/BufferedReader;
    new-instance v40, Ljava/lang/StringBuffer;

    invoke-direct/range {v40 .. v40}, Ljava/lang/StringBuffer;-><init>()V

    .line 138
    .restart local v40    # "lines":Ljava/lang/StringBuffer;
    :goto_3
    invoke-virtual/range {v49 .. v49}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v36

    .restart local v36    # "line":Ljava/lang/String;
    if-eqz v36, :cond_b

    .line 139
    invoke-virtual/range {v36 .. v36}, Ljava/lang/String;->length()I

    move-result v60

    const/16 v61, 0x9

    move/from16 v0, v60

    move/from16 v1, v61

    if-le v0, v1, :cond_3

    .line 140
    const/16 v60, 0x0

    const/16 v61, 0x9

    move-object/from16 v0, v36

    move/from16 v1, v60

    move/from16 v2, v61

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v37

    .line 141
    .restart local v37    # "linea":Ljava/lang/String;
    const-string v60, "processor"

    move-object/from16 v0, v37

    move-object/from16 v1, v60

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v60

    if-nez v60, :cond_2

    .line 142
    add-int/lit8 v20, v20, 0x1

    .line 144
    :cond_2
    const-string v60, "Processor"

    move-object/from16 v0, v37

    move-object/from16 v1, v60

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v60

    if-nez v60, :cond_3

    .line 145
    const-string v60, "\\s*:\\s*"

    move-object/from16 v0, v36

    move-object/from16 v1, v60

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v38

    .line 146
    .restart local v38    # "lineb":[Ljava/lang/String;
    move-object/from16 v0, v38

    array-length v0, v0

    move/from16 v60, v0

    const/16 v61, 0x1

    move/from16 v0, v60

    move/from16 v1, v61

    if-le v0, v1, :cond_3

    .line 147
    const/16 v60, 0x1

    aget-object v22, v38, v60

    .line 150
    .end local v37    # "linea":Ljava/lang/String;
    .end local v38    # "lineb":[Ljava/lang/String;
    :cond_3
    new-instance v60, Ljava/lang/StringBuilder;

    invoke-direct/range {v60 .. v60}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v60

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v60

    const-string v61, "\n"

    invoke-virtual/range {v60 .. v61}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v60

    invoke-virtual/range {v60 .. v60}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v60

    move-object/from16 v0, v40

    move-object/from16 v1, v60

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_3

    .line 154
    .end local v36    # "line":Ljava/lang/String;
    .end local v40    # "lines":Ljava/lang/StringBuffer;
    .end local v49    # "reader":Ljava/io/BufferedReader;
    :catch_1
    move-exception v24

    .line 155
    .restart local v24    # "ex":Ljava/io/IOException;
    :try_start_6
    invoke-virtual/range {v24 .. v24}, Ljava/io/IOException;->printStackTrace()V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_2

    .line 157
    .end local v24    # "ex":Ljava/io/IOException;
    :goto_4
    if-nez v20, :cond_4

    .line 158
    const/16 v20, 0x1

    .line 160
    :cond_4
    const/16 v21, 0x0

    .line 162
    .local v21, "cpu_mhz":I
    :try_start_7
    new-instance v49, Ljava/io/BufferedReader;

    new-instance v60, Ljava/io/InputStreamReader;

    new-instance v61, Ljava/io/FileInputStream;

    const-string v62, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"

    invoke-direct/range {v61 .. v62}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v60 .. v61}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v61, 0x3e8

    move-object/from16 v0, v49

    move-object/from16 v1, v60

    move/from16 v2, v61

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 167
    .restart local v49    # "reader":Ljava/io/BufferedReader;
    invoke-virtual/range {v49 .. v49}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v36

    .line 168
    .restart local v36    # "line":Ljava/lang/String;
    invoke-virtual/range {v49 .. v49}, Ljava/io/BufferedReader;->close()V

    .line 169
    invoke-static/range {v36 .. v36}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v21

    .line 170
    move/from16 v0, v21

    div-int/lit16 v0, v0, 0x3e8

    move/from16 v21, v0
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_2

    .line 178
    .end local v36    # "line":Ljava/lang/String;
    .end local v49    # "reader":Ljava/io/BufferedReader;
    :goto_5
    :try_start_8
    new-instance v50, Landroid/os/StatFs;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v60

    invoke-virtual/range {v60 .. v60}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v60

    move-object/from16 v0, v50

    move-object/from16 v1, v60

    invoke-direct {v0, v1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 179
    .local v50, "statFs":Landroid/os/StatFs;
    invoke-virtual/range {v50 .. v50}, Landroid/os/StatFs;->getBlockSize()I

    move-result v60

    move/from16 v0, v60

    int-to-long v12, v0

    .line 180
    .local v12, "blockSize":J
    invoke-virtual/range {v50 .. v50}, Landroid/os/StatFs;->getBlockCount()I

    move-result v60

    move/from16 v0, v60

    int-to-long v0, v0

    move-wide/from16 v60, v0

    mul-long v53, v60, v12

    .line 181
    .local v53, "totalSize":J
    invoke-virtual/range {v50 .. v50}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v60

    move/from16 v0, v60

    int-to-long v0, v0

    move-wide/from16 v60, v0

    mul-long v8, v60, v12

    .line 183
    .local v8, "availableSize":J
    const-wide/32 v60, 0x100000

    div-long v32, v53, v60

    .line 184
    .local v32, "internal_total_mb":J
    const-wide/32 v60, 0x100000

    div-long v30, v8, v60

    .line 186
    .local v30, "internal_free_mb":J
    new-instance v51, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v60

    invoke-virtual/range {v60 .. v60}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v60

    move-object/from16 v0, v51

    move-object/from16 v1, v60

    invoke-direct {v0, v1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 188
    .local v51, "statFsExt":Landroid/os/StatFs;
    invoke-virtual/range {v51 .. v51}, Landroid/os/StatFs;->getBlockSize()I

    move-result v60

    move/from16 v0, v60

    int-to-long v14, v0

    .line 189
    .local v14, "blockSizeExt":J
    invoke-virtual/range {v51 .. v51}, Landroid/os/StatFs;->getBlockCount()I

    move-result v60

    move/from16 v0, v60

    int-to-long v0, v0

    move-wide/from16 v60, v0

    mul-long v55, v60, v14

    .line 190
    .local v55, "totalSizeExt":J
    invoke-virtual/range {v51 .. v51}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v60

    move/from16 v0, v60

    int-to-long v0, v0

    move-wide/from16 v60, v0

    mul-long v10, v60, v14

    .line 193
    .local v10, "availableSizeExt":J
    const-wide/32 v60, 0x100000

    div-long v27, v55, v60

    .line 194
    .local v27, "external_total_mb":J
    const-wide/32 v60, 0x100000

    div-long v25, v10, v60

    .line 196
    .local v25, "external_free_mb":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v60, v0

    const-string v61, "connectivity"

    invoke-virtual/range {v60 .. v61}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/net/ConnectivityManager;

    .line 198
    .local v16, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual/range {v16 .. v16}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v42

    .line 199
    .local v42, "ni":Landroid/net/NetworkInfo;
    const/16 v34, 0x0

    .line 200
    .local v34, "isOnline":I
    const-string v17, ""

    .line 201
    .local v17, "connectionType":Ljava/lang/String;
    if-eqz v42, :cond_5

    .line 202
    const/16 v34, 0x1

    .line 203
    invoke-virtual/range {v42 .. v42}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v17

    .line 206
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v60, v0

    const-string v61, "phone"

    invoke-virtual/range {v60 .. v61}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Landroid/telephony/TelephonyManager;

    .line 208
    .local v52, "tm":Landroid/telephony/TelephonyManager;
    const-string v18, ""

    .line 209
    .local v18, "country_code":Ljava/lang/String;
    if-eqz v52, :cond_6

    .line 210
    invoke-virtual/range {v52 .. v52}, Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;

    move-result-object v18

    .line 211
    :cond_6
    const-string v60, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v60

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v60

    if-nez v60, :cond_7

    .line 212
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v60

    invoke-virtual/range {v60 .. v60}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v18

    .line 214
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "did"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mDeviceID:Ljava/lang/String;

    move-object/from16 v62, v0

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "app_version_name"

    move-object/from16 v0, v60

    move-object/from16 v1, v61

    invoke-virtual {v0, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "app_version_code"

    move-object/from16 v0, v60

    move-object/from16 v1, v61

    invoke-virtual {v0, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "app_id"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v62, v0

    invoke-virtual/range {v62 .. v62}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "android_version"

    sget-object v62, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 219
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "android_build_name"

    sget-object v62, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "device_name"

    sget-object v62, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "ram_total_mb"

    invoke-static/range {v47 .. v48}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "ram_free_mb"

    invoke-static/range {v45 .. v46}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 223
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "screen_width"

    invoke-static/range {v57 .. v57}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 224
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "screen_height"

    invoke-static/range {v29 .. v29}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "screen_density"

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "screen_dpi_x"

    invoke-static/range {v58 .. v58}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "screen_dpi_y"

    invoke-static/range {v59 .. v59}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "cpu_mhz"

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "cpu_name"

    move-object/from16 v0, v60

    move-object/from16 v1, v61

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "cpu_cores"

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 232
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "internal_total_mb"

    invoke-static/range {v32 .. v33}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "internal_free_mb"

    invoke-static/range {v30 .. v31}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "external_total_mb"

    invoke-static/range {v27 .. v28}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "external_free_mb"

    invoke-static/range {v25 .. v26}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "internet_enabled"

    invoke-static/range {v34 .. v34}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v62

    invoke-virtual/range {v60 .. v62}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "connection_type"

    move-object/from16 v0, v60

    move-object/from16 v1, v61

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mSendJSON:Lorg/json/JSONObject;

    move-object/from16 v60, v0

    const-string v61, "country_code"

    move-object/from16 v0, v60

    move-object/from16 v1, v61

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 242
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 243
    .local v7, "apps_installed":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/nativeJNI/infoTransmitter;->mContext:Landroid/content/Context;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v60

    const/16 v61, 0x0

    invoke-virtual/range {v60 .. v61}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v44

    .line 245
    .local v44, "pia":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    invoke-interface/range {v44 .. v44}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v35

    .line 246
    .local v35, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    :cond_8
    :goto_6
    invoke-interface/range {v35 .. v35}, Ljava/util/Iterator;->hasNext()Z

    move-result v60

    if-eqz v60, :cond_9

    .line 247
    invoke-interface/range {v35 .. v35}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/content/pm/PackageInfo;

    .line 248
    .local v19, "cpi":Landroid/content/pm/PackageInfo;
    move-object/from16 v0, v19

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    move-object/from16 v60, v0

    const-string v61, "android"

    invoke-virtual/range {v60 .. v61}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v60

    if-eqz v60, :cond_8

    .line 249
    move-object/from16 v0, v19

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    move-object/from16 v60, v0

    invoke-virtual/range {v60 .. v60}, Ljava/lang/String;->length()I

    move-result v60

    const/16 v61, 0xe

    move/from16 v0, v60

    move/from16 v1, v61

    if-le v0, v1, :cond_8

    .line 250
    move-object/from16 v0, v19

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    move-object/from16 v60, v0

    const/16 v61, 0x0

    const/16 v62, 0xc

    invoke-virtual/range {v60 .. v62}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v60

    const-string v61, "com.android."

    invoke-virtual/range {v60 .. v61}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v60

    if-eqz v60, :cond_8

    .line 252
    move-object/from16 v0, v19

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    move-object/from16 v60, v0

    const/16 v61, 0x0

    const/16 v62, 0xb

    invoke-virtual/range {v60 .. v62}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v60

    const-string v61, "com.google."

    invoke-virtual/range {v60 .. v61}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v60

    if-eqz v60, :cond_8

    .line 256
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 257
    .local v4, "app":Lorg/json/JSONObject;
    const-string v60, "package_name"

    move-object/from16 v0, v19

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    move-object/from16 v61, v0

    move-object/from16 v0, v60

    move-object/from16 v1, v61

    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 265
    invoke-virtual {v7, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_2

    goto :goto_6

    .line 290
    .end local v3    # "activityManager":Landroid/app/ActivityManager;
    .end local v4    # "app":Lorg/json/JSONObject;
    .end local v5    # "app_version_code":Ljava/lang/String;
    .end local v6    # "app_version_name":Ljava/lang/String;
    .end local v7    # "apps_installed":Lorg/json/JSONArray;
    .end local v8    # "availableSize":J
    .end local v10    # "availableSizeExt":J
    .end local v12    # "blockSize":J
    .end local v14    # "blockSizeExt":J
    .end local v16    # "cm":Landroid/net/ConnectivityManager;
    .end local v17    # "connectionType":Ljava/lang/String;
    .end local v18    # "country_code":Ljava/lang/String;
    .end local v19    # "cpi":Landroid/content/pm/PackageInfo;
    .end local v20    # "cpu_cores":I
    .end local v21    # "cpu_mhz":I
    .end local v22    # "cpu_name":Ljava/lang/String;
    .end local v23    # "density":F
    .end local v25    # "external_free_mb":J
    .end local v27    # "external_total_mb":J
    .end local v29    # "height":I
    .end local v30    # "internal_free_mb":J
    .end local v32    # "internal_total_mb":J
    .end local v34    # "isOnline":I
    .end local v35    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    .end local v41    # "mi":Landroid/app/ActivityManager$MemoryInfo;
    .end local v42    # "ni":Landroid/net/NetworkInfo;
    .end local v44    # "pia":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .end local v45    # "ram_free_mb":J
    .end local v47    # "ram_total_mb":J
    .end local v50    # "statFs":Landroid/os/StatFs;
    .end local v51    # "statFsExt":Landroid/os/StatFs;
    .end local v52    # "tm":Landroid/telephony/TelephonyManager;
    .end local v53    # "totalSize":J
    .end local v55    # "totalSizeExt":J
    .end local v57    # "width":I
    .end local v58    # "xdpi":F
    .end local v59    # "ydpi":F
    :catch_2
    move-exception v60

    .line 293
    :cond_9
    return-void

    .line 118
    .restart local v3    # "activityManager":Landroid/app/ActivityManager;
    .restart local v5    # "app_version_code":Ljava/lang/String;
    .restart local v6    # "app_version_name":Ljava/lang/String;
    .restart local v36    # "line":Ljava/lang/String;
    .restart local v40    # "lines":Ljava/lang/StringBuffer;
    .restart local v41    # "mi":Landroid/app/ActivityManager$MemoryInfo;
    .restart local v45    # "ram_free_mb":J
    .restart local v47    # "ram_total_mb":J
    .restart local v49    # "reader":Ljava/io/BufferedReader;
    :cond_a
    :try_start_9
    invoke-virtual/range {v49 .. v49}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_2

    goto/16 :goto_2

    .line 152
    .restart local v20    # "cpu_cores":I
    .restart local v22    # "cpu_name":Ljava/lang/String;
    .restart local v23    # "density":F
    .restart local v29    # "height":I
    .restart local v57    # "width":I
    .restart local v58    # "xdpi":F
    .restart local v59    # "ydpi":F
    :cond_b
    :try_start_a
    invoke-virtual/range {v49 .. v49}, Ljava/io/BufferedReader;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_2

    goto/16 :goto_4

    .line 172
    .end local v36    # "line":Ljava/lang/String;
    .end local v40    # "lines":Ljava/lang/StringBuffer;
    .end local v49    # "reader":Ljava/io/BufferedReader;
    .restart local v21    # "cpu_mhz":I
    :catch_3
    move-exception v24

    .line 173
    .restart local v24    # "ex":Ljava/io/IOException;
    :try_start_b
    invoke-virtual/range {v24 .. v24}, Ljava/io/IOException;->printStackTrace()V
    :try_end_b
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_2

    goto/16 :goto_5

    .line 86
    .end local v3    # "activityManager":Landroid/app/ActivityManager;
    .end local v20    # "cpu_cores":I
    .end local v21    # "cpu_mhz":I
    .end local v22    # "cpu_name":Ljava/lang/String;
    .end local v23    # "density":F
    .end local v24    # "ex":Ljava/io/IOException;
    .end local v29    # "height":I
    .end local v41    # "mi":Landroid/app/ActivityManager$MemoryInfo;
    .end local v45    # "ram_free_mb":J
    .end local v47    # "ram_total_mb":J
    .end local v57    # "width":I
    .end local v58    # "xdpi":F
    .end local v59    # "ydpi":F
    :catch_4
    move-exception v60

    goto/16 :goto_0
.end method

.method public send()V
    .locals 1

    .prologue
    .line 296
    new-instance v0, Lcom/miniclip/nativeJNI/infoTransmitter$1;

    invoke-direct {v0, p0}, Lcom/miniclip/nativeJNI/infoTransmitter$1;-><init>(Lcom/miniclip/nativeJNI/infoTransmitter;)V

    .line 336
    .local v0, "thread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 337
    return-void
.end method
