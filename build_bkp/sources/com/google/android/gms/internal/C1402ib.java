package com.google.android.gms.internal;

import android.os.Parcel;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1115es;
import com.google.android.gms.plus.PlusShare;
import com.google.android.gms.plus.model.moments.ItemScope;
import com.millennialmedia.android.MMAdView;
import com.millennialmedia.android.MMAdViewSDK;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.ib */
public final class C1402ib extends C1115es implements SafeParcelable, ItemScope {
    public static final C1403ic CREATOR = new C1403ic();

    /* renamed from: Ep */
    private static final HashMap<String, C1115es.C1116a<?, ?>> f3270Ep = new HashMap<>();

    /* renamed from: AI */
    private String f3271AI;

    /* renamed from: EA */
    private C1402ib f3272EA;

    /* renamed from: EB */
    private List<C1402ib> f3273EB;

    /* renamed from: EC */
    private String f3274EC;

    /* renamed from: ED */
    private String f3275ED;

    /* renamed from: EE */
    private C1402ib f3276EE;

    /* renamed from: EF */
    private String f3277EF;

    /* renamed from: EG */
    private String f3278EG;

    /* renamed from: EH */
    private String f3279EH;

    /* renamed from: EI */
    private List<C1402ib> f3280EI;

    /* renamed from: EJ */
    private String f3281EJ;

    /* renamed from: EK */
    private String f3282EK;

    /* renamed from: EL */
    private String f3283EL;

    /* renamed from: EM */
    private String f3284EM;

    /* renamed from: EN */
    private String f3285EN;

    /* renamed from: EO */
    private String f3286EO;

    /* renamed from: EP */
    private String f3287EP;

    /* renamed from: EQ */
    private String f3288EQ;

    /* renamed from: ER */
    private C1402ib f3289ER;

    /* renamed from: ES */
    private String f3290ES;

    /* renamed from: ET */
    private String f3291ET;

    /* renamed from: EU */
    private String f3292EU;

    /* renamed from: EV */
    private C1402ib f3293EV;

    /* renamed from: EW */
    private C1402ib f3294EW;

    /* renamed from: EX */
    private C1402ib f3295EX;

    /* renamed from: EY */
    private List<C1402ib> f3296EY;

    /* renamed from: EZ */
    private String f3297EZ;

    /* renamed from: Eq */
    private final Set<Integer> f3298Eq;

    /* renamed from: Er */
    private C1402ib f3299Er;

    /* renamed from: Es */
    private List<String> f3300Es;

    /* renamed from: Et */
    private C1402ib f3301Et;

    /* renamed from: Eu */
    private String f3302Eu;

    /* renamed from: Ev */
    private String f3303Ev;

    /* renamed from: Ew */
    private String f3304Ew;

    /* renamed from: Ex */
    private List<C1402ib> f3305Ex;

    /* renamed from: Ey */
    private int f3306Ey;

    /* renamed from: Ez */
    private List<C1402ib> f3307Ez;

    /* renamed from: Fa */
    private String f3308Fa;

    /* renamed from: Fb */
    private String f3309Fb;

    /* renamed from: Fc */
    private String f3310Fc;

    /* renamed from: Fd */
    private C1402ib f3311Fd;

    /* renamed from: Fe */
    private String f3312Fe;

    /* renamed from: Ff */
    private String f3313Ff;

    /* renamed from: Fg */
    private String f3314Fg;

    /* renamed from: Fh */
    private C1402ib f3315Fh;

    /* renamed from: Fi */
    private String f3316Fi;

    /* renamed from: Fj */
    private String f3317Fj;

    /* renamed from: Fk */
    private String f3318Fk;

    /* renamed from: Fl */
    private String f3319Fl;

    /* renamed from: iH */
    private String f3320iH;

    /* renamed from: kg */
    private final int f3321kg;
    private String mName;

    /* renamed from: sJ */
    private String f3322sJ;

    /* renamed from: uS */
    private String f3323uS;

    /* renamed from: xw */
    private double f3324xw;

    /* renamed from: xx */
    private double f3325xx;

