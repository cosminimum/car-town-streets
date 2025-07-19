.class final Lcom/miniclip/GooglePlayServices/GooglePlayServices$6;
.super Ljava/lang/Object;
.source "GooglePlayServices.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/GooglePlayServices/GooglePlayServices;->GPM_invite()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 921
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 923
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->gPlay:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    invoke-virtual {v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->signOut()V

    .line 924
    return-void
.end method
