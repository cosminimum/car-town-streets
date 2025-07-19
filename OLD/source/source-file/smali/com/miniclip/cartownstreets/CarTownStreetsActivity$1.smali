.class Lcom/miniclip/cartownstreets/CarTownStreetsActivity$1;
.super Ljava/lang/Object;
.source "CarTownStreetsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->showUpSellDialogInternal()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/cartownstreets/CarTownStreetsActivity;


# direct methods
.method constructor <init>(Lcom/miniclip/cartownstreets/CarTownStreetsActivity;)V
    .locals 0

    .prologue
    .line 261
    iput-object p1, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity$1;->this$0:Lcom/miniclip/cartownstreets/CarTownStreetsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 264
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->MshowUpSellScreen()V

    .line 265
    return-void
.end method
