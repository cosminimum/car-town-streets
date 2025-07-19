.class public Lcom/tapjoy/TapjoyVideo;
.super Ljava/lang/Object;
.source "TapjoyVideo.java"


# static fields
.field public static final TAPJOY_VIDEO:Ljava/lang/String; = "TapjoyVideo"

.field private static tapjoyVideo:Lcom/tapjoy/TapjoyVideo; = null

.field private static tapjoyVideoNotifier:Lcom/tapjoy/TapjoyVideoNotifier; = null

.field private static watermarkImage:Landroid/graphics/Bitmap; = null

.field private static final watermarkURL:Ljava/lang/String; = "https://s3.amazonaws.com/tapjoy/videos/assets/watermark.png"


# instance fields
.field private cache3g:Z

.field private cacheAuto:Z

.field private cacheWifi:Z

.field private cachedVideos:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Lcom/tapjoy/TapjoyVideoObject;",
            ">;"
        }
    .end annotation
.end field

.field context:Landroid/content/Context;

.field private imageCacheDir:Ljava/lang/String;

.field private initialized:Z

.field private uncachedVideos:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Lcom/tapjoy/TapjoyVideoObject;",
            ">;"
        }
    .end annotation
.end field

.field private videoCacheDir:Ljava/lang/String;

.field private videoCacheLimit:I

.field private videoQueue:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private videoToPlay:Lcom/tapjoy/TapjoyVideoObject;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    sput-object v0, Lcom/tapjoy/TapjoyVideo;->tapjoyVideo:Lcom/tapjoy/TapjoyVideo;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "applicationContext"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object v0, p0, Lcom/tapjoy/TapjoyVideo;->videoCacheDir:Ljava/lang/String;

    .line 54
    iput-object v0, p0, Lcom/tapjoy/TapjoyVideo;->imageCacheDir:Ljava/lang/String;

    .line 56
    const/4 v0, 0x5

    iput v0, p0, Lcom/tapjoy/TapjoyVideo;->videoCacheLimit:I

    .line 64
    iput-boolean v1, p0, Lcom/tapjoy/TapjoyVideo;->cacheAuto:Z

    .line 65
    iput-boolean v1, p0, Lcom/tapjoy/TapjoyVideo;->initialized:Z

    .line 66
    iput-boolean v1, p0, Lcom/tapjoy/TapjoyVideo;->cacheWifi:Z

    .line 67
    iput-boolean v1, p0, Lcom/tapjoy/TapjoyVideo;->cache3g:Z

    .line 80
    iput-object p1, p0, Lcom/tapjoy/TapjoyVideo;->context:Landroid/content/Context;

    .line 81
    sput-object p0, Lcom/tapjoy/TapjoyVideo;->tapjoyVideo:Lcom/tapjoy/TapjoyVideo;

    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/tjcache/data/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tapjoy/TapjoyVideo;->videoCacheDir:Ljava/lang/String;

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/tjcache/tmp/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tapjoy/TapjoyVideo;->imageCacheDir:Ljava/lang/String;

    .line 90
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/tapjoy/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/tapjoy/TapjoyUtil;->deleteFileOrDirectory(Ljava/io/File;)V

    .line 93
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/tapjoy/TapjoyVideo;->imageCacheDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/tapjoy/TapjoyUtil;->deleteFileOrDirectory(Ljava/io/File;)V

    .line 95
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/tapjoy/TapjoyVideo;->videoQueue:Ljava/util/Vector;

    .line 96
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    .line 97
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    .line 99
    invoke-virtual {p0}, Lcom/tapjoy/TapjoyVideo;->init()V

    .line 100
    return-void
.end method

.method static synthetic access$000(Lcom/tapjoy/TapjoyVideo;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/tapjoy/TapjoyVideo;->handleGetVideosResponse(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/tapjoy/TapjoyVideo;)Z
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/tapjoy/TapjoyVideo;->validateCachedVideos()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/tapjoy/TapjoyVideo;)I
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    iget v0, p0, Lcom/tapjoy/TapjoyVideo;->videoCacheLimit:I

    return v0
.end method

.method static synthetic access$1100(Lcom/tapjoy/TapjoyVideo;)Ljava/util/Vector;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/tapjoy/TapjoyVideo;->videoQueue:Ljava/util/Vector;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/tapjoy/TapjoyVideo;)Ljava/util/Hashtable;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/tapjoy/TapjoyVideo;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/tapjoy/TapjoyVideo;->cacheVideo(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/tapjoy/TapjoyVideo;)V
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/tapjoy/TapjoyVideo;->printCachedVideos()V

    return-void
.end method

