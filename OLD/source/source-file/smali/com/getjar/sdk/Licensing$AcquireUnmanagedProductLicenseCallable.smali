.class Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;
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
    name = "AcquireUnmanagedProductLicenseCallable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Lcom/getjar/sdk/License;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private licenseScope:Lcom/getjar/sdk/License$LicenseScope;

.field private licensingListener:Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;

.field private theProductId:Ljava/lang/String;

.field final synthetic this$0:Lcom/getjar/sdk/Licensing;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/Licensing;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)V
    .locals 2
    .param p2, "theProductId"    # Ljava/lang/String;
    .param p3, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;

    .prologue
    .line 272
    iput-object p1, p0, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->this$0:Lcom/getjar/sdk/Licensing;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 260
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->licensingListener:Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;

    .line 273
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "theProductId cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 274
    :cond_0
    if-nez p3, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licenseScope cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 276
    :cond_1
    iput-object p2, p0, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->theProductId:Ljava/lang/String;

    .line 277
    iput-object p3, p0, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    .line 279
    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/Licensing;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;)V
    .locals 2
    .param p2, "theProductId"    # Ljava/lang/String;
    .param p3, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .param p4, "licensingListener"    # Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;

    .prologue
    .line 265
    invoke-direct {p0, p1, p2, p3}, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;-><init>(Lcom/getjar/sdk/Licensing;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)V

    .line 267
    if-nez p4, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licensingListener cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 268
    :cond_0
    iput-object p4, p0, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->licensingListener:Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;

    .line 270
    return-void
.end method


# virtual methods
.method public call()Lcom/getjar/sdk/License;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 283
    iget-object v1, p0, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->this$0:Lcom/getjar/sdk/Licensing;

    invoke-static {v1}, Lcom/getjar/sdk/Licensing;->access$000(Lcom/getjar/sdk/Licensing;)Lcom/getjar/sdk/data/LicenseEngine;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->theProductId:Ljava/lang/String;

    iget-object v3, p0, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    invoke-virtual {v1, v2, v3}, Lcom/getjar/sdk/data/LicenseEngine;->acquireUnmanagedProductLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/data/LicenseInternal;

    move-result-object v0

    .line 284
    .local v0, "license":Lcom/getjar/sdk/License;
    iget-object v1, p0, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->licensingListener:Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;

    if-eqz v1, :cond_0

    .line 286
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Licensing AcquireUnmanagedProductLicenseCallback sending callback for %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->theProductId:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 287
    iget-object v1, p0, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->licensingListener:Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;

    invoke-interface {v1, v0}, Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;->acquireUnmanagedProductLicenseEvent(Lcom/getjar/sdk/License;)V

    .line 289
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
    .line 257
    invoke-virtual {p0}, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;->call()Lcom/getjar/sdk/License;

    move-result-object v0

    return-object v0
.end method
