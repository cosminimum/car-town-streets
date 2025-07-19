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

/* renamed from: com.google.android.gms.internal.e */
public abstract class C1087e implements C1021d {

    /* renamed from: du */
    protected MotionEvent f2616du;

    /* renamed from: dv */
    protected DisplayMetrics f2617dv;

    /* renamed from: dw */
    protected C1443j f2618dw;

    /* renamed from: dx */
    private C1446k f2619dx;

    protected C1087e(Context context, C1443j jVar, C1446k kVar) {
        this.f2618dw = jVar;
        this.f2619dx = kVar;
        try {
            this.f2617dv = context.getResources().getDisplayMetrics();
        } catch (UnsupportedOperationException e) {
            this.f2617dv = new DisplayMetrics();
            this.f2617dv.density = 1.0f;
        }
    }

    /* renamed from: a */
    private String m2538a(Context context, String str, boolean z) {
        byte[] c;
        try {
            synchronized (this) {
                m2539b();
                if (z) {
                    mo7501c(context);
                } else {
                    mo7500b(context);
                }
                c = m2540c();
            }
            return c.length == 0 ? Integer.toString(5) : mo7496a(c, str);
        } catch (NoSuchAlgorithmException e) {
            return Integer.toString(7);
        } catch (UnsupportedEncodingException e2) {
            return Integer.toString(7);
        } catch (IOException e3) {
            return Integer.toString(3);
        }
    }

    /* renamed from: b */
    private void m2539b() {
        this.f2619dx.reset();
    }

    /* renamed from: c */
    private byte[] m2540c() throws IOException {
        return this.f2619dx.mo8809h();
    }

    /* renamed from: a */
    public String mo7286a(Context context) {
        return m2538a(context, (String) null, false);
    }

    /* renamed from: a */
    public String mo7287a(Context context, String str) {
        return m2538a(context, str, true);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public String mo7496a(byte[] bArr, String str) throws NoSuchAlgorithmException, UnsupportedEncodingException, IOException {
        byte[] array;
        if (bArr.length > 239) {
            m2539b();
            mo7497a(20, 1);
            bArr = m2540c();
        }
        if (bArr.length < 239) {
            byte[] bArr2 = new byte[(239 - bArr.length)];
            new SecureRandom().nextBytes(bArr2);
            array = ByteBuffer.allocate(240).put((byte) bArr.length).put(bArr).put(bArr2).array();
        } else {
            array = ByteBuffer.allocate(240).put((byte) bArr.length).put(bArr).array();
        }
        MessageDigest instance = MessageDigest.getInstance("MD5");
        instance.update(array);
        byte[] array2 = ByteBuffer.allocate(256).put(instance.digest()).put(array).array();
        byte[] bArr3 = new byte[256];
        new C0896b().mo7092a(array2, bArr3);
        if (str != null && str.length() > 0) {
            mo7499a(str, bArr3);
        }
        return this.f2618dw.mo6983a(bArr3, true);
    }

    /* renamed from: a */
    public void mo7288a(int i, int i2, int i3) {
        if (this.f2616du != null) {
            this.f2616du.recycle();
        }
        this.f2616du = MotionEvent.obtain(0, (long) i3, 1, ((float) i) * this.f2617dv.density, ((float) i2) * this.f2617dv.density, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, 0, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, 0, 0);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo7497a(int i, long j) throws IOException {
        this.f2619dx.mo8807b(i, j);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo7498a(int i, String str) throws IOException {
        this.f2619dx.mo8808b(i, str);
    }

    /* renamed from: a */
    public void mo7289a(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 1) {
            if (this.f2616du != null) {
                this.f2616du.recycle();
            }
            this.f2616du = MotionEvent.obtain(motionEvent);
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public void mo7499a(String str, byte[] bArr) throws UnsupportedEncodingException {
        if (str.length() > 32) {
            str = str.substring(0, 32);
        }
        new C1437iv(str.getBytes("UTF-8")).mo8773h(bArr);
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public abstract void mo7500b(Context context);

    /* access modifiers changed from: protected */
    /* renamed from: c */
    public abstract void mo7501c(Context context);
}
