package com.millennialmedia.android;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import com.millennialmedia.android.MMAdView;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

class InterstitialAd extends CachedAd implements Parcelable, Externalizable {
    public static final Parcelable.Creator<InterstitialAd> CREATOR = new Parcelable.Creator<InterstitialAd>() {
        public InterstitialAd createFromParcel(Parcel in) {
            return new InterstitialAd(in);
        }

        public InterstitialAd[] newArray(int size) {
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

    /* access modifiers changed from: package-private */
    public int getType() {
        return 2;
    }

    /* access modifiers changed from: package-private */
    public String getTypeString() {
        return "Interstitial";
    }

    /* access modifiers changed from: package-private */
    public boolean saveAssets(Context context) {
        return true;
    }

    /* access modifiers changed from: package-private */
    public boolean download(Context context) {
        return true;
    }

    /* access modifiers changed from: package-private */
    public boolean isOnDisk(Context context) {
        return true;
    }

    /* access modifiers changed from: package-private */
    public boolean canShow(Context context, MMAdView adView, boolean checkDeferredViewStart) {
        if (checkDeferredViewStart) {
            if (this.content == null || this.content.length() <= 0 || this.baseUrl == null || this.baseUrl.length() <= 0 || !HandShake.sharedHandShake(context).canDisplayCachedAd(adView.adType, this.deferredViewStart)) {
                return false;
            }
            return true;
        } else if (this.content == null || this.content.length() <= 0 || this.baseUrl == null || this.baseUrl.length() <= 0) {
            return false;
        } else {
            return true;
        }
    }

    /* access modifiers changed from: package-private */
    public void show(Context context, MMAdView adView) {
        adView.controller.setWebViewContent(this.content, this.baseUrl, adView, (MMAdView.Request) null, false);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeString(this.content);
        dest.writeString(this.baseUrl);
    }

    public void readExternal(ObjectInput input) throws IOException, ClassNotFoundException {
        super.readExternal(input);
        this.content = (String) input.readObject();
        this.baseUrl = (String) input.readObject();
    }

    public void writeExternal(ObjectOutput output) throws IOException {
        super.writeExternal(output);
        output.writeObject(this.content);
        output.writeObject(this.baseUrl);
    }
}
