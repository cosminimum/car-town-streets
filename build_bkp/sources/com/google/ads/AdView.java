package com.google.ads;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.google.ads.internal.AdWebView;
import com.google.ads.internal.C0466b;
import com.google.ads.internal.C0475d;
import com.google.ads.internal.C0483j;
import com.google.ads.util.AdUtil;
import com.google.ads.util.C0508b;
import java.util.HashSet;
import java.util.Set;

public class AdView extends RelativeLayout implements C0423Ad {

    /* renamed from: a */
    private C0475d f722a;

    public AdView(Activity activity, AdSize adSize, String adUnitId) {
        super(activity.getApplicationContext());
        try {
            m673a((Context) activity, adSize, (AttributeSet) null);
            m677b(activity, adSize, (AttributeSet) null);
            m669a(activity, adSize, adUnitId);
        } catch (C0466b e) {
            m671a((Context) activity, e.mo3654c("Could not initialize AdView"), adSize, (AttributeSet) null);
            e.mo3652a("Could not initialize AdView");
        }
    }

    protected AdView(Activity activity, AdSize[] adSizes, String adUnitId) {
        this(activity, new AdSize(0, 0), adUnitId);
        m672a(adSizes);
    }

    public AdView(Context context, AttributeSet attrs) {
        super(context, attrs);
        m670a(context, attrs);
    }

