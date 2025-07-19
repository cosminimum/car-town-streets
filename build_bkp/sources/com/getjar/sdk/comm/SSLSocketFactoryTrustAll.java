package com.getjar.sdk.comm;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.UnrecoverableKeyException;
import java.security.cert.X509Certificate;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.conn.ssl.X509HostnameVerifier;

public class SSLSocketFactoryTrustAll extends SSLSocketFactory {
    private static final X509HostnameVerifier _HostnameVerifier = new X509HostnameVerifier() {
        public boolean verify(String hostname, SSLSession session) {
            return true;
        }

        public void verify(String host, SSLSocket ssl) throws IOException {
        }

        public void verify(String host, X509Certificate cert) throws SSLException {
        }

        public void verify(String host, String[] cns, String[] subjectAlts) throws SSLException {
        }
    };
    private static final TrustManager[] _TrustAllCerts = {new X509TrustManager() {
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }

        public void checkClientTrusted(X509Certificate[] certs, String authType) {
        }

        public void checkServerTrusted(X509Certificate[] certs, String authType) {
        }
    }};
    private SSLContext _sslContext = SSLContext.getInstance("TLS");

    public SSLSocketFactoryTrustAll(KeyStore truststore) throws KeyManagementException, NoSuchAlgorithmException, KeyStoreException, UnrecoverableKeyException {
        super(truststore);
        this._sslContext.init((KeyManager[]) null, _TrustAllCerts, (SecureRandom) null);
        setHostnameVerifier(_HostnameVerifier);
    }

    public Socket createSocket(Socket socket, String host, int port, boolean autoClose) throws IOException, UnknownHostException {
        return this._sslContext.getSocketFactory().createSocket(socket, host, port, autoClose);
    }

    public Socket createSocket() throws IOException {
        return this._sslContext.getSocketFactory().createSocket();
    }
}
