.class Lcom/miniclip/nativeJNI/interstitialMopubView$1;
.super Ljava/lang/Object;
.source "interstitialMopubView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/interstitialMopubView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/interstitialMopubView;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/interstitialMopubView;)V
    .locals 0

    .prologue
    .line 45
    iput-object p1, p0, Lcom/miniclip/nativeJNI/interstitialMopubView$1;->this$0:Lcom/miniclip/nativeJNI/interstitialMopubView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialMopubView$1;->this$0:Lcom/miniclip/nativeJNI/interstitialMopubView;

    iget-object v0, v0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mDialog:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/nativeJNI/interstitialMopubView$1;->this$0:Lcom/miniclip/nativeJNI/interstitialMopubView;

    iget-object v0, v0, Lcom/miniclip/nativeJNI/interstitialMopubView;->mDialog:Landroid/widget/RelativeLayout;

    invoke-static {}, Lcom/miniclip/nativeJNI/interstitialMopubView;->access$000()Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    :cond_0
    return-void
.end method
