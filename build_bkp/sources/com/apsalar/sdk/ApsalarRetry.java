package com.apsalar.sdk;

import java.io.IOException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;

/* compiled from: ApEvent */
class ApsalarRetry extends ApsalarEvent implements ApsalarAPI {
    /* access modifiers changed from: protected */
    public void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/event";
        this.eventType = -1;
    }

    protected ApsalarRetry() {
    }

    public int REST() {
        try {
            this.returnData = (String) client.execute(new HttpGet(this.urlbase + "?u=-1"), new BasicResponseHandler());
            return 1;
        } catch (IOException e) {
            return -1;
        }
    }
}
