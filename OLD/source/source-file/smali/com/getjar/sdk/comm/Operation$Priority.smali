.class public final enum Lcom/getjar/sdk/comm/Operation$Priority;
.super Ljava/lang/Enum;
.source "Operation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/Operation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Priority"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/Operation$Priority;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/Operation$Priority;

.field public static final enum HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

.field public static final enum LOW:Lcom/getjar/sdk/comm/Operation$Priority;

.field public static final enum MEDIUM:Lcom/getjar/sdk/comm/Operation$Priority;


# instance fields
.field private _value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 29
    new-instance v0, Lcom/getjar/sdk/comm/Operation$Priority;

    const-string v1, "LOW"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v3, v2}, Lcom/getjar/sdk/comm/Operation$Priority;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/getjar/sdk/comm/Operation$Priority;->LOW:Lcom/getjar/sdk/comm/Operation$Priority;

    .line 31
    new-instance v0, Lcom/getjar/sdk/comm/Operation$Priority;

    const-string v1, "MEDIUM"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v4, v2}, Lcom/getjar/sdk/comm/Operation$Priority;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/getjar/sdk/comm/Operation$Priority;->MEDIUM:Lcom/getjar/sdk/comm/Operation$Priority;

    .line 33
    new-instance v0, Lcom/getjar/sdk/comm/Operation$Priority;

    const-string v1, "HIGH"

    invoke-direct {v0, v1, v5, v6}, Lcom/getjar/sdk/comm/Operation$Priority;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    .line 27
    new-array v0, v6, [Lcom/getjar/sdk/comm/Operation$Priority;

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Priority;->LOW:Lcom/getjar/sdk/comm/Operation$Priority;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Priority;->MEDIUM:Lcom/getjar/sdk/comm/Operation$Priority;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Priority;->HIGH:Lcom/getjar/sdk/comm/Operation$Priority;

    aput-object v1, v0, v5

    sput-object v0, Lcom/getjar/sdk/comm/Operation$Priority;->$VALUES:[Lcom/getjar/sdk/comm/Operation$Priority;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/getjar/sdk/comm/Operation$Priority;->_value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation$Priority;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 27
    const-class v0, Lcom/getjar/sdk/comm/Operation$Priority;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/Operation$Priority;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/Operation$Priority;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/getjar/sdk/comm/Operation$Priority;->$VALUES:[Lcom/getjar/sdk/comm/Operation$Priority;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/Operation$Priority;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/Operation$Priority;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .prologue
    .line 39
    iget v0, p0, Lcom/getjar/sdk/comm/Operation$Priority;->_value:I

    return v0
.end method
