package com.apsalar.sdk;

/* compiled from: ApEvent */
class ApsalarHeartbeat extends ApsalarEvent implements ApsalarAPI {
    /* access modifiers changed from: protected */
    public void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/event";
        this.eventType = 2;
        this.eventName = "heartbeat";
    }

    protected ApsalarHeartbeat(ApsalarSessionInfo apsalarSessionInfo) {
        super(apsalarSessionInfo);
    }
}
