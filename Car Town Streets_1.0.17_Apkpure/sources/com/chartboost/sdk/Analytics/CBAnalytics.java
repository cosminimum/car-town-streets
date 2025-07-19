package com.chartboost.sdk.Analytics;

import com.chartboost.sdk.Chartboost;
import com.chartboost.sdk.impl.j;
import com.chartboost.sdk.impl.k;
import com.google.analytics.tracking.android.HitTypes;
import com.google.android.gms.plus.PlusShare;
import java.math.BigDecimal;
import java.util.Map;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class CBAnalytics {
    public static final String TAG = "Chartboost Analytics";
    private static CBAnalytics a = null;
    private j b = new j(null, null, "CBAnalytics");

    public static synchronized CBAnalytics sharedAnalytics() {
        CBAnalytics cBAnalytics;
        synchronized (CBAnalytics.class) {
            if (a == null) {
                a = new CBAnalytics();
            }
            cBAnalytics = a;
        }
        return cBAnalytics;
    }

    private CBAnalytics() {
        this.b.a();
    }

    private String a(double d, int i, int i2) {
        return new StringBuilder(String.valueOf(new BigDecimal(d).setScale(i, i2).doubleValue())).toString();
    }

    public Boolean recordPaymentTransaction(String sku, String title, double price, String currency, int quantity, Map<String, Object> meta) {
        Chartboost sharedChartboost = Chartboost.sharedChartboost();
        if (sharedChartboost.getContext() == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling recordPaymentTransaction().");
        }
        if (sharedChartboost.getAppID() == null || sharedChartboost.getAppSignature() == null) {
            return false;
        }
        k kVar = new k("api", "purchase");
        kVar.a(sharedChartboost.getContext());
        kVar.a("product_id", sku);
        kVar.a(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_TITLE, title);
        kVar.a("price", a(price, 2, 4));
        kVar.a("currency", currency);
        kVar.a("quantity", new StringBuilder(String.valueOf(quantity)).toString());
        kVar.a("timestamp", new StringBuilder(String.valueOf(System.currentTimeMillis() / 1000.0d)).toString());
        if (meta != null) {
            kVar.a("meta", new JSONObject(meta).toString());
        }
        kVar.c(sharedChartboost.getAppID(), sharedChartboost.getAppSignature());
        this.b.a(kVar);
        return true;
    }

    public Boolean trackEvent(String eventIdentifier) {
        return trackEvent(eventIdentifier, 1.0d, null);
    }

    public Boolean trackEvent(String eventIdentifier, double value) {
        return trackEvent(eventIdentifier, value, null);
    }

    public Boolean trackEvent(String eventIdentifier, double value, Map<String, Object> meta) {
        Chartboost sharedChartboost = Chartboost.sharedChartboost();
        if (sharedChartboost.getContext() == null) {
            throw new IllegalStateException("The context must be set through the Chartboost method onCreate() before calling trackEvent().");
        }
        if (sharedChartboost.getAppID() == null || sharedChartboost.getAppSignature() == null) {
            return false;
        }
        k kVar = new k("api", HitTypes.EVENT);
        kVar.a(sharedChartboost.getContext());
        kVar.a("key", eventIdentifier);
        kVar.a("value", new StringBuilder(String.valueOf(value)).toString());
        kVar.a("timestamp", new StringBuilder(String.valueOf(System.currentTimeMillis() / 1000.0d)).toString());
        if (meta != null) {
            kVar.a("meta", new JSONObject(meta).toString());
        }
        kVar.c(sharedChartboost.getAppID(), sharedChartboost.getAppSignature());
        kVar.i = true;
        this.b.a(kVar);
        return true;
    }
}
