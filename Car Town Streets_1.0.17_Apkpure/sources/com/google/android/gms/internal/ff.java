package com.google.android.gms.internal;

import java.util.HashMap;
/* loaded from: classes.dex */
public class ff {
    public static void a(StringBuilder sb, HashMap<String, String> hashMap) {
        boolean z;
        sb.append("{");
        boolean z2 = true;
        for (String str : hashMap.keySet()) {
            if (!z2) {
                sb.append(",");
                z = z2;
            } else {
                z = false;
            }
            String str2 = hashMap.get(str);
            sb.append("\"").append(str).append("\":");
            if (str2 == null) {
                sb.append("null");
            } else {
                sb.append("\"").append(str2).append("\"");
            }
            z2 = z;
        }
        sb.append("}");
    }
}
