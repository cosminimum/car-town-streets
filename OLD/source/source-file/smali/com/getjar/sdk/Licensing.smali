.class public Lcom/getjar/sdk/Licensing;
.super Ljava/lang/Object;
.source "Licensing.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;,
        Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;,
        Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;
    }
.end annotation


# static fields
.field private static final _ExecutorService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private mLicenseEngine:Lcom/getjar/sdk/data/LicenseEngine;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/Licensing;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/GetJarContext;)V
    .locals 2
    .param p1, "getJarContext"    # Lcom/getjar/sdk/GetJarContext;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/Licensing;->mLicenseEngine:Lcom/getjar/sdk/data/LicenseEngine;

    .line 38
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'getJarContext\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_0
    new-instance v0, Lcom/getjar/sdk/data/LicenseEngine;

    invoke-virtual {p1}, Lcom/getjar/sdk/GetJarContext;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/getjar/sdk/data/LicenseEngine;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    iput-object v0, p0, Lcom/getjar/sdk/Licensing;->mLicenseEngine:Lcom/getjar/sdk/data/LicenseEngine;

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/getjar/sdk/Licensing;)Lcom/getjar/sdk/data/LicenseEngine;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/Licensing;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/getjar/sdk/Licensing;->mLicenseEngine:Lcom/getjar/sdk/data/LicenseEngine;

    return-object v0
.end method


# virtual methods
.method public acquireUnmanagedProductLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/License;
    .locals 4
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 62
    sget-object v0, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Licensing acquireUnmanagedProductLicense started"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 65
    invoke-virtual {p0, p1, p2}, Lcom/getjar/sdk/Licensing;->acquireUnmanagedProductLicenseAsync(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Ljava/util/concurrent/Future;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/License;

    return-object v0
.end method

.method public acquireUnmanagedProductLicenseAsync(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Ljava/util/concurrent/Future;
    .locals 8
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/License$LicenseScope;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/getjar/sdk/License;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 85
    invoke-static {p1}, Lcom/getjar/sdk/Product;->validateProductId(Ljava/lang/String;)V

    .line 86
    if-nez p2, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "licenseScope cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 88
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Licensing acquireUnmanagedProductLicenseAsync(%s,%s) started"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    invoke-virtual {p2}, Lcom/getjar/sdk/License$LicenseScope;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 90
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;

    invoke-direct {v1, p0, p1, p2}, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;-><init>(Lcom/getjar/sdk/Licensing;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 92
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/License;>;"
    sget-object v1, Lcom/getjar/sdk/Licensing;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 93
    return-object v0
.end method

.method public acquireUnmanagedProductLicenseAsync(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;)Ljava/util/concurrent/Future;
    .locals 8
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .param p3, "licensingListener"    # Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/License$LicenseScope;",
            "Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/getjar/sdk/License;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 112
    invoke-static {p1}, Lcom/getjar/sdk/Product;->validateProductId(Ljava/lang/String;)V

    .line 113
    if-nez p2, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "licenseScope cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 114
    :cond_0
    if-nez p3, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "licensingListener cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 116
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Licensing acquireUnmanagedProductLicenseAsync(%s,%s,licensingListener) started"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    invoke-virtual {p2}, Lcom/getjar/sdk/License$LicenseScope;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 118
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/getjar/sdk/Licensing$AcquireUnmanagedProductLicenseCallable;-><init>(Lcom/getjar/sdk/Licensing;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Lcom/getjar/sdk/listener/AcquireUnmanagedProductLicenseListener;)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 120
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Lcom/getjar/sdk/License;>;"
    sget-object v1, Lcom/getjar/sdk/Licensing;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 121
    return-object v0
.end method

.method public getUnmanagedProductLicenses([Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 4
    .param p1, "theProductIds"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/License;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 200
    sget-object v0, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Licensing getUnmanagedProductLicenses(theProductIds) started"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 203
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/Licensing;->getUnmanagedProductLicensesAsync([Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    return-object v0
.end method

.method public getUnmanagedProductLicensesAsync([Ljava/lang/String;)Ljava/util/concurrent/Future;
    .locals 5
    .param p1, "theProductIds"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/License;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 216
    if-eqz p1, :cond_0

    array-length v1, p1

    if-gtz v1, :cond_1

    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "theProductIds cannot be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 218
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Licensing getUnmanagedProductLicensesAsync(theProductIds) started"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 220
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;

    invoke-direct {v1, p0, p1}, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;-><init>(Lcom/getjar/sdk/Licensing;[Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 223
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Ljava/util/ArrayList<Lcom/getjar/sdk/License;>;>;"
    sget-object v1, Lcom/getjar/sdk/Licensing;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 224
    return-object v0
.end method

.method public getUnmanagedProductLicensesAsync([Ljava/lang/String;Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;)Ljava/util/concurrent/Future;
    .locals 5
    .param p1, "theProductIds"    # [Ljava/lang/String;
    .param p2, "licensingListener"    # Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/License;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 239
    if-eqz p1, :cond_0

    array-length v1, p1

    if-gtz v1, :cond_1

    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "theProductIds cannot be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 240
    :cond_1
    if-nez p2, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "licensingListener cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 242
    :cond_2
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "Licensing getUnmanagedProductLicensesAsync(theProductIds, licensingListener) started"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 244
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;

    invoke-direct {v1, p0, p1, p2}, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;-><init>(Lcom/getjar/sdk/Licensing;[Ljava/lang/String;Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 246
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Ljava/util/ArrayList<Lcom/getjar/sdk/License;>;>;"
    sget-object v1, Lcom/getjar/sdk/Licensing;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 247
    return-object v0
.end method

.method public isUnmanagedProductLicensed(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 4
    .param p1, "theProductId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 138
    sget-object v0, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "Licensing isUnmanagedProductLicensed started"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 141
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/Licensing;->isUnmanagedProductLicensedAsync(Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    return-object v0
.end method

.method public isUnmanagedProductLicensedAsync(Ljava/lang/String;)Ljava/util/concurrent/Future;
    .locals 7
    .param p1, "theProductId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 177
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'theProductId\' cannot be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 178
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Licensing isUnmanagedProductLicensedAsync(%s) started"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 180
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;

    invoke-direct {v1, p0, p1}, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;-><init>(Lcom/getjar/sdk/Licensing;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 182
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Ljava/lang/Boolean;>;"
    sget-object v1, Lcom/getjar/sdk/Licensing;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 183
    return-object v0
.end method

.method public isUnmanagedProductLicensedAsync(Ljava/lang/String;Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;)Ljava/util/concurrent/Future;
    .locals 7
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "licensingListener"    # Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 155
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'theProductId\' cannot be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 156
    :cond_0
    if-nez p2, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "licensingListener cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 158
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Licensing isUnmanagedProductLicensedAsync(%s, licensingListener) started"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 160
    new-instance v0, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;

    new-instance v1, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;

    invoke-direct {v1, p0, p1, p2}, Lcom/getjar/sdk/Licensing$IsUnmanagedProductLicensedCallable;-><init>(Lcom/getjar/sdk/Licensing;Ljava/lang/String;Lcom/getjar/sdk/listener/IsUnmanagedProductLicensedListener;)V

    invoke-direct {v0, v1}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 163
    .local v0, "future":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<Ljava/lang/Boolean;>;"
    sget-object v1, Lcom/getjar/sdk/Licensing;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 164
    return-object v0
.end method
