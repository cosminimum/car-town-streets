package com.tapjoy;

public interface TapjoyFeaturedAppNotifier {
    void getFeaturedAppResponse(TapjoyFeaturedAppObject tapjoyFeaturedAppObject);

    void getFeaturedAppResponseFailed(String str);
}
