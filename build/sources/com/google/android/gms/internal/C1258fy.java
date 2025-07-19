package com.google.android.gms.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.Notifications;

/* renamed from: com.google.android.gms.internal.fy */
public final class C1258fy implements Notifications {
    public void clear(GoogleApiClient apiClient, int notificationTypes) {
        Games.m1707j(apiClient).clearNotifications(notificationTypes);
    }

    public void clearAll(GoogleApiClient apiClient) {
        clear(apiClient, -1);
    }
}
