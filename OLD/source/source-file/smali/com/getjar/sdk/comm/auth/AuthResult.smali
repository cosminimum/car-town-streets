.class Lcom/getjar/sdk/comm/auth/AuthResult;
.super Ljava/lang/Object;
.source "AuthResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/comm/auth/AuthResult$1;,
        Lcom/getjar/sdk/comm/auth/AuthResult$State;
    }
.end annotation


# instance fields
.field private final _authToken:Ljava/lang/String;

.field private final _claims:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final _providerFilter:Ljava/lang/String;

.field private final _settings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/auth/SettingsValue;",
            ">;"
        }
    .end annotation
.end field

.field private final _state:Lcom/getjar/sdk/comm/auth/AuthResult$State;

.field private final _ttl:J


# direct methods
.method protected constructor <init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    .locals 2
    .param p1, "providerFilter"    # Ljava/lang/String;
    .param p2, "state"    # Lcom/getjar/sdk/comm/auth/AuthResult$State;

    .prologue
    const/4 v1, 0x0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'providerFilter\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'state\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_1
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;->SUCCEEDED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    if-ne p2, v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'state\' cannot be set to State.SUCCEEDED here"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_2
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_providerFilter:Ljava/lang/String;

    .line 74
    iput-object v1, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_authToken:Ljava/lang/String;

    .line 75
    iput-object v1, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_claims:Ljava/util/Map;

    .line 76
    iput-object v1, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_settings:Ljava/util/Map;

    .line 77
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_ttl:J

    .line 78
    iput-object p2, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_state:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    .line 79
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;J)V
    .locals 2
    .param p1, "providerFilter"    # Ljava/lang/String;
    .param p2, "authToken"    # Ljava/lang/String;
    .param p5, "ttl"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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
    .line 53
    .local p3, "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p4, "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'providerFilter\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'authToken\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_1
    if-nez p3, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'claims\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_2
    const-wide/16 v0, 0x0

    cmp-long v0, p5, v0

    if-gez v0, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'ttl\' cannot be less than zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_3
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_providerFilter:Ljava/lang/String;

    .line 60
    iput-object p2, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_authToken:Ljava/lang/String;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_claims:Ljava/util/Map;

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_settings:Ljava/util/Map;

    .line 63
    iput-wide p5, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_ttl:J

    .line 64
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;->SUCCEEDED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_state:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    .line 65
    return-void
.end method


# virtual methods
.method public getAuthToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_authToken:Ljava/lang/String;

    return-object v0
.end method

.method public getClaims()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_claims:Ljava/util/Map;

    return-object v0
.end method

.method public getProviderFilter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_providerFilter:Ljava/lang/String;

    return-object v0
.end method

.method public getSettings()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/auth/SettingsValue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_settings:Ljava/util/Map;

    return-object v0
.end method

.method public getState()Lcom/getjar/sdk/comm/auth/AuthResult$State;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_state:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    return-object v0
.end method

.method public getTTL()J
    .locals 2

    .prologue
    .line 94
    iget-wide v0, p0, Lcom/getjar/sdk/comm/auth/AuthResult;->_ttl:J

    return-wide v0
.end method
