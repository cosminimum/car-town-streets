package com.getjar.sdk.comm;

import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.response.BlacklistedResponse;
import com.getjar.sdk.response.DeviceUnsupportedResponse;
import com.getjar.sdk.utilities.OnErrorConstants;
import com.getjar.sdk.utilities.StringUtility;
import com.google.android.gcm.GCMConstants;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class Result implements Serializable {
    private static final long serialVersionUID = 7344515215545594367L;
    private Map<String, List<String>> _headers = null;
    private String _requestId = null;
    private String _responseBody = null;
    private int _responseCode;
    private JSONObject _responseJson = null;
    private int _responseTime = -1;
    private boolean _suppressInternalCallbacks = false;

    public Result() {
    }

    public Result(String responseBody, Map<String, List<String>> headers, int responseCode, String requestId, boolean suppressInternalCallbacks) {
        this._responseBody = responseBody;
        if (!StringUtility.isNullOrEmpty(this._responseBody)) {
            try {
                this._responseJson = new JSONObject(this._responseBody);
            } catch (JSONException e) {
            }
        }
        this._headers = headers;
        if (this._headers == null) {
            this._headers = new HashMap();
        }
        this._responseCode = responseCode;
        this._requestId = requestId;
        this._suppressInternalCallbacks = suppressInternalCallbacks;
        validateObjectState();
    }

    public String getResponseBody() {
        return this._responseBody;
    }

    public JSONObject getResponseJson() {
        return this._responseJson;
    }

    public Map<String, List<String>> getHeaders() {
        return this._headers;
    }

    public int getResponseCode() {
        return this._responseCode;
    }

    public String getRequestId() {
        return this._requestId;
    }

    public int getResponseTime() {
        return this._responseTime;
    }

    public void setResponseTime(int responseTime) {
        if (responseTime <= 0) {
            throw new IllegalArgumentException("'responseTime' must be greater than 0");
        }
        this._responseTime = responseTime;
    }

    public JSONObject getSignedPayloadObject() {
        return getResponseBodyValueAsObject("signed_data");
    }

    public String getSignedPayload() {
        return getResponseBodyValueAsRawString("signed_data");
    }

    public String getSignature() {
        return getResponseBodyValueAsString("signature");
    }

    private String getResponseBodyValueAsString(String key) {
        try {
            if (this._responseJson != null && this._responseJson.has("return") && this._responseJson.getJSONObject("return").has(key)) {
                return this._responseJson.getJSONObject("return").getString(key);
            }
        } catch (JSONException e) {
            Logger.e(Area.COMM.value(), String.format(Locale.US, "Unable to get a string value for '%1$s'", new Object[]{key}), e);
        }
        return null;
    }

    private String getResponseBodyValueAsRawString(String key) {
        char endChar;
        try {
            if (this._responseJson != null && this._responseJson.has("return") && this._responseJson.getJSONObject("return").has(key)) {
                int start = this._responseBody.indexOf(String.format(Locale.US, "\"%1$s\"", new Object[]{key}));
                while (this._responseBody.charAt(start) != ':') {
                    start++;
                }
                while (this._responseBody.charAt(start) != '\"' && this._responseBody.charAt(start) != '{' && this._responseBody.charAt(start) != '[') {
                    start++;
                }
                char startChar = this._responseBody.charAt(start);
                switch (startChar) {
                    case '\"':
                        endChar = '\"';
                        break;
                    case '[':
                        endChar = ']';
                        break;
                    case '{':
                        endChar = '}';
                        break;
                    default:
                        throw new IllegalStateException(String.format(Locale.US, "Unrecognized start character '%1$c'", new Object[]{Character.valueOf(startChar)}));
                }
                int setCount = this._responseJson.getJSONObject("return").getString(key).split(String.format("\\%1$c", new Object[]{Character.valueOf(endChar)})).length - 1;
                int end = start;
                int setFound = 0;
                if (this._responseBody.charAt(end) == startChar) {
                    end++;
                }
                while (setFound <= setCount) {
                    if (this._responseBody.charAt(end) == endChar) {
                        setFound++;
                    }
                    end++;
                }
                if (startChar == '\"') {
                    return this._responseBody.substring(start + 1, end - 1);
                }
                return this._responseBody.substring(start, end);
            }
        } catch (JSONException e) {
            Logger.e(Area.COMM.value(), String.format(Locale.US, "Unable to get a raw string value for '%1$s'", new Object[]{key}), e);
        }
        return null;
    }

    private JSONObject getResponseBodyValueAsObject(String key) {
        try {
            if (this._responseJson != null && this._responseJson.has("return") && this._responseJson.getJSONObject("return").has(key)) {
                return this._responseJson.getJSONObject("return").getJSONObject(key);
            }
        } catch (JSONException e) {
            Logger.e(Area.COMM.value(), String.format(Locale.US, "Unable to get a string value for '%1$s'", new Object[]{key}), e);
        }
        return null;
    }

    public String getErrorResponseCode() {
        try {
            if (this._responseJson != null && this._responseJson.has(GCMConstants.EXTRA_ERROR) && this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).has("code")) {
                return this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).getString("code");
            }
        } catch (Exception e) {
            Logger.e(Area.COMM.value(), String.format(Locale.US, "Unable to get an error code from '%1$s'", new Object[]{this._responseBody}), e);
        }
        return null;
    }

    public String getErrorResponseSubcode() {
        try {
            if (this._responseJson != null && this._responseJson.has(GCMConstants.EXTRA_ERROR) && this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).has("subcode")) {
                return this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).getString("subcode");
            }
        } catch (Exception e) {
            Logger.e(Area.COMM.value(), String.format(Locale.US, "Unable to get an error subcode from '%1$s'", new Object[]{this._responseBody}), e);
        }
        return null;
    }

    public boolean checkForUnauthorizedAndOKToReAuth(CommContext commContext) throws JSONException {
        boolean isUnauthorizedAndOKToReAuth;
        boolean isUnauthorized = false;
        boolean isNotOKToReAuth = false;
        if (checkForCallerUnauthorized()) {
            isUnauthorized = true;
            isNotOKToReAuth = checkForBlacklistedOrUnsupported(commContext);
        }
        if (!isUnauthorized || isNotOKToReAuth) {
            isUnauthorizedAndOKToReAuth = false;
        } else {
            isUnauthorizedAndOKToReAuth = true;
        }
        if (isUnauthorized) {
            long value = Area.COMM.value() | Area.AUTH.value();
            Locale locale = Locale.US;
            Object[] objArr = new Object[4];
            objArr[0] = Boolean.valueOf(isUnauthorized);
            objArr[1] = Boolean.valueOf(isNotOKToReAuth);
            objArr[2] = Boolean.valueOf(isUnauthorizedAndOKToReAuth);
            objArr[3] = getResponseJson() != null ? getResponseJson().toString(4) : "";
            Logger.v(value, String.format(locale, "checkForUnauthorizedAndOKToReAuth() isUnauthorized=%1$s and isNotOKToReAuth=%2$s, returning %3$s for:\r\n%4$s", objArr));
        }
        return isUnauthorizedAndOKToReAuth;
    }

    public boolean checkForBlacklistedOrUnsupported(CommContext commContext) throws JSONException {
        boolean z;
        boolean blacklisted = false;
        boolean unsupported = false;
        if (checkForCallerUnauthorized()) {
            if (checkForBlacklisted()) {
                String subcode = this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).getString("subcode");
                BlacklistedResponse.BlacklistType blacklistType = BlacklistedResponse.BlacklistType.DEVICE;
                if (OnErrorConstants.SUBCODE_AUTH_BLACK_LISTED_DEVICE.equalsIgnoreCase(subcode)) {
                    blacklistType = BlacklistedResponse.BlacklistType.DEVICE;
                } else if (OnErrorConstants.SUBCODE_AUTH_BLACK_LISTED_USER.equalsIgnoreCase(subcode) || "no_reauth".equalsIgnoreCase(subcode)) {
                    blacklistType = BlacklistedResponse.BlacklistType.USER;
                } else if (OnErrorConstants.SUBCODE_AUTH_BLACK_LISTED_APP.equalsIgnoreCase(subcode)) {
                    blacklistType = BlacklistedResponse.BlacklistType.APP;
                }
                if (!this._suppressInternalCallbacks) {
                    commContext.makeAuthorizationFailureCallbacks(subcode);
                }
                commContext.postResponse(new BlacklistedResponse(blacklistType));
                blacklisted = true;
            } else if (checkForUnsupported()) {
                String subcode2 = this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).getString("subcode");
                if (!this._suppressInternalCallbacks) {
                    commContext.makeAuthorizationFailureCallbacks(subcode2);
                }
                commContext.postResponse(new DeviceUnsupportedResponse(commContext.getDeviceMetadataValues()));
                unsupported = true;
            }
        }
        long value = Area.COMM.value() | Area.AUTH.value();
        Locale locale = Locale.US;
        Object[] objArr = new Object[2];
        if (blacklisted || unsupported) {
            z = true;
        } else {
            z = false;
        }
        objArr[0] = Boolean.toString(z).toUpperCase();
        objArr[1] = (blacklisted || unsupported) ? blacklisted ? "we are blacklisted" : "we are unsupported" : "";
        Logger.v(value, String.format(locale, "checkForBlacklistedOrUnsupported() returning %1$s %2$s", objArr));
        if (blacklisted || unsupported) {
            return true;
        }
        return false;
    }

    public boolean checkForCallerUnauthorized() throws JSONException {
        return this._responseJson != null && this._responseJson.has(GCMConstants.EXTRA_ERROR) && this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).has("code") && this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).getString("code").equalsIgnoreCase("CALLER_UNAUTHORIZED");
    }

    public boolean checkForBlacklisted() throws JSONException {
        if (checkForCallerUnauthorized() && this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).has("subcode")) {
            String subcode = this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).getString("subcode");
            if (subcode.equalsIgnoreCase("no_reauth") || subcode.startsWith("black_listed")) {
                return true;
            }
        }
        return false;
    }

    public boolean checkForUnsupported() throws JSONException {
        if (!checkForCallerUnauthorized() || !this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).has("subcode") || !this._responseJson.getJSONObject(GCMConstants.EXTRA_ERROR).getString("subcode").equalsIgnoreCase(OnErrorConstants.SUBCODE_AUTH_UNSUPPORTED_DEVICE)) {
            return false;
        }
        return true;
    }

    public int getEstimatedResponseSizeInBytes() {
        int byteCount = 8;
        if (this._responseBody != null) {
            byteCount = 8 + this._responseBody.getBytes().length;
        }
        if (this._headers != null) {
            for (String name : this._headers.keySet()) {
                if (!StringUtility.isNullOrEmpty(name)) {
                    byteCount += name.getBytes().length;
                }
                if (this._headers.get(name) != null) {
                    for (String value : this._headers.get(name)) {
                        if (!StringUtility.isNullOrEmpty(value)) {
                            byteCount += value.getBytes().length;
                        }
                    }
                }
            }
        }
        return byteCount;
    }

    public boolean isSuccessfulResponse() {
        return isSuccessfulResponse(getResponseCode());
    }

    public boolean isSuccessfulCreationResponse() {
        return isSuccessfulCreationResponse(getResponseCode());
    }

    public static boolean isSuccessfulResponse(int responseCode) {
        if (responseCode == 200 || responseCode == 201) {
            return true;
        }
        return false;
    }

    public static boolean isSuccessfulCreationResponse(int responseCode) {
        if (responseCode == 201) {
            return true;
        }
        return false;
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        validateObjectState();
        out.writeUTF(this._responseBody != null ? this._responseBody : "");
        out.writeInt(this._responseCode);
        out.writeUTF(this._requestId);
        out.writeBoolean(this._suppressInternalCallbacks);
        out.writeObject(this._headers);
        out.writeInt(this._responseTime);
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        this._responseBody = in.readUTF();
        if (!StringUtility.isNullOrEmpty(this._responseBody)) {
            try {
                this._responseJson = new JSONObject(this._responseBody);
            } catch (JSONException e) {
            }
        }
        this._responseCode = in.readInt();
        this._requestId = in.readUTF();
        this._suppressInternalCallbacks = in.readBoolean();
        this._headers = (Map) in.readObject();
        this._responseTime = in.readInt();
        validateObjectState();
    }

    private void validateObjectState() {
        if (this._responseCode < 0) {
            throw new IllegalStateException("'responseCode' can not be less than zero");
        } else if (this._headers == null) {
            throw new IllegalStateException("'headers' can not be NULL");
        } else if (this._responseTime < -1) {
            throw new IllegalStateException("'responseTime' must be greater than -1");
        }
    }
}
