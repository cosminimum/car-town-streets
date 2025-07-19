.class Lcom/miniclip/nativeJNI/cocojava$28$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$28;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava$28;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$28;)V
    .locals 0

    .prologue
    .line 2012
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$28$1;->this$0:Lcom/miniclip/nativeJNI/cocojava$28;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 2023
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocojava$28$1;->this$0:Lcom/miniclip/nativeJNI/cocojava$28;

    iget-object v0, v0, Lcom/miniclip/nativeJNI/cocojava$28;->val$adViewFinal:Lcom/mopub/mobileads/MoPubView;

    if-eqz v0, :cond_0

    .line 2024
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->adLayout:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$28$1;->this$0:Lcom/miniclip/nativeJNI/cocojava$28;

    iget-object v1, v1, Lcom/miniclip/nativeJNI/cocojava$28;->val$adViewFinal:Lcom/mopub/mobileads/MoPubView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 2025
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 2019
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 2015
    return-void
.end method
