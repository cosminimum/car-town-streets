.class public final enum Lcom/getjar/sdk/data/usage/SessionEvent$Type;
.super Ljava/lang/Enum;
.source "SessionEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/usage/SessionEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/usage/SessionEvent$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/usage/SessionEvent$Type;

.field public static final enum start:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

.field public static final enum stop:Lcom/getjar/sdk/data/usage/SessionEvent$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 12
    new-instance v0, Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    const-string v1, "start"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->start:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    new-instance v0, Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    const-string v1, "stop"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->stop:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    sget-object v1, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->start:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->stop:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->$VALUES:[Lcom/getjar/sdk/data/usage/SessionEvent$Type;

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
    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/usage/SessionEvent$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 12
    const-class v0, Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/usage/SessionEvent$Type;
    .locals 1

    .prologue
    .line 12
    sget-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->$VALUES:[Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/usage/SessionEvent$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    return-object v0
.end method
