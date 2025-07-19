.class public Lcom/apsalar/sdk/ApWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "ApWebViewClient.java"


# instance fields
.field private info:Lcom/apsalar/sdk/ApsalarSessionInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 77
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apsalar/sdk/ApWebViewClient;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 78
    return-void
.end method

.method private doCallback(Ljava/lang/String;)V
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 81
    sget-object v0, Lcom/apsalar/sdk/Apsalar;->registered_callbacks:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 145
    :cond_0
    :goto_0
    return-void

    .line 90
    :cond_1
    new-instance v2, Lcom/apsalar/sdk/CallbackURL;

    invoke-direct {v2, p1}, Lcom/apsalar/sdk/CallbackURL;-><init>(Ljava/lang/String;)V

    .line 91
    sget-object v0, Lcom/apsalar/sdk/Apsalar;->registered_callbacks:Ljava/util/HashMap;

    iget-object v3, v2, Lcom/apsalar/sdk/CallbackURL;->signature:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/apsalar/sdk/ApsalarItem;

    .line 93
    if-eqz v0, :cond_0

    .line 94
    iget-object v3, v0, Lcom/apsalar/sdk/ApsalarItem;->registered:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 100
    const-string v3, "__click__"

    iget-object v4, v2, Lcom/apsalar/sdk/CallbackURL;->clickParams:Lorg/json/JSONObject;

    invoke-static {v3, v4}, Lcom/apsalar/sdk/Apsalar;->eventJSON(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 103
    iget-object v3, v0, Lcom/apsalar/sdk/ApsalarItem;->val:Ljava/lang/Object;

    if-nez v3, :cond_2

    .line 104
    const-string v0, "Apsalar SDK/ApWebView"

    const-string v1, "WebView is null "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 106
    :cond_2
    iget-object v3, v0, Lcom/apsalar/sdk/ApsalarItem;->val:Ljava/lang/Object;

    instance-of v3, v3, Landroid/webkit/WebView;

    if-eqz v3, :cond_5

    .line 109
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 110
    const-string v4, "javascript:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 111
    iget-object v0, v0, Lcom/apsalar/sdk/ApsalarItem;->val:Ljava/lang/Object;

    check-cast v0, Landroid/webkit/WebView;

    .line 114
    iget-object v4, v2, Lcom/apsalar/sdk/CallbackURL;->signature:Ljava/lang/String;

    const-string v5, "()"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 115
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 116
    iget-object v5, v2, Lcom/apsalar/sdk/CallbackURL;->signature:Ljava/lang/String;

    .line 118
    const-string v6, "("

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v5, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 119
    iget-object v2, v2, Lcom/apsalar/sdk/CallbackURL;->argVals:Ljava/util/ArrayList;

    .line 120
    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v1, v5, :cond_3

    .line 121
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 120
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 123
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\'"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 124
    const-string v1, ")"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 125
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 130
    :goto_2
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 131
    const-string v1, ";"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 132
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 133
    const-string v0, "Apsalar SDK/ApWebView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "JS Signature: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 128
    :cond_4
    iget-object v1, v2, Lcom/apsalar/sdk/CallbackURL;->signature:Ljava/lang/String;

    goto :goto_2

    .line 136
    :cond_5
    iget-object v0, v0, Lcom/apsalar/sdk/ApsalarItem;->val:Ljava/lang/Object;

    check-cast v0, Lcom/apsalar/sdk/ApCallback;

    .line 137
    if-eqz v0, :cond_0

    .line 138
    iget-object v1, v2, Lcom/apsalar/sdk/CallbackURL;->argValsJSON:Lorg/json/JSONArray;

    invoke-interface {v0, v1}, Lcom/apsalar/sdk/ApCallback;->executeCallback(Lorg/json/JSONArray;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 150
    const-string v0, "about:close"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "fbconnect:cancel"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 153
    :cond_0
    invoke-virtual {p1}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 154
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 155
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/apsalar/sdk/Apsalar;->triggerActive:Ljava/lang/Boolean;

    move v0, v1

    .line 169
    :goto_0
    return v0

    .line 157
    :cond_1
    const-string v0, "callback:"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 162
    invoke-direct {p0, p2}, Lcom/apsalar/sdk/ApWebViewClient;->doCallback(Ljava/lang/String;)V

    .line 163
    invoke-virtual {p1}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 164
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 165
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/apsalar/sdk/Apsalar;->triggerActive:Ljava/lang/Boolean;

    move v0, v1

    .line 166
    goto :goto_0

    .line 168
    :cond_2
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/apsalar/sdk/Apsalar;->triggerActive:Ljava/lang/Boolean;

    move v0, v2

    .line 169
    goto :goto_0
.end method
