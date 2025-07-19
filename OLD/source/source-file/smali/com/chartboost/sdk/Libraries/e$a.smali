.class Lcom/chartboost/sdk/Libraries/e$a;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/Libraries/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Lcom/chartboost/sdk/Libraries/a$a;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/Libraries/e;

.field private b:Ljava/lang/String;

.field private final c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private d:Lcom/chartboost/sdk/Libraries/e$b;

.field private e:Ljava/lang/String;

.field private f:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Lcom/chartboost/sdk/Libraries/e;Landroid/widget/ImageView;Lcom/chartboost/sdk/Libraries/e$b;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 109
    iput-object p1, p0, Lcom/chartboost/sdk/Libraries/e$a;->a:Lcom/chartboost/sdk/Libraries/e;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 110
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/chartboost/sdk/Libraries/e$a;->c:Ljava/lang/ref/WeakReference;

    .line 111
    new-instance v0, Lcom/chartboost/sdk/Libraries/e$c;

    invoke-direct {v0, p0}, Lcom/chartboost/sdk/Libraries/e$c;-><init>(Lcom/chartboost/sdk/Libraries/e$a;)V

    .line 112
    if-eqz p2, :cond_0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 113
    :cond_0
    iput-object p4, p0, Lcom/chartboost/sdk/Libraries/e$a;->e:Ljava/lang/String;

    .line 114
    iput-object p3, p0, Lcom/chartboost/sdk/Libraries/e$a;->d:Lcom/chartboost/sdk/Libraries/e$b;

    .line 115
    iput-object p5, p0, Lcom/chartboost/sdk/Libraries/e$a;->f:Landroid/os/Bundle;

    .line 116
    return-void
.end method


