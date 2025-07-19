package com.apsalar.sdk;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/* compiled from: ApEvent */
class ApsalarRegister extends ApsalarEvent implements ApsalarAPI {
    protected String registerName = null;
    protected String registerType = null;

    protected ApsalarRegister(String str, String str2, ApsalarSessionInfo apsalarSessionInfo) {
        super(apsalarSessionInfo);
        this.registerType = str;
        this.registerName = str2;
    }

    /* access modifiers changed from: protected */
    public void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/register";
        this.eventType = 5;
    }

    /* access modifiers changed from: protected */
    public void makeURL() {
        String str = "";
        try {
            str = "?a=" + URLEncoder.encode(this.info.apiKey, "UTF-8") + "&av=" + URLEncoder.encode(this.info.appVersion, "UTF-8") + "&i=" + URLEncoder.encode(this.info.clsPackage, "UTF-8") + "&p=" + URLEncoder.encode(this.info.platform, "UTF-8") + "&rt=" + URLEncoder.encode(this.info.retType, "UTF-8") + "&s=" + URLEncoder.encode(this.info.sessionId, "UTF-8") + "&sdk=" + URLEncoder.encode(this.info.sdkVersion, "UTF-8") + "&type=" + URLEncoder.encode(this.registerType, "UTF-8") + "&u=" + URLEncoder.encode(this.info.deviceId, "UTF-8") + "&name=" + URLEncoder.encode(this.registerName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
        }
        this.url = str;
    }

    public int REST() {
        int REST = super.REST();
        if (REST == 1) {
            ApsalarItem apsalarItem = null;
            if (this.registerType == "C") {
                apsalarItem = Apsalar.registered_callbacks.get(this.registerName);
            } else if (this.registerType == "T") {
                apsalarItem = Apsalar.registered_triggers.get(this.registerName);
            }
            if (apsalarItem != null) {
                apsalarItem.connected = true;
                apsalarItem.registered = true;
            }
        }
        return REST;
    }
}
