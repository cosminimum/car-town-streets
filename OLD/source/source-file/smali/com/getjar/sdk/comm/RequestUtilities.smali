.class public final Lcom/getjar/sdk/comm/RequestUtilities;
.super Ljava/lang/Object;
.source "RequestUtilities.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static checkForRetryOnException(Ljava/lang/Exception;Z)Z
    .locals 1
    .param p0, "theException"    # Ljava/lang/Exception;
    .param p1, "forIdempotentOperation"    # Z

    .prologue
    .line 105
    if-eqz p1, :cond_2

    .line 107
    invoke-static {p0}, Lcom/getjar/sdk/comm/RequestUtilities;->isSafeRetriableException(Ljava/lang/Exception;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/getjar/sdk/comm/RequestUtilities;->isUnsafeRetriableException(Ljava/lang/Exception;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 110
    :goto_0
    return v0

    .line 107
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 110
    :cond_2
    invoke-static {p0}, Lcom/getjar/sdk/comm/RequestUtilities;->isSafeRetriableException(Ljava/lang/Exception;)Z

    move-result v0

    goto :goto_0
.end method

.method protected static debugDumpRequestProperties(Lorg/apache/http/client/methods/HttpRequestBase;)V
    .locals 9
    .param p0, "httpRequest"    # Lorg/apache/http/client/methods/HttpRequestBase;

    .prologue
    .line 63
    :try_start_0
    sget-object v6, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "The request properties for this request:"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 64
    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 65
    .local v1, "header":Lorg/apache/http/Header;
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "      "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .local v5, "value":Ljava/lang/StringBuilder;
    invoke-interface {v1}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    const-string v6, " = \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    sget-object v6, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 72
    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v1    # "header":Lorg/apache/http/Header;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "value":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v4

    .line 74
    .local v4, "t":Ljava/lang/Throwable;
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 76
    .end local v4    # "t":Ljava/lang/Throwable;
    :cond_0
    return-void
.end method

.method protected static getPostDataBlob(Ljava/util/Map;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "postData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, ""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .local v3, "postBlob":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 82
    .local v2, "nameItr":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 83
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 84
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    :try_start_0
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 92
    const-string v4, "&"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v4, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v4, v0}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 95
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v1    # "name":Ljava/lang/String;
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static getServicesException(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/exceptions/ServiceException;
    .locals 8
    .param p0, "result"    # Lcom/getjar/sdk/comm/Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/getjar/sdk/exceptions/ServiceException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x2

    .line 44
    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'result\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 47
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "error"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 50
    new-instance v0, Lcom/getjar/sdk/exceptions/ServiceException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "[ResponseCode: %1$d] Result: %2$s"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/getjar/sdk/exceptions/ServiceException;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/Result;)V

    .line 57
    :goto_0
    return-object v0

    .line 51
    :cond_1
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "return"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 54
    new-instance v0, Lcom/getjar/sdk/exceptions/ServiceException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Unexpected JSON result [ResponseCode: %1$d] Result: %2$s"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/getjar/sdk/exceptions/ServiceException;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/Result;)V

    goto :goto_0

    .line 57
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isSafeRetriableException(Ljava/lang/Exception;)Z
    .locals 1
    .param p0, "theException"    # Ljava/lang/Exception;

    .prologue
    .line 121
    instance-of v0, p0, Ljavax/net/ssl/SSLHandshakeException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljavax/net/ssl/SSLKeyException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    if-nez v0, :cond_0

    instance-of v0, p0, Lorg/apache/http/conn/HttpHostConnectException;

    if-nez v0, :cond_0

    instance-of v0, p0, Lorg/apache/http/conn/ConnectTimeoutException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/net/ConnectException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/net/UnknownHostException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/net/BindException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/net/NoRouteToHostException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/net/PortUnreachableException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/net/UnknownServiceException;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/getjar/sdk/comm/NetworkUnavailableException;

    if-eqz v0, :cond_1

    .line 135
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 136
    const/4 v0, 0x1

    .line 138
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isUnsafeRetriableException(Ljava/lang/Exception;)Z
    .locals 2
    .param p0, "theException"    # Ljava/lang/Exception;

    .prologue
    .line 150
    instance-of v0, p0, Ljavax/net/ssl/SSLProtocolException;

    if-nez v0, :cond_0

    instance-of v0, p0, Lorg/apache/http/NoHttpResponseException;

    if-nez v0, :cond_0

    instance-of v0, p0, Lorg/apache/http/client/ClientProtocolException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljavax/net/ssl/SSLException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/net/SocketTimeoutException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/net/HttpRetryException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/net/ProtocolException;

    if-nez v0, :cond_0

    instance-of v0, p0, Ljava/net/SocketException;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "org.apache.http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 161
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 162
    const/4 v0, 0x1

    .line 164
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
