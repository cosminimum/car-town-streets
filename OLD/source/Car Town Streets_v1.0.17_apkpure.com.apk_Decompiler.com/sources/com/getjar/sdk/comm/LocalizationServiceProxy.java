package com.getjar.sdk.comm;

import com.getjar.sdk.Pricing;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Request;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.exceptions.ConfigurationException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Utility;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collection;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class LocalizationServiceProxy extends ServiceProxyBase {
    private static final String _CONTRACT_VERSION = "20121130";
    private static volatile LocalizationServiceProxy _Instance = null;
    private static final String _URL_TEMPLATE_GOLD_BUCKETS = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$slocalization/platforms/android/gold_offers/?country_code=%2$s&version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_RECOMMENDED_PRICES = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$slocalization/recommended_prices/generate?version=", _CONTRACT_VERSION});

    private LocalizationServiceProxy() {
    }

    private static synchronized void makeTheInstance() {
        synchronized (LocalizationServiceProxy.class) {
            if (_Instance == null) {
                _Instance = new LocalizationServiceProxy();
            }
        }
    }

    public static LocalizationServiceProxy getInstance() {
        if (_Instance == null) {
            makeTheInstance();
        }
        return _Instance;
    }

    /* access modifiers changed from: protected */
    public Request.ServiceName getServiceName() {
        return Request.ServiceName.LOCALIZATION;
    }

    public Operation getRecommendedPrices(CommContext commContext, Collection<Pricing> prices) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (prices == null || prices.isEmpty()) {
            throw new IllegalArgumentException("The required parameter 'prices' was not provided");
        } else {
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            String url = String.format(Locale.US, _URL_TEMPLATE_RECOMMENDED_PRICES, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_LOCALIZATION_SERVICE_ENDPOINT)});
            HashMap<String, JSONObject> hashMap = new HashMap<>(prices.size());
            for (Pricing price : prices) {
                hashMap.put(Integer.toString(price.hashCode()), getPricingJson(price));
            }
            Logger.d(Area.LOCALIZATION.value() | Area.COMM.value(), "LocalizationServiceProxy getRecommendedPrices size:" + hashMap.size());
            HashMap<String, String> postData = new HashMap<>(1);
            try {
                postData.put("pricings", Utility.jsonObjectMapToJsonString(hashMap));
                return makeAsyncPOSTRequestForJson("getRecommendedPrices", Operation.Priority.MEDIUM, commContext, url, postData, (Map<String, String>) null, (CallbackInterface) null, true, true, true);
            } catch (JSONException e) {
                throw new IllegalArgumentException(e);
            }
        }
    }

    public Operation getGoldOffers(CommContext commContext) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        }
        AuthManager.initialize(commContext.getApplicationContext());
        AuthManager.getInstance().waitOnAuth();
        String isoCountryCode = commContext.getApplicationContext().getResources().getConfiguration().locale.getCountry();
        try {
            return makeAsyncGETRequestForJson("getGoldOffers", Operation.Priority.MEDIUM, commContext, String.format(Locale.US, _URL_TEMPLATE_GOLD_BUCKETS, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_LOCALIZATION_SERVICE_ENDPOINT), URLEncoder.encode(isoCountryCode, "UTF-8")}), (Map<String, String>) null, (CallbackInterface) null, true, false, true);
        } catch (UnsupportedEncodingException e) {
            throw new ConfigurationException((Throwable) e);
        }
    }

    private JSONObject getPricingJson(Pricing pricing) {
        if (pricing == null) {
            throw new IllegalArgumentException("'pricing' cannot be null");
        }
        JSONObject obj = new JSONObject();
        try {
            obj.put("base_price", pricing.getBasePrice());
            Float maxPercent = pricing.getMaxDiscountPercent();
            if (maxPercent != null) {
                obj.put("max_discount_percent", maxPercent);
            }
            Float maxPercent2 = pricing.getMaxMarkupPercent();
            if (maxPercent2 != null) {
                obj.put("max_mark_up_percent", maxPercent2);
            }
            return obj;
        } catch (JSONException e) {
            throw new IllegalStateException(e);
        }
    }
}
