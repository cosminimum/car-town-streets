.class public interface abstract Lcom/getjar/sdk/comm/auth/UserAuthProvider;
.super Ljava/lang/Object;
.source "UserAuthProvider.java"

# interfaces
.implements Lcom/getjar/sdk/comm/auth/AuthProvider;


# virtual methods
.method public abstract ensureUser(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Lcom/getjar/sdk/comm/auth/UserAuthResult;
.end method

.method public abstract getProxiableAuthData(Landroid/content/Context;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract isUINeeded(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/ProviderHint;)Z
.end method
