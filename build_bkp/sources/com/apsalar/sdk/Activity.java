package com.apsalar.sdk;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.webkit.WebView;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Activity extends android.app.Activity {
    private static final String apSurveyBase = "http://apsalar.com/api/survey/boot/do";

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        String stringExtra = intent.getStringExtra("op");
        if (stringExtra.equals("survey")) {
            load(apSurveyBase + seal(intent.getStringExtra("survey")));
        } else if (stringExtra.equals("ad")) {
            loadHTML(intent.getStringExtra("content"));
        }
    }

    private void load(String str) {
        WebView webView = new WebView(this);
        webView.setVerticalScrollBarEnabled(false);
        webView.setWebViewClient(new ApWebViewClient());
        webView.getSettings().setJavaScriptEnabled(true);
        webView.getSettings().setSavePassword(false);
        addContentView(webView, new ViewGroup.LayoutParams(-1, -1));
        try {
            webView.loadData("<html><head>" + URLEncoder.encode("", "UTF-8") + "<script type=\"text/javascript\">" + "function load(){" + "var s=document.createElement('script');" + "s.type='text/javascript';" + "s.src='" + URLEncoder.encode(str, "UTF-8") + "';" + "document.getElementsByTagName('head')[0].appendChild(s);" + "}" + "document.addEventListener('DOMContentLoaded', function(){" + "load();" + "setTimeout('load();', 2000);" + "setTimeout('load();', 5000);" + "setTimeout('load();', 10000);" + "}, false);" + "</script>" + "</head>" + "<body><h1 style=\"color: #aaa;\">" + "Loading...</h1><p><a href=\"about:close\">" + "<input type=\"submit\" value=\"Close\"></a></p>" + "</body></html>", "text/html", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            webView.loadData("<h1>Error</h1><p><a href=\"about:close\">Close</a></p>\n", "text/html", "utf-8");
        }
        webView.requestFocus();
        ((InputMethodManager) getSystemService("input_method")).hideSoftInputFromWindow(webView.getWindowToken(), 2);
    }

    /* access modifiers changed from: protected */
    public String seal(String str) {
        String str2;
        try {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
            String str3 = "?a=" + URLEncoder.encode(Apsalar.info.apiKey, "UTF-8") + "&i=" + URLEncoder.encode(Apsalar.info.clsPackage, "UTF-8") + "&p=" + URLEncoder.encode(Apsalar.info.platform, "UTF-8") + "&s=" + URLEncoder.encode(Apsalar.info.sessionId, "UTF-8") + "&sdk=" + URLEncoder.encode(Apsalar.info.sdkVersion, "UTF-8") + "&sh=" + displayMetrics.heightPixels + "&sw=" + displayMetrics.widthPixels + "&u=" + URLEncoder.encode(Apsalar.info.deviceId, "UTF-8") + "&y=" + URLEncoder.encode(str, "UTF-8");
            try {
                MessageDigest instance = MessageDigest.getInstance("SHA-1");
                instance.update(Apsalar.info.secret.getBytes("UTF-8"));
                instance.update(str3.getBytes("UTF-8"));
                str2 = Apsalar.hexDigest(instance.digest());
            } catch (UnsupportedEncodingException e) {
                str2 = "error=369";
            } catch (NoSuchAlgorithmException e2) {
                str2 = "error=373";
            }
            return str3 + "&h=" + str2;
        } catch (UnsupportedEncodingException e3) {
            return "?error=371";
        }
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
    }

    private void loadHTML(String str) {
        WebView webView = new WebView(this);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.setWebViewClient(new ApWebViewClient());
        setContentView(webView);
        webView.loadDataWithBaseURL((String) null, "<html><head></head><body>" + str + "</body></html>", "text/html", "UTF-8", (String) null);
        webView.requestFocus();
    }
}
