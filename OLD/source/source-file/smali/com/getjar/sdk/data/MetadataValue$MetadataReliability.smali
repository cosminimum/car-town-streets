.class public final enum Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;
.super Ljava/lang/Enum;
.source "MetadataValue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/MetadataValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MetadataReliability"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

.field public static final enum AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

.field public static final enum NOT_AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

.field public static final enum UNKNOWN:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 9
    new-instance v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    const-string v1, "UNKNOWN"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->UNKNOWN:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    .line 11
    new-instance v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    const-string v1, "AVAILABLE"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    .line 13
    new-instance v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    const-string v1, "NOT_AVAILABLE"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->NOT_AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    .line 7
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    sget-object v1, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->UNKNOWN:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->NOT_AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->$VALUES:[Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 7
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 7
    const-class v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;
    .locals 1

    .prologue
    .line 7
    sget-object v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->$VALUES:[Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    return-object v0
.end method
