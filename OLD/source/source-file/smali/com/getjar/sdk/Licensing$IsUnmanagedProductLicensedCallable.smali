.class Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;
.super Ljava/lang/Object;
.source "Licensing.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/Licensing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IsUnmanagedProductLicensedCallable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private licensingListener:Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;

.field private theProductId:Ljava/lang/String;

.field final synthetic this$0:Lcom/getjar/sdk/Licensing;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/Licensing;Ljava/lang/String;)V
    .locals 2
    .param p2, "theProductId"    # Ljava/lang/String;

    .prologue
    .line 310
    iput-object p1, p0, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;->this$0:Lcom/getjar/sdk/Licensing;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 300
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;->licensingListener:Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;

    .line 312
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "theProductId cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 314
    :cond_0
    iput-object p2, p0, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;->theProductId:Ljava/lang/String;

    .line 316
    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/Licensing;Ljava/lang/String;Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;)V
    .locals 2
    .param p2, "theProductId"    # Ljava/lang/String;
    .param p3, "licensingListener"    # Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;

    .prologue
    .line 303
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;-><init>(Lcom/getjar/sdk/Licensing;Ljava/lang/String;)V

    .line 305
    if-nez p3, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licensingListener cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 307
    :cond_0
    iput-object p3, p0, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;->licensingListener:Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;

    .line 308
    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Boolean;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 320
    iget-object v1, p0, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;->this$0:Lcom/getjar/sdk/Licensing;

    invoke-static {v1}, Lcom/getjar/sdk/Licensing;->access$000(Lcom/getjar/sdk/Licensing;)Lcom/getjar/sdk/data/LicenseEngine;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;->theProductId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/data/LicenseEngine;->isUnmanagedProductLicensed(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 321
    .local v0, "isLicensed":Ljava/lang/Boolean;
    iget-object v1, p0, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;->licensingListener:Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;

    if-eqz v1, :cond_0

    .line 323
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Licensing IsUnmanagedProductLicensedCallback sending callback for %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;->theProductId:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 324
    iget-object v1, p0, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;->licensingListener:Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;

    iget-object v2, p0, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;->theProductId:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;->isUnmanagedProductLicensedEvent(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 326
    :cond_0
    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 297
    invoke-virtual {p0}, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;->call()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
