package com.mopub.mobileads;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.android.gms.drive.DriveFile;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.impl.client.DefaultHttpClient;
/* loaded from: classes.dex */
public class MraidView extends WebView {
    public static final int AD_CONTAINER_LAYOUT_ID = 102;
    private static final String LOGTAG = "MraidView";
    public static final int MODAL_CONTAINER_LAYOUT_ID = 101;
    public static final int PLACEHOLDER_VIEW_ID = 100;
    private MraidBrowserController mBrowserController;
    private MraidDisplayController mDisplayController;
    private boolean mHasFiredReadyEvent;
    private MraidListenerInfo mListenerInfo;
    private final PlacementType mPlacementType;
    private WebChromeClient mWebChromeClient;
    private WebViewClient mWebViewClient;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public enum ExpansionStyle {
        ENABLED,
        DISABLED
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public enum NativeCloseButtonStyle {
        ALWAYS_VISIBLE,
        ALWAYS_HIDDEN,
        AD_CONTROLLED
    }

    /* loaded from: classes.dex */
    public interface OnCloseButtonStateChangeListener {
        void onCloseButtonStateChange(MraidView mraidView, boolean z);
    }

    /* loaded from: classes.dex */
    public interface OnCloseListener {
        void onClose(MraidView mraidView, ViewState viewState);
    }

    /* loaded from: classes.dex */
    public interface OnExpandListener {
        void onExpand(MraidView mraidView);
    }

    /* loaded from: classes.dex */
    public interface OnFailureListener {
        void onFailure(MraidView mraidView);
    }

    /* loaded from: classes.dex */
    public interface OnOpenListener {
        void onOpen(MraidView mraidView);
    }

    /* loaded from: classes.dex */
    public interface OnReadyListener {
        void onReady(MraidView mraidView);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public enum PlacementType {
        INLINE,
        INTERSTITIAL
    }

    /* loaded from: classes.dex */
    public enum ViewState {
        LOADING,
        DEFAULT,
        EXPANDED,
        HIDDEN
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class MraidListenerInfo {
        private OnCloseButtonStateChangeListener mOnCloseButtonListener;
        private OnCloseListener mOnCloseListener;
        private OnExpandListener mOnExpandListener;
        private OnFailureListener mOnFailureListener;
        private OnOpenListener mOnOpenListener;
        private OnReadyListener mOnReadyListener;

        MraidListenerInfo() {
        }
    }

    public MraidView(Context context) {
        this(context, ExpansionStyle.ENABLED, NativeCloseButtonStyle.AD_CONTROLLED, PlacementType.INLINE);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MraidView(Context context, ExpansionStyle expStyle, NativeCloseButtonStyle buttonStyle, PlacementType placementType) {
        super(context);
        this.mPlacementType = placementType;
        initialize(expStyle, buttonStyle);
    }

    private void initialize(ExpansionStyle expStyle, NativeCloseButtonStyle buttonStyle) {
        setScrollContainer(false);
        setBackgroundColor(0);
        setVerticalScrollBarEnabled(false);
        setHorizontalScrollBarEnabled(false);
        setOnTouchListener(new View.OnTouchListener() { // from class: com.mopub.mobileads.MraidView.1
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()) {
                    case 0:
                    case 1:
                        if (!v.hasFocus()) {
                            v.requestFocus();
                            return false;
                        }
                        return false;
                    default:
                        return false;
                }
            }
        });
        getSettings().setJavaScriptEnabled(true);
        this.mBrowserController = new MraidBrowserController(this);
        this.mDisplayController = new MraidDisplayController(this, expStyle, buttonStyle);
        this.mWebViewClient = new MraidWebViewClient();
        setWebViewClient(this.mWebViewClient);
        this.mWebChromeClient = new MraidWebChromeClient();
        setWebChromeClient(this.mWebChromeClient);
        this.mListenerInfo = new MraidListenerInfo();
    }

    @Override // android.webkit.WebView
    public void destroy() {
        this.mDisplayController.destroy();
        super.destroy();
    }

    public void loadHtmlData(String data) {
        if (data.indexOf("<html>") == -1) {
            data = "<html><head></head><body style='margin:0;padding:0;'>" + data + "</body></html>";
        }
        String mraid = "file:/" + copyRawResourceToFilesDir(R.raw.mraid, "mraid.js");
        loadDataWithBaseURL(null, data.replace("<head>", "<head><script src='" + mraid + "'></script>"), "text/html", "UTF-8", null);
    }

    @Override // android.webkit.WebView
    public void loadUrl(String url) {
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        HttpGet httpGet = new HttpGet(url);
        StringBuffer out = new StringBuffer();
        try {
            HttpResponse response = defaultHttpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                InputStream is = entity.getContent();
                byte[] b = new byte[4096];
                while (true) {
                    int n = is.read(b);
                    if (n == -1) {
                        break;
                    }
                    out.append(new String(b, 0, n));
                }
            }
            loadHtmlData(out.toString());
        } catch (IOException e) {
            notifyOnFailureListener();
        } catch (ClientProtocolException e2) {
            notifyOnFailureListener();
        }
    }

    private void notifyOnFailureListener() {
        if (this.mListenerInfo.mOnFailureListener != null) {
            this.mListenerInfo.mOnFailureListener.onFailure(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public MraidBrowserController getBrowserController() {
        return this.mBrowserController;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public MraidDisplayController getDisplayController() {
        return this.mDisplayController;
    }

    public void setOnExpandListener(OnExpandListener listener) {
        this.mListenerInfo.mOnExpandListener = listener;
    }

    public OnExpandListener getOnExpandListener() {
        return this.mListenerInfo.mOnExpandListener;
    }

    public void setOnCloseListener(OnCloseListener listener) {
        this.mListenerInfo.mOnCloseListener = listener;
    }

    public OnCloseListener getOnCloseListener() {
        return this.mListenerInfo.mOnCloseListener;
    }

    public void setOnReadyListener(OnReadyListener listener) {
        this.mListenerInfo.mOnReadyListener = listener;
    }

    public OnReadyListener getOnReadyListener() {
        return this.mListenerInfo.mOnReadyListener;
    }

    public void setOnFailureListener(OnFailureListener listener) {
        this.mListenerInfo.mOnFailureListener = listener;
    }

    public OnFailureListener getOnFailureListener() {
        return this.mListenerInfo.mOnFailureListener;
    }

    public void setOnCloseButtonStateChange(OnCloseButtonStateChangeListener listener) {
        this.mListenerInfo.mOnCloseButtonListener = listener;
    }

    public OnCloseButtonStateChangeListener getOnCloseButtonStateChangeListener() {
        return this.mListenerInfo.mOnCloseButtonListener;
    }

    public void setOnOpenListener(OnOpenListener listener) {
        this.mListenerInfo.mOnOpenListener = listener;
    }

    public OnOpenListener getOnOpenListener() {
        return this.mListenerInfo.mOnOpenListener;
    }

    protected void injectJavaScript(String js) {
        if (js != null) {
            super.loadUrl("javascript:" + js);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void fireChangeEventForProperty(MraidProperty property) {
        String json = "{" + property.toString() + "}";
        injectJavaScript("window.mraidbridge.fireChangeEvent(" + json + ");");
        Log.d(LOGTAG, "Fire change: " + json);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void fireChangeEventForProperties(ArrayList<MraidProperty> properties) {
        String props = properties.toString();
        if (props.length() >= 2) {
            String json = "{" + props.substring(1, props.length() - 1) + "}";
            injectJavaScript("window.mraidbridge.fireChangeEvent(" + json + ");");
            Log.d(LOGTAG, "Fire changes: " + json);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void fireErrorEvent(String action, String message) {
        injectJavaScript("window.mraidbridge.fireErrorEvent('" + action + "', '" + message + "');");
    }

    protected void fireReadyEvent() {
        injectJavaScript("window.mraidbridge.fireReadyEvent();");
    }

    protected void fireNativeCommandCompleteEvent(String command) {
        injectJavaScript("window.mraidbridge.nativeCallComplete('" + command + "');");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean tryCommand(URI uri) {
        String commandType = uri.getHost();
        List<NameValuePair> list = URLEncodedUtils.parse(uri, "UTF-8");
        Map<String, String> params = new HashMap<>();
        for (NameValuePair pair : list) {
            params.put(pair.getName(), pair.getValue());
        }
        MraidCommand command = MraidCommandRegistry.createCommand(commandType, params, this);
        if (command == null) {
            fireNativeCommandCompleteEvent(commandType);
            return false;
        }
        command.execute();
        fireNativeCommandCompleteEvent(commandType);
        return true;
    }

    private String copyRawResourceToFilesDir(int resourceId, String destinationFilename) {
        InputStream is = getContext().getResources().openRawResource(resourceId);
        String destinationPath = getContext().getFilesDir().getAbsolutePath() + File.separator + destinationFilename;
        File destinationFile = new File(destinationPath);
        try {
            FileOutputStream fos = new FileOutputStream(destinationFile);
            byte[] b = new byte[8192];
            while (true) {
                try {
                    int n = is.read(b);
                    if (n != -1) {
                        fos.write(b, 0, n);
                    } else {
                        try {
                            is.close();
                            fos.close();
                            return destinationPath;
                        } catch (IOException e) {
                            return destinationPath;
                        }
                    }
                } catch (IOException e2) {
                    try {
                        is.close();
                        fos.close();
                        return "";
                    } catch (IOException e3) {
                        return "";
                    }
                } catch (Throwable th) {
                    try {
                        is.close();
                        fos.close();
                    } catch (IOException e4) {
                    }
                    throw th;
                }
            }
        } catch (FileNotFoundException e5) {
            return "";
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class MraidWebViewClient extends WebViewClient {
        private MraidWebViewClient() {
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            Log.d(MraidView.LOGTAG, "Error: " + description);
            super.onReceivedError(view, errorCode, description, failingUrl);
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            Uri uri = Uri.parse(url);
            String scheme = uri.getScheme();
            if (scheme.equals("mopub")) {
                return true;
            }
            if (scheme.equals("mraid")) {
                MraidView.this.tryCommand(URI.create(url));
                return true;
            }
            Intent i = new Intent();
            i.setAction("android.intent.action.VIEW");
            i.setData(Uri.parse(url));
            i.addFlags(DriveFile.MODE_READ_ONLY);
            try {
                MraidView.this.getContext().startActivity(i);
                return true;
            } catch (ActivityNotFoundException e) {
                return false;
            }
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView view, String url) {
            if (!MraidView.this.mHasFiredReadyEvent) {
                MraidView.this.mDisplayController.initializeJavaScriptState();
                MraidView.this.fireChangeEventForProperty(MraidPlacementTypeProperty.createWithType(MraidView.this.mPlacementType));
                MraidView.this.fireReadyEvent();
                if (MraidView.this.getOnReadyListener() != null) {
                    MraidView.this.getOnReadyListener().onReady(MraidView.this);
                }
                MraidView.this.mHasFiredReadyEvent = true;
            }
        }

        @Override // android.webkit.WebViewClient
        public void onLoadResource(WebView view, String url) {
            Log.d(MraidView.LOGTAG, "Loaded resource: " + url);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class MraidWebChromeClient extends WebChromeClient {
        private MraidWebChromeClient() {
        }

        @Override // android.webkit.WebChromeClient
        public boolean onJsAlert(WebView view, String url, String message, JsResult result) {
            Log.d(MraidView.LOGTAG, message);
            return false;
        }
    }
}