.method static synthetic access$202(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0
    .param p0, "x0"    # Landroid/graphics/Bitmap;

    .prologue
    .line 47
    sput-object p0, Lcom/tapjoy/TapjoyVideo;->watermarkImage:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$300(Lcom/tapjoy/TapjoyVideo;)V
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/tapjoy/TapjoyVideo;->setVideoIDs()V

    return-void
.end method

.method static synthetic access$400(Lcom/tapjoy/TapjoyVideo;)Z
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/tapjoy/TapjoyVideo;->initialized:Z

    return v0
.end method

.method static synthetic access$402(Lcom/tapjoy/TapjoyVideo;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;
    .param p1, "x1"    # Z

    .prologue
    .line 47
    iput-boolean p1, p0, Lcom/tapjoy/TapjoyVideo;->initialized:Z

    return p1
.end method

.method static synthetic access$500(Lcom/tapjoy/TapjoyVideo;)Z
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/tapjoy/TapjoyVideo;->cacheAuto:Z

    return v0
.end method

.method static synthetic access$600(Lcom/tapjoy/TapjoyVideo;)V
    .locals 0
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/tapjoy/TapjoyVideo;->cacheAllVideos()V

    return-void
.end method

.method static synthetic access$700(Lcom/tapjoy/TapjoyVideo;)Z
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/tapjoy/TapjoyVideo;->cache3g:Z

    return v0
.end method

.method static synthetic access$800(Lcom/tapjoy/TapjoyVideo;)Z
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/tapjoy/TapjoyVideo;->cacheWifi:Z

    return v0
.end method

.method static synthetic access$900(Lcom/tapjoy/TapjoyVideo;)Ljava/util/Hashtable;
    .locals 1
    .param p0, "x0"    # Lcom/tapjoy/TapjoyVideo;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    return-object v0
.end method

.method private cacheAllVideos()V
    .locals 2

    .prologue
    .line 550
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/tapjoy/TapjoyVideo$2;

    invoke-direct {v1, p0}, Lcom/tapjoy/TapjoyVideo$2;-><init>(Lcom/tapjoy/TapjoyVideo;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 617
    return-void
.end method

.method private cacheVideo(Ljava/lang/String;)V
    .locals 27
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 642
    const-string v23, "TapjoyVideo"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "download and cache video from: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 644
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v21

    .line 646
    .local v21, "time":J
    const/4 v14, 0x0

    .line 647
    .local v14, "networkTimeout":Z
    const/4 v5, 0x0

    .line 649
    .local v5, "downloadError":Z
    const/4 v10, 0x0

    .line 650
    .local v10, "inputStream":Ljava/io/BufferedInputStream;
    const/16 v16, 0x0

    .line 652
    .local v16, "out":Ljava/io/OutputStream;
    const/4 v8, 0x0

    .line 653
    .local v8, "fileName":Ljava/lang/String;
    const/16 v18, 0x0

    .line 654
    .local v18, "path":Ljava/lang/String;
    const/16 v19, 0x0

    .line 658
    .local v19, "savedFile":Ljava/io/File;
    :try_start_0
    new-instance v9, Ljava/net/URL;

    move-object/from16 v0, p1

    invoke-direct {v9, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 659
    .local v9, "fileURL":Ljava/net/URL;
    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    .line 660
    .local v4, "connection":Ljava/net/URLConnection;
    const/16 v23, 0x3a98

    move/from16 v0, v23

    invoke-virtual {v4, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 661
    const/16 v23, 0x7530

    move/from16 v0, v23

    invoke-virtual {v4, v0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 662
    invoke-virtual {v4}, Ljava/net/URLConnection;->connect()V

    .line 664
    new-instance v11, Ljava/io/BufferedInputStream;

    invoke-virtual {v4}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-direct {v11, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 668
    .end local v10    # "inputStream":Ljava/io/BufferedInputStream;
    .local v11, "inputStream":Ljava/io/BufferedInputStream;
    :try_start_1
    new-instance v7, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideo;->videoCacheDir:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 670
    .local v7, "fileDir":Ljava/io/File;
    const/16 v23, 0x0

    const-string v24, "/"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v24

    add-int/lit8 v24, v24, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    .line 671
    const-string v23, "/"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v23

    add-int/lit8 v23, v23, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 674
    const/16 v23, 0x0

    const/16 v24, 0x2e

    move/from16 v0, v24

    invoke-virtual {v8, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v24

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v8, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 676
    const-string v23, "TapjoyVideo"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "fileDir: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 677
    const-string v23, "TapjoyVideo"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "path: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 678
    const-string v23, "TapjoyVideo"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "file name: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 682
    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    move-result v23

    if-eqz v23, :cond_0

    .line 683
    const-string v23, "TapjoyVideo"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "created directory at: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 685
    :cond_0
    new-instance v20, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideo;->videoCacheDir:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v8}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    .line 686
    .end local v19    # "savedFile":Ljava/io/File;
    .local v20, "savedFile":Ljava/io/File;
    :try_start_2
    new-instance v17, Ljava/io/FileOutputStream;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5

    .line 688
    .end local v16    # "out":Ljava/io/OutputStream;
    .local v17, "out":Ljava/io/OutputStream;
    :try_start_3
    const-string v23, "TapjoyVideo"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "downloading video file to: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 690
    const/16 v23, 0x400

    move/from16 v0, v23

    new-array v3, v0, [B

    .line 693
    .local v3, "buf":[B
    :goto_0
    invoke-virtual {v11, v3}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v13

    .local v13, "len":I
    const/16 v23, -0x1

    move/from16 v0, v23

    if-eq v13, v0, :cond_2

    .line 695
    const/16 v23, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-virtual {v0, v3, v1, v13}, Ljava/io/OutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/net/SocketTimeoutException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6

    goto :goto_0

    .line 707
    .end local v3    # "buf":[B
    .end local v13    # "len":I
    :catch_0
    move-exception v6

    move-object/from16 v19, v20

    .end local v20    # "savedFile":Ljava/io/File;
    .restart local v19    # "savedFile":Ljava/io/File;
    move-object/from16 v16, v17

    .end local v17    # "out":Ljava/io/OutputStream;
    .restart local v16    # "out":Ljava/io/OutputStream;
    move-object v10, v11

    .line 709
    .end local v4    # "connection":Ljava/net/URLConnection;
    .end local v7    # "fileDir":Ljava/io/File;
    .end local v9    # "fileURL":Ljava/net/URL;
    .end local v11    # "inputStream":Ljava/io/BufferedInputStream;
    .local v6, "e":Ljava/net/SocketTimeoutException;
    .restart local v10    # "inputStream":Ljava/io/BufferedInputStream;
    :goto_1
    const-string v23, "TapjoyVideo"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Network timeout: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual {v6}, Ljava/net/SocketTimeoutException;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 710
    const/4 v14, 0x1

    .line 711
    const/4 v5, 0x1

    .line 719
    .end local v6    # "e":Ljava/net/SocketTimeoutException;
    :goto_2
    const/16 v23, 0x1

    move/from16 v0, v23

    if-ne v14, v0, :cond_1

    .line 721
    const-string v23, "TapjoyVideo"

    const-string v24, "Network timeout"

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 726
    :try_start_4
    invoke-virtual {v10}, Ljava/io/BufferedInputStream;->close()V

    .line 727
    invoke-virtual/range {v16 .. v16}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 736
    :cond_1
    :goto_3
    if-nez v14, :cond_4

    if-nez v5, :cond_4

    .line 741
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideo;->videoQueue:Ljava/util/Vector;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-virtual/range {v23 .. v24}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 742
    .local v12, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/tapjoy/TapjoyVideoObject;

    .line 744
    .local v15, "newVideo":Lcom/tapjoy/TapjoyVideoObject;
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    iput-object v0, v15, Lcom/tapjoy/TapjoyVideoObject;->dataLocation:Ljava/lang/String;

    .line 747
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v12, v15}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 748
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 749
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideo;->videoQueue:Ljava/util/Vector;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-virtual/range {v23 .. v24}, Ljava/util/Vector;->removeElementAt(I)V

    .line 751
    invoke-direct/range {p0 .. p0}, Lcom/tapjoy/TapjoyVideo;->setVideoIDs()V

    .line 753
    const-string v23, "TapjoyVideo"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "video cached in: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v25

    sub-long v25, v25, v21

    invoke-virtual/range {v24 .. v26}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "ms"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 765
    .end local v12    # "key":Ljava/lang/String;
    .end local v15    # "newVideo":Lcom/tapjoy/TapjoyVideoObject;
    :goto_4
    return-void

    .line 698
    .end local v10    # "inputStream":Ljava/io/BufferedInputStream;
    .end local v16    # "out":Ljava/io/OutputStream;
    .end local v19    # "savedFile":Ljava/io/File;
    .restart local v3    # "buf":[B
    .restart local v4    # "connection":Ljava/net/URLConnection;
    .restart local v7    # "fileDir":Ljava/io/File;
    .restart local v9    # "fileURL":Ljava/net/URL;
    .restart local v11    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v13    # "len":I
    .restart local v17    # "out":Ljava/io/OutputStream;
    .restart local v20    # "savedFile":Ljava/io/File;
    :cond_2
    :try_start_6
    invoke-virtual/range {v17 .. v17}, Ljava/io/OutputStream;->close()V

    .line 699
    invoke-virtual {v11}, Ljava/io/BufferedInputStream;->close()V

    .line 701
    const-string v23, "TapjoyVideo"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "FILE SIZE: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->length()J

    move-result-wide v25

    invoke-virtual/range {v24 .. v26}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 704
    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->length()J
    :try_end_6
    .catch Ljava/net/SocketTimeoutException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    move-result-wide v23

    const-wide/16 v25, 0x0

    cmp-long v23, v23, v25

    if-nez v23, :cond_3

    .line 705
    const/4 v14, 0x1

    :cond_3
    move-object/from16 v19, v20

    .end local v20    # "savedFile":Ljava/io/File;
    .restart local v19    # "savedFile":Ljava/io/File;
    move-object/from16 v16, v17

    .end local v17    # "out":Ljava/io/OutputStream;
    .restart local v16    # "out":Ljava/io/OutputStream;
    move-object v10, v11

    .line 717
    .end local v11    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v10    # "inputStream":Ljava/io/BufferedInputStream;
    goto/16 :goto_2

    .line 713
    .end local v3    # "buf":[B
    .end local v4    # "connection":Ljava/net/URLConnection;
    .end local v7    # "fileDir":Ljava/io/File;
    .end local v9    # "fileURL":Ljava/net/URL;
    .end local v13    # "len":I
    :catch_1
    move-exception v6

    .line 715
    .local v6, "e":Ljava/lang/Exception;
    :goto_5
    const-string v23, "TapjoyVideo"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Error caching video file: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual {v6}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 716
    const/4 v5, 0x1

    goto/16 :goto_2

    .line 755
    .end local v6    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v6

    .line 757
    .restart local v6    # "e":Ljava/lang/Exception;
    const-string v23, "TapjoyVideo"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "error caching video ???: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual {v6}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 763
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_4
    const/16 v23, 0x2

    invoke-static/range {v23 .. v23}, Lcom/tapjoy/TapjoyVideo;->videoNotifierError(I)V

    goto :goto_4

    .line 729
    :catch_3
    move-exception v23

    goto/16 :goto_3

    .line 713
    .end local v10    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v4    # "connection":Ljava/net/URLConnection;
    .restart local v9    # "fileURL":Ljava/net/URL;
    .restart local v11    # "inputStream":Ljava/io/BufferedInputStream;
    :catch_4
    move-exception v6

    move-object v10, v11

    .end local v11    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v10    # "inputStream":Ljava/io/BufferedInputStream;
    goto :goto_5

    .end local v10    # "inputStream":Ljava/io/BufferedInputStream;
    .end local v19    # "savedFile":Ljava/io/File;
    .restart local v7    # "fileDir":Ljava/io/File;
    .restart local v11    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v20    # "savedFile":Ljava/io/File;
    :catch_5
    move-exception v6

    move-object/from16 v19, v20

    .end local v20    # "savedFile":Ljava/io/File;
    .restart local v19    # "savedFile":Ljava/io/File;
    move-object v10, v11

    .end local v11    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v10    # "inputStream":Ljava/io/BufferedInputStream;
    goto :goto_5

    .end local v10    # "inputStream":Ljava/io/BufferedInputStream;
    .end local v16    # "out":Ljava/io/OutputStream;
    .end local v19    # "savedFile":Ljava/io/File;
    .restart local v11    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v17    # "out":Ljava/io/OutputStream;
    .restart local v20    # "savedFile":Ljava/io/File;
    :catch_6
    move-exception v6

    move-object/from16 v19, v20

    .end local v20    # "savedFile":Ljava/io/File;
    .restart local v19    # "savedFile":Ljava/io/File;
    move-object/from16 v16, v17

    .end local v17    # "out":Ljava/io/OutputStream;
    .restart local v16    # "out":Ljava/io/OutputStream;
    move-object v10, v11

    .end local v11    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v10    # "inputStream":Ljava/io/BufferedInputStream;
    goto :goto_5

    .line 707
    .end local v4    # "connection":Ljava/net/URLConnection;
    .end local v7    # "fileDir":Ljava/io/File;
    .end local v9    # "fileURL":Ljava/net/URL;
    :catch_7
    move-exception v6

    goto/16 :goto_1

    .end local v10    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v4    # "connection":Ljava/net/URLConnection;
    .restart local v9    # "fileURL":Ljava/net/URL;
    .restart local v11    # "inputStream":Ljava/io/BufferedInputStream;
    :catch_8
    move-exception v6

    move-object v10, v11

    .end local v11    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v10    # "inputStream":Ljava/io/BufferedInputStream;
    goto/16 :goto_1

    .end local v10    # "inputStream":Ljava/io/BufferedInputStream;
    .end local v19    # "savedFile":Ljava/io/File;
    .restart local v7    # "fileDir":Ljava/io/File;
    .restart local v11    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v20    # "savedFile":Ljava/io/File;
    :catch_9
    move-exception v6

    move-object/from16 v19, v20

    .end local v20    # "savedFile":Ljava/io/File;
    .restart local v19    # "savedFile":Ljava/io/File;
    move-object v10, v11

    .end local v11    # "inputStream":Ljava/io/BufferedInputStream;
    .restart local v10    # "inputStream":Ljava/io/BufferedInputStream;
    goto/16 :goto_1
.end method

.method public static getInstance()Lcom/tapjoy/TapjoyVideo;
    .locals 1

    .prologue
    .line 109
    sget-object v0, Lcom/tapjoy/TapjoyVideo;->tapjoyVideo:Lcom/tapjoy/TapjoyVideo;

    return-object v0
.end method

.method public static getWatermarkImage()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 923
    sget-object v0, Lcom/tapjoy/TapjoyVideo;->watermarkImage:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method private handleGetVideosResponse(Ljava/lang/String;)Z
    .locals 27
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 271
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v9

    .line 274
    .local v9, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const-string v24, "TapjoyVideo"

    const-string v25, "========================================"

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    :try_start_0
    new-instance v11, Ljava/io/ByteArrayInputStream;

    const-string v24, "UTF-8"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v24

    move-object/from16 v0, v24

    invoke-direct {v11, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 281
    .local v11, "is":Ljava/io/InputStream;
    invoke-virtual {v9}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v6

    .line 282
    .local v6, "documentBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v6, v11}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v5

    .line 285
    .local v5, "document":Lorg/w3c/dom/Document;
    invoke-interface {v5}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Element;->normalize()V

    .line 287
    const-string v24, "TapjoyVideos"

    move-object/from16 v0, v24

    invoke-interface {v5, v0}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v19

    .line 288
    .local v19, "nodelistParent":Lorg/w3c/dom/NodeList;
    const/16 v24, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v18

    .line 292
    .local v18, "nodelist":Lorg/w3c/dom/NodeList;
    const/16 v24, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v17

    .line 295
    .local v17, "nodeMap":Lorg/w3c/dom/NamedNodeMap;
    const-string v24, "cache_auto"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v24

    if-eqz v24, :cond_0

    .line 296
    const-string v24, "cache_auto"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v24

    if-eqz v24, :cond_0

    .line 297
    const-string v24, "cache_auto"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/tapjoy/TapjoyVideo;->cacheAuto:Z

    .line 300
    :cond_0
    const-string v24, "cache_wifi"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v24

    if-eqz v24, :cond_1

    .line 301
    const-string v24, "cache_wifi"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v24

    if-eqz v24, :cond_1

    .line 302
    const-string v24, "cache_wifi"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/tapjoy/TapjoyVideo;->cacheWifi:Z

    .line 305
    :cond_1
    const-string v24, "cache_mobile"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v24

    if-eqz v24, :cond_2

    .line 306
    const-string v24, "cache_mobile"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v24

    if-eqz v24, :cond_2

    .line 307
    const-string v24, "cache_mobile"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/tapjoy/TapjoyVideo;->cache3g:Z

    .line 309
    :cond_2
    const-string v24, "TapjoyVideo"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "cacheAuto: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/tapjoy/TapjoyVideo;->cacheAuto:Z

    move/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    const-string v24, "TapjoyVideo"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "cacheWifi: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/tapjoy/TapjoyVideo;->cacheWifi:Z

    move/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    const-string v24, "TapjoyVideo"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "cache3g: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/tapjoy/TapjoyVideo;->cache3g:Z

    move/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    const-string v24, "TapjoyVideo"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "nodelistParent length: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-interface/range {v19 .. v19}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    const-string v24, "TapjoyVideo"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "nodelist length: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-interface/range {v18 .. v18}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    invoke-interface/range {v18 .. v18}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v24

    move/from16 v0, v24

    if-ge v10, v0, :cond_10

    .line 318
    move-object/from16 v0, v18

    invoke-interface {v0, v10}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v16

    .line 321
    .local v16, "node":Lorg/w3c/dom/Node;
    new-instance v23, Lcom/tapjoy/TapjoyVideoObject;

    invoke-direct/range {v23 .. v23}, Lcom/tapjoy/TapjoyVideoObject;-><init>()V

    .line 323
    .local v23, "videoObject":Lcom/tapjoy/TapjoyVideoObject;
    if-eqz v16, :cond_f

    invoke-interface/range {v16 .. v16}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v24

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_f

    .line 325
    move-object/from16 v0, v16

    check-cast v0, Lorg/w3c/dom/Element;

    move-object v8, v0

    .line 328
    .local v8, "element":Lorg/w3c/dom/Element;
    const-string v24, "ClickURL"

    move-object/from16 v0, v24

    invoke-interface {v8, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/tapjoy/TapjoyUtil;->getNodeTrimValue(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v22

    .line 329
    .local v22, "value":Ljava/lang/String;
    if-eqz v22, :cond_3

    const-string v24, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_3

    .line 330
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    iput-object v0, v1, Lcom/tapjoy/TapjoyVideoObject;->clickURL:Ljava/lang/String;

    .line 332
    :cond_3
    const-string v24, "OfferID"

    move-object/from16 v0, v24

    invoke-interface {v8, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/tapjoy/TapjoyUtil;->getNodeTrimValue(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v22

    .line 333
    if-eqz v22, :cond_4

    const-string v24, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_4

    .line 334
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    iput-object v0, v1, Lcom/tapjoy/TapjoyVideoObject;->offerID:Ljava/lang/String;

    .line 336
    :cond_4
    const-string v24, "Name"

    move-object/from16 v0, v24

    invoke-interface {v8, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/tapjoy/TapjoyUtil;->getNodeTrimValue(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v22

    .line 337
    if-eqz v22, :cond_5

    const-string v24, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_5

    .line 338
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    iput-object v0, v1, Lcom/tapjoy/TapjoyVideoObject;->videoAdName:Ljava/lang/String;

    .line 340
    :cond_5
    const-string v24, "Amount"

    move-object/from16 v0, v24

    invoke-interface {v8, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/tapjoy/TapjoyUtil;->getNodeTrimValue(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v22

    .line 341
    if-eqz v22, :cond_6

    const-string v24, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_6

    .line 342
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    iput-object v0, v1, Lcom/tapjoy/TapjoyVideoObject;->currencyAmount:Ljava/lang/String;

    .line 344
    :cond_6
    const-string v24, "CurrencyName"

    move-object/from16 v0, v24

    invoke-interface {v8, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/tapjoy/TapjoyUtil;->getNodeTrimValue(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v22

    .line 345
    if-eqz v22, :cond_7

    const-string v24, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_7

    .line 346
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    iput-object v0, v1, Lcom/tapjoy/TapjoyVideoObject;->currencyName:Ljava/lang/String;

    .line 348
    :cond_7
    const-string v24, "VideoURL"

    move-object/from16 v0, v24

    invoke-interface {v8, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/tapjoy/TapjoyUtil;->getNodeTrimValue(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v22

    .line 349
    if-eqz v22, :cond_8

    const-string v24, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_8

    .line 350
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    iput-object v0, v1, Lcom/tapjoy/TapjoyVideoObject;->videoURL:Ljava/lang/String;

    .line 352
    :cond_8
    const-string v24, "IconURL"

    move-object/from16 v0, v24

    invoke-interface {v8, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/tapjoy/TapjoyUtil;->getNodeTrimValue(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v22

    .line 353
    if-eqz v22, :cond_9

    const-string v24, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_9

    .line 354
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    iput-object v0, v1, Lcom/tapjoy/TapjoyVideoObject;->iconURL:Ljava/lang/String;

    .line 356
    :cond_9
    const-string v24, "TapjoyVideo"

    const-string v25, "-----"

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    const-string v24, "TapjoyVideo"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "videoObject.offerID: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideoObject;->offerID:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    const-string v24, "TapjoyVideo"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "videoObject.videoAdName: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideoObject;->videoAdName:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    const-string v24, "TapjoyVideo"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "videoObject.videoURL: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideoObject;->videoURL:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    const-string v24, "Buttons"

    move-object/from16 v0, v24

    invoke-interface {v8, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 366
    .local v3, "buttonData":Lorg/w3c/dom/NodeList;
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-interface {v3, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v12

    .line 371
    .local v12, "itemNodeList":Lorg/w3c/dom/NodeList;
    const/4 v13, 0x0

    .local v13, "j":I
    :goto_1
    invoke-interface {v12}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v24

    move/from16 v0, v24

    if-ge v13, v0, :cond_e

    .line 374
    invoke-interface {v12, v13}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    .line 377
    .local v4, "child":Lorg/w3c/dom/NodeList;
    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v24

    if-nez v24, :cond_a

    .line 371
    :goto_2
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 385
    :cond_a
    const-string v15, ""

    .line 386
    .local v15, "name":Ljava/lang/String;
    const-string v21, ""

    .line 388
    .local v21, "url":Ljava/lang/String;
    const/4 v14, 0x0

    .local v14, "k":I
    :goto_3
    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v24

    move/from16 v0, v24

    if-ge v14, v0, :cond_d

    .line 390
    invoke-interface {v4, v14}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v24

    check-cast v24, Lorg/w3c/dom/Element;

    if-eqz v24, :cond_b

    .line 392
    invoke-interface {v4, v14}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v24

    check-cast v24, Lorg/w3c/dom/Element;

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v20

    .line 395
    .local v20, "tagName":Ljava/lang/String;
    const-string v24, "Name"

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_c

    invoke-interface {v4, v14}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v24

    if-eqz v24, :cond_c

    .line 397
    invoke-interface {v4, v14}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v15

    .line 388
    .end local v20    # "tagName":Ljava/lang/String;
    :cond_b
    :goto_4
    add-int/lit8 v14, v14, 0x1

    goto :goto_3

    .line 401
    .restart local v20    # "tagName":Ljava/lang/String;
    :cond_c
    const-string v24, "URL"

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_b

    invoke-interface {v4, v14}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v24

    if-eqz v24, :cond_b

    .line 403
    invoke-interface {v4, v14}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v21

    goto :goto_4

    .line 408
    .end local v20    # "tagName":Ljava/lang/String;
    :cond_d
    const-string v24, "TapjoyVideo"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "name: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ", url: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v15, v1}, Lcom/tapjoy/TapjoyVideoObject;->addButton(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_2

    .line 419
    .end local v3    # "buttonData":Lorg/w3c/dom/NodeList;
    .end local v4    # "child":Lorg/w3c/dom/NodeList;
    .end local v5    # "document":Lorg/w3c/dom/Document;
    .end local v6    # "documentBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v8    # "element":Lorg/w3c/dom/Element;
    .end local v10    # "i":I
    .end local v11    # "is":Ljava/io/InputStream;
    .end local v12    # "itemNodeList":Lorg/w3c/dom/NodeList;
    .end local v13    # "j":I
    .end local v14    # "k":I
    .end local v15    # "name":Ljava/lang/String;
    .end local v16    # "node":Lorg/w3c/dom/Node;
    .end local v17    # "nodeMap":Lorg/w3c/dom/NamedNodeMap;
    .end local v18    # "nodelist":Lorg/w3c/dom/NodeList;
    .end local v19    # "nodelistParent":Lorg/w3c/dom/NodeList;
    .end local v21    # "url":Ljava/lang/String;
    .end local v22    # "value":Ljava/lang/String;
    .end local v23    # "videoObject":Lcom/tapjoy/TapjoyVideoObject;
    :catch_0
    move-exception v7

    .line 421
    .local v7, "e":Ljava/lang/Exception;
    const-string v24, "TapjoyVideo"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Error parsing XML: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    const/16 v24, 0x0

    .line 427
    .end local v7    # "e":Ljava/lang/Exception;
    :goto_5
    return v24

    .line 414
    .restart local v3    # "buttonData":Lorg/w3c/dom/NodeList;
    .restart local v5    # "document":Lorg/w3c/dom/Document;
    .restart local v6    # "documentBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v8    # "element":Lorg/w3c/dom/Element;
    .restart local v10    # "i":I
    .restart local v11    # "is":Ljava/io/InputStream;
    .restart local v12    # "itemNodeList":Lorg/w3c/dom/NodeList;
    .restart local v13    # "j":I
    .restart local v16    # "node":Lorg/w3c/dom/Node;
    .restart local v17    # "nodeMap":Lorg/w3c/dom/NamedNodeMap;
    .restart local v18    # "nodelist":Lorg/w3c/dom/NodeList;
    .restart local v19    # "nodelistParent":Lorg/w3c/dom/NodeList;
    .restart local v22    # "value":Ljava/lang/String;
    .restart local v23    # "videoObject":Lcom/tapjoy/TapjoyVideoObject;
    :cond_e
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideo;->videoQueue:Ljava/util/Vector;

    move-object/from16 v24, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideoObject;->offerID:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 415
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    move-object/from16 v24, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/tapjoy/TapjoyVideoObject;->offerID:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 316
    .end local v3    # "buttonData":Lorg/w3c/dom/NodeList;
    .end local v8    # "element":Lorg/w3c/dom/Element;
    .end local v12    # "itemNodeList":Lorg/w3c/dom/NodeList;
    .end local v13    # "j":I
    .end local v22    # "value":Ljava/lang/String;
    :cond_f
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 425
    .end local v16    # "node":Lorg/w3c/dom/Node;
    .end local v23    # "videoObject":Lcom/tapjoy/TapjoyVideoObject;
    :cond_10
    const-string v24, "TapjoyVideo"

    const-string v25, "========================================"

    invoke-static/range {v24 .. v25}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 427
    const/16 v24, 0x1

    goto :goto_5
.end method

.method private printCachedVideos()V
    .locals 6

    .prologue
    .line 622
    const-string v3, "TapjoyVideo"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cachedVideos size: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v5}, Ljava/util/Hashtable;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    iget-object v3, p0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 626
    .local v0, "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/tapjoy/TapjoyVideoObject;>;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 628
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/tapjoy/TapjoyVideoObject;>;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 630
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 631
    .local v1, "item":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/tapjoy/TapjoyVideoObject;>;"
    const-string v4, "TapjoyVideo"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "key: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ", name: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/tapjoy/TapjoyVideoObject;

    iget-object v3, v3, Lcom/tapjoy/TapjoyVideoObject;->videoAdName:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 633
    .end local v1    # "item":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/tapjoy/TapjoyVideoObject;>;"
    :cond_0
    return-void
.end method

.method private setVideoIDs()V
    .locals 6

    .prologue
    .line 773
    const-string v2, ""

    .line 775
    .local v2, "videoIDs":Ljava/lang/String;
    iget-object v3, p0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 777
    iget-object v3, p0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 779
    .local v1, "keys":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 781
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 782
    .local v0, "key":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 784
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 785
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 788
    .end local v0    # "key":Ljava/lang/String;
    :cond_1
    const-string v3, "TapjoyVideo"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cachedVideos size: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v5}, Ljava/util/Hashtable;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 791
    .end local v1    # "keys":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :cond_2
    const-string v3, "TapjoyVideo"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "videoIDs: ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 792
    invoke-static {v2}, Lcom/tapjoy/TapjoyConnectCore;->setVideoIDs(Ljava/lang/String;)V

    .line 793
    return-void
.end method

.method private validateCachedVideos()Z
    .locals 11

    .prologue
    .line 798
    const/4 v5, 0x0

    .line 799
    .local v5, "success":Z
    const/4 v4, 0x1

    .line 802
    .local v4, "proceed":Z
    new-instance v7, Ljava/io/File;

    iget-object v8, p0, Lcom/tapjoy/TapjoyVideo;->videoCacheDir:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 804
    .local v0, "cachedFilesOnDisk":[Ljava/io/File;
    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    if-nez v7, :cond_0

    .line 806
    const-string v7, "TapjoyVideo"

    const-string v8, "Error: uncachedVideos is null"

    invoke-static {v7, v8}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 807
    const/4 v4, 0x0

    .line 810
    :cond_0
    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    if-nez v7, :cond_1

    .line 812
    const-string v7, "TapjoyVideo"

    const-string v8, "Error: cachedVideos is null"

    invoke-static {v7, v8}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 813
    const/4 v4, 0x0

    .line 816
    :cond_1
    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->videoQueue:Ljava/util/Vector;

    if-nez v7, :cond_2

    .line 818
    const-string v7, "TapjoyVideo"

    const-string v8, "Error: videoQueue is null"

    invoke-static {v7, v8}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 819
    const/4 v4, 0x0

    .line 823
    :cond_2
    if-eqz v4, :cond_7

    if-eqz v0, :cond_7

    .line 826
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v7, v0

    if-ge v2, v7, :cond_6

    .line 828
    aget-object v7, v0, v2

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 831
    .local v3, "key":Ljava/lang/String;
    const-string v7, "TapjoyVideo"

    const-string v8, "-----"

    invoke-static {v7, v8}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 832
    const-string v7, "TapjoyVideo"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Examining cached file["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v0, v2

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " --- "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v0, v2

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 837
    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v7, v3}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 839
    const-string v7, "TapjoyVideo"

    const-string v8, "Local file found"

    invoke-static {v7, v8}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 841
    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v7, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/tapjoy/TapjoyVideoObject;

    .line 843
    .local v6, "videoObject":Lcom/tapjoy/TapjoyVideoObject;
    if-nez v6, :cond_3

    .line 845
    const/4 v5, 0x0

    .line 826
    .end local v6    # "videoObject":Lcom/tapjoy/TapjoyVideoObject;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 849
    .restart local v6    # "videoObject":Lcom/tapjoy/TapjoyVideoObject;
    :cond_3
    new-instance v7, Lcom/tapjoy/TapjoyURLConnection;

    invoke-direct {v7}, Lcom/tapjoy/TapjoyURLConnection;-><init>()V

    iget-object v8, v6, Lcom/tapjoy/TapjoyVideoObject;->videoURL:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/tapjoy/TapjoyURLConnection;->getContentLength(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 851
    .local v1, "contentLength":Ljava/lang/String;
    const-string v7, "TapjoyVideo"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "local file size: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v0, v2

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v9

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " vs. target: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 854
    if-eqz v1, :cond_4

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    int-to-long v7, v7

    aget-object v9, v0, v2

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-nez v7, :cond_4

    .line 856
    aget-object v7, v0, v2

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/tapjoy/TapjoyVideoObject;->dataLocation:Ljava/lang/String;

    .line 857
    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v7, v3, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 858
    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v7, v3}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 859
    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->videoQueue:Ljava/util/Vector;

    invoke-virtual {v7, v3}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 861
    const-string v7, "TapjoyVideo"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "VIDEO PREVIOUSLY CACHED -- "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", location: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v6, Lcom/tapjoy/TapjoyVideoObject;->dataLocation:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 866
    :cond_4
    const-string v7, "TapjoyVideo"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "file size mismatch --- deleting video: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v0, v2

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 867
    aget-object v7, v0, v2

    invoke-static {v7}, Lcom/tapjoy/TapjoyUtil;->deleteFileOrDirectory(Ljava/io/File;)V

    goto/16 :goto_1

    .line 874
    .end local v1    # "contentLength":Ljava/lang/String;
    .end local v6    # "videoObject":Lcom/tapjoy/TapjoyVideoObject;
    :cond_5
    const-string v7, "TapjoyVideo"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "VIDEO EXPIRED? removing video from cache: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " --- "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v0, v2

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 875
    aget-object v7, v0, v2

    invoke-static {v7}, Lcom/tapjoy/TapjoyUtil;->deleteFileOrDirectory(Ljava/io/File;)V

    goto/16 :goto_1

    .line 879
    .end local v3    # "key":Ljava/lang/String;
    :cond_6
    const/4 v5, 0x1

    .line 882
    .end local v2    # "i":I
    :cond_7
    return v5
.end method

.method public static videoNotifierComplete()V
    .locals 1

    .prologue
    .line 912
    sget-object v0, Lcom/tapjoy/TapjoyVideo;->tapjoyVideoNotifier:Lcom/tapjoy/TapjoyVideoNotifier;

    if-eqz v0, :cond_0

    .line 913
    sget-object v0, Lcom/tapjoy/TapjoyVideo;->tapjoyVideoNotifier:Lcom/tapjoy/TapjoyVideoNotifier;

    invoke-interface {v0}, Lcom/tapjoy/TapjoyVideoNotifier;->videoComplete()V

    .line 914
    :cond_0
    return-void
.end method

.method public static videoNotifierError(I)V
    .locals 1
    .param p0, "error"    # I

    .prologue
    .line 892
    sget-object v0, Lcom/tapjoy/TapjoyVideo;->tapjoyVideoNotifier:Lcom/tapjoy/TapjoyVideoNotifier;

    if-eqz v0, :cond_0

    .line 893
    sget-object v0, Lcom/tapjoy/TapjoyVideo;->tapjoyVideoNotifier:Lcom/tapjoy/TapjoyVideoNotifier;

    invoke-interface {v0, p0}, Lcom/tapjoy/TapjoyVideoNotifier;->videoError(I)V

    .line 894
    :cond_0
    return-void
.end method

.method public static videoNotifierReady()V
    .locals 1

    .prologue
    .line 902
    sget-object v0, Lcom/tapjoy/TapjoyVideo;->tapjoyVideoNotifier:Lcom/tapjoy/TapjoyVideoNotifier;

    if-eqz v0, :cond_0

    .line 903
    sget-object v0, Lcom/tapjoy/TapjoyVideo;->tapjoyVideoNotifier:Lcom/tapjoy/TapjoyVideoNotifier;

    invoke-interface {v0}, Lcom/tapjoy/TapjoyVideoNotifier;->videoReady()V

    .line 904
    :cond_0
    return-void
.end method


# virtual methods
.method public enableVideoCache(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .prologue
    .line 132
    return-void
.end method

.method public getCurrentVideoData()Lcom/tapjoy/TapjoyVideoObject;
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    return-object v0
.end method

.method public init()V
    .locals 3

    .prologue
    .line 173
    const-string v0, "TapjoyVideo"

    const-string v1, "initVideoAd"

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    const-string v0, "disable_video_offers"

    invoke-static {v0}, Lcom/tapjoy/TapjoyConnectCore;->getFlagValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "disable_video_offers"

    invoke-static {v0}, Lcom/tapjoy/TapjoyConnectCore;->getFlagValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "true"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 178
    const-string v0, "TapjoyVideo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "disable_video_offers: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "disable_video_offers"

    invoke-static {v2}, Lcom/tapjoy/TapjoyConnectCore;->getFlagValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". Aborting video initializing... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/tapjoy/TapjoyConnectCore;->setVideoEnabled(Z)V

    .line 261
    :goto_0
    return-void

    .line 184
    :cond_0
    invoke-direct {p0}, Lcom/tapjoy/TapjoyVideo;->setVideoIDs()V

    .line 187
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/tapjoy/TapjoyVideo$1;

    invoke-direct {v1, p0}, Lcom/tapjoy/TapjoyVideo$1;-><init>(Lcom/tapjoy/TapjoyVideo;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 260
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/tapjoy/TapjoyConnectCore;->setVideoEnabled(Z)V

    goto :goto_0
.end method

.method public initVideoAd(Lcom/tapjoy/TapjoyVideoNotifier;)V
    .locals 1
    .param p1, "notifier"    # Lcom/tapjoy/TapjoyVideoNotifier;

    .prologue
    .line 141
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/tapjoy/TapjoyVideo;->initVideoAd(Lcom/tapjoy/TapjoyVideoNotifier;Z)V

    .line 142
    return-void
.end method

.method public initVideoAd(Lcom/tapjoy/TapjoyVideoNotifier;Z)V
    .locals 2
    .param p1, "notifier"    # Lcom/tapjoy/TapjoyVideoNotifier;
    .param p2, "skipCaching"    # Z

    .prologue
    .line 152
    sput-object p1, Lcom/tapjoy/TapjoyVideo;->tapjoyVideoNotifier:Lcom/tapjoy/TapjoyVideoNotifier;

    .line 154
    if-nez p1, :cond_0

    .line 156
    const-string v0, "TapjoyVideo"

    const-string v1, "Error during initVideoAd -- TapjoyVideoNotifier is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    :goto_0
    return-void

    .line 161
    :cond_0
    iget-boolean v0, p0, Lcom/tapjoy/TapjoyVideo;->initialized:Z

    if-eqz v0, :cond_1

    .line 162
    invoke-static {}, Lcom/tapjoy/TapjoyVideo;->videoNotifierReady()V

    .line 164
    :cond_1
    invoke-direct {p0}, Lcom/tapjoy/TapjoyVideo;->cacheAllVideos()V

    goto :goto_0
.end method

.method public setVideoCacheCount(I)V
    .locals 0
    .param p1, "count"    # I

    .prologue
    .line 119
    iput p1, p0, Lcom/tapjoy/TapjoyVideo;->videoCacheLimit:I

    .line 120
    return-void
.end method

.method public startVideo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8
    .param p1, "videoID"    # Ljava/lang/String;
    .param p2, "currencyName"    # Ljava/lang/String;
    .param p3, "currencyAmount"    # Ljava/lang/String;
    .param p4, "clickURL"    # Ljava/lang/String;
    .param p5, "webviewURL"    # Ljava/lang/String;
    .param p6, "videoURL"    # Ljava/lang/String;

    .prologue
    .line 447
    const/4 v0, 0x1

    .line 448
    .local v0, "cachedVideo":Z
    const-string v5, "TapjoyVideo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Starting video activity with video: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 451
    if-eqz p1, :cond_0

    if-eqz p4, :cond_0

    if-eqz p5, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_1

    .line 453
    :cond_0
    const-string v5, "TapjoyVideo"

    const-string v6, "aborting video playback... invalid or missing parameter"

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    const/4 v5, 0x0

    .line 541
    :goto_0
    return v5

    .line 457
    :cond_1
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->cachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v5, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/tapjoy/TapjoyVideoObject;

    iput-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    .line 459
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    .line 462
    .local v2, "state":Ljava/lang/String;
    const-string v5, "mounted"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 464
    const-string v5, "TapjoyVideo"

    const-string v6, "Cannot access external storage"

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    const/4 v5, 0x1

    invoke-static {v5}, Lcom/tapjoy/TapjoyVideo;->videoNotifierError(I)V

    .line 468
    const/4 v5, 0x0

    goto :goto_0

    .line 472
    :cond_2
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    if-nez v5, :cond_4

    .line 474
    const-string v5, "TapjoyVideo"

    const-string v6, "video not cached... checking uncached videos"

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v5, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/tapjoy/TapjoyVideoObject;

    iput-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    .line 479
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    if-nez v5, :cond_3

    .line 482
    if-eqz p6, :cond_6

    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_6

    .line 485
    new-instance v1, Lcom/tapjoy/TapjoyVideoObject;

    invoke-direct {v1}, Lcom/tapjoy/TapjoyVideoObject;-><init>()V

    .line 486
    .local v1, "newVideo":Lcom/tapjoy/TapjoyVideoObject;
    iput-object p1, v1, Lcom/tapjoy/TapjoyVideoObject;->offerID:Ljava/lang/String;

    .line 487
    iput-object p2, v1, Lcom/tapjoy/TapjoyVideoObject;->currencyName:Ljava/lang/String;

    .line 488
    iput-object p3, v1, Lcom/tapjoy/TapjoyVideoObject;->currencyAmount:Ljava/lang/String;

    .line 489
    iput-object p4, v1, Lcom/tapjoy/TapjoyVideoObject;->clickURL:Ljava/lang/String;

    .line 490
    iput-object p5, v1, Lcom/tapjoy/TapjoyVideoObject;->webviewURL:Ljava/lang/String;

    .line 491
    iput-object p6, v1, Lcom/tapjoy/TapjoyVideoObject;->videoURL:Ljava/lang/String;

    .line 492
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v5, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->uncachedVideos:Ljava/util/Hashtable;

    invoke-virtual {v5, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/tapjoy/TapjoyVideoObject;

    iput-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    .line 504
    .end local v1    # "newVideo":Lcom/tapjoy/TapjoyVideoObject;
    :cond_3
    const/4 v0, 0x0

    .line 507
    :cond_4
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iput-object p2, v5, Lcom/tapjoy/TapjoyVideoObject;->currencyName:Ljava/lang/String;

    .line 508
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iput-object p3, v5, Lcom/tapjoy/TapjoyVideoObject;->currencyAmount:Ljava/lang/String;

    .line 509
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iput-object p4, v5, Lcom/tapjoy/TapjoyVideoObject;->clickURL:Ljava/lang/String;

    .line 510
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iput-object p5, v5, Lcom/tapjoy/TapjoyVideoObject;->webviewURL:Ljava/lang/String;

    .line 511
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iput-object p6, v5, Lcom/tapjoy/TapjoyVideoObject;->videoURL:Ljava/lang/String;

    .line 513
    const-string v5, "TapjoyVideo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "videoToPlay: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iget-object v7, v7, Lcom/tapjoy/TapjoyVideoObject;->offerID:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 514
    const-string v5, "TapjoyVideo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "amount: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iget-object v7, v7, Lcom/tapjoy/TapjoyVideoObject;->currencyAmount:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 515
    const-string v5, "TapjoyVideo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "currency: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iget-object v7, v7, Lcom/tapjoy/TapjoyVideoObject;->currencyName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    const-string v5, "TapjoyVideo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "clickURL: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iget-object v7, v7, Lcom/tapjoy/TapjoyVideoObject;->clickURL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 517
    const-string v5, "TapjoyVideo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "location: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iget-object v7, v7, Lcom/tapjoy/TapjoyVideoObject;->dataLocation:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    const-string v5, "TapjoyVideo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "webviewURL: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iget-object v7, v7, Lcom/tapjoy/TapjoyVideoObject;->webviewURL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    const-string v5, "TapjoyVideo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "videoURL: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iget-object v7, v7, Lcom/tapjoy/TapjoyVideoObject;->videoURL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 522
    if-eqz v0, :cond_7

    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iget-object v5, v5, Lcom/tapjoy/TapjoyVideoObject;->dataLocation:Ljava/lang/String;

    if-eqz v5, :cond_7

    .line 524
    new-instance v3, Ljava/io/File;

    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->videoToPlay:Lcom/tapjoy/TapjoyVideoObject;

    iget-object v5, v5, Lcom/tapjoy/TapjoyVideoObject;->dataLocation:Ljava/lang/String;

    invoke-direct {v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 527
    .local v3, "video":Ljava/io/File;
    if-eqz v3, :cond_5

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_7

    .line 529
    :cond_5
    const-string v5, "TapjoyVideo"

    const-string v6, "video file does not exist."

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 498
    .end local v3    # "video":Ljava/io/File;
    :cond_6
    const-string v5, "TapjoyVideo"

    const-string v6, "no video data and no video url - aborting playback..."

    invoke-static {v5, v6}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 534
    :cond_7
    new-instance v4, Landroid/content/Intent;

    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->context:Landroid/content/Context;

    const-class v6, Lcom/tapjoy/TapjoyVideoView;

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 535
    .local v4, "videoIntent":Landroid/content/Intent;
    const/high16 v5, 0x10000000

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 538
    const-string v5, "VIDEO_PATH"

    invoke-virtual {v4, v5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 539
    iget-object v5, p0, Lcom/tapjoy/TapjoyVideo;->context:Landroid/content/Context;

    invoke-virtual {v5, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 541
    const/4 v5, 0x1

    goto/16 :goto_0
.end method
