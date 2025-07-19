package com.getjar.sdk.listener;
/* loaded from: classes.dex */
public interface VoucherRedemptionListener extends GetJarListener {

    /* loaded from: classes.dex */
    public enum FailureReason {
        NETWORK,
        INVALID_VOUCHER,
        ALREADY_REDEEMED,
        ALREADY_LICENSED,
        GENERAL
    }

    void redeemFailed(String str, FailureReason failureReason);

    void redeemStarted(String str);

    void redeemSucceeded(String str, String str2, String str3, String str4);
}
