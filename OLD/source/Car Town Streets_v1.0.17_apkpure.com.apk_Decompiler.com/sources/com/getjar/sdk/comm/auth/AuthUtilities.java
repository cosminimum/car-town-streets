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

class AuthUtilities {
    protected static final String KeyPrefixCaps = "capabilities.";
    protected static final String KeyPrefixClaims = "claims.";

    AuthUtilities() {
    }

    protected static String getAuthTokenFromHeaders(Result result) {
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

    protected static long getTTLFromClaims(Map<String, String> claims, long defaultValue) {
        long ttl = defaultValue;
        Long expiresOnEpoch = null;
        Long expiresInMinutes = null;
        String expiresInKey = String.format(Locale.US, "%1$sExpiresIn", new Object[]{KeyPrefixClaims});
        String expiresOnKey = String.format(Locale.US, "%1$sExpiresOn", new Object[]{KeyPrefixClaims});
        if (claims.containsKey(expiresInKey)) {
            try {
                expiresInMinutes = Long.valueOf(Long.parseLong(claims.get(expiresInKey)));
            } catch (Exception e) {
                Logger.e(Area.AUTH.value(), e.getMessage());
            }
            try {
                Logger.i(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: getTTLFromClaims() found expiresInSecs of %1$d", new Object[]{expiresInMinutes}));
            } catch (Exception e2) {
                Logger.e(Area.AUTH.value(), "AuthFlow: getTTLFromClaims() failed", e2);
            }
        }
        if (expiresInMinutes == null && claims.containsKey(expiresOnKey)) {
            try {
                expiresOnEpoch = Long.valueOf(Long.parseLong(claims.get(expiresOnKey)));
            } catch (Exception e3) {
                Logger.e(Area.AUTH.value(), e3.getMessage());
            }
            Logger.i(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: getTTLFromClaims() found expiresOnEpoch of %1$d", new Object[]{expiresOnEpoch}));
        }
        if (expiresInMinutes != null) {
            ttl = expiresInMinutes.longValue() * TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL;
            if (ttl <= 0) {
                Logger.w(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: getTTLFromClaims() parsed an ExpiresIn resulting in a TTL of %1$d", new Object[]{Long.valueOf(ttl)}));
                ttl = 0;
            }
        } else if (expiresOnEpoch != null) {
            ttl = expiresOnEpoch.longValue() - System.currentTimeMillis();
            if (ttl <= 0) {
                Logger.w(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: getTTLFromClaims() parsed an ExpiresOn resulting in a TTL of %1$d", new Object[]{Long.valueOf(ttl)}));
                ttl = 0;
            }
        }
        Logger.i(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: getTTLFromClaims() returning a TTL of %1$d", new Object[]{Long.valueOf(ttl)}));
        return ttl;
    }

    protected static Map<String, String> getClaimsFromResult(Result result) {
        JSONArray claims;
        JSONArray claims2;
        if (result == null) {
            throw new IllegalArgumentException("'result' cannot be NULL");
        } else if (!result.isSuccessfulResponse()) {
            throw new IllegalArgumentException("getClaimsFromResult() can only be called for a successful response");
        } else if (result.getResponseJson() == null) {
            throw new IllegalArgumentException("getClaimsFromResult() can only be called for a result with a response body");
        } else {
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
    }

    /* JADX WARNING: Removed duplicated region for block: B:40:0x00c2  */
    /* JADX WARNING: Removed duplicated region for block: B:48:? A[RETURN, SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    protected static java.util.Map<java.lang.String, com.getjar.sdk.comm.auth.SettingsValue> getSettingsFromResult(com.getjar.sdk.comm.Result r12) {
        /*
            if (r12 != 0) goto L_0x000a
            java.lang.IllegalArgumentException r9 = new java.lang.IllegalArgumentException
            java.lang.String r10 = "'result' cannot be NULL"
            r9.<init>(r10)
            throw r9
        L_0x000a:
            boolean r9 = r12.isSuccessfulResponse()
            if (r9 != 0) goto L_0x0018
            java.lang.IllegalArgumentException r9 = new java.lang.IllegalArgumentException
            java.lang.String r10 = "setSettingsFromResult() can only be called for a successful response"
            r9.<init>(r10)
            throw r9
        L_0x0018:
            org.json.JSONObject r9 = r12.getResponseJson()
            if (r9 != 0) goto L_0x0026
            java.lang.IllegalArgumentException r9 = new java.lang.IllegalArgumentException
            java.lang.String r10 = "setSettingsFromResult() can only be called for a result with a response body"
            r9.<init>(r10)
            throw r9
        L_0x0026:
            r5 = 0
            if (r12 == 0) goto L_0x00c0
            boolean r9 = r12.isSuccessfulResponse()     // Catch:{ Exception -> 0x00c9 }
            if (r9 == 0) goto L_0x00c0
            org.json.JSONObject r9 = r12.getResponseJson()     // Catch:{ Exception -> 0x00c9 }
            if (r9 == 0) goto L_0x00c0
            org.json.JSONObject r9 = r12.getResponseJson()     // Catch:{ Exception -> 0x00c9 }
            java.lang.String r10 = "return"
            boolean r9 = r9.has(r10)     // Catch:{ Exception -> 0x00c9 }
            if (r9 == 0) goto L_0x00c0
            org.json.JSONObject r9 = r12.getResponseJson()     // Catch:{ Exception -> 0x00c9 }
            java.lang.String r10 = "return"
            org.json.JSONObject r9 = r9.getJSONObject(r10)     // Catch:{ Exception -> 0x00c9 }
            java.lang.String r10 = "settings"
            boolean r9 = r9.has(r10)     // Catch:{ Exception -> 0x00c9 }
            if (r9 == 0) goto L_0x00c0
            org.json.JSONObject r9 = r12.getResponseJson()     // Catch:{ Exception -> 0x00c9 }
            java.lang.String r10 = "return"
            org.json.JSONObject r9 = r9.getJSONObject(r10)     // Catch:{ Exception -> 0x00c9 }
            java.lang.String r10 = "settings"
            org.json.JSONArray r4 = r9.getJSONArray(r10)     // Catch:{ Exception -> 0x00c9 }
            java.util.HashMap r6 = new java.util.HashMap     // Catch:{ Exception -> 0x00c9 }
            int r9 = r4.length()     // Catch:{ Exception -> 0x00c9 }
            r6.<init>(r9)     // Catch:{ Exception -> 0x00c9 }
            r1 = 0
        L_0x006d:
            int r9 = r4.length()     // Catch:{ Exception -> 0x00b3 }
            if (r1 >= r9) goto L_0x00cb
            org.json.JSONObject r3 = r4.getJSONObject(r1)     // Catch:{ Exception -> 0x00b3 }
            java.lang.String r9 = "name"
            java.lang.String r2 = r3.getString(r9)     // Catch:{ Exception -> 0x00b3 }
            java.lang.String r9 = "value"
            java.lang.String r8 = r3.getString(r9)     // Catch:{ Exception -> 0x00b3 }
            java.lang.String r9 = "type"
            java.lang.String r7 = r3.getString(r9)     // Catch:{ Exception -> 0x00b3 }
            boolean r9 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r2)     // Catch:{ Exception -> 0x00b3 }
            if (r9 == 0) goto L_0x009d
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.AUTH     // Catch:{ Exception -> 0x00b3 }
            long r9 = r9.value()     // Catch:{ Exception -> 0x00b3 }
            java.lang.String r11 = "Invalid setting name!"
            com.getjar.sdk.logging.Logger.w(r9, r11)     // Catch:{ Exception -> 0x00b3 }
        L_0x009a:
            int r1 = r1 + 1
            goto L_0x006d
        L_0x009d:
            com.getjar.sdk.comm.auth.SettingsValue r9 = new com.getjar.sdk.comm.auth.SettingsValue     // Catch:{ IllegalArgumentException -> 0x00a6 }
            r9.<init>(r8, r7)     // Catch:{ IllegalArgumentException -> 0x00a6 }
            r6.put(r2, r9)     // Catch:{ IllegalArgumentException -> 0x00a6 }
            goto L_0x009a
        L_0x00a6:
            r0 = move-exception
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.AUTH     // Catch:{ Exception -> 0x00b3 }
            long r9 = r9.value()     // Catch:{ Exception -> 0x00b3 }
            java.lang.String r11 = "Invalid setting"
            com.getjar.sdk.logging.Logger.w(r9, r11, r0)     // Catch:{ Exception -> 0x00b3 }
            goto L_0x009a
        L_0x00b3:
            r0 = move-exception
            r5 = r6
        L_0x00b5:
            com.getjar.sdk.logging.Area r9 = com.getjar.sdk.logging.Area.AUTH
            long r9 = r9.value()
            java.lang.String r11 = "AuthFlow: getSettingsFromResult() failed"
            com.getjar.sdk.logging.Logger.e(r9, r11, r0)
        L_0x00c0:
            if (r5 != 0) goto L_0x00c8
            java.util.HashMap r5 = new java.util.HashMap
            r9 = 0
            r5.<init>(r9)
        L_0x00c8:
            return r5
        L_0x00c9:
            r0 = move-exception
            goto L_0x00b5
        L_0x00cb:
            r5 = r6
            goto L_0x00c0
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
                    String name = String.format(Locale.US, "%1$s%2$s", new Object[]{keyPrefix, key});
                    map.put(name, value);
                    Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: claim found [key:%1$s  value:%2$s]", new Object[]{name, value}));
                }
            } catch (Exception e) {
                Logger.e(Area.AUTH.value(), "AuthFlow: addClaimsToMap() failed", e);
            }
        }
    }
}
