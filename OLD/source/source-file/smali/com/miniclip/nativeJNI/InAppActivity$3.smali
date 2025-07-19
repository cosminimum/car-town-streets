.class Lcom/miniclip/nativeJNI/InAppActivity$3;
.super Ljava/lang/Object;
.source "InAppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/InAppActivity;->purchaseFinishedCallback(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Purchase;Ljava/lang/Boolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/InAppActivity;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/InAppActivity;)V
    .locals 0

    .prologue
    .line 155
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity$3;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 157
    const/4 v0, -0x1

    sput v0, Lcom/miniclip/nativeJNI/cocojava;->mInAppResponce:I

    .line 158
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mInAppResponce:I

    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mInAppCallback:I

    sget v2, Lcom/miniclip/nativeJNI/cocojava;->mInAppSelf:I

    sget-object v3, Lcom/miniclip/nativeJNI/cocojava;->mInAppProductId:Ljava/lang/String;

    const-string v4, ""

    const-string v5, ""

    invoke-static/range {v0 .. v5}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetInAppResponce(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    return-void
.end method
