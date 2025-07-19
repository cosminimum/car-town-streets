package com.apsalar.sdk;

import com.getjar.sdk.utilities.Utility;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/* compiled from: ApEvent */
class ApsalarTrigger extends ApsalarEvent implements ApsalarAPI {
    protected String name = null;
    protected String queryParams = null;

    /* access modifiers changed from: protected */
    public void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/trigger";
        this.eventType = 5;
    }

    protected ApsalarTrigger(String str, String str2, ApsalarSessionInfo apsalarSessionInfo) {
        super(apsalarSessionInfo);
        this.name = str;
        this.queryParams = str2;
    }

    protected ApsalarTrigger(String str, ApsalarSessionInfo apsalarSessionInfo) {
        super(apsalarSessionInfo);
        this.name = str;
    }

    /* access modifiers changed from: protected */
    public void makeURL() {
        String str = "";
        try {
            str = "?a=" + URLEncoder.encode(this.info.apiKey, "UTF-8") + "&i=" + URLEncoder.encode(this.info.clsPackage, "UTF-8") + "&p=" + URLEncoder.encode(this.info.platform, "UTF-8") + "&s=" + URLEncoder.encode(this.info.sessionId, "UTF-8") + "&sdk=" + URLEncoder.encode(this.info.sdkVersion, "UTF-8") + "&u=" + URLEncoder.encode(this.info.deviceId, "UTF-8");
            if (this.queryParams != null) {
                str = str + "&y=" + URLEncoder.encode("://apsalar/" + this.name + Utility.QUERY_START + this.queryParams, "UTF-8");
            } else {
                str = str + "&y=" + URLEncoder.encode(this.name, "UTF-8");
            }
        } catch (UnsupportedEncodingException e) {
        }
        this.url = str;
    }
}
