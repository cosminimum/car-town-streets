package com.google.android.gms.internal;

import android.text.TextUtils;
import com.google.ads.AdSize;
import com.google.android.gms.common.images.WebImage;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.google.android.gms.internal.dp */
public class C1059dp {

    /* renamed from: lA */
    private static final C1052dk f2535lA = new C1052dk("MetadataUtils");

    /* renamed from: mx */
    private static final String[] f2536mx = {"Z", "+hh", "+hhmm", "+hh:mm"};

    /* renamed from: my */
    private static final String f2537my = ("yyyyMMdd'T'HHmmss" + f2536mx[0]);

    /* renamed from: G */
    public static Calendar m2443G(String str) {
        if (TextUtils.isEmpty(str)) {
            f2535lA.mo7380b("Input string is empty or null", new Object[0]);
            return null;
        }
        String H = m2444H(str);
        if (TextUtils.isEmpty(H)) {
            f2535lA.mo7380b("Invalid date format", new Object[0]);
            return null;
        }
        String I = m2445I(str);
        String str2 = "yyyyMMdd";
        if (!TextUtils.isEmpty(I)) {
            H = H + "T" + I;
            str2 = I.length() == "HHmmss".length() ? "yyyyMMdd'T'HHmmss" : f2537my;
        }
        Calendar instance = GregorianCalendar.getInstance();
        try {
            instance.setTime(new SimpleDateFormat(str2).parse(H));
            return instance;
        } catch (ParseException e) {
            f2535lA.mo7380b("Error parsing string: %s", e.getMessage());
            return null;
        }
    }

    /* renamed from: H */
    private static String m2444H(String str) {
        if (TextUtils.isEmpty(str)) {
            f2535lA.mo7380b("Input string is empty or null", new Object[0]);
            return null;
        }
        try {
            return str.substring(0, "yyyyMMdd".length());
        } catch (IndexOutOfBoundsException e) {
            f2535lA.mo7381c("Error extracting the date: %s", e.getMessage());
            return null;
        }
    }

    /* renamed from: I */
    private static String m2445I(String str) {
        if (TextUtils.isEmpty(str)) {
            f2535lA.mo7380b("string is empty or null", new Object[0]);
            return null;
        }
        int indexOf = str.indexOf(84);
        int i = indexOf + 1;
        if (indexOf != "yyyyMMdd".length()) {
            f2535lA.mo7380b("T delimeter is not found", new Object[0]);
            return null;
        }
        try {
            String substring = str.substring(i);
            if (substring.length() == "HHmmss".length()) {
                return substring;
            }
            switch (substring.charAt("HHmmss".length())) {
                case '+':
                case '-':
                    if (m2446J(substring)) {
                        return substring.replaceAll("([\\+\\-]\\d\\d):(\\d\\d)", "$1$2");
                    }
                    return null;
                case AdSize.LARGE_AD_HEIGHT:
                    if (substring.length() == "HHmmss".length() + f2536mx[0].length()) {
                        return substring.substring(0, substring.length() - 1) + "+0000";
                    }
                    return null;
                default:
                    return null;
            }
        } catch (IndexOutOfBoundsException e) {
            f2535lA.mo7380b("Error extracting the time substring: %s", e.getMessage());
            return null;
        }
    }

    /* renamed from: J */
    private static boolean m2446J(String str) {
        int length = str.length();
        int length2 = "HHmmss".length();
        return length == f2536mx[1].length() + length2 || length == f2536mx[2].length() + length2 || length == length2 + f2536mx[3].length();
    }

    /* renamed from: a */
    public static String m2447a(Calendar calendar) {
        if (calendar == null) {
            f2535lA.mo7380b("Calendar object cannot be null", new Object[0]);
            return null;
        }
        String str = f2537my;
        if (calendar.get(11) == 0 && calendar.get(12) == 0 && calendar.get(13) == 0) {
            str = "yyyyMMdd";
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(str);
        simpleDateFormat.setTimeZone(calendar.getTimeZone());
        String format = simpleDateFormat.format(calendar.getTime());
        return format.endsWith("+0000") ? format.replace("+0000", f2536mx[0]) : format;
    }

    /* renamed from: a */
    public static void m2448a(List<WebImage> list, JSONObject jSONObject) {
        try {
            list.clear();
            JSONArray jSONArray = jSONObject.getJSONArray("images");
            int length = jSONArray.length();
            for (int i = 0; i < length; i++) {
                try {
                    list.add(new WebImage(jSONArray.getJSONObject(i)));
                } catch (IllegalArgumentException e) {
                }
            }
        } catch (JSONException e2) {
        }
    }

    /* renamed from: a */
    public static void m2449a(JSONObject jSONObject, List<WebImage> list) {
        if (list != null && !list.isEmpty()) {
            JSONArray jSONArray = new JSONArray();
            for (WebImage aP : list) {
                jSONArray.put(aP.mo6009aP());
            }
            try {
                jSONObject.put("images", jSONArray);
            } catch (JSONException e) {
            }
        }
    }
}
