.class final Lcom/getjar/sdk/data/usage/UsageManager$1;
.super Ljava/lang/Object;
.source "UsageManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/usage/UsageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/getjar/sdk/data/usage/AggregateUsageRecord;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 502
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/getjar/sdk/data/usage/AggregateUsageRecord;Lcom/getjar/sdk/data/usage/AggregateUsageRecord;)I
    .locals 2
    .param p1, "lhs"    # Lcom/getjar/sdk/data/usage/AggregateUsageRecord;
    .param p2, "rhs"    # Lcom/getjar/sdk/data/usage/AggregateUsageRecord;

    .prologue
    .line 503
    invoke-virtual {p2}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 502
    check-cast p1, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/getjar/sdk/data/usage/UsageManager$1;->compare(Lcom/getjar/sdk/data/usage/AggregateUsageRecord;Lcom/getjar/sdk/data/usage/AggregateUsageRecord;)I

    move-result v0

    return v0
.end method
