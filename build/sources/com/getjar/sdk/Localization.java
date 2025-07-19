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

public class Localization {
    private static final ExecutorService _ExecutorService = Executors.newCachedThreadPool();
    /* access modifiers changed from: private */
    public LocalizationEngine _localizationEngine = null;

    public Localization(GetJarContext getJarContext) {
        if (getJarContext == null) {
            throw new IllegalArgumentException("'getJarContext' can not be NULL");
        }
        this._localizationEngine = new LocalizationEngine(getJarContext.getCommContext());
    }

    public RecommendedPrices getRecommendedPrices(Collection<Pricing> prices) throws InterruptedException, ExecutionException {
        if (prices != null && !prices.isEmpty()) {
            return getRecommendedPricesAsync(prices).get();
        }
        throw new IllegalArgumentException("'prices' cannot be null or empty");
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
        } else if (recommendedPricesListener == null) {
            throw new IllegalArgumentException("recommendedPricesListener cannot be null");
        } else {
            SetExceptionFutureTask<RecommendedPrices> future = new SetExceptionFutureTask<>(new RecommendedPricesCallable(this, prices, recommendedPricesListener));
            _ExecutorService.execute(future);
            return future;
        }
    }

    private class RecommendedPricesCallable implements Callable<RecommendedPrices> {
        private RecommendedPricesListener listener;
        private Collection<Pricing> prices;

        public RecommendedPricesCallable(Collection<Pricing> prices2) {
            if (prices2 == null || prices2.isEmpty()) {
                throw new IllegalArgumentException("'prices' cannot be null or empty");
            }
            this.prices = prices2;
        }

        public RecommendedPricesCallable(Localization localization, Collection<Pricing> prices2, RecommendedPricesListener recommendedPricesListener) {
            this(prices2);
            if (recommendedPricesListener == null) {
                throw new IllegalArgumentException("recommendedPricesListener cannot be null");
            }
            this.listener = recommendedPricesListener;
        }

        public RecommendedPrices call() throws InterruptedException, ExecutionException {
            RecommendedPricesListener recommendedPricesListener;
            RecommendedPrices recPrices = null;
            try {
                recPrices = Localization.this._localizationEngine.getRecommendedPrices(this.prices);
                if (recommendedPricesListener != null) {
                    try {
                    } catch (Exception e) {
                        Logger.m649w(Area.LOCALIZATION.value(), "RecommendedPricesCallable call() Callback failed!", e);
                    }
                }
                return recPrices;
            } finally {
                if (this.listener != null) {
                    try {
                        this.listener.recommendedPricesEvent(recPrices);
                    } catch (Exception e2) {
                        Logger.m649w(Area.LOCALIZATION.value(), "RecommendedPricesCallable call() Callback failed!", e2);
                    }
                }
            }
        }
    }
}
