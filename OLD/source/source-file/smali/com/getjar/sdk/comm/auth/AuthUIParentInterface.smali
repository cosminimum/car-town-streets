.class public interface abstract Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
.super Ljava/lang/Object;
.source "AuthUIParentInterface.java"


# virtual methods
.method public abstract getParentActivity()Landroid/app/Activity;
.end method

.method public abstract getTheTitle()Ljava/lang/String;
.end method

.method public abstract relinquishUI()V
.end method

.method public abstract takeoverUI(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/app/Dialog;",
            ">;)V"
        }
    .end annotation
.end method
