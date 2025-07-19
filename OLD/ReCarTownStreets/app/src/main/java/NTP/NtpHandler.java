package NTP;

import android.os.Handler;
import android.util.Log;

import com.miniclip.nativeJNI.CocoJNI;
import com.miniclip.nativeJNI.cocojava;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.text.DecimalFormat;

public class NtpHandler {
    private Handler _handler = new Handler();
    /* access modifiers changed from: private */
    public int _status = 0;

    private interface NtpResponce {
        void failure();

        void success(double d);
    }

    public double getOffsetFromServer(String serverName) throws IOException {
        DatagramSocket socket = new DatagramSocket();
        InetAddress address = InetAddress.getByName(serverName);
        byte[] buf = new NtpMessage().toByteArray();
        DatagramPacket packet = new DatagramPacket(buf, buf.length, address, 123);
        NtpMessage.encodeTimestamp(packet.getData(), 40, (((double) System.currentTimeMillis()) / 1000.0d) + 2.2089888E9d);
        socket.send(packet);
        System.out.println("NTP request sent, waiting for response...\n");
        DatagramPacket packet2 = new DatagramPacket(buf, buf.length);
        socket.receive(packet2);
        double destinationTimestamp = (((double) System.currentTimeMillis()) / 1000.0d) + 2.2089888E9d;
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
        new Thread() {
            public void run() {
                try {
                    onComplete.success(NtpHandler.this.getOffsetFromServer(serverName));
                } catch (IOException e) {
                    e.printStackTrace();
                    onComplete.failure();
                }
            }
        }.start();
    }

    public void getOffsetFromServerListAsync(String serverNames, final int callback, int timeout) {
        Log.i("NtpHandler", "getOffsetFromServerListAsync1");
        if (this._status == 0) {
            this._status = 1;
            String[] serverNamesArray = serverNames.split(",");
            for (String offsetFromServerAsync : serverNamesArray) {
                getOffsetFromServerAsync(offsetFromServerAsync, new NtpResponce() {
                    public void success(final double time) {
                        if (NtpHandler.this._status == 1) {
                            cocojava.mGLView.queueEvent(new Runnable() {
                                public void run() {
                                    CocoJNI.MnetworkTimeResponce(callback, time, 0);
                                }
                            });
                        }
                        int unused = NtpHandler.this._status = 2;
                    }

                    public void failure() {
                    }
                });
            }
            this._handler.postDelayed(new Runnable() {
                public void run() {
                    if (NtpHandler.this._status == 1) {
                        cocojava.mGLView.queueEvent(new Runnable() {
                            public void run() {
                                CocoJNI.MnetworkTimeResponce(callback, 0.0d, 1);
                            }
                        });
                    }
                    int unused = NtpHandler.this._status = 0;
                }
            }, (long) timeout);
        }
    }
}