    static {
        f3270Ep.put("about", C1115es.C1116a.m2671a("about", 2, C1402ib.class));
        f3270Ep.put("additionalName", C1115es.C1116a.m2678h("additionalName", 3));
        f3270Ep.put("address", C1115es.C1116a.m2671a("address", 4, C1402ib.class));
        f3270Ep.put("addressCountry", C1115es.C1116a.m2677g("addressCountry", 5));
        f3270Ep.put("addressLocality", C1115es.C1116a.m2677g("addressLocality", 6));
        f3270Ep.put("addressRegion", C1115es.C1116a.m2677g("addressRegion", 7));
        f3270Ep.put("associated_media", C1115es.C1116a.m2672b("associated_media", 8, C1402ib.class));
        f3270Ep.put("attendeeCount", C1115es.C1116a.m2674d("attendeeCount", 9));
        f3270Ep.put("attendees", C1115es.C1116a.m2672b("attendees", 10, C1402ib.class));
        f3270Ep.put("audio", C1115es.C1116a.m2671a("audio", 11, C1402ib.class));
        f3270Ep.put("author", C1115es.C1116a.m2672b("author", 12, C1402ib.class));
        f3270Ep.put("bestRating", C1115es.C1116a.m2677g("bestRating", 13));
        f3270Ep.put("birthDate", C1115es.C1116a.m2677g("birthDate", 14));
        f3270Ep.put("byArtist", C1115es.C1116a.m2671a("byArtist", 15, C1402ib.class));
        f3270Ep.put("caption", C1115es.C1116a.m2677g("caption", 16));
        f3270Ep.put("contentSize", C1115es.C1116a.m2677g("contentSize", 17));
        f3270Ep.put("contentUrl", C1115es.C1116a.m2677g("contentUrl", 18));
        f3270Ep.put("contributor", C1115es.C1116a.m2672b("contributor", 19, C1402ib.class));
        f3270Ep.put("dateCreated", C1115es.C1116a.m2677g("dateCreated", 20));
        f3270Ep.put("dateModified", C1115es.C1116a.m2677g("dateModified", 21));
        f3270Ep.put("datePublished", C1115es.C1116a.m2677g("datePublished", 22));
        f3270Ep.put(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION, C1115es.C1116a.m2677g(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION, 23));
        f3270Ep.put("duration", C1115es.C1116a.m2677g("duration", 24));
        f3270Ep.put("embedUrl", C1115es.C1116a.m2677g("embedUrl", 25));
        f3270Ep.put("endDate", C1115es.C1116a.m2677g("endDate", 26));
        f3270Ep.put("familyName", C1115es.C1116a.m2677g("familyName", 27));
        f3270Ep.put(MMAdView.KEY_GENDER, C1115es.C1116a.m2677g(MMAdView.KEY_GENDER, 28));
        f3270Ep.put(MMAdViewSDK.Event.INTENT_MAPS, C1115es.C1116a.m2671a(MMAdViewSDK.Event.INTENT_MAPS, 29, C1402ib.class));
        f3270Ep.put("givenName", C1115es.C1116a.m2677g("givenName", 30));
        f3270Ep.put("height", C1115es.C1116a.m2677g("height", 31));
        f3270Ep.put(Constants.APP_ID, C1115es.C1116a.m2677g(Constants.APP_ID, 32));
        f3270Ep.put("image", C1115es.C1116a.m2677g("image", 33));
        f3270Ep.put("inAlbum", C1115es.C1116a.m2671a("inAlbum", 34, C1402ib.class));
        f3270Ep.put("latitude", C1115es.C1116a.m2675e("latitude", 36));
        f3270Ep.put("location", C1115es.C1116a.m2671a("location", 37, C1402ib.class));
        f3270Ep.put("longitude", C1115es.C1116a.m2675e("longitude", 38));
        f3270Ep.put("name", C1115es.C1116a.m2677g("name", 39));
        f3270Ep.put("partOfTVSeries", C1115es.C1116a.m2671a("partOfTVSeries", 40, C1402ib.class));
        f3270Ep.put("performers", C1115es.C1116a.m2672b("performers", 41, C1402ib.class));
        f3270Ep.put("playerType", C1115es.C1116a.m2677g("playerType", 42));
        f3270Ep.put("postOfficeBoxNumber", C1115es.C1116a.m2677g("postOfficeBoxNumber", 43));
        f3270Ep.put("postalCode", C1115es.C1116a.m2677g("postalCode", 44));
        f3270Ep.put("ratingValue", C1115es.C1116a.m2677g("ratingValue", 45));
        f3270Ep.put("reviewRating", C1115es.C1116a.m2671a("reviewRating", 46, C1402ib.class));
        f3270Ep.put("startDate", C1115es.C1116a.m2677g("startDate", 47));
        f3270Ep.put("streetAddress", C1115es.C1116a.m2677g("streetAddress", 48));
        f3270Ep.put("text", C1115es.C1116a.m2677g("text", 49));
        f3270Ep.put("thumbnail", C1115es.C1116a.m2671a("thumbnail", 50, C1402ib.class));
        f3270Ep.put(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_THUMBNAIL_URL, C1115es.C1116a.m2677g(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_THUMBNAIL_URL, 51));
        f3270Ep.put("tickerSymbol", C1115es.C1116a.m2677g("tickerSymbol", 52));
        f3270Ep.put(ServerProtocol.DIALOG_PARAM_TYPE, C1115es.C1116a.m2677g(ServerProtocol.DIALOG_PARAM_TYPE, 53));
        f3270Ep.put(PlusShare.KEY_CALL_TO_ACTION_URL, C1115es.C1116a.m2677g(PlusShare.KEY_CALL_TO_ACTION_URL, 54));
        f3270Ep.put("width", C1115es.C1116a.m2677g("width", 55));
        f3270Ep.put("worstRating", C1115es.C1116a.m2677g("worstRating", 56));
    }

