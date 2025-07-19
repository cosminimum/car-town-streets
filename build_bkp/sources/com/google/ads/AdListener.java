package com.google.ads;

import com.google.ads.AdRequest;

public interface AdListener {
    void onDismissScreen(C0423Ad ad);

    void onFailedToReceiveAd(C0423Ad ad, AdRequest.ErrorCode errorCode);

    void onLeaveApplication(C0423Ad ad);

    void onPresentScreen(C0423Ad ad);

    void onReceiveAd(C0423Ad ad);
}
