package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.text.TextUtils;
import com.google.android.gms.common.data.C0663b;
import com.google.android.gms.common.data.DataHolder;

/* renamed from: com.google.android.gms.games.d */
public final class C0826d extends C0663b implements Player {

    /* renamed from: tG */
    private final C0827a f1754tG;

    /* renamed from: com.google.android.gms.games.d$a */
    private static final class C0827a {

        /* renamed from: tH */
        public final String f1755tH;

        /* renamed from: tI */
        public final String f1756tI;

        /* renamed from: tJ */
        public final String f1757tJ;

        /* renamed from: tK */
        public final String f1758tK;

        /* renamed from: tL */
        public final String f1759tL;

        /* renamed from: tM */
        public final String f1760tM;

        /* renamed from: tN */
        public final String f1761tN;

        public C0827a(String str) {
            if (TextUtils.isEmpty(str)) {
                this.f1755tH = "external_player_id";
                this.f1756tI = "profile_name";
                this.f1757tJ = "profile_icon_image_uri";
                this.f1758tK = "profile_hi_res_image_uri";
                this.f1759tL = "last_updated";
                this.f1760tM = "is_in_circles";
                this.f1761tN = "played_with_timestamp";
                return;
            }
            this.f1755tH = str + "external_player_id";
            this.f1756tI = str + "profile_name";
            this.f1757tJ = str + "profile_icon_image_uri";
            this.f1758tK = str + "profile_hi_res_image_uri";
            this.f1759tL = str + "last_updated";
            this.f1760tM = str + "is_in_circles";
            this.f1761tN = str + "played_with_timestamp";
        }
    }

    public C0826d(DataHolder dataHolder, int i) {
        this(dataHolder, i, (String) null);
    }

    public C0826d(DataHolder dataHolder, int i, String str) {
        super(dataHolder, i);
        this.f1754tG = new C0827a(str);
    }

    /* renamed from: db */
    public int mo6578db() {
        return getInteger(this.f1754tG.f1760tM);
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return PlayerEntity.m1788a(this, obj);
    }

    public Player freeze() {
        return new PlayerEntity(this);
    }

    public String getDisplayName() {
        return getString(this.f1754tG.f1756tI);
    }

    public void getDisplayName(CharArrayBuffer dataOut) {
        mo5976a(this.f1754tG.f1756tI, dataOut);
    }

    public Uri getHiResImageUri() {
        return mo5974L(this.f1754tG.f1758tK);
    }

    public Uri getIconImageUri() {
        return mo5974L(this.f1754tG.f1757tJ);
    }

    public long getLastPlayedWithTimestamp() {
        if (!hasColumn(this.f1754tG.f1761tN)) {
            return -1;
        }
        return getLong(this.f1754tG.f1761tN);
    }

    public String getPlayerId() {
        return getString(this.f1754tG.f1755tH);
    }

    public long getRetrievedTimestamp() {
        return getLong(this.f1754tG.f1759tL);
    }

    public boolean hasHiResImage() {
        return getHiResImageUri() != null;
    }

    public boolean hasIconImage() {
        return getIconImageUri() != null;
    }

    public int hashCode() {
        return PlayerEntity.m1787a(this);
    }

    public String toString() {
        return PlayerEntity.m1790b((Player) this);
    }

    public void writeToParcel(Parcel dest, int flags) {
        ((PlayerEntity) freeze()).writeToParcel(dest, flags);
    }
}
