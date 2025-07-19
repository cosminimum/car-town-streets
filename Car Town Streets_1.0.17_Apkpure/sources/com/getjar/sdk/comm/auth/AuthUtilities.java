package com.getjar.sdk.comm.auth;

import com.getjar.sdk.comm.Result;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import com.tapjoy.TapjoyConstants;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class AuthUtilities {
    protected static final String KeyPrefixCaps = "capabilities.";
    protected static final String KeyPrefixClaims = "claims.";

    AuthUtilities() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static String getAuthTokenFromHeaders(Result result) {
        String authToken = null;
        Map<String, List<String>> headers = result.getHeaders();
        if (headers != null) {
            List<String> values = headers.get(AuthManager.AUTHORIZATION_HEADER);
            if (values != null && values.size() > 0) {
                authToken = values.get(0);
            }
            if (StringUtility.isNullOrEmpty(authToken)) {
                List<String> values2 = headers.get(AuthManager.AUTHORIZATION_HEADER_LOWER);
                if (values2 != null && values2.size() > 0) {
                    authToken = values2.get(0);
                }
                if (StringUtility.isNullOrEmpty(authToken)) {
                    List<String> values3 = headers.get(AuthManager.AUTHORIZATION_HEADER_UPPER);
                    if (values3 != null && values3.size() > 0) {
                        authToken = values3.get(0);
                    }
                    if (!StringUtility.isNullOrEmpty(authToken)) {
                        return authToken;
                    }
                }
            }
        }
        return authToken;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static long getTTLFromClaims(Map<String, String> claims, long defaultValue) {
        long ttl = defaultValue;
        Long expiresOnEpoch = null;
        Long expiresInMinutes = null;
        try {
            String expiresInKey = String.format(Locale.US, "%1$sExpiresIn", KeyPrefixClaims);
            String expiresOnKey = String.format(Locale.US, "%1$sExpiresOn", KeyPrefixClaims);
            if (claims.containsKey(expiresInKey)) {
                try {
                    expiresInMinutes = Long.valueOf(Long.parseLong(claims.get(expiresInKey)));
                } catch (Exception e) {
                    Logger.e(Area.AUTH.value(), e.getMessage());
                }
                Logger.i(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: getTTLFromClaims() found expiresInSecs of %1$d", expiresInMinutes));
            }
            if (expiresInMinutes == null && claims.containsKey(expiresOnKey)) {
                try {
                    expiresOnEpoch = Long.valueOf(Long.parseLong(claims.get(expiresOnKey)));
                } catch (Exception e2) {
                    Logger.e(Area.AUTH.value(), e2.getMessage());
                }
                Logger.i(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: getTTLFromClaims() found expiresOnEpoch of %1$d", expiresOnEpoch));
            }
            if (expiresInMinutes != null) {
                ttl = expiresInMinutes.longValue() * TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL;
                if (ttl <= 0) {
                    Logger.w(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: getTTLFromClaims() parsed an ExpiresIn resulting in a TTL of %1$d", Long.valueOf(ttl)));
                    ttl = 0;
                }
            } else if (expiresOnEpoch != null) {
                ttl = expiresOnEpoch.longValue() - System.currentTimeMillis();
                if (ttl <= 0) {
                    Logger.w(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: getTTLFromClaims() parsed an ExpiresOn resulting in a TTL of %1$d", Long.valueOf(ttl)));
                    ttl = 0;
                }
            }
        } catch (Exception e3) {
            Logger.e(Area.AUTH.value(), "AuthFlow: getTTLFromClaims() failed", e3);
        }
        Logger.i(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: getTTLFromClaims() returning a TTL of %1$d", Long.valueOf(ttl)));
        return ttl;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static Map<String, String> getClaimsFromResult(Result result) {
        JSONArray claims;
        JSONArray claims2;
        if (result == null) {
            throw new IllegalArgumentException("'result' cannot be NULL");
        }
        if (!result.isSuccessfulResponse()) {
            throw new IllegalArgumentException("getClaimsFromResult() can only be called for a successful response");
        }
        if (result.getResponseJson() == null) {
            throw new IllegalArgumentException("getClaimsFromResult() can only be called for a result with a response body");
        }
        Map<String, String> resultMap = new HashMap<>();
        if (result != null) {
            try {
                if (result.isSuccessfulResponse() && result.getResponseJson() != null && result.getResponseJson().has("return")) {
                    if (result.getResponseJson().getJSONObject("return").has("claims") && (claims2 = result.getResponseJson().getJSONObject("return").getJSONArray("claims")) != null) {
                        addClaimsToMap(claims2, KeyPrefixClaims, resultMap);
                    }
                    if (result.getResponseJson().getJSONObject("return").has("capabilities") && (claims = result.getResponseJson().getJSONObject("return").getJSONArray("capabilities")) != null) {
                        addClaimsToMap(claims, KeyPrefixCaps, resultMap);
                    }
                }
            } catch (Exception e) {
                Logger.e(Area.AUTH.value(), "AuthFlow: getClaimsFromResult() failed", e);
            }
        }
        return resultMap;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Removed duplicated region for block: B:16:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:18:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.Map<java.lang.String, com.getjar.sdk.comm.auth.SettingsValue> getSettingsFromResult(com.getjar.sdk.comm.Result r12) {
        /*
            if (r12 != 0) goto La
            java.lang.IllegalArgumentException r9 = new java.lang.IllegalArgumentException
            java.lang.String r10 = "'result' cannot be NULL"
            r9.<init>(r10)
            throw r9
        La:
            boolean r9 = r12.isSuccessfulResponse()
            if (r9 != 0) goto L18
            java.lang.IllegalArgumentException r9 = new java.lang.IllegalArgumentException
            java.lang.String r10 = "setSettingsFromResult() can only be called for a successful response"
            r9.<init>(r10)
            throw r9
        L18:
            org.json.JSONObject r9 = r12.getResponseJson()
            if (r9 != 0) goto L26
            java.lang.IllegalArgumentException r9 = new java.lang.IllegalArgumentException
            java.lang.String r10 = "setSettingsFromResult() can only be called for a result with a response body"
            r9.<init>(r10)
            throw r9
        L26:
            r5 = 0
            if (r12 == 0) goto Lc0
            boolean r9 = r12.isSuccessfulResponse()     // Catch: java.lang.Exception -> Lc9
            if (r9 == 0) goto Lc0
            org.json.JSONObject r9 = r12.getResponseJson()     // Catch: java.lang.Exception -> Lc9
            if (r9 == 0) goto Lc0
            org.json.JSONObject r9 = r12.getResponseJson()     // Catch: java.lang.Exception -> Lc9
            java.lang.String r10 = "return"
            boolean r9 = r9.has(r10)     // Catch: java.lang.Exception -> Lc9
            if (r9 == 0) goto Lc0
            org.json.JSONObject r9 = r12.getResponseJson()     // Catch: java.lang.Exception -> Lc9
            java.lang.String r10 = "return"
            org.json.JSONObject r9 = r9.getJSONObject(r10)     // Catch: java.lang.Exception -> Lc9
            java.lang.String r10 = "settings"
            boolean r9 = r9.has(r10)     // Catch: java.lang.Exception -> Lc9
            if (r9 == 0) goto Lc0
            org.json.JSONObject r9 = r12.getResponseJson()     // Catch: java.lang.Exception -> Lc9
            java.lang.String r10 = "return"
            org.json.JSONObject r9 = r9.getJSONObject(r10)     // Catch: java.lang.Exception -> Lc9
            java.lang.String r10 = "settings"
            org.json.JSONArray r4 = r9.getJSONArray(r10)     // Catch: java.lang.Exception -> Lc9
            java.util.HashMap r6 = new java.util.HashMap     // Catch: java.lang.Exception -> Lc9
            int r9 = r4.length()     // Catch: java.lang.Exception -> Lc9
            r6.<init>(r9)     // Catch: java.lang.Exception -> Lc9
            r1 = 0
        L6d:
            int r9 = r4.length()     // Catch: java.lang.Exception -> Lb3
            if (r1 >= r9) goto Lcb
            org.json.JSONObject r3 = r4.getJSONObject(r1)     // Catch: java.lang.Exception -> Lb3
            java.lang.String r9 = "name"
            java.lang.String r2 = r3.getString(r9)     // Catch: java.lang.Exception -> Lb3
            java.lang.String r9 = "value"
            java.lang.String r8 = r3.getString(r9)     // Catch: java.lang.Exception -> Lb3
            java.lang.String r9 = "type"
            java.lang.String r7 = r3.getString(r9)     // Catch: java.lang.Exception -> Lb3
            boolean r9 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r2)     // Catch: java.lang.Exception -> Lb3
            if (r9 == 0) goto L9d
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.AUTH     // Catch: java.lang.Exception -> Lb3
            long r9 = r9.value()     // Catch: java.lang.Exception -> Lb3
            java.lang.String r11 = "Invalid setting name!"
            com.getjar.sdk.logging.Logger.w(r9, r11)     // Catch: java.lang.Exception -> Lb3
        L9a:
            int r1 = r1 + 1
            goto L6d
        L9d:
            com.getjar.sdk.comm.auth.SettingsValue r9 = new com.getjar.sdk.comm.auth.SettingsValue     // Catch: java.lang.IllegalArgumentException -> La6 java.lang.Exception -> Lb3
            r9.<init>(r8, r7)     // Catch: java.lang.IllegalArgumentException -> La6 java.lang.Exception -> Lb3
            r6.put(r2, r9)     // Catch: java.lang.IllegalArgumentException -> La6 java.lang.Exception -> Lb3
            goto L9a
        La6:
            r0 = move-exception
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.AUTH     // Catch: java.lang.Exception -> Lb3
            long r9 = r9.value()     // Catch: java.lang.Exception -> Lb3
            java.lang.String r11 = "Invalid setting"
            com.getjar.sdk.logging.Logger.w(r9, r11, r0)     // Catch: java.lang.Exception -> Lb3
            goto L9a
        Lb3:
            r0 = move-exception
            r5 = r6
        Lb5:
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.AUTH
            long r9 = r9.value()
            java.lang.String r11 = "AuthFlow: getSettingsFromResult() failed"
            com.getjar.sdk.logging.Logger.e(r9, r11, r0)
        Lc0:
            if (r5 != 0) goto Lc8
            java.util.HashMap r5 = new java.util.HashMap
            r9 = 0
            r5.<init>(r9)
        Lc8:
            return r5
        Lc9:
            r0 = move-exception
            goto Lb5
        Lcb:
            r5 = r6
            goto Lc0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.auth.AuthUtilities.getSettingsFromResult(com.getjar.sdk.comm.Result):java.util.Map");
    }

    private static void addClaimsToMap(JSONArray claims, String keyPrefix, Map<String, String> map) {
        for (int i = 0; i < claims.length(); i++) {
            try {
                JSONObject claim = claims.getJSONObject(i);
                String key = claim.getString("key");
                String value = claim.getString("value");
                if (!StringUtility.isNullOrEmpty(key) && !StringUtility.isNullOrEmpty(value)) {
                    String name = String.format(Locale.US, "%1$s%2$s", keyPrefix, key);
                    map.put(name, value);
                    Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: claim found [key:%1$s  value:%2$s]", name, value));
                }
            } catch (Exception e) {
                Logger.e(Area.AUTH.value(), "AuthFlow: addClaimsToMap() failed", e);
            }
        }
    }
}
