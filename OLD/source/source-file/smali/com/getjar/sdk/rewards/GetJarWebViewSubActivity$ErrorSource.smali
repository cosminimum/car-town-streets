.class public Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;
.super Ljava/lang/Object;
.source "GetJarWebViewSubActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ErrorSource"
.end annotation


# instance fields
.field public mErrorType:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

.field public mSubCode:Ljava/lang/String;

.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;Ljava/lang/String;)V
    .locals 0
    .param p2, "errorType"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;
    .param p3, "subCode"    # Ljava/lang/String;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->this$0:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->mErrorType:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    .line 120
    iput-object p3, p0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->mSubCode:Ljava/lang/String;

    .line 121
    return-void
.end method
