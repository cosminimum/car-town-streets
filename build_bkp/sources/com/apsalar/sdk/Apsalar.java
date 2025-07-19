package com.apsalar.sdk;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Looper;
import android.util.Log;
import android.webkit.WebView;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutionException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Apsalar {
    protected static final boolean DEBUG = false;
    protected static final boolean ERROR = false;
    private static final String FACEBOOK_ATTRIBUTION_ID_URL = "content://com.facebook.katana.provider.AttributionIdProvider";
    protected static String FBAppId = "";
    protected static String FBCookie = "";
    private static String apiKey = "";
    protected static Context ctx = null;
    static HashSet<String> executed_triggers = new HashSet<>();
    private static final char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    protected static ApsalarSessionInfo info = null;
    static HashMap<String, ApsalarItem> registered_callbacks = new HashMap<>();
    static HashMap<String, ApsalarItem> registered_triggers = new HashMap<>();
    private static String secret = "";
    protected static ApsalarThread thread = null;
    static Boolean triggerActive = false;

    private static void resetCaches() {
        registered_callbacks.clear();
        registered_triggers.clear();
        executed_triggers.clear();
    }

    private static String[] findStartSessionTrigger(Intent intent) {
        if (intent.getScheme() == null) {
            return new String[0];
        }
        Uri data = intent.getData();
        if (!data.getHost().equals("e.apsalar.com") || !data.getPath().startsWith("/api/v1/appstore/")) {
            return new String[0];
        }
        List<String> pathSegments = data.getPathSegments();
        if (pathSegments.size() < 5) {
            return new String[0];
        }
        String str = pathSegments.get(4);
        if (executed_triggers.contains(str)) {
            return new String[0];
        }
        return new String[]{str, data.getEncodedQuery()};
    }

    public static void setInfo(Context context, String str, String str2) {
        if (context != null && str != null && str2 != null) {
            ctx = context;
            apiKey = str;
            secret = str2;
            info = new ApsalarSessionInfo(ctx, apiKey, secret);
        }
    }

    public static void startSession(Context context, String str, String str2) {
        ApsalarSession apsalarSession;
        if (context instanceof Activity) {
            String[] findStartSessionTrigger = findStartSessionTrigger(((Activity) context).getIntent());
            if (info == null) {
                setInfo(context, str, str2);
            }
            if (!(ctx == null || info == null || thread != null)) {
                thread = ApsalarThread.getInstance(ctx, apiKey, secret);
            }
            if (info != null && info.sessionStart == 0 && thread != null) {
                info.sessionStart = System.currentTimeMillis();
                if (findStartSessionTrigger.length <= 0 || findStartSessionTrigger[0] == null) {
                    apsalarSession = new ApsalarSession(info);
                } else {
                    apsalarSession = new ApsalarSession(info, new LoadTriggerTask(info, context), findStartSessionTrigger);
                }
                String facebookAttributionId = new Apsalar().getFacebookAttributionId();
                if (facebookAttributionId != null) {
                    HashMap hashMap = new HashMap();
                    hashMap.put("fb_cookie", facebookAttributionId);
                    saveFBCookie(context, hashMap);
                }
                if (!thread.events.offer(apsalarSession)) {
                }
            } else if (findStartSessionTrigger.length > 0 && findStartSessionTrigger[0] != null) {
                LoadTriggerTask loadTriggerTask = new LoadTriggerTask(info, context);
                if (findStartSessionTrigger.length > 1) {
                    loadTriggerTask.execute(new String[]{findStartSessionTrigger[0], findStartSessionTrigger[1]});
                    return;
                }
                loadTriggerTask.execute(new String[]{findStartSessionTrigger[0]});
            }
        } else {
            if (info == null) {
                setInfo(context, str, str2);
            }
            if (!(ctx == null || info == null || thread != null)) {
                thread = ApsalarThread.getInstance(ctx, apiKey, secret);
            }
            if (info != null && info.sessionStart == 0 && thread != null) {
                info.sessionStart = System.currentTimeMillis();
                ApsalarSession apsalarSession2 = new ApsalarSession(info);
                String facebookAttributionId2 = new Apsalar().getFacebookAttributionId();
                if (facebookAttributionId2 != null) {
                    HashMap hashMap2 = new HashMap();
                    hashMap2.put("fb_cookie", facebookAttributionId2);
                    saveFBCookie(context, hashMap2);
                }
                if (!thread.events.offer(apsalarSession2)) {
                }
            }
        }
    }

    public static void restartSession(Context context, String str, String str2) {
        if (info != null) {
            info = null;
            thread = null;
            startSession(context, str, str2);
        }
    }

    public static void restartSession() {
        if (info != null && ctx != null) {
            restartSession(ctx, apiKey, secret);
        }
    }

    public static void endSession() {
        int REST;
        if (info != null && info.sessionStart != 0) {
            ApsalarEndSession apsalarEndSession = new ApsalarEndSession(info);
            if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
                EndSessionTask endSessionTask = new EndSessionTask();
                endSessionTask.execute(new ApsalarEvent[]{apsalarEndSession});
                try {
                    REST = ((Integer) endSessionTask.get()).intValue();
                } catch (InterruptedException e) {
                    REST = -1;
                } catch (ExecutionException e2) {
                    REST = -1;
                }
            } else {
                REST = apsalarEndSession.REST();
            }
            switch (REST) {
                case 0:
                    if (!thread.events.offer(apsalarEndSession)) {
                    }
                    break;
            }
            if (thread != null) {
                thread.lastSessionInfo = null;
            }
            info.sessionStart = 0;
        }
    }

    public static void event(String str) {
        event(str, new JSONObject());
    }

    public static void event(String str, Object... objArr) {
        if (objArr.length % 2 == 0) {
            JSONObject jSONObject = new JSONObject();
            int i = 0;
            while (i < objArr.length) {
                try {
                    jSONObject.put(objArr[i], objArr[i + 1]);
                    i += 2;
                } catch (JSONException e) {
                    return;
                }
            }
            event(str, jSONObject);
        }
    }

    public static void event(String str, JSONObject jSONObject) {
        if (info != null && info.sessionStart != 0 && thread != null) {
            if (!thread.events.offer(new ApsalarEvent(info, str, jSONObject.toString()))) {
            }
        }
    }

    public static void eventJSON(String str, JSONObject jSONObject) {
        event(str, jSONObject);
    }

    public static void survey(Activity activity, String str) {
        if (info != null && info.sessionStart != 0 && !triggerActive.booleanValue()) {
            Intent intent = new Intent(activity, Activity.class);
            intent.putExtra("op", "survey");
            intent.putExtra("survey", str);
            activity.startActivity(intent);
        }
    }

    public static void setGender(String str) {
        if (str == null) {
            return;
        }
        if (str.toLowerCase().equals('f') || str.toLowerCase().equals('f')) {
            event("__gender__", str);
        }
    }

    public static void setAge(int i) {
        if (i > 0 && i < 100) {
            event("__age__", Integer.toString(i));
        }
    }

    public static void sendReferrerInstall() {
        HashMap hashMap = (HashMap) ApsalarReceiver.retrieveCSIReferrer(ctx);
        JSONObject jSONObject = new JSONObject();
        for (String str : hashMap.keySet()) {
            if (str.equals("referrer")) {
                try {
                    jSONObject.put("referrer", hashMap.get(str));
                } catch (JSONException e) {
                }
            }
        }
        if (jSONObject.length() > 0) {
            event("__InstallReferrer", jSONObject);
        }
    }

    private static Boolean callbackIsKnown(String str) {
        if (registered_callbacks == null) {
            return false;
        }
        return Boolean.valueOf(registered_callbacks.containsKey(str));
    }

    private static Boolean triggerIsKnown(String str) {
        if (registered_triggers == null) {
            return false;
        }
        return Boolean.valueOf(registered_triggers.containsKey(str));
    }

    public static void registerCallback(String str, Object obj) {
        String replace = str.replace(" ", "");
        if (!(info == null || info.sessionStart == 0 || thread == null || !replace.matches("[^)]+\\([^]]*\\)") || callbackIsKnown(replace).booleanValue())) {
            new ApsalarRegister("C", replace, info).REST();
        }
        ApsalarItem apsalarItem = registered_callbacks.get(replace);
        if (apsalarItem == null) {
            registered_callbacks.put(replace, new ApsalarItem(replace, obj));
            return;
        }
        apsalarItem.val = obj;
        Log.d(new Boolean(apsalarItem.val instanceof WebView).toString(), "Callback is a Webview ");
    }

    private static void registerTrigger(String str) {
        if (!(info == null || info.sessionStart == 0 || thread == null || triggerIsKnown(str).booleanValue())) {
            new ApsalarRegister("T", str, info).REST();
        }
        registered_triggers.put(str, new ApsalarItem(str, true));
    }

    public static void trigger(Activity activity, String str) {
        if (info != null && info.sessionStart != 0 && registered_triggers != null) {
            ApsalarItem apsalarItem = registered_triggers.get(str);
            if (apsalarItem != null && apsalarItem.connected.booleanValue() && apsalarItem.registered.booleanValue()) {
                new LoadTriggerTask(info, activity).execute(new String[]{apsalarItem.name});
            } else if (apsalarItem == null) {
                registerTrigger(str);
            } else {
                if (!apsalarItem.connected.booleanValue()) {
                }
            }
        }
    }

    public static void setFBAppId(String str) {
        if (str != null) {
            FBAppId = str;
        }
    }

    protected static String getNewSessionId() {
        return UUID.randomUUID().toString();
    }

    protected static String hexDigest(byte[] bArr) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < bArr.length; i++) {
            stringBuffer.append(hexDigits[(bArr[i] & 240) >>> 4]);
            stringBuffer.append(hexDigits[bArr[i] & 15]);
        }
        return stringBuffer.toString();
    }

    public static void setTimeouts(int i) {
        ApsalarEvent.client.getParams().setParameter("http.connection.timeout", new Integer(i));
        ApsalarEvent.client.getParams().setParameter("http.socket.timeout", new Integer(i));
    }

    public static String getDeviceId() {
        if (info == null || info.deviceId == null) {
            return "None";
        }
        return info.deviceId;
    }

    public static String getSessionId() {
        if (info == null || info.sessionId == null) {
            return "None";
        }
        return info.sessionId;
    }

    public static void sendFBInstall() {
        Map<String, String> retrieveFBCookie;
        String str = null;
        if (!(ctx == null || (retrieveFBCookie = retrieveFBCookie(ctx)) == null)) {
            str = retrieveFBCookie.get("fb_cookie");
        }
        if (FBAppId != null && str != null) {
            JSONObject jSONObject = new JSONObject();
            JSONArray jSONArray = new JSONArray();
            jSONArray.put(FBAppId);
            try {
                jSONObject.put("fb_app_attribution", str);
                jSONObject.put("fb_app_ids", jSONArray);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            event("__FBInstall", jSONObject);
        }
    }

    public static Map<String, String> retrieveFBCookie(Context context) {
        String packageName = context.getPackageName();
        HashMap hashMap = new HashMap();
        SharedPreferences sharedPreferences = context.getSharedPreferences("apsalar_" + packageName, 0);
        for (String next : sharedPreferences.getAll().keySet()) {
            String string = sharedPreferences.getString(next, (String) null);
            if (string != null) {
                hashMap.put(next, string);
            }
        }
        return hashMap;
    }

    public static void saveFBCookie(Context context, Map<String, String> map) {
        SharedPreferences.Editor edit = context.getSharedPreferences("apsalar_" + context.getPackageName(), 0).edit();
        for (String next : map.keySet()) {
            String str = map.get(next);
            if (str != null) {
                edit.putString(next, str);
            }
        }
        edit.commit();
    }

    private String getFacebookAttributionId() {
        Cursor cursor;
        try {
            cursor = ctx.getContentResolver().query(Uri.parse(FACEBOOK_ATTRIBUTION_ID_URL), (String[]) null, (String) null, (String[]) null, (String) null);
        } catch (Exception e) {
            cursor = null;
        }
        if (cursor == null) {
            return null;
        }
        cursor.moveToFirst();
        String string = cursor.getString(0);
        cursor.close();
        return string;
    }
}
