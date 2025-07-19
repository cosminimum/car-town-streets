package com.getjar.sdk.data;

import com.getjar.sdk.Pricing;
import com.getjar.sdk.RecommendedPrices;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.LocalizationCachingManager;
import com.getjar.sdk.comm.LocalizationServiceProxy;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.ResultCachingManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import java.util.Collection;
import java.util.HashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class LocalizationEngine {
    private static final ExecutorService _ExecutorService = Executors.newCachedThreadPool();
    private CommContext _commContext;
    private LocalizationCachingManager _localizationCachingManager;

    public LocalizationEngine(CommContext commContext) {
        this._commContext = null;
        this._localizationCachingManager = null;
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        }
        this._commContext = commContext;
        this._localizationCachingManager = new LocalizationCachingManager(this._commContext);
    }

    public RecommendedPrices getRecommendedPrices(Collection<Pricing> prices) throws InterruptedException, ExecutionException {
        RecommendedPrices recommendedPrices = getRecommendedPricesInternal(prices, false);
        if (recommendedPrices != null) {
            return recommendedPrices;
        }
        RecommendedPrices recommendedPrices2 = getRecommendedPricesInternal(prices, true);
        if (recommendedPrices2 != null) {
            retrieveRecommendedPricesAsync(prices);
            return recommendedPrices2;
        }
        refreshRecommendedPricesCache(prices);
        return getRecommendedPricesInternal(prices, true);
    }

    private RecommendedPrices getRecommendedPricesInternal(Collection<Pricing> prices, boolean allowStale) throws InterruptedException, ExecutionException {
        Integer recommendedPrice;
        if (prices == null || prices.isEmpty()) {
            throw new IllegalArgumentException("prices cannot be null or empty");
        }
        Logger.d(Area.LOCALIZATION.value(), "LocalizationEngine getRecommendedPricesInternal() start");
        HashMap<Pricing, Integer> recommendedPrices = new HashMap<>(prices.size());
        for (Pricing price : prices) {
            if (!allowStale) {
                recommendedPrice = this._localizationCachingManager.getValidCachedPrice(Integer.toString(price.hashCode()));
            } else {
                recommendedPrice = this._localizationCachingManager.getCachedPrice(Integer.toString(price.hashCode()));
            }
            if (recommendedPrice != null) {
                recommendedPrices.put(price, recommendedPrice);
            } else {
                Logger.d(Area.LOCALIZATION.value(), "LocalizationEngine getRecommendedPricesInternal() returning null");
                return null;
            }
        }
        return new RecommendedPrices(recommendedPrices);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void refreshRecommendedPricesCache(Collection<Pricing> prices) throws InterruptedException, ExecutionException {
        if (prices == null || prices.isEmpty()) {
            throw new IllegalArgumentException("prices cannot be null or empty");
        }
        Operation operation = LocalizationServiceProxy.getInstance().getRecommendedPrices(this._commContext, prices);
        Result result = operation.mo38get();
        if (result.isSuccessfulResponse()) {
            try {
                JSONArray arr = result.getResponseJson().getJSONArray("return");
                Long ttl = ResultCachingManager.getTtlFromResult(result);
                String eTag = ResultCachingManager.getETagFromResult(result);
                for (int i = 0; i < arr.length(); i++) {
                    JSONObject obj = arr.getJSONObject(i);
                    this._localizationCachingManager.addPricingToCache(obj.getString("key"), obj.getInt("value"), ttl, eTag);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    private void retrieveRecommendedPricesAsync(final Collection<Pricing> prices) {
        if (prices == null || prices.isEmpty()) {
            throw new IllegalArgumentException("prices cannot be null or empty");
        }
        _ExecutorService.execute(new Runnable() { // from class: com.getjar.sdk.data.LocalizationEngine.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    LocalizationEngine.this.refreshRecommendedPricesCache(prices);
                } catch (Exception e) {
                    Logger.e(Area.LOCALIZATION.value(), "LocalizationEngine retrieveFailed ", e);
                }
            }
        });
    }
}
