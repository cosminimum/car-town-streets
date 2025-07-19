package com.millennialmedia.android;

import android.support.v4.view.MotionEventCompat;
import com.flurry.android.Constants;
import java.util.Arrays;

class Base64 {
    private static final char[] CA = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".toCharArray();
    private static final int[] IA = new int[256];

    Base64() {
    }

    static {
        Arrays.fill(IA, -1);
        int iS = CA.length;
        for (int i = 0; i < iS; i++) {
            IA[CA[i]] = i;
        }
        IA[61] = 0;
    }

    public static final char[] encodeToChar(byte[] sArr, boolean lineSep) {
        int sLen = sArr != null ? sArr.length : 0;
        if (sLen == 0) {
            return new char[0];
        }
        int eLen = (sLen / 3) * 3;
        int cCnt = (((sLen - 1) / 3) + 1) << 2;
        int dLen = cCnt + (lineSep ? ((cCnt - 1) / 76) << 1 : 0);
        char[] dArr = new char[dLen];
        int cc = 0;
        int d = 0;
        int s = 0;
        while (s < eLen) {
            int s2 = s + 1;
            int s3 = s2 + 1;
            int s4 = s3 + 1;
            int i = ((sArr[s] & Constants.UNKNOWN) << 16) | ((sArr[s2] & Constants.UNKNOWN) << 8) | (sArr[s3] & MotionEventCompat.ACTION_MASK);
            int d2 = d + 1;
            dArr[d] = CA[(i >>> 18) & 63];
            int d3 = d2 + 1;
            dArr[d2] = CA[(i >>> 12) & 63];
            int d4 = d3 + 1;
            dArr[d3] = CA[(i >>> 6) & 63];
            int d5 = d4 + 1;
            dArr[d4] = CA[i & 63];
            if (lineSep && (cc = cc + 1) == 19 && d5 < dLen - 2) {
                int d6 = d5 + 1;
                dArr[d5] = 13;
                d5 = d6 + 1;
                dArr[d6] = 10;
                cc = 0;
            }
            d = d5;
            s = s4;
        }
        int left = sLen - eLen;
        if (left <= 0) {
            return dArr;
        }
        int i2 = ((sArr[eLen] & Constants.UNKNOWN) << 10) | (left == 2 ? (sArr[sLen - 1] & Constants.UNKNOWN) << 2 : 0);
        dArr[dLen - 4] = CA[i2 >> 12];
        dArr[dLen - 3] = CA[(i2 >>> 6) & 63];
        dArr[dLen - 2] = left == 2 ? CA[i2 & 63] : '=';
        dArr[dLen - 1] = '=';
        return dArr;
    }

    public static final byte[] decode(byte[] sArr) {
        int s;
        int sepCnt = 0;
        for (byte b : sArr) {
            if (IA[b & Constants.UNKNOWN] < 0) {
                sepCnt++;
            }
        }
        if ((sLen - sepCnt) % 4 != 0) {
            return null;
        }
        int pad = 0;
        int i = sLen;
        while (i > 1) {
            i--;
            if (IA[sArr[i] & Constants.UNKNOWN] > 0) {
                break;
            } else if (sArr[i] == 61) {
                pad++;
            }
        }
        int len = (((sLen - sepCnt) * 6) >> 3) - pad;
        byte[] dArr = new byte[len];
        int s2 = 0;
        int d = 0;
        while (d < len) {
            int i2 = 0;
            int j = 0;
            while (true) {
                s = s2;
                if (j >= 4) {
                    break;
                }
                s2 = s + 1;
                int c = IA[sArr[s] & Constants.UNKNOWN];
                if (c >= 0) {
                    i2 |= c << (18 - (j * 6));
                } else {
                    j--;
                }
                j++;
            }
            int d2 = d + 1;
            dArr[d] = (byte) (i2 >> 16);
            if (d2 < len) {
                int d3 = d2 + 1;
                dArr[d2] = (byte) (i2 >> 8);
                if (d3 < len) {
                    d2 = d3 + 1;
                    dArr[d3] = (byte) i2;
                } else {
                    d2 = d3;
                }
            }
            d = d2;
            s2 = s;
        }
        return dArr;
    }

    public static final String encodeToString(byte[] sArr, boolean lineSep) {
        return new String(encodeToChar(sArr, lineSep));
    }

    public static final byte[] decode(String str) {
        int sLen;
        int s;
        if (str != null) {
            sLen = str.length();
        } else {
            sLen = 0;
        }
        if (sLen == 0) {
            return new byte[0];
        }
        int sepCnt = 0;
        for (int i = 0; i < sLen; i++) {
            if (IA[str.charAt(i)] < 0) {
                sepCnt++;
            }
        }
        if ((sLen - sepCnt) % 4 != 0) {
            return null;
        }
        int pad = 0;
        int i2 = sLen;
        while (i2 > 1) {
            i2--;
            if (IA[str.charAt(i2)] > 0) {
                break;
            } else if (str.charAt(i2) == '=') {
                pad++;
            }
        }
        int len = (((sLen - sepCnt) * 6) >> 3) - pad;
        byte[] dArr = new byte[len];
        int s2 = 0;
        int d = 0;
        while (d < len) {
            int i3 = 0;
            int j = 0;
            while (true) {
                s = s2;
                if (j >= 4) {
                    break;
                }
                s2 = s + 1;
                int c = IA[str.charAt(s)];
                if (c >= 0) {
                    i3 |= c << (18 - (j * 6));
                } else {
                    j--;
                }
                j++;
            }
            int d2 = d + 1;
            dArr[d] = (byte) (i3 >> 16);
            if (d2 < len) {
                int d3 = d2 + 1;
                dArr[d2] = (byte) (i3 >> 8);
                if (d3 < len) {
                    d2 = d3 + 1;
                    dArr[d3] = (byte) i3;
                } else {
                    d2 = d3;
                }
            }
            d = d2;
            s2 = s;
        }
        return dArr;
    }
}
