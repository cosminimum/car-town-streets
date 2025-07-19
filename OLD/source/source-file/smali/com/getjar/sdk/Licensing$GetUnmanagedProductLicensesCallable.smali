.class Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;
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
    name = "GetUnmanagedProductLicensesCallable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/getjar/sdk/License;",
        ">;>;"
    }
.end annotation


# instance fields
.field private licensingListener:Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;

.field private theProductIds:[Ljava/lang/String;

.field final synthetic this$0:Lcom/getjar/sdk/Licensing;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/Licensing;[Ljava/lang/String;)V
    .locals 2
    .param p2, "theProductIds"    # [Ljava/lang/String;

    .prologue
    .line 347
    iput-object p1, p0, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;->this$0:Lcom/getjar/sdk/Licensing;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 337
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;->licensingListener:Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;

    .line 348
    if-eqz p2, :cond_0

    array-length v0, p2

    if-gtz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "theProductIds cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 350
    :cond_1
    iput-object p2, p0, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;->theProductIds:[Ljava/lang/String;

    .line 352
    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/Licensing;[Ljava/lang/String;Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;)V
    .locals 2
    .param p2, "theProductIds"    # [Ljava/lang/String;
    .param p3, "licensingListener"    # Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;

    .prologue
    .line 340
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;-><init>(Lcom/getjar/sdk/Licensing;[Ljava/lang/String;)V

    .line 342
    if-nez p3, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licensingListener cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 344
    :cond_0
    iput-object p3, p0, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;->licensingListener:Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;

    .line 345
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 334
    invoke-virtual {p0}, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;->call()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/License;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 357
    iget-object v4, p0, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;->this$0:Lcom/getjar/sdk/Licensing;

    invoke-static {v4}, Lcom/getjar/sdk/Licensing;->access$000(Lcom/getjar/sdk/Licensing;)Lcom/getjar/sdk/data/LicenseEngine;

    move-result-object v4

    iget-object v5, p0, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;->theProductIds:[Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/data/LicenseEngine;->getUnmanagedProductLicenses([Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 359
    .local v2, "internalLicenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 360
    .local v3, "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/License;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/data/LicenseInternal;

    .line 362
    .local v1, "internalLicense":Lcom/getjar/sdk/data/LicenseInternal;
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 365
    .end local v1    # "internalLicense":Lcom/getjar/sdk/data/LicenseInternal;
    :cond_0
    iget-object v4, p0, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;->licensingListener:Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;

    if-eqz v4, :cond_1

    .line 367
    sget-object v4, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "Licensing GetUnmanagedProductLicensesCallback sending callback"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 368
    iget-object v4, p0, Lcom/getjar/sdk/Licensing$GetUnmanagedProductLicensesCallable;->licensingListener:Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;

    invoke-interface {v4, v3}, Lcom/getjar/sdk/listener/GetUnmanagedProductLicensesListener;->getUnmanagedProductLicensesEvent(Ljava/util/List;)V

    .line 370
    :cond_1
    return-object v3
.end method
