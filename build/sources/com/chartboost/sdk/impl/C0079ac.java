package com.chartboost.sdk.impl;

/* renamed from: com.chartboost.sdk.impl.ac */
public class C0079ac {
    /* renamed from: a */
    public static String m149a(Object obj) {
        StringBuilder sb = new StringBuilder();
        m150a(obj, sb);
        return sb.toString();
    }

    /* renamed from: a */
    public static void m150a(Object obj, StringBuilder sb) {
        C0080ad.m152a().mo1253a(obj, sb);
    }

    /* renamed from: a */
    static void m151a(StringBuilder sb, String str) {
        sb.append("\"");
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if (charAt == '\\') {
                sb.append("\\\\");
            } else if (charAt == '\"') {
                sb.append("\\\"");
            } else if (charAt == 10) {
                sb.append("\\n");
            } else if (charAt == 13) {
                sb.append("\\r");
            } else if (charAt == 9) {
                sb.append("\\t");
            } else if (charAt == 8) {
                sb.append("\\b");
            } else if (charAt >= ' ') {
                sb.append(charAt);
            }
        }
        sb.append("\"");
    }
}
