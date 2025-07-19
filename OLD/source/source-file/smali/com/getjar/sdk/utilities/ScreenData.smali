.class public Lcom/getjar/sdk/utilities/ScreenData;
.super Ljava/lang/Object;
.source "ScreenData.java"


# instance fields
.field private final availableResX:Ljava/lang/Integer;

.field private final availableResY:Ljava/lang/Integer;

.field private final resolutionX:I

.field private final resolutionY:I

.field private final screenSizeX:D

.field private final screenSizeY:D

.field private final xDpi:D

.field private final yDpi:D


# direct methods
.method protected constructor <init>(DDIIDD)V
    .locals 13
    .param p1, "xDpi"    # D
    .param p3, "yDpi"    # D
    .param p5, "resolutionX"    # I
    .param p6, "resolutionY"    # I
    .param p7, "screenSizeX"    # D
    .param p9, "screenSizeY"    # D

    .prologue
    .line 53
    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide/from16 v3, p3

    move/from16 v5, p5

    move/from16 v6, p6

    move-wide/from16 v7, p7

    move-wide/from16 v9, p9

    invoke-direct/range {v0 .. v12}, Lcom/getjar/sdk/utilities/ScreenData;-><init>(DDIIDDLjava/lang/Integer;Ljava/lang/Integer;)V

    .line 54
    return-void
.end method

.method protected constructor <init>(DDIIDDLjava/lang/Integer;Ljava/lang/Integer;)V
    .locals 3
    .param p1, "xDpi"    # D
    .param p3, "yDpi"    # D
    .param p5, "resolutionX"    # I
    .param p6, "resolutionY"    # I
    .param p7, "screenSizeX"    # D
    .param p9, "screenSizeY"    # D
    .param p11, "availableResX"    # Ljava/lang/Integer;
    .param p12, "availableResY"    # Ljava/lang/Integer;

    .prologue
    const-wide/16 v1, 0x0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    cmpg-double v0, p1, v1

    if-gtz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value provided for \'xDpi\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 24
    :cond_0
    cmpg-double v0, p3, v1

    if-gtz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value provided for \'yDpi\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 25
    :cond_1
    if-gtz p5, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value provided for \'resolutionX\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_2
    if-gtz p6, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value provided for \'resolutionY\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 27
    :cond_3
    cmpg-double v0, p7, v1

    if-gtz v0, :cond_4

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value provided for \'screenSizeX\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 28
    :cond_4
    cmpg-double v0, p9, v1

    if-gtz v0, :cond_5

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value provided for \'screenSizeY\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 29
    :cond_5
    if-eqz p11, :cond_6

    invoke-virtual {p11}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-gtz v0, :cond_6

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value provided for \'availableResX\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 30
    :cond_6
    if-eqz p12, :cond_7

    invoke-virtual {p12}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-gtz v0, :cond_7

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid value provided for \'availableResY\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_7
    iput-wide p1, p0, Lcom/getjar/sdk/utilities/ScreenData;->xDpi:D

    .line 33
    iput-wide p3, p0, Lcom/getjar/sdk/utilities/ScreenData;->yDpi:D

    .line 34
    iput p5, p0, Lcom/getjar/sdk/utilities/ScreenData;->resolutionX:I

    .line 35
    iput p6, p0, Lcom/getjar/sdk/utilities/ScreenData;->resolutionY:I

    .line 36
    iput-wide p7, p0, Lcom/getjar/sdk/utilities/ScreenData;->screenSizeX:D

    .line 37
    iput-wide p9, p0, Lcom/getjar/sdk/utilities/ScreenData;->screenSizeY:D

    .line 38
    iput-object p11, p0, Lcom/getjar/sdk/utilities/ScreenData;->availableResX:Ljava/lang/Integer;

    .line 39
    iput-object p12, p0, Lcom/getjar/sdk/utilities/ScreenData;->availableResY:Ljava/lang/Integer;

    .line 40
    return-void
.end method


# virtual methods
.method protected getAvailableResX()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/getjar/sdk/utilities/ScreenData;->availableResX:Ljava/lang/Integer;

    return-object v0
.end method

.method protected getAvailableResY()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/getjar/sdk/utilities/ScreenData;->availableResY:Ljava/lang/Integer;

    return-object v0
.end method

.method protected getResolutionX()I
    .locals 1

    .prologue
    .line 60
    iget v0, p0, Lcom/getjar/sdk/utilities/ScreenData;->resolutionX:I

    return v0
.end method

.method protected getResolutionY()I
    .locals 1

    .prologue
    .line 67
    iget v0, p0, Lcom/getjar/sdk/utilities/ScreenData;->resolutionY:I

    return v0
.end method

.method protected getScreenHeight()D
    .locals 2

    .prologue
    .line 95
    iget-wide v0, p0, Lcom/getjar/sdk/utilities/ScreenData;->screenSizeY:D

    return-wide v0
.end method

.method protected getScreenWidth()D
    .locals 2

    .prologue
    .line 88
    iget-wide v0, p0, Lcom/getjar/sdk/utilities/ScreenData;->screenSizeX:D

    return-wide v0
.end method

.method protected getXDpi()D
    .locals 2

    .prologue
    .line 74
    iget-wide v0, p0, Lcom/getjar/sdk/utilities/ScreenData;->xDpi:D

    return-wide v0
.end method

.method protected getYDpi()D
    .locals 2

    .prologue
    .line 81
    iget-wide v0, p0, Lcom/getjar/sdk/utilities/ScreenData;->yDpi:D

    return-wide v0
.end method
