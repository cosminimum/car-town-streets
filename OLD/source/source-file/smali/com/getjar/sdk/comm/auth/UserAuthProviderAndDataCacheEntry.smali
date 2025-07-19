.class public Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;
.super Ljava/lang/Object;
.source "UserAuthProviderAndDataCacheEntry.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x5e9196f51e9a2b6dL


# instance fields
.field private _cachedProviderData:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _userAuthProviderType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lcom/getjar/sdk/comm/auth/UserAuthProvider;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_userAuthProviderType:Ljava/lang/Class;

    .line 19
    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_cachedProviderData:Ljava/util/HashMap;

    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/getjar/sdk/comm/auth/UserAuthProvider;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "userAuthProviderType":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/getjar/sdk/comm/auth/UserAuthProvider;>;"
    .local p2, "cachedProviderData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_userAuthProviderType:Ljava/lang/Class;

    .line 19
    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_cachedProviderData:Ljava/util/HashMap;

    .line 29
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_userAuthProviderType:Ljava/lang/Class;

    .line 30
    iput-object p2, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_cachedProviderData:Ljava/util/HashMap;

    .line 31
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->validateObjectState()V

    .line 32
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_userAuthProviderType:Ljava/lang/Class;

    .line 63
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_cachedProviderData:Ljava/util/HashMap;

    .line 64
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->validateObjectState()V

    .line 65
    return-void
.end method

.method private validateObjectState()V
    .locals 6

    .prologue
    .line 44
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_userAuthProviderType:Ljava/lang/Class;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'userAuthProviderType\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_0
    const-class v0, Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_userAuthProviderType:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 46
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "\'userAuthProviderType\' must implement UserAuthProviderInterface [type:%1$s]"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_userAuthProviderType:Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_1
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_userAuthProviderType:Ljava/lang/Class;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 56
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_cachedProviderData:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 57
    return-void
.end method


# virtual methods
.method public getCachedProviderData()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_cachedProviderData:Ljava/util/HashMap;

    return-object v0
.end method

.method public getUserAuthProviderType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Lcom/getjar/sdk/comm/auth/UserAuthProvider;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->_userAuthProviderType:Ljava/lang/Class;

    return-object v0
.end method
