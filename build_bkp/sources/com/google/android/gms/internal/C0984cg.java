package com.google.android.gms.internal;

import com.facebook.internal.ServerProtocol;
import com.google.android.gms.plus.PlusShare;
import java.util.Map;

/* renamed from: com.google.android.gms.internal.cg */
public final class C0984cg {
    /* access modifiers changed from: private */

    /* renamed from: fx */
    public final Object f2339fx = new Object();

    /* renamed from: gv */
    private C1007cw f2340gv;
    /* access modifiers changed from: private */

    /* renamed from: hK */
    public String f2341hK;
    /* access modifiers changed from: private */

    /* renamed from: hL */
    public String f2342hL;

    /* renamed from: hM */
    public final C0880an f2343hM = new C0880an() {
        /* renamed from: a */
        public void mo7068a(C1007cw cwVar, Map<String, String> map) {
            synchronized (C0984cg.this.f2339fx) {
                C1004ct.m2218v("Invalid " + map.get(ServerProtocol.DIALOG_PARAM_TYPE) + " request error: " + map.get("errors"));
                int unused = C0984cg.this.f2345hm = 1;
                C0984cg.this.f2339fx.notify();
            }
        }
    };

    /* renamed from: hN */
    public final C0880an f2344hN = new C0880an() {
        /* renamed from: a */
        public void mo7068a(C1007cw cwVar, Map<String, String> map) {
            synchronized (C0984cg.this.f2339fx) {
                String str = map.get(PlusShare.KEY_CALL_TO_ACTION_URL);
                if (str == null) {
                    C1004ct.m2218v("URL missing in loadAdUrl GMSG.");
                    return;
                }
                if (str.contains("%40mediation_adapters%40")) {
                    str = str.replaceAll("%40mediation_adapters%40", C0991cl.m2164b(cwVar.getContext(), map.get("check_adapters"), C0984cg.this.f2341hK));
                    C1004ct.m2217u("Ad request URL modified to " + str);
                }
                String unused = C0984cg.this.f2342hL = str;
                C0984cg.this.f2339fx.notify();
            }
        }
    };
    /* access modifiers changed from: private */

    /* renamed from: hm */
    public int f2345hm = -2;

    public C0984cg(String str) {
        this.f2341hK = str;
    }

    /* renamed from: ap */
    public String mo7215ap() {
        String str;
        synchronized (this.f2339fx) {
            while (this.f2342hL == null && this.f2345hm == -2) {
                try {
                    this.f2339fx.wait();
                } catch (InterruptedException e) {
                    C1004ct.m2218v("Ad request service was interrupted.");
                    str = null;
                }
            }
            str = this.f2342hL;
        }
        return str;
    }

    /* renamed from: b */
    public void mo7216b(C1007cw cwVar) {
        synchronized (this.f2339fx) {
            this.f2340gv = cwVar;
        }
    }

    public int getErrorCode() {
        int i;
        synchronized (this.f2339fx) {
            i = this.f2345hm;
        }
        return i;
    }
}
