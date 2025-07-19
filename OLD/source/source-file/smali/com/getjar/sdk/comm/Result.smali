.class public Lcom/getjar/sdk/comm/Result;
.super Ljava/lang/Object;
.source "Result.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x65ecf5acf60bf1ffL


# instance fields
.field private _headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private _requestId:Ljava/lang/String;

.field private _responseBody:Ljava/lang/String;

.field private _responseCode:I

.field private _responseJson:Lorg/json/JSONObject;

.field private _responseTime:I

.field private _suppressInternalCallbacks:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    .line 30
    iput-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    .line 34
    iput-object v1, p0, Lcom/getjar/sdk/comm/Result;->_requestId:Ljava/lang/String;

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/Result;->_suppressInternalCallbacks:Z

    .line 38
    iput-object v1, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    .line 40
    const/4 v0, -0x1

    iput v0, p0, Lcom/getjar/sdk/comm/Result;->_responseTime:I

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;ILjava/lang/String;Z)V
    .locals 2
    .param p1, "responseBody"    # Ljava/lang/String;
    .param p3, "responseCode"    # I
    .param p4, "requestId"    # Ljava/lang/String;
    .param p5, "suppressInternalCallbacks"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;I",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .local p2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v1, 0x0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    .line 30
    iput-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    .line 34
    iput-object v1, p0, Lcom/getjar/sdk/comm/Result;->_requestId:Ljava/lang/String;

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/Result;->_suppressInternalCallbacks:Z

    .line 38
    iput-object v1, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    .line 40
    const/4 v0, -0x1

    iput v0, p0, Lcom/getjar/sdk/comm/Result;->_responseTime:I

    .line 58
    iput-object p1, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    .line 59
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 61
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    :cond_0
    :goto_0
    iput-object p2, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    .line 66
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    .line 68
    :cond_1
    iput p3, p0, Lcom/getjar/sdk/comm/Result;->_responseCode:I

    .line 69
    iput-object p4, p0, Lcom/getjar/sdk/comm/Result;->_requestId:Ljava/lang/String;

    .line 70
    iput-boolean p5, p0, Lcom/getjar/sdk/comm/Result;->_suppressInternalCallbacks:Z

    .line 72
    invoke-direct {p0}, Lcom/getjar/sdk/comm/Result;->validateObjectState()V

    .line 73
    return-void

    .line 62
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private getResponseBodyValueAsObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 7
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 199
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "return"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "return"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 200
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "return"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 205
    :goto_0
    return-object v1

    .line 202
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Unable to get a string value for \'%1$s\'"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 205
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getResponseBodyValueAsRawString(Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 149
    :try_start_0
    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v8, "return"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v8, "return"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v7, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 152
    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "\"%1$s\""

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p1, v10, v11

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    .line 154
    .local v5, "start":I
    :goto_0
    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x3a

    if-eq v7, v8, :cond_0

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 156
    :cond_0
    :goto_1
    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x22

    if-eq v7, v8, :cond_1

    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x7b

    if-eq v7, v8, :cond_1

    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x5b

    if-eq v7, v8, :cond_1

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 159
    :cond_1
    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 160
    .local v6, "startChar":C
    sparse-switch v6, :sswitch_data_0

    .line 164
    new-instance v7, Ljava/lang/IllegalStateException;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "Unrecognized start character \'%1$c\'"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v6}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 187
    .end local v5    # "start":I
    .end local v6    # "startChar":C
    :catch_0
    move-exception v0

    .line 188
    .local v0, "e":Lorg/json/JSONException;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "Unable to get a raw string value for \'%1$s\'"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object p1, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 190
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    const/4 v7, 0x0

    :goto_2
    return-object v7

    .line 161
    .restart local v5    # "start":I
    .restart local v6    # "startChar":C
    :sswitch_0
    const/16 v2, 0x22

    .line 168
    .local v2, "endChar":C
    :goto_3
    :try_start_1
    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v8, "return"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v7, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "\\%1$c"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    array-length v7, v7

    add-int/lit8 v3, v7, -0x1

    .line 171
    .local v3, "setCount":I
    move v1, v5

    .line 172
    .local v1, "end":I
    const/4 v4, 0x0

    .line 173
    .local v4, "setFound":I
    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-virtual {v7, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v6, :cond_3

    add-int/lit8 v1, v1, 0x1

    .line 174
    :cond_3
    :goto_4
    if-gt v4, v3, :cond_5

    .line 175
    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-virtual {v7, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v2, :cond_4

    add-int/lit8 v4, v4, 0x1

    .line 176
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 162
    .end local v1    # "end":I
    .end local v2    # "endChar":C
    .end local v3    # "setCount":I
    .end local v4    # "setFound":I
    :sswitch_1
    const/16 v2, 0x7d

    .restart local v2    # "endChar":C
    goto :goto_3

    .line 163
    .end local v2    # "endChar":C
    :sswitch_2
    const/16 v2, 0x5d

    .restart local v2    # "endChar":C
    goto :goto_3

    .line 180
    .restart local v1    # "end":I
    .restart local v3    # "setCount":I
    .restart local v4    # "setFound":I
    :cond_5
    const/16 v7, 0x22

    if-ne v6, v7, :cond_6

    .line 181
    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    add-int/lit8 v8, v5, 0x1

    add-int/lit8 v9, v1, -0x1

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    .line 183
    :cond_6
    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-virtual {v7, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v7

    goto :goto_2

    .line 160
    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_0
        0x5b -> :sswitch_2
        0x7b -> :sswitch_1
    .end sparse-switch
.end method

.method private getResponseBodyValueAsString(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 131
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "return"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "return"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 132
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "return"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 137
    :goto_0
    return-object v1

    .line 134
    :catch_0
    move-exception v0

    .line 135
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Unable to get a string value for \'%1$s\'"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 137
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isSuccessfulCreationResponse(I)Z
    .locals 1
    .param p0, "responseCode"    # I

    .prologue
    .line 417
    const/16 v0, 0xc9

    if-ne p0, v0, :cond_0

    .line 418
    const/4 v0, 0x1

    .line 420
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSuccessfulResponse(I)Z
    .locals 1
    .param p0, "responseCode"    # I

    .prologue
    .line 403
    const/16 v0, 0xc8

    if-eq p0, v0, :cond_0

    const/16 v0, 0xc9

    if-ne p0, v0, :cond_1

    .line 404
    :cond_0
    const/4 v0, 0x1

    .line 406
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 2
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 440
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    .line 441
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 443
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 446
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lcom/getjar/sdk/comm/Result;->_responseCode:I

    .line 447
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/Result;->_requestId:Ljava/lang/String;

    .line 448
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v0

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/Result;->_suppressInternalCallbacks:Z

    .line 449
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    .line 450
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lcom/getjar/sdk/comm/Result;->_responseTime:I

    .line 452
    invoke-direct {p0}, Lcom/getjar/sdk/comm/Result;->validateObjectState()V

    .line 453
    return-void

    .line 444
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private validateObjectState()V
    .locals 2

    .prologue
    .line 457
    iget v0, p0, Lcom/getjar/sdk/comm/Result;->_responseCode:I

    if-gez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'responseCode\' can not be less than zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 458
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'headers\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 459
    :cond_1
    iget v0, p0, Lcom/getjar/sdk/comm/Result;->_responseTime:I

    const/4 v1, -0x1

    if-ge v0, v1, :cond_2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'responseTime\' must be greater than -1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 460
    :cond_2
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 426
    invoke-direct {p0}, Lcom/getjar/sdk/comm/Result;->validateObjectState()V

    .line 428
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 429
    iget v0, p0, Lcom/getjar/sdk/comm/Result;->_responseCode:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 430
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_requestId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 431
    iget-boolean v0, p0, Lcom/getjar/sdk/comm/Result;->_suppressInternalCallbacks:Z

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 432
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 433
    iget v0, p0, Lcom/getjar/sdk/comm/Result;->_responseTime:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 434
    return-void

    .line 428
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method


# virtual methods
.method public checkForBlacklisted()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 322
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->checkForCallerUnauthorized()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 325
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "error"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "subcode"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 326
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "error"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "subcode"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 327
    .local v0, "subcode":Ljava/lang/String;
    const-string v1, "no_reauth"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "black_listed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 328
    :cond_0
    const/4 v1, 0x1

    .line 332
    .end local v0    # "subcode":Ljava/lang/String;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public checkForBlacklistedOrUnsupported(Lcom/getjar/sdk/comm/CommContext;)Z
    .locals 12
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 266
    const/4 v1, 0x0

    .line 267
    .local v1, "blacklisted":Z
    const/4 v3, 0x0

    .line 270
    .local v3, "unsupported":Z
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->checkForCallerUnauthorized()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 273
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->checkForBlacklisted()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 274
    iget-object v4, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v7, "error"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v7, "subcode"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 277
    .local v2, "subcode":Ljava/lang/String;
    sget-object v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->DEVICE:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    .line 278
    .local v0, "blacklistType":Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;
    const-string v4, "black_listed_device"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 279
    sget-object v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->DEVICE:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    .line 285
    :cond_0
    :goto_0
    iget-boolean v4, p0, Lcom/getjar/sdk/comm/Result;->_suppressInternalCallbacks:Z

    if-nez v4, :cond_1

    .line 286
    invoke-virtual {p1, v2}, Lcom/getjar/sdk/comm/CommContext;->makeAuthorizationFailureCallbacks(Ljava/lang/String;)V

    .line 288
    :cond_1
    new-instance v4, Lcom/getjar/sdk/response/BlacklistedResponse;

    invoke-direct {v4, v0}, Lcom/getjar/sdk/response/BlacklistedResponse;-><init>(Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;)V

    invoke-virtual {p1, v4}, Lcom/getjar/sdk/comm/CommContext;->postResponse(Lcom/getjar/sdk/response/Response;)V

    .line 289
    const/4 v1, 0x1

    .line 303
    .end local v0    # "blacklistType":Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;
    .end local v2    # "subcode":Ljava/lang/String;
    :cond_2
    :goto_1
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "checkForBlacklistedOrUnsupported() returning %1$s %2$s"

    const/4 v4, 0x2

    new-array v11, v4, [Ljava/lang/Object;

    if-nez v1, :cond_3

    if-eqz v3, :cond_c

    :cond_3
    move v4, v6

    :goto_2
    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v11, v5

    if-nez v1, :cond_4

    if-eqz v3, :cond_e

    :cond_4
    if-eqz v1, :cond_d

    const-string v4, "we are blacklisted"

    :goto_3
    aput-object v4, v11, v6

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v8, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 307
    if-nez v1, :cond_5

    if-eqz v3, :cond_6

    :cond_5
    move v5, v6

    :cond_6
    return v5

    .line 280
    .restart local v0    # "blacklistType":Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;
    .restart local v2    # "subcode":Ljava/lang/String;
    :cond_7
    const-string v4, "black_listed_user"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_8

    const-string v4, "no_reauth"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 281
    :cond_8
    sget-object v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->USER:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    goto :goto_0

    .line 282
    :cond_9
    const-string v4, "black_listed_app"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 283
    sget-object v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->APP:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    goto :goto_0

    .line 290
    .end local v0    # "blacklistType":Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;
    .end local v2    # "subcode":Ljava/lang/String;
    :cond_a
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->checkForUnsupported()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 291
    iget-object v4, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v7, "error"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v7, "subcode"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 294
    .restart local v2    # "subcode":Ljava/lang/String;
    iget-boolean v4, p0, Lcom/getjar/sdk/comm/Result;->_suppressInternalCallbacks:Z

    if-nez v4, :cond_b

    .line 295
    invoke-virtual {p1, v2}, Lcom/getjar/sdk/comm/CommContext;->makeAuthorizationFailureCallbacks(Ljava/lang/String;)V

    .line 297
    :cond_b
    new-instance v4, Lcom/getjar/sdk/response/DeviceUnsupportedResponse;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getDeviceMetadataValues()Ljava/util/Map;

    move-result-object v7

    invoke-direct {v4, v7}, Lcom/getjar/sdk/response/DeviceUnsupportedResponse;-><init>(Ljava/util/Map;)V

    invoke-virtual {p1, v4}, Lcom/getjar/sdk/comm/CommContext;->postResponse(Lcom/getjar/sdk/response/Response;)V

    .line 298
    const/4 v3, 0x1

    goto :goto_1

    .end local v2    # "subcode":Ljava/lang/String;
    :cond_c
    move v4, v5

    .line 303
    goto :goto_2

    :cond_d
    const-string v4, "we are unsupported"

    goto :goto_3

    :cond_e
    const-string v4, ""

    goto :goto_3
.end method

.method public checkForCallerUnauthorized()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 312
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v1, "error"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v1, "error"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "code"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v1, "error"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "code"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "CALLER_UNAUTHORIZED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public checkForUnauthorizedAndOKToReAuth(Lcom/getjar/sdk/comm/CommContext;)Z
    .locals 12
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x4

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 238
    const/4 v1, 0x0

    .line 239
    .local v1, "isUnauthorized":Z
    const/4 v0, 0x0

    .line 242
    .local v0, "isNotOKToReAuth":Z
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->checkForCallerUnauthorized()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 243
    const/4 v1, 0x1

    .line 244
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/comm/Result;->checkForBlacklistedOrUnsupported(Lcom/getjar/sdk/comm/CommContext;)Z

    move-result v0

    .line 248
    :cond_0
    if-eqz v1, :cond_2

    if-nez v0, :cond_2

    move v2, v3

    .line 249
    .local v2, "isUnauthorizedAndOKToReAuth":Z
    :goto_0
    if-eqz v1, :cond_1

    .line 250
    sget-object v5, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "checkForUnauthorizedAndOKToReAuth() isUnauthorized=%1$s and isNotOKToReAuth=%2$s, returning %3$s for:\r\n%4$s"

    new-array v9, v11, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    aput-object v10, v9, v4

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v9, v3

    const/4 v3, 0x2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v9, v3

    const/4 v4, 0x3

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v3

    :goto_1
    aput-object v3, v9, v4

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 258
    :cond_1
    return v2

    .end local v2    # "isUnauthorizedAndOKToReAuth":Z
    :cond_2
    move v2, v4

    .line 248
    goto :goto_0

    .line 250
    .restart local v2    # "isUnauthorizedAndOKToReAuth":Z
    :cond_3
    const-string v3, ""

    goto :goto_1
.end method

.method public checkForUnsupported()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 339
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->checkForCallerUnauthorized()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 342
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "error"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "subcode"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 343
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "error"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "subcode"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 344
    .local v0, "subcode":Ljava/lang/String;
    const-string v1, "unsupported_device"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 345
    const/4 v1, 0x1

    .line 349
    .end local v0    # "subcode":Ljava/lang/String;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getErrorResponseCode()Ljava/lang/String;
    .locals 8

    .prologue
    .line 211
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "error"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "error"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "code"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 212
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "error"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "code"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 217
    :goto_0
    return-object v1

    .line 214
    :catch_0
    move-exception v0

    .line 215
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Unable to get an error code from \'%1$s\'"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 217
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getErrorResponseSubcode()Ljava/lang/String;
    .locals 8

    .prologue
    .line 223
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "error"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "error"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "subcode"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 224
    iget-object v1, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    const-string v2, "error"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "subcode"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 229
    :goto_0
    return-object v1

    .line 226
    :catch_0
    move-exception v0

    .line 227
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Unable to get an error subcode from \'%1$s\'"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 229
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getEstimatedResponseSizeInBytes()I
    .locals 6

    .prologue
    .line 357
    const/16 v0, 0x8

    .line 358
    .local v0, "byteCount":I
    iget-object v5, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 359
    iget-object v5, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    array-length v5, v5

    add-int/2addr v0, v5

    .line 361
    :cond_0
    iget-object v5, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    if-eqz v5, :cond_4

    .line 362
    iget-object v5, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 363
    .local v3, "name":Ljava/lang/String;
    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    array-length v5, v5

    add-int/2addr v0, v5

    .line 364
    :cond_2
    iget-object v5, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 365
    iget-object v5, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 366
    .local v4, "value":Ljava/lang/String;
    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    array-length v5, v5

    add-int/2addr v0, v5

    goto :goto_0

    .line 371
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_4
    return v0
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_headers:Ljava/util/Map;

    return-object v0
.end method

.method public getRequestId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_requestId:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseBody:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseCode()I
    .locals 1

    .prologue
    .line 88
    iget v0, p0, Lcom/getjar/sdk/comm/Result;->_responseCode:I

    return v0
.end method

.method public getResponseJson()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/getjar/sdk/comm/Result;->_responseJson:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getResponseTime()I
    .locals 1

    .prologue
    .line 94
    iget v0, p0, Lcom/getjar/sdk/comm/Result;->_responseTime:I

    return v0
.end method

.method public getSignature()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    const-string v0, "signature"

    invoke-direct {p0, v0}, Lcom/getjar/sdk/comm/Result;->getResponseBodyValueAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSignedPayload()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    const-string v0, "signed_data"

    invoke-direct {p0, v0}, Lcom/getjar/sdk/comm/Result;->getResponseBodyValueAsRawString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSignedPayloadObject()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 108
    const-string v0, "signed_data"

    invoke-direct {p0, v0}, Lcom/getjar/sdk/comm/Result;->getResponseBodyValueAsObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public isSuccessfulCreationResponse()Z
    .locals 1

    .prologue
    .line 392
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/Result;->isSuccessfulCreationResponse(I)Z

    move-result v0

    return v0
.end method

.method public isSuccessfulResponse()Z
    .locals 1

    .prologue
    .line 381
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse(I)Z

    move-result v0

    return v0
.end method

.method public setResponseTime(I)V
    .locals 2
    .param p1, "responseTime"    # I

    .prologue
    .line 98
    if-gtz p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'responseTime\' must be greater than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_0
    iput p1, p0, Lcom/getjar/sdk/comm/Result;->_responseTime:I

    .line 100
    return-void
.end method
