package com.chartboost.sdk.impl;

/* renamed from: com.chartboost.sdk.impl.av */
public class C0123av extends C0122au {

    /* renamed from: b */
    final C0109aj f182b;

    /* renamed from: b */
    public C0109aj mo1336b() {
        return this.f182b;
    }

    public boolean equals(Object o) {
        if (!(o instanceof C0123av)) {
            return false;
        }
        C0123av avVar = (C0123av) o;
        if (!this.f181a.equals(avVar.f181a) || !this.f182b.equals(avVar.f182b)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        return this.f181a.hashCode() ^ this.f182b.hashCode();
    }
}
