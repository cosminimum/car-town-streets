.class public Lcom/miniclip/Chartboost/Chartboost;
.super Ljava/lang/Object;
.source "Chartboost.java"


# static fields
.field public static APP_ID:Ljava/lang/String;

.field public static APP_SIGNATURE:Ljava/lang/String;

.field public static DEBUG:Z

.field private static TAG:Ljava/lang/String;

.field private static activity:Landroid/app/Activity;

.field private static cb:Lcom/chartboost/sdk/Chartboost;

.field private static maxTriggerCount:I

.field private static minSessionCount:I

.field private static sessionCount:I

.field private static triggerCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 12
    const-string v0, "Chartboost"

    sput-object v0, Lcom/miniclip/Chartboost/Chartboost;->TAG:Ljava/lang/String;

    .line 13
    const/4 v0, 0x1

    sput-boolean v0, Lcom/miniclip/Chartboost/Chartboost;->DEBUG:Z

    .line 15
    sput-object v1, Lcom/miniclip/Chartboost/Chartboost;->APP_ID:Ljava/lang/String;

    .line 16
    sput-object v1, Lcom/miniclip/Chartboost/Chartboost;->APP_SIGNATURE:Ljava/lang/String;

    .line 19
    sput-object v1, Lcom/miniclip/Chartboost/Chartboost;->activity:Landroid/app/Activity;

    .line 24
    const/4 v0, 0x2

    sput v0, Lcom/miniclip/Chartboost/Chartboost;->minSessionCount:I

    .line 25
    const/4 v0, 0x5

    sput v0, Lcom/miniclip/Chartboost/Chartboost;->maxTriggerCount:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method public static addTriggerCount()V
    .locals 1

    .prologue
    .line 87
    sget v0, Lcom/miniclip/Chartboost/Chartboost;->triggerCount:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/miniclip/Chartboost/Chartboost;->triggerCount:I

    .line 88
    return-void
.end method

.method static debugLog(Ljava/lang/String;)V
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 118
    sget-boolean v0, Lcom/miniclip/Chartboost/Chartboost;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 119
    sget-object v0, Lcom/miniclip/Chartboost/Chartboost;->TAG:Ljava/lang/String;

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    :cond_0
    return-void
.end method

.method public static getTriggerCount()I
    .locals 1

    .prologue
    .line 92
    sget v0, Lcom/miniclip/Chartboost/Chartboost;->triggerCount:I

    return v0
.end method

