package com.getjar.sdk;

import java.util.Map;

public class RecommendedPrices {
    private final Map<Pricing, Integer> prices;

    public RecommendedPrices(Map<Pricing, Integer> thePrices) {
        if (thePrices == null || thePrices.isEmpty()) {
            throw new IllegalArgumentException("'thePrices' cannot be null or empty");
        }
        this.prices = thePrices;
    }

    public Integer getRecommendedPrice(Pricing theLookup) {
        if (theLookup != null) {
            return this.prices.get(theLookup);
        }
        throw new IllegalArgumentException("theLookup cannot be null");
    }

    public int count() {
        return this.prices.size();
    }
}
