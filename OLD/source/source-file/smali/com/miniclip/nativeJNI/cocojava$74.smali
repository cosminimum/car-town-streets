.class final Lcom/miniclip/nativeJNI/cocojava$74;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->NF_showUrgentBoard()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 4275
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 4277
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iget v0, v0, Lcom/miniclip/newsfeed/Newsfeed;->messagesNumUrgent:I

    if-ge v0, v3, :cond_0

    .line 4278
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    invoke-virtual {v0}, Lcom/miniclip/newsfeed/Newsfeed;->removeUrgentTimer()V

    .line 4280
    :cond_0
    const-string v0, "cocojava"

    const-string v1, "Show NewsfeedDialog Urgent"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4281
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    iput-boolean v3, v0, Lcom/miniclip/newsfeed/Newsfeed;->mIsVisible:Z

    .line 4282
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    invoke-virtual {v0}, Lcom/miniclip/newsfeed/Newsfeed;->removeUrgentTimer()V

    .line 4283
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_1

    .line 4284
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeedDialog:Lcom/miniclip/newsfeed/NewsfeedDialog;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 4285
    :cond_1
    new-instance v0, Lcom/miniclip/newsfeed/NewsfeedDialog;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    invoke-direct {v0, v1, v2, v3}, Lcom/miniclip/newsfeed/NewsfeedDialog;-><init>(Landroid/content/Context;Lcom/miniclip/newsfeed/Newsfeed;Z)V

    sput-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeedDialog:Lcom/miniclip/newsfeed/NewsfeedDialog;

    .line 4287
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeedDialog:Lcom/miniclip/newsfeed/NewsfeedDialog;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 4288
    return-void
.end method
