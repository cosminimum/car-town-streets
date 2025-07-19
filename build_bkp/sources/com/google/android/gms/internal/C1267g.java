package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import java.io.IOException;

/* renamed from: com.google.android.gms.internal.g */
public class C1267g extends C1127f {

    /* renamed from: com.google.android.gms.internal.g$a */
    class C1268a {

        /* renamed from: dH */
        private String f2920dH;

        /* renamed from: dI */
        private boolean f2921dI;

        public C1268a(String str, boolean z) {
            this.f2920dH = str;
            this.f2921dI = z;
        }

        public String getId() {
            return this.f2920dH;
        }

        public boolean isLimitAdTrackingEnabled() {
            return this.f2921dI;
        }
    }

    private C1267g(Context context, C1443j jVar, C1446k kVar) {
        super(context, jVar, kVar);
    }

    /* renamed from: a */
    public static C1267g m3379a(String str, Context context) {
        C0850a aVar = new C0850a();
        m2740a(str, context, aVar);
        return new C1267g(context, aVar, new C1449m(239));
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public void mo7500b(Context context) {
        long j = 1;
        super.mo7500b(context);
        try {
            C1268a f = mo7991f(context);
            try {
                if (!f.isLimitAdTrackingEnabled()) {
                    j = 0;
                }
                mo7497a(28, j);
                String id = f.getId();
                if (id != null) {
                    mo7498a(30, id);
                }
            } catch (IOException e) {
            }
        } catch (GooglePlayServicesNotAvailableException e2) {
        } catch (IOException e3) {
            mo7497a(28, 1);
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: f */
    public C1268a mo7991f(Context context) throws IOException, GooglePlayServicesNotAvailableException {
        String str;
        int i = 0;
        try {
            AdvertisingIdClient.Info advertisingIdInfo = AdvertisingIdClient.getAdvertisingIdInfo(context);
            String id = advertisingIdInfo.getId();
            if (id == null || !id.matches("^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$")) {
                str = id;
            } else {
                byte[] bArr = new byte[16];
                int i2 = 0;
                while (i < id.length()) {
                    if (i == 8 || i == 13 || i == 18 || i == 23) {
                        i++;
                    }
                    bArr[i2] = (byte) ((Character.digit(id.charAt(i), 16) << 4) + Character.digit(id.charAt(i + 1), 16));
                    i2++;
                    i += 2;
                }
                str = this.f2618dw.mo6983a(bArr, true);
            }
            return new C1268a(str, advertisingIdInfo.isLimitAdTrackingEnabled());
        } catch (GooglePlayServicesRepairableException e) {
            throw new IOException(e);
        }
    }
}
