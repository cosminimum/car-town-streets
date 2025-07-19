package com.chartboost.sdk.Libraries;

import android.graphics.Bitmap;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/* renamed from: com.chartboost.sdk.Libraries.a */
public class C0049a {

    /* renamed from: a */
    private Map<String, C0050a> f55a = Collections.synchronizedMap(new LinkedHashMap(10, 1.5f, true));

    /* renamed from: b */
    private long f56b = 0;

    /* renamed from: c */
    private long f57c = 1000000;

    public C0049a() {
        mo1199a(Runtime.getRuntime().maxMemory() / 4);
    }

    /* renamed from: a */
    public void mo1199a(long j) {
        this.f57c = j;
    }

    /* renamed from: a */
    public C0050a mo1197a(String str) {
        if (!this.f55a.containsKey(str)) {
            return null;
        }
        return this.f55a.get(str);
    }

    /* renamed from: a */
    public void mo1200a(String str, C0050a aVar) {
        try {
            if (this.f55a.containsKey(str)) {
                this.f56b -= m58a(this.f55a.get(str).mo1205b());
            }
            this.f55a.put(str, aVar);
            this.f56b += m58a(aVar.mo1205b());
            m59b();
        } catch (Throwable th) {
            th.printStackTrace();
        }
    }

    /* renamed from: b */
    private void m59b() {
        if (this.f56b > this.f57c) {
            Iterator<Map.Entry<String, C0050a>> it = this.f55a.entrySet().iterator();
            while (it.hasNext()) {
                this.f56b -= m58a(((C0050a) it.next().getValue()).mo1205b());
                it.remove();
                if (this.f56b <= this.f57c) {
                    return;
                }
            }
        }
    }

    /* renamed from: a */
    public void mo1198a() {
        this.f55a.clear();
    }

    /* renamed from: a */
    private static long m58a(Bitmap bitmap) {
        if (bitmap == null) {
            return 0;
        }
        return (long) (bitmap.getRowBytes() * bitmap.getHeight());
    }

    /* renamed from: com.chartboost.sdk.Libraries.a$a */
    public static class C0050a {

        /* renamed from: a */
        private Bitmap f58a;

        /* renamed from: b */
        private int f59b;

        /* renamed from: c */
        private boolean f60c;

        public C0050a(Bitmap bitmap, int i) {
            mo1203a(bitmap);
            mo1202a(i);
            mo1204a(true);
        }

        /* renamed from: a */
        public void mo1201a() {
            if (!this.f60c) {
                try {
                    if (this.f58a != null && !this.f58a.isRecycled()) {
                        this.f58a.recycle();
                    }
                } catch (Exception e) {
                }
            }
        }

        /* renamed from: b */
        public Bitmap mo1205b() {
            return this.f58a;
        }

        /* renamed from: a */
        public void mo1203a(Bitmap bitmap) {
            this.f58a = bitmap;
        }

        /* renamed from: a */
        public void mo1202a(int i) {
            this.f59b = i;
        }

        /* renamed from: c */
        public int mo1206c() {
            return this.f58a.getWidth() * this.f59b;
        }

        /* renamed from: d */
        public int mo1207d() {
            return this.f58a.getHeight() * this.f59b;
        }

        /* renamed from: a */
        public void mo1204a(boolean z) {
            this.f60c = z;
        }
    }
}
