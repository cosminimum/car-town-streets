package com.apsalar.sdk;

/* compiled from: Apsalar */
class ApsalarItem {
    public Boolean connected = false;
    public String name;
    public Boolean registered = false;
    public Object val;

    public ApsalarItem(String str, Object obj) {
        this.name = str;
        this.val = obj;
    }
}
