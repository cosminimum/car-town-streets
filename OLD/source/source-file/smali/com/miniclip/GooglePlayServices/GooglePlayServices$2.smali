.class Lcom/miniclip/GooglePlayServices/GooglePlayServices$2;
.super Ljava/lang/Object;
.source "GooglePlayServices.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/GooglePlayServices/GooglePlayServices;->giveUp()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/GooglePlayServices/GooglePlayServices;


# direct methods
.method constructor <init>(Lcom/miniclip/GooglePlayServices/GooglePlayServices;)V
    .locals 0

    .prologue
    .line 548
    iput-object p1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$2;->this$0:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 551
    const-string v0, "Cancelled"

    invoke-static {}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->access$200()I

    move-result v1

    invoke-static {v0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->MGooglePlusSignInCallbackOnFailure(Ljava/lang/String;I)V

    .line 552
    return-void
.end method
