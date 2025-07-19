.class public Lcom/getjar/sdk/comm/auth/SettingsManager;
.super Ljava/lang/Object;
.source "SettingsManager.java"


# static fields
.field private static _Instance:Lcom/getjar/sdk/comm/auth/SettingsManager;


# instance fields
.field private androidContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/auth/SettingsManager;->_Instance:Lcom/getjar/sdk/comm/auth/SettingsManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'androidContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 25
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/SettingsManager;->androidContext:Landroid/content/Context;

    .line 26
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/SettingsManager;
    .locals 1
    .param p0, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 34
    sget-object v0, Lcom/getjar/sdk/comm/auth/SettingsManager;->_Instance:Lcom/getjar/sdk/comm/auth/SettingsManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/getjar/sdk/comm/auth/SettingsManager;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/comm/auth/SettingsManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/SettingsManager;->_Instance:Lcom/getjar/sdk/comm/auth/SettingsManager;

    .line 36
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/SettingsManager;->_Instance:Lcom/getjar/sdk/comm/auth/SettingsManager;

    return-object v0
.end method


# virtual methods
.method public getValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'key\' cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 48
    :cond_0
    const/4 v2, 0x0

    .line 53
    .local v2, "settingsValue":Lcom/getjar/sdk/comm/auth/SettingsValue;
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->getSettings()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/getjar/sdk/comm/auth/SettingsValue;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :goto_0
    if-nez v2, :cond_1

    .line 60
    const/4 v3, 0x0

    .line 62
    :goto_1
    return-object v3

    .line 55
    :catch_0
    move-exception v1

    .line 56
    .local v1, "e":Ljava/lang/IllegalStateException;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "Unable to use \'settings\' at this time [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto :goto_0

    .line 62
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :cond_1
    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/SettingsValue;->getValue()Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method
