.class final Lcom/miniclip/nativeJNI/cocojava$96;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->custom_showAchievements()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 4670
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 4672
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mCustomLeaderboard:Z

    if-eqz v0, :cond_0

    .line 4673
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->showAchievementsCustom()V

    .line 4675
    :cond_0
    return-void
.end method
