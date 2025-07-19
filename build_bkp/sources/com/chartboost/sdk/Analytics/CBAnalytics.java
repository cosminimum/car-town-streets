package com.chartboost.sdk.Analytics;

import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.impl.C0181j;
import com.chartboost.sdk.impl.C0186k;
import com.google.analytics.tracking.android.HitTypes;
import com.google.android.gms.plus.PlusShare;
import java.math.BigDecimal;
import java.util.Map;
import org.json.JSONObject;

public class CBAnalytics {
    public static final String TAG = "Chartboost Analytics";

    /* renamed from: a */
    private static CBAnalytics f1a = null;

    /* renamed from: b */
    private C0181j f2b = new C0181j((String) null, (C0181j.C0185c) null, "CBAnalytics");

    public static synchronized CBAnalytics sharedAnalytics() {
        CBAnalytics cBAnalytics;
        synchronized (CBAnalytics.class) {
            if (f1a == null) {
                f1a = new CBAnalytics();
            }
            cBAnalytics = f1a;
        }
        return cBAnalytics;
    }

    private CBAnalytics() {
        this.f2b.mo1456a();
    }

    /* renamed from: a */
    private String m2a(double d, int i, int i2) {
        return new StringBuilder(String.valueOf(new BigDecimal(d).setScale(i, i2).doubleValue())).toString();
    }

    public Boolean recordPaymentTransaction(String sku, String title, double price, String currency, int quantity, Map<String, Object> meta) {
        C0038Chartboost sharedChartboost = C0038Chartboost.sharedChartboost();
        if (sharedChartboost.getContext() == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling recordPaymentTransaction().");
        } else if (sharedChartboost.getAppID() == null || sharedChartboost.getAppSignature() == null) {
            return false;
        } else {
            C0186k kVar = new C0186k("api", "purchase");
            kVar.mo1466a(sharedChartboost.getContext());
            kVar.mo1467a("product_id", sku);
            kVar.mo1467a(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_TITLE, title);
            kVar.mo1467a("price", m2a(price, 2, 4));
            kVar.mo1467a("currency", currency);
            kVar.mo1467a("quantity", new StringBuilder(String.valueOf(quantity)).toString());
            kVar.mo1467a("timestamp", new StringBuilder(String.valueOf(((double) System.currentTimeMillis()) / 1000.0d)).toString());
            if (meta != null) {
                kVar.mo1467a("meta", new JSONObject(meta).toString());
            }
            kVar.mo1471c(sharedChartboost.getAppID(), sharedChartboost.getAppSignature());
            this.f2b.mo1457a(kVar);
            return true;
        }
    }

    public Boolean trackEvent(String eventIdentifier) {
        return trackEvent(eventIdentifier, 1.0d, (Map<String, Object>) null);
    }

    public Boolean trackEvent(String eventIdentifier, double value) {
        return trackEvent(eventIdentifier, value, (Map<String, Object>) null);
    }

    public Boolean trackEvent(String eventIdentifier, double value, Map<String, Object> meta) {
        C0038Chartboost sharedChartboost = C0038Chartboost.sharedChartboost();
        if (sharedChartboost.getContext() == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling trackEvent().");
        } else if (sharedChartboost.getAppID() == null || sharedChartboost.getAppSignature() == null) {
            return false;
        } else {
            C0186k kVar = new C0186k("api", HitTypes.EVENT);
            kVar.mo1466a(sharedChartboost.getContext());
            kVar.mo1467a("key", eventIdentifier);
            kVar.mo1467a("value", new StringBuilder(String.valueOf(value)).toString());
            kVar.mo1467a("timestamp", new StringBuilder(String.valueOf(((double) System.currentTimeMillis()) / 1000.0d)).toString());
            if (meta != null) {
                kVar.mo1467a("meta", new JSONObject(meta).toString());
            }
            kVar.mo1471c(sharedChartboost.getAppID(), sharedChartboost.getAppSignature());
            kVar.f312i = true;
            this.f2b.mo1457a(kVar);
            return true;
        }
    }
}
