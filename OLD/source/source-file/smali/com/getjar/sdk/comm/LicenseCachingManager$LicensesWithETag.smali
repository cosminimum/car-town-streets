.class public Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;
.super Ljava/lang/Object;
.source "LicenseCachingManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/LicenseCachingManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LicensesWithETag"
.end annotation


# instance fields
.field public final eTag:Ljava/lang/String;

.field public final licenses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/LicenseInternal;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/getjar/sdk/comm/LicenseCachingManager;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/comm/LicenseCachingManager;Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .param p3, "eTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/LicenseInternal;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 230
    .local p2, "licenses":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/LicenseInternal;>;"
    iput-object p1, p0, Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;->this$0:Lcom/getjar/sdk/comm/LicenseCachingManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 231
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;->licenses:Ljava/util/List;

    .line 232
    iput-object p3, p0, Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;->eTag:Ljava/lang/String;

    .line 233
    return-void
.end method
