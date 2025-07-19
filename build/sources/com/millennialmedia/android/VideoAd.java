package com.millennialmedia.android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.plus.PlusShare;
import com.millennialmedia.android.MMAdViewSDK;
import java.io.Externalizable;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class VideoAd extends CachedAd implements Parcelable, Externalizable {
    public static final Parcelable.Creator<VideoAd> CREATOR = new Parcelable.Creator<VideoAd>() {
        public VideoAd createFromParcel(Parcel in) {
            return new VideoAd(in);
        }

        public VideoAd[] newArray(int size) {
            return new VideoAd[size];
        }
    };
    static final long serialVersionUID = 2679125946930815832L;
    ArrayList<VideoLogEvent> activities = new ArrayList<>();
    ArrayList<VideoImage> buttons = new ArrayList<>();
    String[] cacheComplete;
    String[] cacheFailed;
    long contentLength;
    long duration;
    String[] endActivity;
    String onCompletionUrl;
    boolean showControls;
    boolean showCountdown;
    String[] startActivity;
    boolean stayInPlayer;
    String[] videoError;

    public VideoAd() {
    }

    VideoAd(Parcel in) {
        super(in);
        try {
            this.startActivity = new String[in.readInt()];
            in.readStringArray(this.startActivity);
            this.endActivity = new String[in.readInt()];
            in.readStringArray(this.endActivity);
            boolean[] yo = new boolean[3];
            in.readBooleanArray(yo);
            this.showControls = yo[0];
            this.stayInPlayer = yo[1];
            this.showCountdown = yo[2];
            this.onCompletionUrl = in.readString();
            this.duration = in.readLong();
            this.contentLength = in.readLong();
            this.buttons = in.readArrayList(VideoImage.class.getClassLoader());
            this.activities = in.readArrayList(VideoLogEvent.class.getClassLoader());
            this.cacheComplete = new String[in.readInt()];
            in.readStringArray(this.cacheComplete);
            this.cacheFailed = new String[in.readInt()];
            in.readStringArray(this.cacheFailed);
            this.videoError = new String[in.readInt()];
            in.readStringArray(this.videoError);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    VideoAd(String jsonString) {
        JSONObject videoObject;
        if (jsonString != null) {
            JSONObject jsonAdObject = null;
            try {
                jsonAdObject = new JSONObject(jsonString);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            if (jsonAdObject != null && (videoObject = jsonAdObject.optJSONObject("video")) != null) {
                deserializeFromObj(videoObject);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void deserializeFromObj(JSONObject videoObject) {
        super.deserializeFromObj(videoObject);
        JSONArray jsonArray = videoObject.optJSONArray("startActivity");
        if (jsonArray != null) {
            this.startActivity = new String[jsonArray.length()];
            for (int i = 0; i < jsonArray.length(); i++) {
                this.startActivity[i] = jsonArray.optString(i);
            }
        } else {
            this.startActivity = new String[0];
        }
        JSONArray jsonArray2 = videoObject.optJSONArray("endActivity");
        if (jsonArray2 != null) {
            this.endActivity = new String[jsonArray2.length()];
            for (int i2 = 0; i2 < jsonArray2.length(); i2++) {
                this.endActivity[i2] = jsonArray2.optString(i2);
            }
        } else {
            this.endActivity = new String[0];
        }
        JSONArray jsonArray3 = videoObject.optJSONArray("cacheComplete");
        if (jsonArray3 != null) {
            this.cacheComplete = new String[jsonArray3.length()];
            for (int i3 = 0; i3 < jsonArray3.length(); i3++) {
                this.cacheComplete[i3] = jsonArray3.optString(i3);
            }
        } else {
            this.cacheComplete = new String[0];
        }
        JSONArray jsonArray4 = videoObject.optJSONArray("cacheFailed");
        if (jsonArray4 != null) {
            this.cacheFailed = new String[jsonArray4.length()];
            for (int i4 = 0; i4 < jsonArray4.length(); i4++) {
                this.cacheFailed[i4] = jsonArray4.optString(i4);
            }
        } else {
            this.cacheFailed = new String[0];
        }
        JSONArray jsonArray5 = videoObject.optJSONArray("videoError");
        if (jsonArray5 != null) {
            this.videoError = new String[jsonArray5.length()];
            for (int i5 = 0; i5 < jsonArray5.length(); i5++) {
                this.videoError[i5] = jsonArray5.optString(i5);
            }
        } else {
            this.videoError = new String[0];
        }
        this.showControls = videoObject.optBoolean("showVideoPlayerControls");
        this.showCountdown = videoObject.optBoolean("showCountdownHUD");
        JSONObject jsonObject = videoObject.optJSONObject("onCompletion");
        if (jsonObject != null) {
            this.onCompletionUrl = jsonObject.optString(PlusShare.KEY_CALL_TO_ACTION_URL, (String) null);
            this.stayInPlayer = jsonObject.optBoolean("stayInPlayer");
        }
        this.duration = (long) (videoObject.optDouble("duration", 0.0d) * 1000.0d);
        this.contentLength = videoObject.optLong("contentLength");
        JSONArray jsonArray6 = videoObject.optJSONArray("buttons");
        if (jsonArray6 != null) {
            for (int i6 = 0; i6 < jsonArray6.length(); i6++) {
                JSONObject jsonObject2 = jsonArray6.optJSONObject(i6);
                if (jsonObject2 != null) {
                    this.buttons.add(new VideoImage(jsonObject2));
                }
            }
        }
        JSONArray jsonArray7 = videoObject.optJSONArray("log");
        if (jsonArray7 != null) {
            for (int i7 = 0; i7 < jsonArray7.length(); i7++) {
                JSONObject jsonObject3 = jsonArray7.optJSONObject(i7);
                if (jsonObject3 != null) {
                    this.activities.add(new VideoLogEvent(jsonObject3));
                }
            }
        }
    }

    /* access modifiers changed from: package-private */
    public int getType() {
        return 1;
    }

    /* access modifiers changed from: package-private */
    public String getTypeString() {
        return "Video";
    }

    /* access modifiers changed from: package-private */
    public boolean saveAssets(Context context) {
        return true;
    }

    /* access modifiers changed from: package-private */
    public boolean download(Context context) {
        File dir = AdCache.getCacheDirectory(context);
        if (dir == null || !dir.isDirectory()) {
            return false;
        }
        MMAdViewSDK.Log.m4429v("Downloading content to %s", dir);
        boolean success = AdCache.downloadComponent(this.contentUrl, this.f3958id + "video.dat", dir);
        if (success) {
            for (int i = 0; i < this.buttons.size(); i++) {
                VideoImage button = this.buttons.get(i);
                success = AdCache.downloadComponent(button.imageUrl, this.f3958id + button.getImageName(), dir);
                if (!success) {
                    break;
                }
            }
        }
        if (!success) {
            if (this.downloadAllOrNothing) {
                delete(context);
            }
            HttpGetRequest.log(this.cacheFailed);
        } else if (success) {
            if (this.acid != null && this.acid.length() > 0) {
                AdCache.cachedVideoWasAdded(context, this.acid);
            }
            HttpGetRequest.log(this.cacheComplete);
        }
        MMAdViewSDK.Log.m4429v("Caching completed successfully? %b", Boolean.valueOf(success));
        return success;
    }

    /* access modifiers changed from: package-private */
    public void delete(Context context) {
        super.delete(context);
        AdCache.cachedVideoWasRemoved(context, this.acid);
        MMAdViewSDK.Log.m4429v("Ad %s was deleted.", this.f3958id);
    }

    /* access modifiers changed from: package-private */
    public boolean isOnDisk(Context context) {
        boolean existsInFilesystem = false;
        File adDir = AdCache.getCacheDirectory(context);
        if (adDir == null || !adDir.exists()) {
            return false;
        }
        String[] list = adDir.list(new FilenameFilter() {
            public boolean accept(File dir, String filename) {
                return filename.startsWith(VideoAd.this.f3958id);
            }
        });
        if (list != null && list.length >= this.buttons.size() + 1) {
            existsInFilesystem = true;
        }
        if (!existsInFilesystem) {
            return existsInFilesystem;
        }
        if (!new File(adDir, this.f3958id + "video.dat").exists()) {
            return false;
        }
        Iterator i$ = this.buttons.iterator();
        while (i$.hasNext()) {
            if (!new File(adDir, this.f3958id + i$.next().getImageName()).exists()) {
                return false;
            }
        }
        return existsInFilesystem;
    }

    /* access modifiers changed from: package-private */
    public boolean canShow(Context context, MMAdView adView, boolean checkDeferredViewStart) {
        if (checkDeferredViewStart) {
            if (isExpired() || !isOnDisk(context) || !HandShake.sharedHandShake(context).canDisplayCachedAd(adView.adType, this.deferredViewStart)) {
                return false;
            }
            return true;
        } else if (isExpired() || !isOnDisk(context)) {
            return false;
        } else {
            return true;
        }
    }

    /* access modifiers changed from: package-private */
    public void show(Context context, MMAdView adView) {
        Intent intent = new Intent().setClass(context, VideoPlayer.class);
        if (!(context instanceof MMActivity)) {
            intent.setFlags(603979776);
        }
        intent.putExtra("cached", true);
        intent.putExtra("videoId", this.f3958id);
        intent.putExtra("class", "com.millennialmedia.android.VideoPlayerActivity");
        if (!this.storedOnSdCard || !Environment.getExternalStorageState().equals("mounted")) {
            intent.setData(Uri.parse(this.f3958id));
        } else {
            intent.setData(Uri.parse(Environment.getExternalStorageDirectory().getAbsolutePath() + File.separator + ".mmsyscache" + File.separator + this.f3958id + "video.dat"));
        }
        if (!(context instanceof Activity)) {
            intent.addFlags(DriveFile.MODE_READ_ONLY);
        }
        context.startActivity(intent);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeInt(this.startActivity.length);
        dest.writeStringArray(this.startActivity);
        dest.writeInt(this.endActivity.length);
        dest.writeStringArray(this.endActivity);
        dest.writeBooleanArray(new boolean[]{this.showControls, this.stayInPlayer, this.showCountdown});
        dest.writeString(this.onCompletionUrl);
        dest.writeLong(this.duration);
        dest.writeLong(this.contentLength);
        dest.writeList(this.buttons);
        dest.writeList(this.activities);
        dest.writeInt(this.cacheComplete.length);
        dest.writeStringArray(this.cacheComplete);
        dest.writeInt(this.cacheFailed.length);
        dest.writeStringArray(this.cacheFailed);
        dest.writeInt(this.videoError.length);
        dest.writeStringArray(this.videoError);
    }

    public void readExternal(ObjectInput input) throws IOException, ClassNotFoundException {
        super.readExternal(input);
        this.showControls = input.readBoolean();
        this.onCompletionUrl = (String) input.readObject();
        this.stayInPlayer = input.readBoolean();
        this.showCountdown = input.readBoolean();
        int count = input.readInt();
        this.startActivity = new String[count];
        for (int i = 0; i < count; i++) {
            this.startActivity[i] = (String) input.readObject();
        }
        int count2 = input.readInt();
        this.endActivity = new String[count2];
        for (int i2 = 0; i2 < count2; i2++) {
            this.endActivity[i2] = (String) input.readObject();
        }
        this.duration = input.readLong();
        this.contentLength = input.readLong();
        int count3 = input.readInt();
        this.cacheComplete = new String[count3];
        for (int i3 = 0; i3 < count3; i3++) {
            this.cacheComplete[i3] = (String) input.readObject();
        }
        int count4 = input.readInt();
        this.cacheFailed = new String[count4];
        for (int i4 = 0; i4 < count4; i4++) {
            this.cacheFailed[i4] = (String) input.readObject();
        }
        int count5 = input.readInt();
        this.videoError = new String[count5];
        for (int i5 = 0; i5 < count5; i5++) {
            this.videoError[i5] = (String) input.readObject();
        }
        this.buttons.clear();
        int count6 = input.readInt();
        for (int i6 = 0; i6 < count6; i6++) {
            this.buttons.add((VideoImage) input.readObject());
        }
        this.activities.clear();
        int count7 = input.readInt();
        for (int i7 = 0; i7 < count7; i7++) {
            this.activities.add((VideoLogEvent) input.readObject());
        }
    }

    public void writeExternal(ObjectOutput output) throws IOException {
        super.writeExternal(output);
        output.writeBoolean(this.showControls);
        output.writeObject(this.onCompletionUrl);
        output.writeBoolean(this.stayInPlayer);
        output.writeBoolean(this.showCountdown);
        output.writeInt(this.startActivity.length);
        for (String sa : this.startActivity) {
            output.writeObject(sa);
        }
        output.writeInt(this.endActivity.length);
        for (String ea : this.endActivity) {
            output.writeObject(ea);
        }
        output.writeLong(this.duration);
        output.writeLong(this.contentLength);
        output.writeInt(this.cacheComplete.length);
        for (String cc : this.cacheComplete) {
            output.writeObject(cc);
        }
        output.writeInt(this.cacheFailed.length);
        for (String cf : this.cacheFailed) {
            output.writeObject(cf);
        }
        output.writeInt(this.videoError.length);
        for (String ve : this.videoError) {
            output.writeObject(ve);
        }
        output.writeInt(this.buttons.size());
        Iterator i$ = this.buttons.iterator();
        while (i$.hasNext()) {
            output.writeObject(i$.next());
        }
        output.writeInt(this.activities.size());
        Iterator i$2 = this.activities.iterator();
        while (i$2.hasNext()) {
            output.writeObject(i$2.next());
        }
    }
}
