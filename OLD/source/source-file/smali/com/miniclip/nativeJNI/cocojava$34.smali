.class final Lcom/miniclip/nativeJNI/cocojava$34;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->callInAppPurchaseManaged(Ljava/lang/String;IIZ)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$itemID:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 2145
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$34;->val$itemID:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2147
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mCustomInApp:Z

    if-eqz v0, :cond_0

    .line 2148
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$34;->val$itemID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/cocojava;->callInAppPurchaseManagedCustom(Ljava/lang/String;)I

    .line 2156
    :goto_0
    return-void

    .line 2151
    :cond_0
    sget-boolean v0, Lcom/miniclip/nativeJNI/cocojava;->mTEST_INAPPS:Z

    if-eqz v0, :cond_1

    .line 2152
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/InAppActivity;

    const-string v1, "android.test.purchased"

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/InAppActivity;->requestPurchaseActManaged(Ljava/lang/String;)V

    goto :goto_0

    .line 2154
    :cond_1
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/InAppActivity;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$34;->val$itemID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/InAppActivity;->requestPurchaseActManaged(Ljava/lang/String;)V

    goto :goto_0
.end method
