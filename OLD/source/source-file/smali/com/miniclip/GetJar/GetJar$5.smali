.class final Lcom/miniclip/GetJar/GetJar$5;
.super Ljava/lang/Object;
.source "GetJar.java"

# interfaces
.implements Lcom/getjar/sdk/listener/EnsureUserAuthListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/GetJar/GetJar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public userAuthCompleted(Lcom/getjar/sdk/User;)V
    .locals 0
    .param p1, "user"    # Lcom/getjar/sdk/User;

    .prologue
    .line 290
    invoke-static {p1}, Lcom/miniclip/GetJar/GetJar;->access$402(Lcom/getjar/sdk/User;)Lcom/getjar/sdk/User;

    .line 291
    return-void
.end method
