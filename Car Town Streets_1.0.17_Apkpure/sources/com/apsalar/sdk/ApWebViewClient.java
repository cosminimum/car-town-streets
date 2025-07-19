package com.apsalar.sdk;

import android.util.Log;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class ApWebViewClient extends WebViewClient {
    private ApsalarSessionInfo info = null;

    private void doCallback(String str) {
        String str2;
        if (Apsalar.registered_callbacks != null) {
            CallbackURL callbackURL = new CallbackURL(str);
            ApsalarItem apsalarItem = Apsalar.registered_callbacks.get(callbackURL.signature);
            if (apsalarItem != null && apsalarItem.registered.booleanValue()) {
                Apsalar.eventJSON("__click__", callbackURL.clickParams);
                if (apsalarItem.val == null) {
                    Log.d("Apsalar SDK/ApWebView", "WebView is null ");
                } else if (apsalarItem.val instanceof WebView) {
                    StringBuffer stringBuffer = new StringBuffer();
                    stringBuffer.append("javascript:");
                    WebView webView = (WebView) apsalarItem.val;
                    if (!callbackURL.signature.contains("()")) {
                        StringBuffer stringBuffer2 = new StringBuffer();
                        String str3 = callbackURL.signature;
                        stringBuffer2.append(str3.substring(0, str3.indexOf("(") + 1));
                        ArrayList<String> arrayList = callbackURL.argVals;
                        for (int i = 0; i < arrayList.size() - 1; i++) {
                            stringBuffer2.append("'" + ((Object) arrayList.get(i)) + "',");
                        }
                        stringBuffer2.append("'" + ((Object) arrayList.get(arrayList.size() - 1)) + "'");
                        stringBuffer2.append(")");
                        str2 = stringBuffer2.toString();
                    } else {
                        str2 = callbackURL.signature;
                    }
                    stringBuffer.append(str2);
                    stringBuffer.append(";");
                    webView.loadUrl(stringBuffer.toString());
                    Log.d("Apsalar SDK/ApWebView", "JS Signature: " + stringBuffer.toString());
                } else {
                    ApCallback apCallback = (ApCallback) apsalarItem.val;
                    if (apCallback != null) {
                        apCallback.executeCallback(callbackURL.argValsJSON);
                    }
                }
            }
        }
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideUrlLoading(WebView webView, String str) {
        if (str.equals("about:close") || str.equals("fbconnect:cancel")) {
            ((android.app.Activity) webView.getContext()).finish();
            Apsalar.triggerActive = false;
            return true;
        } else if (str.startsWith("callback:")) {
            doCallback(str);
            ((android.app.Activity) webView.getContext()).finish();
            Apsalar.triggerActive = false;
            return true;
        } else {
            Apsalar.triggerActive = false;
            return false;
        }
    }
}
