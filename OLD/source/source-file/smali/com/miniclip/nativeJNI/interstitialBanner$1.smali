.class Lcom/miniclip/nativeJNI/interstitialBanner$1;
.super Ljava/lang/Object;
.source "interstitialBanner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/interstitialBanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/interstitialBanner;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/interstitialBanner;)V
    .locals 0

    .prologue
    .line 39
    iput-object p1, p0, Lcom/miniclip/nativeJNI/interstitialBanner$1;->this$0:Lcom/miniclip/nativeJNI/interstitialBanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialBanner$1;->this$0:Lcom/miniclip/nativeJNI/interstitialBanner;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/interstitialBanner;->access$100(Lcom/miniclip/nativeJNI/interstitialBanner;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-static {}, Lcom/miniclip/nativeJNI/interstitialBanner;->access$000()Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    return-void
.end method
