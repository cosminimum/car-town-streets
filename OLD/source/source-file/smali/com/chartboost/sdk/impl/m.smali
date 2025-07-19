.class public Lcom/chartboost/sdk/impl/m;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/chartboost/sdk/impl/m$a;
    }
.end annotation


# instance fields
.field public a:Lcom/chartboost/sdk/impl/m$a;


# direct methods
.method public constructor <init>(Lcom/chartboost/sdk/impl/m$a;)V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/chartboost/sdk/impl/m;->a:Lcom/chartboost/sdk/impl/m$a;

    .line 29
    return-void
.end method

.method static synthetic a(Lcom/chartboost/sdk/impl/m;Ljava/lang/String;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Lcom/chartboost/sdk/impl/m;->b(Ljava/lang/String;Landroid/content/Context;)V

    return-void
.end method

.method private b(Ljava/lang/String;Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 80
    iget-object v0, p0, Lcom/chartboost/sdk/impl/m;->a:Lcom/chartboost/sdk/impl/m$a;

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/chartboost/sdk/impl/m;->a:Lcom/chartboost/sdk/impl/m$a;

    invoke-interface {v0, p1}, Lcom/chartboost/sdk/impl/m$a;->a(Ljava/lang/String;)V

    .line 88
    :cond_0
    if-nez p2, :cond_1

    .line 89
    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getContext()Landroid/content/Context;

    move-result-object p2

    .line 90
    :cond_1
    if-nez p2, :cond_3

    .line 114
    :cond_2
    :goto_0
    return-void

    .line 94
    :cond_3
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 95
    instance-of v1, p2, Landroid/app/Activity;

    if-nez v1, :cond_4

    .line 96
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 97
    :cond_4
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 98
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 99
    :catch_0
    move-exception v0

    .line 101
    :try_start_1
    const-string v0, "market://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "http://market.android.com/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x9

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 103
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 104
    instance-of v2, p2, Landroid/app/Activity;

    if-nez v2, :cond_5

    .line 105
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 106
    :cond_5
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 107
    invoke-virtual {p2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 109
    :catch_1
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public a(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2

    .prologue
    .line 33
    .line 35
    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 40
    if-nez v0, :cond_0

    .line 76
    :goto_0
    return-void

    .line 42
    :cond_0
    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/chartboost/sdk/impl/m;->b(Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0

    .line 48
    :cond_1
    new-instance v0, Lcom/chartboost/sdk/impl/m$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/chartboost/sdk/impl/m$1;-><init>(Lcom/chartboost/sdk/impl/m;Ljava/lang/String;Landroid/content/Context;)V

    .line 75
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 36
    :catch_0
    move-exception v0

    goto :goto_0
.end method
