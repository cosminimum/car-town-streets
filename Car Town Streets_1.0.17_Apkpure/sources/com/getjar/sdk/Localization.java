package com.getjar.sdk;

import com.getjar.sdk.data.LocalizationEngine;
import com.getjar.sdk.listener.RecommendedPricesListener;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.SetExceptionFutureTask;
import java.util.Collection;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
/* loaded from: classes.dex */
public class Localization {
    private static final ExecutorService _ExecutorService = Executors.newCachedThreadPool();
    private LocalizationEngine _localizationEngine;

    public Localization(GetJarContext getJarContext) {
        this._localizationEngine = null;
        if (getJarContext == null) {
            throw new IllegalArgumentException("'getJarContext' can not be NULL");
        }
        this._localizationEngine = new LocalizationEngine(getJarContext.getCommContext());
    }

    public RecommendedPrices getRecommendedPrices(Collection<Pricing> prices) throws InterruptedException, ExecutionException {
        if (prices == null || prices.isEmpty()) {
            throw new IllegalArgumentException("'prices' cannot be null or empty");
        }
        return getRecommendedPricesAsync(prices).get();
    }

    public Future<RecommendedPrices> getRecommendedPricesAsync(Collection<Pricing> prices) {
        if (prices == null || prices.isEmpty()) {
            throw new IllegalArgumentException("'prices' cannot be null or empty");
        }
        SetExceptionFutureTask<RecommendedPrices> future = new SetExceptionFutureTask<>(new RecommendedPricesCallable(prices));
        _ExecutorService.execute(future);
        return future;
    }

    public Future<RecommendedPrices> getRecommendedPricesAsync(Collection<Pricing> prices, RecommendedPricesListener recommendedPricesListener) {
        if (prices == null || prices.isEmpty()) {
            throw new IllegalArgumentException("'prices' cannot be null or empty");
        }
        if (recommendedPricesListener == null) {
            throw new IllegalArgumentException("recommendedPricesListener cannot be null");
        }
        SetExceptionFutureTask<RecommendedPrices> future = new SetExceptionFutureTask<>(new RecommendedPricesCallable(this, prices, recommendedPricesListener));
        _ExecutorService.execute(future);
        return future;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class RecommendedPricesCallable implements Callable<RecommendedPrices> {
        private RecommendedPricesListener listener;
        private Collection<Pricing> prices;

        public RecommendedPricesCallable(Collection<Pricing> prices) {
            if (prices == null || prices.isEmpty()) {
                throw new IllegalArgumentException("'prices' cannot be null or empty");
            }
            this.prices = prices;
        }

        public RecommendedPricesCallable(Localization localization, Collection<Pricing> prices, RecommendedPricesListener recommendedPricesListener) {
            this(prices);
            if (recommendedPricesListener == null) {
                throw new IllegalArgumentException("recommendedPricesListener cannot be null");
            }
            this.listener = recommendedPricesListener;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        /* renamed from: call */
        public RecommendedPrices mo30call() throws InterruptedException, ExecutionException {
            RecommendedPrices recPrices = null;
            try {
                recPrices = Localization.this._localizationEngine.getRecommendedPrices(this.prices);
                return recPrices;
            } finally {
                if (this.listener != null) {
                    try {
                        this.listener.recommendedPricesEvent(recPrices);
                    } catch (Exception e) {
                        Logger.w(Area.LOCALIZATION.value(), "RecommendedPricesCallable call() Callback failed!", e);
                    }
                }
            }
        }
    }
}
