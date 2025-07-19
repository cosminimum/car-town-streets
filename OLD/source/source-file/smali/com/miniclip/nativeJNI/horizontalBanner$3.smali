.class Lcom/miniclip/nativeJNI/horizontalBanner$3;
.super Ljava/lang/Object;
.source "horizontalBanner.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/horizontalBanner;->runAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/horizontalBanner;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/horizontalBanner;)V
    .locals 0

    .prologue
    .line 129
    iput-object p1, p0, Lcom/miniclip/nativeJNI/horizontalBanner$3;->this$0:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 143
    const-string v0, "horizontalBanner"

    const-string v1, "onAnimationEnd"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    iget-object v0, p0, Lcom/miniclip/nativeJNI/horizontalBanner$3;->this$0:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/horizontalBanner;->access$000(Lcom/miniclip/nativeJNI/horizontalBanner;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/horizontalBanner$3;->this$0:Lcom/miniclip/nativeJNI/horizontalBanner;

    iget-object v1, v1, Lcom/miniclip/nativeJNI/horizontalBanner;->mLoop:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 145
    iget-object v0, p0, Lcom/miniclip/nativeJNI/horizontalBanner$3;->this$0:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/horizontalBanner;->access$000(Lcom/miniclip/nativeJNI/horizontalBanner;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/horizontalBanner$3;->this$0:Lcom/miniclip/nativeJNI/horizontalBanner;

    iget-object v1, v1, Lcom/miniclip/nativeJNI/horizontalBanner;->mLoop:Ljava/lang/Runnable;

    const-wide/16 v2, 0xfa0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 146
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 138
    const-string v0, "horizontalBanner"

    const-string v1, "onAnimationRepeat"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 133
    const-string v0, "horizontalBanner"

    const-string v1, "onAnimationStart"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    return-void
.end method
