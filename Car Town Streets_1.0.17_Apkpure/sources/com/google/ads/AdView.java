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
import com.google.ads.util.AdUtil;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public class AdView extends RelativeLayout implements Ad {
    private com.google.ads.internal.d a;

    public AdView(Activity activity, AdSize adSize, String adUnitId) {
        super(activity.getApplicationContext());
        try {
            a(activity, adSize, (AttributeSet) null);
            b(activity, adSize, null);
            a(activity, adSize, adUnitId);
        } catch (com.google.ads.internal.b e) {
            a(activity, e.c("Could not initialize AdView"), adSize, (AttributeSet) null);
            e.a("Could not initialize AdView");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AdView(Activity activity, AdSize[] adSizes, String adUnitId) {
        this(activity, new AdSize(0, 0), adUnitId);
        a(adSizes);
    }

    public AdView(Context context, AttributeSet attrs) {
        super(context, attrs);
        a(context, attrs);
    }

    public AdView(Context context, AttributeSet attrs, int defStyle) {
        this(context, attrs);
    }

    void a(Context context, String str, int i, AdSize adSize, AttributeSet attributeSet) {
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
            int a = a(context, createAdSize.getWidth());
            int a2 = a(context, createAdSize.getHeight());
            linearLayout.addView(textView, a - 2, a2 - 2);
            linearLayout2.addView(linearLayout);
            addView(linearLayout2, a, a2);
        }
    }

    private int a(Context context, int i) {
        return (int) TypedValue.applyDimension(1, i, context.getResources().getDisplayMetrics());
    }

    private boolean a(Context context, AdSize adSize, AttributeSet attributeSet) {
        if (!AdUtil.c(context)) {
            a(context, "You must have AdActivity declared in AndroidManifest.xml with configChanges.", adSize, attributeSet);
            return false;
        }
        return true;
    }

    private boolean b(Context context, AdSize adSize, AttributeSet attributeSet) {
        if (!AdUtil.b(context)) {
            a(context, "You must have INTERNET and ACCESS_NETWORK_STATE permissions in AndroidManifest.xml.", adSize, attributeSet);
            return false;
        }
        return true;
    }

    public void destroy() {
        this.a.b();
    }

    private void a(Context context, String str, AdSize adSize, AttributeSet attributeSet) {
        com.google.ads.util.b.b(str);
        a(context, str, -65536, adSize, attributeSet);
    }

    AdSize[] a(String str) {
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

    private void a(Context context, AttributeSet attributeSet) {
        AdSize[] adSizeArr;
        com.google.ads.internal.b bVar;
        if (attributeSet != null) {
            try {
                String b = b("adSize", context, attributeSet, true);
                AdSize[] a = a(b);
                if (a != null) {
                    try {
                        if (a.length != 0) {
                            if (!a("adUnitId", attributeSet)) {
                                throw new com.google.ads.internal.b("Required XML attribute \"adUnitId\" missing", true);
                            }
                            if (isInEditMode()) {
                                a(context, "Ads by Google", -1, a[0], attributeSet);
                                return;
                            }
                            String b2 = b("adUnitId", context, attributeSet, true);
                            boolean a2 = a("loadAdOnCreate", context, attributeSet, false);
                            if (context instanceof Activity) {
                                Activity activity = (Activity) context;
                                a(activity, a[0], attributeSet);
                                b(activity, a[0], attributeSet);
                                if (a.length == 1) {
                                    a(activity, a[0], b2);
                                } else {
                                    a(activity, new AdSize(0, 0), b2);
                                    a(a);
                                }
                                if (a2) {
                                    Set<String> c = c("testDevices", context, attributeSet, false);
                                    if (c.contains("TEST_EMULATOR")) {
                                        c.remove("TEST_EMULATOR");
                                        c.add(AdRequest.TEST_EMULATOR);
                                    }
                                    loadAd(new AdRequest().setTestDevices(c).setKeywords(c("keywords", context, attributeSet, false)));
                                    return;
                                }
                                return;
                            }
                            throw new com.google.ads.internal.b("AdView was initialized with a Context that wasn't an Activity.", true);
                        }
                    } catch (com.google.ads.internal.b e) {
                        bVar = e;
                        adSizeArr = a;
                        a(context, bVar.c("Could not initialize AdView"), (adSizeArr == null || adSizeArr.length <= 0) ? AdSize.BANNER : adSizeArr[0], attributeSet);
                        bVar.a("Could not initialize AdView");
                        if (!isInEditMode()) {
                            bVar.b("Could not initialize AdView");
                            return;
                        }
                        return;
                    }
                }
                throw new com.google.ads.internal.b("Attribute \"adSize\" invalid: " + b, true);
            } catch (com.google.ads.internal.b e2) {
                adSizeArr = null;
                bVar = e2;
            }
        }
    }

    private boolean a(String str, Context context, AttributeSet attributeSet, boolean z) throws com.google.ads.internal.b {
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
                    if (typedValue.type != 18) {
                        throw new com.google.ads.internal.b("Resource " + str + " was not a boolean: " + typedValue, true);
                    }
                    return typedValue.data != 0;
                } catch (Resources.NotFoundException e) {
                    throw new com.google.ads.internal.b("Could not find resource for " + str + ": " + attributeValue, true, e);
                }
            }
        }
        return attributeBooleanValue;
    }

    private String b(String str, Context context, AttributeSet attributeSet, boolean z) throws com.google.ads.internal.b {
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
                        throw new com.google.ads.internal.b("Resource " + str + " was not a string: " + typedValue, true);
                    }
                } catch (Resources.NotFoundException e) {
                    throw new com.google.ads.internal.b("Could not find resource for " + str + ": " + attributeValue, true, e);
                }
            }
        }
        if (z && attributeValue == null) {
            throw new com.google.ads.internal.b("Required XML attribute \"" + str + "\" missing", true);
        }
        return attributeValue;
    }

    private Set<String> c(String str, Context context, AttributeSet attributeSet, boolean z) throws com.google.ads.internal.b {
        String b = b(str, context, attributeSet, z);
        HashSet hashSet = new HashSet();
        if (b != null) {
            String[] split = b.split(",");
            for (String str2 : split) {
                String trim = str2.trim();
                if (trim.length() != 0) {
                    hashSet.add(trim);
                }
            }
        }
        return hashSet;
    }

    private boolean a(String str, AttributeSet attributeSet) {
        return attributeSet.getAttributeValue("http://schemas.android.com/apk/lib/com.google.ads", str) != null;
    }

    private void a(Activity activity, AdSize adSize, String str) throws com.google.ads.internal.b {
        FrameLayout frameLayout = new FrameLayout(activity);
        frameLayout.setFocusable(false);
        this.a = new com.google.ads.internal.d(this, activity, adSize, str, frameLayout, false);
        setGravity(17);
        try {
            ViewGroup a = com.google.ads.internal.j.a(activity, this.a);
            if (a != null) {
                a.addView(frameLayout, -2, -2);
                addView(a, -2, -2);
            } else {
                addView(frameLayout, -2, -2);
            }
        } catch (VerifyError e) {
            com.google.ads.util.b.a("Gestures disabled: Not supported on this version of Android.", e);
            addView(frameLayout, -2, -2);
        }
    }

    @Override // com.google.ads.Ad
    public boolean isReady() {
        if (this.a == null) {
            return false;
        }
        return this.a.r();
    }

    public boolean isRefreshing() {
        if (this.a == null) {
            return false;
        }
        return this.a.s();
    }

    @Override // com.google.ads.Ad
    public void loadAd(AdRequest adRequest) {
        if (this.a != null) {
            if (isRefreshing()) {
                this.a.e();
            }
            this.a.a(adRequest);
        }
    }

    @Override // com.google.ads.Ad
    public void setAdListener(AdListener adListener) {
        this.a.h().m.a(adListener);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setAppEventListener(AppEventListener appEventListener) {
        this.a.h().n.a(appEventListener);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSupportedAdSizes(AdSize... adSizes) {
        if (this.a.h().l.a() == null) {
            com.google.ads.util.b.b("Error: Tried to set supported ad sizes on a single-size AdView.");
        } else {
            a(adSizes);
        }
    }

    private void a(AdSize... adSizeArr) {
        AdSize[] adSizeArr2 = new AdSize[adSizeArr.length];
        for (int i = 0; i < adSizeArr.length; i++) {
            adSizeArr2[i] = AdSize.createAdSize(adSizeArr[i], getContext());
        }
        this.a.h().l.a(adSizeArr2);
    }

    @Override // android.widget.RelativeLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        AdWebView k = this.a.k();
        if (k != null) {
            k.setVisibility(0);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    @Override // com.google.ads.Ad
    public void stopLoading() {
        if (this.a != null) {
            this.a.A();
        }
    }
}
