.class Lcom/tapjoy/TapjoyVideo$1;
.super Ljava/lang/Object;
.source "TapjoyVideo.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tapjoy/TapjoyVideo;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tapjoy/TapjoyVideo;


# direct methods
.method constructor <init>(Lcom/tapjoy/TapjoyVideo;)V
    .locals 0

    .prologue
    .line 188
    iput-object p1, p0, Lcom/tapjoy/TapjoyVideo$1;->this$0:Lcom/tapjoy/TapjoyVideo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 191
    const/4 v4, 0x0

    .line 193
    .local v4, "returnValue":Z
    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getURLParams()Ljava/lang/String;

    move-result-object v5

    .line 194
    .local v5, "urlParams":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "&publisher_user_id="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Lcom/tapjoy/TapjoyConnectCore;->getUserID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 197
    new-instance v6, Lcom/tapjoy/TapjoyURLConnection;

    invoke-direct {v6}, Lcom/tapjoy/TapjoyURLConnection;-><init>()V

    const-string v7, "https://ws.tapjoyads.com/videos?"

    invoke-virtual {v6, v7, v5}, Lcom/tapjoy/TapjoyURLConnection;->connectToURL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 200
    .local v3, "result":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 202
    iget-object v6, p0, Lcom/tapjoy/TapjoyVideo$1;->this$0:Lcom/tapjoy/TapjoyVideo;

    invoke-static {v6, v3}, Lcom/tapjoy/TapjoyVideo;->access$000(Lcom/tapjoy/TapjoyVideo;Ljava/lang/String;)Z

    move-result v4

    .line 206
    :cond_0
    if-eqz v4, :cond_3

    .line 209
    iget-object v6, p0, Lcom/tapjoy/TapjoyVideo$1;->this$0:Lcom/tapjoy/TapjoyVideo;

    invoke-static {v6}, Lcom/tapjoy/TapjoyVideo;->access$100(Lcom/tapjoy/TapjoyVideo;)Z

    .line 212
    const-string v6, "https://s3.amazonaws.com/tapjoy/videos/assets/watermark.png"

    if-eqz v6, :cond_1

    const-string v6, "https://s3.amazonaws.com/tapjoy/videos/assets/watermark.png"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_1

    .line 217
    :try_start_0
    new-instance v2, Ljava/net/URL;

    const-string v6, "https://s3.amazonaws.com/tapjoy/videos/assets/watermark.png"

    invoke-direct {v2, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 219
    .local v2, "fileURL":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 220
    .local v0, "connection":Ljava/net/URLConnection;
    const/16 v6, 0x3a98

    invoke-virtual {v0, v6}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 221
    const/16 v6, 0x61a8

    invoke-virtual {v0, v6}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 222
    invoke-virtual {v0}, Ljava/net/URLConnection;->connect()V

    .line 224
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-static {v6}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-static {v6}, Lcom/tapjoy/TapjoyVideo;->access$202(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    .end local v0    # "connection":Ljava/net/URLConnection;
    .end local v2    # "fileURL":Ljava/net/URL;
    :cond_1
    :goto_0
    iget-object v6, p0, Lcom/tapjoy/TapjoyVideo$1;->this$0:Lcom/tapjoy/TapjoyVideo;

    invoke-static {v6}, Lcom/tapjoy/TapjoyVideo;->access$300(Lcom/tapjoy/TapjoyVideo;)V

    .line 236
    iget-object v6, p0, Lcom/tapjoy/TapjoyVideo$1;->this$0:Lcom/tapjoy/TapjoyVideo;

    const/4 v7, 0x1

    invoke-static {v6, v7}, Lcom/tapjoy/TapjoyVideo;->access$402(Lcom/tapjoy/TapjoyVideo;Z)Z

    .line 238
    invoke-static {}, Lcom/tapjoy/TapjoyVideo;->videoNotifierReady()V

    .line 241
    iget-object v6, p0, Lcom/tapjoy/TapjoyVideo$1;->this$0:Lcom/tapjoy/TapjoyVideo;

    invoke-static {v6}, Lcom/tapjoy/TapjoyVideo;->access$500(Lcom/tapjoy/TapjoyVideo;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 243
    const-string v6, "TapjoyVideo"

    const-string v7, "trying to cache because of cache_auto flag..."

    invoke-static {v6, v7}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    iget-object v6, p0, Lcom/tapjoy/TapjoyVideo$1;->this$0:Lcom/tapjoy/TapjoyVideo;

    invoke-static {v6}, Lcom/tapjoy/TapjoyVideo;->access$600(Lcom/tapjoy/TapjoyVideo;)V

    .line 247
    :cond_2
    const-string v6, "TapjoyVideo"

    const-string v7, "------------------------------"

    invoke-static {v6, v7}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    const-string v6, "TapjoyVideo"

    const-string v7, "------------------------------"

    invoke-static {v6, v7}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    const-string v6, "TapjoyVideo"

    const-string v7, "INIT DONE!"

    invoke-static {v6, v7}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    const-string v6, "TapjoyVideo"

    const-string v7, "------------------------------"

    invoke-static {v6, v7}, Lcom/tapjoy/TapjoyLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    :goto_1
    return-void

    .line 226
    :catch_0
    move-exception v1

    .line 228
    .local v1, "e":Ljava/lang/Exception;
    const-string v6, "TapjoyVideo"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "e: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/tapjoy/TapjoyLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 255
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    const/4 v6, 0x2

    invoke-static {v6}, Lcom/tapjoy/TapjoyVideo;->videoNotifierError(I)V

    goto :goto_1
.end method
