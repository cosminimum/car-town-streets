package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

/* renamed from: com.google.android.gms.internal.hd */
public final class C1336hd extends C1321gr implements SafeParcelable {
    public static final C1339he CREATOR = new C1339he();

    /* renamed from: AM */
    private final Bundle f3151AM;

    /* renamed from: AN */
    private final C1340hf f3152AN;

    /* renamed from: AO */
    private final LatLng f3153AO;

    /* renamed from: AP */
    private final float f3154AP;

    /* renamed from: AQ */
    private final LatLngBounds f3155AQ;

    /* renamed from: AR */
    private final String f3156AR;

    /* renamed from: AS */
    private final Uri f3157AS;

    /* renamed from: AT */
    private final boolean f3158AT;

    /* renamed from: AU */
    private final float f3159AU;

    /* renamed from: AV */
    private final int f3160AV;

    /* renamed from: AW */
    private final long f3161AW;

    /* renamed from: AX */
    private final List<C1327gx> f3162AX;

    /* renamed from: AY */
    private final Map<C1327gx, String> f3163AY;

    /* renamed from: AZ */
    private final TimeZone f3164AZ;

    /* renamed from: Ba */
    private Locale f3165Ba;

    /* renamed from: Bb */
    private C1342hh f3166Bb;

    /* renamed from: kg */
    final int f3167kg;

    /* renamed from: uS */
    private final String f3168uS;

    /* renamed from: com.google.android.gms.internal.hd$a */
    public static final class C1337a implements SafeParcelable {
        public static final C1333ha CREATOR = new C1333ha();

        /* renamed from: Bc */
        private final String f3169Bc;

        /* renamed from: Bd */
        private final String f3170Bd;

        /* renamed from: Be */
        private final int f3171Be;

        /* renamed from: kg */
        final int f3172kg;
        private final String mTag;

        /* renamed from: com.google.android.gms.internal.hd$a$a */
        public static class C1338a {

            /* renamed from: Bc */
            private final String f3173Bc;

            /* renamed from: Bd */
            private String f3174Bd;

            /* renamed from: Be */
            private int f3175Be;
            private final String mTag;

            public C1338a(String str, String str2) {
                this.f3173Bc = str;
                this.mTag = str2;
            }

            /* renamed from: as */
            public C1338a mo8207as(String str) {
                this.f3174Bd = str;
                return this;
            }

            /* renamed from: bd */
            public C1338a mo8208bd(int i) {
                this.f3175Be = i;
                return this;
            }

            /* renamed from: ek */
            public C1337a mo8209ek() {
                return new C1337a(0, this.f3173Bc, this.mTag, this.f3174Bd, this.f3175Be);
            }
        }

        C1337a(int i, String str, String str2, String str3, int i2) {
            this.f3172kg = i;
            this.f3169Bc = str;
            this.mTag = str2;
            this.f3170Bd = str3;
            this.f3171Be = i2;
        }

        public int describeContents() {
            C1333ha haVar = CREATOR;
            return 0;
        }

        /* renamed from: eh */
        public String mo8199eh() {
            return this.f3169Bc;
        }

        /* renamed from: ei */
        public String mo8200ei() {
            return this.f3170Bd;
        }

        /* renamed from: ej */
        public int mo8201ej() {
            return this.f3171Be;
        }

        public boolean equals(Object object) {
            if (this == object) {
                return true;
            }
            if (!(object instanceof C1337a)) {
                return false;
            }
            C1337a aVar = (C1337a) object;
            return this.f3169Bc.equals(aVar.f3169Bc) && C1098ee.equal(this.mTag, aVar.mTag);
        }

        public String getTag() {
            return this.mTag;
        }

        public int hashCode() {
            return C1098ee.hashCode(this.f3169Bc, this.mTag, this.f3170Bd, Integer.valueOf(this.f3171Be));
        }

        public String toString() {
            return C1098ee.m2604e(this).mo7535a("placeId", this.f3169Bc).mo7535a("tag", this.mTag).mo7535a("callingAppPackageName", this.f3170Bd).mo7535a("callingAppVersionCode", Integer.valueOf(this.f3171Be)).toString();
        }

        public void writeToParcel(Parcel parcel, int flags) {
            C1333ha haVar = CREATOR;
            C1333ha.m3551a(this, parcel, flags);
        }
    }

