.class Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers$2;
.super Ljava/lang/Object;
.source "EasyAppConnectOffers.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;->getUpdatePoints(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;

.field final synthetic val$pointTotalFinal:I


# direct methods
.method constructor <init>(Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;I)V
    .locals 0

    .prologue
    .line 152
    iput-object p1, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers$2;->this$0:Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers;

    iput p2, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers$2;->val$pointTotalFinal:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 154
    iget v0, p0, Lcom/tapjoy/easyAppConnectOffers/EasyAppConnectOffers$2;->val$pointTotalFinal:I

    invoke-static {v0}, Lcom/miniclip/nativeJNI/CocoJNI;->MsetTapjoyCoins(I)V

    .line 155
    return-void
.end method
