.class public final Lcom/getjar/sdk/comm/auth/AuthMetadataUtility;
.super Ljava/lang/Object;
.source "AuthMetadataUtility.java"


# static fields
.field private static final KEY_SDK_LEVEL:Ljava/lang/String; = "sdk.level"

.field private static final KEY_SDK_NAME:Ljava/lang/String; = "sdk.name"

.field private static final KEY_SDK_VERSION:Ljava/lang/String; = "sdk.version"

.field public static final SDK_LEVEL:Ljava/lang/String; = "10"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addSDKMetadataValues(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/MetadataValue;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "providerData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'providerData\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_0
    const-string v0, "sdk.name"

    new-instance v1, Lcom/getjar/sdk/data/MetadataValue;

    const-string v2, "GetJarSDK"

    sget-object v3, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v1, v2, v3}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    const-string v0, "sdk.version"

    new-instance v1, Lcom/getjar/sdk/data/MetadataValue;

    const-string v2, "20130814.07"

    sget-object v3, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v1, v2, v3}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    const-string v0, "sdk.level"

    new-instance v1, Lcom/getjar/sdk/data/MetadataValue;

    const-string v2, "10"

    sget-object v3, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v1, v2, v3}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    return-void
.end method
