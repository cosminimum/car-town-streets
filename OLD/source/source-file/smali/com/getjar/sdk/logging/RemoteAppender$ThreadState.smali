.class final enum Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;
.super Ljava/lang/Enum;
.source "RemoteAppender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/logging/RemoteAppender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ThreadState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

.field public static final enum STARTED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

.field public static final enum STARTING:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

.field public static final enum STOPPED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

.field public static final enum STOPPING:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 61
    new-instance v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    const-string v1, "STARTING"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STARTING:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .line 63
    new-instance v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    const-string v1, "STARTED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STARTED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .line 65
    new-instance v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    const-string v1, "STOPPING"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STOPPING:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .line 67
    new-instance v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    const-string v1, "STOPPED"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STOPPED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .line 59
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    sget-object v1, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STARTING:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STARTED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STOPPING:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STOPPED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    aput-object v1, v0, v5

    sput-object v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->$VALUES:[Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

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
    .line 59
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 59
    const-class v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->$VALUES:[Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    return-object v0
.end method
