package com.millennialmedia.android;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class InterstitialAd extends CachedAd implements Parcelable, Externalizable {
    public static final Parcelable.Creator<InterstitialAd> CREATOR = new Parcelable.Creator<InterstitialAd>() { // from class: com.millennialmedia.android.InterstitialAd.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public InterstitialAd mo467createFromParcel(Parcel in) {
            return new InterstitialAd(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public InterstitialAd[] mo468newArray(int size) {
            return new InterstitialAd[size];
        }
    };
    static final long serialVersionUID = 5158660334173309853L;
    String baseUrl;
    String content;

    public InterstitialAd() {
    }

    InterstitialAd(Parcel in) {
        super(in);
        try {
            this.content = in.readString();
            this.baseUrl = in.readString();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.millennialmedia.android.CachedAd
    public int getType() {
        return 2;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.millennialmedia.android.CachedAd
    public String getTypeString() {
        return "Interstitial";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.millennialmedia.android.CachedAd
    public boolean saveAssets(Context context) {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.millennialmedia.android.CachedAd
    public boolean download(Context context) {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.millennialmedia.android.CachedAd
    public boolean isOnDisk(Context context) {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.millennialmedia.android.CachedAd
    public boolean canShow(Context context, MMAdView adView, boolean checkDeferredViewStart) {
        return checkDeferredViewStart ? this.content != null && this.content.length() > 0 && this.baseUrl != null && this.baseUrl.length() > 0 && HandShake.sharedHandShake(context).canDisplayCachedAd(adView.adType, this.deferredViewStart) : this.content != null && this.content.length() > 0 && this.baseUrl != null && this.baseUrl.length() > 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.millennialmedia.android.CachedAd
    public void show(Context context, MMAdView adView) {
        adView.controller.setWebViewContent(this.content, this.baseUrl, adView, null, false);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.millennialmedia.android.CachedAd, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeString(this.content);
        dest.writeString(this.baseUrl);
    }

    @Override // com.millennialmedia.android.CachedAd, java.io.Externalizable
    public void readExternal(ObjectInput input) throws IOException, ClassNotFoundException {
        super.readExternal(input);
        this.content = (String) input.readObject();
        this.baseUrl = (String) input.readObject();
    }

    @Override // com.millennialmedia.android.CachedAd, java.io.Externalizable
    public void writeExternal(ObjectOutput output) throws IOException {
        super.writeExternal(output);
        output.writeObject(this.content);
        output.writeObject(this.baseUrl);
    }
}
