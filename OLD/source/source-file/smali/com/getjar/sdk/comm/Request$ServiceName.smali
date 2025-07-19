.class public final enum Lcom/getjar/sdk/comm/Request$ServiceName;
.super Ljava/lang/Enum;
.source "Request.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ServiceName"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/Request$ServiceName;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/Request$ServiceName;

.field public static final enum AUTH:Lcom/getjar/sdk/comm/Request$ServiceName;

.field public static final enum LICENSE:Lcom/getjar/sdk/comm/Request$ServiceName;

.field public static final enum LOCALIZATION:Lcom/getjar/sdk/comm/Request$ServiceName;

.field public static final enum TRANSACTION:Lcom/getjar/sdk/comm/Request$ServiceName;

.field public static final enum USER:Lcom/getjar/sdk/comm/Request$ServiceName;

.field public static final enum VOUCHER:Lcom/getjar/sdk/comm/Request$ServiceName;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 32
    new-instance v0, Lcom/getjar/sdk/comm/Request$ServiceName;

    const-string v1, "AUTH"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/Request$ServiceName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->AUTH:Lcom/getjar/sdk/comm/Request$ServiceName;

    .line 33
    new-instance v0, Lcom/getjar/sdk/comm/Request$ServiceName;

    const-string v1, "LOCALIZATION"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/comm/Request$ServiceName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->LOCALIZATION:Lcom/getjar/sdk/comm/Request$ServiceName;

    .line 34
    new-instance v0, Lcom/getjar/sdk/comm/Request$ServiceName;

    const-string v1, "LICENSE"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/comm/Request$ServiceName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->LICENSE:Lcom/getjar/sdk/comm/Request$ServiceName;

    .line 35
    new-instance v0, Lcom/getjar/sdk/comm/Request$ServiceName;

    const-string v1, "VOUCHER"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/comm/Request$ServiceName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->VOUCHER:Lcom/getjar/sdk/comm/Request$ServiceName;

    .line 36
    new-instance v0, Lcom/getjar/sdk/comm/Request$ServiceName;

    const-string v1, "TRANSACTION"

    invoke-direct {v0, v1, v7}, Lcom/getjar/sdk/comm/Request$ServiceName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->TRANSACTION:Lcom/getjar/sdk/comm/Request$ServiceName;

    .line 37
    new-instance v0, Lcom/getjar/sdk/comm/Request$ServiceName;

    const-string v1, "USER"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/Request$ServiceName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->USER:Lcom/getjar/sdk/comm/Request$ServiceName;

    .line 31
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/getjar/sdk/comm/Request$ServiceName;

    sget-object v1, Lcom/getjar/sdk/comm/Request$ServiceName;->AUTH:Lcom/getjar/sdk/comm/Request$ServiceName;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/Request$ServiceName;->LOCALIZATION:Lcom/getjar/sdk/comm/Request$ServiceName;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/comm/Request$ServiceName;->LICENSE:Lcom/getjar/sdk/comm/Request$ServiceName;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/comm/Request$ServiceName;->VOUCHER:Lcom/getjar/sdk/comm/Request$ServiceName;

    aput-object v1, v0, v6

    sget-object v1, Lcom/getjar/sdk/comm/Request$ServiceName;->TRANSACTION:Lcom/getjar/sdk/comm/Request$ServiceName;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/getjar/sdk/comm/Request$ServiceName;->USER:Lcom/getjar/sdk/comm/Request$ServiceName;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->$VALUES:[Lcom/getjar/sdk/comm/Request$ServiceName;

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
    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/Request$ServiceName;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 31
    const-class v0, Lcom/getjar/sdk/comm/Request$ServiceName;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/Request$ServiceName;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/Request$ServiceName;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->$VALUES:[Lcom/getjar/sdk/comm/Request$ServiceName;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/Request$ServiceName;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/Request$ServiceName;

    return-object v0
.end method
