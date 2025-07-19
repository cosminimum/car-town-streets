package com.millennialmedia.android;

import com.millennialmedia.android.MMAdViewSDK;
import org.json.JSONException;
import org.json.JSONObject;

class MMJSResponse {
    static final int ERROR = 0;
    static final int SUCCESS = 1;
    String className;
    byte[] dataResponse;
    String methodName;
    Object response;
    int result;

    MMJSResponse() {
    }

    static MMJSResponse responseWithSuccess() {
        return responseWithSuccess("Success.");
    }

    static MMJSResponse responseWithSuccess(String success) {
        MMJSResponse response2 = new MMJSResponse();
        response2.result = 1;
        response2.response = success;
        return response2;
    }

    static MMJSResponse responseWithError() {
        return responseWithError("An unknown error occured.");
    }

    static MMJSResponse responseWithError(String error) {
        MMJSResponse response2 = new MMJSResponse();
        response2.result = 0;
        response2.response = error;
        return response2;
    }

    /* access modifiers changed from: package-private */
    public String toJSONString() {
        try {
            if (this.className == null || this.methodName == null) {
                return "";
            }
            JSONObject object = new JSONObject();
            object.put("class", this.className);
            object.put("call", this.methodName);
            object.put("result", this.result);
            if (this.response != null) {
                object.put("response", this.response);
            } else if (this.dataResponse == null) {
                return "";
            } else {
                object.put("response", Base64.encodeToString(this.dataResponse, false));
            }
            return object.toString();
        } catch (JSONException jsonException) {
            MMAdViewSDK.Log.e(jsonException.getMessage());
            return "";
        }
    }
}
