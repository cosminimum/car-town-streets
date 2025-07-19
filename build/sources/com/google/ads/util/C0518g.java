package com.google.ads.util;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Paint;
import android.view.View;
import android.view.Window;
import android.webkit.ConsoleMessage;
import android.webkit.JsPromptResult;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceResponse;
import android.webkit.WebSettings;
import android.webkit.WebStorage;
import android.webkit.WebView;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.google.ads.AdActivity;
import com.google.ads.C0489l;
import com.google.ads.C0491m;
import com.google.ads.C0497n;
import com.google.ads.internal.AdWebView;
import com.google.ads.internal.C0467c;
import com.google.ads.internal.C0475d;
import com.google.ads.internal.C0482i;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

@TargetApi(11)
/* renamed from: com.google.ads.util.g */
public class C0518g {

    /* renamed from: com.google.ads.util.g$b */
    public static class C0527b extends C0482i {
        public C0527b(C0475d dVar, Map<String, C0497n> map, boolean z, boolean z2) {
            super(dVar, map, z, z2);
        }

        public WebResourceResponse shouldInterceptRequest(WebView view, String url) {
            try {
                if ("mraid.js".equalsIgnoreCase(new File(url).getName())) {
                    C0467c j = this.f949a.mo3710j();
                    if (j != null) {
                        j.mo3668b(true);
                    } else {
                        this.f949a.mo3697a(true);
                    }
                    C0489l.C0490a a = this.f949a.mo3708h().f980a.mo3874a().f967a.mo3874a();
                    if (this.f949a.mo3708h().mo3791b()) {
                        String a2 = a.f972e.mo3875a();
                        C0508b.m1026a("shouldInterceptRequest(" + a2 + ")");
                        return m1058a(a2, view.getContext());
                    } else if (this.f950b) {
                        String a3 = a.f971d.mo3875a();
                        C0508b.m1026a("shouldInterceptRequest(" + a3 + ")");
                        return m1058a(a3, view.getContext());
                    } else {
                        String a4 = a.f970c.mo3875a();
                        C0508b.m1026a("shouldInterceptRequest(" + a4 + ")");
                        return m1058a(a4, view.getContext());
                    }
                }
            } catch (IOException e) {
                C0508b.m1035d("IOException fetching MRAID JS.", e);
            } catch (Throwable th) {
                C0508b.m1031b("An unknown error occurred fetching MRAID JS.", th);
            }
            return super.shouldInterceptRequest(view, url);
        }

        /* renamed from: a */
        private static WebResourceResponse m1058a(String str, Context context) throws IOException {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            try {
                AdUtil.m992a(httpURLConnection, context.getApplicationContext());
                httpURLConnection.connect();
                return new WebResourceResponse("application/javascript", "UTF-8", new ByteArrayInputStream(AdUtil.m988a((Readable) new InputStreamReader(httpURLConnection.getInputStream())).getBytes("UTF-8")));
            } finally {
                httpURLConnection.disconnect();
            }
        }
    }

    /* renamed from: com.google.ads.util.g$a */
    public static class C0520a extends WebChromeClient {

        /* renamed from: a */
        private final C0491m f1083a;

        public C0520a(C0491m mVar) {
            this.f1083a = mVar;
        }

        public void onCloseWindow(WebView webView) {
            if (webView instanceof AdWebView) {
                ((AdWebView) webView).mo3624a();
            }
        }

        public boolean onConsoleMessage(ConsoleMessage consoleMessage) {
            String str = "JS: " + consoleMessage.message() + " (" + consoleMessage.sourceId() + ":" + consoleMessage.lineNumber() + ")";
            switch (C05191.f1082a[consoleMessage.messageLevel().ordinal()]) {
                case 1:
                    C0508b.m1030b(str);
                    break;
                case 2:
                    C0508b.m1036e(str);
                    break;
                case 3:
                case 4:
                    C0508b.m1032c(str);
                    break;
                case 5:
                    C0508b.m1026a(str);
                    break;
            }
            return super.onConsoleMessage(consoleMessage);
        }

        public void onExceededDatabaseQuota(String url, String databaseIdentifier, long currentQuota, long estimatedSize, long totalUsedQuota, WebStorage.QuotaUpdater quotaUpdater) {
            C0489l.C0490a a = this.f1083a.f980a.mo3874a().f967a.mo3874a();
            long longValue = a.f976i.mo3875a().longValue() - totalUsedQuota;
            if (longValue <= 0) {
                quotaUpdater.updateQuota(currentQuota);
                return;
            }
            if (currentQuota == 0) {
                if (estimatedSize > longValue || estimatedSize > a.f977j.mo3875a().longValue()) {
                    estimatedSize = 0;
                }
            } else if (estimatedSize == 0) {
                estimatedSize = Math.min(Math.min(a.f978k.mo3875a().longValue(), longValue) + currentQuota, a.f977j.mo3875a().longValue());
            } else {
                if (estimatedSize <= Math.min(a.f977j.mo3875a().longValue() - currentQuota, longValue)) {
                    currentQuota += estimatedSize;
                }
                estimatedSize = currentQuota;
            }
            quotaUpdater.updateQuota(estimatedSize);
        }