    public C1402ib() {
        this.f3321kg = 1;
        this.f3298Eq = new HashSet();
    }

    C1402ib(Set<Integer> set, int i, C1402ib ibVar, List<String> list, C1402ib ibVar2, String str, String str2, String str3, List<C1402ib> list2, int i2, List<C1402ib> list3, C1402ib ibVar3, List<C1402ib> list4, String str4, String str5, C1402ib ibVar4, String str6, String str7, String str8, List<C1402ib> list5, String str9, String str10, String str11, String str12, String str13, String str14, String str15, String str16, String str17, C1402ib ibVar5, String str18, String str19, String str20, String str21, C1402ib ibVar6, double d, C1402ib ibVar7, double d2, String str22, C1402ib ibVar8, List<C1402ib> list6, String str23, String str24, String str25, String str26, C1402ib ibVar9, String str27, String str28, String str29, C1402ib ibVar10, String str30, String str31, String str32, String str33, String str34, String str35) {
        this.f3298Eq = set;
        this.f3321kg = i;
        this.f3299Er = ibVar;
        this.f3300Es = list;
        this.f3301Et = ibVar2;
        this.f3302Eu = str;
        this.f3303Ev = str2;
        this.f3304Ew = str3;
        this.f3305Ex = list2;
        this.f3306Ey = i2;
        this.f3307Ez = list3;
        this.f3272EA = ibVar3;
        this.f3273EB = list4;
        this.f3274EC = str4;
        this.f3275ED = str5;
        this.f3276EE = ibVar4;
        this.f3277EF = str6;
        this.f3278EG = str7;
        this.f3279EH = str8;
        this.f3280EI = list5;
        this.f3281EJ = str9;
        this.f3282EK = str10;
        this.f3283EL = str11;
        this.f3322sJ = str12;
        this.f3284EM = str13;
        this.f3285EN = str14;
        this.f3286EO = str15;
        this.f3287EP = str16;
        this.f3288EQ = str17;
        this.f3289ER = ibVar5;
        this.f3290ES = str18;
        this.f3291ET = str19;
        this.f3323uS = str20;
        this.f3292EU = str21;
        this.f3293EV = ibVar6;
        this.f3324xw = d;
        this.f3294EW = ibVar7;
        this.f3325xx = d2;
        this.mName = str22;
        this.f3295EX = ibVar8;
        this.f3296EY = list6;
        this.f3297EZ = str23;
        this.f3308Fa = str24;
        this.f3309Fb = str25;
        this.f3310Fc = str26;
        this.f3311Fd = ibVar9;
        this.f3312Fe = str27;
        this.f3313Ff = str28;
        this.f3314Fg = str29;
        this.f3315Fh = ibVar10;
        this.f3316Fi = str30;
        this.f3317Fj = str31;
        this.f3271AI = str32;
        this.f3320iH = str33;
        this.f3318Fk = str34;
        this.f3319Fl = str35;
    }

