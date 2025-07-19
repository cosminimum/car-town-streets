package com.getjar.sdk.comm;

import android.content.Context;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Request;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.data.ReportUsageData;
import com.getjar.sdk.data.usage.UsageManager;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ReportUsageProxy extends ServiceProxyBase {
    private static final String _CONTRACT_VERSION = "20121001";
    private static volatile ReportUsageProxy _Instance = null;
    private static final String _URL_TEMPLATE_APPLICATION_REPORT_USAGE = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$suser/devices/%2$s/apps/report_usage?version=", _CONTRACT_VERSION});

    private ReportUsageProxy() {
    }

    private static synchronized void makeTheInstance() {
        synchronized (ReportUsageProxy.class) {
            if (_Instance == null) {
                _Instance = new ReportUsageProxy();
            }
        }
    }

    public static ReportUsageProxy getInstance() {
        if (_Instance == null) {
            makeTheInstance();
        }
        return _Instance;
    }

    /* access modifiers changed from: protected */
    public Request.ServiceName getServiceName() {
        return Request.ServiceName.USER;
    }

    public Operation reportApplicationUsage(CommContext commContext, List<ReportUsageData> appUsageList) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (appUsageList == null) {
            throw new IllegalArgumentException("The required parameter 'appUsageList' was not provided");
        } else if (appUsageList.size() <= 0) {
            throw new IllegalArgumentException("The required parameter 'appUsageList' contains no data");
        } else {
            List<ReportUsageData> filteredAppUsageList = filterAppUsageDataList(commContext.getApplicationContext(), appUsageList);
            Logger.d(Area.USAGE.value() | Area.COMM.value(), String.format(Locale.US, "Filtered usage records to report from %1$d to %2$d", new Object[]{Integer.valueOf(appUsageList.size()), Integer.valueOf(filteredAppUsageList.size())}));
            if (filteredAppUsageList.size() <= 0) {
                return null;
            }
            StringBuilder sb = new StringBuilder("");
            Iterator<ReportUsageData> appUsageItr = filteredAppUsageList.iterator();
            sb.append("[");
            while (appUsageItr.hasNext()) {
                try {
                    sb.append(appUsageDataToJson(appUsageItr.next()));
                    if (appUsageItr.hasNext()) {
                        sb.append(",");
                    }
                } catch (Exception e) {
                    Logger.e(Area.USAGE.value() | Area.COMM.value(), "appUsageDataToJson() failed", e);
                }
            }
            sb.append("]");
            Map<String, String> postData = new HashMap<>(1);
            postData.put("app_usage_data", sb.toString());
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            try {
                return makeAsyncPOSTRequestForJson("reportApplicationUsage", Operation.Priority.LOW, commContext, String.format(Locale.US, _URL_TEMPLATE_APPLICATION_REPORT_USAGE, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_REPORT_USAGE_ENDPOINT), URLEncoder.encode(AuthManager.getInstance().getUserDeviceId(), "UTF-8")}), postData, (Map<String, String>) null, (CallbackInterface) null, true, true, false);
            } catch (UnsupportedEncodingException e2) {
                throw new CommunicationException((Throwable) e2);
            }
        }
    }

    private List<ReportUsageData> filterAppUsageDataList(Context context, List<ReportUsageData> appUsageList) {
        List<ReportUsageData> filteredAppUsageList = new ArrayList<>();
        for (ReportUsageData appData : appUsageList) {
            if ((StringUtility.isNullOrEmpty(appData.getPackageName()) || !UsageManager.getInstance(context).shouldFilterFromUsage(appData.getPackageName())) && !UsageManager.getInstance(context).shouldFilterTypeFromUsage(appData.getUsageType())) {
                filteredAppUsageList.add(appData);
            }
        }
        return filteredAppUsageList;
    }

    private String appUsageDataToJson(ReportUsageData usageData) {
        try {
            JSONObject appUsageJson = new JSONObject();
            appUsageJson.put("usage_type", usageData.getUsageType().name());
            appUsageJson.put("event_timestamp", Utility.epochToISO8601(usageData.getEventTimestamp()));
            JSONArray appMetadataJson = new JSONArray();
            for (String key : usageData.getAppMetadata().keySet()) {
                JSONObject jObj = new JSONObject();
                jObj.put("key", key);
                Object value = usageData.getAppMetadata().get(key);
                if (value != null) {
                    jObj.put("value", value);
                } else {
                    jObj.put("value", JSONObject.NULL);
                }
                appMetadataJson.put(jObj);
            }
            appUsageJson.put("app_metadata", appMetadataJson);
            JSONArray trackingMetadataJson = new JSONArray();
            for (String key2 : usageData.getTrackingMetadata().keySet()) {
                JSONObject jObj2 = new JSONObject();
                jObj2.put("key", key2);
                Object value2 = usageData.getTrackingMetadata().get(key2);
                if (value2 != null) {
                    jObj2.put("value", value2);
                } else {
                    jObj2.put("value", JSONObject.NULL);
                }
                trackingMetadataJson.put(jObj2);
            }
            appUsageJson.put("tracking_metadata", trackingMetadataJson);
            return appUsageJson.toString();
        } catch (JSONException e) {
            throw new CommunicationException((Throwable) e);
        }
    }
}
