package com.getjar.sdk.rewards;

public enum GooglePlayLaunchReason {
    REDEEM,
    CHECKOUT;
    
    private static final String _SupportedReasons = null;

    static {
        StringBuilder supportedReasons = new StringBuilder();
        for (int i = 0; i < values().length; i++) {
            supportedReasons.append(values()[i].name());
            if (i < values().length) {
                supportedReasons.append(", ");
            }
        }
        _SupportedReasons = supportedReasons.toString();
    }

    public static String getSupportedReasons() {
        return _SupportedReasons;
    }
}
