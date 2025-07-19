package com.apsalar.sdk;

import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: ApEvent.java */
/* loaded from: classes.dex */
public class ApsalarEndSession extends ApsalarEvent implements ApsalarAPI, ApsalarJSON {
    @Override // com.apsalar.sdk.ApsalarEvent
    protected void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/event";
        this.eventType = 4;
        this.eventName = "end_session";
        this.eventData = "{}";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarEndSession(ApsalarSessionInfo apsalarSessionInfo) {
        super(apsalarSessionInfo);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarEndSession(ApsalarSessionInfo apsalarSessionInfo, JSONObject jSONObject) {
        super(apsalarSessionInfo, jSONObject);
    }
}