    public AdView(Context context, AttributeSet attrs, int defStyle) {
        this(context, attrs);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public void mo3520a(Context context, String str, int i, AdSize adSize, AttributeSet attributeSet) {
        if (adSize == null) {
            adSize = AdSize.BANNER;
        }
        AdSize createAdSize = AdSize.createAdSize(adSize, context.getApplicationContext());
        if (getChildCount() == 0) {
            TextView textView = attributeSet == null ? new TextView(context) : new TextView(context, attributeSet);
            textView.setGravity(17);
            textView.setText(str);
            textView.setTextColor(i);
            textView.setBackgroundColor(-16777216);
            LinearLayout linearLayout = attributeSet == null ? new LinearLayout(context) : new LinearLayout(context, attributeSet);
            linearLayout.setGravity(17);
            LinearLayout linearLayout2 = attributeSet == null ? new LinearLayout(context) : new LinearLayout(context, attributeSet);
            linearLayout2.setGravity(17);
            linearLayout2.setBackgroundColor(i);
            int a = m668a(context, createAdSize.getWidth());
            int a2 = m668a(context, createAdSize.getHeight());
            linearLayout.addView(textView, a - 2, a2 - 2);
            linearLayout2.addView(linearLayout);
            addView(linearLayout2, a, a2);
        }
    }

    /* renamed from: a */
    private int m668a(Context context, int i) {
        return (int) TypedValue.applyDimension(1, (float) i, context.getResources().getDisplayMetrics());
    }

    /* renamed from: a */
    private boolean m673a(Context context, AdSize adSize, AttributeSet attributeSet) {
        if (AdUtil.m1007c(context)) {
            return true;
        }
        m671a(context, "You must have AdActivity declared in AndroidManifest.xml with configChanges.", adSize, attributeSet);
        return false;
    }

    /* renamed from: b */
    private boolean m677b(Context context, AdSize adSize, AttributeSet attributeSet) {
        if (AdUtil.m1004b(context)) {
            return true;
        }
        m671a(context, "You must have INTERNET and ACCESS_NETWORK_STATE permissions in AndroidManifest.xml.", adSize, attributeSet);
        return false;
    }

    public void destroy() {
        this.f722a.mo3698b();
    }

    /* renamed from: a */
    private void m671a(Context context, String str, AdSize adSize, AttributeSet attributeSet) {
        C0508b.m1030b(str);
        mo3520a(context, str, -65536, adSize, attributeSet);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public AdSize[] mo3521a(String str) {
        AdSize adSize;
        String[] split = str.split(",");
        AdSize[] adSizeArr = new AdSize[split.length];
        for (int i = 0; i < split.length; i++) {
            String trim = split[i].trim();
            if (trim.matches("^(\\d+|FULL_WIDTH)\\s*[xX]\\s*(\\d+|AUTO_HEIGHT)$")) {
                String[] split2 = trim.split("[xX]");
                split2[0] = split2[0].trim();
                split2[1] = split2[1].trim();
                try {
                    adSize = new AdSize("FULL_WIDTH".equals(split2[0]) ? -1 : Integer.parseInt(split2[0]), "AUTO_HEIGHT".equals(split2[1]) ? -2 : Integer.parseInt(split2[1]));
                } catch (NumberFormatException e) {
                    return null;
                }
            } else {
                adSize = "BANNER".equals(trim) ? AdSize.BANNER : "SMART_BANNER".equals(trim) ? AdSize.SMART_BANNER : "IAB_MRECT".equals(trim) ? AdSize.IAB_MRECT : "IAB_BANNER".equals(trim) ? AdSize.IAB_BANNER : "IAB_LEADERBOARD".equals(trim) ? AdSize.IAB_LEADERBOARD : "IAB_WIDE_SKYSCRAPER".equals(trim) ? AdSize.IAB_WIDE_SKYSCRAPER : null;
            }
            if (adSize == null) {
                return null;
            }
            adSizeArr[i] = adSize;
        }
        return adSizeArr;
    }

    /* renamed from: a */
    private void m670a(Context context, AttributeSet attributeSet) {
        AdSize[] adSizeArr;
        C0466b bVar;
        if (attributeSet != null) {
            try {
                String b = m676b("adSize", context, attributeSet, true);
                AdSize[] a = mo3521a(b);
                if (a != null) {
                    try {
                        if (a.length != 0) {
                            if (!m675a("adUnitId", attributeSet)) {
                                throw new C0466b("Required XML attribute \"adUnitId\" missing", true);
                            } else if (isInEditMode()) {
                                mo3520a(context, "Ads by Google", -1, a[0], attributeSet);
                                return;
                            } else {
                                String b2 = m676b("adUnitId", context, attributeSet, true);
                                boolean a2 = m674a("loadAdOnCreate", context, attributeSet, false);
                                if (context instanceof Activity) {
                                    Activity activity = (Activity) context;
                                    m673a((Context) activity, a[0], attributeSet);
                                    m677b(activity, a[0], attributeSet);
                                    if (a.length == 1) {
                                        m669a(activity, a[0], b2);
                                    } else {
                                        m669a(activity, new AdSize(0, 0), b2);
                                        m672a(a);
                                    }
                                    if (a2) {
                                        Set<String> c = m678c("testDevices", context, attributeSet, false);
                                        if (c.contains("TEST_EMULATOR")) {
                                            c.remove("TEST_EMULATOR");
                                            c.add(AdRequest.TEST_EMULATOR);
                                        }
                                        loadAd(new AdRequest().setTestDevices(c).setKeywords(m678c("keywords", context, attributeSet, false)));
                                        return;
                                    }
                                    return;
                                }
                                throw new C0466b("AdView was initialized with a Context that wasn't an Activity.", true);
                            }
                        }
                    } catch (C0466b e) {
                        bVar = e;
                        adSizeArr = a;
                        m671a(context, bVar.mo3654c("Could not initialize AdView"), (adSizeArr == null || adSizeArr.length <= 0) ? AdSize.BANNER : adSizeArr[0], attributeSet);
                        bVar.mo3652a("Could not initialize AdView");
                        if (!isInEditMode()) {
                            bVar.mo3653b("Could not initialize AdView");
                            return;
                        }
                        return;
                    }
                }
                throw new C0466b("Attribute \"adSize\" invalid: " + b, true);
            } catch (C0466b e2) {
                C0466b bVar2 = e2;
                adSizeArr = null;
                bVar = bVar2;
            }
        }
    }

    /* renamed from: a */
    private boolean m674a(String str, Context context, AttributeSet attributeSet, boolean z) throws C0466b {
        String attributeValue = attributeSet.getAttributeValue("http://schemas.android.com/apk/lib/com.google.ads", str);
        boolean attributeBooleanValue = attributeSet.getAttributeBooleanValue("http://schemas.android.com/apk/lib/com.google.ads", str, z);
        if (attributeValue != null) {
            String packageName = context.getPackageName();
            if (attributeValue.matches("^@([^:]+)\\:(.*)$")) {
                packageName = attributeValue.replaceFirst("^@([^:]+)\\:(.*)$", "$1");
                attributeValue = attributeValue.replaceFirst("^@([^:]+)\\:(.*)$", "@$2");
            }
            if (attributeValue.startsWith("@bool/")) {
                String substring = attributeValue.substring("@bool/".length());
                TypedValue typedValue = new TypedValue();
                try {
                    getResources().getValue(packageName + ":bool/" + substring, typedValue, true);
                    if (typedValue.type == 18) {
                        return typedValue.data != 0;
                    }
                    throw new C0466b("Resource " + str + " was not a boolean: " + typedValue, true);
                } catch (Resources.NotFoundException e) {
                    throw new C0466b("Could not find resource for " + str + ": " + attributeValue, true, e);
                }
            }
        }
        return attributeBooleanValue;
    }

    /* renamed from: b */
    private String m676b(String str, Context context, AttributeSet attributeSet, boolean z) throws C0466b {
        String attributeValue = attributeSet.getAttributeValue("http://schemas.android.com/apk/lib/com.google.ads", str);
        if (attributeValue != null) {
            String packageName = context.getPackageName();
            if (attributeValue.matches("^@([^:]+)\\:(.*)$")) {
                packageName = attributeValue.replaceFirst("^@([^:]+)\\:(.*)$", "$1");
                attributeValue = attributeValue.replaceFirst("^@([^:]+)\\:(.*)$", "@$2");
            }
            if (attributeValue.startsWith("@string/")) {
                String substring = attributeValue.substring("@string/".length());
                TypedValue typedValue = new TypedValue();
                try {
                    getResources().getValue(packageName + ":string/" + substring, typedValue, true);
                    if (typedValue.string != null) {
                        attributeValue = typedValue.string.toString();
                    } else {
                        throw new C0466b("Resource " + str + " was not a string: " + typedValue, true);
                    }
                } catch (Resources.NotFoundException e) {
                    throw new C0466b("Could not find resource for " + str + ": " + attributeValue, true, e);
                }
            }
        }
        if (!z || attributeValue != null) {
            return attributeValue;
        }
        throw new C0466b("Required XML attribute \"" + str + "\" missing", true);
    }

    /* renamed from: c */
    private Set<String> m678c(String str, Context context, AttributeSet attributeSet, boolean z) throws C0466b {
        String b = m676b(str, context, attributeSet, z);
        HashSet hashSet = new HashSet();
        if (b != null) {
            for (String trim : b.split(",")) {
                String trim2 = trim.trim();
                if (trim2.length() != 0) {
                    hashSet.add(trim2);
                }
            }
        }
        return hashSet;
    }

    /* renamed from: a */
    private boolean m675a(String str, AttributeSet attributeSet) {
        return attributeSet.getAttributeValue("http://schemas.android.com/apk/lib/com.google.ads", str) != null;
    }

    /* renamed from: a */
    private void m669a(Activity activity, AdSize adSize, String str) throws C0466b {
        FrameLayout frameLayout = new FrameLayout(activity);
        frameLayout.setFocusable(false);
        this.f722a = new C0475d(this, activity, adSize, str, frameLayout, false);
        setGravity(17);
        try {
            ViewGroup a = C0483j.m953a(activity, this.f722a);
            if (a != null) {
                a.addView(frameLayout, -2, -2);
                addView(a, -2, -2);
                return;
            }
            addView(frameLayout, -2, -2);
        } catch (VerifyError e) {
            C0508b.m1027a("Gestures disabled: Not supported on this version of Android.", (Throwable) e);
            addView(frameLayout, -2, -2);
        }
    }

    public boolean isReady() {
        if (this.f722a == null) {
            return false;
        }
        return this.f722a.mo3718r();
    }

    public boolean isRefreshing() {
        if (this.f722a == null) {
            return false;
        }
        return this.f722a.mo3719s();
    }

    public void loadAd(AdRequest adRequest) {
        if (this.f722a != null) {
            if (isRefreshing()) {
                this.f722a.mo3705e();
            }
            this.f722a.mo3690a(adRequest);
        }
    }

    public void setAdListener(AdListener adListener) {
        this.f722a.mo3708h().f992m.mo3876a(adListener);
    }

    /* access modifiers changed from: protected */
    public void setAppEventListener(AppEventListener appEventListener) {
        this.f722a.mo3708h().f993n.mo3876a(appEventListener);
    }

    /* access modifiers changed from: protected */
    public void setSupportedAdSizes(AdSize... adSizes) {
        if (this.f722a.mo3708h().f991l.mo3875a() == null) {
            C0508b.m1030b("Error: Tried to set supported ad sizes on a single-size AdView.");
        } else {
            m672a(adSizes);
        }
    }

    /* renamed from: a */
    private void m672a(AdSize... adSizeArr) {
        AdSize[] adSizeArr2 = new AdSize[adSizeArr.length];
        for (int i = 0; i < adSizeArr.length; i++) {
            adSizeArr2[i] = AdSize.createAdSize(adSizeArr[i], getContext());
        }
        this.f722a.mo3708h().f991l.mo3876a(adSizeArr2);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        AdWebView k = this.f722a.mo3711k();
        if (k != null) {
            k.setVisibility(0);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    public void stopLoading() {
        if (this.f722a != null) {
            this.f722a.mo3680A();
        }
    }
}
