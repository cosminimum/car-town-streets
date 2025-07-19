package com.flurry.android;

import android.os.SystemClock;
import android.support.p000v4.view.MotionEventCompat;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.Map;

/* renamed from: com.flurry.android.i */
final class C0311i {

    /* renamed from: a */
    private String f592a;

    /* renamed from: b */
    private Map f593b;

    /* renamed from: c */
    private long f594c;

    /* renamed from: d */
    private boolean f595d;

    /* renamed from: e */
    private long f596e;

    /* renamed from: f */
    private byte[] f597f;

    public C0311i(String str, Map map, long j, boolean z) {
        this.f592a = str;
        this.f593b = map;
        this.f594c = j;
        this.f595d = z;
    }

    /* renamed from: a */
    public final boolean mo2408a(String str) {
        return this.f595d && this.f596e == 0 && this.f592a.equals(str);
    }

    /* renamed from: a */
    public final void mo2407a() {
        this.f596e = SystemClock.elapsedRealtime() - this.f594c;
    }

    /* renamed from: b */
    public final byte[] mo2409b() {
        DataOutputStream dataOutputStream;
        Throwable th;
        if (this.f597f == null) {
            DataOutputStream dataOutputStream2 = null;
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                dataOutputStream = new DataOutputStream(byteArrayOutputStream);
                try {
                    dataOutputStream.writeUTF(this.f592a);
                    if (this.f593b == null) {
                        dataOutputStream.writeShort(0);
                    } else {
                        dataOutputStream.writeShort(this.f593b.size());
                        for (Map.Entry entry : this.f593b.entrySet()) {
                            dataOutputStream.writeUTF(C0320r.m559a((String) entry.getKey(), (int) MotionEventCompat.ACTION_MASK));
                            dataOutputStream.writeUTF(C0320r.m559a((String) entry.getValue(), (int) MotionEventCompat.ACTION_MASK));
                        }
                    }
                    dataOutputStream.writeLong(this.f594c);
                    dataOutputStream.writeLong(this.f596e);
                    dataOutputStream.flush();
                    this.f597f = byteArrayOutputStream.toByteArray();
                    C0320r.m561a((Closeable) dataOutputStream);
                } catch (IOException e) {
                    dataOutputStream2 = dataOutputStream;
                    try {
                        this.f597f = new byte[0];
                        C0320r.m561a((Closeable) dataOutputStream2);
                        return this.f597f;
                    } catch (Throwable th2) {
                        dataOutputStream = dataOutputStream2;
                        th = th2;
                        C0320r.m561a((Closeable) dataOutputStream);
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    C0320r.m561a((Closeable) dataOutputStream);
                    throw th;
                }
            } catch (IOException e2) {
                this.f597f = new byte[0];
                C0320r.m561a((Closeable) dataOutputStream2);
                return this.f597f;
            } catch (Throwable th4) {
                dataOutputStream = null;
                th = th4;
                C0320r.m561a((Closeable) dataOutputStream);
                throw th;
            }
        }
        return this.f597f;
    }
}
