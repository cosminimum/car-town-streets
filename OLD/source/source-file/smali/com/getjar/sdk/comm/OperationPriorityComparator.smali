.class public Lcom/getjar/sdk/comm/OperationPriorityComparator;
.super Ljava/lang/Object;
.source "OperationPriorityComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/getjar/sdk/comm/Operation;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile _Instance:Lcom/getjar/sdk/comm/OperationPriorityComparator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/OperationPriorityComparator;->_Instance:Lcom/getjar/sdk/comm/OperationPriorityComparator;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/getjar/sdk/comm/OperationPriorityComparator;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/getjar/sdk/comm/OperationPriorityComparator;->_Instance:Lcom/getjar/sdk/comm/OperationPriorityComparator;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/getjar/sdk/comm/OperationPriorityComparator;->makeTheInstance()V

    .line 17
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/OperationPriorityComparator;->_Instance:Lcom/getjar/sdk/comm/OperationPriorityComparator;

    return-object v0
.end method

.method private static declared-synchronized makeTheInstance()V
    .locals 2

    .prologue
    .line 12
    const-class v1, Lcom/getjar/sdk/comm/OperationPriorityComparator;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/OperationPriorityComparator;->_Instance:Lcom/getjar/sdk/comm/OperationPriorityComparator;

    if-nez v0, :cond_0

    new-instance v0, Lcom/getjar/sdk/comm/OperationPriorityComparator;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/OperationPriorityComparator;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/OperationPriorityComparator;->_Instance:Lcom/getjar/sdk/comm/OperationPriorityComparator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    :cond_0
    monitor-exit v1

    return-void

    .line 12
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public compare(Lcom/getjar/sdk/comm/Operation;Lcom/getjar/sdk/comm/Operation;)I
    .locals 5
    .param p1, "lhs"    # Lcom/getjar/sdk/comm/Operation;
    .param p2, "rhs"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 30
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'lhs\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 31
    :cond_0
    if-nez p2, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'rhs\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 34
    :cond_1
    const/4 v0, 0x0

    .line 35
    .local v0, "result":I
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getPriority()I

    move-result v1

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/Operation;->getPriority()I

    move-result v2

    if-ge v1, v2, :cond_4

    const/4 v0, -0x1

    .line 39
    :cond_2
    :goto_0
    if-nez v0, :cond_3

    .line 40
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getCreatedTimestamp()J

    move-result-wide v1

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/Operation;->getCreatedTimestamp()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-lez v1, :cond_5

    const/4 v0, -0x1

    .line 45
    :cond_3
    :goto_1
    return v0

    .line 36
    :cond_4
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getPriority()I

    move-result v1

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/Operation;->getPriority()I

    move-result v2

    if-le v1, v2, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    .line 41
    :cond_5
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getCreatedTimestamp()J

    move-result-wide v1

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/Operation;->getCreatedTimestamp()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-gez v1, :cond_3

    const/4 v0, 0x1

    goto :goto_1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 6
    check-cast p1, Lcom/getjar/sdk/comm/Operation;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/getjar/sdk/comm/Operation;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/getjar/sdk/comm/OperationPriorityComparator;->compare(Lcom/getjar/sdk/comm/Operation;Lcom/getjar/sdk/comm/Operation;)I

    move-result v0

    return v0
.end method
