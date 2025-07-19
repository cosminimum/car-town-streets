.class abstract Lcom/getjar/sdk/logging/AppenderBase;
.super Ljava/lang/Object;
.source "AppenderBase.java"

# interfaces
.implements Lcom/getjar/sdk/logging/AppenderInterface;


# static fields
.field protected static _TAG:Ljava/lang/String;


# instance fields
.field private volatile _areas:J

.field private volatile _enabled:Z

.field private volatile _level:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-string v0, "GetJar SDK"

    sput-object v0, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(ZIJ)V
    .locals 2
    .param p1, "enabled"    # Z
    .param p2, "level"    # I
    .param p3, "areas"    # J

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-static {p2}, Lcom/getjar/sdk/logging/AppenderBase;->validateLevel(I)V

    .line 29
    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-gtz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'areas\' cannot be zero or less"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 31
    :cond_0
    iput-boolean p1, p0, Lcom/getjar/sdk/logging/AppenderBase;->_enabled:Z

    .line 32
    iput p2, p0, Lcom/getjar/sdk/logging/AppenderBase;->_level:I

    .line 33
    iput-wide p3, p0, Lcom/getjar/sdk/logging/AppenderBase;->_areas:J

    .line 34
    return-void
.end method

.method private static getLogLevelFromString(Ljava/lang/String;)I
    .locals 5
    .param p0, "logLevel"    # Ljava/lang/String;

    .prologue
    .line 175
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'logLevelString\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :cond_0
    const-string v0, "ASSERT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x7

    .line 182
    :goto_0
    return v0

    .line 178
    :cond_1
    const-string v0, "DEBUG"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    goto :goto_0

    .line 179
    :cond_2
    const-string v0, "ERROR"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x6

    goto :goto_0

    .line 180
    :cond_3
    const-string v0, "INFO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x4

    goto :goto_0

    .line 181
    :cond_4
    const-string v0, "VERBOSE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x2

    goto :goto_0

    .line 182
    :cond_5
    const-string v0, "WARN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v0, 0x5

    goto :goto_0

    .line 183
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Unsupported log level [%1$s]"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static parseAreas(Ljava/lang/String;)J
    .locals 8
    .param p0, "areasString"    # Ljava/lang/String;

    .prologue
    .line 153
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'areasString\' cannot be NULL or empty"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 156
    :cond_0
    const-wide/16 v0, 0x0

    .line 157
    .local v0, "areaBitmask":J
    const-string v6, "\\|"

    invoke-virtual {p0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .local v3, "arr$":[Ljava/lang/String;
    array-length v5, v3

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_2

    aget-object v2, v3, v4

    .line 158
    .local v2, "areaStr":Ljava/lang/String;
    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 157
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 159
    :cond_1
    invoke-static {v2}, Lcom/getjar/sdk/logging/Area;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/logging/Area;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v0, v6

    goto :goto_1

    .line 163
    .end local v2    # "areaStr":Ljava/lang/String;
    :cond_2
    const-wide/16 v6, 0x0

    cmp-long v6, v0, v6

    if-nez v6, :cond_3

    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "parseAreas() failed to parse any recognized area values"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 164
    :cond_3
    return-wide v0
.end method

.method private static validateLevel(I)V
    .locals 6
    .param p0, "level"    # I

    .prologue
    .line 139
    const/4 v0, 0x7

    if-eq p0, v0, :cond_0

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    const/4 v0, 0x6

    if-eq p0, v0, :cond_0

    const/4 v0, 0x4

    if-eq p0, v0, :cond_0

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    const/4 v0, 0x5

    if-eq p0, v0, :cond_0

    .line 140
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Unsupported log level: %1$d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :cond_0
    return-void
.end method


# virtual methods
.method protected configureAppender(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "enabled"    # Z
    .param p2, "level"    # Ljava/lang/String;
    .param p3, "areas"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-static {p2}, Lcom/getjar/sdk/logging/AppenderBase;->getLogLevelFromString(Ljava/lang/String;)I

    move-result v2

    .line 47
    .local v2, "parsedLevel":I
    invoke-static {p3}, Lcom/getjar/sdk/logging/AppenderBase;->parseAreas(Ljava/lang/String;)J

    move-result-wide v0

    .line 50
    .local v0, "parsedAreas":J
    iput-boolean p1, p0, Lcom/getjar/sdk/logging/AppenderBase;->_enabled:Z

    .line 51
    iput v2, p0, Lcom/getjar/sdk/logging/AppenderBase;->_level:I

    .line 52
    iput-wide v0, p0, Lcom/getjar/sdk/logging/AppenderBase;->_areas:J

    .line 54
    sget-object v3, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s|%2$s: AppenderBase: configureAppender() Appender %3$s configured [enabled=%4$s level=%5$s areas=%6$s]"

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    sget-object v8, Lcom/getjar/sdk/logging/Area;->LOGGING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    sget-object v8, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x3

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x4

    aput-object p2, v6, v7

    const/4 v7, 0x5

    aput-object p3, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    return-void
.end method

.method public getAreas()J
    .locals 2

    .prologue
    .line 93
    iget-wide v0, p0, Lcom/getjar/sdk/logging/AppenderBase;->_areas:J

    return-wide v0
.end method

.method public getLevel()I
    .locals 1

    .prologue
    .line 87
    iget v0, p0, Lcom/getjar/sdk/logging/AppenderBase;->_level:I

    return v0
.end method

.method public isAreaActive(J)Z
    .locals 2
    .param p1, "areas"    # J

    .prologue
    .line 81
    iget-wide v0, p0, Lcom/getjar/sdk/logging/AppenderBase;->_areas:J

    invoke-static {v0, v1, p1, p2}, Lcom/getjar/sdk/logging/Area;->areasOverlap(JJ)Z

    move-result v0

    return v0
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/getjar/sdk/logging/AppenderBase;->_enabled:Z

    return v0
.end method

.method public isLevelActive(I)Z
    .locals 1
    .param p1, "logLevel"    # I

    .prologue
    .line 73
    invoke-static {p1}, Lcom/getjar/sdk/logging/AppenderBase;->validateLevel(I)V

    .line 74
    iget v0, p0, Lcom/getjar/sdk/logging/AppenderBase;->_level:I

    if-gt v0, p1, :cond_0

    const/4 v0, 0x1

    .line 75
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected logInternal(ILjava/lang/String;)V
    .locals 1
    .param p1, "level"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 101
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/getjar/sdk/logging/AppenderBase;->logInternal(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 102
    return-void
.end method

.method protected logInternal(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "level"    # I
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 109
    invoke-static {p1}, Lcom/getjar/sdk/logging/AppenderBase;->validateLevel(I)V

    .line 110
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/logging/AppenderBase;->isLevelActive(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 111
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%1$s: %2$s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    sget-object v4, Lcom/getjar/sdk/logging/Area;->LOGGING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    aput-object p2, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 112
    .local v0, "logCatMsg":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 129
    new-instance v1, Ljava/lang/IllegalArgumentException;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Unsupported log level [level:%1$d]"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 114
    :pswitch_0
    if-nez p3, :cond_1

    sget-object v1, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    .end local v0    # "logCatMsg":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 114
    .restart local v0    # "logCatMsg":Ljava/lang/String;
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0, p3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 117
    :pswitch_1
    if-nez p3, :cond_2

    sget-object v1, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    sget-object v1, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 120
    :pswitch_2
    if-nez p3, :cond_3

    sget-object v1, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_3
    sget-object v1, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 123
    :pswitch_3
    if-nez p3, :cond_4

    sget-object v1, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_4
    sget-object v1, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 126
    :pswitch_4
    if-nez p3, :cond_5

    sget-object v1, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_5
    sget-object v1, Lcom/getjar/sdk/logging/AppenderBase;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 112
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
