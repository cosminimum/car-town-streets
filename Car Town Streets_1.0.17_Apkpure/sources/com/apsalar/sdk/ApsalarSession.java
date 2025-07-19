package com.apsalar.sdk;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: ApEvent.java */
/* loaded from: classes.dex */
public class ApsalarSession extends ApsalarEvent implements ApsalarAPI, ApsalarJSON {
    private String returndata;
    private String[] triggerInfo;
    private LoadTriggerTask triggerTask;

    @Override // com.apsalar.sdk.ApsalarEvent
    protected void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/start";
        this.eventType = 1;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarSession(ApsalarSessionInfo apsalarSessionInfo) {
        super(apsalarSessionInfo);
        this.triggerTask = null;
        this.triggerInfo = new String[0];
        this.returndata = null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarSession(ApsalarSessionInfo apsalarSessionInfo, LoadTriggerTask loadTriggerTask, String[] strArr) {
        super(apsalarSessionInfo);
        this.triggerTask = null;
        this.triggerInfo = new String[0];
        this.returndata = null;
        this.triggerTask = loadTriggerTask;
        this.triggerInfo = strArr;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarSession(ApsalarSessionInfo apsalarSessionInfo, JSONObject jSONObject) {
        super(apsalarSessionInfo, jSONObject);
        this.triggerTask = null;
        this.triggerInfo = new String[0];
        this.returndata = null;
    }

    @Override // com.apsalar.sdk.ApsalarEvent
    protected void makeURL() {
        String str = "";
        try {
            str = "?a=" + URLEncoder.encode(this.info.apiKey, "UTF-8") + "&ab=" + URLEncoder.encode(this.info.abi, "UTF-8") + "&av=" + URLEncoder.encode(this.info.appVersion, "UTF-8") + "&br=" + URLEncoder.encode(this.info.brand, "UTF-8") + "&c=" + URLEncoder.encode(this.info.connType, "UTF-8") + "&de=" + URLEncoder.encode(this.info.device, "UTF-8") + "&i=" + URLEncoder.encode(this.info.clsPackage, "UTF-8") + "&ma=" + URLEncoder.encode(this.info.manufacturer, "UTF-8") + "&mo=" + URLEncoder.encode(this.info.model, "UTF-8") + "&n=" + URLEncoder.encode(this.info.appName, "UTF-8") + "&p=" + URLEncoder.encode(this.info.platform, "UTF-8") + "&pr=" + URLEncoder.encode(this.info.product, "UTF-8") + "&rt=" + URLEncoder.encode(this.info.retType, "UTF-8") + "&s=" + URLEncoder.encode(this.info.sessionId, "UTF-8") + "&sdk=" + URLEncoder.encode(this.info.sdkVersion, "UTF-8") + "&u=" + URLEncoder.encode(this.info.deviceId, "UTF-8") + "&v=" + URLEncoder.encode(this.info.osVersion, "UTF-8");
        } catch (UnsupportedEncodingException e) {
        }
        this.url = str;
    }

    private void registerEntryPoints(JSONObject jSONObject) {
        if (this.info != null) {
            try {
                JSONObject jSONObject2 = (JSONObject) jSONObject.get("result");
                JSONArray jSONArray = jSONObject2.getJSONArray("Callbacks");
                for (int i = 0; i < jSONArray.length(); i++) {
                    ApsalarItem apsalarItem = Apsalar.registered_callbacks.get(jSONArray.getString(i));
                    if (apsalarItem != null) {
                        apsalarItem.registered = true;
                    } else {
                        ApsalarItem apsalarItem2 = new ApsalarItem(jSONArray.getString(i), null);
                        apsalarItem2.registered = true;
                        Apsalar.registered_callbacks.put(jSONArray.getString(i), apsalarItem2);
                    }
                }
                JSONObject jSONObject3 = jSONObject2.getJSONObject("Triggers");
                Iterator<String> keys = jSONObject3.keys();
                while (keys.hasNext()) {
                    String next = keys.next();
                    ApsalarItem apsalarItem3 = Apsalar.registered_triggers.get(next);
                    if (apsalarItem3 != null) {
                        apsalarItem3.registered = true;
                        apsalarItem3.connected = Boolean.valueOf(jSONObject3.getBoolean(next));
                    } else {
                        ApsalarItem apsalarItem4 = new ApsalarItem(next, true);
                        apsalarItem4.registered = true;
                        apsalarItem4.connected = Boolean.valueOf(jSONObject3.getBoolean(next));
                        Apsalar.registered_triggers.put(next, apsalarItem4);
                    }
                }
                for (String str : Apsalar.registered_callbacks.keySet()) {
                    ApsalarItem apsalarItem5 = Apsalar.registered_callbacks.get(str);
                    if (!apsalarItem5.registered.booleanValue()) {
                        new ApsalarRegister("C", apsalarItem5.name, this.info).REST();
                    }
                }
            } catch (JSONException e) {
            }
        }
    }

    @Override // com.apsalar.sdk.ApsalarEvent, com.apsalar.sdk.ApsalarAPI
    public int REST() {
        int REST = super.REST();
        if (REST != 1) {
            if (this.triggerTask != null) {
                this.triggerTask.cancel(true);
            }
        } else {
            registerEntryPoints(this.returnDataJSON);
            if (this.triggerTask != null && this.triggerInfo.length > 0) {
                this.triggerTask.execute(this.triggerInfo[0], this.triggerInfo[1]);
            }
        }
        return REST;
    }
}
