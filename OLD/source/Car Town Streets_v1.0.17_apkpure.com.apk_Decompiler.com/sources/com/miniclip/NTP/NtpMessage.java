package com.miniclip.NTP;

import android.support.v4.view.MotionEventCompat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NtpMessage {
    public byte leapIndicator;
    public byte mode;
    public double originateTimestamp;
    public byte pollInterval;
    public byte precision;
    public double receiveTimestamp;
    public byte[] referenceIdentifier;
    public double referenceTimestamp;
    public double rootDelay;
    public double rootDispersion;
    public short stratum;
    public double transmitTimestamp;
    public byte version;

    public NtpMessage(byte[] array) {
        this.leapIndicator = 0;
        this.version = 3;
        this.mode = 0;
        this.stratum = 0;
        this.pollInterval = 0;
        this.precision = 0;
        this.rootDelay = 0.0d;
        this.rootDispersion = 0.0d;
        this.referenceIdentifier = new byte[]{0, 0, 0, 0};
        this.referenceTimestamp = 0.0d;
        this.originateTimestamp = 0.0d;
        this.receiveTimestamp = 0.0d;
        this.transmitTimestamp = 0.0d;
        this.leapIndicator = (byte) ((array[0] >> 6) & 3);
        this.version = (byte) ((array[0] >> 3) & 7);
        this.mode = (byte) (array[0] & 7);
        this.stratum = unsignedByteToShort(array[1]);
        this.pollInterval = array[2];
        this.precision = array[3];
        this.rootDelay = (((double) array[4]) * 256.0d) + ((double) unsignedByteToShort(array[5])) + (((double) unsignedByteToShort(array[6])) / 256.0d) + (((double) unsignedByteToShort(array[7])) / 65536.0d);
        this.rootDispersion = (((double) unsignedByteToShort(array[8])) * 256.0d) + ((double) unsignedByteToShort(array[9])) + (((double) unsignedByteToShort(array[10])) / 256.0d) + (((double) unsignedByteToShort(array[11])) / 65536.0d);
        this.referenceIdentifier[0] = array[12];
        this.referenceIdentifier[1] = array[13];
        this.referenceIdentifier[2] = array[14];
        this.referenceIdentifier[3] = array[15];
        this.referenceTimestamp = decodeTimestamp(array, 16);
        this.originateTimestamp = decodeTimestamp(array, 24);
        this.receiveTimestamp = decodeTimestamp(array, 32);
        this.transmitTimestamp = decodeTimestamp(array, 40);
    }

    public NtpMessage() {
        this.leapIndicator = 0;
        this.version = 3;
        this.mode = 0;
        this.stratum = 0;
        this.pollInterval = 0;
        this.precision = 0;
        this.rootDelay = 0.0d;
        this.rootDispersion = 0.0d;
        this.referenceIdentifier = new byte[]{0, 0, 0, 0};
        this.referenceTimestamp = 0.0d;
        this.originateTimestamp = 0.0d;
        this.receiveTimestamp = 0.0d;
        this.transmitTimestamp = 0.0d;
        this.mode = 3;
        this.transmitTimestamp = (((double) System.currentTimeMillis()) / 1000.0d) + 2.2089888E9d;
    }

    public byte[] toByteArray() {
        byte[] p = new byte[48];
        p[0] = (byte) ((this.leapIndicator << 6) | (this.version << 3) | this.mode);
        p[1] = (byte) this.stratum;
        p[2] = this.pollInterval;
        p[3] = this.precision;
        int l = (int) (this.rootDelay * 65536.0d);
        p[4] = (byte) ((l >> 24) & MotionEventCompat.ACTION_MASK);
        p[5] = (byte) ((l >> 16) & MotionEventCompat.ACTION_MASK);
        p[6] = (byte) ((l >> 8) & MotionEventCompat.ACTION_MASK);
        p[7] = (byte) (l & MotionEventCompat.ACTION_MASK);
        long ul = (long) (this.rootDispersion * 65536.0d);
        p[8] = (byte) ((int) ((ul >> 24) & 255));
        p[9] = (byte) ((int) ((ul >> 16) & 255));
        p[10] = (byte) ((int) ((ul >> 8) & 255));
        p[11] = (byte) ((int) (ul & 255));
        p[12] = this.referenceIdentifier[0];
        p[13] = this.referenceIdentifier[1];
        p[14] = this.referenceIdentifier[2];
        p[15] = this.referenceIdentifier[3];
        encodeTimestamp(p, 16, this.referenceTimestamp);
        encodeTimestamp(p, 24, this.originateTimestamp);
        encodeTimestamp(p, 32, this.receiveTimestamp);
        encodeTimestamp(p, 40, this.transmitTimestamp);
        return p;
    }

    public String toString() {
        return "Leap indicator: " + this.leapIndicator + "\n" + "Version: " + this.version + "\n" + "Mode: " + this.mode + "\n" + "Stratum: " + this.stratum + "\n" + "Poll: " + this.pollInterval + "\n" + "Precision: " + this.precision + " (" + new DecimalFormat("0.#E0").format(Math.pow(2.0d, (double) this.precision)) + " seconds)\n" + "Root delay: " + new DecimalFormat("0.00").format(this.rootDelay * 1000.0d) + " ms\n" + "Root dispersion: " + new DecimalFormat("0.00").format(this.rootDispersion * 1000.0d) + " ms\n" + "Reference identifier: " + referenceIdentifierToString(this.referenceIdentifier, this.stratum, this.version) + "\n" + "Reference timestamp: " + timestampToString(this.referenceTimestamp) + "\n" + "Originate timestamp: " + timestampToString(this.originateTimestamp) + "\n" + "Receive timestamp:   " + timestampToString(this.receiveTimestamp) + "\n" + "Transmit timestamp:  " + timestampToString(this.transmitTimestamp);
    }

    public static short unsignedByteToShort(byte b) {
        if ((b & 128) == 128) {
            return (short) ((b & Byte.MAX_VALUE) + 128);
        }
        return (short) b;
    }

    public static double decodeTimestamp(byte[] array, int pointer) {
        double r = 0.0d;
        for (int i = 0; i < 8; i++) {
            r += ((double) unsignedByteToShort(array[pointer + i])) * Math.pow(2.0d, (double) ((3 - i) * 8));
        }
        return r;
    }

    public static void encodeTimestamp(byte[] array, int pointer, double timestamp) {
        for (int i = 0; i < 8; i++) {
            double base = Math.pow(2.0d, (double) ((3 - i) * 8));
            array[pointer + i] = (byte) ((int) (timestamp / base));
            timestamp -= ((double) unsignedByteToShort(array[pointer + i])) * base;
        }
        array[7] = (byte) ((int) (Math.random() * 255.0d));
    }

    public static String timestampToString(double timestamp) {
        if (timestamp == 0.0d) {
            return "0";
        }
        String date = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new Date((long) (1000.0d * (timestamp - 2.2089888E9d))));
        return date + new DecimalFormat(".000000").format(timestamp - ((double) ((long) timestamp)));
    }

    public static String referenceIdentifierToString(byte[] ref, short stratum2, byte version2) {
        if (stratum2 == 0 || stratum2 == 1) {
            return new String(ref);
        }
        if (version2 == 3) {
            return unsignedByteToShort(ref[0]) + "." + unsignedByteToShort(ref[1]) + "." + unsignedByteToShort(ref[2]) + "." + unsignedByteToShort(ref[3]);
        }
        if (version2 == 4) {
            return "" + ((((double) unsignedByteToShort(ref[0])) / 256.0d) + (((double) unsignedByteToShort(ref[1])) / 65536.0d) + (((double) unsignedByteToShort(ref[2])) / 1.6777216E7d) + (((double) unsignedByteToShort(ref[3])) / 4.294967296E9d));
        }
        return "";
    }
}
