package com.mopub.mobileads;
/* loaded from: classes.dex */
abstract class MraidProperty {
    public abstract String toJsonPair();

    private String sanitize(String str) {
        return str != null ? str.replaceAll("[^a-zA-Z0-9_,:\\s\\{\\}\\'\\\"]", "") : "";
    }

    public String toString() {
        return sanitize(toJsonPair());
    }
}
