package com.google.ads;

import android.content.Context;
import android.location.Location;
import android.text.TextUtils;
import com.google.ads.doubleclick.DfpExtras;
import com.google.ads.mediation.NetworkExtras;
import com.google.ads.mediation.admob.AdMobAdapterExtras;
import com.google.ads.util.AdUtil;
import com.google.ads.util.C0508b;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class AdRequest {
    public static final String LOGTAG = "Ads";
    public static final String TEST_EMULATOR = AdUtil.m1001b("emulator");
    public static final String VERSION = "6.2.0";

    /* renamed from: a */
    private static final SimpleDateFormat f701a = new SimpleDateFormat("yyyyMMdd");

    /* renamed from: b */
    private static Method f702b;

    /* renamed from: c */
    private static Method f703c;

    /* renamed from: d */
    private Gender f704d = null;

    /* renamed from: e */
    private Date f705e = null;

    /* renamed from: f */
    private Set<String> f706f = null;

    /* renamed from: g */
    private Map<String, Object> f707g = null;

    /* renamed from: h */
    private final Map<Class<?>, NetworkExtras> f708h = new HashMap();

    /* renamed from: i */
    private Location f709i = null;

    /* renamed from: j */
    private boolean f710j = false;

    /* renamed from: k */
    private boolean f711k = false;

    /* renamed from: l */
    private Set<String> f712l = null;

    public enum Gender {
        UNKNOWN,
        MALE,
        FEMALE
    }

    static {
        f702b = null;
        f703c = null;
        try {
            for (Method method : Class.forName("com.google.analytics.tracking.android.AdMobInfo").getMethods()) {
                if (method.getName().equals("getInstance") && method.getParameterTypes().length == 0) {
                    f702b = method;
                } else if (method.getName().equals("getJoinIds") && method.getParameterTypes().length == 0) {
                    f703c = method;
                }
            }
            if (f702b == null || f703c == null) {
                f702b = null;
                f703c = null;
                C0508b.m1036e("No Google Analytics: Library Incompatible.");
            }
        } catch (ClassNotFoundException e) {
            C0508b.m1026a("No Google Analytics: Library Not Found.");
        } catch (Throwable th) {
            C0508b.m1026a("No Google Analytics: Error Loading Library");
        }
    }

    public enum ErrorCode {
        INVALID_REQUEST("Invalid Ad request."),
        NO_FILL("Ad request successful, but no ad returned due to lack of ad inventory."),
        NETWORK_ERROR("A network error occurred."),
        INTERNAL_ERROR("There was an internal error.");
        

        /* renamed from: a */
        private final String f714a;

        private ErrorCode(String description) {
            this.f714a = description;
        }

        public String toString() {
            return this.f714a;
        }
    }

    public AdRequest setGender(Gender gender) {
        this.f704d = gender;
        return this;
    }

    public Gender getGender() {
        return this.f704d;
    }

    @Deprecated
    public AdRequest setBirthday(String birthday) {
        if (birthday == "" || birthday == null) {
            this.f705e = null;
        } else {
            try {
                this.f705e = f701a.parse(birthday);
            } catch (ParseException e) {
                C0508b.m1030b("Birthday format invalid.  Expected 'YYYYMMDD' where 'YYYY' is a 4 digit year, 'MM' is a two digit month, and 'DD' is a two digit day.  Birthday value ignored");
                this.f705e = null;
            }
        }
        return this;
    }

    public AdRequest setBirthday(Date birthday) {
        if (birthday == null) {
            this.f705e = null;
        } else {
            this.f705e = new Date(birthday.getTime());
        }
        return this;
    }

    public AdRequest setBirthday(Calendar calendar) {
        if (calendar == null) {
            this.f705e = null;
        } else {
            setBirthday(calendar.getTime());
        }
        return this;
    }

    public Date getBirthday() {
        return this.f705e;
    }

    public AdRequest clearBirthday() {
        this.f705e = null;
        return this;
    }

    @Deprecated
    public AdRequest setPlusOneOptOut(boolean plusOneOptOut) {
        m664a().setPlusOneOptOut(plusOneOptOut);
        return this;
    }

    @Deprecated
    public boolean getPlusOneOptOut() {
        return m664a().getPlusOneOptOut();
    }

    public AdRequest setKeywords(Set<String> keywords) {
        this.f706f = keywords;
        return this;
    }

    public AdRequest addKeyword(String keyword) {
        if (this.f706f == null) {
            this.f706f = new HashSet();
        }
        this.f706f.add(keyword);
        return this;
    }

    public AdRequest addKeywords(Set<String> keywords) {
        if (this.f706f == null) {
            this.f706f = new HashSet();
        }
        this.f706f.addAll(keywords);
        return this;
    }

    public Set<String> getKeywords() {
        if (this.f706f == null) {
            return null;
        }
        return Collections.unmodifiableSet(this.f706f);
    }

    /* renamed from: a */
    private synchronized AdMobAdapterExtras m664a() {
        if (getNetworkExtras(AdMobAdapterExtras.class) == null) {
            setNetworkExtras(new AdMobAdapterExtras());
        }
        return (AdMobAdapterExtras) getNetworkExtras(AdMobAdapterExtras.class);
    }

    @Deprecated
    public AdRequest setExtras(Map<String, Object> extras) {
        m664a().setExtras(extras);
        return this;
    }

    @Deprecated
    public AdRequest addExtra(String key, Object value) {
        AdMobAdapterExtras a = m664a();
        if (a.getExtras() == null) {
            a.setExtras(new HashMap());
        }
        a.getExtras().put(key, value);
        return this;
    }

    public AdRequest setNetworkExtras(NetworkExtras extras) {
        if (extras != null) {
            this.f708h.put(extras.getClass(), extras);
        }
        return this;
    }

    public AdRequest removeNetworkExtras(Class<?> extrasClass) {
        this.f708h.remove(extrasClass);
        return this;
    }

    public <T> T getNetworkExtras(Class<T> extrasClass) {
        return this.f708h.get(extrasClass);
    }

    public AdRequest setMediationExtras(Map<String, Object> mediationExtras) {
        this.f707g = mediationExtras;
        return this;
    }

    public AdRequest addMediationExtra(String key, Object value) {
        if (this.f707g == null) {
            this.f707g = new HashMap();
        }
        this.f707g.put(key, value);
        return this;
    }

    public AdRequest setLocation(Location location) {
        this.f709i = location;
        return this;
    }

    public Location getLocation() {
        return this.f709i;
    }

    @Deprecated
    public AdRequest setTesting(boolean testing) {
        this.f710j = testing;
        return this;
    }

    public Map<String, Object> getRequestMap(Context context) {
        String str;
        int i = 1;
        HashMap hashMap = new HashMap();
        if (this.f706f != null) {
            hashMap.put("kw", this.f706f);
        }
        if (this.f704d != null) {
            hashMap.put("cust_gender", Integer.valueOf(this.f704d.ordinal()));
        }
        if (this.f705e != null) {
            hashMap.put("cust_age", f701a.format(this.f705e));
        }
        if (this.f709i != null) {
            hashMap.put("uule", AdUtil.m987a(this.f709i));
        }
        if (this.f710j) {
            hashMap.put("testing", 1);
        }
        if (isTestDevice(context)) {
            hashMap.put("adtest", "on");
        } else if (!this.f711k) {
            if (AdUtil.m1006c()) {
                str = "AdRequest.TEST_EMULATOR";
            } else {
                str = "\"" + AdUtil.m986a(context) + "\"";
            }
            C0508b.m1032c("To get test ads on this device, call adRequest.addTestDevice(" + str + ");");
            this.f711k = true;
        }
        AdMobAdapterExtras adMobAdapterExtras = (AdMobAdapterExtras) getNetworkExtras(AdMobAdapterExtras.class);
        if (adMobAdapterExtras == null || !adMobAdapterExtras.getPlusOneOptOut()) {
            if (!C0434ah.m697a(context)) {
                i = 0;
            }
            hashMap.put("cipa", Integer.valueOf(i));
        } else {
            hashMap.put("pto", 1);
        }
        DfpExtras dfpExtras = (DfpExtras) getNetworkExtras(DfpExtras.class);
        if (dfpExtras != null && dfpExtras.getExtras() != null && !dfpExtras.getExtras().isEmpty()) {
            hashMap.put("extras", dfpExtras.getExtras());
        } else if (!(adMobAdapterExtras == null || adMobAdapterExtras.getExtras() == null || adMobAdapterExtras.getExtras().isEmpty())) {
            hashMap.put("extras", adMobAdapterExtras.getExtras());
        }
        if (dfpExtras != null) {
            String publisherProvidedId = dfpExtras.getPublisherProvidedId();
            if (!TextUtils.isEmpty(publisherProvidedId)) {
                hashMap.put("ppid", publisherProvidedId);
            }
        }
        if (this.f707g != null) {
            hashMap.put("mediation_extras", this.f707g);
        }
        try {
            if (f702b != null) {
                Map map = (Map) f703c.invoke(f702b.invoke((Object) null, new Object[0]), new Object[0]);
                if (map != null && map.size() > 0) {
                    hashMap.put("analytics_join_id", map);
                }
            }
        } catch (Throwable th) {
            C0508b.m1033c("Internal Analytics Error:", th);
        }
        return hashMap;
    }

    public AdRequest addTestDevice(String testDevice) {
        if (this.f712l == null) {
            this.f712l = new HashSet();
        }
        this.f712l.add(testDevice);
        return this;
    }

    public AdRequest setTestDevices(Set<String> testDevices) {
        this.f712l = testDevices;
        return this;
    }

    public boolean isTestDevice(Context context) {
        String a;
        if (this.f712l == null || (a = AdUtil.m986a(context)) == null || !this.f712l.contains(a)) {
            return false;
        }
        return true;
    }
}
