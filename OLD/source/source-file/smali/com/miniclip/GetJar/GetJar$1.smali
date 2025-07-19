.class final Lcom/miniclip/GetJar/GetJar$1;
.super Ljava/lang/Object;
.source "GetJar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/GetJar/GetJar;->restorePurchases(II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:I

.field final synthetic val$itemId:Ljava/lang/String;

.field final synthetic val$self:I


# direct methods
.method constructor <init>(IILjava/lang/String;)V
    .locals 0

    .prologue
    .line 123
    iput p1, p0, Lcom/miniclip/GetJar/GetJar$1;->val$callback:I

    iput p2, p0, Lcom/miniclip/GetJar/GetJar$1;->val$self:I

    iput-object p3, p0, Lcom/miniclip/GetJar/GetJar$1;->val$itemId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 125
    const/4 v0, 0x1

    iget v1, p0, Lcom/miniclip/GetJar/GetJar$1;->val$callback:I

    iget v2, p0, Lcom/miniclip/GetJar/GetJar$1;->val$self:I

    iget-object v3, p0, Lcom/miniclip/GetJar/GetJar$1;->val$itemId:Ljava/lang/String;

    const-string v4, ""

    const-string v5, ""

    invoke-static/range {v0 .. v5}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetInAppResponce(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->permanentlyRemoveAds()V

    .line 127
    return-void
.end method
