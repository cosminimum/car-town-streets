package com.google.ads;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.webkit.WebView;
import com.google.ads.internal.C0462a;
import com.google.ads.util.C0508b;
import java.lang.ref.WeakReference;
import java.util.Date;
import java.util.Locale;

/* renamed from: com.google.ads.ag */
public final class C0430ag {

    /* renamed from: a */
    private static final C0462a f737a = C0462a.f841a.mo3651b();

    /* renamed from: com.google.ads.ag$a */
    private static class C0431a implements Runnable {

        /* renamed from: a */
        private final WeakReference<Activity> f738a;

        /* renamed from: b */
        private final SharedPreferences.Editor f739b;

        public C0431a(Activity activity) {
            this(activity, (SharedPreferences.Editor) null);
        }

        C0431a(Activity activity, SharedPreferences.Editor editor) {
            this.f738a = new WeakReference<>(activity);
            this.f739b = editor;
        }

        /* renamed from: a */
        private SharedPreferences.Editor m696a(Activity activity) {
            if (this.f739b == null) {
                return PreferenceManager.getDefaultSharedPreferences(activity.getApplicationContext()).edit();
            }
            return this.f739b;
        }

        public void run() {
            String str;
            try {
                Activity activity = (Activity) this.f738a.get();
                if (activity == null) {
                    C0508b.m1026a("Activity was null while making a doritos cookie request.");
                    return;
                }
                Cursor query = activity.getContentResolver().query(C0429af.f734b, C0429af.f736d, (String) null, (String[]) null, (String) null);
                if (query == null || !query.moveToFirst() || query.getColumnNames().length <= 0) {
                    C0508b.m1026a("Google+ app not installed, not storing doritos cookie");
                    str = null;
                } else {
                    str = query.getString(query.getColumnIndex(query.getColumnName(0)));
                }
                SharedPreferences.Editor a = m696a(activity);
                if (!TextUtils.isEmpty(str)) {
                    a.putString("drt", str);
                    a.putLong("drt_ts", new Date().getTime());
                } else {
                    a.putString("drt", "");
                    a.putLong("drt_ts", 0);
                }
                a.commit();
            } catch (Throwable th) {
                C0508b.m1031b("An unknown error occurred while sending a doritos request.", th);
            }
        }
    }

    /* renamed from: com.google.ads.ag$b */
    private static class C0432b implements Runnable {

        /* renamed from: a */
        private final WeakReference<Activity> f740a;

        /* renamed from: b */
        private final WebView f741b;

        /* renamed from: c */
        private final String f742c;

        public C0432b(Activity activity, WebView webView, String str) {
            this.f740a = new WeakReference<>(activity);
            this.f742c = str;
            this.f741b = webView;
        }

        public void run() {
            boolean z;
            try {
                Uri withAppendedPath = Uri.withAppendedPath(C0429af.f733a, this.f742c);
                Activity activity = (Activity) this.f740a.get();
                if (activity == null) {
                    C0508b.m1026a("Activity was null while getting the +1 button state.");
                    return;
                }
                Cursor query = activity.getContentResolver().query(withAppendedPath, C0429af.f735c, (String) null, (String[]) null, (String) null);
                if (query == null || !query.moveToFirst()) {
                    C0508b.m1026a("Google+ app not installed, showing ad as not +1'd");
                    z = false;
                } else {
                    z = query.getInt(query.getColumnIndex("has_plus1")) == 1;
                }
                this.f741b.post(new C0433c(this.f741b, z));
            } catch (Throwable th) {
                C0508b.m1031b("An unknown error occurred while updating the +1 state.", th);
            }
        }
    }

    /* renamed from: com.google.ads.ag$c */
    static class C0433c implements Runnable {

        /* renamed from: a */
        private final boolean f743a;

        /* renamed from: b */
        private final WebView f744b;

        public C0433c(WebView webView, boolean z) {
            this.f744b = webView;
            this.f743a = z;
        }

        public void run() {
            C0430ag.m693a(this.f744b, this.f743a);
        }
    }

    /* renamed from: a */
    public static void m693a(WebView webView, boolean z) {
        f737a.mo3642a(webView, String.format(Locale.US, "(G_updatePlusOne(%b))", new Object[]{Boolean.valueOf(z)}));
    }

    /* renamed from: a */
    public static void m692a(WebView webView, String str) {
        f737a.mo3642a(webView, String.format(Locale.US, "(G_resizeIframe(%s))", new Object[]{str}));
    }

    /* renamed from: a */
    public static void m691a(Activity activity, WebView webView, String str) {
        new Thread(new C0432b(activity, webView, str)).start();
    }

    /* renamed from: a */
    public static boolean m694a(Context context, long j) {
        return m695a(context, j, PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()));
    }

    /* renamed from: a */
    static boolean m695a(Context context, long j, SharedPreferences sharedPreferences) {
        return C0434ah.m697a(context) && (!sharedPreferences.contains("drt") || !sharedPreferences.contains("drt_ts") || sharedPreferences.getLong("drt_ts", 0) < new Date().getTime() - j);
    }

    /* renamed from: a */
    public static void m690a(Activity activity) {
        new Thread(new C0431a(activity)).start();
    }
}
