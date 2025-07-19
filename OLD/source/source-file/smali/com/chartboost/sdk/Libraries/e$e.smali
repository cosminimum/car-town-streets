.class Lcom/chartboost/sdk/Libraries/e$e;
.super Ljava/io/FilterInputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/Libraries/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "e"
.end annotation


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0

    .prologue
    .line 339
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 340
    return-void
.end method


# virtual methods
.method public skip(J)J
    .locals 8
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, 0x0

    .line 344
    move-wide v2, v4

    .line 345
    :goto_0
    cmp-long v0, v2, p1

    if-ltz v0, :cond_1

    .line 357
    :cond_0
    return-wide v2

    .line 346
    :cond_1
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$e;->in:Ljava/io/InputStream;

    sub-long v6, p1, v2

    invoke-virtual {v0, v6, v7}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 347
    cmp-long v6, v0, v4

    if-nez v6, :cond_2

    .line 348
    invoke-virtual {p0}, Lcom/chartboost/sdk/Libraries/e$e;->read()I

    move-result v0

    .line 349
    if-ltz v0, :cond_0

    .line 352
    const-wide/16 v0, 0x1

    .line 355
    :cond_2
    add-long/2addr v0, v2

    move-wide v2, v0

    goto :goto_0
.end method
