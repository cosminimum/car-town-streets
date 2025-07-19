package com.chartboost.sdk.impl;

/* renamed from: com.chartboost.sdk.impl.z */
public class C0218z {

    /* renamed from: a */
    final Object f394a;

    /* renamed from: b */
    final String f395b;

    public String toString() {
        return "{ \"$ref\" : \"" + this.f395b + "\", \"$id\" : \"" + this.f394a + "\" }";
    }

    /* renamed from: a */
    public Object mo1518a() {
        return this.f394a;
    }

    /* renamed from: b */
    public String mo1519b() {
        return this.f395b;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        C0218z zVar = (C0218z) o;
        if (this.f394a == null ? zVar.f394a != null : !this.f394a.equals(zVar.f394a)) {
            return false;
        }
        if (this.f395b != null) {
            if (this.f395b.equals(zVar.f395b)) {
                return true;
            }
        } else if (zVar.f395b == null) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        int i;
        int i2 = 0;
        if (this.f394a != null) {
            i = this.f394a.hashCode();
        } else {
            i = 0;
        }
        int i3 = i * 31;
        if (this.f395b != null) {
            i2 = this.f395b.hashCode();
        }
        return i3 + i2;
    }
}
