package com.google.tagmanager.protobuf;

final class Utf8 {
    public static final int COMPLETE = 0;
    public static final int MALFORMED = -1;

    private Utf8() {
    }

    public static boolean isValidUtf8(byte[] bytes) {
        return isValidUtf8(bytes, 0, bytes.length);
    }

    public static boolean isValidUtf8(byte[] bytes, int index, int limit) {
        return partialIsValidUtf8(bytes, index, limit) == 0;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0044, code lost:
        if (r10[r3] > -65) goto L_0x0046;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x007f, code lost:
        if (r10[r3] > -65) goto L_0x0081;
     */
    /* JADX WARNING: Incorrect type for immutable var: ssa=byte, code=int, for r1v2, types: [byte, int] */
    /* JADX WARNING: Incorrect type for immutable var: ssa=byte, code=int, for r1v5, types: [byte, int] */
    /* JADX WARNING: Incorrect type for immutable var: ssa=byte, code=int, for r2v3, types: [byte, int] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int partialIsValidUtf8(int r9, byte[] r10, int r11, int r12) {
        /*
            r8 = -32
            r6 = -96
            r4 = -1
            r7 = -65
            if (r9 == 0) goto L_0x0084
            if (r11 < r12) goto L_0x000c
        L_0x000b:
            return r9
        L_0x000c:
            byte r0 = (byte) r9
            if (r0 >= r8) goto L_0x001c
            r5 = -62
            if (r0 < r5) goto L_0x001a
            int r3 = r11 + 1
            byte r5 = r10[r11]
            if (r5 <= r7) goto L_0x0083
            r11 = r3
        L_0x001a:
            r9 = r4
            goto L_0x000b
        L_0x001c:
            r5 = -16
            if (r0 >= r5) goto L_0x0048
            int r5 = r9 >> 8
            r5 = r5 ^ -1
            byte r1 = (byte) r5
            if (r1 != 0) goto L_0x0033
            int r3 = r11 + 1
            byte r1 = r10[r11]
            if (r3 < r12) goto L_0x0034
            int r9 = incompleteStateFor(r0, r1)
            r11 = r3
            goto L_0x000b
        L_0x0033:
            r3 = r11
        L_0x0034:
            if (r1 > r7) goto L_0x008b
            if (r0 != r8) goto L_0x003a
            if (r1 < r6) goto L_0x008b
        L_0x003a:
            r5 = -19
            if (r0 != r5) goto L_0x0040
            if (r1 >= r6) goto L_0x008b
        L_0x0040:
            int r11 = r3 + 1
            byte r5 = r10[r3]
            if (r5 <= r7) goto L_0x0084
        L_0x0046:
            r9 = r4
            goto L_0x000b
        L_0x0048:
            int r5 = r9 >> 8
            r5 = r5 ^ -1
            byte r1 = (byte) r5
            r2 = 0
            if (r1 != 0) goto L_0x005c
            int r3 = r11 + 1
            byte r1 = r10[r11]
            if (r3 < r12) goto L_0x0060
            int r9 = incompleteStateFor(r0, r1)
            r11 = r3
            goto L_0x000b
        L_0x005c:
            int r5 = r9 >> 16
            byte r2 = (byte) r5
            r3 = r11
        L_0x0060:
            if (r2 != 0) goto L_0x006e
            int r11 = r3 + 1
            byte r2 = r10[r3]
            if (r11 < r12) goto L_0x006d
            int r9 = incompleteStateFor((int) r0, (int) r1, (int) r2)
            goto L_0x000b
        L_0x006d:
            r3 = r11
        L_0x006e:
            if (r1 > r7) goto L_0x0089
            int r5 = r0 << 28
            int r6 = r1 + 112
            int r5 = r5 + r6
            int r5 = r5 >> 30
            if (r5 != 0) goto L_0x0089
            if (r2 > r7) goto L_0x0089
            int r11 = r3 + 1
            byte r5 = r10[r3]
            if (r5 <= r7) goto L_0x0084
        L_0x0081:
            r9 = r4
            goto L_0x000b
        L_0x0083:
            r11 = r3
        L_0x0084:
            int r9 = partialIsValidUtf8(r10, r11, r12)
            goto L_0x000b
        L_0x0089:
            r11 = r3
            goto L_0x0081
        L_0x008b:
            r11 = r3
            goto L_0x0046
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.tagmanager.protobuf.Utf8.partialIsValidUtf8(int, byte[], int, int):int");
    }

    public static int partialIsValidUtf8(byte[] bytes, int index, int limit) {
        while (index < limit && bytes[index] >= 0) {
            index++;
        }
        if (index >= limit) {
            return 0;
        }
        return partialIsValidUtf8NonAscii(bytes, index, limit);
    }

    private static int partialIsValidUtf8NonAscii(byte[] bytes, int index, int limit) {
        int index2;
        int index3;
        int index4 = index;
        while (index4 < limit) {
            int index5 = index4 + 1;
            byte byte1 = bytes[index4];
            if (byte1 < 0) {
                if (byte1 < -32) {
                    if (index5 >= limit) {
                        return byte1;
                    }
                    if (byte1 >= -62) {
                        index3 = index5 + 1;
                        if (bytes[index5] > -65) {
                            int i = index3;
                        }
                    }
                    return -1;
                } else if (byte1 < -16) {
                    if (index5 >= limit - 1) {
                        return incompleteStateFor(bytes, index5, limit);
                    }
                    int index6 = index5 + 1;
                    byte byte2 = bytes[index5];
                    if (byte2 > -65 || ((byte1 == -32 && byte2 < -96) || (byte1 == -19 && byte2 >= -96))) {
                        int i2 = index6;
                    } else {
                        index2 = index6 + 1;
                        if (bytes[index6] > -65) {
                        }
                        index4 = index2;
                    }
                    return -1;
                } else if (index5 >= limit - 2) {
                    return incompleteStateFor(bytes, index5, limit);
                } else {
                    index3 = index5 + 1;
                    byte byte22 = bytes[index5];
                    if (byte22 <= -65 && (((byte1 << 28) + (byte22 + 112)) >> 30) == 0) {
                        int index7 = index3 + 1;
                        if (bytes[index3] > -65) {
                            return -1;
                        }
                        index3 = index7 + 1;
                        if (bytes[index7] > -65) {
                        }
                    }
                    int i3 = index3;
                    return -1;
                }
                index2 = index3;
                index4 = index2;
            } else {
                index4 = index5;
            }
        }
        int i4 = index4;
        return 0;
    }

    private static int incompleteStateFor(int byte1) {
        if (byte1 > -12) {
            return -1;
        }
        return byte1;
    }

    private static int incompleteStateFor(int byte1, int byte2) {
        if (byte1 > -12 || byte2 > -65) {
            return -1;
        }
        return (byte2 << 8) ^ byte1;
    }

    private static int incompleteStateFor(int byte1, int byte2, int byte3) {
        if (byte1 > -12 || byte2 > -65 || byte3 > -65) {
            return -1;
        }
        return ((byte2 << 8) ^ byte1) ^ (byte3 << 16);
    }

    private static int incompleteStateFor(byte[] bytes, int index, int limit) {
        byte byte1 = bytes[index - 1];
        switch (limit - index) {
            case 0:
                return incompleteStateFor(byte1);
            case 1:
                return incompleteStateFor(byte1, bytes[index]);
            case 2:
                return incompleteStateFor((int) byte1, (int) bytes[index], (int) bytes[index + 1]);
            default:
                throw new AssertionError();
        }
    }
}
