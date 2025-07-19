package com.miniclip.googlebilling;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public class Inventory {
    Map<String, SkuDetails> mSkuMap = new HashMap();
    Map<String, Purchase> mPurchaseMap = new HashMap();

    public SkuDetails getSkuDetails(String sku) {
        return this.mSkuMap.get(sku);
    }

    public Purchase getPurchase(String sku) {
        return this.mPurchaseMap.get(sku);
    }

    public boolean hasPurchase(String sku) {
        return this.mPurchaseMap.containsKey(sku);
    }

    public boolean hasDetails(String sku) {
        return this.mSkuMap.containsKey(sku);
    }

    public void erasePurchase(String sku) {
        if (this.mPurchaseMap.containsKey(sku)) {
            this.mPurchaseMap.remove(sku);
        }
    }

    public List<String> getAllOwnedSkus() {
        return new ArrayList(this.mPurchaseMap.keySet());
    }

    public List<Purchase> getAllPurchases() {
        return new ArrayList(this.mPurchaseMap.values());
    }

    public List<SkuDetails> getAllSkuDetails() {
        return new ArrayList(this.mSkuMap.values());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addSkuDetails(SkuDetails d) {
        this.mSkuMap.put(d.getSku(), d);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addPurchase(Purchase p) {
        this.mPurchaseMap.put(p.getSku(), p);
    }
}
