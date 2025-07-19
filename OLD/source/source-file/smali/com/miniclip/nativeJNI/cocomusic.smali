.class public Lcom/miniclip/nativeJNI/cocomusic;
.super Ljava/lang/Object;
.source "cocomusic.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Cocos2dxMusic"


# instance fields
.field private mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

.field private mContext:Landroid/content/Context;

.field private mCurrentPath:Ljava/lang/String;

.field private mIsPaused:Z

.field private mLeftVolume:F

.field private mRightVolume:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mContext:Landroid/content/Context;

    .line 24
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/cocomusic;->initData()V

    .line 25
    return-void
.end method

.method private createMediaplayerFromAssets(Ljava/lang/String;)Landroid/media/MediaPlayer;
    .locals 14
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 160
    const/4 v0, 0x0

    .line 161
    .local v0, "mediaPlayer":Landroid/media/MediaPlayer;
    new-instance v0, Landroid/media/MediaPlayer;

    .end local v0    # "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 165
    .restart local v0    # "mediaPlayer":Landroid/media/MediaPlayer;
    :try_start_0
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 168
    .local v6, "assetFileDescritor":Landroid/content/res/AssetFileDescriptor;
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 169
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 170
    iget v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mLeftVolume:F

    iget v2, p0, Lcom/miniclip/nativeJNI/cocomusic;->mRightVolume:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    .end local v6    # "assetFileDescritor":Landroid/content/res/AssetFileDescriptor;
    :goto_0
    return-object v0

    .line 172
    :catch_0
    move-exception v7

    .line 176
    .local v7, "e1":Ljava/lang/Exception;
    :try_start_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    .line 178
    .local v12, "fileName":Ljava/lang/String;
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, v12}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 181
    .restart local v6    # "assetFileDescritor":Landroid/content/res/AssetFileDescriptor;
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 182
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 183
    iget v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mLeftVolume:F

    iget v2, p0, Lcom/miniclip/nativeJNI/cocomusic;->mRightVolume:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 185
    .end local v6    # "assetFileDescritor":Landroid/content/res/AssetFileDescriptor;
    .end local v12    # "fileName":Ljava/lang/String;
    :catch_1
    move-exception v8

    .line 189
    .local v8, "e2":Ljava/lang/Exception;
    :try_start_2
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 190
    .local v10, "f":Ljava/io/File;
    new-instance v13, Ljava/io/FileInputStream;

    invoke-direct {v13, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 192
    .local v13, "fis":Ljava/io/FileInputStream;
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 193
    invoke-virtual {v13}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v11

    .line 195
    .local v11, "fd":Ljava/io/FileDescriptor;
    invoke-virtual {v0, v11}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 196
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 197
    iget v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mLeftVolume:F

    iget v2, p0, Lcom/miniclip/nativeJNI/cocomusic;->mRightVolume:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 199
    .end local v10    # "f":Ljava/io/File;
    .end local v11    # "fd":Ljava/io/FileDescriptor;
    .end local v13    # "fis":Ljava/io/FileInputStream;
    :catch_2
    move-exception v9

    .line 201
    .local v9, "e3":Ljava/lang/Exception;
    const/4 v0, 0x0

    .line 202
    const-string v1, "Cocos2dxMusic"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private initData()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/high16 v0, 0x3f000000    # 0.5f

    .line 147
    iput v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mLeftVolume:F

    .line 148
    iput v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mRightVolume:F

    .line 149
    iput-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    .line 150
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mIsPaused:Z

    .line 151
    iput-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mCurrentPath:Ljava/lang/String;

    .line 152
    return-void
.end method


# virtual methods
.method public end()V
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 125
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 128
    :cond_0
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/cocomusic;->initData()V

    .line 129
    return-void
.end method

.method public getBackgroundVolume()F
    .locals 2

    .prologue
    .line 132
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 133
    iget v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mLeftVolume:F

    iget v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mRightVolume:F

    add-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 135
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDurationForSound(Ljava/lang/String;)I
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 211
    invoke-direct {p0, p1}, Lcom/miniclip/nativeJNI/cocomusic;->createMediaplayerFromAssets(Ljava/lang/String;)Landroid/media/MediaPlayer;

    move-result-object v0

    .line 212
    .local v0, "mp":Landroid/media/MediaPlayer;
    if-nez v0, :cond_0

    .line 213
    const/4 v1, -0x1

    .line 214
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    goto :goto_0
.end method

.method public isBackgroundMusicPlaying()Z
    .locals 2

    .prologue
    .line 112
    const/4 v0, 0x0

    .line 114
    .local v0, "ret":Z
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v1, :cond_0

    .line 115
    const/4 v0, 0x0

    .line 120
    :goto_0
    return v0

    .line 117
    :cond_0
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    goto :goto_0
.end method

.method public pauseBackgroundMusic()V
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 84
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mIsPaused:Z

    .line 86
    :cond_0
    return-void
.end method

.method public playBackgroundMusic(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "isLoop"    # Z

    .prologue
    .line 28
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mCurrentPath:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 31
    invoke-direct {p0, p1}, Lcom/miniclip/nativeJNI/cocomusic;->createMediaplayerFromAssets(Ljava/lang/String;)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    .line 32
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mCurrentPath:Ljava/lang/String;

    .line 51
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v1, :cond_3

    .line 52
    const-string v1, "Cocos2dxMusic"

    const-string v2, "playBackgroundMusic: background media player is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    :goto_1
    return-void

    .line 35
    :cond_1
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mCurrentPath:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 39
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_2

    .line 40
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 42
    :cond_2
    invoke-direct {p0, p1}, Lcom/miniclip/nativeJNI/cocomusic;->createMediaplayerFromAssets(Ljava/lang/String;)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    .line 45
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mCurrentPath:Ljava/lang/String;

    .line 47
    const-string v1, "Cocos2dxMusic"

    const-string v2, "playBackgroundMusic: new music"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 55
    :cond_3
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 57
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, p2}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 60
    :try_start_0
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 61
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 62
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 64
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mIsPaused:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Cocos2dxMusic"

    const-string v2, "playBackgroundMusic: error state"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public resumeBackgroundMusic()V
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mIsPaused:Z

    if-eqz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 91
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mIsPaused:Z

    .line 93
    :cond_0
    return-void
.end method

.method public rewindBackgroundMusic()V
    .locals 3

    .prologue
    .line 96
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 97
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 100
    :try_start_0
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 101
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 102
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 104
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mIsPaused:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :cond_0
    :goto_0
    return-void

    .line 105
    :catch_0
    move-exception v0

    .line 106
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Cocos2dxMusic"

    const-string v2, "rewindBackgroundMusic: error state"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setBackgroundVolume(F)V
    .locals 3
    .param p1, "volume"    # F

    .prologue
    .line 140
    iput p1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mRightVolume:F

    iput p1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mLeftVolume:F

    .line 141
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    iget v1, p0, Lcom/miniclip/nativeJNI/cocomusic;->mLeftVolume:F

    iget v2, p0, Lcom/miniclip/nativeJNI/cocomusic;->mRightVolume:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 144
    :cond_0
    return-void
.end method

.method public stopBackgroundMusic()V
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mBackgroundMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/cocomusic;->mIsPaused:Z

    .line 79
    :cond_0
    return-void
.end method
