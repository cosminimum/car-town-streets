package com.google.android.gms.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.Notifications;
/* loaded from: classes.dex */
public final class fy implements Notifications {
    @Override // com.google.android.gms.games.Notifications
    public void clear(GoogleApiClient apiClient, int notificationTypes) {
        Games.j(apiClient).clearNotifications(notificationTypes);
    }

    @Override // com.google.android.gms.games.Notifications
    public void clearAll(GoogleApiClient apiClient) {
        clear(apiClient, -1);
    }
}
