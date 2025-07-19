.class public final enum Lcom/getjar/sdk/logging/Area;
.super Ljava/lang/Enum;
.source "Area.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/logging/Area;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/logging/Area;

.field public static final enum ALL:Lcom/getjar/sdk/logging/Area;

.field public static final enum AUTH:Lcom/getjar/sdk/logging/Area;

.field public static final enum BUY_GOLD:Lcom/getjar/sdk/logging/Area;

.field public static final enum COMM:Lcom/getjar/sdk/logging/Area;

.field public static final enum CONFIG:Lcom/getjar/sdk/logging/Area;

.field public static final enum DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

.field public static final enum EARN:Lcom/getjar/sdk/logging/Area;

.field public static final enum JS_API:Lcom/getjar/sdk/logging/Area;

.field public static final enum LICENSING:Lcom/getjar/sdk/logging/Area;

.field public static final enum LOCALIZATION:Lcom/getjar/sdk/logging/Area;

.field public static final enum LOGGING:Lcom/getjar/sdk/logging/Area;

.field public static final enum OFFER:Lcom/getjar/sdk/logging/Area;

.field public static final enum OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

.field public static final enum PURCHASE:Lcom/getjar/sdk/logging/Area;

.field public static final enum REDEEM:Lcom/getjar/sdk/logging/Area;

.field public static final enum STATS:Lcom/getjar/sdk/logging/Area;

.field public static final enum STORAGE:Lcom/getjar/sdk/logging/Area;

.field public static final enum TEST:Lcom/getjar/sdk/logging/Area;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum TRANSACTION:Lcom/getjar/sdk/logging/Area;

.field public static final enum UI:Lcom/getjar/sdk/logging/Area;

.field public static final enum USAGE:Lcom/getjar/sdk/logging/Area;


# instance fields
.field private value:J


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 15
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "USAGE"

    const-wide/16 v2, 0x2

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    .line 17
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "LICENSING"

    const-wide/16 v2, 0x4

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    .line 19
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "LOCALIZATION"

    const-wide/16 v2, 0x8

    invoke-direct {v0, v1, v7, v2, v3}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    .line 21
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "AUTH"

    const-wide/16 v2, 0x10

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    .line 23
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "COMM"

    const-wide/16 v2, 0x20

    invoke-direct {v0, v1, v9, v2, v3}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    .line 25
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "TRANSACTION"

    const/4 v2, 0x5

    const-wide/16 v3, 0x40

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    .line 27
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "STORAGE"

    const/4 v2, 0x6

    const-wide/16 v3, 0x80

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    .line 29
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "EARN"

    const/4 v2, 0x7

    const-wide/16 v3, 0x100

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    .line 31
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "PURCHASE"

    const/16 v2, 0x8

    const-wide/16 v3, 0x200

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    .line 33
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "UI"

    const/16 v2, 0x9

    const-wide/16 v3, 0x400

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    .line 35
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "DEVELOPER_API"

    const/16 v2, 0xa

    const-wide/16 v3, 0x800

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    .line 37
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "CONFIG"

    const/16 v2, 0xb

    const-wide/16 v3, 0x1000

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    .line 39
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "OS_ENTRY_POINT"

    const/16 v2, 0xc

    const-wide/16 v3, 0x2000

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    .line 41
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "BUY_GOLD"

    const/16 v2, 0xd

    const-wide/16 v3, 0x4000

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    .line 43
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "STATS"

    const/16 v2, 0xe

    const-wide/32 v3, 0x8000

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->STATS:Lcom/getjar/sdk/logging/Area;

    .line 45
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "LOGGING"

    const/16 v2, 0xf

    const-wide/32 v3, 0x10000

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->LOGGING:Lcom/getjar/sdk/logging/Area;

    .line 47
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "JS_API"

    const/16 v2, 0x10

    const-wide/32 v3, 0x20000

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    .line 49
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "REDEEM"

    const/16 v2, 0x11

    const-wide/32 v3, 0x40000

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    .line 51
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "OFFER"

    const/16 v2, 0x12

    const-wide/32 v3, 0x80000

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    .line 54
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "ALL"

    const/16 v2, 0x13

    const-wide v3, 0x7fffffffffffffffL

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->ALL:Lcom/getjar/sdk/logging/Area;

    .line 56
    new-instance v0, Lcom/getjar/sdk/logging/Area;

    const-string v1, "TEST"

    const/16 v2, 0x14

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/getjar/sdk/logging/Area;-><init>(Ljava/lang/String;IJ)V

    sput-object v0, Lcom/getjar/sdk/logging/Area;->TEST:Lcom/getjar/sdk/logging/Area;

    .line 12
    const/16 v0, 0x15

    new-array v0, v0, [Lcom/getjar/sdk/logging/Area;

    sget-object v1, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    aput-object v1, v0, v6

    sget-object v1, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    aput-object v1, v0, v7

    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    aput-object v1, v0, v8

    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/getjar/sdk/logging/Area;->EARN:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/getjar/sdk/logging/Area;->BUY_GOLD:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STATS:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/getjar/sdk/logging/Area;->LOGGING:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/getjar/sdk/logging/Area;->ALL:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lcom/getjar/sdk/logging/Area;->TEST:Lcom/getjar/sdk/logging/Area;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/logging/Area;->$VALUES:[Lcom/getjar/sdk/logging/Area;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IJ)V
    .locals 0
    .param p3, "value"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)V"
        }
    .end annotation

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 62
    iput-wide p3, p0, Lcom/getjar/sdk/logging/Area;->value:J

    .line 63
    return-void
.end method

.method public static areasOverlap(JJ)Z
    .locals 4
    .param p0, "valueA"    # J
    .param p2, "valueB"    # J

    .prologue
    .line 71
    and-long v0, p0, p2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static toString(J)Ljava/lang/String;
    .locals 10
    .param p0, "value"    # J

    .prologue
    .line 76
    const-string v4, ""

    .line 77
    .local v4, "result":Ljava/lang/String;
    invoke-static {}, Lcom/getjar/sdk/logging/Area;->values()[Lcom/getjar/sdk/logging/Area;

    move-result-object v1

    .local v1, "arr$":[Lcom/getjar/sdk/logging/Area;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v0, v1, v2

    .line 78
    .local v0, "area":Lcom/getjar/sdk/logging/Area;
    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    and-long/2addr v5, p0

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-nez v5, :cond_0

    .line 79
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-gtz v5, :cond_1

    .line 80
    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->name()Ljava/lang/String;

    move-result-object v4

    .line 77
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 82
    :cond_1
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%1$s|%2$s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v4, v7, v8

    const/4 v8, 0x1

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 87
    .end local v0    # "area":Lcom/getjar/sdk/logging/Area;
    :cond_2
    return-object v4
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/logging/Area;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 12
    const-class v0, Lcom/getjar/sdk/logging/Area;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/logging/Area;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/logging/Area;
    .locals 1

    .prologue
    .line 12
    sget-object v0, Lcom/getjar/sdk/logging/Area;->$VALUES:[Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, [Lcom/getjar/sdk/logging/Area;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/logging/Area;

    return-object v0
.end method


# virtual methods
.method public value()J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/getjar/sdk/logging/Area;->value:J

    return-wide v0
.end method
