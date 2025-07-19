.class public Lcom/miniclip/newsfeed/Newsfeed;
.super Ljava/lang/Object;
.source "Newsfeed.java"


# static fields
.field public static final NOTIF_ID:I = 0x93bc

.field public static final PREFS_NAME_C2DM:Ljava/lang/String; = "NewsfeedPrefsC2DM"

.field public static final PREFS_NAME_NOTIFIED:Ljava/lang/String; = "NewsfeedPrefsNotified"

.field public static final PREFS_NAME_SEEN:Ljava/lang/String; = "NewsfeedPrefsSeen"

.field public static final PREFS_NAME_SEND_CLICKED:Ljava/lang/String; = "NewsfeedPrefsSendClicked"

.field public static final PREFS_NAME_SEND_SEEN:Ljava/lang/String; = "NewsfeedPrefsSendSeen"


# instance fields
.field private c2dmID:Ljava/lang/String;

.field private dataJSON:Lorg/json/JSONObject;

.field private deviceID:Ljava/lang/String;

.field private deviceType:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDisplayHandler:Landroid/os/Handler;

.field mDisplayRunnable:Ljava/lang/Runnable;

.field public mIsVisible:Z

.field private mPackageName:Ljava/lang/String;

.field private mStatus:I

.field private messages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field public messagesNum:I

.field public messagesNumUnread:I

.field public messagesNumUrgent:I

.field private messagesUrgent:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private sandBoxMode:Z

.field public urgentDelay:I

