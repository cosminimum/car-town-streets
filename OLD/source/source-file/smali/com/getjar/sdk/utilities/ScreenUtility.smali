.class public Lcom/getjar/sdk/utilities/ScreenUtility;
.super Ljava/lang/Object;
.source "ScreenUtility.java"


# static fields
.field private static decimalFormat:Ljava/text/DecimalFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 24
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "##.###"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/getjar/sdk/utilities/ScreenUtility;->decimalFormat:Ljava/text/DecimalFormat;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDisplayDetails(Landroid/content/Context;)Ljava/util/HashMap;
    .locals 6
    .param p0, "androidContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/MetadataValue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 28
    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'context\' cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 30
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 32
    .local v0, "output":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    invoke-static {p0}, Lcom/getjar/sdk/utilities/ScreenUtility;->getScreenData(Landroid/content/Context;)Lcom/getjar/sdk/utilities/ScreenData;

    move-result-object v1

    .line 33
    .local v1, "screenData":Lcom/getjar/sdk/utilities/ScreenData;
    const-string v2, "device.screen_dpi.width"

    new-instance v3, Lcom/getjar/sdk/data/MetadataValue;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/ScreenData;->getXDpi()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v3, v4, v5}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    const-string v2, "device.screen_dpi.height"

    new-instance v3, Lcom/getjar/sdk/data/MetadataValue;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/ScreenData;->getYDpi()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v3, v4, v5}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    const-string v2, "device.screen_resolution.width"

    new-instance v3, Lcom/getjar/sdk/data/MetadataValue;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/ScreenData;->getResolutionX()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v3, v4, v5}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    const-string v2, "device.screen_resolution.height"

    new-instance v3, Lcom/getjar/sdk/data/MetadataValue;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/ScreenData;->getResolutionY()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v3, v4, v5}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    return-object v0
.end method

