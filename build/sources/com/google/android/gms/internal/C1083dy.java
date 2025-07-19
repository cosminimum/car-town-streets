package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.C1071dw;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

/* renamed from: com.google.android.gms.internal.dy */
public final class C1083dy implements Handler.Callback {

    /* renamed from: pA */
    private static C1083dy f2602pA;

    /* renamed from: pz */
    private static final Object f2603pz = new Object();

    /* renamed from: iT */
    private final Context f2604iT;
    private final Handler mHandler;
    /* access modifiers changed from: private */

    /* renamed from: pB */
    public final HashMap<String, C1084a> f2605pB = new HashMap<>();

    /* renamed from: com.google.android.gms.internal.dy$a */
    final class C1084a {
        /* access modifiers changed from: private */
        public int mState = 0;

        /* renamed from: pC */
        private final String f2606pC;

        /* renamed from: pD */
        private final C1085a f2607pD = new C1085a();
        /* access modifiers changed from: private */

        /* renamed from: pE */
        public final HashSet<C1071dw<?>.f> f2608pE = new HashSet<>();

        /* renamed from: pF */
        private boolean f2609pF;
        /* access modifiers changed from: private */

        /* renamed from: pG */
        public IBinder f2610pG;
        /* access modifiers changed from: private */

        /* renamed from: pH */
        public ComponentName f2611pH;

        /* renamed from: com.google.android.gms.internal.dy$a$a */
        public class C1085a implements ServiceConnection {
            public C1085a() {
            }

            public void onServiceConnected(ComponentName component, IBinder binder) {
                synchronized (C1083dy.this.f2605pB) {
                    IBinder unused = C1084a.this.f2610pG = binder;
                    ComponentName unused2 = C1084a.this.f2611pH = component;
                    Iterator it = C1084a.this.f2608pE.iterator();
                    while (it.hasNext()) {
                        ((C1071dw.C1077f) it.next()).onServiceConnected(component, binder);
                    }
                    int unused3 = C1084a.this.mState = 1;
                }
            }

            public void onServiceDisconnected(ComponentName component) {
                synchronized (C1083dy.this.f2605pB) {
                    IBinder unused = C1084a.this.f2610pG = null;
                    ComponentName unused2 = C1084a.this.f2611pH = component;
                    Iterator it = C1084a.this.f2608pE.iterator();
                    while (it.hasNext()) {
                        ((C1071dw.C1077f) it.next()).onServiceDisconnected(component);
                    }
                    int unused3 = C1084a.this.mState = 2;
                }
            }
        }

        public C1084a(String str) {
            this.f2606pC = str;
        }

        /* renamed from: a */
        public void mo7483a(C1071dw<?>.f fVar) {
            this.f2608pE.add(fVar);
        }

        /* renamed from: b */
        public void mo7484b(C1071dw<?>.f fVar) {
            this.f2608pE.remove(fVar);
        }

        /* renamed from: bU */
        public C1085a mo7485bU() {
            return this.f2607pD;
        }

        /* renamed from: bV */
        public String mo7486bV() {
            return this.f2606pC;
        }

        /* renamed from: bW */
        public boolean mo7487bW() {
            return this.f2608pE.isEmpty();
        }

        /* renamed from: c */
        public boolean mo7488c(C1071dw<?>.f fVar) {
            return this.f2608pE.contains(fVar);
        }

        public IBinder getBinder() {
            return this.f2610pG;
        }

        public ComponentName getComponentName() {
            return this.f2611pH;
        }

        public int getState() {
            return this.mState;
        }

        public boolean isBound() {
            return this.f2609pF;
        }

        /* renamed from: q */
        public void mo7493q(boolean z) {
            this.f2609pF = z;
        }
    }

    private C1083dy(Context context) {
        this.mHandler = new Handler(context.getMainLooper(), this);
        this.f2604iT = context.getApplicationContext();
    }

    /* renamed from: s */
    public static C1083dy m2519s(Context context) {
        synchronized (f2603pz) {
            if (f2602pA == null) {
                f2602pA = new C1083dy(context.getApplicationContext());
            }
        }
        return f2602pA;
    }

    /* renamed from: a */
    public boolean mo7480a(String str, C1071dw<?>.f fVar) {
        boolean isBound;
        synchronized (this.f2605pB) {
            C1084a aVar = this.f2605pB.get(str);
            if (aVar != null) {
                this.mHandler.removeMessages(0, aVar);
                if (!aVar.mo7488c(fVar)) {
                    aVar.mo7483a(fVar);
                    switch (aVar.getState()) {
                        case 1:
                            fVar.onServiceConnected(aVar.getComponentName(), aVar.getBinder());
                            break;
                        case 2:
                            aVar.mo7493q(this.f2604iT.bindService(new Intent(str).setPackage(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE), aVar.mo7485bU(), 129));
                            break;
                    }
                } else {
                    throw new IllegalStateException("Trying to bind a GmsServiceConnection that was already connected before.  startServiceAction=" + str);
                }
            } else {
                aVar = new C1084a(str);
                aVar.mo7483a(fVar);
                aVar.mo7493q(this.f2604iT.bindService(new Intent(str).setPackage(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE), aVar.mo7485bU(), 129));
                this.f2605pB.put(str, aVar);
            }
            isBound = aVar.isBound();
        }
        return isBound;
    }

    /* renamed from: b */
    public void mo7481b(String str, C1071dw<?>.f fVar) {
        synchronized (this.f2605pB) {
            C1084a aVar = this.f2605pB.get(str);
            if (aVar == null) {
                throw new IllegalStateException("Nonexistent connection status for service action: " + str);
            } else if (!aVar.mo7488c(fVar)) {
                throw new IllegalStateException("Trying to unbind a GmsServiceConnection  that was not bound before.  startServiceAction=" + str);
            } else {
                aVar.mo7484b(fVar);
                if (aVar.mo7487bW()) {
                    this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(0, aVar), 5000);
                }
            }
        }
    }

    public boolean handleMessage(Message msg) {
        switch (msg.what) {
            case 0:
                C1084a aVar = (C1084a) msg.obj;
                synchronized (this.f2605pB) {
                    if (aVar.mo7487bW()) {
                        this.f2604iT.unbindService(aVar.mo7485bU());
                        this.f2605pB.remove(aVar.mo7486bV());
                    }
                }
                return true;
            default:
                return false;
        }
    }
}
