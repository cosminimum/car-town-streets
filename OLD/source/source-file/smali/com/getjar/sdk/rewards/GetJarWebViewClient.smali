.class public Lcom/getjar/sdk/rewards/GetJarWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "GetJarWebViewClient.java"


# instance fields
.field private _parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

.field mCommContext:Lcom/getjar/sdk/comm/CommContext;

.field mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 1
    .param p1, "parentActivity"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    .line 31
    invoke-virtual {p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getParentActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->mContext:Landroid/content/Context;

    .line 32
    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    .line 33
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    .line 34
    return-void
.end method

.method public static saveUrl(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Landroid/content/Context;)V
    .locals 10
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "androidContext"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x1

    .line 133
    :try_start_0
    invoke-static {p0}, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->shouldFilterUrl(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 136
    const/4 v4, 0x1

    invoke-static {p1, v4}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v4

    const-string v5, "webview.saved_url.ttl"

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 137
    .local v3, "webViewSavedUrlTtlStr":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/getjar/sdk/utilities/Utility;->convertMillSec(J)J

    move-result-wide v1

    .line 138
    .local v1, "webViewSavedUrlTtl":J
    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-lez v4, :cond_0

    .line 139
    invoke-static {p2, p0}, Lcom/getjar/sdk/utilities/RewardUtility;->saveWebUrlData(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .end local v1    # "webViewSavedUrlTtl":J
    .end local v3    # "webViewSavedUrlTtlStr":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 142
    :catch_0
    move-exception v0

    .line 144
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "saveUrl(%1$s) failed"

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p0, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static shouldFilterUrl(Ljava/lang/String;)Z
    .locals 15
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 153
    :try_start_0
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 154
    .local v8, "urlclass":Ljava/net/URL;
    invoke-virtual {v8}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v7

    .line 155
    .local v7, "query":Ljava/lang/String;
    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "%1$s://%2$s%3$s"

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {v8}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    invoke-virtual {v8}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    invoke-virtual {v8}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 156
    sget-object v9, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "shouldFilterUrl(%1$s)"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p0, v13, v14

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 157
    invoke-static {v7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 158
    const-string v9, "&"

    invoke-virtual {v7, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 159
    .local v6, "pairs":[Ljava/lang/String;
    const-string v7, ""

    .line 160
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v5, v0, v2

    .line 161
    .local v5, "pair":Ljava/lang/String;
    const-string v9, "="

    invoke-virtual {v5, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 162
    .local v4, "nameValue":[Ljava/lang/String;
    array-length v9, v4

    const/4 v10, 0x2

    if-ge v9, v10, :cond_1

    .line 160
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 163
    :cond_1
    const/4 v9, 0x0

    aget-object v9, v4, v9

    const-string v10, "override.header.Cache-Control"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 164
    const/4 v9, 0x1

    aget-object v9, v4, v9

    const-string v10, "no-cache"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v9

    if-eqz v9, :cond_0

    .line 165
    const/4 v9, 0x1

    .line 174
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "nameValue":[Ljava/lang/String;
    .end local v5    # "pair":Ljava/lang/String;
    .end local v6    # "pairs":[Ljava/lang/String;
    .end local v7    # "query":Ljava/lang/String;
    .end local v8    # "urlclass":Ljava/net/URL;
    :goto_1
    return v9

    .line 170
    .restart local v7    # "query":Ljava/lang/String;
    .restart local v8    # "urlclass":Ljava/net/URL;
    :cond_2
    const/4 v9, 0x0

    goto :goto_1

    .line 171
    .end local v7    # "query":Ljava/lang/String;
    .end local v8    # "urlclass":Ljava/net/URL;
    :catch_0
    move-exception v1

    .line 173
    .local v1, "e":Ljava/net/MalformedURLException;
    sget-object v9, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "shouldFilterUrl(%1$s) failed"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p0, v13, v14

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v10, v11, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 174
    const/4 v9, 0x0

    goto :goto_1
.end method


# virtual methods
.method public onFormResubmission(Landroid/webkit/WebView;Landroid/os/Message;Landroid/os/Message;)V
    .locals 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "dontResend"    # Landroid/os/Message;
    .param p3, "resend"    # Landroid/os/Message;

    .prologue
    .line 115
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarWebViewClient: onFormResubmission()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 117
    invoke-virtual {p3}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    :goto_0
    return-void

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarWebViewClient: onFormResubmission() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 7
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 105
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "GetJarWebViewClient: onLoadResource() Loading Resource \'%1$s\'"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p2, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    :goto_0
    return-void

    .line 107
    :catch_0
    move-exception v0

    .line 108
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarWebViewClient: onLoadResource() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 7
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 63
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "GetJarWebViewClient: onPageFinished() URL:%1$s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p2, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 64
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->getShouldShowLoadingUI()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 65
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarWebViewClient: onPageFinished() Setting ShouldShowLoadingUI to FALSE"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 66
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->setShouldShowLoadingUI(Z)V

    .line 68
    :cond_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 69
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->mJavaScriptInterface:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->setLastReloadTime()V

    .line 70
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 71
    const-string v1, "file:///android_asset/errorMessage.html"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 72
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->sErrorSource:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->mErrorType:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    sget-object v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->NETWORK:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    if-ne v1, v2, :cond_2

    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:GJ.onError(\"NETWORK\",\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->sErrorSource:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

    iget-object v2, v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->mSubCode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 83
    :cond_1
    :goto_0
    return-void

    .line 74
    :cond_2
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->sErrorSource:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->mErrorType:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    sget-object v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->AUTH:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    if-ne v1, v2, :cond_3

    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:GJ.onError(\"AUTH\",\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->sErrorSource:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

    iget-object v2, v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->mSubCode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarWebViewClient: onPageFinished() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 76
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->sErrorSource:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->mErrorType:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    sget-object v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->SERVICE:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    if-ne v1, v2, :cond_1

    .line 77
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:GJ.onError(\"SERVICE\",\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->sErrorSource:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;

    iget-object v2, v2, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorSource;->mSubCode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 53
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarWebViewClient: onPageStarted()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 54
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :goto_0
    return-void

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarWebViewClient: onPageStarted() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 88
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "GetJarWebViewClient: onReceivedError() Error while loading URL \'%1$s\' [errorCode:%2$d description:%3$s]"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p4, v5, v6

    const/4 v6, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    aput-object p3, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 93
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 94
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->setShouldShowLoadingUI(Z)V

    .line 95
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 96
    const-string v1, "file:///android_asset/errorMessage.html"

    invoke-static {p1, v1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :goto_0
    return-void

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarWebViewClient: onReceivedError() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 8
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    .line 39
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "GetJarWebViewClient: shouldOverrideUrlLoading() OverrideURl: %1$s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p2, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 40
    const-string v1, "file:///android_asset/errorMessage.html"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 41
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->mContext:Landroid/content/Context;

    invoke-static {p2, v1, v2}, Lcom/getjar/sdk/rewards/GetJarWebViewClient;->saveUrl(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Landroid/content/Context;)V

    .line 43
    :cond_0
    invoke-static {p1, p2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->loadUrlInWebView(Landroid/webkit/WebView;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    :goto_0
    return v7

    .line 44
    :catch_0
    move-exception v0

    .line 45
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OS_ENTRY_POINT:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarWebViewClient: shouldOverrideUrlLoading() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
