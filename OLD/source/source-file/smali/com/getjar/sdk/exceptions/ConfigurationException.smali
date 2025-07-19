.class public Lcom/getjar/sdk/exceptions/ConfigurationException;
.super Lcom/getjar/sdk/GetJarException;
.source "ConfigurationException.java"


# static fields
.field private static final serialVersionUID:J = 0x46e65b05f23a96c5L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/getjar/sdk/GetJarException;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/Throwable;)V

    return-void
.end method
