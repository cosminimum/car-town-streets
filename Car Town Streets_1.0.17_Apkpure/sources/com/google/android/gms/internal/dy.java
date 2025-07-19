package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.dw;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class dy implements Handler.Callback {
    private static dy pA;
    private static final Object pz = new Object();
    private final Context iT;
    private final Handler mHandler;
    private final HashMap<String, a> pB = new HashMap<>();

    /* loaded from: classes.dex */
    final class a {
        private final String pC;
        private boolean pF;
        private IBinder pG;
        private ComponentName pH;
        private final ServiceConnectionC0035a pD = new ServiceConnectionC0035a();
        private final HashSet<dw<?>.f> pE = new HashSet<>();
        private int mState = 0;

        /* renamed from: com.google.android.gms.internal.dy$a$a  reason: collision with other inner class name */
        /* loaded from: classes.dex */
        public class ServiceConnectionC0035a implements ServiceConnection {
            public ServiceConnectionC0035a() {
            }

            @Override // android.content.ServiceConnection
            public void onServiceConnected(ComponentName component, IBinder binder) {
                synchronized (dy.this.pB) {
                    a.this.pG = binder;
                    a.this.pH = component;
                    Iterator it = a.this.pE.iterator();
                    while (it.hasNext()) {
                        ((dw.f) it.next()).onServiceConnected(component, binder);
                    }
                    a.this.mState = 1;
                }
            }

            @Override // android.content.ServiceConnection
            public void onServiceDisconnected(ComponentName component) {
                synchronized (dy.this.pB) {
                    a.this.pG = null;
                    a.this.pH = component;
                    Iterator it = a.this.pE.iterator();
                    while (it.hasNext()) {
                        ((dw.f) it.next()).onServiceDisconnected(component);
                    }
                    a.this.mState = 2;
                }
            }
        }

        public a(String str) {
            this.pC = str;
        }

        public void a(dw<?>.f fVar) {
            this.pE.add(fVar);
        }

        public void b(dw<?>.f fVar) {
            this.pE.remove(fVar);
        }

        public ServiceConnectionC0035a bU() {
            return this.pD;
        }

        public String bV() {
            return this.pC;
        }

        public boolean bW() {
            return this.pE.isEmpty();
        }

        public boolean c(dw<?>.f fVar) {
            return this.pE.contains(fVar);
        }

        public IBinder getBinder() {
            return this.pG;
        }

        public ComponentName getComponentName() {
            return this.pH;
        }

        public int getState() {
            return this.mState;
        }

        public boolean isBound() {
            return this.pF;
        }

        public void q(boolean z) {
            this.pF = z;
        }
    }

    private dy(Context context) {
        this.mHandler = new Handler(context.getMainLooper(), this);
        this.iT = context.getApplicationContext();
    }

    public static dy s(Context context) {
        synchronized (pz) {
            if (pA == null) {
                pA = new dy(context.getApplicationContext());
            }
        }
        return pA;
    }

    public boolean a(String str, dw<?>.f fVar) {
        boolean isBound;
        synchronized (this.pB) {
            a aVar = this.pB.get(str);
            if (aVar != null) {
                this.mHandler.removeMessages(0, aVar);
                if (!aVar.c(fVar)) {
                    aVar.a(fVar);
                    switch (aVar.getState()) {
                        case 1:
                            fVar.onServiceConnected(aVar.getComponentName(), aVar.getBinder());
                            break;
                        case 2:
                            aVar.q(this.iT.bindService(new Intent(str).setPackage(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE), aVar.bU(), 129));
                            break;
                    }
                } else {
                    throw new IllegalStateException("Trying to bind a GmsServiceConnection that was already connected before.  startServiceAction=" + str);
                }
            } else {
                aVar = new a(str);
                aVar.a(fVar);
                aVar.q(this.iT.bindService(new Intent(str).setPackage(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE), aVar.bU(), 129));
                this.pB.put(str, aVar);
            }
            isBound = aVar.isBound();
        }
        return isBound;
    }

    public void b(String str, dw<?>.f fVar) {
        synchronized (this.pB) {
            a aVar = this.pB.get(str);
            if (aVar == null) {
                throw new IllegalStateException("Nonexistent connection status for service action: " + str);
            }
            if (!aVar.c(fVar)) {
                throw new IllegalStateException("Trying to unbind a GmsServiceConnection  that was not bound before.  startServiceAction=" + str);
            }
            aVar.b(fVar);
            if (aVar.bW()) {
                this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(0, aVar), 5000L);
            }
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message msg) {
        switch (msg.what) {
            case 0:
                a aVar = (a) msg.obj;
                synchronized (this.pB) {
                    if (aVar.bW()) {
                        this.iT.unbindService(aVar.bU());
                        this.pB.remove(aVar.bV());
                    }
                }
                return true;
            default:
                return false;
        }
    }
}
