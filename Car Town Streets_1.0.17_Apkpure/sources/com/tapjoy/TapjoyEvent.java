package com.tapjoy;

import android.content.Context;
import android.net.Uri;
import com.getjar.sdk.utilities.Utility;
/* loaded from: classes.dex */
public class TapjoyEvent {
    public static final int EVENT_TYPE_IAP = 1;
    public static final int EVENT_TYPE_SHUTDOWN = 2;
    static final String TAPJOY_EVENT = "Event";
    private static TapjoyURLConnection tapjoyURLConnection = null;
    private Context context;

    public TapjoyEvent(Context ctx) {
        this.context = ctx;
        tapjoyURLConnection = new TapjoyURLConnection();
    }

    public void sendShutDownEvent() {
        sendEvent(2, null);
    }

    public void sendIAPEvent(String name, float price, int quantity, String currencyCode) {
        String params = createEventParameter("name") + "=" + Uri.encode(name);
        sendEvent(1, ((params + Utility.QUERY_APPENDIX + createEventParameter("price") + "=" + Uri.encode("" + price)) + Utility.QUERY_APPENDIX + createEventParameter("quantity") + "=" + Uri.encode("" + quantity)) + Utility.QUERY_APPENDIX + createEventParameter(TapjoyConstants.TJC_EVENT_IAP_CURRENCY_ID) + "=" + Uri.encode(currencyCode));
    }

    public String createEventParameter(String parameter) {
        return "ue[" + parameter + "]";
    }

    public void sendEvent(int type, String eventData) {
        TapjoyLog.i(TAPJOY_EVENT, "sendEvent type: " + type);
        String eventURLParams = TapjoyConnectCore.getURLParams();
        String eventURLParams2 = (eventURLParams + "&publisher_user_id=" + TapjoyConnectCore.getUserID()) + "&event_type_id=" + type;
        if (eventData != null && eventData.length() > 0) {
            eventURLParams2 = eventURLParams2 + Utility.QUERY_APPENDIX + eventData;
        }
        new Thread(new EventThread(eventURLParams2)).start();
    }

    /* loaded from: classes.dex */
    public class EventThread implements Runnable {
        private String params;

        public EventThread(String urlParams) {
            this.params = urlParams;
        }

        @Override // java.lang.Runnable
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
            }
            TapjoyLog.e(TapjoyEvent.TAPJOY_EVENT, "Server/network error");
        }
    }
}
