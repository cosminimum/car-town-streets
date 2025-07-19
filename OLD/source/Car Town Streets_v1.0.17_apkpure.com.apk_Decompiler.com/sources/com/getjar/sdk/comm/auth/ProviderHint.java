package com.getjar.sdk.comm.auth;

import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.HashMap;
import java.util.Locale;
import org.json.JSONArray;

public class ProviderHint {
    private final HashMap<String, String> _data;
    private final String _filter;

    public ProviderHint(String providerFilter, HashMap<String, String> providerData) {
        if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("'providerFilter' cannot be NULL or empty");
        } else if (providerData == null || providerData.size() <= 0) {
            throw new IllegalArgumentException("'providerData' cannot be NULL or empty");
        } else {
            this._filter = providerFilter;
            this._data = providerData;
        }
    }

    public String getFilter() {
        return this._filter;
    }

    public HashMap<String, String> getData() {
        return this._data;
    }

    public static HashMap<String, String> parseData(String dataJson) {
        HashMap<String, String> resultMap = null;
        try {
            if (StringUtility.isNullOrEmpty(dataJson)) {
                return null;
            }
            JSONArray jsonArray = new JSONArray(dataJson);
            HashMap<String, String> resultMap2 = new HashMap<>(jsonArray.length());
            int i = 0;
            while (i < jsonArray.length()) {
                try {
                    resultMap2.put(jsonArray.getJSONObject(i).getString("key"), jsonArray.getJSONObject(i).getString("value"));
                    i++;
                } catch (Exception e) {
                    e = e;
                    resultMap = resultMap2;
                    Logger.e(Area.AUTH.value(), String.format(Locale.US, "parseData() failed [%1$s]", new Object[]{dataJson}), e);
                    return resultMap;
                }
            }
            return resultMap2;
        } catch (Exception e2) {
            e = e2;
            Logger.e(Area.AUTH.value(), String.format(Locale.US, "parseData() failed [%1$s]", new Object[]{dataJson}), e);
            return resultMap;
        }
    }
}
