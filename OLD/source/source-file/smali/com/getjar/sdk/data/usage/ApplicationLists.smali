.class public Lcom/getjar/sdk/data/usage/ApplicationLists;
.super Ljava/lang/Object;
.source "ApplicationLists.java"


# instance fields
.field private final _newNonDisposedStart:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;",
            ">;"
        }
    .end annotation
.end field

.field private final _oldNonDisposedStart:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 12
    .local p1, "newNonDisposedStart":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    .local p2, "oldNonDisposedStart":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'newNonDisposedStart\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 15
    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'oldNonDisposedStart\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 17
    :cond_1
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/usage/ApplicationLists;->_newNonDisposedStart:Ljava/util/List;

    .line 18
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/usage/ApplicationLists;->_oldNonDisposedStart:Ljava/util/List;

    .line 19
    return-void
.end method


# virtual methods
.method public getNewNonDisposedStart()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 21
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/ApplicationLists;->_newNonDisposedStart:Ljava/util/List;

    return-object v0
.end method

.method public getOldNonDisposedStart()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 22
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/ApplicationLists;->_oldNonDisposedStart:Ljava/util/List;

    return-object v0
.end method
