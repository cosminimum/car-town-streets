.class public Lcom/chartboost/sdk/Analytics/CBAnalytics;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final TAG:Ljava/lang/String; = "Chartboost Analytics"

.field private static a:Lcom/chartboost/sdk/Analytics/CBAnalytics;


# instance fields
.field private b:Lcom/chartboost/sdk/impl/j;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/4 v0, 0x0

    sput-object v0, Lcom/chartboost/sdk/Analytics/CBAnalytics;->a:Lcom/chartboost/sdk/Analytics/CBAnalytics;

    .line 12
    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Lcom/chartboost/sdk/impl/j;

    const-string v1, "CBAnalytics"

    invoke-direct {v0, v2, v2, v1}, Lcom/chartboost/sdk/impl/j;-><init>(Ljava/lang/String;Lcom/chartboost/sdk/impl/j$c;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/chartboost/sdk/Analytics/CBAnalytics;->b:Lcom/chartboost/sdk/impl/j;

    .line 31
    iget-object v0, p0, Lcom/chartboost/sdk/Analytics/CBAnalytics;->b:Lcom/chartboost/sdk/impl/j;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/j;->a()V

    .line 32
    return-void
.end method

.method private a(DII)Ljava/lang/String;
    .locals 4

    .prologue
    .line 38
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1, p2}, Ljava/math/BigDecimal;-><init>(D)V

    .line 39
    invoke-virtual {v0, p3, p4}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object v0

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized sharedAnalytics()Lcom/chartboost/sdk/Analytics/CBAnalytics;
    .locals 2

    .prologue
    .line 24
    const-class v1, Lcom/chartboost/sdk/Analytics/CBAnalytics;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/chartboost/sdk/Analytics/CBAnalytics;->a:Lcom/chartboost/sdk/Analytics/CBAnalytics;

    if-nez v0, :cond_0

    .line 25
    new-instance v0, Lcom/chartboost/sdk/Analytics/CBAnalytics;

    invoke-direct {v0}, Lcom/chartboost/sdk/Analytics/CBAnalytics;-><init>()V

    sput-object v0, Lcom/chartboost/sdk/Analytics/CBAnalytics;->a:Lcom/chartboost/sdk/Analytics/CBAnalytics;

    .line 26
    :cond_0
    sget-object v0, Lcom/chartboost/sdk/Analytics/CBAnalytics;->a:Lcom/chartboost/sdk/Analytics/CBAnalytics;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 24
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public recordPaymentTransaction(Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;ILjava/util/Map;)Ljava/lang/Boolean;
    .locals 8
    .param p1, "sku"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "price"    # D
    .param p5, "currency"    # Ljava/lang/String;
    .param p6, "quantity"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "D",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .prologue
    .line 45
    .local p7, "meta":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getContext()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_0

    .line 47
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The context must be set through the Chartboost method onCreate() before calling recordPaymentTransaction()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_0
    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getAppID()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getAppSignature()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    .line 50
    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 69
    :goto_0
    return-object v0

    .line 52
    :cond_2
    new-instance v1, Lcom/chartboost/sdk/impl/k;

    const-string v2, "api"

    const-string v3, "purchase"

    invoke-direct {v1, v2, v3}, Lcom/chartboost/sdk/impl/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/chartboost/sdk/impl/k;->a(Landroid/content/Context;)V

    .line 54
    const-string v2, "product_id"

    invoke-virtual {v1, v2, p1}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    const-string v2, "title"

    invoke-virtual {v1, v2, p2}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    const-string v2, "price"

    const/4 v3, 0x2

    const/4 v4, 0x4

    invoke-direct {p0, p3, p4, v3, v4}, Lcom/chartboost/sdk/Analytics/CBAnalytics;->a(DII)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const-string v2, "currency"

    invoke-virtual {v1, v2, p5}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    const-string v2, "quantity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    const-string v2, "timestamp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    long-to-double v4, v4

    const-wide v6, 0x408f400000000000L    # 1000.0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    if-eqz p7, :cond_3

    .line 63
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p7}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 64
    const-string v3, "meta"

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    :cond_3
    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getAppID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getAppSignature()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/chartboost/sdk/impl/k;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    iget-object v0, p0, Lcom/chartboost/sdk/Analytics/CBAnalytics;->b:Lcom/chartboost/sdk/impl/j;

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/impl/j;->a(Lcom/chartboost/sdk/impl/k;)V

    .line 69
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public trackEvent(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 3
    .param p1, "eventIdentifier"    # Ljava/lang/String;

    .prologue
    .line 74
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/chartboost/sdk/Analytics/CBAnalytics;->trackEvent(Ljava/lang/String;DLjava/util/Map;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public trackEvent(Ljava/lang/String;D)Ljava/lang/Boolean;
    .locals 1
    .param p1, "eventIdentifier"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/chartboost/sdk/Analytics/CBAnalytics;->trackEvent(Ljava/lang/String;DLjava/util/Map;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public trackEvent(Ljava/lang/String;DLjava/util/Map;)Ljava/lang/Boolean;
    .locals 9
    .param p1, "eventIdentifier"    # Ljava/lang/String;
    .param p2, "value"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .prologue
    .local p4, "meta":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v8, 0x1

    .line 84
    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    .line 85
    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getContext()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_0

    .line 86
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The context must be set through the Chartboost method onCreate() before calling trackEvent()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_0
    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getAppID()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getAppSignature()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    .line 89
    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 107
    :goto_0
    return-object v0

    .line 91
    :cond_2
    new-instance v1, Lcom/chartboost/sdk/impl/k;

    const-string v2, "api"

    const-string v3, "event"

    invoke-direct {v1, v2, v3}, Lcom/chartboost/sdk/impl/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/chartboost/sdk/impl/k;->a(Landroid/content/Context;)V

    .line 93
    const-string v2, "key"

    invoke-virtual {v1, v2, p1}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    const-string v2, "value"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    const-string v2, "timestamp"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    long-to-double v4, v4

    const-wide v6, 0x408f400000000000L    # 1000.0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    if-eqz p4, :cond_3

    .line 99
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p4}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 100
    const-string v3, "meta"

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/chartboost/sdk/impl/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    :cond_3
    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getAppID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getAppSignature()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/chartboost/sdk/impl/k;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    iput-boolean v8, v1, Lcom/chartboost/sdk/impl/k;->i:Z

    .line 105
    iget-object v0, p0, Lcom/chartboost/sdk/Analytics/CBAnalytics;->b:Lcom/chartboost/sdk/impl/j;

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/impl/j;->a(Lcom/chartboost/sdk/impl/k;)V

    .line 107
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method