.method public static getDisplayMetrics(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 12
    .param p0, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 44
    if-nez p0, :cond_0

    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "\'context\' cannot be null"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 45
    :cond_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 47
    .local v3, "output":Lorg/json/JSONObject;
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 48
    .local v6, "screenRes":Lorg/json/JSONObject;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 49
    .local v0, "availableRes":Lorg/json/JSONObject;
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 50
    .local v5, "screenDpi":Lorg/json/JSONObject;
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 52
    .local v7, "screenSize":Lorg/json/JSONObject;
    invoke-static {p0}, Lcom/getjar/sdk/utilities/ScreenUtility;->getScreenData(Landroid/content/Context;)Lcom/getjar/sdk/utilities/ScreenData;

    move-result-object v4

    .line 55
    .local v4, "screenData":Lcom/getjar/sdk/utilities/ScreenData;
    :try_start_0
    const-string v8, "width"

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/ScreenData;->getAvailableResX()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    const-string v8, "height"

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/ScreenData;->getAvailableResY()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    :goto_0
    :try_start_1
    const-string v8, "width"

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/ScreenData;->getResolutionX()I

    move-result v9

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 63
    const-string v8, "height"

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/ScreenData;->getResolutionY()I

    move-result v9

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 69
    :goto_1
    :try_start_2
    const-string v8, "x"

    sget-object v9, Lcom/getjar/sdk/utilities/ScreenUtility;->decimalFormat:Ljava/text/DecimalFormat;

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/ScreenData;->getXDpi()D

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    const-string v8, "y"

    sget-object v9, Lcom/getjar/sdk/utilities/ScreenUtility;->decimalFormat:Ljava/text/DecimalFormat;

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/ScreenData;->getYDpi()D

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 76
    :goto_2
    :try_start_3
    const-string v8, "height"

    sget-object v9, Lcom/getjar/sdk/utilities/ScreenUtility;->decimalFormat:Ljava/text/DecimalFormat;

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/ScreenData;->getScreenHeight()D

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    const-string v8, "width"

    sget-object v9, Lcom/getjar/sdk/utilities/ScreenUtility;->decimalFormat:Ljava/text/DecimalFormat;

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/ScreenData;->getScreenWidth()D

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    .line 83
    :goto_3
    :try_start_4
    const-string v8, "screen_dpi"

    invoke-virtual {v3, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 84
    const-string v8, "screen_resolution"

    invoke-virtual {v3, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    const-string v8, "available_resolution"

    invoke-virtual {v3, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 86
    const-string v8, "screen_size"

    invoke-virtual {v3, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    .line 92
    :goto_4
    sget-object v8, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Screen details: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 93
    return-object v3

    .line 57
    :catch_0
    move-exception v2

    .line 58
    .local v2, "e1":Lorg/json/JSONException;
    sget-object v8, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ScreenUtility getDisplayMetrics() -- Error getting availableRes "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v2}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 64
    .end local v2    # "e1":Lorg/json/JSONException;
    :catch_1
    move-exception v2

    .line 65
    .restart local v2    # "e1":Lorg/json/JSONException;
    sget-object v8, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ScreenUtility getDisplayMetrics() -- Error getting screenRes "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v2}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_1

    .line 71
    .end local v2    # "e1":Lorg/json/JSONException;
    :catch_2
    move-exception v2

    .line 72
    .restart local v2    # "e1":Lorg/json/JSONException;
    sget-object v8, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ScreenUtility getDisplayMetrics() -- Error getting screenDpi "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v2}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_2

    .line 78
    .end local v2    # "e1":Lorg/json/JSONException;
    :catch_3
    move-exception v2

    .line 79
    .restart local v2    # "e1":Lorg/json/JSONException;
    sget-object v8, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ScreenUtility getDisplayMetrics() -- Error getting screenSize "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v2}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_3

    .line 88
    .end local v2    # "e1":Lorg/json/JSONException;
    :catch_4
    move-exception v1

    .line 89
    .local v1, "e":Lorg/json/JSONException;
    sget-object v8, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    or-long/2addr v8, v10

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ScreenUtility getDisplayMetrics() -- Error getting all json objects together "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v1}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_4
.end method

.method private static getScreenData(Landroid/content/Context;)Lcom/getjar/sdk/utilities/ScreenData;
    .locals 21
    .param p0, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 102
    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'context\' cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 105
    :cond_0
    new-instance v17, Landroid/util/DisplayMetrics;

    invoke-direct/range {v17 .. v17}, Landroid/util/DisplayMetrics;-><init>()V

    .line 107
    .local v17, "displayMetrics":Landroid/util/DisplayMetrics;
    const-string v2, "window"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Landroid/view/WindowManager;

    .line 108
    .local v20, "window":Landroid/view/WindowManager;
    invoke-interface/range {v20 .. v20}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v16

    .line 109
    .local v16, "display":Landroid/view/Display;
    invoke-virtual/range {v16 .. v17}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 110
    const/4 v14, 0x0

    .line 111
    .local v14, "activity":Landroid/app/Activity;
    const-class v2, Landroid/app/Activity;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1

    move-object/from16 v14, p0

    .line 112
    check-cast v14, Landroid/app/Activity;

    .line 115
    :cond_1
    const/4 v12, 0x0

    .line 116
    .local v12, "availableResX":Ljava/lang/Integer;
    const/4 v13, 0x0

    .line 118
    .local v13, "availableResY":Ljava/lang/Integer;
    if-eqz v14, :cond_2

    .line 119
    new-instance v18, Landroid/graphics/Rect;

    invoke-direct/range {v18 .. v18}, Landroid/graphics/Rect;-><init>()V

    .line 120
    .local v18, "rect":Landroid/graphics/Rect;
    invoke-virtual {v14}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v19

    .line 121
    .local v19, "win":Landroid/view/Window;
    invoke-virtual/range {v19 .. v19}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 124
    const v2, 0x1020002

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v15

    .line 126
    .local v15, "contentViewTop":I
    move-object/from16 v0, v17

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 127
    move-object/from16 v0, v17

    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    sub-int/2addr v2, v15

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    .line 130
    .end local v15    # "contentViewTop":I
    .end local v18    # "rect":Landroid/graphics/Rect;
    .end local v19    # "win":Landroid/view/Window;
    :cond_2
    move-object/from16 v0, v17

    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    move-object/from16 v0, v17

    iget v3, v0, Landroid/util/DisplayMetrics;->ydpi:F

    div-float/2addr v2, v3

    float-to-double v10, v2

    .line 131
    .local v10, "screenHeight":D
    move-object/from16 v0, v17

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    move-object/from16 v0, v17

    iget v3, v0, Landroid/util/DisplayMetrics;->xdpi:F

    div-float/2addr v2, v3

    float-to-double v8, v2

    .line 133
    .local v8, "screenWidth":D
    new-instance v1, Lcom/getjar/sdk/utilities/ScreenData;

    move-object/from16 v0, v17

    iget v2, v0, Landroid/util/DisplayMetrics;->xdpi:F

    float-to-double v2, v2

    move-object/from16 v0, v17

    iget v4, v0, Landroid/util/DisplayMetrics;->ydpi:F

    float-to-double v4, v4

    move-object/from16 v0, v17

    iget v6, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    move-object/from16 v0, v17

    iget v7, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-direct/range {v1 .. v13}, Lcom/getjar/sdk/utilities/ScreenData;-><init>(DDIIDDLjava/lang/Integer;Ljava/lang/Integer;)V

    .line 136
    .local v1, "screenData":Lcom/getjar/sdk/utilities/ScreenData;
    return-object v1
.end method
