.class public Lcom/google/ads/internal/AdWebView;
.super Landroid/webkit/WebView;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/google/ads/AdActivity;",
            ">;"
        }
    .end annotation
.end field

.field private b:Lcom/google/ads/AdSize;

.field private c:Z

.field private d:Z

.field private e:Z


# direct methods
.method public constructor <init>(Lcom/google/ads/m;Lcom/google/ads/AdSize;)V
    .locals 4
    .param p1, "slotState"    # Lcom/google/ads/m;
    .param p2, "adSize"    # Lcom/google/ads/AdSize;

    .prologue
    const/16 v3, 0xb

    const/4 v2, 0x0

    .line 66
    iget-object v0, p1, Lcom/google/ads/m;->f:Lcom/google/ads/util/i$b;

    invoke-virtual {v0}, Lcom/google/ads/util/i$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-direct {p0, v0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 69
    iput-object p2, p0, Lcom/google/ads/internal/AdWebView;->b:Lcom/google/ads/AdSize;

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/ads/internal/AdWebView;->a:Ljava/lang/ref/WeakReference;

    .line 77
    iput-boolean v2, p0, Lcom/google/ads/internal/AdWebView;->c:Z

    .line 81
    iput-boolean v2, p0, Lcom/google/ads/internal/AdWebView;->d:Z

    .line 84
    iput-boolean v2, p0, Lcom/google/ads/internal/AdWebView;->e:Z

    .line 87
    invoke-virtual {p0, v2}, Lcom/google/ads/internal/AdWebView;->setBackgroundColor(I)V

    .line 90
    invoke-static {p0}, Lcom/google/ads/util/AdUtil;->a(Landroid/webkit/WebView;)V

    .line 93
    invoke-virtual {p0}, Lcom/google/ads/internal/AdWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 94
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 97
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 101
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    .line 104
    new-instance v1, Lcom/google/ads/internal/AdWebView$1;

    invoke-direct {v1, p0}, Lcom/google/ads/internal/AdWebView$1;-><init>(Lcom/google/ads/internal/AdWebView;)V

    invoke-virtual {p0, v1}, Lcom/google/ads/internal/AdWebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 124
    sget v1, Lcom/google/ads/util/AdUtil;->a:I

    if-lt v1, v3, :cond_0

    .line 125
    invoke-static {v0, p1}, Lcom/google/ads/util/g;->a(Landroid/webkit/WebSettings;Lcom/google/ads/m;)V

    .line 129
    :cond_0
    const/high16 v0, 0x2000000

    invoke-virtual {p0, v0}, Lcom/google/ads/internal/AdWebView;->setScrollBarStyle(I)V

    .line 135
    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_2

    .line 136
    new-instance v0, Lcom/google/ads/util/h$a;

    invoke-direct {v0, p1}, Lcom/google/ads/util/h$a;-><init>(Lcom/google/ads/m;)V

    invoke-virtual {p0, v0}, Lcom/google/ads/internal/AdWebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 140
    :cond_1
    :goto_0
    return-void

    .line 137
    :cond_2
    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    if-lt v0, v3, :cond_1

    .line 138
    new-instance v0, Lcom/google/ads/util/g$a;

    invoke-direct {v0, p1}, Lcom/google/ads/util/g$a;-><init>(Lcom/google/ads/m;)V

    invoke-virtual {p0, v0}, Lcom/google/ads/internal/AdWebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    goto :goto_0
.end method


# virtual methods
.method public a()V
    .locals 1

    .prologue
    .line 146
    invoke-virtual {p0}, Lcom/google/ads/internal/AdWebView;->d()Lcom/google/ads/AdActivity;

    move-result-object v0

    .line 147
    if-eqz v0, :cond_0

    .line 148
    invoke-virtual {v0}, Lcom/google/ads/AdActivity;->finish()V

    .line 150
    :cond_0
    return-void
.end method

.method public b()V
    .locals 2

    .prologue
    .line 157
    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 158
    invoke-static {p0}, Lcom/google/ads/util/g;->a(Landroid/view/View;)V

    .line 161
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/ads/internal/AdWebView;->d:Z

    .line 162
    return-void
.end method

.method public c()V
    .locals 2

    .prologue
    .line 170
    iget-boolean v0, p0, Lcom/google/ads/internal/AdWebView;->d:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 171
    invoke-static {p0}, Lcom/google/ads/util/g;->b(Landroid/view/View;)V

    .line 174
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/ads/internal/AdWebView;->d:Z

    .line 175
    return-void
.end method

.method public d()Lcom/google/ads/AdActivity;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/google/ads/internal/AdWebView;->a:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/ads/internal/AdWebView;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/AdActivity;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public destroy()V
    .locals 2

    .prologue
    .line 261
    :try_start_0
    invoke-super {p0}, Landroid/webkit/WebView;->destroy()V

    .line 265
    new-instance v0, Landroid/webkit/WebViewClient;

    invoke-direct {v0}, Landroid/webkit/WebViewClient;-><init>()V

    invoke-virtual {p0, v0}, Lcom/google/ads/internal/AdWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    :goto_0
    return-void

    .line 266
    :catch_0
    move-exception v0

    .line 267
    const-string v1, "An error occurred while destroying an AdWebView:"

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public e()Z
    .locals 1

    .prologue
    .line 190
    iget-boolean v0, p0, Lcom/google/ads/internal/AdWebView;->e:Z

    return v0
.end method

.method public f()Z
    .locals 1

    .prologue
    .line 197
    iget-boolean v0, p0, Lcom/google/ads/internal/AdWebView;->d:Z

    return v0
.end method

.method public loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "baseUrl"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;
    .param p3, "mimeType"    # Ljava/lang/String;
    .param p4, "encoding"    # Ljava/lang/String;
    .param p5, "historyUrl"    # Ljava/lang/String;

    .prologue
    .line 221
    :try_start_0
    invoke-super/range {p0 .. p5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    :goto_0
    return-void

    .line 222
    :catch_0
    move-exception v0

    .line 223
    const-string v1, "An error occurred while loading data in AdWebView:"

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public loadUrl(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 234
    :try_start_0
    invoke-super {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    :goto_0
    return-void

    .line 235
    :catch_0
    move-exception v0

    .line 236
    const-string v1, "An error occurred while loading a URL in AdWebView:"

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected declared-synchronized onMeasure(II)V
    .locals 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const v0, 0x7fffffff

    const/high16 v9, 0x40000000    # 2.0f

    const/high16 v8, -0x80000000

    .line 287
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/ads/internal/AdWebView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 288
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onMeasure(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 332
    :goto_0
    monitor-exit p0

    return-void

    .line 294
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/google/ads/internal/AdWebView;->b:Lcom/google/ads/AdSize;

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/google/ads/internal/AdWebView;->c:Z

    if-eqz v1, :cond_2

    .line 295
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onMeasure(II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 287
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 300
    :cond_2
    :try_start_2
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 301
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 304
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    .line 305
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 308
    invoke-virtual {p0}, Lcom/google/ads/internal/AdWebView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    .line 310
    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    .line 313
    iget-object v6, p0, Lcom/google/ads/internal/AdWebView;->b:Lcom/google/ads/AdSize;

    invoke-virtual {v6}, Lcom/google/ads/AdSize;->getWidth()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    float-to-int v6, v6

    .line 314
    iget-object v7, p0, Lcom/google/ads/internal/AdWebView;->b:Lcom/google/ads/AdSize;

    invoke-virtual {v7}, Lcom/google/ads/AdSize;->getHeight()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v5

    float-to-int v7, v7

    .line 317
    if-eq v2, v8, :cond_3

    if-ne v2, v9, :cond_8

    :cond_3
    move v2, v3

    .line 321
    :goto_1
    if-eq v4, v8, :cond_4

    if-ne v4, v9, :cond_5

    :cond_4
    move v0, v1

    .line 324
    :cond_5
    int-to-float v4, v6

    const/high16 v8, 0x40c00000    # 6.0f

    mul-float/2addr v5, v8

    sub-float/2addr v4, v5

    int-to-float v2, v2

    cmpl-float v2, v4, v2

    if-gtz v2, :cond_6

    if-le v7, v0, :cond_7

    .line 325
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not enough space to show ad! Wants: <"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ">, Has: <"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ">"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    .line 327
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/ads/internal/AdWebView;->setVisibility(I)V

    .line 328
    invoke-virtual {p0, v3, v1}, Lcom/google/ads/internal/AdWebView;->setMeasuredDimension(II)V

    goto/16 :goto_0

    .line 330
    :cond_7
    invoke-virtual {p0, v6, v7}, Lcom/google/ads/internal/AdWebView;->setMeasuredDimension(II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    :cond_8
    move v2, v0

    goto :goto_1
.end method

.method public setAdActivity(Lcom/google/ads/AdActivity;)V
    .locals 1
    .param p1, "adActivity"    # Lcom/google/ads/AdActivity;

    .prologue
    .line 206
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/internal/AdWebView;->a:Ljava/lang/ref/WeakReference;

    .line 207
    return-void
.end method

.method public declared-synchronized setAdSize(Lcom/google/ads/AdSize;)V
    .locals 1
    .param p1, "adSize"    # Lcom/google/ads/AdSize;

    .prologue
    .line 275
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/google/ads/internal/AdWebView;->b:Lcom/google/ads/AdSize;

    .line 276
    invoke-virtual {p0}, Lcom/google/ads/internal/AdWebView;->requestLayout()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 277
    monitor-exit p0

    return-void

    .line 275
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setCustomClose(Z)V
    .locals 1
    .param p1, "useCustomClose"    # Z

    .prologue
    .line 340
    iput-boolean p1, p0, Lcom/google/ads/internal/AdWebView;->e:Z

    .line 341
    iget-object v0, p0, Lcom/google/ads/internal/AdWebView;->a:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 342
    iget-object v0, p0, Lcom/google/ads/internal/AdWebView;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/AdActivity;

    .line 343
    if-eqz v0, :cond_0

    .line 344
    invoke-virtual {v0, p1}, Lcom/google/ads/AdActivity;->setCustomClose(Z)V

    .line 347
    :cond_0
    return-void
.end method

.method public setIsExpandedMraid(Z)V
    .locals 0
    .param p1, "isCurrentlyExpandedMraid"    # Z

    .prologue
    .line 354
    iput-boolean p1, p0, Lcom/google/ads/internal/AdWebView;->c:Z

    .line 355
    return-void
.end method

.method public stopLoading()V
    .locals 2

    .prologue
    .line 247
    :try_start_0
    invoke-super {p0}, Landroid/webkit/WebView;->stopLoading()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    :goto_0
    return-void

    .line 248
    :catch_0
    move-exception v0

    .line 249
    const-string v1, "An error occurred while stopping loading in AdWebView:"

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
