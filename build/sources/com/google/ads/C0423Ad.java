package com.google.ads;

/* renamed from: com.google.ads.Ad */
public interface C0423Ad {
    boolean isReady();

    void loadAd(AdRequest adRequest);

    void setAdListener(AdListener adListener);

    void stopLoading();
}
