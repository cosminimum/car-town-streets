package com.apsalar.sdk;
/* compiled from: ApEvent.java */
/* loaded from: classes.dex */
class ApsalarHeartbeat extends ApsalarEvent implements ApsalarAPI {
    @Override // com.apsalar.sdk.ApsalarEvent
    protected void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/event";
        this.eventType = 2;
        this.eventName = "heartbeat";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarHeartbeat(ApsalarSessionInfo apsalarSessionInfo) {
        super(apsalarSessionInfo);
    }
}
