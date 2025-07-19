.class public Lcom/miniclip/nativeJNI/cocosound;
.super Ljava/lang/Object;
.source "cocosound.java"


# static fields
.field private static MAX_SIMULTANEOUS_STREAMS_DEFAULT:I = 0x0

.field public static final SOUND_LOOP_TIME:I = 0x0

.field private static final SOUND_QUALITY:I = 0x5

.field public static final SOUND_RATE:F = 1.0f

.field private static final TAG:Ljava/lang/String; = "Cocos2dxSound"


# instance fields
.field private GS2MODE:Z

.field private final INVALID_SOUND_ID:I

.field private final INVALID_STREAM_ID:I

.field public final SOUND_PRIORITY:I

.field private mContext:Landroid/content/Context;

.field public mLeftVolume:F

.field private mPathSoundIDMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public mRightVolume:F

.field private mSoundIdStreamIdMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mSoundPool:Landroid/media/SoundPool;

.field private mSounds2Play:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private playHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const/16 v0, 0xa

    sput v0, Lcom/miniclip/nativeJNI/cocosound;->MAX_SIMULTANEOUS_STREAMS_DEFAULT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, -0x1

    const/4 v3, 0x1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->mSounds2Play:Ljava/util/Vector;

    .line 32
    iput v3, p0, Lcom/miniclip/nativeJNI/cocosound;->SOUND_PRIORITY:I

    .line 36
    iput v1, p0, Lcom/miniclip/nativeJNI/cocosound;->INVALID_SOUND_ID:I

    .line 37
    iput v1, p0, Lcom/miniclip/nativeJNI/cocosound;->INVALID_STREAM_ID:I

    .line 41
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->playHandler:Landroid/os/Handler;

    .line 44
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocosound;->mContext:Landroid/content/Context;

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/cocosound;->GS2MODE:Z

    .line 46
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "GT-I9100"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-ge v0, v1, :cond_0

    .line 48
    const-string v0, "cocosound"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "phone is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " enabling single stream soundpool"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    sput v3, Lcom/miniclip/nativeJNI/cocosound;->MAX_SIMULTANEOUS_STREAMS_DEFAULT:I

    .line 50
    iput-boolean v3, p0, Lcom/miniclip/nativeJNI/cocosound;->GS2MODE:Z

    .line 52
    :cond_0
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/cocosound;->initData()V

    .line 53
    return-void
.end method

.method static synthetic access$000(Lcom/miniclip/nativeJNI/cocosound;)Ljava/util/Vector;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/cocosound;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->mSounds2Play:Ljava/util/Vector;

    return-object v0
.end method

.method static synthetic access$100(Lcom/miniclip/nativeJNI/cocosound;)Landroid/media/SoundPool;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/cocosound;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    return-object v0
.end method

