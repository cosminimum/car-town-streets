package com.apsalar.sdk;
/* compiled from: Apsalar.java */
/* loaded from: classes.dex */
class ApsalarItem {
    public String name;
    public Object val;
    public Boolean connected = false;
    public Boolean registered = false;

    public ApsalarItem(String str, Object obj) {
        this.name = str;
        this.val = obj;
    }
}
