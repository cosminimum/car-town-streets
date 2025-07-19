.class Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;
.super Ljava/lang/Object;
.source "GetJarSubActivityBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarSubActivityBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DialogQueueMetadata"
.end annotation


# instance fields
.field dialogType:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

.field showDialog:Z

.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;ZLcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;)V
    .locals 0
    .param p2, "showDialog"    # Z
    .param p3, "dialogType"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    .prologue
    .line 484
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 485
    iput-boolean p2, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;->showDialog:Z

    .line 486
    iput-object p3, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;->dialogType:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    .line 487
    return-void
.end method