    C1336hd(int i, String str, List<C1327gx> list, Bundle bundle, C1340hf hfVar, LatLng latLng, float f, LatLngBounds latLngBounds, String str2, Uri uri, boolean z, float f2, int i2, long j) {
        this.f3167kg = i;
        this.f3168uS = str;
        this.f3162AX = Collections.unmodifiableList(list);
        this.f3151AM = bundle;
        this.f3152AN = hfVar;
        this.f3153AO = latLng;
        this.f3154AP = f;
        this.f3155AQ = latLngBounds;
        this.f3156AR = str2;
        this.f3157AS = uri;
        this.f3158AT = z;
        this.f3159AU = f2;
        this.f3160AV = i2;
        this.f3161AW = j;
        HashMap hashMap = new HashMap();
        for (String str3 : bundle.keySet()) {
            hashMap.put(C1327gx.m3538aq(str3), bundle.getString(str3));
        }
        this.f3163AY = Collections.unmodifiableMap(hashMap);
        this.f3164AZ = TimeZone.getTimeZone(this.f3156AR);
        this.f3165Ba = null;
        this.f3166Bb = null;
    }

    /* renamed from: ar */
    private void m3559ar(String str) {
        if (this.f3166Bb != null) {
            this.f3166Bb.mo8223a(new C1337a.C1338a(this.f3168uS, str));
        }
    }

    /* renamed from: dW */
    public List<C1327gx> mo8180dW() {
        m3559ar("getTypes");
        return this.f3162AX;
    }

    /* renamed from: dX */
    public LatLng mo8181dX() {
        m3559ar("getLatLng");
        return this.f3153AO;
    }

    /* renamed from: dY */
    public float mo8182dY() {
        m3559ar("getLevelNumber");
        return this.f3154AP;
    }

    /* renamed from: dZ */
    public LatLngBounds mo8183dZ() {
        m3559ar("getViewport");
        return this.f3155AQ;
    }

    public int describeContents() {
        C1339he heVar = CREATOR;
        return 0;
    }

    /* renamed from: ea */
    public Uri mo8185ea() {
        m3559ar("getWebsiteUri");
        return this.f3157AS;
    }

    /* renamed from: eb */
    public boolean mo8186eb() {
        m3559ar("isPermanentlyClosed");
        return this.f3158AT;
    }

    /* renamed from: ec */
    public int mo8187ec() {
        m3559ar("getPriceLevel");
        return this.f3160AV;
    }

    /* renamed from: ed */
    public long mo8188ed() {
        return this.f3161AW;
    }

    /* renamed from: ee */
    public Bundle mo8189ee() {
        return this.f3151AM;
    }

    /* renamed from: ef */
    public C1340hf mo8190ef() {
        return this.f3152AN;
    }

    /* renamed from: eg */
    public String mo8191eg() {
        return this.f3156AR;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (!(object instanceof C1336hd)) {
            return false;
        }
        C1336hd hdVar = (C1336hd) object;
        return this.f3168uS.equals(hdVar.f3168uS) && C1098ee.equal(this.f3165Ba, hdVar.f3165Ba) && this.f3161AW == hdVar.f3161AW;
    }

    public String getId() {
        m3559ar("getId");
        return this.f3168uS;
    }

    public float getRating() {
        m3559ar("getRating");
        return this.f3159AU;
    }

    public int hashCode() {
        return C1098ee.hashCode(this.f3168uS, this.f3165Ba, Long.valueOf(this.f3161AW));
    }

    public String toString() {
        return C1098ee.m2604e(this).mo7535a(Constants.APP_ID, this.f3168uS).mo7535a("localization", this.f3152AN).mo7535a("locale", this.f3165Ba).mo7535a("latlng", this.f3153AO).mo7535a("levelNumber", Float.valueOf(this.f3154AP)).mo7535a("viewport", this.f3155AQ).mo7535a("timeZone", this.f3156AR).mo7535a("websiteUri", this.f3157AS).mo7535a("isPermanentlyClosed", Boolean.valueOf(this.f3158AT)).mo7535a("priceLevel", Integer.valueOf(this.f3160AV)).mo7535a("timestampSecs", Long.valueOf(this.f3161AW)).toString();
    }

    public void writeToParcel(Parcel parcel, int flags) {
        C1339he heVar = CREATOR;
        C1339he.m3577a(this, parcel, flags);
    }
}
