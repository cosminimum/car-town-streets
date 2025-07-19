.class final Lcom/miniclip/nativeJNI/cocojava$93;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->custom_showLeaderboard(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$leaderboardId:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 4632
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$93;->val$leaderboardId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 4634
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mCustomLeaderboard:Z

    if-eqz v0, :cond_0

    .line 4635
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$93;->val$leaderboardId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/cocojava;->showLeaderboardCustom(Ljava/lang/String;)V

    .line 4637
    :cond_0
    return-void
.end method
