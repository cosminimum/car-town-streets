package com.apsalar.sdk;

import java.io.IOException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
/* compiled from: ApEvent.java */
/* loaded from: classes.dex */
class ApsalarRetry extends ApsalarEvent implements ApsalarAPI {
    @Override // com.apsalar.sdk.ApsalarEvent
    protected void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/event";
        this.eventType = -1;
    }

    @Override // com.apsalar.sdk.ApsalarEvent, com.apsalar.sdk.ApsalarAPI
    public int REST() {
        try {
            this.returnData = (String) client.execute(new HttpGet(this.urlbase + "?u=-1"), new BasicResponseHandler());
            return 1;
        } catch (IOException e) {
            return -1;
        }
    }
}
