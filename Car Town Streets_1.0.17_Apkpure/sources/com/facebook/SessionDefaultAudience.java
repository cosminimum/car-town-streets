package com.facebook;
/* loaded from: classes.dex */
public enum SessionDefaultAudience {
    NONE(null),
    ONLY_ME("SELF"),
    FRIENDS("ALL_FRIENDS"),
    EVERYONE("EVERYONE");
    
    private final String nativeProtocolAudience;

    SessionDefaultAudience(String protocol) {
        this.nativeProtocolAudience = protocol;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getNativeProtocolAudience() {
        return this.nativeProtocolAudience;
    }
}
