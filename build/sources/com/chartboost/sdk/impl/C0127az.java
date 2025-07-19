package com.chartboost.sdk.impl;

import java.io.Serializable;

/* renamed from: com.chartboost.sdk.impl.az */
public class C0127az implements Serializable {

    /* renamed from: a */
    private final String f190a;

    /* renamed from: a */
    public String mo1354a() {
        return this.f190a;
    }

    public boolean equals(Object o) {
        Object o2;
        if (this == o) {
            return true;
        }
        if (o == null) {
            return false;
        }
        if (o instanceof C0127az) {
            o2 = ((C0127az) o).f190a;
        } else if (!(o instanceof String)) {
            return false;
        } else {
            o2 = (String) o;
        }
        if (this.f190a != null) {
            if (this.f190a.equals(o2)) {
                return true;
            }
        } else if (o2 == null) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        if (this.f190a != null) {
            return this.f190a.hashCode();
        }
        return 0;
    }

    public String toString() {
        return this.f190a;
    }
}
