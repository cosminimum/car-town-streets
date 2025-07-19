package com.getjar.sdk.logging;

import android.content.Context;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public interface AppenderInterface {
    void configureAppender(Context context);

    long getAreas();

    int getLevel();

    boolean isAreaActive(long j);

    boolean isEnabled();

    boolean isLevelActive(int i);

    void log(LogMessage logMessage);
}