.method static synthetic access$200(Lcom/miniclip/nativeJNI/cocosound;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/cocosound;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundIdStreamIdMap:Ljava/util/HashMap;

    return-object v0
.end method

.method private initData()V
    .locals 5

    .prologue
    const/high16 v4, 0x3f000000    # 0.5f

    .line 339
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundIdStreamIdMap:Ljava/util/HashMap;

    .line 340
    new-instance v0, Landroid/media/SoundPool;

    sget v1, Lcom/miniclip/nativeJNI/cocosound;->MAX_SIMULTANEOUS_STREAMS_DEFAULT:I

    const/4 v2, 0x3

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    .line 341
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->mPathSoundIDMap:Ljava/util/HashMap;

    .line 343
    iput v4, p0, Lcom/miniclip/nativeJNI/cocosound;->mLeftVolume:F

    .line 344
    iput v4, p0, Lcom/miniclip/nativeJNI/cocosound;->mRightVolume:F

    .line 345
    return-void
.end method


# virtual methods
.method public createSoundIdFromAsset(Ljava/lang/String;)I
    .locals 9
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 294
    const/4 v4, -0x1

    .line 299
    .local v4, "soundId":I
    :try_start_0
    iget-object v5, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/cocosound;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 335
    :goto_0
    return v4

    .line 301
    :catch_0
    move-exception v0

    .line 305
    .local v0, "e1":Ljava/lang/Exception;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x3

    invoke-virtual {p1, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 309
    .local v3, "newPath":Ljava/lang/String;
    :try_start_1
    iget-object v5, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/cocosound;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "wav"

    invoke-virtual {v3, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v4

    goto :goto_0

    .line 311
    :catch_1
    move-exception v1

    .line 318
    .local v1, "e2":Ljava/io/IOException;
    :try_start_2
    iget-object v5, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    iget-object v6, p0, Lcom/miniclip/nativeJNI/cocosound;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "mp3"

    invoke-virtual {v3, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-result v4

    goto :goto_0

    .line 320
    :catch_2
    move-exception v2

    .line 325
    .local v2, "e3":Ljava/io/IOException;
    :try_start_3
    iget-object v5, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    const/4 v6, 0x0

    invoke-virtual {v5, p1, v6}, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    move-result v4

    goto :goto_0

    .line 327
    :catch_3
    move-exception v5

    goto :goto_0
.end method

.method public end()V
    .locals 1

    .prologue
    .line 268
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 269
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->mPathSoundIDMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 270
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundIdStreamIdMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 272
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/cocosound;->initData()V

    .line 273
    return-void
.end method

.method public getEffectsVolume()F
    .locals 3

    .prologue
    .line 259
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mContext:Landroid/content/Context;

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 260
    .local v0, "audioManager":Landroid/media/AudioManager;
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    return v1
.end method

.method public pauseAllSounds()V
    .locals 2

    .prologue
    .line 277
    :try_start_0
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v1}, Landroid/media/SoundPool;->autoPause()V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 282
    :goto_0
    return-void

    .line 279
    :catch_0
    move-exception v0

    .line 280
    .local v0, "e":Ljava/lang/NoSuchMethodError;
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodError;->printStackTrace()V

    goto :goto_0
.end method

.method public pauseEffect(I)V
    .locals 3
    .param p1, "soundId"    # I

    .prologue
    .line 216
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundIdStreamIdMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 218
    .local v0, "streamId":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 219
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/media/SoundPool;->pause(I)V

    .line 220
    :cond_0
    return-void
.end method

.method public playEffect(I)V
    .locals 7
    .param p1, "soundId"    # I

    .prologue
    .line 145
    iget v2, p0, Lcom/miniclip/nativeJNI/cocosound;->mLeftVolume:F

    iget v3, p0, Lcom/miniclip/nativeJNI/cocosound;->mRightVolume:F

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p0

    move v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocosound;->playEffect(IFFIIF)V

    .line 146
    return-void
.end method

.method public playEffect(IFFIF)V
    .locals 7
    .param p1, "soundId"    # I
    .param p2, "leftGain"    # F
    .param p3, "rightGain"    # F
    .param p4, "loopTime"    # I
    .param p5, "pitch"    # F

    .prologue
    .line 157
    const/4 v4, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocosound;->playEffect(IFFIIF)V

    .line 158
    return-void
.end method

.method public playEffect(IFFIIF)V
    .locals 11
    .param p1, "soundId"    # I
    .param p2, "leftGain"    # F
    .param p3, "rightGain"    # F
    .param p4, "priority"    # I
    .param p5, "loopTime"    # I
    .param p6, "pitch"    # F

    .prologue
    .line 161
    const/high16 v0, 0x3f000000    # 0.5f

    cmpg-float v0, p6, v0

    if-gez v0, :cond_0

    .line 162
    const/high16 p6, 0x3f000000    # 0.5f

    .line 163
    :cond_0
    const/high16 v0, 0x40000000    # 2.0f

    cmpl-float v0, p6, v0

    if-lez v0, :cond_1

    .line 164
    const/high16 p6, 0x40000000    # 2.0f

    .line 166
    :cond_1
    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/cocosound;->GS2MODE:Z

    if-eqz v0, :cond_2

    .line 167
    invoke-virtual {p0, p1}, Lcom/miniclip/nativeJNI/cocosound;->stopEffect(I)V

    .line 170
    :cond_2
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound;->mSounds2Play:Ljava/util/Vector;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 172
    const/16 v9, 0xc8

    .line 174
    .local v9, "delay":I
    move-object v2, p0

    .line 175
    .local v2, "mcs":Lcom/miniclip/nativeJNI/cocosound;
    move/from16 v8, p6

    .line 176
    .local v8, "npitch":F
    iget-object v10, p0, Lcom/miniclip/nativeJNI/cocosound;->playHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miniclip/nativeJNI/cocosound$1;

    move-object v1, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move/from16 v7, p5

    invoke-direct/range {v0 .. v8}, Lcom/miniclip/nativeJNI/cocosound$1;-><init>(Lcom/miniclip/nativeJNI/cocosound;Lcom/miniclip/nativeJNI/cocosound;IFFIIF)V

    const-wide/16 v3, 0xc8

    invoke-virtual {v10, v0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 201
    return-void
.end method

.method public playEffect(IIF)V
    .locals 7
    .param p1, "soundId"    # I
    .param p2, "loopTime"    # I
    .param p3, "pitch"    # F

    .prologue
    .line 149
    iget v2, p0, Lcom/miniclip/nativeJNI/cocosound;->mLeftVolume:F

    iget v3, p0, Lcom/miniclip/nativeJNI/cocosound;->mRightVolume:F

    const/4 v4, 0x1

    move-object v0, p0

    move v1, p1

    move v5, p2

    move v6, p3

    invoke-virtual/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocosound;->playEffect(IFFIIF)V

    .line 150
    return-void
.end method

.method public playEffect(IIIF)V
    .locals 7
    .param p1, "soundId"    # I
    .param p2, "priority"    # I
    .param p3, "loopTime"    # I
    .param p4, "pitch"    # F

    .prologue
    .line 153
    iget v2, p0, Lcom/miniclip/nativeJNI/cocosound;->mLeftVolume:F

    iget v3, p0, Lcom/miniclip/nativeJNI/cocosound;->mRightVolume:F

    move-object v0, p0

    move v1, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/miniclip/nativeJNI/cocosound;->playEffect(IFFIIF)V

    .line 154
    return-void
.end method

.method public preloadEffect(Ljava/lang/String;)I
    .locals 5
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v4, -0x1

    .line 56
    const/4 v0, -0x1

    .line 59
    .local v0, "soundId":I
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mPathSoundIDMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 60
    const-string v1, "cocosound"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "preloadEffect: map: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mPathSoundIDMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 89
    :cond_0
    :goto_0
    return v0

    .line 63
    :cond_1
    const-string v1, "cocosound"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "preloadEffect: load: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    invoke-virtual {p0, p1}, Lcom/miniclip/nativeJNI/cocosound;->createSoundIdFromAsset(Ljava/lang/String;)I

    move-result v0

    .line 66
    if-eq v0, v4, :cond_0

    .line 68
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundIdStreamIdMap:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mPathSoundIDMap:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public resumeAllSounds()V
    .locals 2

    .prologue
    .line 286
    :try_start_0
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v1}, Landroid/media/SoundPool;->autoResume()V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    :goto_0
    return-void

    .line 288
    :catch_0
    move-exception v0

    .line 289
    .local v0, "e":Ljava/lang/NoSuchMethodError;
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodError;->printStackTrace()V

    goto :goto_0
.end method

.method public setEffectGain(IF)V
    .locals 3
    .param p1, "soundId"    # I
    .param p2, "gain"    # F

    .prologue
    .line 251
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundIdStreamIdMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 253
    .local v0, "streamId":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 254
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2, p2, p2}, Landroid/media/SoundPool;->setVolume(IFF)V

    .line 255
    :cond_0
    return-void
.end method

.method public setEffectLooping(IZ)V
    .locals 4
    .param p1, "soundId"    # I
    .param p2, "loop"    # Z

    .prologue
    const/4 v3, -0x1

    .line 240
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundIdStreamIdMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 242
    .local v0, "streamId":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, v3, :cond_0

    .line 243
    if-eqz p2, :cond_1

    .line 244
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2, v3}, Landroid/media/SoundPool;->setLoop(II)V

    .line 248
    :cond_0
    :goto_0
    return-void

    .line 246
    :cond_1
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/media/SoundPool;->setLoop(II)V

    goto :goto_0
.end method

.method public setEffectPitch(IF)V
    .locals 3
    .param p1, "soundId"    # I
    .param p2, "pitch"    # F

    .prologue
    .line 204
    const/high16 v1, 0x3f000000    # 0.5f

    cmpg-float v1, p2, v1

    if-gez v1, :cond_0

    .line 205
    const/high16 p2, 0x3f000000    # 0.5f

    .line 206
    :cond_0
    const/high16 v1, 0x40000000    # 2.0f

    cmpl-float v1, p2, v1

    if-lez v1, :cond_1

    .line 207
    const/high16 p2, 0x40000000    # 2.0f

    .line 209
    :cond_1
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundIdStreamIdMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 211
    .local v0, "streamId":Ljava/lang/Integer;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 212
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2, p2}, Landroid/media/SoundPool;->setRate(IF)V

    .line 213
    :cond_2
    return-void
.end method

.method public setEffectsVolume(F)V
    .locals 0
    .param p1, "volume"    # F

    .prologue
    .line 264
    iput p1, p0, Lcom/miniclip/nativeJNI/cocosound;->mRightVolume:F

    iput p1, p0, Lcom/miniclip/nativeJNI/cocosound;->mLeftVolume:F

    .line 265
    return-void
.end method

.method public stopEffect(I)V
    .locals 4
    .param p1, "soundId"    # I

    .prologue
    .line 226
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundIdStreamIdMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 228
    .local v0, "streamId":Ljava/lang/Integer;
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSounds2Play:Ljava/util/Vector;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 229
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSounds2Play:Ljava/util/Vector;

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1, v2}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 231
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 232
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/media/SoundPool;->stop(I)V

    .line 237
    :goto_0
    return-void

    .line 235
    :cond_1
    const-string v1, "cocosound"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "stopEffect error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public unloadEffect(Ljava/lang/String;)V
    .locals 4
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 94
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mPathSoundIDMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 96
    .local v0, "soundId":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 97
    const-string v1, "cocosound"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unloadEffect: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/media/SoundPool;->unload(I)Z

    .line 103
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocosound;->mSoundIdStreamIdMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    :cond_0
    return-void
.end method
