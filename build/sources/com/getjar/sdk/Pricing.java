package com.getjar.sdk;

import com.google.android.gms.maps.model.BitmapDescriptorFactory;

public class Pricing {
    private final int basePrice;
    private Float maxDiscount;
    private Float maxMarkup;

    public Pricing(int theBasePrice, Float theMaxDiscountPercent, Float theMaxMarkupPercent) {
        this(theBasePrice);
        if (theMaxDiscountPercent != null && (theMaxDiscountPercent.floatValue() < BitmapDescriptorFactory.HUE_RED || theMaxDiscountPercent.floatValue() > 1.0f)) {
            throw new IllegalArgumentException("theMaxDiscountPercent should be between 0 and 1");
        } else if (theMaxMarkupPercent == null || (theMaxMarkupPercent.floatValue() >= BitmapDescriptorFactory.HUE_RED && theMaxMarkupPercent.floatValue() <= 2.0f)) {
            this.maxDiscount = theMaxDiscountPercent;
            this.maxMarkup = theMaxMarkupPercent;
        } else {
            throw new IllegalArgumentException("theMaxMarkupPercent should be between 0 and 2");
        }
    }

    public Pricing(int theBasePrice) {
        if (theBasePrice < 0) {
            throw new IllegalArgumentException("theBasePrice should be greater than or equal to 0");
        }
        this.basePrice = theBasePrice;
    }

    public int getBasePrice() {
        return this.basePrice;
    }

    public Float getMaxDiscountPercent() {
        return this.maxDiscount;
    }

    public Float getMaxMarkupPercent() {
        return this.maxMarkup;
    }

    public boolean equals(Object o) {
        if (o == null || !o.getClass().isAssignableFrom(Pricing.class) || ((Pricing) o).hashCode() != hashCode()) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        StringBuilder builder = new StringBuilder();
        builder.append(this.basePrice);
        if (this.maxDiscount != null) {
            builder.append(this.maxDiscount);
        }
        if (this.maxMarkup != null) {
            builder.append(this.maxMarkup);
        }
        return builder.toString().hashCode();
    }
}
