.class public Lcom/getjar/sdk/logging/Logger;
.super Ljava/lang/Object;
.source "Logger.java"


# static fields
.field private static _Instance:Lcom/getjar/sdk/logging/Logger;

.field private static _InstanceLock:Ljava/lang/Object;


# instance fields
.field private final _appenders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/logging/AppenderInterface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/logging/Logger;->_Instance:Lcom/getjar/sdk/logging/Logger;

    .line 28
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/Logger;->_InstanceLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/logging/AppenderInterface;

    const/4 v1, 0x0

    invoke-static {}, Lcom/getjar/sdk/logging/LogCatAppender;->getInstance()Lcom/getjar/sdk/logging/LogCatAppender;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-static {}, Lcom/getjar/sdk/logging/BufferingAppender;->getInstance()Lcom/getjar/sdk/logging/BufferingAppender;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    invoke-static {}, Lcom/getjar/sdk/logging/RemoteAppender;->getInstance()Lcom/getjar/sdk/logging/RemoteAppender;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/logging/Logger;->_appenders:Ljava/util/List;

    .line 26
    return-void
.end method

.method public static d(JLjava/lang/String;)V
    .locals 1
    .param p0, "areas"    # J
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 109
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static d(JLjava/lang/String;Ljava/lang/Throwable;)V
    .locals 6
    .param p0, "areas"    # J
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 110
    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getInstance()Lcom/getjar/sdk/logging/Logger;

    move-result-object v0

    const/4 v1, 0x3

    move-wide v2, p0

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/logging/Logger;->log(IJLjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static e(JLjava/lang/String;)V
    .locals 1
    .param p0, "areas"    # J
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 121
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static e(JLjava/lang/String;Ljava/lang/Throwable;)V
    .locals 6
    .param p0, "areas"    # J
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 122
    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getInstance()Lcom/getjar/sdk/logging/Logger;

    move-result-object v0

    const/4 v1, 0x6

    move-wide v2, p0

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/logging/Logger;->log(IJLjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static getInstance()Lcom/getjar/sdk/logging/Logger;
    .locals 2

    .prologue
    .line 30
    sget-object v0, Lcom/getjar/sdk/logging/Logger;->_Instance:Lcom/getjar/sdk/logging/Logger;

    if-nez v0, :cond_1

    .line 31
    sget-object v1, Lcom/getjar/sdk/logging/Logger;->_InstanceLock:Ljava/lang/Object;

    monitor-enter v1

    .line 32
    :try_start_0
    sget-object v0, Lcom/getjar/sdk/logging/Logger;->_Instance:Lcom/getjar/sdk/logging/Logger;

    if-nez v0, :cond_0

    .line 33
    new-instance v0, Lcom/getjar/sdk/logging/Logger;

    invoke-direct {v0}, Lcom/getjar/sdk/logging/Logger;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/Logger;->_Instance:Lcom/getjar/sdk/logging/Logger;

    .line 35
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    :cond_1
    sget-object v0, Lcom/getjar/sdk/logging/Logger;->_Instance:Lcom/getjar/sdk/logging/Logger;

    return-object v0

    .line 35
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static getShortStack()Ljava/lang/String;
    .locals 1

    .prologue
    .line 135
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/logging/Logger;->getShortStack([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getShortStack([Ljava/lang/StackTraceElement;)Ljava/lang/String;
    .locals 6
    .param p0, "stack"    # [Ljava/lang/StackTraceElement;

    .prologue
    .line 140
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v5, ""

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .local v1, "callPath":Ljava/lang/StringBuilder;
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v2, v0, v3

    .line 142
    .local v2, "frame":Ljava/lang/StackTraceElement;
    const/16 v5, 0x3a

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 143
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    const/16 v5, 0x2e

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 145
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 147
    .end local v2    # "frame":Ljava/lang/StackTraceElement;
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static getStackTrace()Ljava/lang/String;
    .locals 8

    .prologue
    .line 152
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 153
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    .line 154
    .local v2, "stacks":[Ljava/lang/StackTraceElement;
    const/4 v1, 0x3

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 155
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%1$s : %2$s : %3$s [%4$d]\n"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aget-object v7, v2, v1

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aget-object v7, v2, v1

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    aget-object v7, v2, v1

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    aget-object v7, v2, v1

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 154
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 161
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getStackTrace([Ljava/lang/StackTraceElement;)Ljava/lang/String;
    .locals 7
    .param p0, "stacks"    # [Ljava/lang/StackTraceElement;

    .prologue
    .line 166
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 167
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 168
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%1$s : %2$s : %3$s [%4$d]\n"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aget-object v6, p0, v1

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aget-object v6, p0, v1

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    aget-object v6, p0, v1

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    aget-object v6, p0, v1

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 167
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 175
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getThrowableDump(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 5
    .param p0, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 126
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s | %s | %s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    invoke-static {v4}, Lcom/getjar/sdk/logging/Logger;->getStackTrace([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static i(JLjava/lang/String;)V
    .locals 1
    .param p0, "areas"    # J
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 113
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static i(JLjava/lang/String;Ljava/lang/Throwable;)V
    .locals 6
    .param p0, "areas"    # J
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 114
    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getInstance()Lcom/getjar/sdk/logging/Logger;

    move-result-object v0

    const/4 v1, 0x4

    move-wide v2, p0

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/logging/Logger;->log(IJLjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static levelToName(I)Ljava/lang/String;
    .locals 6
    .param p0, "level"    # I

    .prologue
    .line 183
    packed-switch p0, :pswitch_data_0

    .line 189
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Unsupported log level [level:%1$d]"

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

    .line 184
    :pswitch_0
    const-string v0, "V"

    .line 188
    :goto_0
    return-object v0

    .line 185
    :pswitch_1
    const-string v0, "D"

    goto :goto_0

    .line 186
    :pswitch_2
    const-string v0, "I"

    goto :goto_0

    .line 187
    :pswitch_3
    const-string v0, "W"

    goto :goto_0

    .line 188
    :pswitch_4
    const-string v0, "E"

    goto :goto_0

    .line 183
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public static v(JLjava/lang/String;)V
    .locals 1
    .param p0, "areas"    # J
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static v(JLjava/lang/String;Ljava/lang/Throwable;)V
    .locals 6
    .param p0, "areas"    # J
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 106
    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getInstance()Lcom/getjar/sdk/logging/Logger;

    move-result-object v0

    const/4 v1, 0x2

    move-wide v2, p0

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/logging/Logger;->log(IJLjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static w(JLjava/lang/String;)V
    .locals 1
    .param p0, "areas"    # J
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 117
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static w(JLjava/lang/String;Ljava/lang/Throwable;)V
    .locals 6
    .param p0, "areas"    # J
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 118
    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getInstance()Lcom/getjar/sdk/logging/Logger;

    move-result-object v0

    const/4 v1, 0x5

    move-wide v2, p0

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/getjar/sdk/logging/Logger;->log(IJLjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public configureAppenders(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    iget-object v2, p0, Lcom/getjar/sdk/logging/Logger;->_appenders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/logging/AppenderInterface;

    .line 47
    .local v1, "logger":Lcom/getjar/sdk/logging/AppenderInterface;
    invoke-interface {v1, p1}, Lcom/getjar/sdk/logging/AppenderInterface;->configureAppender(Landroid/content/Context;)V

    goto :goto_0

    .line 49
    .end local v1    # "logger":Lcom/getjar/sdk/logging/AppenderInterface;
    :cond_0
    return-void
.end method

.method public isAreaActive(J)Z
    .locals 3
    .param p1, "areas"    # J

    .prologue
    .line 73
    iget-object v2, p0, Lcom/getjar/sdk/logging/Logger;->_appenders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/logging/AppenderInterface;

    .line 74
    .local v1, "logger":Lcom/getjar/sdk/logging/AppenderInterface;
    invoke-interface {v1, p1, p2}, Lcom/getjar/sdk/logging/AppenderInterface;->isAreaActive(J)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    .line 76
    .end local v1    # "logger":Lcom/getjar/sdk/logging/AppenderInterface;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public isLevelActive(I)Z
    .locals 8
    .param p1, "logLevel"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 59
    const/4 v4, 0x7

    if-eq p1, v4, :cond_0

    const/4 v4, 0x3

    if-eq p1, v4, :cond_0

    const/4 v4, 0x6

    if-eq p1, v4, :cond_0

    const/4 v4, 0x4

    if-eq p1, v4, :cond_0

    const/4 v4, 0x2

    if-eq p1, v4, :cond_0

    const/4 v4, 0x5

    if-eq p1, v4, :cond_0

    .line 60
    new-instance v4, Ljava/lang/IllegalArgumentException;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "Unsupported log level: %1$d"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v2, v3

    invoke-static {v5, v6, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 62
    :cond_0
    iget-object v4, p0, Lcom/getjar/sdk/logging/Logger;->_appenders:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/logging/AppenderInterface;

    .line 63
    .local v1, "logger":Lcom/getjar/sdk/logging/AppenderInterface;
    invoke-interface {v1, p1}, Lcom/getjar/sdk/logging/AppenderInterface;->isLevelActive(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 65
    .end local v1    # "logger":Lcom/getjar/sdk/logging/AppenderInterface;
    :goto_0
    return v2

    :cond_2
    move v2, v3

    goto :goto_0
.end method

.method public log(IJLjava/lang/String;Ljava/lang/Throwable;)V
    .locals 8
    .param p1, "level"    # I
    .param p2, "areas"    # J
    .param p4, "msg"    # Ljava/lang/String;
    .param p5, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 90
    const-wide/16 v1, 0x0

    cmp-long v1, p2, v1

    if-gtz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'area\' cannot be less than or equal to 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 91
    :cond_0
    if-nez p4, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'msg\' cannot be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 94
    :cond_1
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/logging/Logger;->isLevelActive(I)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0, p2, p3}, Lcom/getjar/sdk/logging/Logger;->isAreaActive(J)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 95
    new-instance v0, Lcom/getjar/sdk/logging/LogMessage;

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/logging/LogMessage;-><init>(IJLjava/lang/String;Ljava/lang/Throwable;)V

    .line 96
    .local v0, "logMessage":Lcom/getjar/sdk/logging/LogMessage;
    iget-object v1, p0, Lcom/getjar/sdk/logging/Logger;->_appenders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/getjar/sdk/logging/AppenderInterface;

    .line 97
    .local v6, "appender":Lcom/getjar/sdk/logging/AppenderInterface;
    invoke-interface {v6, p1}, Lcom/getjar/sdk/logging/AppenderInterface;->isLevelActive(I)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v6, p2, p3}, Lcom/getjar/sdk/logging/AppenderInterface;->isAreaActive(J)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 98
    invoke-interface {v6, v0}, Lcom/getjar/sdk/logging/AppenderInterface;->log(Lcom/getjar/sdk/logging/LogMessage;)V

    goto :goto_0

    .line 102
    .end local v0    # "logMessage":Lcom/getjar/sdk/logging/LogMessage;
    .end local v6    # "appender":Lcom/getjar/sdk/logging/AppenderInterface;
    .end local v7    # "i$":Ljava/util/Iterator;
    :cond_3
    return-void
.end method
