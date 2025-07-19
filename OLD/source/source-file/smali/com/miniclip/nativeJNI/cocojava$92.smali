.class final Lcom/miniclip/nativeJNI/cocojava$92;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->custom_updateScore(Ljava/lang/String;ILjava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$leaderboardId:Ljava/lang/String;

.field final synthetic val$scoreValue:I

.field final synthetic val$userData:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/String;ILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 4616
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$92;->val$leaderboardId:Ljava/lang/String;

    iput p2, p0, Lcom/miniclip/nativeJNI/cocojava$92;->val$scoreValue:I

    iput-object p3, p0, Lcom/miniclip/nativeJNI/cocojava$92;->val$userData:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 4618
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mCustomLeaderboard:Z

    if-eqz v0, :cond_0

    .line 4619
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$92;->val$leaderboardId:Ljava/lang/String;

    iget v2, p0, Lcom/miniclip/nativeJNI/cocojava$92;->val$scoreValue:I

    int-to-long v2, v2

    iget-object v4, p0, Lcom/miniclip/nativeJNI/cocojava$92;->val$userData:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/miniclip/nativeJNI/cocojava;->updateScoreCustom(Ljava/lang/String;JLjava/lang/Object;)V

    .line 4621
    :cond_0
    return-void
.end method
