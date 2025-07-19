package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
/* loaded from: classes.dex */
public final class FullWallet implements SafeParcelable {
    public static final Parcelable.Creator<FullWallet> CREATOR = new d();
    String Gn;
    String Go;
    ProxyCard Gp;
    String Gq;
    Address Gr;
    Address Gs;
    String[] Gt;
    private final int kg;

    FullWallet() {
        this.kg = 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FullWallet(int versionCode, String googleTransactionId, String merchantTransactionId, ProxyCard proxyCard, String email, Address billingAddress, Address shippingAddress, String[] paymentDescriptions) {
        this.kg = versionCode;
        this.Gn = googleTransactionId;
        this.Go = merchantTransactionId;
        this.Gp = proxyCard;
        this.Gq = email;
        this.Gr = billingAddress;
        this.Gs = shippingAddress;
        this.Gt = paymentDescriptions;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public Address getBillingAddress() {
        return this.Gr;
    }

    public String getEmail() {
        return this.Gq;
    }

    public String getGoogleTransactionId() {
        return this.Gn;
    }

    public String getMerchantTransactionId() {
        return this.Go;
    }

    public String[] getPaymentDescriptions() {
        return this.Gt;
    }

    public ProxyCard getProxyCard() {
        return this.Gp;
    }

    public Address getShippingAddress() {
        return this.Gs;
    }

    public int getVersionCode() {
        return this.kg;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        d.a(this, out, flags);
    }
}
