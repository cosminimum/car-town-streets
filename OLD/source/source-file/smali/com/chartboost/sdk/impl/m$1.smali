.class Lcom/chartboost/sdk/impl/m$1;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/chartboost/sdk/impl/m;->a(Ljava/lang/String;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/impl/m;

.field private final synthetic b:Ljava/lang/String;

.field private final synthetic c:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/chartboost/sdk/impl/m;Ljava/lang/String;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/chartboost/sdk/impl/m$1;->a:Lcom/chartboost/sdk/impl/m;

    iput-object p2, p0, Lcom/chartboost/sdk/impl/m$1;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/chartboost/sdk/impl/m$1;->c:Landroid/content/Context;

    .line 48
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Void;)Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 51
    .line 53
    :try_start_0
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/m$1;->b:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 54
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    const/4 v1, 0x0

    :try_start_1
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 56
    const-string v1, "Location"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 57
    if-nez v1, :cond_0

    .line 58
    iget-object v1, p0, Lcom/chartboost/sdk/impl/m$1;->b:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 64
    :cond_0
    if-eqz v0, :cond_1

    .line 65
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 67
    :cond_1
    :goto_0
    return-object v1

    .line 60
    :catch_0
    move-exception v0

    move-object v0, v2

    .line 64
    :goto_1
    if-eqz v0, :cond_2

    .line 65
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_2
    move-object v1, v2

    .line 67
    goto :goto_0

    .line 63
    :catchall_0
    move-exception v0

    .line 64
    :goto_2
    if-eqz v2, :cond_3

    .line 65
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 66
    :cond_3
    throw v0

    .line 63
    :catchall_1
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    goto :goto_2

    .line 60
    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public a(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/chartboost/sdk/impl/m$1;->a:Lcom/chartboost/sdk/impl/m;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/m$1;->c:Landroid/content/Context;

    invoke-static {v0, p1, v1}, Lcom/chartboost/sdk/impl/m;->a(Lcom/chartboost/sdk/impl/m;Ljava/lang/String;Landroid/content/Context;)V

    .line 73
    return-void
.end method

.method public varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/chartboost/sdk/impl/m$1;->a([Ljava/lang/Void;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/chartboost/sdk/impl/m$1;->a(Ljava/lang/String;)V

    return-void
.end method
