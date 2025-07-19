package com.google.ads.internal;

import android.os.Bundle;
import java.io.Serializable;
import java.util.HashMap;

/* renamed from: com.google.ads.internal.e */
public class C0476e {

    /* renamed from: a */
    private String f920a;

    /* renamed from: b */
    private HashMap<String, String> f921b;

    public C0476e(Bundle bundle) {
        this.f920a = bundle.getString("action");
        this.f921b = m886a(bundle.getSerializable("params"));
    }

    public C0476e(String str) {
        this.f920a = str;
    }

    public C0476e(String str, HashMap<String, String> hashMap) {
        this(str);
        this.f921b = hashMap;
    }

    /* renamed from: a */
    private HashMap<String, String> m886a(Serializable serializable) {
        if (serializable instanceof HashMap) {
            return (HashMap) serializable;
        }
        return null;
    }

    /* renamed from: a */
    public Bundle mo3727a() {
        Bundle bundle = new Bundle();
        bundle.putString("action", this.f920a);
        bundle.putSerializable("params", this.f921b);
        return bundle;
    }

    /* renamed from: b */
    public String mo3728b() {
        return this.f920a;
    }

    /* renamed from: c */
    public HashMap<String, String> mo3729c() {
        return this.f921b;
    }
}
