.class public Lcom/chartboost/sdk/Libraries/e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/chartboost/sdk/Libraries/e$a;,
        Lcom/chartboost/sdk/Libraries/e$b;,
        Lcom/chartboost/sdk/Libraries/e$c;,
        Lcom/chartboost/sdk/Libraries/e$d;,
        Lcom/chartboost/sdk/Libraries/e$e;
    }
.end annotation


# static fields
.field private static a:Lcom/chartboost/sdk/Libraries/e;


# instance fields
.field private b:Lcom/chartboost/sdk/Libraries/e$d;

.field private c:Lcom/chartboost/sdk/Libraries/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const/4 v0, 0x0

    sput-object v0, Lcom/chartboost/sdk/Libraries/e;->a:Lcom/chartboost/sdk/Libraries/e;

    .line 34
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Lcom/chartboost/sdk/Libraries/e$d;

    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/chartboost/sdk/Chartboost;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/chartboost/sdk/Libraries/e$d;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/chartboost/sdk/Libraries/e;->b:Lcom/chartboost/sdk/Libraries/e$d;

    .line 59
    new-instance v0, Lcom/chartboost/sdk/Libraries/a;

    invoke-direct {v0}, Lcom/chartboost/sdk/Libraries/a;-><init>()V

    iput-object v0, p0, Lcom/chartboost/sdk/Libraries/e;->c:Lcom/chartboost/sdk/Libraries/a;

    .line 60
    return-void
.end method

.method static synthetic a(Lcom/chartboost/sdk/Libraries/e;)Lcom/chartboost/sdk/Libraries/a;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e;->c:Lcom/chartboost/sdk/Libraries/a;

    return-object v0
.end method