        public boolean onJsAlert(WebView view, String url, String message, JsResult result) {
            return m1057a(view, url, message, (String) null, result, (JsPromptResult) null, false);
        }

        public boolean onJsBeforeUnload(WebView view, String url, String message, JsResult result) {
            return m1057a(view, url, message, (String) null, result, (JsPromptResult) null, false);
        }

        public boolean onJsConfirm(WebView view, String url, String message, JsResult result) {
            return m1057a(view, url, message, (String) null, result, (JsPromptResult) null, false);
        }

        public boolean onJsPrompt(WebView view, String url, String message, String defaultValue, JsPromptResult result) {
            return m1057a(view, url, message, defaultValue, (JsResult) null, result, true);
        }

        public void onReachedMaxAppCacheSize(long spaceNeeded, long totalUsedQuota, WebStorage.QuotaUpdater quotaUpdater) {
            C0489l.C0490a a = this.f1083a.f980a.mo3874a().f967a.mo3874a();
            long longValue = a.f974g.mo3875a().longValue() + spaceNeeded;
            if (a.f975h.mo3875a().longValue() - totalUsedQuota < longValue) {
                quotaUpdater.updateQuota(0);
            } else {
                quotaUpdater.updateQuota(longValue);
            }
        }

        public void onShowCustomView(View view, WebChromeClient.CustomViewCallback callback) {
            callback.onCustomViewHidden();
        }

        /* renamed from: a */
        private static boolean m1057a(WebView webView, String str, String str2, String str3, JsResult jsResult, JsPromptResult jsPromptResult, boolean z) {
            AdActivity d;
            if (!(webView instanceof AdWebView) || (d = ((AdWebView) webView).mo3627d()) == null) {
                return false;
            }
            AlertDialog.Builder builder = new AlertDialog.Builder(d);
            builder.setTitle(str);
            if (z) {
                m1055a(builder, d, str2, str3, jsPromptResult);
            } else {
                m1056a(builder, str2, jsResult);
            }
            return true;
        }

        /* renamed from: a */
        private static void m1056a(AlertDialog.Builder builder, String str, final JsResult jsResult) {
            builder.setMessage(str).setPositiveButton(17039370, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    jsResult.confirm();
                }
            }).setNegativeButton(17039360, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    jsResult.cancel();
                }
            }).setOnCancelListener(new DialogInterface.OnCancelListener() {
                public void onCancel(DialogInterface dialog) {
                    jsResult.cancel();
                }
            }).create().show();
        }

        /* renamed from: a */
        private static void m1055a(AlertDialog.Builder builder, Context context, String str, String str2, final JsPromptResult jsPromptResult) {
            LinearLayout linearLayout = new LinearLayout(context);
            linearLayout.setOrientation(1);
            TextView textView = new TextView(context);
            textView.setText(str);
            final EditText editText = new EditText(context);
            editText.setText(str2);
            linearLayout.addView(textView);
            linearLayout.addView(editText);
            builder.setView(linearLayout).setPositiveButton(17039370, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    jsPromptResult.confirm(editText.getText().toString());
                }
            }).setNegativeButton(17039360, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    jsPromptResult.cancel();
                }
            }).setOnCancelListener(new DialogInterface.OnCancelListener() {
                public void onCancel(DialogInterface dialog) {
                    jsPromptResult.cancel();
                }
            }).create().show();
        }
    }

    /* renamed from: com.google.ads.util.g$1 */
    static /* synthetic */ class C05191 {

        /* renamed from: a */
        static final /* synthetic */ int[] f1082a = new int[ConsoleMessage.MessageLevel.values().length];

        static {
            try {
                f1082a[ConsoleMessage.MessageLevel.ERROR.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                f1082a[ConsoleMessage.MessageLevel.WARNING.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                f1082a[ConsoleMessage.MessageLevel.LOG.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                f1082a[ConsoleMessage.MessageLevel.TIP.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                f1082a[ConsoleMessage.MessageLevel.DEBUG.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    /* renamed from: a */
    public static void m1053a(WebSettings webSettings, C0491m mVar) {
        Context a = mVar.f985f.mo3874a();
        webSettings.setAppCacheEnabled(true);
        webSettings.setAppCacheMaxSize(mVar.f980a.mo3874a().f967a.mo3874a().f973f.mo3875a().longValue());
        webSettings.setAppCachePath(new File(a.getCacheDir(), "admob").getAbsolutePath());
        webSettings.setDatabaseEnabled(true);
        webSettings.setDatabasePath(a.getDatabasePath("admob").getAbsolutePath());
        webSettings.setDomStorageEnabled(true);
        webSettings.setSupportZoom(true);
        webSettings.setBuiltInZoomControls(true);
        webSettings.setDisplayZoomControls(false);
    }

    /* renamed from: a */
    public static void m1051a(View view) {
        view.setLayerType(1, (Paint) null);
    }

    /* renamed from: b */
    public static void m1054b(View view) {
        view.setLayerType(0, (Paint) null);
    }

    /* renamed from: a */
    public static void m1052a(Window window) {
        window.setFlags(16777216, 16777216);
    }
}
