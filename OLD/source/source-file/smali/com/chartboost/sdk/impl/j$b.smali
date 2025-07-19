.class public Lcom/chartboost/sdk/impl/j$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/impl/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "b"
.end annotation


# instance fields
.field public a:Lcom/chartboost/sdk/impl/k;

.field public b:Lorg/json/JSONObject;

.field public c:Ljava/lang/Integer;

.field final synthetic d:Lcom/chartboost/sdk/impl/j;


# direct methods
.method public constructor <init>(Lcom/chartboost/sdk/impl/j;Lcom/chartboost/sdk/impl/k;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/chartboost/sdk/impl/j$b;->d:Lcom/chartboost/sdk/impl/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p2, p0, Lcom/chartboost/sdk/impl/j$b;->a:Lcom/chartboost/sdk/impl/k;

    .line 63
    iput-object p3, p0, Lcom/chartboost/sdk/impl/j$b;->b:Lorg/json/JSONObject;

    .line 64
    return-void
.end method
