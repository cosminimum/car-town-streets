.class public Lcom/getjar/sdk/comm/Request;
.super Ljava/lang/Object;
.source "Request.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/comm/Request$HttpMethod;,
        Lcom/getjar/sdk/comm/Request$ServiceName;
    }
.end annotation


# instance fields
.field private final _httpMethod:Lcom/getjar/sdk/comm/Request$HttpMethod;

.field private final _normalizedRequestUri:Ljava/net/URI;

.field private final _postData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final _queryParams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private final _requestHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final _requestType:Ljava/lang/String;

.field private final _serviceName:Lcom/getjar/sdk/comm/Request$ServiceName;

.field private final _uniqueId:Ljava/lang/Integer;


# direct methods
.method protected constructor <init>(Lcom/getjar/sdk/comm/Request$ServiceName;Ljava/lang/String;Ljava/net/URI;Lcom/getjar/sdk/comm/Request$HttpMethod;Ljava/util/Map;Ljava/util/Map;)V
    .locals 2
    .param p1, "serviceName"    # Lcom/getjar/sdk/comm/Request$ServiceName;
    .param p2, "requestType"    # Ljava/lang/String;
    .param p3, "requestUri"    # Ljava/net/URI;
    .param p4, "httpMethod"    # Lcom/getjar/sdk/comm/Request$HttpMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/Request$ServiceName;",
            "Ljava/lang/String;",
            "Ljava/net/URI;",
            "Lcom/getjar/sdk/comm/Request$HttpMethod;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p5, "postData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p6, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'serviceName\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'requestType\' can not be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_1
    if-nez p3, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'requestUri\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_2
    if-nez p4, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'httpMethod\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_3
    if-eqz p5, :cond_4

    sget-object v0, Lcom/getjar/sdk/comm/Request$HttpMethod;->POST:Lcom/getjar/sdk/comm/Request$HttpMethod;

    invoke-virtual {v0, p4}, Lcom/getjar/sdk/comm/Request$HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 81
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'postData\' can only be provided for requests of method type \"POST\""

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_4
    iput-object p1, p0, Lcom/getjar/sdk/comm/Request;->_serviceName:Lcom/getjar/sdk/comm/Request$ServiceName;

    .line 86
    iput-object p2, p0, Lcom/getjar/sdk/comm/Request;->_requestType:Ljava/lang/String;

    .line 87
    iput-object p4, p0, Lcom/getjar/sdk/comm/Request;->_httpMethod:Lcom/getjar/sdk/comm/Request$HttpMethod;

    .line 90
    invoke-virtual {p3}, Ljava/net/URI;->normalize()Ljava/net/URI;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    .line 91
    iget-object v0, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/net/URI;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/Request;->_queryParams:Ljava/util/List;

    .line 92
    iput-object p5, p0, Lcom/getjar/sdk/comm/Request;->_postData:Ljava/util/Map;

    .line 93
    iput-object p6, p0, Lcom/getjar/sdk/comm/Request;->_requestHeaders:Ljava/util/Map;

    .line 96
    invoke-direct {p0}, Lcom/getjar/sdk/comm/Request;->getUniqueId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/Request;->_uniqueId:Ljava/lang/Integer;

    .line 97
    return-void
.end method

