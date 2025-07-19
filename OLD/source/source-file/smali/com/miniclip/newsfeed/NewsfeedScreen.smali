.class public Lcom/miniclip/newsfeed/NewsfeedScreen;
.super Landroid/widget/RelativeLayout;
.source "NewsfeedScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field protected mContext:Landroid/content/Context;

.field private mDisplayHandler:Landroid/os/Handler;

.field private mNewsButton:Landroid/widget/ImageView;

.field public mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "deviceID"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 28
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mDisplayHandler:Landroid/os/Handler;

    .line 33
    iput-object p1, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    .line 37
    new-instance v0, Lcom/miniclip/newsfeed/Newsfeed;

    iget-object v1, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p2}, Lcom/miniclip/newsfeed/Newsfeed;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    .line 39
    return-void
.end method

.method private checkNotified()I
    .locals 8

    .prologue
    const/4 v5, 0x0

    .line 110
    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    const-string v7, "NewsfeedPrefsNotified"

    invoke-virtual {v6, v7, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 111
    .local v4, "settings":Landroid/content/SharedPreferences;
    const-string v6, "notified"

    const-string v7, "false"

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 112
    .local v3, "notified":Ljava/lang/String;
    const-string v6, "notified_id"

    invoke-interface {v4, v6, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 113
    .local v0, "campaign_id":I
    const-string v6, "true"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 115
    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    iget-object v7, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    const-string v7, "notification"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    .line 116
    .local v2, "notifManager":Landroid/app/NotificationManager;
    const v6, 0x93bc

    invoke-virtual {v2, v6}, Landroid/app/NotificationManager;->cancel(I)V

    .line 118
    iget-object v6, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    const-string v7, "NewsfeedPrefsNotified"

    invoke-virtual {v6, v7, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 119
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 120
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v6, "notified"

    const-string v7, "false"

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 121
    const-string v6, "notified_id"

    invoke-interface {v1, v6, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 122
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 123
    const/4 v5, 0x1

    .line 125
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "notifManager":Landroid/app/NotificationManager;
    :cond_0
    return v5
.end method


# virtual methods
.method public displayButton()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 62
    iget-object v4, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v4, v4, Lcom/miniclip/newsfeed/Newsfeed;->messagesNum:I

    if-ge v4, v8, :cond_1

    .line 64
    const-string v4, "Newsfeed"

    const-string v5, "0 messages"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    iget-object v4, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    check-cast v4, Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v0, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 69
    .local v0, "height":I
    int-to-float v4, v0

    const/high16 v5, 0x43f00000    # 480.0f

    div-float v3, v4, v5

    .line 71
    .local v3, "scaleF":F
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v4, 0x43480000    # 200.0f

    mul-float/2addr v4, v3

    float-to-int v4, v4

    const/high16 v5, 0x42480000    # 50.0f

    mul-float/2addr v5, v3

    float-to-int v5, v5

    invoke-direct {v1, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 72
    .local v1, "paramsnb":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v4, 0xc

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 74
    new-instance v4, Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsButton:Landroid/widget/ImageView;

    .line 76
    sget-boolean v4, Lcom/miniclip/nativeJNI/cocojava;->mBlockNewsButton:Z

    if-nez v4, :cond_2

    .line 77
    iget-object v4, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const-string v5, "news1"

    const-string v6, "drawable"

    iget-object v7, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 78
    .local v2, "resourceId":I
    iget-object v4, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsButton:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 80
    iget-object v4, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsButton:Landroid/widget/ImageView;

    invoke-virtual {v4, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    iget-object v4, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsButton:Landroid/widget/ImageView;

    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    iget-object v4, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsButton:Landroid/widget/ImageView;

    invoke-virtual {p0, v4}, Lcom/miniclip/newsfeed/NewsfeedScreen;->addView(Landroid/view/View;)V

    .line 90
    .end local v2    # "resourceId":I
    :goto_1
    invoke-direct {p0}, Lcom/miniclip/newsfeed/NewsfeedScreen;->checkNotified()I

    move-result v4

    if-eq v4, v8, :cond_0

    iget-object v4, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v4, v4, Lcom/miniclip/newsfeed/Newsfeed;->urgentItem:I

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    goto :goto_0

    .line 84
    :cond_2
    iget-object v4, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsButton:Landroid/widget/ImageView;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1
.end method

.method public displayInSeconds(I)V
    .locals 4
    .param p1, "seconds"    # I

    .prologue
    .line 98
    new-instance v0, Lcom/miniclip/newsfeed/NewsfeedScreen$1;

    invoke-direct {v0, p0}, Lcom/miniclip/newsfeed/NewsfeedScreen$1;-><init>(Lcom/miniclip/newsfeed/NewsfeedScreen;)V

    .line 104
    .local v0, "display":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mDisplayHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 105
    iget-object v1, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mDisplayHandler:Landroid/os/Handler;

    mul-int/lit16 v2, p1, 0x3e8

    int-to-long v2, v2

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 106
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 131
    iget-object v0, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsButton:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsButton:Landroid/widget/ImageView;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 134
    invoke-virtual {p0}, Lcom/miniclip/newsfeed/NewsfeedScreen;->removeAllViews()V

    .line 135
    new-instance v0, Lcom/miniclip/newsfeed/NewsfeedDialog;

    iget-object v1, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/miniclip/newsfeed/NewsfeedDialog;-><init>(Landroid/content/Context;Lcom/miniclip/newsfeed/Newsfeed;Z)V

    invoke-virtual {p0, v0}, Lcom/miniclip/newsfeed/NewsfeedScreen;->addView(Landroid/view/View;)V

    .line 139
    :cond_0
    return-void
.end method

.method public update()V
    .locals 2

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/miniclip/newsfeed/NewsfeedScreen;->removeAllViews()V

    .line 45
    iget-object v0, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->isOnline()Z

    move-result v0

    if-nez v0, :cond_0

    .line 47
    const-string v0, "Newsfeed"

    const-string v1, "Not online"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    :goto_0
    return-void

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    invoke-virtual {v0}, Lcom/miniclip/newsfeed/Newsfeed;->update()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_1

    .line 53
    const-string v0, "Newsfeed"

    const-string v1, "0 messages"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 57
    :cond_1
    invoke-virtual {p0}, Lcom/miniclip/newsfeed/NewsfeedScreen;->displayButton()V

    goto :goto_0
.end method
