package com.apsalar.sdk;

import org.json.JSONObject;

/* compiled from: ApEvent */
class ApsalarEndSession extends ApsalarEvent implements ApsalarAPI, ApsalarJSON {
    /* access modifiers changed from: protected */
    public void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/event";
        this.eventType = 4;
        this.eventName = "end_session";
        this.eventData = "{}";
    }

    protected ApsalarEndSession(ApsalarSessionInfo apsalarSessionInfo) {
        super(apsalarSessionInfo);
    }

    protected ApsalarEndSession(ApsalarSessionInfo apsalarSessionInfo, JSONObject jSONObject) {
        super(apsalarSessionInfo, jSONObject);
    }
}