    public C1402ib(Set<Integer> set, C1402ib ibVar, List<String> list, C1402ib ibVar2, String str, String str2, String str3, List<C1402ib> list2, int i, List<C1402ib> list3, C1402ib ibVar3, List<C1402ib> list4, String str4, String str5, C1402ib ibVar4, String str6, String str7, String str8, List<C1402ib> list5, String str9, String str10, String str11, String str12, String str13, String str14, String str15, String str16, String str17, C1402ib ibVar5, String str18, String str19, String str20, String str21, C1402ib ibVar6, double d, C1402ib ibVar7, double d2, String str22, C1402ib ibVar8, List<C1402ib> list6, String str23, String str24, String str25, String str26, C1402ib ibVar9, String str27, String str28, String str29, C1402ib ibVar10, String str30, String str31, String str32, String str33, String str34, String str35) {
        this.f3298Eq = set;
        this.f3321kg = 1;
        this.f3299Er = ibVar;
        this.f3300Es = list;
        this.f3301Et = ibVar2;
        this.f3302Eu = str;
        this.f3303Ev = str2;
        this.f3304Ew = str3;
        this.f3305Ex = list2;
        this.f3306Ey = i;
        this.f3307Ez = list3;
        this.f3272EA = ibVar3;
        this.f3273EB = list4;
        this.f3274EC = str4;
        this.f3275ED = str5;
        this.f3276EE = ibVar4;
        this.f3277EF = str6;
        this.f3278EG = str7;
        this.f3279EH = str8;
        this.f3280EI = list5;
        this.f3281EJ = str9;
        this.f3282EK = str10;
        this.f3283EL = str11;
        this.f3322sJ = str12;
        this.f3284EM = str13;
        this.f3285EN = str14;
        this.f3286EO = str15;
        this.f3287EP = str16;
        this.f3288EQ = str17;
        this.f3289ER = ibVar5;
        this.f3290ES = str18;
        this.f3291ET = str19;
        this.f3323uS = str20;
        this.f3292EU = str21;
        this.f3293EV = ibVar6;
        this.f3324xw = d;
        this.f3294EW = ibVar7;
        this.f3325xx = d2;
        this.mName = str22;
        this.f3295EX = ibVar8;
        this.f3296EY = list6;
        this.f3297EZ = str23;
        this.f3308Fa = str24;
        this.f3309Fb = str25;
        this.f3310Fc = str26;
        this.f3311Fd = ibVar9;
        this.f3312Fe = str27;
        this.f3313Ff = str28;
        this.f3314Fg = str29;
        this.f3315Fh = ibVar10;
        this.f3316Fi = str30;
        this.f3317Fj = str31;
        this.f3271AI = str32;
        this.f3320iH = str33;
        this.f3318Fk = str34;
        this.f3319Fl = str35;
    }

    /* access modifiers changed from: protected */
    /* renamed from: V */
    public Object mo7597V(String str) {
        return null;
    }

