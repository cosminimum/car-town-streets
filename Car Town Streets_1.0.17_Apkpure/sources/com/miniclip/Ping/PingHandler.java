package com.miniclip.Ping;

import android.os.Handler;
import com.miniclip.nativeJNI.CocoJNI;
import com.miniclip.nativeJNI.cocojava;
import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
/* loaded from: classes.dex */
public class PingHandler {
    private int _status = 0;
    private Handler _handler = new Handler();

    /* JADX INFO: Access modifiers changed from: private */
    public boolean simplePing(String serverName, int timeout) throws IOException {
        InetAddress address = InetAddress.getByName(serverName);
        try {
            Socket socket = new Socket(address, 53);
            socket.close();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return address.isReachable(timeout);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void returnResult(final int callback, final boolean result) {
        cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.Ping.PingHandler.1
            @Override // java.lang.Runnable
            public void run() {
                CocoJNI.MsimplePingResponce(callback, result ? 0 : 1);
            }
        });
    }

    public void simplePingAsync(final String serverName, final int callback, final int timeout) {
        if (this._status == 0) {
            this._status = 1;
            Thread thread = new Thread() { // from class: com.miniclip.Ping.PingHandler.2
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    try {
                        boolean result = PingHandler.this.simplePing(serverName, timeout);
                        if (PingHandler.this._status == 1) {
                            PingHandler.this._status = 0;
                            PingHandler.this.returnResult(callback, result);
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                        if (PingHandler.this._status == 1) {
                            PingHandler.this._status = 0;
                            PingHandler.this.returnResult(callback, false);
                        }
                    }
                }
            };
            thread.start();
            this._handler.postDelayed(new Runnable() { // from class: com.miniclip.Ping.PingHandler.3
                @Override // java.lang.Runnable
                public void run() {
                    if (PingHandler.this._status == 1) {
                        PingHandler.this._status = 0;
                        PingHandler.this.returnResult(callback, false);
                    }
                }
            }, timeout);
        }
    }
}
