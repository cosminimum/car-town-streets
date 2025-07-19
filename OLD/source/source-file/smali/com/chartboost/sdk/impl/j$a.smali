.class public Lcom/chartboost/sdk/impl/j$a;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/impl/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/chartboost/sdk/impl/j$b;",
        "Ljava/lang/Void;",
        "Lcom/chartboost/sdk/impl/j$b;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/impl/j;


# direct methods
.method protected constructor <init>(Lcom/chartboost/sdk/impl/j;)V
    .locals 0

    .prologue
    .line 183
    iput-object p1, p0, Lcom/chartboost/sdk/impl/j$a;->a:Lcom/chartboost/sdk/impl/j;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs a([Lcom/chartboost/sdk/impl/j$b;)Lcom/chartboost/sdk/impl/j$b;
    .locals 8

    .prologue
    .line 193
    const/4 v0, 0x0

    aget-object v2, p1, v0

    .line 194
    iget-object v3, v2, Lcom/chartboost/sdk/impl/j$b;->a:Lcom/chartboost/sdk/impl/k;

    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/j$a;->a:Lcom/chartboost/sdk/impl/j;

    iget-object v1, v1, Lcom/chartboost/sdk/impl/j;->a:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/chartboost/sdk/impl/k;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 196
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v4, v0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 199
    const-string v0, "Content-Type"

    const-string v1, "application/json; charset=UTF-8"

    invoke-virtual {v4, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    const-string v0, "Accept"

    const-string v1, "application/json; charset=UTF-8"

    invoke-virtual {v4, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    const-string v0, "X-Chartboost-Client"

    const-string v1, "Chartboost-Android-SDK 3.1.5"

    invoke-virtual {v4, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    const-string v0, "X-Chartboost-API"

    const-string v1, "3.1.5"

    invoke-virtual {v4, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    invoke-virtual {v3}, Lcom/chartboost/sdk/impl/k;->c()Ljava/util/Map;

    move-result-object v5

    .line 207
    if-eqz v5, :cond_0

    .line 208
    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 214
    :cond_0
    iget-object v1, p0, Lcom/chartboost/sdk/impl/j$a;->a:Lcom/chartboost/sdk/impl/j;

    monitor-enter v1

    .line 215
    :try_start_0
    invoke-static {}, Lcom/chartboost/sdk/impl/j;->c()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/chartboost/sdk/impl/j;->a(I)V

    .line 214
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 217
    const/4 v1, 0x0

    .line 220
    :try_start_1
    iget-object v5, v3, Lcom/chartboost/sdk/impl/k;->e:Lorg/json/JSONObject;

    if-eqz v5, :cond_2

    .line 221
    new-instance v0, Lorg/apache/http/entity/StringEntity;

    iget-object v5, v3, Lcom/chartboost/sdk/impl/k;->e:Lorg/json/JSONObject;

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    .line 225
    new-instance v5, Lorg/apache/http/message/BasicHeader;

    const-string v6, "Content-Type"

    const-string v7, "application/json"

    invoke-direct {v5, v6, v7}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Lorg/apache/http/entity/StringEntity;->setContentType(Lorg/apache/http/Header;)V

    .line 226
    invoke-virtual {v4, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 231
    :goto_1
    invoke-static {}, Lcom/chartboost/sdk/impl/j;->b()Lorg/apache/http/client/HttpClient;

    move-result-object v0

    invoke-interface {v0, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 233
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    .line 235
    const/16 v4, 0x12c

    if-ge v0, v4, :cond_5

    const/16 v4, 0xc8

    if-lt v0, v4, :cond_5

    .line 236
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    const/16 v5, 0x800

    invoke-direct {v0, v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 237
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 238
    :goto_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_4

    .line 241
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 242
    new-instance v0, Lorg/json/JSONTokener;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 243
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Lorg/json/JSONTokener;)V

    .line 251
    iput-object v4, v3, Lcom/chartboost/sdk/impl/k;->j:Lorg/json/JSONObject;

    .line 252
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v0, v2

    .line 277
    :goto_3
    return-object v0

    .line 208
    :cond_1
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 209
    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 214
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 228
    :cond_2
    :try_start_3
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "HTTP Request Body "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v5, v3, Lcom/chartboost/sdk/impl/k;->b:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v5, "<empty>"

    invoke-static {v0, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_1

    .line 261
    :catch_0
    move-exception v0

    .line 262
    const-string v3, "Chartboost"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Exception on http request: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    if-eqz v1, :cond_3

    :try_start_4
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 270
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :cond_3
    :goto_4
    move-object v0, v2

    .line 277
    goto :goto_3

    .line 239
    :cond_4
    :try_start_5
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 256
    :cond_5
    const-string v3, "Chartboost"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Request failed. Response code: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ", body: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    move-object v0, v2

    .line 258
    goto/16 :goto_3

    .line 271
    :catch_1
    move-exception v0

    goto :goto_4
.end method

.method protected a(Lcom/chartboost/sdk/impl/j$b;)V
    .locals 3

    .prologue
    .line 285
    iget-object v0, p0, Lcom/chartboost/sdk/impl/j$a;->a:Lcom/chartboost/sdk/impl/j;

    iget-object v0, v0, Lcom/chartboost/sdk/impl/j;->d:Landroid/util/SparseArray;

    iget-object v1, p1, Lcom/chartboost/sdk/impl/j$b;->c:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 286
    iget-object v0, p1, Lcom/chartboost/sdk/impl/j$b;->a:Lcom/chartboost/sdk/impl/k;

    iget-object v0, v0, Lcom/chartboost/sdk/impl/k;->j:Lorg/json/JSONObject;

    if-eqz v0, :cond_1

    .line 287
    iget-object v0, p0, Lcom/chartboost/sdk/impl/j$a;->a:Lcom/chartboost/sdk/impl/j;

    iget-object v0, v0, Lcom/chartboost/sdk/impl/j;->b:Lcom/chartboost/sdk/impl/j$c;

    if-eqz v0, :cond_0

    .line 288
    iget-object v0, p0, Lcom/chartboost/sdk/impl/j$a;->a:Lcom/chartboost/sdk/impl/j;

    iget-object v0, v0, Lcom/chartboost/sdk/impl/j;->b:Lcom/chartboost/sdk/impl/j$c;

    iget-object v1, p1, Lcom/chartboost/sdk/impl/j$b;->a:Lcom/chartboost/sdk/impl/k;

    iget-object v1, v1, Lcom/chartboost/sdk/impl/k;->j:Lorg/json/JSONObject;

    iget-object v2, p1, Lcom/chartboost/sdk/impl/j$b;->a:Lcom/chartboost/sdk/impl/k;

    invoke-interface {v0, v1, v2}, Lcom/chartboost/sdk/impl/j$c;->a(Lorg/json/JSONObject;Lcom/chartboost/sdk/impl/k;)V

    .line 292
    :cond_0
    :goto_0
    return-void

    .line 290
    :cond_1
    iget-object v0, p0, Lcom/chartboost/sdk/impl/j$a;->a:Lcom/chartboost/sdk/impl/j;

    iget-object v1, p1, Lcom/chartboost/sdk/impl/j$b;->a:Lcom/chartboost/sdk/impl/k;

    invoke-static {v0, v1}, Lcom/chartboost/sdk/impl/j;->a(Lcom/chartboost/sdk/impl/j;Lcom/chartboost/sdk/impl/k;)V

    goto :goto_0
.end method

.method protected varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Lcom/chartboost/sdk/impl/j$b;

    invoke-virtual {p0, p1}, Lcom/chartboost/sdk/impl/j$a;->a([Lcom/chartboost/sdk/impl/j$b;)Lcom/chartboost/sdk/impl/j$b;

    move-result-object v0

    return-object v0
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Lcom/chartboost/sdk/impl/j$b;

    invoke-virtual {p0, p1}, Lcom/chartboost/sdk/impl/j$a;->a(Lcom/chartboost/sdk/impl/j$b;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 188
    return-void
.end method
