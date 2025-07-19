.class public Lcom/apsalar/sdk/ApsalarJSInterface;
.super Ljava/lang/Object;
.source "ApsalarJSInterface.java"


# instance fields
.field mContext:Landroid/content/Context;

.field webViewId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/apsalar/sdk/ApsalarJSInterface;->mContext:Landroid/content/Context;

    .line 19
    return-void
.end method


# virtual methods
.method public endSession()V
    .locals 0

    .prologue
    .line 32
    invoke-static {}, Lcom/apsalar/sdk/Apsalar;->endSession()V

    .line 33
    return-void
.end method

.method public event(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 40
    invoke-static {p1}, Lcom/apsalar/sdk/Apsalar;->event(Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public event(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 44
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 45
    invoke-static {p1, v0}, Lcom/apsalar/sdk/Apsalar;->event(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 46
    return-void
.end method

.method public registerCallback(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 22
    iget v0, p0, Lcom/apsalar/sdk/ApsalarJSInterface;->webViewId:I

    if-nez v0, :cond_0

    .line 23
    const-string v0, "Apsalar SDK/JSInterface"

    const-string v1, "WebViewId = 0, Please set your WebViewId"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    :goto_0
    return-void

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarJSInterface;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    iget v1, p0, Lcom/apsalar/sdk/ApsalarJSInterface;->webViewId:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    .line 26
    invoke-static {p1, v0}, Lcom/apsalar/sdk/Apsalar;->registerCallback(Ljava/lang/String;Ljava/lang/Object;)V

    .line 27
    const-string v0, "Apsalar SDK/JSInterface"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WebViewId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/apsalar/sdk/ApsalarJSInterface;->webViewId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setWebViewId(I)V
    .locals 0

    .prologue
    .line 53
    iput p1, p0, Lcom/apsalar/sdk/ApsalarJSInterface;->webViewId:I

    .line 54
    return-void
.end method

.method public survey(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarJSInterface;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-static {v0, p1}, Lcom/apsalar/sdk/Apsalar;->survey(Landroid/app/Activity;Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method public trigger(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarJSInterface;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-static {v0, p1}, Lcom/apsalar/sdk/Apsalar;->trigger(Landroid/app/Activity;Ljava/lang/String;)V

    .line 37
    return-void
.end method
