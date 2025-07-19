.class Lcom/chartboost/sdk/Chartboost$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/chartboost/sdk/impl/k$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/chartboost/sdk/Chartboost;->a(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/Chartboost;

.field private final synthetic b:Z


# direct methods
.method constructor <init>(Lcom/chartboost/sdk/Chartboost;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/chartboost/sdk/Chartboost$6;->a:Lcom/chartboost/sdk/Chartboost;

    iput-boolean p2, p0, Lcom/chartboost/sdk/Chartboost$6;->b:Z

    .line 856
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;)V
    .locals 4

    .prologue
    .line 859
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$6;->a:Lcom/chartboost/sdk/Chartboost;

    .line 860
    sget-object v1, Lcom/chartboost/sdk/impl/a$c;->c:Lcom/chartboost/sdk/impl/a$c;

    iget-boolean v2, p0, Lcom/chartboost/sdk/Chartboost$6;->b:Z

    const/4 v3, 0x0

    .line 859
    invoke-static {v0, p1, v1, v2, v3}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Lorg/json/JSONObject;Lcom/chartboost/sdk/impl/a$c;ZLjava/lang/String;)V

    .line 861
    return-void
.end method
