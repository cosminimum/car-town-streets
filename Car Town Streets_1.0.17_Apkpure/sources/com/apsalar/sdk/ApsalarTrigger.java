package com.apsalar.sdk;

import com.getjar.sdk.utilities.Utility;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
/* compiled from: ApEvent.java */
/* loaded from: classes.dex */
class ApsalarTrigger extends ApsalarEvent implements ApsalarAPI {
    protected String name;
    protected String queryParams;

    @Override // com.apsalar.sdk.ApsalarEvent
    protected void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/trigger";
        this.eventType = 5;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarTrigger(String str, String str2, ApsalarSessionInfo apsalarSessionInfo) {
        super(apsalarSessionInfo);
        this.name = null;
        this.queryParams = null;
        this.name = str;
        this.queryParams = str2;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarTrigger(String str, ApsalarSessionInfo apsalarSessionInfo) {
        super(apsalarSessionInfo);
        this.name = null;
        this.queryParams = null;
        this.name = str;
    }

    @Override // com.apsalar.sdk.ApsalarEvent
    protected void makeURL() {
        String str = "";
        try {
            String str2 = "?a=" + URLEncoder.encode(this.info.apiKey, "UTF-8") + "&i=" + URLEncoder.encode(this.info.clsPackage, "UTF-8") + "&p=" + URLEncoder.encode(this.info.platform, "UTF-8") + "&s=" + URLEncoder.encode(this.info.sessionId, "UTF-8") + "&sdk=" + URLEncoder.encode(this.info.sdkVersion, "UTF-8") + "&u=" + URLEncoder.encode(this.info.deviceId, "UTF-8");
            if (this.queryParams != null) {
                str = str2 + "&y=" + URLEncoder.encode("://apsalar/" + this.name + Utility.QUERY_START + this.queryParams, "UTF-8");
            } else {
                str = str2 + "&y=" + URLEncoder.encode(this.name, "UTF-8");
            }
        } catch (UnsupportedEncodingException e) {
        }
        this.url = str;
    }
}
