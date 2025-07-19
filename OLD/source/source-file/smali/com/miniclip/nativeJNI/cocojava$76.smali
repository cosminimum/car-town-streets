.class final Lcom/miniclip/nativeJNI/cocojava$76;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->NF_dismissBoard()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 4309
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 4311
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/miniclip/newsfeed/Newsfeed;->mIsVisible:Z

    .line 4312
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeedDialog:Lcom/miniclip/newsfeed/NewsfeedDialog;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 4313
    const/4 v0, 0x0

    sput-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeedDialog:Lcom/miniclip/newsfeed/NewsfeedDialog;

    .line 4314
    return-void
.end method
