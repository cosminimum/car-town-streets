package com.getjar.sdk.comm;

import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.exceptions.ServiceException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Utility;
import com.google.android.gcm.GCMConstants;
import java.io.UnsupportedEncodingException;
import java.net.BindException;
import java.net.ConnectException;
import java.net.HttpRetryException;
import java.net.NoRouteToHostException;
import java.net.PortUnreachableException;
import java.net.ProtocolException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.net.UnknownServiceException;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLKeyException;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLProtocolException;
import org.apache.http.Header;
import org.apache.http.NoHttpResponseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.conn.HttpHostConnectException;
import org.json.JSONException;
/* loaded from: classes.dex */
public final class RequestUtilities {
    public static ServiceException getServicesException(Result result) throws ServiceException, JSONException {
        if (result == null) {
            throw new IllegalArgumentException("'result' can not be NULL");
        }
        if (result.getResponseJson() != null) {
            if (result.getResponseJson().has(GCMConstants.EXTRA_ERROR)) {
                return new ServiceException(String.format(Locale.US, "[ResponseCode: %1$d] Result: %2$s", Integer.valueOf(result.getResponseCode()), result.getResponseJson().toString(2)), result);
            }
            if (!result.getResponseJson().has("return")) {
                return new ServiceException(String.format(Locale.US, "Unexpected JSON result [ResponseCode: %1$d] Result: %2$s", Integer.valueOf(result.getResponseCode()), result.getResponseJson().toString(2)), result);
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static void debugDumpRequestProperties(HttpRequestBase httpRequest) {
        try {
            Logger.d(Area.COMM.value(), "The request properties for this request:");
            Header[] arr$ = httpRequest.getAllHeaders();
            for (Header header : arr$) {
                Logger.d(Area.COMM.value(), "      " + header.getName() + " = '" + header.getValue() + "'");
            }
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static String getPostDataBlob(Map<String, String> postData) {
        StringBuilder postBlob = new StringBuilder("");
        Iterator<String> nameItr = postData.keySet().iterator();
        while (nameItr.hasNext()) {
            String name = nameItr.next();
            postBlob.append(name);
            postBlob.append("=");
            try {
                postBlob.append(URLEncoder.encode(postData.get(name), "UTF-8"));
                if (nameItr.hasNext()) {
                    postBlob.append(Utility.QUERY_APPENDIX);
                }
            } catch (UnsupportedEncodingException e) {
                throw new CommunicationException(e);
            }
        }
        return postBlob.toString();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static boolean checkForRetryOnException(Exception theException, boolean forIdempotentOperation) {
        if (forIdempotentOperation) {
            return isSafeRetriableException(theException) || isUnsafeRetriableException(theException);
        }
        return isSafeRetriableException(theException);
    }

    private static boolean isSafeRetriableException(Exception theException) {
        if ((theException instanceof SSLHandshakeException) || (theException instanceof SSLKeyException) || (theException instanceof SSLPeerUnverifiedException) || (theException instanceof HttpHostConnectException) || (theException instanceof ConnectTimeoutException) || (theException instanceof ConnectException) || (theException instanceof UnknownHostException) || (theException instanceof BindException) || (theException instanceof NoRouteToHostException) || (theException instanceof PortUnreachableException) || (theException instanceof UnknownServiceException) || (theException instanceof NetworkUnavailableException)) {
            theException.printStackTrace();
            return true;
        }
        return false;
    }

    private static boolean isUnsafeRetriableException(Exception theException) {
        if ((theException instanceof SSLProtocolException) || (theException instanceof NoHttpResponseException) || (theException instanceof ClientProtocolException) || (theException instanceof SSLException) || (theException instanceof SocketTimeoutException) || (theException instanceof HttpRetryException) || (theException instanceof ProtocolException) || (theException instanceof SocketException) || theException.getClass().getName().startsWith("org.apache.http")) {
            theException.printStackTrace();
            return true;
        }
        return false;
    }
}
