.class Lcom/miniclip/nativeJNI/rotatedBannerImg$1RelativeLayoutRotate;
.super Landroid/widget/RelativeLayout;
.source "rotatedBannerImg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/rotatedBannerImg;->reAdd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RelativeLayoutRotate"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;


# direct methods
.method public constructor <init>(Lcom/miniclip/nativeJNI/rotatedBannerImg;Landroid/content/Context;)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 155
    iput-object p1, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$1RelativeLayoutRotate;->this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    .line 156
    invoke-direct {p0, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 157
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$1RelativeLayoutRotate;->this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/rotatedBannerImg;->runAnimation()V

    .line 161
    sget-object v0, Lcom/miniclip/nativeJNI/rotatedBannerImg;->adView:Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;

    invoke-virtual {v0, p1}, Lcom/miniclip/nativeJNI/rotatedBannerImg$MoPubViewRotate;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
