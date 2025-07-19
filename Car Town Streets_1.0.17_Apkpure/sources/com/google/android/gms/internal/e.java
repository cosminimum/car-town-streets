package com.google.android.gms.internal;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
/* loaded from: classes.dex */
public abstract class e implements d {
    protected MotionEvent du;
    protected DisplayMetrics dv;
    protected j dw;
    private k dx;

    /* JADX INFO: Access modifiers changed from: protected */
    public e(Context context, j jVar, k kVar) {
        this.dw = jVar;
        this.dx = kVar;
        try {
            this.dv = context.getResources().getDisplayMetrics();
        } catch (UnsupportedOperationException e) {
            this.dv = new DisplayMetrics();
            this.dv.density = 1.0f;
        }
    }

    private String a(Context context, String str, boolean z) {
        byte[] c;
        try {
            synchronized (this) {
                b();
                if (z) {
                    c(context);
                } else {
                    b(context);
                }
                c = c();
            }
            return c.length == 0 ? Integer.toString(5) : a(c, str);
        } catch (UnsupportedEncodingException e) {
            return Integer.toString(7);
        } catch (IOException e2) {
            return Integer.toString(3);
        } catch (NoSuchAlgorithmException e3) {
            return Integer.toString(7);
        }
    }

    private void b() {
        this.dx.reset();
    }

    private byte[] c() throws IOException {
        return this.dx.h();
    }

    @Override // com.google.android.gms.internal.d
    public String a(Context context) {
        return a(context, (String) null, false);
    }

    @Override // com.google.android.gms.internal.d
    public String a(Context context, String str) {
        return a(context, str, true);
    }

    String a(byte[] bArr, String str) throws NoSuchAlgorithmException, UnsupportedEncodingException, IOException {
        byte[] array;
        if (bArr.length > 239) {
            b();
            a(20, 1L);
            bArr = c();
        }
        if (bArr.length < 239) {
            byte[] bArr2 = new byte[239 - bArr.length];
            new SecureRandom().nextBytes(bArr2);
            array = ByteBuffer.allocate(240).put((byte) bArr.length).put(bArr).put(bArr2).array();
        } else {
            array = ByteBuffer.allocate(240).put((byte) bArr.length).put(bArr).array();
        }
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");
        messageDigest.update(array);
        byte[] array2 = ByteBuffer.allocate(256).put(messageDigest.digest()).put(array).array();
        byte[] bArr3 = new byte[256];
        new b().a(array2, bArr3);
        if (str != null && str.length() > 0) {
            a(str, bArr3);
        }
        return this.dw.a(bArr3, true);
    }

    @Override // com.google.android.gms.internal.d
    public void a(int i, int i2, int i3) {
        if (this.du != null) {
            this.du.recycle();
        }
        this.du = MotionEvent.obtain(0L, i3, 1, i * this.dv.density, i2 * this.dv.density, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, 0, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, 0, 0);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void a(int i, long j) throws IOException {
        this.dx.b(i, j);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void a(int i, String str) throws IOException {
        this.dx.b(i, str);
    }

    @Override // com.google.android.gms.internal.d
    public void a(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 1) {
            if (this.du != null) {
                this.du.recycle();
            }
            this.du = MotionEvent.obtain(motionEvent);
        }
    }

    void a(String str, byte[] bArr) throws UnsupportedEncodingException {
        if (str.length() > 32) {
            str = str.substring(0, 32);
        }
        new iv(str.getBytes("UTF-8")).h(bArr);
    }

    protected abstract void b(Context context);

    protected abstract void c(Context context);
}
