package com.chartboost.sdk.impl;

import java.io.Serializable;
import java.util.Date;

/* renamed from: com.chartboost.sdk.impl.as */
public class C0120as implements Serializable, Comparable<C0120as> {

    /* renamed from: a */
    static final boolean f176a = Boolean.getBoolean("DEBUG.DBTIMESTAMP");

    /* renamed from: b */
    final int f177b = 0;

    /* renamed from: c */
    final Date f178c = null;

    /* renamed from: a */
    public int mo1323a() {
        if (this.f178c == null) {
            return 0;
        }
        return (int) (this.f178c.getTime() / 1000);
    }

    /* renamed from: b */
    public int mo1325b() {
        return this.f177b;
    }

    public String toString() {
        return "TS time:" + this.f178c + " inc:" + this.f177b;
    }

    /* renamed from: a */
    public int compareTo(C0120as asVar) {
        if (mo1323a() != asVar.mo1323a()) {
            return mo1323a() - asVar.mo1323a();
        }
        return mo1325b() - asVar.mo1325b();
    }

    public int hashCode() {
        return ((this.f177b + 31) * 31) + mo1323a();
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof C0120as)) {
            return false;
        }
        C0120as asVar = (C0120as) obj;
        if (mo1323a() == asVar.mo1323a() && mo1325b() == asVar.mo1325b()) {
            return true;
        }
        return false;
    }
}
