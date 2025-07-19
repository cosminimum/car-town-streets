package com.miniclip.Ping;

import android.os.Handler;
import com.miniclip.nativeJNI.CocoJNI;
import com.miniclip.nativeJNI.cocojava;
import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;

public class PingHandler {
    private Handler _handler = new Handler();
    /* access modifiers changed from: private */
    public int _status = 0;

    /* access modifiers changed from: private */
    public boolean simplePing(String serverName, int timeout) throws IOException {
        InetAddress address = InetAddress.getByName(serverName);
        try {
            new Socket(address, 53).close();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return address.isReachable(timeout);
        }
    }

    /* access modifiers changed from: private */
    public void returnResult(final int callback, final boolean result) {
        cocojava.mGLView.queueEvent(new Runnable() {
            public void run() {
                CocoJNI.MsimplePingResponce(callback, result ? 0 : 1);
            }
        });
    }

    public void simplePingAsync(final String serverName, final int callback, final int timeout) {
        if (this._status == 0) {
            this._status = 1;
            new Thread() {
                public void run() {
                    try {
                        boolean result = PingHandler.this.simplePing(serverName, timeout);
                        if (PingHandler.this._status == 1) {
                            int unused = PingHandler.this._status = 0;
                            PingHandler.this.returnResult(callback, result);
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                        if (PingHandler.this._status == 1) {
                            int unused2 = PingHandler.this._status = 0;
                            PingHandler.this.returnResult(callback, false);
                        }
                    }
                }
            }.start();
            this._handler.postDelayed(new Runnable() {
                public void run() {
                    if (PingHandler.this._status == 1) {
                        int unused = PingHandler.this._status = 0;
                        PingHandler.this.returnResult(callback, false);
                    }
                }
            }, (long) timeout);
        }
    }
}
