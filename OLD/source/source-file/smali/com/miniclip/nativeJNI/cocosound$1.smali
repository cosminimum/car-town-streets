.class Lcom/miniclip/nativeJNI/cocosound$1;
.super Ljava/lang/Object;
.source "cocosound.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocosound;->playEffect(IFFIIF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocosound;

.field final synthetic val$leftGain:F

.field final synthetic val$loopTime:I

.field final synthetic val$mcs:Lcom/miniclip/nativeJNI/cocosound;

.field final synthetic val$npitch:F

.field final synthetic val$priority:I

.field final synthetic val$rightGain:F

.field final synthetic val$soundId:I


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocosound;Lcom/miniclip/nativeJNI/cocosound;IFFIIF)V
    .locals 0

    .prologue
    .line 176
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocosound$1;->this$0:Lcom/miniclip/nativeJNI/cocosound;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$mcs:Lcom/miniclip/nativeJNI/cocosound;

    iput p3, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$soundId:I

    iput p4, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$leftGain:F

    iput p5, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$rightGain:F

    iput p6, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$priority:I

    iput p7, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$loopTime:I

    iput p8, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$npitch:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 181
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$mcs:Lcom/miniclip/nativeJNI/cocosound;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocosound;->access$000(Lcom/miniclip/nativeJNI/cocosound;)Ljava/util/Vector;

    move-result-object v0

    iget v1, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$soundId:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$mcs:Lcom/miniclip/nativeJNI/cocosound;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocosound;->access$000(Lcom/miniclip/nativeJNI/cocosound;)Ljava/util/Vector;

    move-result-object v0

    new-instance v1, Ljava/lang/Integer;

    iget v2, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$soundId:I

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 186
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$mcs:Lcom/miniclip/nativeJNI/cocosound;

    iget v1, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$soundId:I

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/cocosound;->stopEffect(I)V

    .line 189
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$mcs:Lcom/miniclip/nativeJNI/cocosound;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocosound;->access$100(Lcom/miniclip/nativeJNI/cocosound;)Landroid/media/SoundPool;

    move-result-object v0

    iget v1, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$soundId:I

    iget v2, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$leftGain:F

    iget-object v3, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$mcs:Lcom/miniclip/nativeJNI/cocosound;

    iget v3, v3, Lcom/miniclip/nativeJNI/cocosound;->mLeftVolume:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$rightGain:F

    iget-object v4, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$mcs:Lcom/miniclip/nativeJNI/cocosound;

    iget v4, v4, Lcom/miniclip/nativeJNI/cocosound;->mRightVolume:F

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$priority:I

    iget v5, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$loopTime:I

    iget v6, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$npitch:F

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v7

    .line 193
    .local v7, "streamId":I
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$mcs:Lcom/miniclip/nativeJNI/cocosound;

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocosound;->access$200(Lcom/miniclip/nativeJNI/cocosound;)Ljava/util/HashMap;

    move-result-object v0

    iget v1, p0, Lcom/miniclip/nativeJNI/cocosound$1;->val$soundId:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .end local v7    # "streamId":I
    :cond_0
    return-void
.end method
