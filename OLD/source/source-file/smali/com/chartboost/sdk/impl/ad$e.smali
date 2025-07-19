.class Lcom/chartboost/sdk/impl/ad$e;
.super Lcom/chartboost/sdk/impl/ad$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/impl/ad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "e"
.end annotation


# direct methods
.method constructor <init>(Lcom/chartboost/sdk/impl/af;)V
    .locals 0

    .prologue
    .line 249
    invoke-direct {p0, p1}, Lcom/chartboost/sdk/impl/ad$c;-><init>(Lcom/chartboost/sdk/impl/af;)V

    .line 250
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 3

    .prologue
    .line 254
    check-cast p1, Lcom/chartboost/sdk/impl/z;

    .line 255
    new-instance v0, Lcom/chartboost/sdk/impl/w;

    invoke-direct {v0}, Lcom/chartboost/sdk/impl/w;-><init>()V

    .line 256
    const-string v1, "$ref"

    invoke-virtual {p1}, Lcom/chartboost/sdk/impl/z;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/chartboost/sdk/impl/w;->a(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    const-string v1, "$id"

    invoke-virtual {p1}, Lcom/chartboost/sdk/impl/z;->a()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/chartboost/sdk/impl/w;->a(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    iget-object v1, p0, Lcom/chartboost/sdk/impl/ad$e;->a:Lcom/chartboost/sdk/impl/af;

    invoke-interface {v1, v0, p2}, Lcom/chartboost/sdk/impl/af;->a(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 259
    return-void
.end method
