package com.miniclip.NTP;

import android.os.Handler;
import android.util.Log;
import com.miniclip.nativeJNI.CocoJNI;
import com.miniclip.nativeJNI.cocojava;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.text.DecimalFormat;
/* loaded from: classes.dex */
public class NtpHandler {
    private int _status = 0;
    private Handler _handler = new Handler();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public interface NtpResponce {
        void failure();

        void success(double d);
    }

    public double getOffsetFromServer(String serverName) throws IOException {
        DatagramSocket socket = new DatagramSocket();
        InetAddress address = InetAddress.getByName(serverName);
        byte[] buf = new NtpMessage().toByteArray();
        DatagramPacket packet = new DatagramPacket(buf, buf.length, address, 123);
        NtpMessage.encodeTimestamp(packet.getData(), 40, (System.currentTimeMillis() / 1000.0d) + 2.2089888E9d);
        socket.send(packet);
        System.out.println("NTP request sent, waiting for response...\n");
        DatagramPacket packet2 = new DatagramPacket(buf, buf.length);
        socket.receive(packet2);
        double destinationTimestamp = (System.currentTimeMillis() / 1000.0d) + 2.2089888E9d;
        NtpMessage msg = new NtpMessage(packet2.getData());
        double roundTripDelay = (destinationTimestamp - msg.originateTimestamp) - (msg.transmitTimestamp - msg.receiveTimestamp);
        double localClockOffset = ((msg.receiveTimestamp - msg.originateTimestamp) + (msg.transmitTimestamp - destinationTimestamp)) / 2.0d;
        System.out.println("NTP server: " + serverName);
        System.out.println(msg.toString());
        System.out.println("Dest. timestamp:     " + NtpMessage.timestampToString(destinationTimestamp));
        System.out.println("Round-trip delay: " + new DecimalFormat("0.00").format(1000.0d * roundTripDelay) + " ms");
        System.out.println("Local clock offset: " + new DecimalFormat("0.00").format(1000.0d * localClockOffset) + " ms");
        socket.close();
        return localClockOffset;
    }

    public void getOffsetFromServerAsync(final String serverName, final NtpResponce onComplete) {
        Thread thread = new Thread() { // from class: com.miniclip.NTP.NtpHandler.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                try {
                    double time = NtpHandler.this.getOffsetFromServer(serverName);
                    onComplete.success(time);
                } catch (IOException e) {
                    e.printStackTrace();
                    onComplete.failure();
                }
            }
        };
        thread.start();
    }

    public void getOffsetFromServerListAsync(String serverNames, final int callback, int timeout) {
        Log.i("NtpHandler", "getOffsetFromServerListAsync1");
        if (this._status == 0) {
            this._status = 1;
            String[] serverNamesArray = serverNames.split(",");
            for (String str : serverNamesArray) {
                getOffsetFromServerAsync(str, new NtpResponce() { // from class: com.miniclip.NTP.NtpHandler.2
                    @Override // com.miniclip.NTP.NtpHandler.NtpResponce
                    public void success(final double time) {
                        if (NtpHandler.this._status == 1) {
                            cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.NTP.NtpHandler.2.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    CocoJNI.MnetworkTimeResponce(callback, time, 0);
                                }
                            });
                        }
                        NtpHandler.this._status = 2;
                    }

                    @Override // com.miniclip.NTP.NtpHandler.NtpResponce
                    public void failure() {
                    }
                });
            }
            this._handler.postDelayed(new Runnable() { // from class: com.miniclip.NTP.NtpHandler.3
                @Override // java.lang.Runnable
                public void run() {
                    if (NtpHandler.this._status == 1) {
                        cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.NTP.NtpHandler.3.1
                            @Override // java.lang.Runnable
                            public void run() {
                                CocoJNI.MnetworkTimeResponce(callback, 0.0d, 1);
                            }
                        });
                    }
                    NtpHandler.this._status = 0;
                }
            }, timeout);
        }
    }
}
