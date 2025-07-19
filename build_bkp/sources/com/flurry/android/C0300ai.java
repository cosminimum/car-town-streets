package com.flurry.android;

import java.net.Socket;
import java.security.KeyStore;
import java.security.SecureRandom;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import org.apache.http.conn.ssl.SSLSocketFactory;

/* renamed from: com.flurry.android.ai */
final class C0300ai extends SSLSocketFactory {

    /* renamed from: a */
    private SSLContext f511a = SSLContext.getInstance("TLS");

    public C0300ai(FlurryAgent flurryAgent, KeyStore keyStore) {
        super(keyStore);
        C0316n nVar = new C0316n();
        this.f511a.init((KeyManager[]) null, new TrustManager[]{nVar}, (SecureRandom) null);
    }

    public final Socket createSocket(Socket socket, String str, int i, boolean z) {
        return this.f511a.getSocketFactory().createSocket(socket, str, i, z);
    }

    public final Socket createSocket() {
        return this.f511a.getSocketFactory().createSocket();
    }
}
