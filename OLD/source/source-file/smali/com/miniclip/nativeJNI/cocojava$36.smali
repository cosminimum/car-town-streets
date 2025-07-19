.class final Lcom/miniclip/nativeJNI/cocojava$36;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->custom_logEvent(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$eventId:Ljava/lang/String;

.field final synthetic val$jsonString:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 2692
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$36;->val$eventId:Ljava/lang/String;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/cocojava$36;->val$jsonString:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 2694
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$36;->val$eventId:Ljava/lang/String;

    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocojava$36;->val$jsonString:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/miniclip/nativeJNI/cocojava;->logCustomEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 2695
    return-void
.end method
