.class public Lcom/miniclip/NTP/NtpMessage;
.super Ljava/lang/Object;
.source "NtpMessage.java"


# instance fields
.field public leapIndicator:B

.field public mode:B

.field public originateTimestamp:D

.field public pollInterval:B

.field public precision:B

.field public receiveTimestamp:D

.field public referenceIdentifier:[B

.field public referenceTimestamp:D

.field public rootDelay:D

.field public rootDispersion:D

.field public stratum:S

.field public transmitTimestamp:D

.field public version:B


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-byte v0, p0, Lcom/miniclip/NTP/NtpMessage;->leapIndicator:B

    .line 68
    iput-byte v3, p0, Lcom/miniclip/NTP/NtpMessage;->version:B

    .line 89
    iput-byte v0, p0, Lcom/miniclip/NTP/NtpMessage;->mode:B

    .line 103
    iput-short v0, p0, Lcom/miniclip/NTP/NtpMessage;->stratum:S

    .line 112
    iput-byte v0, p0, Lcom/miniclip/NTP/NtpMessage;->pollInterval:B

    .line 121
    iput-byte v0, p0, Lcom/miniclip/NTP/NtpMessage;->precision:B

    .line 132
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->rootDelay:D

    .line 140
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->rootDispersion:D

    .line 177
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifier:[B

    .line 184
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->referenceTimestamp:D

    .line 191
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->originateTimestamp:D

    .line 198
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->receiveTimestamp:D

    .line 205
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->transmitTimestamp:D

    .line 253
    iput-byte v3, p0, Lcom/miniclip/NTP/NtpMessage;->mode:B

    .line 254
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-double v0, v0

    const-wide v2, 0x408f400000000000L    # 1000.0

    div-double/2addr v0, v2

    const-wide v2, 0x41e0754fd0000000L    # 2.2089888E9

    add-double/2addr v0, v2

    iput-wide v0, p0, Lcom/miniclip/NTP/NtpMessage;->transmitTimestamp:D

    .line 255
    return-void

    .line 177
    nop

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>([B)V
    .locals 10
    .param p1, "array"    # [B

    .prologue
    const-wide/high16 v8, 0x40f0000000000000L    # 65536.0

    const/4 v7, 0x3

    const-wide/high16 v5, 0x4070000000000000L    # 256.0

    const-wide/16 v1, 0x0

    const/4 v4, 0x0

    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-byte v4, p0, Lcom/miniclip/NTP/NtpMessage;->leapIndicator:B

    .line 68
    iput-byte v7, p0, Lcom/miniclip/NTP/NtpMessage;->version:B

    .line 89
    iput-byte v4, p0, Lcom/miniclip/NTP/NtpMessage;->mode:B

    .line 103
    iput-short v4, p0, Lcom/miniclip/NTP/NtpMessage;->stratum:S

    .line 112
    iput-byte v4, p0, Lcom/miniclip/NTP/NtpMessage;->pollInterval:B

    .line 121
    iput-byte v4, p0, Lcom/miniclip/NTP/NtpMessage;->precision:B

    .line 132
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->rootDelay:D

    .line 140
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->rootDispersion:D

    .line 177
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifier:[B

    .line 184
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->referenceTimestamp:D

    .line 191
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->originateTimestamp:D

    .line 198
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->receiveTimestamp:D

    .line 205
    iput-wide v1, p0, Lcom/miniclip/NTP/NtpMessage;->transmitTimestamp:D

    .line 215
    aget-byte v0, p1, v4

    shr-int/lit8 v0, v0, 0x6

    and-int/lit8 v0, v0, 0x3

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/miniclip/NTP/NtpMessage;->leapIndicator:B

    .line 216
    aget-byte v0, p1, v4

    shr-int/lit8 v0, v0, 0x3

    and-int/lit8 v0, v0, 0x7

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/miniclip/NTP/NtpMessage;->version:B

    .line 217
    aget-byte v0, p1, v4

    and-int/lit8 v0, v0, 0x7

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/miniclip/NTP/NtpMessage;->mode:B

    .line 218
    const/4 v0, 0x1

    aget-byte v0, p1, v0

    invoke-static {v0}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v0

    iput-short v0, p0, Lcom/miniclip/NTP/NtpMessage;->stratum:S

    .line 219
    const/4 v0, 0x2

    aget-byte v0, p1, v0

    iput-byte v0, p0, Lcom/miniclip/NTP/NtpMessage;->pollInterval:B

    .line 220
    aget-byte v0, p1, v7

    iput-byte v0, p0, Lcom/miniclip/NTP/NtpMessage;->precision:B

    .line 222
    const/4 v0, 0x4

    aget-byte v0, p1, v0

    int-to-double v0, v0

    mul-double/2addr v0, v5

    const/4 v2, 0x5

    aget-byte v2, p1, v2

    invoke-static {v2}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v2

    int-to-double v2, v2

    add-double/2addr v0, v2

    const/4 v2, 0x6

    aget-byte v2, p1, v2

    invoke-static {v2}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v2

    int-to-double v2, v2

    div-double/2addr v2, v5

    add-double/2addr v0, v2

    const/4 v2, 0x7

    aget-byte v2, p1, v2

    invoke-static {v2}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v2

    int-to-double v2, v2

    div-double/2addr v2, v8

    add-double/2addr v0, v2

    iput-wide v0, p0, Lcom/miniclip/NTP/NtpMessage;->rootDelay:D

    .line 227
    const/16 v0, 0x8

    aget-byte v0, p1, v0

    invoke-static {v0}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v0

    int-to-double v0, v0

    mul-double/2addr v0, v5

    const/16 v2, 0x9

    aget-byte v2, p1, v2

    invoke-static {v2}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v2

    int-to-double v2, v2

    add-double/2addr v0, v2

    const/16 v2, 0xa

    aget-byte v2, p1, v2

    invoke-static {v2}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v2

    int-to-double v2, v2

    div-double/2addr v2, v5

    add-double/2addr v0, v2

    const/16 v2, 0xb

    aget-byte v2, p1, v2

    invoke-static {v2}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v2

    int-to-double v2, v2

    div-double/2addr v2, v8

    add-double/2addr v0, v2

    iput-wide v0, p0, Lcom/miniclip/NTP/NtpMessage;->rootDispersion:D

    .line 232
    iget-object v0, p0, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifier:[B

    const/16 v1, 0xc

    aget-byte v1, p1, v1

    aput-byte v1, v0, v4

    .line 233
    iget-object v0, p0, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifier:[B

    const/4 v1, 0x1

    const/16 v2, 0xd

    aget-byte v2, p1, v2

    aput-byte v2, v0, v1

    .line 234
    iget-object v0, p0, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifier:[B

    const/4 v1, 0x2

    const/16 v2, 0xe

    aget-byte v2, p1, v2

    aput-byte v2, v0, v1

    .line 235
    iget-object v0, p0, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifier:[B

    const/16 v1, 0xf

    aget-byte v1, p1, v1

    aput-byte v1, v0, v7

    .line 237
    const/16 v0, 0x10

    invoke-static {p1, v0}, Lcom/miniclip/NTP/NtpMessage;->decodeTimestamp([BI)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miniclip/NTP/NtpMessage;->referenceTimestamp:D

    .line 238
    const/16 v0, 0x18

    invoke-static {p1, v0}, Lcom/miniclip/NTP/NtpMessage;->decodeTimestamp([BI)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miniclip/NTP/NtpMessage;->originateTimestamp:D

    .line 239
    const/16 v0, 0x20

    invoke-static {p1, v0}, Lcom/miniclip/NTP/NtpMessage;->decodeTimestamp([BI)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miniclip/NTP/NtpMessage;->receiveTimestamp:D

    .line 240
    const/16 v0, 0x28

    invoke-static {p1, v0}, Lcom/miniclip/NTP/NtpMessage;->decodeTimestamp([BI)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miniclip/NTP/NtpMessage;->transmitTimestamp:D

    .line 241
    return-void

    .line 177
    nop

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public static decodeTimestamp([BI)D
    .locals 9
    .param p0, "array"    # [B
    .param p1, "pointer"    # I

    .prologue
    .line 346
    const-wide/16 v1, 0x0

    .line 348
    .local v1, "r":D
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v3, 0x8

    if-ge v0, v3, :cond_0

    .line 350
    add-int v3, p1, v0

    aget-byte v3, p0, v3

    invoke-static {v3}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v3

    int-to-double v3, v3

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    rsub-int/lit8 v7, v0, 0x3

    mul-int/lit8 v7, v7, 0x8

    int-to-double v7, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    mul-double/2addr v3, v5

    add-double/2addr v1, v3

    .line 348
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 353
    :cond_0
    return-wide v1
.end method

.method public static encodeTimestamp([BID)V
    .locals 8
    .param p0, "array"    # [B
    .param p1, "pointer"    # I
    .param p2, "timestamp"    # D

    .prologue
    .line 364
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/16 v3, 0x8

    if-ge v2, v3, :cond_0

    .line 367
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    rsub-int/lit8 v5, v2, 0x3

    mul-int/lit8 v5, v5, 0x8

    int-to-double v5, v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    .line 370
    .local v0, "base":D
    add-int v3, p1, v2

    div-double v4, p2, v0

    double-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p0, v3

    .line 373
    add-int v3, p1, v2

    aget-byte v3, p0, v3

    invoke-static {v3}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v3

    int-to-double v3, v3

    mul-double/2addr v3, v0

    sub-double/2addr p2, v3

    .line 364
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 380
    .end local v0    # "base":D
    :cond_0
    const/4 v3, 0x7

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v4

    const-wide v6, 0x406fe00000000000L    # 255.0

    mul-double/2addr v4, v6

    double-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p0, v3

    .line 381
    return-void
.end method

.method public static referenceIdentifierToString([BSB)Ljava/lang/String;
    .locals 9
    .param p0, "ref"    # [B
    .param p1, "stratum"    # S
    .param p2, "version"    # B

    .prologue
    const/4 v8, 0x2

    const/4 v2, 0x0

    const/4 v7, 0x3

    const/4 v5, 0x1

    .line 422
    if-eqz p1, :cond_0

    if-ne p1, v5, :cond_1

    .line 424
    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    .line 447
    :goto_0
    return-object v0

    .line 429
    :cond_1
    if-ne p2, v7, :cond_2

    .line 431
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    aget-byte v1, p0, v2

    invoke-static {v1}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-byte v1, p0, v5

    invoke-static {v1}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-byte v1, p0, v8

    invoke-static {v1}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-byte v1, p0, v7

    invoke-static {v1}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 439
    :cond_2
    const/4 v0, 0x4

    if-ne p2, v0, :cond_3

    .line 441
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget-byte v1, p0, v2

    invoke-static {v1}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v1

    int-to-double v1, v1

    const-wide/high16 v3, 0x4070000000000000L    # 256.0

    div-double/2addr v1, v3

    aget-byte v3, p0, v5

    invoke-static {v3}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v3

    int-to-double v3, v3

    const-wide/high16 v5, 0x40f0000000000000L    # 65536.0

    div-double/2addr v3, v5

    add-double/2addr v1, v3

    aget-byte v3, p0, v8

    invoke-static {v3}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v3

    int-to-double v3, v3

    const-wide/high16 v5, 0x4170000000000000L    # 1.6777216E7

    div-double/2addr v3, v5

    add-double/2addr v1, v3

    aget-byte v3, p0, v7

    invoke-static {v3}, Lcom/miniclip/NTP/NtpMessage;->unsignedByteToShort(B)S

    move-result v3

    int-to-double v3, v3

    const-wide/high16 v5, 0x41f0000000000000L    # 4.294967296E9

    div-double/2addr v3, v5

    add-double/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 447
    :cond_3
    const-string v0, ""

    goto/16 :goto_0
.end method

.method public static timestampToString(D)Ljava/lang/String;
    .locals 10
    .param p0, "timestamp"    # D

    .prologue
    .line 391
    const-wide/16 v8, 0x0

    cmpl-double v8, p0, v8

    if-nez v8, :cond_0

    const-string v8, "0"

    .line 407
    :goto_0
    return-object v8

    .line 395
    :cond_0
    const-wide v8, 0x41e0754fd0000000L    # 2.2089888E9

    sub-double v6, p0, v8

    .line 398
    .local v6, "utc":D
    const-wide v8, 0x408f400000000000L    # 1000.0

    mul-double/2addr v8, v6

    double-to-long v4, v8

    .line 401
    .local v4, "ms":J
    new-instance v8, Ljava/text/SimpleDateFormat;

    const-string v9, "dd-MMM-yyyy HH:mm:ss"

    invoke-direct {v8, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v9, Ljava/util/Date;

    invoke-direct {v9, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v8, v9}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 404
    .local v0, "date":Ljava/lang/String;
    double-to-long v8, p0

    long-to-double v8, v8

    sub-double v1, p0, v8

    .line 405
    .local v1, "fraction":D
    new-instance v8, Ljava/text/DecimalFormat;

    const-string v9, ".000000"

    invoke-direct {v8, v9}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1, v2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    .line 407
    .local v3, "fractionSting":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_0
.end method

.method public static unsignedByteToShort(B)S
    .locals 2
    .param p0, "b"    # B

    .prologue
    .line 333
    and-int/lit16 v0, p0, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_0

    and-int/lit8 v0, p0, 0x7f

    add-int/lit16 v0, v0, 0x80

    int-to-short v0, v0

    .line 334
    :goto_0
    return v0

    :cond_0
    int-to-short v0, p0

    goto :goto_0
.end method


# virtual methods
.method public toByteArray()[B
    .locals 14

    .prologue
    const/4 v13, 0x2

    const/4 v12, 0x1

    const/4 v11, 0x0

    const-wide/high16 v9, 0x40f0000000000000L    # 65536.0

    const-wide/16 v7, 0xff

    .line 265
    const/16 v4, 0x30

    new-array v1, v4, [B

    .line 267
    .local v1, "p":[B
    iget-byte v4, p0, Lcom/miniclip/NTP/NtpMessage;->leapIndicator:B

    shl-int/lit8 v4, v4, 0x6

    iget-byte v5, p0, Lcom/miniclip/NTP/NtpMessage;->version:B

    shl-int/lit8 v5, v5, 0x3

    or-int/2addr v4, v5

    iget-byte v5, p0, Lcom/miniclip/NTP/NtpMessage;->mode:B

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v1, v11

    .line 268
    iget-short v4, p0, Lcom/miniclip/NTP/NtpMessage;->stratum:S

    int-to-byte v4, v4

    aput-byte v4, v1, v12

    .line 269
    iget-byte v4, p0, Lcom/miniclip/NTP/NtpMessage;->pollInterval:B

    aput-byte v4, v1, v13

    .line 270
    const/4 v4, 0x3

    iget-byte v5, p0, Lcom/miniclip/NTP/NtpMessage;->precision:B

    aput-byte v5, v1, v4

    .line 273
    iget-wide v4, p0, Lcom/miniclip/NTP/NtpMessage;->rootDelay:D

    mul-double/2addr v4, v9

    double-to-int v0, v4

    .line 274
    .local v0, "l":I
    const/4 v4, 0x4

    shr-int/lit8 v5, v0, 0x18

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 275
    const/4 v4, 0x5

    shr-int/lit8 v5, v0, 0x10

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 276
    const/4 v4, 0x6

    shr-int/lit8 v5, v0, 0x8

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 277
    const/4 v4, 0x7

    and-int/lit16 v5, v0, 0xff

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 281
    iget-wide v4, p0, Lcom/miniclip/NTP/NtpMessage;->rootDispersion:D

    mul-double/2addr v4, v9

    double-to-long v2, v4

    .line 282
    .local v2, "ul":J
    const/16 v4, 0x8

    const/16 v5, 0x18

    shr-long v5, v2, v5

    and-long/2addr v5, v7

    long-to-int v5, v5

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 283
    const/16 v4, 0x9

    const/16 v5, 0x10

    shr-long v5, v2, v5

    and-long/2addr v5, v7

    long-to-int v5, v5

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 284
    const/16 v4, 0xa

    const/16 v5, 0x8

    shr-long v5, v2, v5

    and-long/2addr v5, v7

    long-to-int v5, v5

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 285
    const/16 v4, 0xb

    and-long v5, v2, v7

    long-to-int v5, v5

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 287
    const/16 v4, 0xc

    iget-object v5, p0, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifier:[B

    aget-byte v5, v5, v11

    aput-byte v5, v1, v4

    .line 288
    const/16 v4, 0xd

    iget-object v5, p0, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifier:[B

    aget-byte v5, v5, v12

    aput-byte v5, v1, v4

    .line 289
    const/16 v4, 0xe

    iget-object v5, p0, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifier:[B

    aget-byte v5, v5, v13

    aput-byte v5, v1, v4

    .line 290
    const/16 v4, 0xf

    iget-object v5, p0, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifier:[B

    const/4 v6, 0x3

    aget-byte v5, v5, v6

    aput-byte v5, v1, v4

    .line 292
    const/16 v4, 0x10

    iget-wide v5, p0, Lcom/miniclip/NTP/NtpMessage;->referenceTimestamp:D

    invoke-static {v1, v4, v5, v6}, Lcom/miniclip/NTP/NtpMessage;->encodeTimestamp([BID)V

    .line 293
    const/16 v4, 0x18

    iget-wide v5, p0, Lcom/miniclip/NTP/NtpMessage;->originateTimestamp:D

    invoke-static {v1, v4, v5, v6}, Lcom/miniclip/NTP/NtpMessage;->encodeTimestamp([BID)V

    .line 294
    const/16 v4, 0x20

    iget-wide v5, p0, Lcom/miniclip/NTP/NtpMessage;->receiveTimestamp:D

    invoke-static {v1, v4, v5, v6}, Lcom/miniclip/NTP/NtpMessage;->encodeTimestamp([BID)V

    .line 295
    const/16 v4, 0x28

    iget-wide v5, p0, Lcom/miniclip/NTP/NtpMessage;->transmitTimestamp:D

    invoke-static {v1, v4, v5, v6}, Lcom/miniclip/NTP/NtpMessage;->encodeTimestamp([BID)V

    .line 297
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .prologue
    const-wide v6, 0x408f400000000000L    # 1000.0

    .line 307
    new-instance v1, Ljava/text/DecimalFormat;

    const-string v2, "0.#E0"

    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    iget-byte v4, p0, Lcom/miniclip/NTP/NtpMessage;->precision:B

    int-to-double v4, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    .line 310
    .local v0, "precisionStr":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Leap indicator: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-byte v2, p0, Lcom/miniclip/NTP/NtpMessage;->leapIndicator:B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-byte v2, p0, Lcom/miniclip/NTP/NtpMessage;->version:B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Mode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-byte v2, p0, Lcom/miniclip/NTP/NtpMessage;->mode:B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Stratum: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-short v2, p0, Lcom/miniclip/NTP/NtpMessage;->stratum:S

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Poll: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-byte v2, p0, Lcom/miniclip/NTP/NtpMessage;->pollInterval:B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Precision: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-byte v2, p0, Lcom/miniclip/NTP/NtpMessage;->precision:B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " seconds)\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Root delay: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/text/DecimalFormat;

    const-string v3, "0.00"

    invoke-direct {v2, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v3, p0, Lcom/miniclip/NTP/NtpMessage;->rootDelay:D

    mul-double/2addr v3, v6

    invoke-virtual {v2, v3, v4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ms\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Root dispersion: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/text/DecimalFormat;

    const-string v3, "0.00"

    invoke-direct {v2, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v3, p0, Lcom/miniclip/NTP/NtpMessage;->rootDispersion:D

    mul-double/2addr v3, v6

    invoke-virtual {v2, v3, v4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ms\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Reference identifier: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifier:[B

    iget-short v3, p0, Lcom/miniclip/NTP/NtpMessage;->stratum:S

    iget-byte v4, p0, Lcom/miniclip/NTP/NtpMessage;->version:B

    invoke-static {v2, v3, v4}, Lcom/miniclip/NTP/NtpMessage;->referenceIdentifierToString([BSB)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Reference timestamp: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/miniclip/NTP/NtpMessage;->referenceTimestamp:D

    invoke-static {v2, v3}, Lcom/miniclip/NTP/NtpMessage;->timestampToString(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Originate timestamp: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/miniclip/NTP/NtpMessage;->originateTimestamp:D

    invoke-static {v2, v3}, Lcom/miniclip/NTP/NtpMessage;->timestampToString(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Receive timestamp:   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/miniclip/NTP/NtpMessage;->receiveTimestamp:D

    invoke-static {v2, v3}, Lcom/miniclip/NTP/NtpMessage;->timestampToString(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Transmit timestamp:  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/miniclip/NTP/NtpMessage;->transmitTimestamp:D

    invoke-static {v2, v3}, Lcom/miniclip/NTP/NtpMessage;->timestampToString(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
