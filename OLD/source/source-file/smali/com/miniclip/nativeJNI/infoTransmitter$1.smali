.class Lcom/miniclip/nativeJNI/infoTransmitter$1;
.super Ljava/lang/Thread;
.source "infoTransmitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/infoTransmitter;->send()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/infoTransmitter;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/infoTransmitter;)V
    .locals 0

    .prologue
    .line 296
    iput-object p1, p0, Lcom/miniclip/nativeJNI/infoTransmitter$1;->this$0:Lcom/miniclip/nativeJNI/infoTransmitter;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 299
    iget-object v9, p0, Lcom/miniclip/nativeJNI/infoTransmitter$1;->this$0:Lcom/miniclip/nativeJNI/infoTransmitter;

    invoke-static {v9}, Lcom/miniclip/nativeJNI/infoTransmitter;->access$000(Lcom/miniclip/nativeJNI/infoTransmitter;)Lorg/json/JSONObject;

    move-result-object v3

    .line 300
    .local v3, "info":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    .line 304
    .local v1, "data":Ljava/lang/String;
    :try_start_0
    new-instance v7, Ljava/net/URL;

    const-string v9, "https://ftp.miniclippt.com/submit_stats.php"

    invoke-direct {v7, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 306
    .local v7, "url":Ljava/net/URL;
    invoke-static {}, Lcom/miniclip/nativeJNI/infoTransmitter;->access$100()V

    .line 307
    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .line 308
    .local v0, "conn":Ljavax/net/ssl/HttpsURLConnection;
    sget-object v9, Lcom/miniclip/nativeJNI/infoTransmitter;->DO_NOT_VERIFY:Ljavax/net/ssl/HostnameVerifier;

    invoke-virtual {v0, v9}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 309
    const/16 v9, 0x7d0

    invoke-virtual {v0, v9}, Ljavax/net/ssl/HttpsURLConnection;->setConnectTimeout(I)V

    .line 310
    const/4 v9, 0x1

    invoke-virtual {v0, v9}, Ljavax/net/ssl/HttpsURLConnection;->setDoOutput(Z)V

    .line 311
    new-instance v8, Ljava/io/OutputStreamWriter;

    invoke-virtual {v0}, Ljavax/net/ssl/HttpsURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 313
    .local v8, "wr":Ljava/io/OutputStreamWriter;
    invoke-virtual {v8, v1}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 314
    invoke-virtual {v8}, Ljava/io/OutputStreamWriter;->flush()V

    .line 318
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 320
    .local v6, "rd":Ljava/io/BufferedReader;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 322
    .local v5, "lines":Ljava/lang/StringBuffer;
    :goto_0
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "line":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 323
    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 331
    .end local v0    # "conn":Ljavax/net/ssl/HttpsURLConnection;
    .end local v4    # "line":Ljava/lang/String;
    .end local v5    # "lines":Ljava/lang/StringBuffer;
    .end local v6    # "rd":Ljava/io/BufferedReader;
    .end local v7    # "url":Ljava/net/URL;
    .end local v8    # "wr":Ljava/io/OutputStreamWriter;
    :catch_0
    move-exception v2

    .line 332
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 334
    .end local v2    # "e":Ljava/io/IOException;
    :goto_1
    return-void

    .line 325
    .restart local v0    # "conn":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v4    # "line":Ljava/lang/String;
    .restart local v5    # "lines":Ljava/lang/StringBuffer;
    .restart local v6    # "rd":Ljava/io/BufferedReader;
    .restart local v7    # "url":Ljava/net/URL;
    .restart local v8    # "wr":Ljava/io/OutputStreamWriter;
    :cond_0
    :try_start_1
    invoke-virtual {v8}, Ljava/io/OutputStreamWriter;->close()V

    .line 326
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