.method public static onBackPressed()Z
    .locals 1

    .prologue
    .line 72
    sget-object v0, Lcom/miniclip/Chartboost/Chartboost;->cb:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public static onCreate(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "appSignature"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 33
    sput-object p0, Lcom/miniclip/Chartboost/Chartboost;->activity:Landroid/app/Activity;

    .line 34
    sput-object p1, Lcom/miniclip/Chartboost/Chartboost;->APP_ID:Ljava/lang/String;

    .line 35
    sput-object p2, Lcom/miniclip/Chartboost/Chartboost;->APP_SIGNATURE:Ljava/lang/String;

    .line 37
    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v2

    sput-object v2, Lcom/miniclip/Chartboost/Chartboost;->cb:Lcom/chartboost/sdk/Chartboost;

    .line 39
    sget-object v2, Lcom/miniclip/Chartboost/Chartboost;->cb:Lcom/chartboost/sdk/Chartboost;

    const/4 v3, 0x0

    invoke-virtual {v2, p0, p1, p2, v3}, Lcom/chartboost/sdk/Chartboost;->onCreate(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/chartboost/sdk/ChartboostDelegate;)V

    .line 41
    sget-object v2, Lcom/miniclip/Chartboost/Chartboost;->cb:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v2}, Lcom/chartboost/sdk/Chartboost;->startSession()V

    .line 43
    const-string v2, "chartboost"

    invoke-virtual {p0, v2, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 44
    .local v1, "preferences":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 46
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "sessionCount"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    sput v2, Lcom/miniclip/Chartboost/Chartboost;->sessionCount:I

    .line 47
    sget v2, Lcom/miniclip/Chartboost/Chartboost;->sessionCount:I

    add-int/lit8 v2, v2, 0x1

    sput v2, Lcom/miniclip/Chartboost/Chartboost;->sessionCount:I

    .line 49
    const-string v2, "sessionCount"

    sget v3, Lcom/miniclip/Chartboost/Chartboost;->sessionCount:I

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 50
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 52
    sput v4, Lcom/miniclip/Chartboost/Chartboost;->triggerCount:I

    .line 53
    return-void
.end method

.method public static onDestroy()V
    .locals 2

    .prologue
    .line 67
    sget-object v0, Lcom/miniclip/Chartboost/Chartboost;->cb:Lcom/chartboost/sdk/Chartboost;

    sget-object v1, Lcom/miniclip/Chartboost/Chartboost;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/Chartboost;->onDestroy(Landroid/app/Activity;)V

    .line 68
    return-void
.end method

.method public static onStart()V
    .locals 2

    .prologue
    .line 57
    sget-object v0, Lcom/miniclip/Chartboost/Chartboost;->cb:Lcom/chartboost/sdk/Chartboost;

    sget-object v1, Lcom/miniclip/Chartboost/Chartboost;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/Chartboost;->onStart(Landroid/app/Activity;)V

    .line 58
    return-void
.end method

.method public static onStop()V
    .locals 2

    .prologue
    .line 62
    sget-object v0, Lcom/miniclip/Chartboost/Chartboost;->cb:Lcom/chartboost/sdk/Chartboost;

    sget-object v1, Lcom/miniclip/Chartboost/Chartboost;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/Chartboost;->onStop(Landroid/app/Activity;)V

    .line 63
    return-void
.end method

.method public static setMaxTriggerCount(I)V
    .locals 0
    .param p0, "maxTriggerCount"    # I

    .prologue
    .line 82
    sput p0, Lcom/miniclip/Chartboost/Chartboost;->maxTriggerCount:I

    .line 83
    return-void
.end method

.method public static setMinSessionCount(I)V
    .locals 0
    .param p0, "minSessionCount"    # I

    .prologue
    .line 77
    sput p0, Lcom/miniclip/Chartboost/Chartboost;->minSessionCount:I

    .line 78
    return-void
.end method

.method public static showInterstitial(III)I
    .locals 5
    .param p0, "useFullversion"    # I
    .param p1, "useSessionCount"    # I
    .param p2, "useTriggerCount"    # I

    .prologue
    const/4 v2, 0x1

    .line 97
    const/4 v1, 0x0

    .line 98
    .local v1, "result":I
    invoke-static {}, Lcom/miniclip/nativeJNI/cocojava;->isFullVersion()I

    move-result v3

    if-ne v3, v2, :cond_3

    move v0, v2

    .line 100
    .local v0, "fullversion":Z
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Trying to show chartboost ad. Use Fullversion = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Use Session Count = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Use Trigger Count = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/miniclip/Chartboost/Chartboost;->debugLog(Ljava/lang/String;)V

    .line 102
    if-eqz p0, :cond_0

    if-ne p0, v2, :cond_4

    if-nez v0, :cond_4

    :cond_0
    if-eqz p1, :cond_1

    if-ne p1, v2, :cond_4

    sget v3, Lcom/miniclip/Chartboost/Chartboost;->sessionCount:I

    sget v4, Lcom/miniclip/Chartboost/Chartboost;->minSessionCount:I

    if-lt v3, v4, :cond_4

    :cond_1
    if-eqz p2, :cond_2

    if-ne p2, v2, :cond_4

    sget v2, Lcom/miniclip/Chartboost/Chartboost;->triggerCount:I

    if-lez v2, :cond_4

    sget v2, Lcom/miniclip/Chartboost/Chartboost;->triggerCount:I

    sget v3, Lcom/miniclip/Chartboost/Chartboost;->maxTriggerCount:I

    rem-int/2addr v2, v3

    if-nez v2, :cond_4

    .line 106
    :cond_2
    sget-object v2, Lcom/miniclip/Chartboost/Chartboost;->cb:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v2}, Lcom/chartboost/sdk/Chartboost;->showInterstitial()V

    .line 107
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Showing chartboost ad. Fullversion = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Session = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/miniclip/Chartboost/Chartboost;->sessionCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (min: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/miniclip/Chartboost/Chartboost;->minSessionCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ) Trigger = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/miniclip/Chartboost/Chartboost;->triggerCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (max: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/miniclip/Chartboost/Chartboost;->maxTriggerCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " )"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miniclip/Chartboost/Chartboost;->debugLog(Ljava/lang/String;)V

    .line 109
    const/4 v1, 0x1

    .line 113
    :goto_1
    return v1

    .line 98
    .end local v0    # "fullversion":Z
    :cond_3
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 111
    .restart local v0    # "fullversion":Z
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not showing chartboost ad. Fullversion = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Session = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/miniclip/Chartboost/Chartboost;->sessionCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (min: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/miniclip/Chartboost/Chartboost;->minSessionCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ) Trigger = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/miniclip/Chartboost/Chartboost;->triggerCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (max: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/miniclip/Chartboost/Chartboost;->maxTriggerCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " )"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miniclip/Chartboost/Chartboost;->debugLog(Ljava/lang/String;)V

    goto :goto_1
.end method
