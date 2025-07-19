package com.getjar.sdk.comm;

import android.net.Uri;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.OverridesUtility;
import com.getjar.sdk.utilities.StringUtility;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.message.BasicNameValuePair;
/* loaded from: classes.dex */
public class Request {
    private final HttpMethod _httpMethod;
    private final URI _normalizedRequestUri;
    private final Map<String, String> _postData;
    private final List<NameValuePair> _queryParams;
    private final Map<String, String> _requestHeaders;
    private final String _requestType;
    private final ServiceName _serviceName;
    private final Integer _uniqueId;

    /* loaded from: classes.dex */
    public enum HttpMethod {
        GET,
        POST
    }

    /* loaded from: classes.dex */
    public enum ServiceName {
        AUTH,
        LOCALIZATION,
        LICENSE,
        VOUCHER,
        TRANSACTION,
        USER
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Request(ServiceName serviceName, String requestType, URI requestUri, HttpMethod httpMethod, Map<String, String> postData, Map<String, String> requestHeaders) {
        if (serviceName == null) {
            throw new IllegalArgumentException("'serviceName' can not be NULL");
        }
        if (StringUtility.isNullOrEmpty(requestType)) {
            throw new IllegalArgumentException("'requestType' can not be NULL or empty");
        }
        if (requestUri == null) {
            throw new IllegalArgumentException("'requestUri' can not be NULL");
        }
        if (httpMethod == null) {
            throw new IllegalArgumentException("'httpMethod' can not be NULL");
        }
        if (postData != null && !HttpMethod.POST.equals(httpMethod)) {
            throw new IllegalArgumentException("'postData' can only be provided for requests of method type \"POST\"");
        }
        this._serviceName = serviceName;
        this._requestType = requestType;
        this._httpMethod = httpMethod;
        this._normalizedRequestUri = requestUri.normalize();
        this._queryParams = URLEncodedUtils.parse(this._normalizedRequestUri, "UTF-8");
        this._postData = postData;
        this._requestHeaders = requestHeaders;
        this._uniqueId = Integer.valueOf(getUniqueId());
    }

    public String getRequestType() {
        return this._requestType;
    }

    public ServiceName getServiceName() {
        return this._serviceName;
    }

    public URI getNormalizedRequestUri() {
        return this._normalizedRequestUri;
    }

    public HttpMethod getHttpMethod() {
        return this._httpMethod;
    }

    public Map<String, String> getPostData() {
        if (this._postData == null) {
            return null;
        }
        return Collections.unmodifiableMap(this._postData);
    }

    public Map<String, String> getRequestHeaders() {
        if (this._requestHeaders == null) {
            return null;
        }
        return Collections.unmodifiableMap(this._requestHeaders);
    }

    public int getEstimatedRequestSizeInBytes() {
        int byteCount = this._normalizedRequestUri.toString().getBytes().length;
        if (this._postData != null) {
            for (String name : this._postData.keySet()) {
                if (!StringUtility.isNullOrEmpty(name)) {
                    byteCount += name.getBytes().length;
                }
                if (!StringUtility.isNullOrEmpty(this._postData.get(name))) {
                    byteCount += this._postData.get(name).getBytes().length;
                }
            }
        }
        if (this._requestHeaders != null) {
            for (String name2 : this._requestHeaders.keySet()) {
                if (!StringUtility.isNullOrEmpty(name2)) {
                    byteCount += name2.getBytes().length;
                }
                if (!StringUtility.isNullOrEmpty(this._requestHeaders.get(name2))) {
                    byteCount += this._requestHeaders.get(name2).getBytes().length;
                }
            }
        }
        return byteCount;
    }

    public URI getUriForRequest() throws URISyntaxException, UnsupportedEncodingException {
        List<NameValuePair> queryParams = new ArrayList<>();
        for (NameValuePair pair : this._queryParams) {
            queryParams.add(new BasicNameValuePair(pair.getName(), pair.getValue()));
        }
        queryParams.add(new BasicNameValuePair("override.response.details", "ALL"));
        String ipAddress = OverridesUtility.getValue("header.x-clientip");
        if (!StringUtility.isNullOrEmpty(ipAddress)) {
            Logger.d(Area.COMM.value(), String.format(Locale.US, "Using Override header.x-clientip:%1$s", ipAddress));
            queryParams.add(new BasicNameValuePair("override.header.X-ClientIP", ipAddress));
        }
        Uri.Builder builder = new Uri.Builder();
        builder.scheme(this._normalizedRequestUri.getScheme());
        builder.path(this._normalizedRequestUri.getPath());
        builder.fragment(this._normalizedRequestUri.getFragment());
        builder.encodedAuthority(this._normalizedRequestUri.getAuthority());
        builder.encodedQuery(URLEncodedUtils.format(queryParams, "UTF-8"));
        return URI.create(builder.build().toString());
    }

    public int getId() {
        if (this._uniqueId == null) {
            throw new IllegalStateException("Unique ID has not been calculated yet");
        }
        return this._uniqueId.intValue();
    }

    public boolean equals(Object object) {
        if (object == null) {
            throw new IllegalArgumentException("'object' can not be NULL");
        }
        return (object instanceof Request) && hashCode() == object.hashCode();
    }

    public int hashCode() {
        return getId();
    }

    private int getUniqueId() {
        StringBuilder textBuffer = new StringBuilder();
        textBuffer.append(this._normalizedRequestUri.getScheme());
        textBuffer.append(this._normalizedRequestUri.getHost());
        textBuffer.append(this._normalizedRequestUri.getPath());
        Collections.sort(this._queryParams, new Comparator<NameValuePair>() { // from class: com.getjar.sdk.comm.Request.1
            @Override // java.util.Comparator
            public int compare(NameValuePair lhs, NameValuePair rhs) {
                return lhs.getName().compareTo(rhs.getName());
            }
        });
        for (NameValuePair pair : this._queryParams) {
            textBuffer.append(pair.getName());
            textBuffer.append(pair.getValue());
        }
        textBuffer.append(this._normalizedRequestUri.getFragment());
        if (this._postData != null) {
            for (String name : this._postData.keySet()) {
                textBuffer.append(name);
                textBuffer.append(this._postData.get(name));
            }
        }
        String hashableText = textBuffer.toString();
        return StringUtility.isNullOrEmpty(hashableText) ? this._normalizedRequestUri.getPort() : hashableText.hashCode() + this._normalizedRequestUri.getPort();
    }
}
