.class final Lcom/miniclip/nativeJNI/cocojava$68;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->callLastPendingPurchaseSignature(I)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$data:Ljava/lang/String;

.field final synthetic val$function:I

.field final synthetic val$pid:Ljava/lang/String;

.field final synthetic val$sig:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 4108
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$68;->val$function:I

    iput-object p2, p0, Lcom/miniclip/nativeJNI/cocojava$68;->val$pid:Ljava/lang/String;

    iput-object p3, p0, Lcom/miniclip/nativeJNI/cocojava$68;->val$data:Ljava/lang/String;

    iput-object p4, p0, Lcom/miniclip/nativeJNI/cocojava$68;->val$sig:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 4110
    const/4 v0, 0x1

    iget v1, p0, Lcom/miniclip/nativeJNI/cocojava$68;->val$function:I

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/miniclip/nativeJNI/cocojava$68;->val$pid:Ljava/lang/String;

    iget-object v4, p0, Lcom/miniclip/nativeJNI/cocojava$68;->val$data:Ljava/lang/String;

    iget-object v5, p0, Lcom/miniclip/nativeJNI/cocojava$68;->val$sig:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetInAppResponce(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4111
    return-void
.end method
