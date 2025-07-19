.class Lcom/getjar/sdk/data/LocalizationEngine$1;
.super Ljava/lang/Object;
.source "LocalizationEngine.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/data/LocalizationEngine;->retrieveRecommendedPricesAsync(Ljava/util/Collection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/data/LocalizationEngine;

.field final synthetic val$prices:Ljava/util/Collection;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/data/LocalizationEngine;Ljava/util/Collection;)V
    .locals 0

    .prologue
    .line 173
    iput-object p1, p0, Lcom/getjar/sdk/data/LocalizationEngine$1;->this$0:Lcom/getjar/sdk/data/LocalizationEngine;

    iput-object p2, p0, Lcom/getjar/sdk/data/LocalizationEngine$1;->val$prices:Ljava/util/Collection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 178
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/data/LocalizationEngine$1;->this$0:Lcom/getjar/sdk/data/LocalizationEngine;

    iget-object v2, p0, Lcom/getjar/sdk/data/LocalizationEngine$1;->val$prices:Ljava/util/Collection;

    invoke-static {v1, v2}, Lcom/getjar/sdk/data/LocalizationEngine;->access$000(Lcom/getjar/sdk/data/LocalizationEngine;Ljava/util/Collection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    :goto_0
    return-void

    .line 179
    :catch_0
    move-exception v0

    .line 180
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LOCALIZATION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "LocalizationEngine retrieveFailed "

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
