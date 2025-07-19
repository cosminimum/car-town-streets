package com.tapjoy;

import android.content.Context;
import android.net.Uri;
import com.getjar.sdk.utilities.Utility;

public class TapjoyEvent {
    public static final int EVENT_TYPE_IAP = 1;
    public static final int EVENT_TYPE_SHUTDOWN = 2;
    static final String TAPJOY_EVENT = "Event";
    /* access modifiers changed from: private */
    public static TapjoyURLConnection tapjoyURLConnection = null;
    private Context context;

    public TapjoyEvent(Context ctx) {
        this.context = ctx;
        tapjoyURLConnection = new TapjoyURLConnection();
    }

    public void sendShutDownEvent() {
        sendEvent(2, (String) null);
    }

    public void sendIAPEvent(String name, float price, int quantity, String currencyCode) {
        sendEvent(1, (((createEventParameter("name") + "=" + Uri.encode(name)) + Utility.QUERY_APPENDIX + createEventParameter("price") + "=" + Uri.encode("" + price)) + Utility.QUERY_APPENDIX + createEventParameter("quantity") + "=" + Uri.encode("" + quantity)) + Utility.QUERY_APPENDIX + createEventParameter(TapjoyConstants.TJC_EVENT_IAP_CURRENCY_ID) + "=" + Uri.encode(currencyCode));
    }

    public String createEventParameter(String parameter) {
        return "ue[" + parameter + "]";
    }

    public void sendEvent(int type, String eventData) {
        TapjoyLog.i(TAPJOY_EVENT, "sendEvent type: " + type);
        String eventURLParams = (TapjoyConnectCore.getURLParams() + "&publisher_user_id=" + TapjoyConnectCore.getUserID()) + "&event_type_id=" + type;
        if (eventData != null && eventData.length() > 0) {
            eventURLParams = eventURLParams + Utility.QUERY_APPENDIX + eventData;
        }
        new Thread(new EventThread(eventURLParams)).start();
    }

    public class EventThread implements Runnable {
        private String params;

        public EventThread(String urlParams) {
            this.params = urlParams;
        }

        public void run() {
            TapjoyHttpURLResponse httpResponse = TapjoyEvent.tapjoyURLConnection.getResponseFromURL("https://ws.tapjoyads.com/user_events?", this.params, 1);
            if (httpResponse != null) {
                switch (httpResponse.statusCode) {
                    case 200:
                        TapjoyLog.i(TapjoyEvent.TAPJOY_EVENT, "Successfully sent Tapjoy event");
                        return;
                    case 400:
                        TapjoyLog.e(TapjoyEvent.TAPJOY_EVENT, "Error sending event: " + httpResponse.response);
                        return;
                    default:
                        TapjoyLog.e(TapjoyEvent.TAPJOY_EVENT, "Server/network error: " + httpResponse.statusCode);
                        return;
                }
            } else {
                TapjoyLog.e(TapjoyEvent.TAPJOY_EVENT, "Server/network error");
            }
        }
    }
}
