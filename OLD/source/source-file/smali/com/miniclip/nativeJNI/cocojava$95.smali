.class final Lcom/miniclip/nativeJNI/cocojava$95;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->custom_updateAchievement(Ljava/lang/String;FLjava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$achievementId:Ljava/lang/String;

.field final synthetic val$progressValue:F

.field final synthetic val$userData:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/String;FLjava/lang/Object;)V
    .locals 0

    .prologue
    .line 4654
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$95;->val$achievementId:Ljava/lang/String;

    iput p2, p0, Lcom/miniclip/nativeJNI/cocojava$95;->val$progressValue:F

    iput-object p3, p0, Lcom/miniclip/nativeJNI/cocojava$95;->val$userData:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 4656
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mCustomLeaderboard:Z

    if-eqz v0, :cond_0

    .line 4657
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$95;->val$achievementId:Ljava/lang/String;

    iget v2, p0, Lcom/miniclip/nativeJNI/cocojava$95;->val$progressValue:F

    iget-object v3, p0, Lcom/miniclip/nativeJNI/cocojava$95;->val$userData:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2, v3}, Lcom/miniclip/nativeJNI/cocojava;->updateAchievementCustom(Ljava/lang/String;FLjava/lang/Object;)V

    .line 4659
    :cond_0
    return-void
.end method
