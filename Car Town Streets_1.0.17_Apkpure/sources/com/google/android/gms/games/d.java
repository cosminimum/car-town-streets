package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.text.TextUtils;
import com.google.android.gms.common.data.DataHolder;
/* loaded from: classes.dex */
public final class d extends com.google.android.gms.common.data.b implements Player {
    private final a tG;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class a {
        public final String tH;
        public final String tI;
        public final String tJ;
        public final String tK;
        public final String tL;
        public final String tM;
        public final String tN;

        public a(String str) {
            if (TextUtils.isEmpty(str)) {
                this.tH = "external_player_id";
                this.tI = "profile_name";
                this.tJ = "profile_icon_image_uri";
                this.tK = "profile_hi_res_image_uri";
                this.tL = "last_updated";
                this.tM = "is_in_circles";
                this.tN = "played_with_timestamp";
                return;
            }
            this.tH = str + "external_player_id";
            this.tI = str + "profile_name";
            this.tJ = str + "profile_icon_image_uri";
            this.tK = str + "profile_hi_res_image_uri";
            this.tL = str + "last_updated";
            this.tM = str + "is_in_circles";
            this.tN = str + "played_with_timestamp";
        }
    }

    public d(DataHolder dataHolder, int i) {
        this(dataHolder, i, null);
    }

    public d(DataHolder dataHolder, int i, String str) {
        super(dataHolder, i);
        this.tG = new a(str);
    }

    @Override // com.google.android.gms.games.Player
    public int db() {
        return getInteger(this.tG.tM);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.google.android.gms.common.data.b
    public boolean equals(Object obj) {
        return PlayerEntity.a(this, obj);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: freeze */
    public Player mo358freeze() {
        return new PlayerEntity(this);
    }

    @Override // com.google.android.gms.games.Player
    public String getDisplayName() {
        return getString(this.tG.tI);
    }

    @Override // com.google.android.gms.games.Player
    public void getDisplayName(CharArrayBuffer dataOut) {
        a(this.tG.tI, dataOut);
    }

    @Override // com.google.android.gms.games.Player
    public Uri getHiResImageUri() {
        return L(this.tG.tK);
    }

    @Override // com.google.android.gms.games.Player
    public Uri getIconImageUri() {
        return L(this.tG.tJ);
    }

    @Override // com.google.android.gms.games.Player
    public long getLastPlayedWithTimestamp() {
        if (!hasColumn(this.tG.tN)) {
            return -1L;
        }
        return getLong(this.tG.tN);
    }

    @Override // com.google.android.gms.games.Player
    public String getPlayerId() {
        return getString(this.tG.tH);
    }

    @Override // com.google.android.gms.games.Player
    public long getRetrievedTimestamp() {
        return getLong(this.tG.tL);
    }

    @Override // com.google.android.gms.games.Player
    public boolean hasHiResImage() {
        return getHiResImageUri() != null;
    }

    @Override // com.google.android.gms.games.Player
    public boolean hasIconImage() {
        return getIconImageUri() != null;
    }

    @Override // com.google.android.gms.common.data.b
    public int hashCode() {
        return PlayerEntity.a(this);
    }

    public String toString() {
        return PlayerEntity.b(this);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        ((PlayerEntity) mo358freeze()).writeToParcel(dest, flags);
    }
}
