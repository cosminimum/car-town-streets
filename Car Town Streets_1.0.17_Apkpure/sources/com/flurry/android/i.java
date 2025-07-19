package com.flurry.android;

import android.os.SystemClock;
import android.support.v4.view.MotionEventCompat;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.Map;
/* loaded from: classes.dex */
final class i {
    private String a;
    private Map b;
    private long c;
    private boolean d;
    private long e;
    private byte[] f;

    public i(String str, Map map, long j, boolean z) {
        this.a = str;
        this.b = map;
        this.c = j;
        this.d = z;
    }

    public final boolean a(String str) {
        return this.d && this.e == 0 && this.a.equals(str);
    }

    public final void a() {
        this.e = SystemClock.elapsedRealtime() - this.c;
    }

    public final byte[] b() {
        DataOutputStream dataOutputStream;
        Throwable th;
        if (this.f == null) {
            DataOutputStream dataOutputStream2 = null;
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                dataOutputStream = new DataOutputStream(byteArrayOutputStream);
                try {
                    dataOutputStream.writeUTF(this.a);
                    if (this.b == null) {
                        dataOutputStream.writeShort(0);
                    } else {
                        dataOutputStream.writeShort(this.b.size());
                        for (Map.Entry entry : this.b.entrySet()) {
                            dataOutputStream.writeUTF(r.a((String) entry.getKey(), (int) MotionEventCompat.ACTION_MASK));
                            dataOutputStream.writeUTF(r.a((String) entry.getValue(), (int) MotionEventCompat.ACTION_MASK));
                        }
                    }
                    dataOutputStream.writeLong(this.c);
                    dataOutputStream.writeLong(this.e);
                    dataOutputStream.flush();
                    this.f = byteArrayOutputStream.toByteArray();
                    r.a(dataOutputStream);
                } catch (IOException e) {
                    dataOutputStream2 = dataOutputStream;
                    try {
                        this.f = new byte[0];
                        r.a(dataOutputStream2);
                        return this.f;
                    } catch (Throwable th2) {
                        dataOutputStream = dataOutputStream2;
                        th = th2;
                        r.a(dataOutputStream);
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    r.a(dataOutputStream);
                    throw th;
                }
            } catch (IOException e2) {
            } catch (Throwable th4) {
                dataOutputStream = null;
                th = th4;
            }
        }
        return this.f;
    }
}
