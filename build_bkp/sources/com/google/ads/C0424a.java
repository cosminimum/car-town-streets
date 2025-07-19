package com.google.ads;

import com.google.ads.util.C0506a;
import java.util.HashMap;
import java.util.List;

/* renamed from: com.google.ads.a */
public class C0424a {

    /* renamed from: a */
    private final String f724a;

    /* renamed from: b */
    private final String f725b;

    /* renamed from: c */
    private final List<String> f726c;

    /* renamed from: d */
    private final List<String> f727d;

    /* renamed from: e */
    private final HashMap<String, String> f728e;

    public C0424a(String str, String str2, List<String> list, List<String> list2, HashMap<String, String> hashMap) {
        C0506a.m1017a(str2);
        if (str != null) {
            C0506a.m1017a(str);
        }
        this.f724a = str;
        this.f725b = str2;
        this.f726c = list;
        this.f728e = hashMap;
        this.f727d = list2;
    }

    /* renamed from: a */
    public String mo3530a() {
        return this.f724a;
    }

    /* renamed from: b */
    public String mo3531b() {
        return this.f725b;
    }

    /* renamed from: c */
    public List<String> mo3532c() {
        return this.f726c;
    }

    /* renamed from: d */
    public List<String> mo3533d() {
        return this.f727d;
    }

    /* renamed from: e */
    public HashMap<String, String> mo3534e() {
        return this.f728e;
    }
}
