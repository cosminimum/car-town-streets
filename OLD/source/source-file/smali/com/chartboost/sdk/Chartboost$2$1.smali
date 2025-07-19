.class Lcom/chartboost/sdk/Chartboost$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/chartboost/sdk/impl/k$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/chartboost/sdk/Chartboost$2;->a(Lcom/chartboost/sdk/impl/a;Ljava/lang/String;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/Chartboost$2;

.field private final synthetic b:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/chartboost/sdk/Chartboost$2;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/chartboost/sdk/Chartboost$2$1;->a:Lcom/chartboost/sdk/Chartboost$2;

    iput-object p2, p0, Lcom/chartboost/sdk/Chartboost$2$1;->b:Ljava/lang/String;

    .line 1088
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;)V
    .locals 2

    .prologue
    .line 1091
    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    iget-object v1, p0, Lcom/chartboost/sdk/Chartboost$2$1;->b:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 1092
    return-void
.end method
