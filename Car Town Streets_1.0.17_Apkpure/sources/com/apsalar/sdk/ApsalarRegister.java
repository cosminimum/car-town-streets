package com.apsalar.sdk;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: ApEvent.java */
/* loaded from: classes.dex */
public class ApsalarRegister extends ApsalarEvent implements ApsalarAPI {
    protected String registerName;
    protected String registerType;

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarRegister(String str, String str2, ApsalarSessionInfo apsalarSessionInfo) {
        super(apsalarSessionInfo);
        this.registerType = null;
        this.registerName = null;
        this.registerType = str;
        this.registerName = str2;
    }

    @Override // com.apsalar.sdk.ApsalarEvent
    protected void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/register";
        this.eventType = 5;
    }

    @Override // com.apsalar.sdk.ApsalarEvent
    protected void makeURL() {
        String str = "";
        try {
            str = "?a=" + URLEncoder.encode(this.info.apiKey, "UTF-8") + "&av=" + URLEncoder.encode(this.info.appVersion, "UTF-8") + "&i=" + URLEncoder.encode(this.info.clsPackage, "UTF-8") + "&p=" + URLEncoder.encode(this.info.platform, "UTF-8") + "&rt=" + URLEncoder.encode(this.info.retType, "UTF-8") + "&s=" + URLEncoder.encode(this.info.sessionId, "UTF-8") + "&sdk=" + URLEncoder.encode(this.info.sdkVersion, "UTF-8") + "&type=" + URLEncoder.encode(this.registerType, "UTF-8") + "&u=" + URLEncoder.encode(this.info.deviceId, "UTF-8") + "&name=" + URLEncoder.encode(this.registerName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
        }
        this.url = str;
    }

    @Override // com.apsalar.sdk.ApsalarEvent, com.apsalar.sdk.ApsalarAPI
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