# virtual methods
.method protected varargs a([Ljava/lang/String;)Lcom/chartboost/sdk/Libraries/a$a;
    .locals 10

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 123
    aget-object v0, p1, v1

    iput-object v0, p0, Lcom/chartboost/sdk/Libraries/e$a;->b:Ljava/lang/String;

    .line 125
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$a;->f:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$a;->f:Landroid/os/Bundle;

    const-string v2, "paramNoMemoryCache"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 127
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/chartboost/sdk/Libraries/e$a;->a:Lcom/chartboost/sdk/Libraries/e;

    iget-object v4, p0, Lcom/chartboost/sdk/Libraries/e$a;->e:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/chartboost/sdk/Libraries/e;->a(Ljava/lang/String;)Lcom/chartboost/sdk/Libraries/a$a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 128
    if-eqz v4, :cond_2

    .line 129
    if-eqz v0, :cond_1

    move v2, v1

    :goto_1
    :try_start_1
    invoke-virtual {v4, v2}, Lcom/chartboost/sdk/Libraries/a$a;->a(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_8

    move-object v2, v4

    .line 136
    :goto_2
    if-eqz v2, :cond_3

    .line 189
    :goto_3
    return-object v2

    :cond_0
    move v0, v1

    .line 125
    goto :goto_0

    :cond_1
    move v2, v5

    .line 129
    goto :goto_1

    .line 131
    :catch_0
    move-exception v2

    move-object v4, v3

    .line 134
    :goto_4
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    move-object v2, v4

    goto :goto_2

    .line 139
    :cond_3
    invoke-static {}, Lcom/chartboost/sdk/impl/j;->b()Lorg/apache/http/client/HttpClient;

    move-result-object v4

    .line 140
    new-instance v6, Lorg/apache/http/client/methods/HttpGet;

    iget-object v7, p0, Lcom/chartboost/sdk/Libraries/e$a;->b:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 146
    :try_start_2
    invoke-interface {v4, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 147
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    .line 148
    const/16 v8, 0xc8

    if-eq v7, v8, :cond_4

    .line 149
    const-string v0, "ImageDownloader"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "Error "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 150
    const-string v4, " while retrieving bitmap from "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/chartboost/sdk/Libraries/e$a;->b:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 149
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v3

    .line 151
    goto :goto_3

    .line 154
    :cond_4
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    move-result-object v4

    .line 155
    if-eqz v4, :cond_9

    .line 158
    :try_start_3
    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v3

    .line 159
    iget-object v7, p0, Lcom/chartboost/sdk/Libraries/e$a;->a:Lcom/chartboost/sdk/Libraries/e;

    iget-object v8, p0, Lcom/chartboost/sdk/Libraries/e$a;->e:Ljava/lang/String;

    new-instance v9, Lcom/chartboost/sdk/Libraries/e$e;

    invoke-direct {v9, v3}, Lcom/chartboost/sdk/Libraries/e$e;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v7, v8, v9}, Lcom/chartboost/sdk/Libraries/e;->a(Ljava/lang/String;Lcom/chartboost/sdk/Libraries/e$e;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 161
    :try_start_4
    iget-object v7, p0, Lcom/chartboost/sdk/Libraries/e$a;->a:Lcom/chartboost/sdk/Libraries/e;

    iget-object v8, p0, Lcom/chartboost/sdk/Libraries/e$a;->e:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/chartboost/sdk/Libraries/e;->a(Ljava/lang/String;)Lcom/chartboost/sdk/Libraries/a$a;

    move-result-object v2

    .line 162
    if-eqz v2, :cond_8

    .line 163
    if-eqz v0, :cond_6

    :goto_5
    invoke-virtual {v2, v1}, Lcom/chartboost/sdk/Libraries/a$a;->a(Z)V

    .line 164
    if-nez v0, :cond_8

    .line 165
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$a;->a:Lcom/chartboost/sdk/Libraries/e;

    invoke-static {v0}, Lcom/chartboost/sdk/Libraries/e;->a(Lcom/chartboost/sdk/Libraries/e;)Lcom/chartboost/sdk/Libraries/a;

    move-result-object v0

    iget-object v1, p0, Lcom/chartboost/sdk/Libraries/e$a;->e:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/chartboost/sdk/Libraries/a;->a(Ljava/lang/String;Lcom/chartboost/sdk/Libraries/a$a;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object v0, v2

    .line 173
    :goto_6
    if-eqz v3, :cond_5

    .line 174
    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 176
    :cond_5
    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    :goto_7
    move-object v2, v0

    .line 189
    goto/16 :goto_3

    :cond_6
    move v1, v5

    .line 163
    goto :goto_5

    .line 167
    :catch_1
    move-exception v0

    .line 170
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-object v0, v2

    goto :goto_6

    .line 172
    :catchall_0
    move-exception v0

    .line 173
    if-eqz v3, :cond_7

    .line 174
    :try_start_7
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 176
    :cond_7
    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 177
    throw v0
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    .line 179
    :catch_2
    move-exception v0

    move-object v1, v0

    move-object v0, v2

    .line 180
    :goto_8
    invoke-virtual {v6}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    .line 181
    const-string v2, "CBWebImageCache"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "I/O error while retrieving bitmap from "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/chartboost/sdk/Libraries/e$a;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7

    .line 182
    :catch_3
    move-exception v0

    move-object v0, v2

    .line 183
    :goto_9
    invoke-virtual {v6}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    .line 184
    const-string v1, "CBWebImageCache"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Incorrect URL: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/chartboost/sdk/Libraries/e$a;->b:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    .line 185
    :catch_4
    move-exception v0

    move-object v1, v0

    move-object v0, v2

    .line 186
    :goto_a
    invoke-virtual {v6}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    .line 187
    const-string v2, "CBWebImageCache"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Error while retrieving bitmap from "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/chartboost/sdk/Libraries/e$a;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7

    .line 185
    :catch_5
    move-exception v1

    goto :goto_a

    .line 182
    :catch_6
    move-exception v1

    goto :goto_9

    .line 179
    :catch_7
    move-exception v1

    goto :goto_8

    .line 131
    :catch_8
    move-exception v2

    goto/16 :goto_4

    :cond_8
    move-object v0, v2

    goto :goto_6

    :cond_9
    move-object v0, v2

    goto :goto_7
.end method

.method protected a(Lcom/chartboost/sdk/Libraries/a$a;)V
    .locals 2

    .prologue
    .line 197
    invoke-virtual {p0}, Lcom/chartboost/sdk/Libraries/e$a;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 224
    :cond_0
    :goto_0
    return-void

    .line 203
    :cond_1
    if-eqz p1, :cond_2

    .line 204
    :try_start_0
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$a;->a:Lcom/chartboost/sdk/Libraries/e;

    invoke-static {v0}, Lcom/chartboost/sdk/Libraries/e;->a(Lcom/chartboost/sdk/Libraries/e;)Lcom/chartboost/sdk/Libraries/a;

    move-result-object v0

    iget-object v1, p0, Lcom/chartboost/sdk/Libraries/e$a;->e:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/chartboost/sdk/Libraries/a;->a(Ljava/lang/String;Lcom/chartboost/sdk/Libraries/a$a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$a;->c:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_3

    .line 213
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$a;->c:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 214
    invoke-static {v0}, Lcom/chartboost/sdk/Libraries/e;->a(Landroid/widget/ImageView;)Lcom/chartboost/sdk/Libraries/e$a;

    move-result-object v1

    .line 218
    if-ne p0, v1, :cond_3

    .line 219
    invoke-virtual {p1}, Lcom/chartboost/sdk/Libraries/a$a;->b()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 223
    :cond_3
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$a;->d:Lcom/chartboost/sdk/Libraries/e$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/e$a;->d:Lcom/chartboost/sdk/Libraries/e$b;

    iget-object v1, p0, Lcom/chartboost/sdk/Libraries/e$a;->f:Landroid/os/Bundle;

    invoke-interface {v0, p1, v1}, Lcom/chartboost/sdk/Libraries/e$b;->a(Lcom/chartboost/sdk/Libraries/a$a;Landroid/os/Bundle;)V

    goto :goto_0

    .line 206
    :catch_0
    move-exception v0

    .line 209
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method protected varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/chartboost/sdk/Libraries/e$a;->a([Ljava/lang/String;)Lcom/chartboost/sdk/Libraries/a$a;

    move-result-object v0

    return-object v0
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Lcom/chartboost/sdk/Libraries/a$a;

    invoke-virtual {p0, p1}, Lcom/chartboost/sdk/Libraries/e$a;->a(Lcom/chartboost/sdk/Libraries/a$a;)V

    return-void
.end method
