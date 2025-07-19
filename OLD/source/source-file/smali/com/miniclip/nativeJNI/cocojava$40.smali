.class final Lcom/miniclip/nativeJNI/cocojava$40;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->updateNotificationStatus(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$enabled:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 2821
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$40;->val$enabled:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 2823
    sget-object v2, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v3, "NewsfeedPrefsC2DM"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 2825
    .local v1, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 2826
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "C2DM_ENABLE"

    iget v3, p0, Lcom/miniclip/nativeJNI/cocojava$40;->val$enabled:I

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 2827
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2828
    return-void
.end method
