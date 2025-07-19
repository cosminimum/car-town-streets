.class final Lcom/chartboost/sdk/impl/ba$e;
.super Lcom/chartboost/sdk/impl/ba$h;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/impl/ba;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/chartboost/sdk/impl/ba$h",
        "<TK;TV;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/impl/ba;

.field private final transient b:Lcom/chartboost/sdk/impl/ba$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/chartboost/sdk/impl/ba",
            "<TK;TV;TM;>.d;"
        }
    .end annotation
.end field

.field private final transient c:Lcom/chartboost/sdk/impl/ba$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/chartboost/sdk/impl/ba",
            "<TK;TV;TM;>.b;"
        }
    .end annotation
.end field

.field private final transient d:Lcom/chartboost/sdk/impl/ba$g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/chartboost/sdk/impl/ba",
            "<TK;TV;TM;>.g;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/chartboost/sdk/impl/ba;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 607
    iput-object p1, p0, Lcom/chartboost/sdk/impl/ba$e;->a:Lcom/chartboost/sdk/impl/ba;

    invoke-direct {p0}, Lcom/chartboost/sdk/impl/ba$h;-><init>()V

    .line 611
    new-instance v0, Lcom/chartboost/sdk/impl/ba$d;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/ba$e;->a:Lcom/chartboost/sdk/impl/ba;

    invoke-direct {v0, v1, v2}, Lcom/chartboost/sdk/impl/ba$d;-><init>(Lcom/chartboost/sdk/impl/ba;Lcom/chartboost/sdk/impl/ba$1;)V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/ba$e;->b:Lcom/chartboost/sdk/impl/ba$d;

    .line 612
    new-instance v0, Lcom/chartboost/sdk/impl/ba$b;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/ba$e;->a:Lcom/chartboost/sdk/impl/ba;

    invoke-direct {v0, v1, v2}, Lcom/chartboost/sdk/impl/ba$b;-><init>(Lcom/chartboost/sdk/impl/ba;Lcom/chartboost/sdk/impl/ba$1;)V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/ba$e;->c:Lcom/chartboost/sdk/impl/ba$b;

    .line 613
    new-instance v0, Lcom/chartboost/sdk/impl/ba$g;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/ba$e;->a:Lcom/chartboost/sdk/impl/ba;

    invoke-direct {v0, v1, v2}, Lcom/chartboost/sdk/impl/ba$g;-><init>(Lcom/chartboost/sdk/impl/ba;Lcom/chartboost/sdk/impl/ba$1;)V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/ba$e;->d:Lcom/chartboost/sdk/impl/ba$g;

    return-void
.end method


# virtual methods
.method public a()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 617
    iget-object v0, p0, Lcom/chartboost/sdk/impl/ba$e;->b:Lcom/chartboost/sdk/impl/ba$d;

    return-object v0
.end method

.method public b()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 622
    iget-object v0, p0, Lcom/chartboost/sdk/impl/ba$e;->c:Lcom/chartboost/sdk/impl/ba$b;

    return-object v0
.end method

.method public c()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 627
    iget-object v0, p0, Lcom/chartboost/sdk/impl/ba$e;->d:Lcom/chartboost/sdk/impl/ba$g;

    return-object v0
.end method
