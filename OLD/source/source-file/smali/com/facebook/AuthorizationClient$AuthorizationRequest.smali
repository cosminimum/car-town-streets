.class Lcom/facebook/AuthorizationClient$AuthorizationRequest;
.super Ljava/lang/Object;
.source "AuthorizationClient.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AuthorizationClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AuthorizationRequest"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private applicationId:Ljava/lang/String;

.field private defaultAudience:Lcom/facebook/SessionDefaultAudience;

.field private isLegacy:Z

.field private loginBehavior:Lcom/facebook/SessionLoginBehavior;

.field private permissions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private previousAccessToken:Ljava/lang/String;

.field private requestCode:I

.field private final transient startActivityDelegate:Lcom/facebook/AuthorizationClient$StartActivityDelegate;


# direct methods
.method constructor <init>(Lcom/facebook/SessionLoginBehavior;IZLjava/util/List;Lcom/facebook/SessionDefaultAudience;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/AuthorizationClient$StartActivityDelegate;)V
    .locals 1
    .param p1, "loginBehavior"    # Lcom/facebook/SessionLoginBehavior;
    .param p2, "requestCode"    # I
    .param p3, "isLegacy"    # Z
    .param p5, "defaultAudience"    # Lcom/facebook/SessionDefaultAudience;
    .param p6, "applicationId"    # Ljava/lang/String;
    .param p7, "validateSameFbidAsToken"    # Ljava/lang/String;
    .param p8, "startActivityDelegate"    # Lcom/facebook/AuthorizationClient$StartActivityDelegate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/SessionLoginBehavior;",
            "IZ",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/facebook/SessionDefaultAudience;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/facebook/AuthorizationClient$StartActivityDelegate;",
            ")V"
        }
    .end annotation

    .prologue
    .line 713
    .local p4, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 705
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isLegacy:Z

    .line 714
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->loginBehavior:Lcom/facebook/SessionLoginBehavior;

    .line 715
    iput p2, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->requestCode:I

    .line 716
    iput-boolean p3, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isLegacy:Z

    .line 717
    iput-object p4, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->permissions:Ljava/util/List;

    .line 718
    iput-object p5, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->defaultAudience:Lcom/facebook/SessionDefaultAudience;

    .line 719
    iput-object p6, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->applicationId:Ljava/lang/String;

    .line 720
    iput-object p7, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->previousAccessToken:Ljava/lang/String;

    .line 721
    iput-object p8, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->startActivityDelegate:Lcom/facebook/AuthorizationClient$StartActivityDelegate;

    .line 723
    return-void
.end method


# virtual methods
.method getApplicationId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 750
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->applicationId:Ljava/lang/String;

    return-object v0
.end method

.method getDefaultAudience()Lcom/facebook/SessionDefaultAudience;
    .locals 1

    .prologue
    .line 746
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->defaultAudience:Lcom/facebook/SessionDefaultAudience;

    return-object v0
.end method

.method getLoginBehavior()Lcom/facebook/SessionLoginBehavior;
    .locals 1

    .prologue
    .line 738
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->loginBehavior:Lcom/facebook/SessionLoginBehavior;

    return-object v0
.end method

.method getPermissions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 730
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->permissions:Ljava/util/List;

    return-object v0
.end method

.method getPreviousAccessToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 762
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->previousAccessToken:Ljava/lang/String;

    return-object v0
.end method

.method getRequestCode()I
    .locals 1

    .prologue
    .line 742
    iget v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->requestCode:I

    return v0
.end method

.method getStartActivityDelegate()Lcom/facebook/AuthorizationClient$StartActivityDelegate;
    .locals 1

    .prologue
    .line 726
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->startActivityDelegate:Lcom/facebook/AuthorizationClient$StartActivityDelegate;

    return-object v0
.end method

.method isLegacy()Z
    .locals 1

    .prologue
    .line 754
    iget-boolean v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isLegacy:Z

    return v0
.end method

.method needsNewTokenValidation()Z
    .locals 1

    .prologue
    .line 766
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->previousAccessToken:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isLegacy:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method setIsLegacy(Z)V
    .locals 0
    .param p1, "isLegacy"    # Z

    .prologue
    .line 758
    iput-boolean p1, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isLegacy:Z

    .line 759
    return-void
.end method

.method setPermissions(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 734
    .local p1, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->permissions:Ljava/util/List;

    .line 735
    return-void
.end method
