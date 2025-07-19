package com.getjar.sdk;

import java.util.Map;
/* loaded from: classes.dex */
public class RecommendedPrices {
    private final Map<Pricing, Integer> prices;

    public RecommendedPrices(Map<Pricing, Integer> thePrices) {
        if (thePrices == null || thePrices.isEmpty()) {
            throw new IllegalArgumentException("'thePrices' cannot be null or empty");
        }
        this.prices = thePrices;
    }

    public Integer getRecommendedPrice(Pricing theLookup) {
        if (theLookup == null) {
            throw new IllegalArgumentException("theLookup cannot be null");
        }
        return this.prices.get(theLookup);
    }

    public int count() {
        return this.prices.size();
    }
}
