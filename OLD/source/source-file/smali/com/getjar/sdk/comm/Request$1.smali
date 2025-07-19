.class Lcom/getjar/sdk/comm/Request$1;
.super Ljava/lang/Object;
.source "Request.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/Request;->getUniqueId()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/apache/http/NameValuePair;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/Request;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/Request;)V
    .locals 0

    .prologue
    .line 235
    iput-object p1, p0, Lcom/getjar/sdk/comm/Request$1;->this$0:Lcom/getjar/sdk/comm/Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 235
    check-cast p1, Lorg/apache/http/NameValuePair;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/apache/http/NameValuePair;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/getjar/sdk/comm/Request$1;->compare(Lorg/apache/http/NameValuePair;Lorg/apache/http/NameValuePair;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/apache/http/NameValuePair;Lorg/apache/http/NameValuePair;)I
    .locals 2
    .param p1, "lhs"    # Lorg/apache/http/NameValuePair;
    .param p2, "rhs"    # Lorg/apache/http/NameValuePair;

    .prologue
    .line 238
    invoke-interface {p1}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
