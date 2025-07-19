.class public Lcom/miniclip/nativeJNI/cocotexture;
.super Ljava/lang/Object;
.source "cocotexture.java"


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocotexture;->mContext:Landroid/content/Context;

    .line 20
    return-void
.end method

.method private createBitmapFromAsset(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 6
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 24
    const-string v5, "cocotexture"

    invoke-static {v5, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    iget-object v5, p0, Lcom/miniclip/nativeJNI/cocotexture;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 30
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 31
    .local v3, "istr":Ljava/io/InputStream;
    new-instance v4, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v4}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 33
    .local v4, "options":Landroid/graphics/BitmapFactory$Options;
    const/16 v5, 0x4000

    new-array v5, v5, [B

    iput-object v5, v4, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    .line 34
    const/4 v5, 0x0

    invoke-static {v3, v5, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 42
    .end local v3    # "istr":Ljava/io/InputStream;
    .end local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    :goto_0
    return-object v1

    .line 37
    :catch_0
    move-exception v2

    .line 39
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method private static getPixels(Landroid/graphics/Bitmap;)[B
    .locals 4
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 47
    if-eqz p0, :cond_0

    .line 49
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    mul-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x4

    new-array v1, v2, [B

    .line 50
    .local v1, "pixels":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 51
    .local v0, "buf":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 52
    invoke-virtual {p0, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 55
    .end local v0    # "buf":Ljava/nio/ByteBuffer;
    .end local v1    # "pixels":[B
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static initNativeObject(Landroid/graphics/Bitmap;)V
    .locals 3
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v1, 0x4

    const/4 v2, 0x0

    .line 60
    if-nez p0, :cond_0

    .line 62
    new-array v1, v1, [B

    invoke-static {v2, v2, v1}, Lcom/miniclip/nativeJNI/CocoJNI;->MnativeInitBitmap(II[B)V

    .line 73
    :goto_0
    return-void

    .line 65
    :cond_0
    invoke-static {p0}, Lcom/miniclip/nativeJNI/cocotexture;->getPixels(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    .line 66
    .local v0, "pixels":[B
    if-nez v0, :cond_1

    .line 68
    new-array v1, v1, [B

    invoke-static {v2, v2, v1}, Lcom/miniclip/nativeJNI/CocoJNI;->MnativeInitBitmap(II[B)V

    goto :goto_0

    .line 71
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-static {v1, v2, v0}, Lcom/miniclip/nativeJNI/CocoJNI;->MnativeInitBitmap(II[B)V

    .line 72
    const/4 v0, 0x0

    .line 73
    goto :goto_0
.end method


# virtual methods
.method public readBitmap(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/miniclip/nativeJNI/cocotexture;->createBitmapFromAsset(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 78
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocotexture;->initNativeObject(Landroid/graphics/Bitmap;)V

    .line 79
    const/4 v0, 0x0

    .line 80
    return-void
.end method
