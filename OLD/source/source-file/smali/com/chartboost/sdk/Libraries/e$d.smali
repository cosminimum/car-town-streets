.class Lcom/chartboost/sdk/Libraries/e$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/Libraries/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "d"
.end annotation


# instance fields
.field private a:Ljava/io/File;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 368
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 370
    iput-object v2, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    .line 372
    :try_start_0
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 373
    invoke-virtual {p1, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    .line 374
    if-nez v0, :cond_3

    const/4 v0, 0x1

    .line 376
    :goto_0
    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 377
    const-string v1, "mounted"

    .line 376
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 378
    const-string v0, "cache"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    .line 379
    :cond_0
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 380
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 386
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    if-nez v0, :cond_2

    .line 387
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    .line 388
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_2

    .line 389
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 391
    :cond_2
    return-void

    .line 374
    :cond_3
    const/4 v0, 0x0

    goto :goto_0

    .line 381
    :catch_0
    move-exception v0

    .line 382
    iput-object v2, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    goto :goto_1
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ljava/io/File;
    .locals 2

    .prologue
    .line 394
    .line 395
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 396
    return-object v0
.end method

.method public a()V
    .locals 4

    .prologue
    .line 402
    :try_start_0
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$d;->a:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 403
    if-nez v1, :cond_1

    .line 410
    :cond_0
    :goto_0
    return-void

    .line 405
    :cond_1
    array-length v2, v1

    const/4 v0, 0x0

    :goto_1
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    .line 406
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 405
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 407
    :catch_0
    move-exception v0

    goto :goto_0
.end method
