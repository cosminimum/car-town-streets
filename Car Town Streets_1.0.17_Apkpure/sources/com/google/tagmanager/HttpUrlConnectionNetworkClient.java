package com.google.tagmanager;

import com.google.android.gms.common.util.VisibleForTesting;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
/* loaded from: classes.dex */
class HttpUrlConnectionNetworkClient implements NetworkClient {
    private HttpURLConnection mConnection;

    @Override // com.google.tagmanager.NetworkClient
    public InputStream getInputStream(String urlStr) throws IOException {
        this.mConnection = getUrlConnection(urlStr);
        return handleServerResponse(this.mConnection);
    }

    @Override // com.google.tagmanager.NetworkClient
    public void sendPostRequest(String urlStr, byte[] content) throws IOException {
        HttpURLConnection connection = getUrlConnection(urlStr);
        try {
            connection.setRequestProperty("Content-Length", Integer.toString(content.length));
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.connect();
            OutputStream sendToServer = connection.getOutputStream();
            sendToServer.write(content);
            sendToServer.flush();
            sendToServer.close();
            handleServerResponse(connection);
        } finally {
            closeURLConnection(connection);
        }
    }

    private InputStream handleServerResponse(HttpURLConnection connection) throws IOException {
        int responseCode = connection.getResponseCode();
        if (responseCode == 200) {
            return connection.getInputStream();
        }
        String errorMessage = "Bad response: " + responseCode;
        if (responseCode == 404) {
            throw new FileNotFoundException(errorMessage);
        }
        throw new IOException(errorMessage);
    }

    @Override // com.google.tagmanager.NetworkClient
    public void close() {
        closeURLConnection(this.mConnection);
    }

    private void closeURLConnection(HttpURLConnection connection) {
        if (connection != null) {
            connection.disconnect();
        }
    }

    @VisibleForTesting
    HttpURLConnection getUrlConnection(String urlStr) throws IOException {
        URL url = new URL(urlStr);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setReadTimeout(20000);
        connection.setConnectTimeout(20000);
        return connection;
    }
}
