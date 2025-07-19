package com.millennialmedia.android;

import android.net.Uri;
import android.webkit.WebView;
import com.getjar.sdk.utilities.Utility;
import com.millennialmedia.android.MMAdViewSDK;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.HashMap;

class MMCommand implements Runnable {
    private HashMap<String, String> arguments;
    private String callback;
    private Class cls;
    private Method method;
    OverlaySettings settings;
    private WeakReference<WebView> webViewRef;

    MMCommand(WebView webView, String uriString) {
        this.webViewRef = new WeakReference<>(webView);
        try {
            String[] components = Uri.parse(uriString).getHost().split("\\.");
            if (components.length >= 2) {
                String className = components[components.length - 2];
                String methodName = components[components.length - 1];
                this.arguments = new HashMap<>();
                for (String param : uriString.substring(uriString.indexOf(63) + 1).split(Utility.QUERY_APPENDIX)) {
                    String[] subComponents = param.split("=");
                    if (subComponents.length >= 2) {
                        this.arguments.put(Uri.decode(subComponents[0]), Uri.decode(subComponents[1]));
                        if (subComponents[0].equalsIgnoreCase("callback")) {
                            this.callback = Uri.decode(subComponents[1]);
                        }
                    }
                }
                this.cls = Class.forName("com.millennialmedia.android." + className);
                this.method = this.cls.getMethod(methodName, new Class[]{this.arguments.getClass()});
            }
        } catch (Exception e) {
            MMAdViewSDK.Log.m4420e("Exception while executing javascript call %s %s", uriString, e.getMessage());
            e.printStackTrace();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:20:0x006a, code lost:
        r7 = (android.webkit.WebView) r15.webViewRef.get();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x00ed, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x00ee, code lost:
        com.millennialmedia.android.MMAdViewSDK.Log.m4420e("Exception while executing javascript call %s %s", r15.method.toString(), r1.getMessage());
        r1.printStackTrace();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:?, code lost:
        return;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void run() {
        /*
            r15 = this;
            r14 = 2
            r13 = 1
            r12 = 0
            java.lang.Class r8 = r15.cls
            if (r8 == 0) goto L_0x00cb
            java.lang.reflect.Method r8 = r15.method
            if (r8 == 0) goto L_0x00cb
            java.lang.ref.WeakReference<android.webkit.WebView> r8 = r15.webViewRef     // Catch:{ Exception -> 0x00ed }
            java.lang.Object r6 = r8.get()     // Catch:{ Exception -> 0x00ed }
            android.webkit.WebView r6 = (android.webkit.WebView) r6     // Catch:{ Exception -> 0x00ed }
            if (r6 == 0) goto L_0x00cb
            java.lang.Class r8 = r15.cls     // Catch:{ Exception -> 0x00ed }
            java.lang.Object r3 = r8.newInstance()     // Catch:{ Exception -> 0x00ed }
            com.millennialmedia.android.MMJSObject r3 = (com.millennialmedia.android.MMJSObject) r3     // Catch:{ Exception -> 0x00ed }
            android.content.Context r8 = r6.getContext()     // Catch:{ Exception -> 0x00ed }
            r3.setContext(r8)     // Catch:{ Exception -> 0x00ed }
            r6 = 0
            com.millennialmedia.android.OverlaySettings r8 = r15.settings     // Catch:{ Exception -> 0x00ed }
            if (r8 == 0) goto L_0x004e
            java.util.HashMap<java.lang.String, java.lang.String> r9 = r15.arguments     // Catch:{ Exception -> 0x00ed }
            java.lang.String r10 = "OVERLAY_type"
            com.millennialmedia.android.OverlaySettings r8 = r15.settings     // Catch:{ Exception -> 0x00ed }
            boolean r8 = r8.isBannerAd     // Catch:{ Exception -> 0x00ed }
            if (r8 == 0) goto L_0x00cc
            java.lang.String r8 = "true"
        L_0x0035:
            r9.put(r10, r8)     // Catch:{ Exception -> 0x00ed }
            java.util.HashMap<java.lang.String, java.lang.String> r8 = r15.arguments     // Catch:{ Exception -> 0x00ed }
            java.lang.String r9 = "OVERLAY_state"
            com.millennialmedia.android.OverlaySettings r10 = r15.settings     // Catch:{ Exception -> 0x00ed }
            java.lang.String r10 = r10.state     // Catch:{ Exception -> 0x00ed }
            r8.put(r9, r10)     // Catch:{ Exception -> 0x00ed }
            java.util.HashMap<java.lang.String, java.lang.String> r8 = r15.arguments     // Catch:{ Exception -> 0x00ed }
            java.lang.String r9 = "OVERLAY_adurl"
            com.millennialmedia.android.OverlaySettings r10 = r15.settings     // Catch:{ Exception -> 0x00ed }
            java.lang.String r10 = r10.adUrl     // Catch:{ Exception -> 0x00ed }
            r8.put(r9, r10)     // Catch:{ Exception -> 0x00ed }
        L_0x004e:
            java.lang.reflect.Method r8 = r15.method     // Catch:{ InvocationTargetException -> 0x00d0 }
            r9 = 1
            java.lang.Object[] r9 = new java.lang.Object[r9]     // Catch:{ InvocationTargetException -> 0x00d0 }
            r10 = 0
            java.util.HashMap<java.lang.String, java.lang.String> r11 = r15.arguments     // Catch:{ InvocationTargetException -> 0x00d0 }
            r9[r10] = r11     // Catch:{ InvocationTargetException -> 0x00d0 }
            java.lang.Object r4 = r8.invoke(r3, r9)     // Catch:{ InvocationTargetException -> 0x00d0 }
            com.millennialmedia.android.MMJSResponse r4 = (com.millennialmedia.android.MMJSResponse) r4     // Catch:{ InvocationTargetException -> 0x00d0 }
        L_0x005e:
            java.lang.String r8 = r15.callback     // Catch:{ Exception -> 0x00ed }
            if (r8 == 0) goto L_0x00cb
            java.lang.String r8 = r15.callback     // Catch:{ Exception -> 0x00ed }
            int r8 = r8.length()     // Catch:{ Exception -> 0x00ed }
            if (r8 <= 0) goto L_0x00cb
            java.lang.ref.WeakReference<android.webkit.WebView> r8 = r15.webViewRef     // Catch:{ Exception -> 0x00ed }
            java.lang.Object r7 = r8.get()     // Catch:{ Exception -> 0x00ed }
            android.webkit.WebView r7 = (android.webkit.WebView) r7     // Catch:{ Exception -> 0x00ed }
            if (r7 == 0) goto L_0x00cb
            if (r4 != 0) goto L_0x0080
            java.lang.reflect.Method r8 = r15.method     // Catch:{ Exception -> 0x00ed }
            java.lang.String r8 = r8.getName()     // Catch:{ Exception -> 0x00ed }
            com.millennialmedia.android.MMJSResponse r4 = com.millennialmedia.android.MMJSResponse.responseWithError(r8)     // Catch:{ Exception -> 0x00ed }
        L_0x0080:
            java.lang.String r8 = r4.methodName     // Catch:{ Exception -> 0x00ed }
            if (r8 != 0) goto L_0x008c
            java.lang.reflect.Method r8 = r15.method     // Catch:{ Exception -> 0x00ed }
            java.lang.String r8 = r8.getName()     // Catch:{ Exception -> 0x00ed }
            r4.methodName = r8     // Catch:{ Exception -> 0x00ed }
        L_0x008c:
            java.lang.String r8 = r4.className     // Catch:{ Exception -> 0x00ed }
            if (r8 != 0) goto L_0x0098
            java.lang.Class r8 = r15.cls     // Catch:{ Exception -> 0x00ed }
            java.lang.String r8 = r8.getSimpleName()     // Catch:{ Exception -> 0x00ed }
            r4.className = r8     // Catch:{ Exception -> 0x00ed }
        L_0x0098:
            java.lang.String r8 = "javascript:%s(%s);"
            r9 = 2
            java.lang.Object[] r9 = new java.lang.Object[r9]     // Catch:{ Exception -> 0x00ed }
            r10 = 0
            java.lang.String r11 = r15.callback     // Catch:{ Exception -> 0x00ed }
            r9[r10] = r11     // Catch:{ Exception -> 0x00ed }
            r10 = 1
            java.lang.String r11 = r4.toJSONString()     // Catch:{ Exception -> 0x00ed }
            r9[r10] = r11     // Catch:{ Exception -> 0x00ed }
            java.lang.String r0 = java.lang.String.format(r8, r9)     // Catch:{ Exception -> 0x00ed }
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x00ed }
            r8.<init>()     // Catch:{ Exception -> 0x00ed }
            java.lang.String r9 = "Executing JS bridge callback: "
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch:{ Exception -> 0x00ed }
            java.lang.StringBuilder r8 = r8.append(r0)     // Catch:{ Exception -> 0x00ed }
            java.lang.String r8 = r8.toString()     // Catch:{ Exception -> 0x00ed }
            com.millennialmedia.android.MMAdViewSDK.Log.m4428v((java.lang.String) r8)     // Catch:{ Exception -> 0x00ed }
            com.millennialmedia.android.MMCommand$1 r8 = new com.millennialmedia.android.MMCommand$1     // Catch:{ Exception -> 0x00ed }
            r8.<init>(r7, r0)     // Catch:{ Exception -> 0x00ed }
            com.millennialmedia.android.MMAdViewSDK.runOnUiThread(r8)     // Catch:{ Exception -> 0x00ed }
        L_0x00cb:
            return
        L_0x00cc:
            java.lang.String r8 = "false"
            goto L_0x0035
        L_0x00d0:
            r2 = move-exception
            java.lang.Throwable r5 = r2.getCause()     // Catch:{ Exception -> 0x00ed }
            if (r5 == 0) goto L_0x00e7
            java.lang.Class r8 = r5.getClass()     // Catch:{ Exception -> 0x00ed }
            java.lang.Class<android.content.ActivityNotFoundException> r9 = android.content.ActivityNotFoundException.class
            if (r8 != r9) goto L_0x00e7
            java.lang.String r8 = "Activity not found"
            com.millennialmedia.android.MMJSResponse r4 = com.millennialmedia.android.MMJSResponse.responseWithError(r8)     // Catch:{ Exception -> 0x00ed }
            goto L_0x005e
        L_0x00e7:
            com.millennialmedia.android.MMJSResponse r4 = com.millennialmedia.android.MMJSResponse.responseWithError()     // Catch:{ Exception -> 0x00ed }
            goto L_0x005e
        L_0x00ed:
            r1 = move-exception
            java.lang.String r8 = "Exception while executing javascript call %s %s"
            java.lang.Object[] r9 = new java.lang.Object[r14]
            java.lang.reflect.Method r10 = r15.method
            java.lang.String r10 = r10.toString()
            r9[r12] = r10
            java.lang.String r10 = r1.getMessage()
            r9[r13] = r10
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r8, r9)
            r1.printStackTrace()
            goto L_0x00cb
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMCommand.run():void");
    }
}
