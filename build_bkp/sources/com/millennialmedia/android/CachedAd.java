package com.millennialmedia.android;

import android.content.Context;
import android.os.Parcel;
import com.getjar.sdk.utilities.Constants;
import com.millennialmedia.android.MMAdView;
import com.millennialmedia.android.MMAdViewSDK;
import java.io.Externalizable;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.json.JSONObject;

abstract class CachedAd implements Externalizable {
    static final int INTERSTITIAL = 2;
    static final int NATIVE = 3;
    static final int VIDEO = 1;
    static final long serialVersionUID = 316862728709355974L;
    String acid;
    String contentUrl;
    long deferredViewStart;
    boolean downloadAllOrNothing;
    int downloadPriority;
    Date expiration;

    /* renamed from: id */
    String f3958id;
    MMAdView.Request request;
    boolean storedOnSdCard;

    /* access modifiers changed from: package-private */
    public abstract boolean canShow(Context context, MMAdView mMAdView, boolean z);

    /* access modifiers changed from: package-private */
    public abstract boolean download(Context context);

    /* access modifiers changed from: package-private */
    public abstract int getType();

    /* access modifiers changed from: package-private */
    public abstract String getTypeString();

    /* access modifiers changed from: package-private */
    public abstract boolean isOnDisk(Context context);

    /* access modifiers changed from: package-private */
    public abstract boolean saveAssets(Context context);

    /* access modifiers changed from: package-private */
    public abstract void show(Context context, MMAdView mMAdView);

    CachedAd() {
        this.downloadAllOrNothing = false;
        this.deferredViewStart = System.currentTimeMillis();
    }

    protected CachedAd(Parcel in) {
        this.downloadAllOrNothing = false;
        try {
            this.f3958id = in.readString();
            this.acid = in.readString();
            this.expiration = (Date) in.readSerializable();
            this.deferredViewStart = in.readLong();
            boolean[] yo = new boolean[2];
            in.readBooleanArray(yo);
            this.downloadAllOrNothing = yo[0];
            this.storedOnSdCard = yo[1];
            this.contentUrl = in.readString();
            this.downloadPriority = in.readInt();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* access modifiers changed from: protected */
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.f3958id);
        dest.writeString(this.acid);
        dest.writeSerializable(this.expiration);
        dest.writeLong(this.deferredViewStart);
        dest.writeBooleanArray(new boolean[]{this.downloadAllOrNothing, this.storedOnSdCard});
        dest.writeString(this.contentUrl);
        dest.writeInt(this.downloadPriority);
    }

    public boolean equals(Object cachedAd) {
        if (this == cachedAd) {
            return true;
        }
        return this.f3958id.equals(((CachedAd) cachedAd).f3958id);
    }

    /* access modifiers changed from: protected */
    public void deserializeFromObj(JSONObject videoObject) {
        this.f3958id = videoObject.optString(Constants.APP_ID, (String) null);
        this.acid = videoObject.optString("vid", (String) null);
        this.contentUrl = videoObject.optString("content-url", (String) null);
        String exp = videoObject.optString("expiration", (String) null);
        if (exp != null) {
            try {
                this.expiration = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ZZZZ").parse(exp);
            } catch (ParseException e) {
                MMAdViewSDK.Log.m4421e((Throwable) e);
            }
        }
    }

    /* access modifiers changed from: package-private */
    public boolean isExpired() {
        if (this.expiration == null || this.expiration.getTime() > System.currentTimeMillis()) {
            return false;
        }
        return true;
    }

    /* access modifiers changed from: package-private */
    public boolean isValid() {
        if (this.f3958id == null || this.f3958id.length() <= 0 || this.contentUrl == null || this.contentUrl.length() <= 0) {
            return false;
        }
        return true;
    }

    /* access modifiers changed from: package-private */
    public void delete(Context context) {
        File dir = AdCache.getCacheDirectory(context);
        if (dir != null && dir.isDirectory()) {
            try {
                File[] files = dir.listFiles(new FileFilter() {
                    public boolean accept(File file) {
                        return file.isFile() && file.getName().startsWith(CachedAd.this.f3958id);
                    }
                });
                MMAdViewSDK.Log.m4429v("Deleting %d files for %s.", Integer.valueOf(files.length), this.f3958id);
                for (File delete : files) {
                    delete.delete();
                }
            } catch (Exception e) {
                MMAdViewSDK.Log.m4430v((Throwable) e);
            }
        }
    }

    static CachedAd parseJSON(String json) {
        if (MMAdViewSDK.logLevel >= 4) {
            MMAdViewSDK.Log.m4428v("Received cached ad.");
            int length = json.length();
            if (length > 1000) {
                int e = 999;
                int s = 0;
                while (true) {
                    if (e >= length) {
                        break;
                    }
                    MMAdViewSDK.Log.m4428v(json.substring(s, e));
                    s = e;
                    e += 1000;
                    if (e > length) {
                        e = length - 1;
                        break;
                    }
                }
                MMAdViewSDK.Log.m4428v(json.substring(s, e));
            } else {
                MMAdViewSDK.Log.m4428v(json);
            }
        }
        if (json.length() > 0) {
            return new VideoAd(json);
        }
        return null;
    }

    public void readExternal(ObjectInput input) throws IOException, ClassNotFoundException {
        this.f3958id = (String) input.readObject();
        this.acid = (String) input.readObject();
        this.expiration = (Date) input.readObject();
        this.deferredViewStart = input.readLong();
        this.contentUrl = (String) input.readObject();
    }

    public void writeExternal(ObjectOutput output) throws IOException {
        output.writeObject(this.f3958id);
        output.writeObject(this.acid);
        output.writeObject(this.expiration);
        output.writeLong(this.deferredViewStart);
        output.writeObject(this.contentUrl);
    }
}
