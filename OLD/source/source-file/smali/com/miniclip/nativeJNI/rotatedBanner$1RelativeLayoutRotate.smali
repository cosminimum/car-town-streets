.class Lcom/miniclip/nativeJNI/rotatedBanner$1RelativeLayoutRotate;
.super Landroid/widget/RelativeLayout;
.source "rotatedBanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/rotatedBanner;->reAdd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RelativeLayoutRotate"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/rotatedBanner;


# direct methods
.method public constructor <init>(Lcom/miniclip/nativeJNI/rotatedBanner;Landroid/content/Context;)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 162
    iput-object p1, p0, Lcom/miniclip/nativeJNI/rotatedBanner$1RelativeLayoutRotate;->this$0:Lcom/miniclip/nativeJNI/rotatedBanner;

    .line 163
    invoke-direct {p0, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 164
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 167
    sget-object v0, Lcom/miniclip/nativeJNI/rotatedBanner;->adView:Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;

    invoke-virtual {v0, p1}, Lcom/miniclip/nativeJNI/rotatedBanner$MoPubViewRotate;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