.method private getUniqueId()I
    .locals 7

    .prologue
    .line 227
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .local v4, "textBuffer":Ljava/lang/StringBuilder;
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    invoke-virtual {v5}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    invoke-virtual {v5}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    invoke-virtual {v5}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_queryParams:Ljava/util/List;

    new-instance v6, Lcom/getjar/sdk/comm/Request$1;

    invoke-direct {v6, p0}, Lcom/getjar/sdk/comm/Request$1;-><init>(Lcom/getjar/sdk/comm/Request;)V

    invoke-static {v5, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 242
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_queryParams:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/NameValuePair;

    .line 243
    .local v3, "pair":Lorg/apache/http/NameValuePair;
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 248
    .end local v3    # "pair":Lorg/apache/http/NameValuePair;
    :cond_0
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    invoke-virtual {v5}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_postData:Ljava/util/Map;

    if-eqz v5, :cond_1

    .line 250
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_postData:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 251
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_postData:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 257
    .end local v2    # "name":Ljava/lang/String;
    :cond_1
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 258
    .local v0, "hashableText":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 259
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    invoke-virtual {v5}, Ljava/net/URI;->getPort()I

    move-result v5

    .line 261
    :goto_2
    return v5

    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v5

    iget-object v6, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    invoke-virtual {v6}, Ljava/net/URI;->getPort()I

    move-result v6

    add-int/2addr v5, v6

    goto :goto_2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 199
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'object\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 200
    :cond_0
    instance-of v1, p1, Lcom/getjar/sdk/comm/Request;

    if-nez v1, :cond_2

    .line 201
    :cond_1
    :goto_0
    return v0

    :cond_2
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Request;->hashCode()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    if-ne v1, v2, :cond_1

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getEstimatedRequestSizeInBytes()I
    .locals 4

    .prologue
    .line 128
    iget-object v3, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    invoke-virtual {v3}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v0, v3

    .line 129
    .local v0, "byteCount":I
    iget-object v3, p0, Lcom/getjar/sdk/comm/Request;->_postData:Ljava/util/Map;

    if-eqz v3, :cond_2

    .line 130
    iget-object v3, p0, Lcom/getjar/sdk/comm/Request;->_postData:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 131
    .local v2, "name":Ljava/lang/String;
    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v3, v3

    add-int/2addr v0, v3

    .line 132
    :cond_1
    iget-object v3, p0, Lcom/getjar/sdk/comm/Request;->_postData:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/getjar/sdk/comm/Request;->_postData:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v3, v3

    add-int/2addr v0, v3

    goto :goto_0

    .line 135
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "name":Ljava/lang/String;
    :cond_2
    iget-object v3, p0, Lcom/getjar/sdk/comm/Request;->_requestHeaders:Ljava/util/Map;

    if-eqz v3, :cond_5

    .line 136
    iget-object v3, p0, Lcom/getjar/sdk/comm/Request;->_requestHeaders:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 137
    .restart local v2    # "name":Ljava/lang/String;
    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v3, v3

    add-int/2addr v0, v3

    .line 138
    :cond_4
    iget-object v3, p0, Lcom/getjar/sdk/comm/Request;->_requestHeaders:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/getjar/sdk/comm/Request;->_requestHeaders:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v3, v3

    add-int/2addr v0, v3

    goto :goto_1

    .line 141
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "name":Ljava/lang/String;
    :cond_5
    return v0
.end method

.method public getHttpMethod()Lcom/getjar/sdk/comm/Request$HttpMethod;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/getjar/sdk/comm/Request;->_httpMethod:Lcom/getjar/sdk/comm/Request$HttpMethod;

    return-object v0
.end method

.method public getId()I
    .locals 2

    .prologue
    .line 186
    iget-object v0, p0, Lcom/getjar/sdk/comm/Request;->_uniqueId:Ljava/lang/Integer;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unique ID has not been calculated yet"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/Request;->_uniqueId:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getNormalizedRequestUri()Ljava/net/URI;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    return-object v0
.end method

.method public getPostData()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 113
    iget-object v0, p0, Lcom/getjar/sdk/comm/Request;->_postData:Ljava/util/Map;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 114
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/Request;->_postData:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method public getRequestHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lcom/getjar/sdk/comm/Request;->_requestHeaders:Ljava/util/Map;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 120
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/Request;->_requestHeaders:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method public getRequestType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/getjar/sdk/comm/Request;->_requestType:Ljava/lang/String;

    return-object v0
.end method

.method public getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/getjar/sdk/comm/Request;->_serviceName:Lcom/getjar/sdk/comm/Request$ServiceName;

    return-object v0
.end method

.method public getUriForRequest()Ljava/net/URI;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 156
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .local v4, "queryParams":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_queryParams:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/NameValuePair;

    .line 158
    .local v3, "pair":Lorg/apache/http/NameValuePair;
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 160
    .end local v3    # "pair":Lorg/apache/http/NameValuePair;
    :cond_0
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    const-string v6, "override.response.details"

    const-string v7, "ALL"

    invoke-direct {v5, v6, v7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    const-string v5, "header.x-clientip"

    invoke-static {v5}, Lcom/getjar/sdk/utilities/OverridesUtility;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 163
    .local v2, "ipAddress":Ljava/lang/String;
    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 164
    sget-object v5, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Using Override header.x-clientip:%1$s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 165
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    const-string v6, "override.header.X-ClientIP"

    invoke-direct {v5, v6, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    :cond_1
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    .line 170
    .local v0, "builder":Landroid/net/Uri$Builder;
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    invoke-virtual {v5}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 171
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    invoke-virtual {v5}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 172
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    invoke-virtual {v5}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/net/Uri$Builder;->fragment(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 173
    iget-object v5, p0, Lcom/getjar/sdk/comm/Request;->_normalizedRequestUri:Ljava/net/URI;

    invoke-virtual {v5}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 174
    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/net/Uri$Builder;->encodedQuery(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 176
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v5

    return-object v5
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 212
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Request;->getId()I

    move-result v0

    return v0
.end method
