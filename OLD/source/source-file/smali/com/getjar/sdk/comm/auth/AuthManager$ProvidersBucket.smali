.class Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;
.super Ljava/lang/Object;
.source "AuthManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/auth/AuthManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProvidersBucket"
.end annotation


# instance fields
.field private final _appProvider:Lcom/getjar/sdk/comm/auth/AppAuthProvider;

.field private final _userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

.field final synthetic this$0:Lcom/getjar/sdk/comm/auth/AuthManager;


# direct methods
.method protected constructor <init>(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/AppAuthProvider;Lcom/getjar/sdk/comm/auth/UserAuthProvider;)V
    .locals 0
    .param p2, "appProvider"    # Lcom/getjar/sdk/comm/auth/AppAuthProvider;
    .param p3, "userProvider"    # Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    .prologue
    .line 855
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 856
    iput-object p2, p0, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->_appProvider:Lcom/getjar/sdk/comm/auth/AppAuthProvider;

    .line 857
    iput-object p3, p0, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    .line 858
    return-void
.end method


# virtual methods
.method protected getAppProvider()Lcom/getjar/sdk/comm/auth/AppAuthProvider;
    .locals 1

    .prologue
    .line 861
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->_appProvider:Lcom/getjar/sdk/comm/auth/AppAuthProvider;

    return-object v0
.end method

.method protected getUserProvider()Lcom/getjar/sdk/comm/auth/UserAuthProvider;
    .locals 1

    .prologue
    .line 865
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    return-object v0
.end method
