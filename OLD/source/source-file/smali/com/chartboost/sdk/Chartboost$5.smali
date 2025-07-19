.class Lcom/chartboost/sdk/Chartboost$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/chartboost/sdk/impl/k$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/chartboost/sdk/Chartboost;->a(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/Chartboost;

.field private final synthetic b:Z

.field private final synthetic c:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/chartboost/sdk/Chartboost;ZLjava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/chartboost/sdk/Chartboost$5;->a:Lcom/chartboost/sdk/Chartboost;

    iput-boolean p2, p0, Lcom/chartboost/sdk/Chartboost$5;->b:Z

    iput-object p3, p0, Lcom/chartboost/sdk/Chartboost$5;->c:Ljava/lang/String;

    .line 822
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;)V
    .locals 4

    .prologue
    .line 825
    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    sget-object v1, Lcom/chartboost/sdk/impl/a$c;->b:Lcom/chartboost/sdk/impl/a$c;

    iget-boolean v2, p0, Lcom/chartboost/sdk/Chartboost$5;->b:Z

    iget-object v3, p0, Lcom/chartboost/sdk/Chartboost$5;->c:Ljava/lang/String;

    invoke-static {v0, p1, v1, v2, v3}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Lorg/json/JSONObject;Lcom/chartboost/sdk/impl/a$c;ZLjava/lang/String;)V

    .line 826
    return-void
.end method
