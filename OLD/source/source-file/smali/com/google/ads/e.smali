.class public Lcom/google/ads/e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Lcom/google/ads/internal/d;

.field private b:Lcom/google/ads/h;

.field private c:Ljava/lang/Object;

.field private d:Ljava/lang/Thread;

.field private e:Ljava/lang/Object;

.field private f:Z

.field private g:Ljava/lang/Object;


# direct methods
.method protected constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 308
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object v1, p0, Lcom/google/ads/e;->b:Lcom/google/ads/h;

    .line 58
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/ads/e;->c:Ljava/lang/Object;

    .line 64
    iput-object v1, p0, Lcom/google/ads/e;->d:Ljava/lang/Thread;

    .line 76
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/ads/e;->e:Ljava/lang/Object;

    .line 84
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/ads/e;->f:Z

    .line 91
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/ads/e;->g:Ljava/lang/Object;

    .line 309
    iput-object v1, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    .line 310
    return-void
.end method

.method public constructor <init>(Lcom/google/ads/internal/d;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object v1, p0, Lcom/google/ads/e;->b:Lcom/google/ads/h;

    .line 58
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/ads/e;->c:Ljava/lang/Object;

    .line 64
    iput-object v1, p0, Lcom/google/ads/e;->d:Ljava/lang/Thread;

    .line 76
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/ads/e;->e:Ljava/lang/Object;

    .line 84
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/ads/e;->f:Z

    .line 91
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/ads/e;->g:Ljava/lang/Object;

    .line 101
    invoke-static {p1}, Lcom/google/ads/util/a;->b(Ljava/lang/Object;)V

    .line 102
    iput-object p1, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    .line 103
    return-void
.end method

.method static synthetic a(Lcom/google/ads/e;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/ads/e;->e:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic a(Lcom/google/ads/e;Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0

    .prologue
    .line 51
    iput-object p1, p0, Lcom/google/ads/e;->d:Ljava/lang/Thread;

    return-object p1
.end method

.method static synthetic a(Lcom/google/ads/e;Lcom/google/ads/c;Lcom/google/ads/AdRequest;)V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Lcom/google/ads/e;->b(Lcom/google/ads/c;Lcom/google/ads/AdRequest;)V

    return-void
.end method

.method public static a(Lcom/google/ads/c;Lcom/google/ads/internal/d;)Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 158
    invoke-virtual {p0}, Lcom/google/ads/c;->j()Lcom/google/ads/internal/h;

    move-result-object v0

    if-nez v0, :cond_0

    move v0, v1

    .line 187
    :goto_0
    return v0

    .line 162
    :cond_0
    invoke-virtual {p1}, Lcom/google/ads/internal/d;->h()Lcom/google/ads/m;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/ads/m;->b()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 163
    invoke-virtual {p0}, Lcom/google/ads/c;->j()Lcom/google/ads/internal/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/ads/internal/h;->a()Z

    move-result v0

    if-nez v0, :cond_1

    .line 164
    const-string v0, "InterstitialAd received a mediation response corresponding to a non-interstitial ad. Make sure you specify \'interstitial\' as the ad-type in the mediation UI."

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    move v0, v2

    .line 167
    goto :goto_0

    :cond_1
    move v0, v1

    .line 169
    goto :goto_0

    .line 171
    :cond_2
    invoke-virtual {p1}, Lcom/google/ads/internal/d;->h()Lcom/google/ads/m;

    move-result-object v0

    iget-object v0, v0, Lcom/google/ads/m;->k:Lcom/google/ads/util/i$b;

    invoke-virtual {v0}, Lcom/google/ads/util/i$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/internal/h;

    invoke-virtual {v0}, Lcom/google/ads/internal/h;->b()Lcom/google/ads/AdSize;

    move-result-object v0

    .line 172
    invoke-virtual {p0}, Lcom/google/ads/c;->j()Lcom/google/ads/internal/h;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/ads/internal/h;->a()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 173
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AdView received a mediation response corresponding to an interstitial ad. Make sure you specify the banner ad size corresponding to the AdSize you used in your AdView  ("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") in the ad-type field in the mediation UI."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    move v0, v2

    .line 178
    goto :goto_0

    .line 180
    :cond_3
    invoke-virtual {p0}, Lcom/google/ads/c;->j()Lcom/google/ads/internal/h;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/ads/internal/h;->b()Lcom/google/ads/AdSize;

    move-result-object v3

    .line 181
    if-eq v3, v0, :cond_4

    .line 182
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Mediation server returned ad size: \'"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\', while the AdView was created with ad size: \'"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'. Using the ad-size passed to the AdView on creation."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    move v0, v2

    .line 185
    goto/16 :goto_0

    :cond_4
    move v0, v1

    .line 187
    goto/16 :goto_0
.end method

.method static synthetic a(Lcom/google/ads/e;Lcom/google/ads/h;)Z
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/google/ads/e;->e(Lcom/google/ads/h;)Z

    move-result v0

    return v0
.end method

.method private a(Lcom/google/ads/h;Ljava/lang/String;)Z
    .locals 2

    .prologue
    .line 199
    invoke-direct {p0}, Lcom/google/ads/e;->e()Lcom/google/ads/h;

    move-result-object v0

    if-eq v0, p1, :cond_0

    .line 200
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GWController: ignoring callback to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " from non showing ambassador with adapter class: \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/ads/h;->h()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->c(Ljava/lang/String;)V

    .line 203
    const/4 v0, 0x0

    .line 205
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private a(Ljava/lang/String;Landroid/app/Activity;Lcom/google/ads/AdRequest;Lcom/google/ads/f;Ljava/util/HashMap;J)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/app/Activity;",
            "Lcom/google/ads/AdRequest;",
            "Lcom/google/ads/f;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)Z"
        }
    .end annotation

    .prologue
    .line 385
    new-instance v0, Lcom/google/ads/h;

    iget-object v1, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v1}, Lcom/google/ads/internal/d;->h()Lcom/google/ads/m;

    move-result-object v1

    iget-object v1, v1, Lcom/google/ads/m;->k:Lcom/google/ads/util/i$b;

    invoke-virtual {v1}, Lcom/google/ads/util/i$b;->a()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/ads/internal/h;

    move-object v1, p0

    move-object v3, p4

    move-object v4, p1

    move-object v5, p3

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/ads/h;-><init>(Lcom/google/ads/e;Lcom/google/ads/internal/h;Lcom/google/ads/f;Ljava/lang/String;Lcom/google/ads/AdRequest;Ljava/util/HashMap;)V

    .line 391
    monitor-enter v0

    .line 392
    :try_start_0
    invoke-virtual {v0, p2}, Lcom/google/ads/h;->a(Landroid/app/Activity;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 396
    :goto_0
    :try_start_1
    invoke-virtual {v0}, Lcom/google/ads/h;->c()Z

    move-result v1

    if-nez v1, :cond_0

    const-wide/16 v1, 0x0

    cmp-long v1, p6, v1

    if-lez v1, :cond_0

    .line 397
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 398
    invoke-virtual {v0, p6, p7}, Ljava/lang/Object;->wait(J)V

    .line 399
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v3

    sub-long v1, v3, v1

    .line 400
    sub-long/2addr p6, v1

    .line 401
    goto :goto_0

    .line 402
    :catch_0
    move-exception v1

    .line 403
    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interrupted while waiting for ad network to load ad using adapter class: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 408
    :cond_0
    iget-object v1, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v1}, Lcom/google/ads/internal/d;->m()Lcom/google/ads/internal/g;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/ads/h;->e()Lcom/google/ads/g$a;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/ads/internal/g;->a(Lcom/google/ads/g$a;)V

    .line 410
    invoke-virtual {v0}, Lcom/google/ads/h;->c()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lcom/google/ads/h;->d()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 414
    iget-object v1, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v1}, Lcom/google/ads/internal/d;->h()Lcom/google/ads/m;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/ads/m;->b()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    .line 420
    :goto_1
    iget-object v2, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    new-instance v3, Lcom/google/ads/e$8;

    invoke-direct {v3, p0, v0, v1, p4}, Lcom/google/ads/e$8;-><init>(Lcom/google/ads/e;Lcom/google/ads/h;Landroid/view/View;Lcom/google/ads/f;)V

    invoke-virtual {v2, v3}, Lcom/google/ads/internal/d;->a(Ljava/lang/Runnable;)V

    .line 436
    const/4 v1, 0x1

    monitor-exit v0

    move v0, v1

    .line 441
    :goto_2
    return v0

    .line 414
    :cond_1
    invoke-virtual {v0}, Lcom/google/ads/h;->f()Landroid/view/View;

    move-result-object v1

    goto :goto_1

    .line 440
    :cond_2
    invoke-virtual {v0}, Lcom/google/ads/h;->b()V

    .line 441
    const/4 v1, 0x0

    monitor-exit v0

    move v0, v1

    goto :goto_2

    .line 442
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method static synthetic b(Lcom/google/ads/e;)Lcom/google/ads/internal/d;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    return-object v0
.end method

