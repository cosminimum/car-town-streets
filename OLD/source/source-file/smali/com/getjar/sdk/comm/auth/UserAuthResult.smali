.class Lcom/getjar/sdk/comm/auth/UserAuthResult;
.super Lcom/getjar/sdk/comm/auth/AuthResult;
.source "UserAuthResult.java"


# instance fields
.field private final _isNewUser:Z

.field private final _userAccessId:Ljava/lang/String;

.field private final _userDeviceId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    .locals 1
    .param p1, "providerFilter"    # Ljava/lang/String;
    .param p2, "state"    # Lcom/getjar/sdk/comm/auth/AuthResult$State;

    .prologue
    const/4 v0, 0x0

    .line 42
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V

    .line 43
    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthResult;->_userAccessId:Ljava/lang/String;

    .line 44
    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthResult;->_userDeviceId:Ljava/lang/String;

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthResult;->_isNewUser:Z

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/util/Map;Ljava/util/Map;J)V
    .locals 7
    .param p1, "providerFilter"    # Ljava/lang/String;
    .param p2, "theUserAccessId"    # Ljava/lang/String;
    .param p3, "theUserDeviceId"    # Ljava/lang/String;
    .param p4, "isNewUser"    # Z
    .param p5, "theAuthToken"    # Ljava/lang/String;
    .param p8, "theTtl"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/auth/SettingsValue;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p6, "theClaims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p7, "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    move-object v0, p0

    move-object v1, p1

    move-object v2, p5

    move-object v3, p6

    move-object v4, p7

    move-wide v5, p8

    invoke-direct/range {v0 .. v6}, Lcom/getjar/sdk/comm/auth/AuthResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;J)V

    .line 29
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "the user acess id is required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 31
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 32
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "the user device id is required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_1
    iput-object p2, p0, Lcom/getjar/sdk/comm/auth/UserAuthResult;->_userAccessId:Ljava/lang/String;

    .line 35
    iput-object p3, p0, Lcom/getjar/sdk/comm/auth/UserAuthResult;->_userDeviceId:Ljava/lang/String;

    .line 36
    iput-boolean p4, p0, Lcom/getjar/sdk/comm/auth/UserAuthResult;->_isNewUser:Z

    .line 38
    return-void
.end method


# virtual methods
.method public getUserAccessId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthResult;->_userAccessId:Ljava/lang/String;

    return-object v0
.end method

.method public getUserDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthResult;->_userDeviceId:Ljava/lang/String;

    return-object v0
.end method

.method public isNewUser()Z
    .locals 1

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthResult;->_isNewUser:Z

    return v0
.end method
