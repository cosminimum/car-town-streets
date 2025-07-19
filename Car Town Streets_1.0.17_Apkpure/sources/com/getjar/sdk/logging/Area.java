package com.getjar.sdk.logging;

import java.util.Locale;
/* loaded from: classes.dex */
public enum Area {
    USAGE(2),
    LICENSING(4),
    LOCALIZATION(8),
    AUTH(16),
    COMM(32),
    TRANSACTION(64),
    STORAGE(128),
    EARN(256),
    PURCHASE(512),
    UI(1024),
    DEVELOPER_API(2048),
    CONFIG(4096),
    OS_ENTRY_POINT(8192),
    BUY_GOLD(16384),
    STATS(32768),
    LOGGING(65536),
    JS_API(131072),
    REDEEM(262144),
    OFFER(524288),
    ALL(Long.MAX_VALUE),
    TEST(4611686018427387904L);
    
    private long value;

    Area(long value) {
        this.value = value;
    }

    public long value() {
        return this.value;
    }

    public static boolean areasOverlap(long valueA, long valueB) {
        return (valueA & valueB) != 0;
    }

    public static String toString(long value) {
        String result = "";
        Area[] arr$ = values();
        for (Area area : arr$) {
            if ((area.value() & value) == area.value()) {
                if (result.length() <= 0) {
                    result = area.name();
                } else {
                    result = String.format(Locale.US, "%1$s|%2$s", result, area.name());
                }
            }
        }
        return result;
    }
}