.method private b(Lcom/google/ads/c;Lcom/google/ads/AdRequest;)V
    .locals 12

    .prologue
    .line 322
    iget-object v1, p0, Lcom/google/ads/e;->e:Ljava/lang/Object;

    monitor-enter v1

    .line 323
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v2, p0, Lcom/google/ads/e;->d:Ljava/lang/Thread;

    invoke-static {v0, v2}, Lcom/google/ads/util/a;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 324
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 325
    invoke-virtual {p1}, Lcom/google/ads/c;->f()Ljava/util/List;

    move-result-object v0

    .line 326
    invoke-virtual {p1}, Lcom/google/ads/c;->a()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/google/ads/c;->b()I

    move-result v1

    int-to-long v7, v1

    .line 329
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/google/ads/a;

    .line 330
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Looking to fetch ads from network: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v2}, Lcom/google/ads/a;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 331
    invoke-virtual {v2}, Lcom/google/ads/a;->c()Ljava/util/List;

    move-result-object v10

    .line 332
    invoke-virtual {v2}, Lcom/google/ads/a;->e()Ljava/util/HashMap;

    move-result-object v11

    .line 335
    invoke-virtual {v2}, Lcom/google/ads/a;->d()Ljava/util/List;

    move-result-object v4

    .line 336
    new-instance v0, Lcom/google/ads/f;

    invoke-virtual {v2}, Lcom/google/ads/a;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2}, Lcom/google/ads/a;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/ads/c;->c()Ljava/lang/String;

    move-result-object v3

    if-eqz v4, :cond_4

    :goto_1
    invoke-virtual {p1}, Lcom/google/ads/c;->h()Ljava/util/List;

    move-result-object v5

    invoke-virtual {p1}, Lcom/google/ads/c;->i()Ljava/util/List;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/google/ads/f;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 344
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 345
    iget-object v1, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v1}, Lcom/google/ads/internal/d;->h()Lcom/google/ads/m;

    move-result-object v1

    iget-object v1, v1, Lcom/google/ads/m;->e:Lcom/google/ads/util/i$d;

    invoke-virtual {v1}, Lcom/google/ads/util/i$d;->a()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    .line 346
    if-nez v3, :cond_5

    .line 347
    const-string v0, "Activity is null while mediating.  Terminating mediation thread."

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 375
    :cond_2
    :goto_2
    return-void

    .line 324
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 326
    :cond_3
    const-wide/16 v7, 0x2710

    goto :goto_0

    .line 336
    :cond_4
    invoke-virtual {p1}, Lcom/google/ads/c;->g()Ljava/util/List;

    move-result-object v4

    goto :goto_1

    .line 351
    :cond_5
    iget-object v1, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v1}, Lcom/google/ads/internal/d;->m()Lcom/google/ads/internal/g;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/ads/internal/g;->c()V

    move-object v1, p0

    move-object v4, p2

    move-object v5, v0

    move-object v6, v11

    .line 352
    invoke-direct/range {v1 .. v8}, Lcom/google/ads/e;->a(Ljava/lang/String;Landroid/app/Activity;Lcom/google/ads/AdRequest;Lcom/google/ads/f;Ljava/util/HashMap;J)Z

    move-result v1

    if-nez v1, :cond_2

    .line 359
    invoke-direct {p0}, Lcom/google/ads/e;->d()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 360
    const-string v0, "GWController.destroy() called. Terminating mediation thread."

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    goto :goto_2

    .line 368
    :cond_6
    iget-object v0, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    new-instance v1, Lcom/google/ads/e$7;

    invoke-direct {v1, p0, p1}, Lcom/google/ads/e$7;-><init>(Lcom/google/ads/e;Lcom/google/ads/c;)V

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/d;->a(Ljava/lang/Runnable;)V

    goto :goto_2