    /* access modifiers changed from: protected */
    /* renamed from: W */
    public boolean mo7598W(String str) {
        return false;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public boolean mo7602a(C1115es.C1116a aVar) {
        return this.f3298Eq.contains(Integer.valueOf(aVar.mo7615cq()));
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public Object mo7603b(C1115es.C1116a aVar) {
        switch (aVar.mo7615cq()) {
            case 2:
                return this.f3299Er;
            case 3:
                return this.f3300Es;
            case 4:
                return this.f3301Et;
            case 5:
                return this.f3302Eu;
            case 6:
                return this.f3303Ev;
            case 7:
                return this.f3304Ew;
            case 8:
                return this.f3305Ex;
            case 9:
                return Integer.valueOf(this.f3306Ey);
            case 10:
                return this.f3307Ez;
            case 11:
                return this.f3272EA;
            case 12:
                return this.f3273EB;
            case 13:
                return this.f3274EC;
            case 14:
                return this.f3275ED;
            case 15:
                return this.f3276EE;
            case 16:
                return this.f3277EF;
            case 17:
                return this.f3278EG;
            case 18:
                return this.f3279EH;
            case 19:
                return this.f3280EI;
            case MMError.DISPLAY_AD_NOT_READY /*20*/:
                return this.f3281EJ;
            case MMError.DISPLAY_AD_EXPIRED /*21*/:
                return this.f3282EK;
            case MMError.DISPLAY_AD_NOT_FOUND /*22*/:
                return this.f3283EL;
            case MMError.DISPLAY_AD_ALREADY_DISPLAYED /*23*/:
                return this.f3322sJ;
            case MMError.DISPLAY_AD_NOT_PERMITTED /*24*/:
                return this.f3284EM;
            case 25:
                return this.f3285EN;
            case 26:
                return this.f3286EO;
            case 27:
                return this.f3287EP;
            case 28:
                return this.f3288EQ;
            case 29:
                return this.f3289ER;
            case 30:
                return this.f3290ES;
            case 31:
                return this.f3291ET;
            case 32:
                return this.f3323uS;
            case 33:
                return this.f3292EU;
            case 34:
                return this.f3293EV;
            case 36:
                return Double.valueOf(this.f3324xw);
            case 37:
                return this.f3294EW;
            case 38:
                return Double.valueOf(this.f3325xx);
            case 39:
                return this.mName;
            case 40:
                return this.f3295EX;
            case 41:
                return this.f3296EY;
            case 42:
                return this.f3297EZ;
            case 43:
                return this.f3308Fa;
            case 44:
                return this.f3309Fb;
            case 45:
                return this.f3310Fc;
            case 46:
                return this.f3311Fd;
            case 47:
                return this.f3312Fe;
            case 48:
                return this.f3313Ff;
            case 49:
                return this.f3314Fg;
            case 50:
                return this.f3315Fh;
            case 51:
                return this.f3316Fi;
            case 52:
                return this.f3317Fj;
            case 53:
                return this.f3271AI;
            case 54:
                return this.f3320iH;
            case 55:
                return this.f3318Fk;
            case 56:
                return this.f3319Fl;
            default:
                throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
        }
    }

    /* renamed from: cj */
    public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
        return f3270Ep;
    }

    public int describeContents() {
        C1403ic icVar = CREATOR;
        return 0;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof C1402ib)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        C1402ib ibVar = (C1402ib) obj;
        for (C1115es.C1116a next : f3270Ep.values()) {
            if (mo7602a(next)) {
                if (!ibVar.mo7602a(next)) {
                    return false;
                }
                if (!mo7603b(next).equals(ibVar.mo7603b(next))) {
                    return false;
                }
            } else if (ibVar.mo7602a(next)) {
                return false;
            }
        }
        return true;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fa */
    public Set<Integer> mo8364fa() {
        return this.f3298Eq;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fb */
    public C1402ib mo8365fb() {
        return this.f3299Er;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fc */
    public C1402ib mo8366fc() {
        return this.f3301Et;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fd */
    public List<C1402ib> mo8367fd() {
        return this.f3305Ex;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fe */
    public List<C1402ib> mo8368fe() {
        return this.f3307Ez;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: ff */
    public C1402ib mo8369ff() {
        return this.f3272EA;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fg */
    public List<C1402ib> mo8370fg() {
        return this.f3273EB;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fh */
    public C1402ib mo8371fh() {
        return this.f3276EE;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fi */
    public List<C1402ib> mo8372fi() {
        return this.f3280EI;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fj */
    public C1402ib mo8373fj() {
        return this.f3289ER;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fk */
    public C1402ib mo8374fk() {
        return this.f3293EV;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fl */
    public C1402ib mo8375fl() {
        return this.f3294EW;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fm */
    public C1402ib mo8376fm() {
        return this.f3295EX;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fn */
    public List<C1402ib> mo8377fn() {
        return this.f3296EY;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fo */
    public C1402ib mo8378fo() {
        return this.f3311Fd;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fp */
    public C1402ib mo8379fp() {
        return this.f3315Fh;
    }

    /* renamed from: fq */
    public C1402ib freeze() {
        return this;
    }

    public ItemScope getAbout() {
        return this.f3299Er;
    }

    public List<String> getAdditionalName() {
        return this.f3300Es;
    }

    public ItemScope getAddress() {
        return this.f3301Et;
    }

    public String getAddressCountry() {
        return this.f3302Eu;
    }

    public String getAddressLocality() {
        return this.f3303Ev;
    }

    public String getAddressRegion() {
        return this.f3304Ew;
    }

    public List<ItemScope> getAssociated_media() {
        return (ArrayList) this.f3305Ex;
    }

    public int getAttendeeCount() {
        return this.f3306Ey;
    }

    public List<ItemScope> getAttendees() {
        return (ArrayList) this.f3307Ez;
    }

    public ItemScope getAudio() {
        return this.f3272EA;
    }

    public List<ItemScope> getAuthor() {
        return (ArrayList) this.f3273EB;
    }

    public String getBestRating() {
        return this.f3274EC;
    }

    public String getBirthDate() {
        return this.f3275ED;
    }

    public ItemScope getByArtist() {
        return this.f3276EE;
    }

    public String getCaption() {
        return this.f3277EF;
    }

    public String getContentSize() {
        return this.f3278EG;
    }

    public String getContentUrl() {
        return this.f3279EH;
    }

    public List<ItemScope> getContributor() {
        return (ArrayList) this.f3280EI;
    }

    public String getDateCreated() {
        return this.f3281EJ;
    }

    public String getDateModified() {
        return this.f3282EK;
    }

    public String getDatePublished() {
        return this.f3283EL;
    }

    public String getDescription() {
        return this.f3322sJ;
    }

    public String getDuration() {
        return this.f3284EM;
    }

    public String getEmbedUrl() {
        return this.f3285EN;
    }

    public String getEndDate() {
        return this.f3286EO;
    }

    public String getFamilyName() {
        return this.f3287EP;
    }

    public String getGender() {
        return this.f3288EQ;
    }

    public ItemScope getGeo() {
        return this.f3289ER;
    }

    public String getGivenName() {
        return this.f3290ES;
    }

    public String getHeight() {
        return this.f3291ET;
    }

    public String getId() {
        return this.f3323uS;
    }

    public String getImage() {
        return this.f3292EU;
    }

    public ItemScope getInAlbum() {
        return this.f3293EV;
    }

    public double getLatitude() {
        return this.f3324xw;
    }

    public ItemScope getLocation() {
        return this.f3294EW;
    }

    public double getLongitude() {
        return this.f3325xx;
    }

    public String getName() {
        return this.mName;
    }

    public ItemScope getPartOfTVSeries() {
        return this.f3295EX;
    }

    public List<ItemScope> getPerformers() {
        return (ArrayList) this.f3296EY;
    }

    public String getPlayerType() {
        return this.f3297EZ;
    }

    public String getPostOfficeBoxNumber() {
        return this.f3308Fa;
    }

    public String getPostalCode() {
        return this.f3309Fb;
    }

    public String getRatingValue() {
        return this.f3310Fc;
    }

    public ItemScope getReviewRating() {
        return this.f3311Fd;
    }

    public String getStartDate() {
        return this.f3312Fe;
    }

    public String getStreetAddress() {
        return this.f3313Ff;
    }

    public String getText() {
        return this.f3314Fg;
    }

    public ItemScope getThumbnail() {
        return this.f3315Fh;
    }

    public String getThumbnailUrl() {
        return this.f3316Fi;
    }

    public String getTickerSymbol() {
        return this.f3317Fj;
    }

    public String getType() {
        return this.f3271AI;
    }

    public String getUrl() {
        return this.f3320iH;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3321kg;
    }

    public String getWidth() {
        return this.f3318Fk;
    }

    public String getWorstRating() {
        return this.f3319Fl;
    }

    public boolean hasAbout() {
        return this.f3298Eq.contains(2);
    }

    public boolean hasAdditionalName() {
        return this.f3298Eq.contains(3);
    }

    public boolean hasAddress() {
        return this.f3298Eq.contains(4);
    }

    public boolean hasAddressCountry() {
        return this.f3298Eq.contains(5);
    }

    public boolean hasAddressLocality() {
        return this.f3298Eq.contains(6);
    }

    public boolean hasAddressRegion() {
        return this.f3298Eq.contains(7);
    }

    public boolean hasAssociated_media() {
        return this.f3298Eq.contains(8);
    }

    public boolean hasAttendeeCount() {
        return this.f3298Eq.contains(9);
    }

    public boolean hasAttendees() {
        return this.f3298Eq.contains(10);
    }

    public boolean hasAudio() {
        return this.f3298Eq.contains(11);
    }

    public boolean hasAuthor() {
        return this.f3298Eq.contains(12);
    }

    public boolean hasBestRating() {
        return this.f3298Eq.contains(13);
    }

    public boolean hasBirthDate() {
        return this.f3298Eq.contains(14);
    }

    public boolean hasByArtist() {
        return this.f3298Eq.contains(15);
    }

    public boolean hasCaption() {
        return this.f3298Eq.contains(16);
    }

    public boolean hasContentSize() {
        return this.f3298Eq.contains(17);
    }

    public boolean hasContentUrl() {
        return this.f3298Eq.contains(18);
    }

    public boolean hasContributor() {
        return this.f3298Eq.contains(19);
    }

    public boolean hasDateCreated() {
        return this.f3298Eq.contains(20);
    }

    public boolean hasDateModified() {
        return this.f3298Eq.contains(21);
    }

    public boolean hasDatePublished() {
        return this.f3298Eq.contains(22);
    }

    public boolean hasDescription() {
        return this.f3298Eq.contains(23);
    }

    public boolean hasDuration() {
        return this.f3298Eq.contains(24);
    }

    public boolean hasEmbedUrl() {
        return this.f3298Eq.contains(25);
    }

    public boolean hasEndDate() {
        return this.f3298Eq.contains(26);
    }

    public boolean hasFamilyName() {
        return this.f3298Eq.contains(27);
    }

    public boolean hasGender() {
        return this.f3298Eq.contains(28);
    }

    public boolean hasGeo() {
        return this.f3298Eq.contains(29);
    }

    public boolean hasGivenName() {
        return this.f3298Eq.contains(30);
    }

    public boolean hasHeight() {
        return this.f3298Eq.contains(31);
    }

    public boolean hasId() {
        return this.f3298Eq.contains(32);
    }

    public boolean hasImage() {
        return this.f3298Eq.contains(33);
    }

    public boolean hasInAlbum() {
        return this.f3298Eq.contains(34);
    }

    public boolean hasLatitude() {
        return this.f3298Eq.contains(36);
    }

    public boolean hasLocation() {
        return this.f3298Eq.contains(37);
    }

    public boolean hasLongitude() {
        return this.f3298Eq.contains(38);
    }

    public boolean hasName() {
        return this.f3298Eq.contains(39);
    }

    public boolean hasPartOfTVSeries() {
        return this.f3298Eq.contains(40);
    }

    public boolean hasPerformers() {
        return this.f3298Eq.contains(41);
    }

    public boolean hasPlayerType() {
        return this.f3298Eq.contains(42);
    }

    public boolean hasPostOfficeBoxNumber() {
        return this.f3298Eq.contains(43);
    }

    public boolean hasPostalCode() {
        return this.f3298Eq.contains(44);
    }

    public boolean hasRatingValue() {
        return this.f3298Eq.contains(45);
    }

    public boolean hasReviewRating() {
        return this.f3298Eq.contains(46);
    }

    public boolean hasStartDate() {
        return this.f3298Eq.contains(47);
    }

    public boolean hasStreetAddress() {
        return this.f3298Eq.contains(48);
    }

    public boolean hasText() {
        return this.f3298Eq.contains(49);
    }

    public boolean hasThumbnail() {
        return this.f3298Eq.contains(50);
    }

    public boolean hasThumbnailUrl() {
        return this.f3298Eq.contains(51);
    }

    public boolean hasTickerSymbol() {
        return this.f3298Eq.contains(52);
    }

    public boolean hasType() {
        return this.f3298Eq.contains(53);
    }

    public boolean hasUrl() {
        return this.f3298Eq.contains(54);
    }

    public boolean hasWidth() {
        return this.f3298Eq.contains(55);
    }

    public boolean hasWorstRating() {
        return this.f3298Eq.contains(56);
    }

    public int hashCode() {
        int i = 0;
        Iterator<C1115es.C1116a<?, ?>> it = f3270Ep.values().iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            C1115es.C1116a next = it.next();
            if (mo7602a(next)) {
                i = mo7603b(next).hashCode() + i2 + next.mo7615cq();
            } else {
                i = i2;
            }
        }
    }

    public boolean isDataValid() {
        return true;
    }

    public void writeToParcel(Parcel out, int flags) {
        C1403ic icVar = CREATOR;
        C1403ic.m3770a(this, out, flags);
    }
}
