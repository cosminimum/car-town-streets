package com.google.analytics.tracking.android;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import java.io.IOException;
import java.io.OutputStream;
/* loaded from: classes.dex */
public class CampaignTrackingService extends IntentService {
    public CampaignTrackingService(String name) {
        super(name);
    }

    public CampaignTrackingService() {
        super("CampaignIntentService");
    }

    @Override // android.app.IntentService
    public void onHandleIntent(Intent intent) {
        processIntent(this, intent);
    }

    public void processIntent(Context context, Intent intent) {
        String campaign = intent.getStringExtra("referrer");
        try {
            OutputStream output = context.openFileOutput("gaInstallData", 0);
            output.write(campaign.getBytes());
            output.close();
        } catch (IOException e) {
            Log.e("Error storing install campaign.");
        }
    }
}