.field public urgentItem:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "deviceID"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/16 v3, 0x4b

    iput v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->urgentDelay:I

    .line 55
    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    iput-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->mDisplayHandler:Landroid/os/Handler;

    .line 56
    new-instance v3, Lcom/miniclip/newsfeed/Newsfeed$1;

    invoke-direct {v3, p0}, Lcom/miniclip/newsfeed/Newsfeed$1;-><init>(Lcom/miniclip/newsfeed/Newsfeed;)V

    iput-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->mDisplayRunnable:Ljava/lang/Runnable;

    .line 74
    iput v6, p0, Lcom/miniclip/newsfeed/Newsfeed;->mStatus:I

    .line 75
    const/4 v3, -0x1

    iput v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->urgentItem:I

    .line 76
    iput-object p1, p0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    .line 77
    iput-object p2, p0, Lcom/miniclip/newsfeed/Newsfeed;->deviceID:Ljava/lang/String;

    .line 78
    iput v6, p0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    .line 79
    iput v6, p0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUnread:I

    .line 80
    iput v6, p0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUrgent:I

    .line 81
    iput-boolean v6, p0, Lcom/miniclip/newsfeed/Newsfeed;->sandBoxMode:Z

    .line 82
    iput-boolean v6, p0, Lcom/miniclip/newsfeed/Newsfeed;->mIsVisible:Z

    .line 83
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "android."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->mPackageName:Ljava/lang/String;

    .line 84
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->messages:Ljava/util/ArrayList;

    .line 85
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->messagesUrgent:Ljava/util/ArrayList;

    .line 86
    sget-boolean v3, Lcom/miniclip/nativeJNI/cocojava;->mUSE_C2DM:Z

    if-eqz v3, :cond_0

    .line 93
    :try_start_0
    invoke-static {p1}, Lcom/google/android/gcm/GCMRegistrar;->checkDevice(Landroid/content/Context;)V

    .line 94
    invoke-static {p1}, Lcom/google/android/gcm/GCMRegistrar;->checkManifest(Landroid/content/Context;)V

    .line 95
    invoke-static {p1}, Lcom/google/android/gcm/GCMRegistrar;->getRegistrationId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->c2dmID:Ljava/lang/String;

    .line 96
    iget-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->c2dmID:Ljava/lang/String;

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 97
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "1040273365599"

    aput-object v5, v3, v4

    invoke-static {p1, v3}, Lcom/google/android/gcm/GCMRegistrar;->register(Landroid/content/Context;[Ljava/lang/String;)V

    .line 101
    :goto_0
    const-string v3, "PushNotification_token"

    iget-object v4, p0, Lcom/miniclip/newsfeed/Newsfeed;->c2dmID:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/miniclip/nativeJNI/cocojava;->SharedPreferences_setString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :cond_0
    :goto_1
    iget-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v2, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 107
    .local v2, "width":I
    iget-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v1, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 108
    .local v1, "height":I
    const-string v3, "android-%d-%d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->deviceType:Ljava/lang/String;

    .line 109
    return-void

    .line 99
    .end local v1    # "height":I
    .end local v2    # "width":I
    :cond_1
    :try_start_1
    const-string v3, "Newsfeed"

    const-string v4, "Already registered"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 102
    :catch_0
    move-exception v0

    .line 103
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "Newsfeed"

    const-string v4, "GCM Exception"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method static synthetic access$000(Lcom/miniclip/newsfeed/Newsfeed;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/newsfeed/Newsfeed;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/miniclip/newsfeed/Newsfeed;->mDisplayHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/miniclip/newsfeed/Newsfeed;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/newsfeed/Newsfeed;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$202(Lcom/miniclip/newsfeed/Newsfeed;I)I
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/newsfeed/Newsfeed;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/miniclip/newsfeed/Newsfeed;->mStatus:I

    return p1
.end method


# virtual methods
.method public checkServer()I
    .locals 40

    .prologue
    .line 179
    const/16 v35, -0x1

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->urgentItem:I

    .line 180
    const/16 v35, 0x0

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    .line 181
    const/16 v35, 0x0

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUnread:I

    .line 182
    const/16 v35, 0x0

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUrgent:I

    .line 183
    new-instance v35, Ljava/util/ArrayList;

    invoke-direct/range {v35 .. v35}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->messages:Ljava/util/ArrayList;

    .line 184
    new-instance v35, Ljava/util/ArrayList;

    invoke-direct/range {v35 .. v35}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->messagesUrgent:Ljava/util/ArrayList;

    .line 198
    const/16 v20, 0x0

    .line 199
    .local v20, "pi":Landroid/content/pm/PackageInfo;
    :try_start_0
    const-string v4, ""
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    .local v4, "app_version_name":Ljava/lang/String;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v35

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v36

    const/16 v37, 0x0

    invoke-virtual/range {v35 .. v37}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v20

    .line 204
    if-eqz v20, :cond_0

    .line 205
    move-object/from16 v0, v20

    iget-object v4, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 211
    :cond_0
    :goto_0
    :try_start_2
    new-instance v23, Lorg/json/JSONObject;

    invoke-direct/range {v23 .. v23}, Lorg/json/JSONObject;-><init>()V

    .line 212
    .local v23, "sendJSON":Lorg/json/JSONObject;
    const-string v35, "device"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->deviceType:Ljava/lang/String;

    move-object/from16 v36, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 213
    const-string v35, "app_id"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->mPackageName:Ljava/lang/String;

    move-object/from16 v36, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 215
    sget-boolean v35, Lcom/miniclip/nativeJNI/cocojava;->mUSE_C2DM:Z

    if-eqz v35, :cond_1

    .line 216
    const-string v35, "apn_token"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->c2dmID:Ljava/lang/String;

    move-object/from16 v36, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 217
    :cond_1
    const-string v35, "app_version"

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 218
    const-string v35, "did"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->deviceID:Ljava/lang/String;

    move-object/from16 v36, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 219
    const-string v35, "operation"

    const-string v36, "get_news"

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 220
    const-string v35, "newsfeed_version"

    const-string v36, "2"

    move-object/from16 v0, v23

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 222
    new-instance v32, Lorg/json/JSONArray;

    invoke-direct/range {v32 .. v32}, Lorg/json/JSONArray;-><init>()V

    .line 224
    .local v32, "statsJSON":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    move-object/from16 v35, v0

    const-string v36, "NewsfeedPrefsSendClicked"

    const/16 v37, 0x0

    invoke-virtual/range {v35 .. v37}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v25

    .line 225
    .local v25, "settingsC":Landroid/content/SharedPreferences;
    invoke-interface/range {v25 .. v25}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v28

    .line 226
    .local v28, "shownIDsC":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-interface/range {v28 .. v28}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v35

    invoke-interface/range {v35 .. v35}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .line 227
    .local v13, "itC":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_2

    .line 228
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/Map$Entry;

    .line 229
    .local v19, "pairs":Ljava/util/Map$Entry;
    new-instance v35, Lorg/json/JSONObject;

    invoke-direct/range {v35 .. v35}, Lorg/json/JSONObject;-><init>()V

    const-string v36, "type"

    const/16 v37, 0x1

    invoke-virtual/range {v35 .. v37}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v30

    .line 230
    .local v30, "statsItemJSONclicked":Lorg/json/JSONObject;
    const-string v35, "message_id"

    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v36

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 231
    const-string v35, "campaign_id"

    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v36

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 232
    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 234
    invoke-interface {v13}, Ljava/util/Iterator;->remove()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 359
    .end local v4    # "app_version_name":Ljava/lang/String;
    .end local v13    # "itC":Ljava/util/Iterator;
    .end local v19    # "pairs":Ljava/util/Map$Entry;
    .end local v23    # "sendJSON":Lorg/json/JSONObject;
    .end local v25    # "settingsC":Landroid/content/SharedPreferences;
    .end local v28    # "shownIDsC":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    .end local v30    # "statsItemJSONclicked":Lorg/json/JSONObject;
    .end local v32    # "statsJSON":Lorg/json/JSONArray;
    :catch_0
    move-exception v7

    .line 362
    .local v7, "e":Lorg/json/JSONException;
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    .line 364
    .end local v7    # "e":Lorg/json/JSONException;
    :goto_2
    const/16 v35, 0x0

    :goto_3
    return v35

    .line 237
    .restart local v4    # "app_version_name":Ljava/lang/String;
    .restart local v13    # "itC":Ljava/util/Iterator;
    .restart local v23    # "sendJSON":Lorg/json/JSONObject;
    .restart local v25    # "settingsC":Landroid/content/SharedPreferences;
    .restart local v28    # "shownIDsC":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    .restart local v32    # "statsJSON":Lorg/json/JSONArray;
    :cond_2
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    move-object/from16 v35, v0

    const-string v36, "NewsfeedPrefsSendSeen"

    const/16 v37, 0x0

    invoke-virtual/range {v35 .. v37}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v26

    .line 238
    .local v26, "settingsS":Landroid/content/SharedPreferences;
    invoke-interface/range {v26 .. v26}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v29

    .line 239
    .local v29, "shownIDsS":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-interface/range {v29 .. v29}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v35

    invoke-interface/range {v35 .. v35}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 240
    .local v14, "itS":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_3

    .line 241
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/Map$Entry;

    .line 242
    .restart local v19    # "pairs":Ljava/util/Map$Entry;
    new-instance v35, Lorg/json/JSONObject;

    invoke-direct/range {v35 .. v35}, Lorg/json/JSONObject;-><init>()V

    const-string v36, "type"

    const/16 v37, 0x0

    invoke-virtual/range {v35 .. v37}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v31

    .line 243
    .local v31, "statsItemJSONseen":Lorg/json/JSONObject;
    const-string v35, "message_id"

    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v36

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 244
    const-string v35, "campaign_id"

    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v36

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 245
    move-object/from16 v0, v32

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 247
    invoke-interface {v14}, Ljava/util/Iterator;->remove()V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_4

    .line 260
    .end local v19    # "pairs":Ljava/util/Map$Entry;
    .end local v31    # "statsItemJSONseen":Lorg/json/JSONObject;
    :cond_3
    :try_start_4
    invoke-virtual/range {v23 .. v23}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    .line 262
    .local v6, "data":Ljava/lang/String;
    const-string v35, "Newsfeed"

    const/16 v36, 0x2

    move-object/from16 v0, v23

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    new-instance v33, Ljava/net/URL;

    const-string v35, "http://services.miniclippt.com/newsfeed/newsfeed.php"

    move-object/from16 v0, v33

    move-object/from16 v1, v35

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 266
    .local v33, "url":Ljava/net/URL;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->sandBoxMode:Z

    move/from16 v35, v0

    if-eqz v35, :cond_4

    .line 267
    new-instance v33, Ljava/net/URL;

    .end local v33    # "url":Ljava/net/URL;
    const-string v35, "http://services.dev.miniclippt.com/newsfeed/newsfeed.php"

    move-object/from16 v0, v33

    move-object/from16 v1, v35

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 268
    .restart local v33    # "url":Ljava/net/URL;
    :cond_4
    invoke-virtual/range {v33 .. v33}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    .line 269
    .local v5, "conn":Ljava/net/URLConnection;
    const/16 v35, 0x7d0

    move/from16 v0, v35

    invoke-virtual {v5, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 270
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v5, v0}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 271
    new-instance v34, Ljava/io/OutputStreamWriter;

    invoke-virtual {v5}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v35

    invoke-direct/range {v34 .. v35}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 272
    .local v34, "wr":Ljava/io/OutputStreamWriter;
    move-object/from16 v0, v34

    invoke-virtual {v0, v6}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 273
    invoke-virtual/range {v34 .. v34}, Ljava/io/OutputStreamWriter;->flush()V

    .line 277
    new-instance v21, Ljava/io/BufferedReader;

    new-instance v35, Ljava/io/InputStreamReader;

    invoke-virtual {v5}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v35

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 278
    .local v21, "rd":Ljava/io/BufferedReader;
    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    .line 280
    .local v16, "lines":Ljava/lang/StringBuffer;
    :goto_5
    invoke-virtual/range {v21 .. v21}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v15

    .local v15, "line":Ljava/lang/String;
    if-eqz v15, :cond_5

    .line 282
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_5

    .line 354
    .end local v5    # "conn":Ljava/net/URLConnection;
    .end local v6    # "data":Ljava/lang/String;
    .end local v15    # "line":Ljava/lang/String;
    .end local v16    # "lines":Ljava/lang/StringBuffer;
    .end local v21    # "rd":Ljava/io/BufferedReader;
    .end local v33    # "url":Ljava/net/URL;
    .end local v34    # "wr":Ljava/io/OutputStreamWriter;
    :catch_1
    move-exception v7

    .line 357
    .local v7, "e":Ljava/io/IOException;
    :try_start_5
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_2

    .line 284
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v5    # "conn":Ljava/net/URLConnection;
    .restart local v6    # "data":Ljava/lang/String;
    .restart local v15    # "line":Ljava/lang/String;
    .restart local v16    # "lines":Ljava/lang/StringBuffer;
    .restart local v21    # "rd":Ljava/io/BufferedReader;
    .restart local v33    # "url":Ljava/net/URL;
    .restart local v34    # "wr":Ljava/io/OutputStreamWriter;
    :cond_5
    :try_start_6
    invoke-virtual/range {v34 .. v34}, Ljava/io/OutputStreamWriter;->close()V

    .line 285
    invoke-virtual/range {v21 .. v21}, Ljava/io/BufferedReader;->close()V

    .line 287
    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    .line 288
    .local v22, "returnString":Ljava/lang/String;
    const-string v35, "Newsfeed"

    move-object/from16 v0, v35

    move-object/from16 v1, v22

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    new-instance v35, Lorg/json/JSONObject;

    move-object/from16 v0, v35

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    .line 290
    const-string v35, "Newsfeed"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v36, v0

    const/16 v37, 0x2

    invoke-virtual/range {v36 .. v37}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v35, v0

    const-string v36, "error_code"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v35, v0

    const-string v36, "error_code"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v35

    if-eqz v35, :cond_6

    .line 293
    const/16 v35, 0x0

    goto/16 :goto_3

    .line 294
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v35, v0

    const-string v36, "data"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v35

    if-nez v35, :cond_7

    .line 295
    const/16 v35, 0x0

    goto/16 :goto_3

    .line 296
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v35, v0

    const-string v36, "data"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v35

    const-string v36, "messages"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lorg/json/JSONArray;->length()I

    move-result v35

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    .line 297
    const-string v35, "Newsfeed"

    const-string v36, "messagesNumAll: %d"

    const/16 v37, 0x1

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    move/from16 v39, v0

    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v39

    aput-object v39, v37, v38

    invoke-static/range {v36 .. v37}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v35, v0

    const-string v36, "data"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v35

    const-string v36, "config"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_8

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v35, v0

    const-string v36, "data"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v35

    const-string v36, "config"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v35

    const-string v36, "urgent_message_delay"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_8

    .line 301
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v35, v0

    const-string v36, "data"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v35

    const-string v36, "config"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v35

    const-string v36, "urgent_message_delay"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v35

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->urgentDelay:I

    .line 304
    :cond_8
    invoke-interface/range {v25 .. v25}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    .line 305
    .local v8, "editorC":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 306
    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 307
    invoke-interface/range {v26 .. v26}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    .line 308
    .local v9, "editorS":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 309
    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 311
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_6
    move-object/from16 v0, p0

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    move/from16 v35, v0

    move/from16 v0, v35

    if-ge v10, v0, :cond_d

    .line 313
    const/4 v12, 0x0

    .line 314
    .local v12, "isUrgent":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v35, v0

    const-string v36, "data"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v35

    const-string v36, "messages"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v35

    const-string v36, "urgent"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    const-string v36, "1"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v35

    if-eqz v35, :cond_9

    .line 315
    const/4 v12, 0x1

    .line 317
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v35, v0

    const-string v36, "data"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v35

    const-string v36, "messages"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v35

    const-string v36, "id"

    invoke-virtual/range {v35 .. v36}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 318
    .local v11, "id":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    move-object/from16 v35, v0

    const-string v36, "NewsfeedPrefsSeen"

    const/16 v37, 0x0

    invoke-virtual/range {v35 .. v37}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v24

    .line 319
    .local v24, "settings":Landroid/content/SharedPreferences;
    invoke-interface/range {v24 .. v24}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v27

    .line 322
    .local v27, "shownIDs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    move-object/from16 v0, v27

    invoke-interface {v0, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v35

    if-nez v35, :cond_a

    .line 324
    if-eqz v12, :cond_c

    .line 326
    const/16 v35, 0x1

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->urgentItem:I

    .line 327
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesUrgent:Ljava/util/ArrayList;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v36, v0

    const-string v37, "data"

    invoke-virtual/range {v36 .. v37}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v36

    const-string v37, "messages"

    invoke-virtual/range {v36 .. v37}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v36

    invoke-virtual/range {v35 .. v36}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 334
    :cond_a
    :goto_7
    if-nez v12, :cond_b

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messages:Ljava/util/ArrayList;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->dataJSON:Lorg/json/JSONObject;

    move-object/from16 v36, v0

    const-string v37, "data"

    invoke-virtual/range {v36 .. v37}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v36

    const-string v37, "messages"

    invoke-virtual/range {v36 .. v37}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v36

    invoke-virtual/range {v35 .. v36}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 311
    :cond_b
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_6

    .line 331
    :cond_c
    move-object/from16 v0, p0

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUnread:I

    move/from16 v35, v0

    add-int/lit8 v35, v35, 0x1

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUnread:I

    goto :goto_7

    .line 338
    .end local v11    # "id":Ljava/lang/String;
    .end local v12    # "isUrgent":Z
    .end local v24    # "settings":Landroid/content/SharedPreferences;
    .end local v27    # "shownIDs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messages:Ljava/util/ArrayList;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v35

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    .line 339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesUrgent:Ljava/util/ArrayList;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v35

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput v0, v1, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUrgent:I

    .line 340
    const-string v35, "Newsfeed"

    const-string v36, "messagesNum: %d"

    const/16 v37, 0x1

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    move/from16 v39, v0

    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v39

    aput-object v39, v37, v38

    invoke-static/range {v36 .. v37}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    const-string v35, "Newsfeed"

    const-string v36, "messagesNumUrgent: %d"

    const/16 v37, 0x1

    move/from16 v0, v37

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUrgent:I

    move/from16 v39, v0

    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v39

    aput-object v39, v37, v38

    invoke-static/range {v36 .. v37}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    move-object/from16 v0, p0

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    move/from16 v17, v0

    .line 344
    .local v17, "messagesNumF":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUnread:I

    move/from16 v18, v0

    .line 345
    .local v18, "messagesNumUnreadF":I
    sget-object v35, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v36, Lcom/miniclip/newsfeed/Newsfeed$3;

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    move/from16 v2, v18

    move/from16 v3, v17

    invoke-direct {v0, v1, v2, v3}, Lcom/miniclip/newsfeed/Newsfeed$3;-><init>(Lcom/miniclip/newsfeed/Newsfeed;II)V

    invoke-virtual/range {v35 .. v36}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 353
    move-object/from16 v0, p0

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    move/from16 v35, v0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_0

    goto/16 :goto_3

    .line 208
    .end local v5    # "conn":Ljava/net/URLConnection;
    .end local v6    # "data":Ljava/lang/String;
    .end local v8    # "editorC":Landroid/content/SharedPreferences$Editor;
    .end local v9    # "editorS":Landroid/content/SharedPreferences$Editor;
    .end local v10    # "i":I
    .end local v13    # "itC":Ljava/util/Iterator;
    .end local v14    # "itS":Ljava/util/Iterator;
    .end local v15    # "line":Ljava/lang/String;
    .end local v16    # "lines":Ljava/lang/StringBuffer;
    .end local v17    # "messagesNumF":I
    .end local v18    # "messagesNumUnreadF":I
    .end local v21    # "rd":Ljava/io/BufferedReader;
    .end local v22    # "returnString":Ljava/lang/String;
    .end local v23    # "sendJSON":Lorg/json/JSONObject;
    .end local v25    # "settingsC":Landroid/content/SharedPreferences;
    .end local v26    # "settingsS":Landroid/content/SharedPreferences;
    .end local v28    # "shownIDsC":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    .end local v29    # "shownIDsS":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    .end local v32    # "statsJSON":Lorg/json/JSONArray;
    .end local v33    # "url":Ljava/net/URL;
    .end local v34    # "wr":Ljava/io/OutputStreamWriter;
    :catch_2
    move-exception v35

    goto/16 :goto_0
.end method

.method public getHTML(IZ)Ljava/lang/String;
    .locals 16
    .param p1, "i"    # I
    .param p2, "urgent"    # Z

    .prologue
    .line 375
    if-eqz p2, :cond_1

    .line 376
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesUrgent:Ljava/util/ArrayList;

    move/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONObject;

    .line 379
    .local v7, "message":Lorg/json/JSONObject;
    :goto_0
    const-string v5, ""

    .line 380
    .local v5, "htmlContent":Ljava/lang/String;
    sget-boolean v13, Lcom/miniclip/nativeJNI/cocojava;->mINGAME_LANDSCAPE:Z

    if-eqz v13, :cond_2

    .line 381
    const-string v13, "landscape_content"

    invoke-virtual {v7, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 385
    :goto_1
    const-string v13, "Newsfeed"

    invoke-static {v13, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    const-string v13, "id"

    invoke-virtual {v7, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 388
    .local v6, "id":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    const-string v14, "NewsfeedPrefsSeen"

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    .line 389
    .local v10, "settings":Landroid/content/SharedPreferences;
    if-eqz p2, :cond_3

    .line 391
    move-object/from16 v0, p0

    iget v13, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUrgent:I

    add-int/lit8 v13, v13, -0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUrgent:I

    .line 412
    :cond_0
    :goto_2
    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 413
    .local v3, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v13, "true"

    invoke-interface {v3, v6, v13}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 414
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 416
    const-string v13, "campaign"

    invoke-virtual {v7, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 417
    .local v1, "campaign":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    const-string v14, "NewsfeedPrefsSendSeen"

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v11

    .line 418
    .local v11, "settingsS":Landroid/content/SharedPreferences;
    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 419
    .local v4, "editorS":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v4, v6, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 420
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 427
    .end local v1    # "campaign":Ljava/lang/String;
    .end local v3    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v4    # "editorS":Landroid/content/SharedPreferences$Editor;
    .end local v5    # "htmlContent":Ljava/lang/String;
    .end local v6    # "id":Ljava/lang/String;
    .end local v7    # "message":Lorg/json/JSONObject;
    .end local v10    # "settings":Landroid/content/SharedPreferences;
    .end local v11    # "settingsS":Landroid/content/SharedPreferences;
    :goto_3
    return-object v5

    .line 378
    :cond_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/newsfeed/Newsfeed;->messages:Ljava/util/ArrayList;

    move/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONObject;

    .restart local v7    # "message":Lorg/json/JSONObject;
    goto :goto_0

    .line 383
    .restart local v5    # "htmlContent":Ljava/lang/String;
    :cond_2
    const-string v13, "portrait_content"

    invoke-virtual {v7, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 395
    .restart local v6    # "id":Ljava/lang/String;
    .restart local v10    # "settings":Landroid/content/SharedPreferences;
    :cond_3
    invoke-interface {v10}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v12

    .line 396
    .local v12, "shownIDs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-interface {v12, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 398
    move-object/from16 v0, p0

    iget v13, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUnread:I

    add-int/lit8 v13, v13, -0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUnread:I

    .line 399
    move-object/from16 v0, p0

    iget v9, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUnread:I

    .line 400
    .local v9, "messagesNumUnreadF":I
    move-object/from16 v0, p0

    iget v8, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    .line 401
    .local v8, "messagesNumF":I
    sget-object v13, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v14, Lcom/miniclip/newsfeed/Newsfeed$4;

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v9, v8}, Lcom/miniclip/newsfeed/Newsfeed$4;-><init>(Lcom/miniclip/newsfeed/Newsfeed;II)V

    invoke-virtual {v13, v14}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 423
    .end local v5    # "htmlContent":Ljava/lang/String;
    .end local v6    # "id":Ljava/lang/String;
    .end local v7    # "message":Lorg/json/JSONObject;
    .end local v8    # "messagesNumF":I
    .end local v9    # "messagesNumUnreadF":I
    .end local v10    # "settings":Landroid/content/SharedPreferences;
    .end local v12    # "shownIDs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    :catch_0
    move-exception v2

    .line 425
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 427
    const-string v5, ""

    goto :goto_3
.end method

.method public getLink(IZ)Ljava/lang/String;
    .locals 4
    .param p1, "i"    # I
    .param p2, "urgent"    # Z

    .prologue
    .line 446
    if-nez p2, :cond_0

    iget v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    if-lt p1, v3, :cond_0

    .line 447
    const-string v0, ""

    .line 463
    :goto_0
    return-object v0

    .line 448
    :cond_0
    if-eqz p2, :cond_1

    iget-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->messagesUrgent:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le p1, v3, :cond_1

    .line 449
    const-string v0, ""

    goto :goto_0

    .line 452
    :cond_1
    if-eqz p2, :cond_2

    .line 453
    :try_start_0
    iget-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->messagesUrgent:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    .line 456
    .local v2, "message":Lorg/json/JSONObject;
    :goto_1
    const-string v3, "upsell_link"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 457
    .local v0, "data":Ljava/lang/String;
    const-string v3, "Newsfeed"

    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 459
    .end local v0    # "data":Ljava/lang/String;
    .end local v2    # "message":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 461
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 463
    const-string v0, ""

    goto :goto_0

    .line 455
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_2
    :try_start_1
    iget-object v3, p0, Lcom/miniclip/newsfeed/Newsfeed;->messages:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .restart local v2    # "message":Lorg/json/JSONObject;
    goto :goto_1
.end method

.method public removeUrgentTimer()V
    .locals 2

    .prologue
    .line 497
    iget-object v0, p0, Lcom/miniclip/newsfeed/Newsfeed;->mDisplayHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/miniclip/newsfeed/Newsfeed;->mDisplayRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 498
    return-void
.end method

.method public setClicked(IZ)V
    .locals 9
    .param p1, "i"    # I
    .param p2, "urgent"    # Z

    .prologue
    .line 469
    if-eqz p2, :cond_0

    .line 470
    :try_start_0
    iget-object v6, p0, Lcom/miniclip/newsfeed/Newsfeed;->messagesUrgent:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    .line 473
    .local v4, "message":Lorg/json/JSONObject;
    :goto_0
    const-string v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 474
    .local v3, "id":Ljava/lang/String;
    const-string v6, "campaign"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 475
    .local v0, "campaign":Ljava/lang/String;
    iget-object v6, p0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    const-string v7, "NewsfeedPrefsSendClicked"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 476
    .local v5, "settingsS":Landroid/content/SharedPreferences;
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 477
    .local v2, "editorS":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 478
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 479
    const-string v6, "Newsfeed"

    const-string v7, "Added Stats"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    .end local v0    # "campaign":Ljava/lang/String;
    .end local v2    # "editorS":Landroid/content/SharedPreferences$Editor;
    .end local v3    # "id":Ljava/lang/String;
    .end local v4    # "message":Lorg/json/JSONObject;
    .end local v5    # "settingsS":Landroid/content/SharedPreferences;
    :goto_1
    return-void

    .line 472
    :cond_0
    iget-object v6, p0, Lcom/miniclip/newsfeed/Newsfeed;->messages:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v4    # "message":Lorg/json/JSONObject;
    goto :goto_0

    .line 480
    .end local v4    # "message":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 482
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public setPackageName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 502
    iput-object p1, p0, Lcom/miniclip/newsfeed/Newsfeed;->mPackageName:Ljava/lang/String;

    .line 504
    return-void
.end method

.method public setSandBoxMode(Z)V
    .locals 1
    .param p1, "sandBox"    # Z

    .prologue
    .line 488
    iget-boolean v0, p0, Lcom/miniclip/newsfeed/Newsfeed;->sandBoxMode:Z

    if-eq v0, p1, :cond_0

    .line 489
    iput-boolean p1, p0, Lcom/miniclip/newsfeed/Newsfeed;->sandBoxMode:Z

    .line 490
    invoke-virtual {p0}, Lcom/miniclip/newsfeed/Newsfeed;->update()I

    .line 493
    :goto_0
    return-void

    .line 492
    :cond_0
    iput-boolean p1, p0, Lcom/miniclip/newsfeed/Newsfeed;->sandBoxMode:Z

    goto :goto_0
.end method

.method public update()I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 113
    iget-object v1, p0, Lcom/miniclip/newsfeed/Newsfeed;->mContext:Landroid/content/Context;

    check-cast v1, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v1}, Lcom/miniclip/nativeJNI/cocojava;->isOnline()Z

    move-result v1

    if-nez v1, :cond_1

    .line 174
    :cond_0
    :goto_0
    return v3

    .line 115
    :cond_1
    iget v1, p0, Lcom/miniclip/newsfeed/Newsfeed;->mStatus:I

    if-nez v1, :cond_0

    .line 117
    const/4 v1, 0x1

    iput v1, p0, Lcom/miniclip/newsfeed/Newsfeed;->mStatus:I

    .line 118
    iget-object v1, p0, Lcom/miniclip/newsfeed/Newsfeed;->mDisplayHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/miniclip/newsfeed/Newsfeed;->mDisplayRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 120
    new-instance v0, Lcom/miniclip/newsfeed/Newsfeed$2;

    invoke-direct {v0, p0}, Lcom/miniclip/newsfeed/Newsfeed$2;-><init>(Lcom/miniclip/newsfeed/Newsfeed;)V

    .line 173
    .local v0, "thread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method
