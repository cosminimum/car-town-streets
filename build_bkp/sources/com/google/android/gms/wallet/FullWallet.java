package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class FullWallet implements SafeParcelable {
    public static final Parcelable.Creator<FullWallet> CREATOR = new C1633d();

    /* renamed from: Gn */
    String f3831Gn;

    /* renamed from: Go */
    String f3832Go;

    /* renamed from: Gp */
    ProxyCard f3833Gp;

    /* renamed from: Gq */
    String f3834Gq;

    /* renamed from: Gr */
    Address f3835Gr;

    /* renamed from: Gs */
    Address f3836Gs;

    /* renamed from: Gt */
    String[] f3837Gt;

    /* renamed from: kg */
    private final int f3838kg;

    FullWallet() {
        this.f3838kg = 1;
    }

    FullWallet(int versionCode, String googleTransactionId, String merchantTransactionId, ProxyCard proxyCard, String email, Address billingAddress, Address shippingAddress, String[] paymentDescriptions) {
        this.f3838kg = versionCode;
        this.f3831Gn = googleTransactionId;
        this.f3832Go = merchantTransactionId;
        this.f3833Gp = proxyCard;
        this.f3834Gq = email;
        this.f3835Gr = billingAddress;
        this.f3836Gs = shippingAddress;
        this.f3837Gt = paymentDescriptions;
    }

    public int describeContents() {
        return 0;
    }

    public Address getBillingAddress() {
        return this.f3835Gr;
    }

    public String getEmail() {
        return this.f3834Gq;
    }

    public String getGoogleTransactionId() {
        return this.f3831Gn;
    }

    public String getMerchantTransactionId() {
        return this.f3832Go;
    }

    public String[] getPaymentDescriptions() {
        return this.f3837Gt;
    }

    public ProxyCard getProxyCard() {
        return this.f3833Gp;
    }

    public Address getShippingAddress() {
        return this.f3836Gs;
    }

    public int getVersionCode() {
        return this.f3838kg;
    }

    public void writeToParcel(Parcel out, int flags) {
        C1633d.m4349a(this, out, flags);
    }
}