.end method

.method static synthetic c(Lcom/google/ads/e;)Lcom/google/ads/h;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/ads/e;->b:Lcom/google/ads/h;

    return-object v0
.end method

.method private d()Z
    .locals 2

    .prologue
    .line 313
    iget-object v1, p0, Lcom/google/ads/e;->g:Ljava/lang/Object;

    monitor-enter v1

    .line 314
    :try_start_0
    iget-boolean v0, p0, Lcom/google/ads/e;->f:Z

    monitor-exit v1

    return v0

    .line 315
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private e()Lcom/google/ads/h;
    .locals 2

    .prologue
    .line 472
    iget-object v1, p0, Lcom/google/ads/e;->c:Ljava/lang/Object;

    monitor-enter v1

    .line 473
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/e;->b:Lcom/google/ads/h;

    monitor-exit v1

    return-object v0

    .line 474
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private e(Lcom/google/ads/h;)Z
    .locals 2

    .prologue
    .line 461
    iget-object v1, p0, Lcom/google/ads/e;->g:Ljava/lang/Object;

    monitor-enter v1

    .line 462
    :try_start_0
    invoke-direct {p0}, Lcom/google/ads/e;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 463
    invoke-virtual {p1}, Lcom/google/ads/h;->b()V

    .line 464
    const/4 v0, 0x1

    monitor-exit v1

    .line 466
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_0

    .line 468
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public a(Lcom/google/ads/c;Lcom/google/ads/AdRequest;)V
    .locals 3

    .prologue
    .line 126
    iget-object v1, p0, Lcom/google/ads/e;->e:Ljava/lang/Object;

    monitor-enter v1

    .line 127
    :try_start_0
    invoke-virtual {p0}, Lcom/google/ads/e;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    const-string v0, "Mediation thread is not done executing previous mediation  request. Ignoring new mediation request"

    invoke-static {v0}, Lcom/google/ads/util/b;->c(Ljava/lang/String;)V

    .line 130
    monitor-exit v1

    .line 147
    :goto_0
    return-void

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    invoke-static {p1, v0}, Lcom/google/ads/e;->a(Lcom/google/ads/c;Lcom/google/ads/internal/d;)Z

    .line 136
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lcom/google/ads/e$1;

    invoke-direct {v2, p0, p1, p2}, Lcom/google/ads/e$1;-><init>(Lcom/google/ads/e;Lcom/google/ads/c;Lcom/google/ads/AdRequest;)V

    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/google/ads/e;->d:Ljava/lang/Thread;

    .line 145
    iget-object v0, p0, Lcom/google/ads/e;->d:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 146
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public a(Lcom/google/ads/h;)V
    .locals 2

    .prologue
    .line 246
    const-string v0, "onPresentScreen"

    invoke-direct {p0, p1, v0}, Lcom/google/ads/e;->a(Lcom/google/ads/h;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 255
    :goto_0
    return-void

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    new-instance v1, Lcom/google/ads/e$4;

    invoke-direct {v1, p0}, Lcom/google/ads/e$4;-><init>(Lcom/google/ads/e;)V

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/d;->a(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public a(Lcom/google/ads/h;Landroid/view/View;)V
    .locals 3

    .prologue
    .line 226
    invoke-direct {p0}, Lcom/google/ads/e;->e()Lcom/google/ads/h;

    move-result-object v0

    if-eq v0, p1, :cond_0

    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GWController: ignoring onAdRefreshed() callback from non-showing ambassador (adapter class name is \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/ads/h;->h()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\')."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->c(Ljava/lang/String;)V

    .line 242
    :goto_0
    return-void

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->m()Lcom/google/ads/internal/g;

    move-result-object v0

    sget-object v1, Lcom/google/ads/g$a;->a:Lcom/google/ads/g$a;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/g;->a(Lcom/google/ads/g$a;)V

    .line 235
    iget-object v0, p0, Lcom/google/ads/e;->b:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->a()Lcom/google/ads/f;

    move-result-object v0

    .line 236
    iget-object v1, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    new-instance v2, Lcom/google/ads/e$3;

    invoke-direct {v2, p0, p2, v0}, Lcom/google/ads/e$3;-><init>(Lcom/google/ads/e;Landroid/view/View;Lcom/google/ads/f;)V

    invoke-virtual {v1, v2}, Lcom/google/ads/internal/d;->a(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public a(Lcom/google/ads/h;Z)V
    .locals 3

    .prologue
    .line 211
    const-string v0, "onAdClicked()"

    invoke-direct {p0, p1, v0}, Lcom/google/ads/e;->a(Lcom/google/ads/h;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 221
    :goto_0
    return-void

    .line 214
    :cond_0
    invoke-virtual {p1}, Lcom/google/ads/h;->a()Lcom/google/ads/f;

    move-result-object v0

    .line 215
    iget-object v1, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    new-instance v2, Lcom/google/ads/e$2;

    invoke-direct {v2, p0, v0, p2}, Lcom/google/ads/e$2;-><init>(Lcom/google/ads/e;Lcom/google/ads/f;Z)V

    invoke-virtual {v1, v2}, Lcom/google/ads/internal/d;->a(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public a()Z
    .locals 2

    .prologue
    .line 106
    iget-object v1, p0, Lcom/google/ads/e;->e:Ljava/lang/Object;

    monitor-enter v1

    .line 107
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/e;->d:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 108
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public b()V
    .locals 3

    .prologue
    .line 112
    iget-object v1, p0, Lcom/google/ads/e;->g:Ljava/lang/Object;

    monitor-enter v1

    .line 113
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/google/ads/e;->f:Z

    .line 115
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/ads/e;->d(Lcom/google/ads/h;)V

    .line 116
    iget-object v2, p0, Lcom/google/ads/e;->e:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 117
    :try_start_1
    iget-object v0, p0, Lcom/google/ads/e;->d:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/google/ads/e;->d:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 120
    :cond_0
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 122
    return-void

    .line 120
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0

    .line 121
    :catchall_1
    move-exception v0

    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0
.end method

.method public b(Lcom/google/ads/h;)V
    .locals 2

    .prologue
    .line 259
    const-string v0, "onDismissScreen"

    invoke-direct {p0, p1, v0}, Lcom/google/ads/e;->a(Lcom/google/ads/h;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 268
    :goto_0
    return-void

    .line 262
    :cond_0
    iget-object v0, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    new-instance v1, Lcom/google/ads/e$5;

    invoke-direct {v1, p0}, Lcom/google/ads/e$5;-><init>(Lcom/google/ads/e;)V

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/d;->a(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public c(Lcom/google/ads/h;)V
    .locals 2

    .prologue
    .line 272
    const-string v0, "onLeaveApplication"

    invoke-direct {p0, p1, v0}, Lcom/google/ads/e;->a(Lcom/google/ads/h;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 281
    :goto_0
    return-void

    .line 275
    :cond_0
    iget-object v0, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    new-instance v1, Lcom/google/ads/e$6;

    invoke-direct {v1, p0}, Lcom/google/ads/e$6;-><init>(Lcom/google/ads/e;)V

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/d;->a(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public c()Z
    .locals 1

    .prologue
    .line 292
    iget-object v0, p0, Lcom/google/ads/e;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->h()Lcom/google/ads/m;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/ads/m;->b()Z

    move-result v0

    invoke-static {v0}, Lcom/google/ads/util/a;->a(Z)V

    .line 293
    invoke-direct {p0}, Lcom/google/ads/e;->e()Lcom/google/ads/h;

    move-result-object v0

    .line 294
    if-eqz v0, :cond_0

    .line 295
    invoke-virtual {v0}, Lcom/google/ads/h;->g()V

    .line 301
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 297
    :cond_0
    const-string v0, "There is no ad ready to show."

    invoke-static {v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    .line 298
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public d(Lcom/google/ads/h;)V
    .locals 2

    .prologue
    .line 478
    iget-object v1, p0, Lcom/google/ads/e;->c:Ljava/lang/Object;

    monitor-enter v1

    .line 479
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/e;->b:Lcom/google/ads/h;

    if-eq v0, p1, :cond_1

    .line 480
    iget-object v0, p0, Lcom/google/ads/e;->b:Lcom/google/ads/h;

    if-eqz v0, :cond_0

    .line 482
    iget-object v0, p0, Lcom/google/ads/e;->b:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->b()V

    .line 484
    :cond_0
    iput-object p1, p0, Lcom/google/ads/e;->b:Lcom/google/ads/h;

    .line 486
    :cond_1
    monitor-exit v1

    .line 487
    return-void

    .line 486
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