.method static synthetic a(Landroid/widget/ImageView;)Lcom/chartboost/sdk/Libraries/e$a;
    .locals 1

    .prologue
    .line 232
    invoke-static {p0}, Lcom/chartboost/sdk/Libraries/e;->b(Landroid/widget/ImageView;)Lcom/chartboost/sdk/Libraries/e$a;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized a()Lcom/chartboost/sdk/Libraries/e;
    .locals 2

    .prologue
    .line 48
    const-class v1, Lcom/chartboost/sdk/Libraries/e;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/chartboost/sdk/Libraries/e;->a:Lcom/chartboost/sdk/Libraries/e;

    if-nez v0, :cond_0

    .line 49
    new-instance v0, Lcom/chartboost/sdk/Libraries/e;

    invoke-direct {v0}, Lcom/chartboost/sdk/Libraries/e;-><init>()V

    sput-object v0, Lcom/chartboost/sdk/Libraries/e;->a:Lcom/chartboost/sdk/Libraries/e;

    .line 51
    :cond_0
    sget-object v0, Lcom/chartboost/sdk/Libraries/e;->a:Lcom/chartboost/sdk/Libraries/e;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 48
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static b(Landroid/widget/ImageView;)Lcom/chartboost/sdk/Libraries/e$a;
    .locals 2

    .prologue
    .line 233
    if-eqz p0, :cond_0

    .line 234
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 235
    instance-of v1, v0, Lcom/chartboost/sdk/Libraries/e$c;

    if-eqz v1, :cond_0

    .line 236
    check-cast v0, Lcom/chartboost/sdk/Libraries/e$c;

    .line 237
    invoke-virtual {v0}, Lcom/chartboost/sdk/Libraries/e$c;->a()Lcom/chartboost/sdk/Libraries/e$a;

    move-result-object v0

    .line 240
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected a(Ljava/lang/String;)Lcom/chartboost/sdk/Libraries/a$a;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 258
    iget-object v1, p0, Lcom/chartboost/sdk/Libraries/e;->b:Lcom/chartboost/sdk/Libraries/e$d;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ".png"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/chartboost/sdk/Libraries/e$d;->a(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 259
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    .line 260
    if-nez v2, :cond_0

    .line 305
    :goto_0
    return-object v0

    .line 263
    :cond_0
    new-instance v2, Ljava/io/BufferedInputStream;

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 264
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v3

    .line 265
    const-wide/32 v5, 0x7fffffff

    cmp-long v1, v3, v5

    if-lez v1, :cond_1

    .line 266
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot read files larger than 2147483647 bytes"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 269
    :cond_1
    long-to-int v1, v3

    .line 271
    new-array v3, v1, [B

    .line 272
    invoke-virtual {v2, v3, v7, v1}, Ljava/io/BufferedInputStream;->read([BII)I

    .line 273
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V

    .line 276
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 277
    iput-boolean v8, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 278
    array-length v2, v3

    invoke-static {v3, v7, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 280
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 281
    iput-boolean v7, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 282
    iput-boolean v7, v2, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 283
    iput-boolean v8, v2, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 284
    iput-boolean v8, v2, Landroid/graphics/BitmapFactory$Options;->inInputShareable:Z

    .line 285
    const v1, 0x8000

    new-array v1, v1, [B

    iput-object v1, v2, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    .line 288
    iput v8, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    :goto_1
    iget v1, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const/16 v4, 0x40

    if-lt v1, v4, :cond_2

    .line 305
    :goto_2
    new-instance v1, Lcom/chartboost/sdk/Libraries/a$a;

    iget v2, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-direct {v1, v0, v2}, Lcom/chartboost/sdk/Libraries/a$a;-><init>(Landroid/graphics/Bitmap;I)V

    move-object v0, v1

    goto :goto_0

    .line 291
    :cond_2
    const/4 v1, 0x0

    :try_start_0
    array-length v4, v3

    invoke-static {v3, v1, v4, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    goto :goto_2

    .line 292
    :catch_0
    move-exception v1

    .line 289
    iget v1, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    mul-int/lit8 v1, v1, 0x2

    iput v1, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    goto :goto_1

    .line 296
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;Lcom/chartboost/sdk/Libraries/e$b;Landroid/widget/ImageView;Landroid/os/Bundle;)V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 70
    const/4 v1, 0x0

    .line 71
    if-eqz p5, :cond_4

    const-string v0, "paramNoMemoryCache"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 73
    :goto_0
    if-nez v0, :cond_0

    .line 74
    :try_start_0
    iget-object v2, p0, Lcom/chartboost/sdk/Libraries/e;->c:Lcom/chartboost/sdk/Libraries/a;

    invoke-virtual {v2, p2}, Lcom/chartboost/sdk/Libraries/a;->a(Ljava/lang/String;)Lcom/chartboost/sdk/Libraries/a$a;

    move-result-object v1

    .line 75
    :cond_0
    if-nez v1, :cond_1

    .line 76
    invoke-virtual {p0, p2}, Lcom/chartboost/sdk/Libraries/e;->a(Ljava/lang/String;)Lcom/chartboost/sdk/Libraries/a$a;

    move-result-object v1

    .line 77
    if-eqz v1, :cond_1

    .line 78
    if-eqz v0, :cond_5

    move v2, v6

    :goto_1
    invoke-virtual {v1, v2}, Lcom/chartboost/sdk/Libraries/a$a;->a(Z)V

    .line 79
    if-nez v0, :cond_1

    .line 80
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e;->c:Lcom/chartboost/sdk/Libraries/a;

    invoke-virtual {v0, p2, v1}, Lcom/chartboost/sdk/Libraries/a;->a(Ljava/lang/String;Lcom/chartboost/sdk/Libraries/a$a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    :cond_1
    :goto_2
    if-eqz v1, :cond_6

    .line 89
    if-eqz p4, :cond_2

    .line 90
    invoke-virtual {v1}, Lcom/chartboost/sdk/Libraries/a$a;->b()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p4, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 91
    :cond_2
    if-eqz p3, :cond_3

    .line 92
    invoke-interface {p3, v1, p5}, Lcom/chartboost/sdk/Libraries/e$b;->a(Lcom/chartboost/sdk/Libraries/a$a;Landroid/os/Bundle;)V

    .line 97
    :cond_3
    :goto_3
    return-void

    :cond_4
    move v0, v6

    .line 71
    goto :goto_0

    :cond_5
    move v2, v7

    .line 78
    goto :goto_1

    .line 83
    :catch_0
    move-exception v0

    .line 86
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 96
    :cond_6
    new-instance v0, Lcom/chartboost/sdk/Libraries/e$a;

    move-object v1, p0

    move-object v2, p4

    move-object v3, p3

    move-object v4, p2

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/chartboost/sdk/Libraries/e$a;-><init>(Lcom/chartboost/sdk/Libraries/e;Landroid/widget/ImageView;Lcom/chartboost/sdk/Libraries/e$b;Ljava/lang/String;Landroid/os/Bundle;)V

    new-array v1, v7, [Ljava/lang/String;

    aput-object p1, v1, v6

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/Libraries/e$a;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_3
.end method

.method protected a(Ljava/lang/String;Lcom/chartboost/sdk/Libraries/e$e;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 310
    iget-object v1, p0, Lcom/chartboost/sdk/Libraries/e;->b:Lcom/chartboost/sdk/Libraries/e$d;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ".png"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/chartboost/sdk/Libraries/e$d;->a(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 312
    const/4 v2, 0x0

    .line 314
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 315
    const/16 v2, 0x1000

    :try_start_1
    new-array v2, v2, [B

    .line 317
    :goto_0
    invoke-virtual {p2, v2}, Lcom/chartboost/sdk/Libraries/e$e;->read([B)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_2

    .line 325
    if-eqz v1, :cond_0

    .line 326
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 320
    :cond_0
    :goto_1
    const/4 v0, 0x1

    .line 331
    :cond_1
    :goto_2
    return v0

    .line 318
    :cond_2
    const/4 v4, 0x0

    :try_start_3
    invoke-virtual {v1, v2, v4, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    .line 321
    :catch_0
    move-exception v2

    .line 325
    :goto_3
    if-eqz v1, :cond_1

    .line 326
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    .line 327
    :catch_1
    move-exception v1

    goto :goto_2

    .line 323
    :catchall_0
    move-exception v0

    move-object v1, v2

    .line 325
    :goto_4
    if-eqz v1, :cond_3

    .line 326
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 330
    :cond_3
    :goto_5
    throw v0

    .line 327
    :catch_2
    move-exception v0

    goto :goto_1

    :catch_3
    move-exception v1

    goto :goto_5

    .line 323
    :catchall_1
    move-exception v0

    goto :goto_4

    .line 321
    :catch_4
    move-exception v1

    move-object v1, v2

    goto :goto_3
.end method

.method public b()V
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e;->b:Lcom/chartboost/sdk/Libraries/e$d;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Libraries/e$d;->a()V

    .line 64
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e;->c:Lcom/chartboost/sdk/Libraries/a;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Libraries/a;->a()V

    .line 65
    return-void
.end method
