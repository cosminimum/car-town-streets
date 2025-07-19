.class public interface abstract Lcom/getjar/sdk/listener/VoucherRedemptionListener;
.super Ljava/lang/Object;
.source "VoucherRedemptionListener.java"

# interfaces
.implements Lcom/getjar/sdk/listener/GetJarListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;
    }
.end annotation


# virtual methods
.method public abstract redeemFailed(Ljava/lang/String;Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;)V
.end method

.method public abstract redeemStarted(Ljava/lang/String;)V
.end method

.method public abstract redeemSucceeded(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method
