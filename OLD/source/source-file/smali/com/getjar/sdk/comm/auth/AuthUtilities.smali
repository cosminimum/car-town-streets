.class Lcom/getjar/sdk/comm/auth/AuthUtilities;
.super Ljava/lang/Object;
.source "AuthUtilities.java"


# static fields
.field protected static final KeyPrefixCaps:Ljava/lang/String; = "capabilities."

.field protected static final KeyPrefixClaims:Ljava/lang/String; = "claims."


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addClaimsToMap(Lorg/json/JSONArray;Ljava/lang/String;Ljava/util/Map;)V
    .locals 12
    .param p0, "claims"    # Lorg/json/JSONArray;
    .param p1, "keyPrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 221
    .local p2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 224
    :try_start_0
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 225
    .local v0, "claim":Lorg/json/JSONObject;
    const-string v6, "key"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 226
    .local v3, "key":Ljava/lang/String;
    const-string v6, "value"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 228
    .local v5, "value":Ljava/lang/String;
    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {v5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 229
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%1$s%2$s"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    const/4 v9, 0x1

    aput-object v3, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 230
    .local v4, "name":Ljava/lang/String;
    invoke-interface {p2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "AuthFlow: claim found [key:%1$s  value:%2$s]"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v4, v10, v11

    const/4 v11, 0x1

    aput-object v5, v10, v11

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    .end local v0    # "claim":Lorg/json/JSONObject;
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 234
    :catch_0
    move-exception v1

    .line 235
    .local v1, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "AuthFlow: addClaimsToMap() failed"

    invoke-static {v6, v7, v8, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 238
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    return-void
.end method

.method protected static getAuthTokenFromHeaders(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;
    .locals 6
    .param p0, "result"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    const/4 v5, 0x0

    .line 28
    const/4 v0, 0x0

    .line 29
    .local v0, "authToken":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v2

    .line 32
    .local v2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz v2, :cond_3

    .line 34
    const-string v4, "Authorization"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 35
    .local v3, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v3, :cond_0

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_0

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "authToken":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 36
    .restart local v0    # "authToken":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 38
    const-string v4, "authorization"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    check-cast v3, Ljava/util/List;

    .line 39
    .restart local v3    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v3, :cond_1

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_1

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "authToken":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 40
    .restart local v0    # "authToken":Ljava/lang/String;
    :cond_1
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 42
    const-string v4, "AUTHORIZATION"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    check-cast v3, Ljava/util/List;

    .line 43
    .restart local v3    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v3, :cond_2

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_2

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "authToken":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 44
    .restart local v0    # "authToken":Ljava/lang/String;
    :cond_2
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    move-object v1, v0

    .line 49
    .end local v0    # "authToken":Ljava/lang/String;
    .end local v3    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v1, "authToken":Ljava/lang/String;
    :goto_0
    return-object v1

    .end local v1    # "authToken":Ljava/lang/String;
    .restart local v0    # "authToken":Ljava/lang/String;
    :cond_3
    move-object v1, v0

    .end local v0    # "authToken":Ljava/lang/String;
    .restart local v1    # "authToken":Ljava/lang/String;
    goto :goto_0
.end method

.method protected static getClaimsFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/util/Map;
    .locals 6
    .param p0, "result"    # Lcom/getjar/sdk/comm/Result;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/Result;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 122
    if-nez p0, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'result\' cannot be NULL"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 123
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v3

    if-nez v3, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "getClaimsFromResult() can only be called for a successful response"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 124
    :cond_1
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_2

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "getClaimsFromResult() can only be called for a result with a response body"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 127
    :cond_2
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 129
    .local v2, "resultMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_4

    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "return"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 136
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "return"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "claims"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 137
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "return"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "claims"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 138
    .local v0, "claims":Lorg/json/JSONArray;
    if-eqz v0, :cond_3

    .line 139
    const-string v3, "claims."

    invoke-static {v0, v3, v2}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->addClaimsToMap(Lorg/json/JSONArray;Ljava/lang/String;Ljava/util/Map;)V

    .line 144
    .end local v0    # "claims":Lorg/json/JSONArray;
    :cond_3
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "return"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "capabilities"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 145
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "return"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "capabilities"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 146
    .restart local v0    # "claims":Lorg/json/JSONArray;
    if-eqz v0, :cond_4

    .line 147
    const-string v3, "capabilities."

    invoke-static {v0, v3, v2}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->addClaimsToMap(Lorg/json/JSONArray;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    .end local v0    # "claims":Lorg/json/JSONArray;
    :cond_4
    :goto_0
    return-object v2

    .line 152
    :catch_0
    move-exception v1

    .line 153
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "AuthFlow: getClaimsFromResult() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected static getSettingsFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/util/Map;
    .locals 12
    .param p0, "result"    # Lcom/getjar/sdk/comm/Result;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/Result;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/auth/SettingsValue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 166
    if-nez p0, :cond_0

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "\'result\' cannot be NULL"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 167
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v9

    if-nez v9, :cond_1

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "setSettingsFromResult() can only be called for a successful response"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 168
    :cond_1
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v9

    if-nez v9, :cond_2

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "setSettingsFromResult() can only be called for a result with a response body"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 170
    :cond_2
    const/4 v5, 0x0

    .line 172
    .local v5, "settingsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    if-eqz p0, :cond_4

    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v9

    if-eqz v9, :cond_4

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "return"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 178
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "return"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "settings"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 180
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "return"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "settings"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 181
    .local v4, "settingsArray":Lorg/json/JSONArray;
    new-instance v6, Ljava/util/HashMap;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v9

    invoke-direct {v6, v9}, Ljava/util/HashMap;-><init>(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 187
    .end local v5    # "settingsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    .local v6, "settingsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    :try_start_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v1, v9, :cond_6

    .line 188
    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 190
    .local v3, "obj":Lorg/json/JSONObject;
    const-string v9, "name"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 191
    .local v2, "name":Ljava/lang/String;
    const-string v9, "value"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 192
    .local v8, "value":Ljava/lang/String;
    const-string v9, "type"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 194
    .local v7, "type":Ljava/lang/String;
    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 195
    sget-object v9, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    const-string v11, "Invalid setting name!"

    invoke-static {v9, v10, v11}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 187
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 200
    :cond_3
    :try_start_2
    new-instance v9, Lcom/getjar/sdk/comm/auth/SettingsValue;

    invoke-direct {v9, v8, v7}, Lcom/getjar/sdk/comm/auth/SettingsValue;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v2, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 201
    :catch_0
    move-exception v0

    .line 202
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    :try_start_3
    sget-object v9, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    const-string v11, "Invalid setting"

    invoke-static {v9, v10, v11, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 207
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "obj":Lorg/json/JSONObject;
    .end local v7    # "type":Ljava/lang/String;
    .end local v8    # "value":Ljava/lang/String;
    :catch_1
    move-exception v0

    move-object v5, v6

    .line 208
    .end local v1    # "i":I
    .end local v4    # "settingsArray":Lorg/json/JSONArray;
    .end local v6    # "settingsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    .local v0, "e":Ljava/lang/Exception;
    .restart local v5    # "settingsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    :goto_2
    sget-object v9, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    const-string v11, "AuthFlow: getSettingsFromResult() failed"

    invoke-static {v9, v10, v11, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 211
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_4
    :goto_3
    if-nez v5, :cond_5

    .line 212
    new-instance v5, Ljava/util/HashMap;

    .end local v5    # "settingsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    const/4 v9, 0x0

    invoke-direct {v5, v9}, Ljava/util/HashMap;-><init>(I)V

    .line 214
    .restart local v5    # "settingsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    :cond_5
    return-object v5

    .line 207
    :catch_2
    move-exception v0

    goto :goto_2

    .end local v5    # "settingsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    .restart local v1    # "i":I
    .restart local v4    # "settingsArray":Lorg/json/JSONArray;
    .restart local v6    # "settingsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    :cond_6
    move-object v5, v6

    .end local v6    # "settingsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    .restart local v5    # "settingsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    goto :goto_3
.end method

.method protected static getTTLFromClaims(Ljava/util/Map;J)J
    .locals 14
    .param p1, "defaultValue"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)J"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-wide v5, p1

    .line 65
    .local v5, "ttl":J
    const/4 v3, 0x0

    .line 66
    .local v3, "expiresOnEpoch":Ljava/lang/Long;
    const/4 v2, 0x0

    .line 68
    .local v2, "expiresInMinutes":Ljava/lang/Long;
    :try_start_0
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "%1$sExpiresIn"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string v11, "claims."

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "expiresInKey":Ljava/lang/String;
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "%1$sExpiresOn"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string v11, "claims."

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 72
    .local v4, "expiresOnKey":Ljava/lang/String;
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v7

    if-eqz v7, :cond_0

    .line 74
    :try_start_1
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 78
    :goto_0
    :try_start_2
    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "AuthFlow: getTTLFromClaims() found expiresInSecs of %1$d"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v2, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 81
    :cond_0
    if-nez v2, :cond_1

    invoke-interface {p0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result v7

    if-eqz v7, :cond_1

    .line 83
    :try_start_3
    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move-result-object v3

    .line 87
    :goto_1
    :try_start_4
    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "AuthFlow: getTTLFromClaims() found expiresOnEpoch of %1$d"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v3, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 91
    :cond_1
    if-eqz v2, :cond_3

    .line 92
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    const-wide/32 v9, 0xea60

    mul-long v5, v7, v9

    .line 93
    const-wide/16 v7, 0x0

    cmp-long v7, v5, v7

    if-gtz v7, :cond_2

    .line 94
    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "AuthFlow: getTTLFromClaims() parsed an ExpiresIn resulting in a TTL of %1$d"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 95
    const-wide/16 v5, 0x0

    .line 110
    .end local v1    # "expiresInKey":Ljava/lang/String;
    .end local v4    # "expiresOnKey":Ljava/lang/String;
    :cond_2
    :goto_2
    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "AuthFlow: getTTLFromClaims() returning a TTL of %1$d"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 111
    return-wide v5

    .line 75
    .restart local v1    # "expiresInKey":Ljava/lang/String;
    .restart local v4    # "expiresOnKey":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/lang/Exception;
    :try_start_5
    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_0

    .line 105
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "expiresInKey":Ljava/lang/String;
    .end local v4    # "expiresOnKey":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 106
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v9, "AuthFlow: getTTLFromClaims() failed"

    invoke-static {v7, v8, v9, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 84
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "expiresInKey":Ljava/lang/String;
    .restart local v4    # "expiresOnKey":Ljava/lang/String;
    :catch_2
    move-exception v0

    .line 85
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_6
    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto/16 :goto_1

    .line 97
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    if-eqz v3, :cond_2

    .line 98
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long v5, v7, v9

    .line 99
    const-wide/16 v7, 0x0

    cmp-long v7, v5, v7

    if-gtz v7, :cond_2

    .line 100
    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "AuthFlow: getTTLFromClaims() parsed an ExpiresOn resulting in a TTL of %1$d"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 101
    const-wide/16 v5, 0x0

    goto :goto_2
.end method
