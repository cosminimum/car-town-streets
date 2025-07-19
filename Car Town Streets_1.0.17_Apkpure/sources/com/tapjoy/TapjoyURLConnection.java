package com.tapjoy;

import android.net.Uri;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.util.EntityUtils;
/* loaded from: classes.dex */
public class TapjoyURLConnection {
    private static final String TAPJOY_URL_CONNECTION = "TapjoyURLConnection";
    public static final int TYPE_GET = 0;
    public static final int TYPE_POST = 1;

    public TapjoyHttpURLResponse getResponseFromURL(String url, String params) {
        return getResponseFromURL(url, params, 0);
    }

    public TapjoyHttpURLResponse getResponseFromURL(String url, String params, int type) {
        StringBuilder sb;
        BufferedReader rd;
        TapjoyHttpURLResponse tapjoyResponse = new TapjoyHttpURLResponse();
        HttpURLConnection connection = null;
        try {
            String requestURL = (url + params).replaceAll(" ", "%20");
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "baseURL: " + url);
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "requestURL: " + requestURL);
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "type: " + type);
            URL httpURL = new URL(requestURL);
            connection = (HttpURLConnection) httpURL.openConnection();
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(30000);
            if (type == 1) {
                connection.setRequestMethod("POST");
            }
            connection.connect();
            tapjoyResponse.statusCode = connection.getResponseCode();
            rd = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            try {
                sb = new StringBuilder();
                while (true) {
                    try {
                        String line = rd.readLine();
                        if (line == null) {
                            break;
                        }
                        sb.append(line + '\n');
                    } catch (Exception e) {
                        e = e;
                        TapjoyLog.e(TAPJOY_URL_CONNECTION, "Exception: " + e.toString());
                        if (connection != null) {
                            try {
                            } catch (Exception e2) {
                                ex = e2;
                            }
                            if (tapjoyResponse.response == null) {
                                BufferedReader rd2 = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
                                try {
                                    StringBuilder sb2 = new StringBuilder();
                                    while (true) {
                                        try {
                                            String line2 = rd2.readLine();
                                            if (line2 == null) {
                                                break;
                                            }
                                            sb2.append(line2 + '\n');
                                        } catch (Exception e3) {
                                            ex = e3;
                                            TapjoyLog.e(TAPJOY_URL_CONNECTION, "Exception trying to get error code/content: " + ex.toString());
                                            TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
                                            TapjoyLog.i(TAPJOY_URL_CONNECTION, "response status: " + tapjoyResponse.statusCode);
                                            TapjoyLog.i(TAPJOY_URL_CONNECTION, "response size: " + tapjoyResponse.contentLength);
                                            TapjoyLog.i(TAPJOY_URL_CONNECTION, "response: ");
                                            TapjoyLog.i(TAPJOY_URL_CONNECTION, "" + tapjoyResponse.response);
                                            TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
                                            return tapjoyResponse;
                                        }
                                    }
                                    tapjoyResponse.response = sb2.toString();
                                } catch (Exception e4) {
                                    ex = e4;
                                }
                                TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
                                TapjoyLog.i(TAPJOY_URL_CONNECTION, "response status: " + tapjoyResponse.statusCode);
                                TapjoyLog.i(TAPJOY_URL_CONNECTION, "response size: " + tapjoyResponse.contentLength);
                                TapjoyLog.i(TAPJOY_URL_CONNECTION, "response: ");
                                TapjoyLog.i(TAPJOY_URL_CONNECTION, "" + tapjoyResponse.response);
                                TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
                                return tapjoyResponse;
                            }
                        }
                        TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
                        TapjoyLog.i(TAPJOY_URL_CONNECTION, "response status: " + tapjoyResponse.statusCode);
                        TapjoyLog.i(TAPJOY_URL_CONNECTION, "response size: " + tapjoyResponse.contentLength);
                        TapjoyLog.i(TAPJOY_URL_CONNECTION, "response: ");
                        TapjoyLog.i(TAPJOY_URL_CONNECTION, "" + tapjoyResponse.response);
                        TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
                        return tapjoyResponse;
                    }
                }
                tapjoyResponse.response = sb.toString();
                String contentLength = connection.getHeaderField("content-length");
                if (contentLength != null) {
                    try {
                        tapjoyResponse.contentLength = Integer.valueOf(contentLength).intValue();
                    } catch (Exception e5) {
                        TapjoyLog.e(TAPJOY_URL_CONNECTION, "Exception: " + e5.toString());
                    }
                }
            } catch (Exception e6) {
                e = e6;
                sb = null;
            }
        } catch (Exception e7) {
            e = e7;
            sb = null;
            rd = null;
        }
        TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
        TapjoyLog.i(TAPJOY_URL_CONNECTION, "response status: " + tapjoyResponse.statusCode);
        TapjoyLog.i(TAPJOY_URL_CONNECTION, "response size: " + tapjoyResponse.contentLength);
        TapjoyLog.i(TAPJOY_URL_CONNECTION, "response: ");
        TapjoyLog.i(TAPJOY_URL_CONNECTION, "" + tapjoyResponse.response);
        TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
        return tapjoyResponse;
    }

    public String connectToURL(String url) {
        return connectToURL(url, "");
    }

    public String connectToURL(String url, String params) {
        String httpResponse = null;
        try {
            String requestURL = (url + params).replaceAll(" ", "%20");
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "baseURL: " + url);
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "requestURL: " + requestURL);
            URL httpURL = new URL(requestURL);
            HttpURLConnection connection = (HttpURLConnection) httpURL.openConnection();
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(30000);
            httpResponse = connection.getResponseMessage();
            connection.connect();
            BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            try {
                StringBuilder sb = new StringBuilder();
                while (true) {
                    try {
                        String line = rd.readLine();
                        if (line == null) {
                            break;
                        }
                        sb.append(line + '\n');
                    } catch (Exception e) {
                        e = e;
                        TapjoyLog.e(TAPJOY_URL_CONNECTION, "Exception: " + e.toString());
                        return httpResponse;
                    }
                }
                httpResponse = sb.toString();
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "response size: " + httpResponse.length());
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "response: ");
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "" + httpResponse);
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
            } catch (Exception e2) {
                e = e2;
            }
        } catch (Exception e3) {
            e = e3;
        }
        return httpResponse;
    }

    public String getContentLength(String url) {
        String contentLength = null;
        try {
            String requestURL = url.replaceAll(" ", "%20");
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "requestURL: " + requestURL);
            URL httpURL = new URL(requestURL);
            HttpURLConnection connection = (HttpURLConnection) httpURL.openConnection();
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(30000);
            contentLength = connection.getHeaderField("content-length");
        } catch (Exception e) {
            TapjoyLog.e(TAPJOY_URL_CONNECTION, "Exception: " + e.toString());
        }
        TapjoyLog.i(TAPJOY_URL_CONNECTION, "content-length: " + contentLength);
        return contentLength;
    }

    public String connectToURLwithPOST(String url, Hashtable<String, String> params, Hashtable<String, String> paramsData) {
        String httpResponse = null;
        try {
            String requestURL = url.replaceAll(" ", "%20");
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "baseURL: " + url);
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "requestURL: " + requestURL);
            HttpPost httpPost = new HttpPost(requestURL);
            List<NameValuePair> pairs = new ArrayList<>();
            Set<Map.Entry<String, String>> entries = params.entrySet();
            for (Map.Entry<String, String> item : entries) {
                pairs.add(new BasicNameValuePair(item.getKey(), item.getValue()));
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "key: " + item.getKey() + ", value: " + Uri.encode(item.getValue()));
            }
            if (paramsData != null && paramsData.size() > 0) {
                Set<Map.Entry<String, String>> entries2 = paramsData.entrySet();
                for (Map.Entry<String, String> item2 : entries2) {
                    pairs.add(new BasicNameValuePair("data[" + item2.getKey() + "]", item2.getValue()));
                    TapjoyLog.i(TAPJOY_URL_CONNECTION, "key: " + item2.getKey() + ", value: " + Uri.encode(item2.getValue()));
                }
            }
            httpPost.setEntity(new UrlEncodedFormEntity(pairs));
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "HTTP POST: " + httpPost.toString());
            BasicHttpParams basicHttpParams = new BasicHttpParams();
            HttpConnectionParams.setConnectionTimeout(basicHttpParams, 15000);
            HttpConnectionParams.setSoTimeout(basicHttpParams, 30000);
            HttpResponse response = new DefaultHttpClient(basicHttpParams).execute(httpPost);
            HttpEntity entity = response.getEntity();
            httpResponse = EntityUtils.toString(entity);
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "response status: " + response.getStatusLine().getStatusCode());
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "response size: " + httpResponse.length());
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "response: ");
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "" + httpResponse);
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
            return httpResponse;
        } catch (Exception e) {
            TapjoyLog.e(TAPJOY_URL_CONNECTION, "Exception: " + e.toString());
            return httpResponse;
        }
    }
}
