package com.google.ads.internal;

import com.google.ads.util.C0508b;

/* renamed from: com.google.ads.internal.b */
public final class C0466b extends Exception {

    /* renamed from: a */
    public final boolean f845a;

    public C0466b(String str, boolean z) {
        super(str);
        this.f845a = z;
    }

    public C0466b(String str, boolean z, Throwable th) {
        super(str, th);
        this.f845a = z;
    }

    /* renamed from: a */
    public void mo3652a(String str) {
        C0508b.m1030b(mo3654c(str));
        C0508b.m1027a((String) null, (Throwable) this);
    }

    /* renamed from: b */
    public void mo3653b(String str) {
        String c = mo3654c(str);
        if (!this.f845a) {
            this = null;
        }
        throw new RuntimeException(c, this);
    }

    /* renamed from: c */
    public String mo3654c(String str) {
        if (this.f845a) {
            return str + ": " + getMessage();
        }
        return str;
    }
}
