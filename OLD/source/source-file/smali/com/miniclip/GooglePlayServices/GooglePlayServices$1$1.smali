.class Lcom/miniclip/GooglePlayServices/GooglePlayServices$1$1;
.super Ljava/lang/Object;
.source "GooglePlayServices.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/GooglePlayServices/GooglePlayServices$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/GooglePlayServices/GooglePlayServices$1;


# direct methods
.method constructor <init>(Lcom/miniclip/GooglePlayServices/GooglePlayServices$1;)V
    .locals 0

    .prologue
    .line 382
    iput-object p1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$1$1;->this$1:Lcom/miniclip/GooglePlayServices/GooglePlayServices$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 385
    invoke-static {}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->access$000()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->access$200()I

    move-result v1

    invoke-static {v0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->MGooglePlusSignInCallbackOnSuccess(Ljava/lang/String;I)V

    .line 386
    return-void
.end method
