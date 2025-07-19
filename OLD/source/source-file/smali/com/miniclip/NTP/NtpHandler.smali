.class public Lcom/miniclip/NTP/NtpHandler;
.super Ljava/lang/Object;
.source "NtpHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miniclip/NTP/NtpHandler$NtpResponce;
    }
.end annotation


# instance fields
.field private _handler:Landroid/os/Handler;

.field private _status:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/miniclip/NTP/NtpHandler;->_status:I

    .line 28
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miniclip/NTP/NtpHandler;->_handler:Landroid/os/Handler;

    .line 29
    return-void
.end method

.method static synthetic access$000(Lcom/miniclip/NTP/NtpHandler;)I
    .locals 1
    .param p0, "x0"    # Lcom/miniclip/NTP/NtpHandler;

    .prologue
    .line 15
    iget v0, p0, Lcom/miniclip/NTP/NtpHandler;->_status:I

    return v0
.end method

.method static synthetic access$002(Lcom/miniclip/NTP/NtpHandler;I)I
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/NTP/NtpHandler;
    .param p1, "x1"    # I

    .prologue
    .line 15
    iput p1, p0, Lcom/miniclip/NTP/NtpHandler;->_status:I

    return p1
.end method


# virtual methods
.method public getOffsetFromServer(Ljava/lang/String;)D
    .locals 19
    .param p1, "serverName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    new-instance v12, Ljava/net/DatagramSocket;

    invoke-direct {v12}, Ljava/net/DatagramSocket;-><init>()V

    .line 34
    .local v12, "socket":Ljava/net/DatagramSocket;
    invoke-static/range {p1 .. p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    .line 35
    .local v2, "address":Ljava/net/InetAddress;
    new-instance v13, Lcom/miniclip/NTP/NtpMessage;

    invoke-direct {v13}, Lcom/miniclip/NTP/NtpMessage;-><init>()V

    invoke-virtual {v13}, Lcom/miniclip/NTP/NtpMessage;->toByteArray()[B

    move-result-object v3

    .line 36
    .local v3, "buf":[B
    new-instance v9, Ljava/net/DatagramPacket;

    array-length v13, v3

    const/16 v14, 0x7b

    invoke-direct {v9, v3, v13, v2, v14}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 40
    .local v9, "packet":Ljava/net/DatagramPacket;
    invoke-virtual {v9}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v13

    const/16 v14, 0x28

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    long-to-double v15, v15

    const-wide v17, 0x408f400000000000L    # 1000.0

    div-double v15, v15, v17

    const-wide v17, 0x41e0754fd0000000L    # 2.2089888E9

    add-double v15, v15, v17

    invoke-static/range {v13 .. v16}, Lcom/miniclip/NTP/NtpMessage;->encodeTimestamp([BID)V

    .line 43
    invoke-virtual {v12, v9}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 46
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v14, "NTP request sent, waiting for response...\n"

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 47
    new-instance v9, Ljava/net/DatagramPacket;

    .end local v9    # "packet":Ljava/net/DatagramPacket;
    array-length v13, v3

    invoke-direct {v9, v3, v13}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 48
    .restart local v9    # "packet":Ljava/net/DatagramPacket;
    invoke-virtual {v12, v9}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 51
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    long-to-double v13, v13

    const-wide v15, 0x408f400000000000L    # 1000.0

    div-double/2addr v13, v15

    const-wide v15, 0x41e0754fd0000000L    # 2.2089888E9

    add-double v4, v13, v15

    .line 55
    .local v4, "destinationTimestamp":D
    new-instance v8, Lcom/miniclip/NTP/NtpMessage;

    invoke-virtual {v9}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v13

    invoke-direct {v8, v13}, Lcom/miniclip/NTP/NtpMessage;-><init>([B)V

    .line 58
    .local v8, "msg":Lcom/miniclip/NTP/NtpMessage;
    iget-wide v13, v8, Lcom/miniclip/NTP/NtpMessage;->originateTimestamp:D

    sub-double v13, v4, v13

    iget-wide v15, v8, Lcom/miniclip/NTP/NtpMessage;->transmitTimestamp:D

    iget-wide v0, v8, Lcom/miniclip/NTP/NtpMessage;->receiveTimestamp:D

    move-wide/from16 v17, v0

    sub-double v15, v15, v17

    sub-double v10, v13, v15

    .line 61
    .local v10, "roundTripDelay":D
    iget-wide v13, v8, Lcom/miniclip/NTP/NtpMessage;->receiveTimestamp:D

    iget-wide v15, v8, Lcom/miniclip/NTP/NtpMessage;->originateTimestamp:D

    sub-double/2addr v13, v15

    iget-wide v15, v8, Lcom/miniclip/NTP/NtpMessage;->transmitTimestamp:D

    sub-double/2addr v15, v4

    add-double/2addr v13, v15

    const-wide/high16 v15, 0x4000000000000000L    # 2.0

    div-double v6, v13, v15

    .line 66
    .local v6, "localClockOffset":D
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "NTP server: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 67
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v8}, Lcom/miniclip/NTP/NtpMessage;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 69
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Dest. timestamp:     "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-static {v4, v5}, Lcom/miniclip/NTP/NtpMessage;->timestampToString(D)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 72
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Round-trip delay: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    new-instance v15, Ljava/text/DecimalFormat;

    const-string v16, "0.00"

    invoke-direct/range {v15 .. v16}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    const-wide v16, 0x408f400000000000L    # 1000.0

    mul-double v16, v16, v10

    invoke-virtual/range {v15 .. v17}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " ms"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 75
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Local clock offset: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    new-instance v15, Ljava/text/DecimalFormat;

    const-string v16, "0.00"

    invoke-direct/range {v15 .. v16}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    const-wide v16, 0x408f400000000000L    # 1000.0

    mul-double v16, v16, v6

    invoke-virtual/range {v15 .. v17}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " ms"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 79
    invoke-virtual {v12}, Ljava/net/DatagramSocket;->close()V

    .line 81
    return-wide v6
.end method

.method public getOffsetFromServerAsync(Ljava/lang/String;Lcom/miniclip/NTP/NtpHandler$NtpResponce;)V
    .locals 1
    .param p1, "serverName"    # Ljava/lang/String;
    .param p2, "onComplete"    # Lcom/miniclip/NTP/NtpHandler$NtpResponce;

    .prologue
    .line 85
    new-instance v0, Lcom/miniclip/NTP/NtpHandler$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/miniclip/NTP/NtpHandler$1;-><init>(Lcom/miniclip/NTP/NtpHandler;Ljava/lang/String;Lcom/miniclip/NTP/NtpHandler$NtpResponce;)V

    .line 98
    .local v0, "thread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 99
    return-void
.end method

.method public getOffsetFromServerListAsync(Ljava/lang/String;II)V
    .locals 6
    .param p1, "serverNames"    # Ljava/lang/String;
    .param p2, "callback"    # I
    .param p3, "timeout"    # I

    .prologue
    .line 102
    const-string v2, "NtpHandler"

    const-string v3, "getOffsetFromServerListAsync1"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    iget v2, p0, Lcom/miniclip/NTP/NtpHandler;->_status:I

    if-eqz v2, :cond_0

    .line 143
    :goto_0
    return-void

    .line 105
    :cond_0
    const/4 v2, 0x1

    iput v2, p0, Lcom/miniclip/NTP/NtpHandler;->_status:I

    .line 106
    const-string v2, ","

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 107
    .local v1, "serverNamesArray":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 109
    aget-object v2, v1, v0

    new-instance v3, Lcom/miniclip/NTP/NtpHandler$2;

    invoke-direct {v3, p0, p2}, Lcom/miniclip/NTP/NtpHandler$2;-><init>(Lcom/miniclip/NTP/NtpHandler;I)V

    invoke-virtual {p0, v2, v3}, Lcom/miniclip/NTP/NtpHandler;->getOffsetFromServerAsync(Ljava/lang/String;Lcom/miniclip/NTP/NtpHandler$NtpResponce;)V

    .line 107
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 128
    :cond_1
    iget-object v2, p0, Lcom/miniclip/NTP/NtpHandler;->_handler:Landroid/os/Handler;

    new-instance v3, Lcom/miniclip/NTP/NtpHandler$3;

    invoke-direct {v3, p0, p2}, Lcom/miniclip/NTP/NtpHandler$3;-><init>(Lcom/miniclip/NTP/NtpHandler;I)V

    int-to-long v4, p3

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
