package com.tapjoy;

import android.content.Context;
import android.content.Intent;
import com.google.android.gms.drive.DriveFile;

public class TapjoyReEngagementAd {
    /* access modifiers changed from: private */
    public static String htmlData;
    /* access modifiers changed from: private */
    public static TapjoyReEngagementAdNotifier reEngagementAdNotifier;
    public static String reEngagementAdURLParams;
    /* access modifiers changed from: private */
    public static TapjoyURLConnection tapjoyURLConnection = null;
    final String TAPJOY_RE_ENGAGEMENT = "Re-engagement";
    private Context context;
    private String currencyID;

    public TapjoyReEngagementAd(Context ctx) {
        this.context = ctx;
        tapjoyURLConnection = new TapjoyURLConnection();
    }

    public void getReEngagementAd(TapjoyReEngagementAdNotifier notifier) {
        TapjoyLog.i("Re-engagement", "Getting Re-engagement Ad");
        getReEngagementAdWithCurrencyID((String) null, notifier);
    }

    public void getReEngagementAdWithCurrencyID(String theCurrencyID, TapjoyReEngagementAdNotifier notifier) {
        this.currencyID = theCurrencyID;
        TapjoyLog.i("Re-engagement", "Getting Re-engagement ad userID: " + TapjoyConnectCore.getUserID() + ", currencyID: " + this.currencyID);
        reEngagementAdNotifier = notifier;
        reEngagementAdURLParams = TapjoyConnectCore.getURLParams();
        reEngagementAdURLParams += "&publisher_user_id=" + TapjoyConnectCore.getUserID();
        if (this.currencyID != null) {
            reEngagementAdURLParams += "&currency_id=" + this.currencyID;
        }
        new Thread(new Runnable() {
            public void run() {
                TapjoyHttpURLResponse httpResponse = TapjoyReEngagementAd.tapjoyURLConnection.getResponseFromURL("https://ws.tapjoyads.com/reengagement_rewards?", TapjoyReEngagementAd.reEngagementAdURLParams);
                if (httpResponse != null) {
                    switch (httpResponse.statusCode) {
                        case 200:
                            String unused = TapjoyReEngagementAd.htmlData = httpResponse.response;
                            TapjoyReEngagementAd.reEngagementAdNotifier.getReEngagementAdResponse();
                            return;
                        case 204:
                            TapjoyReEngagementAd.reEngagementAdNotifier.getReEngagementAdResponseFailed(1);
                            return;
                        default:
                            return;
                    }
                } else {
                    TapjoyReEngagementAd.reEngagementAdNotifier.getReEngagementAdResponseFailed(2);
                }
            }
        }).start();
    }

    public void showReEngagementFullScreenAd() {
        TapjoyLog.i("Re-engagement", "Displaying Re-engagement ad...");
        if (htmlData != null && htmlData.length() != 0) {
            Intent intent = new Intent(this.context, TapjoyReEngagementAdWebView.class);
            intent.setFlags(DriveFile.MODE_READ_ONLY);
            intent.putExtra(TapjoyConstants.EXTRA_RE_ENGAGEMENT_HTML_DATA, htmlData);
            this.context.startActivity(intent);
        }
    }
}
