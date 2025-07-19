package com.google.android.gms.maps;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.dynamic.C0764a;
import com.google.android.gms.dynamic.C0775c;
import com.google.android.gms.dynamic.C0776d;
import com.google.android.gms.dynamic.LifecycleDelegate;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.maps.internal.C1557q;
import com.google.android.gms.maps.internal.IMapViewDelegate;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public class MapView extends FrameLayout {

    /* renamed from: BU */
    private GoogleMap f3573BU;

    /* renamed from: BY */
    private final C1495b f3574BY;

    /* renamed from: com.google.android.gms.maps.MapView$a */
    static class C1494a implements LifecycleDelegate {

        /* renamed from: BZ */
        private final ViewGroup f3575BZ;

        /* renamed from: Ca */
        private final IMapViewDelegate f3576Ca;

        /* renamed from: Cb */
        private View f3577Cb;

        public C1494a(ViewGroup viewGroup, IMapViewDelegate iMapViewDelegate) {
            this.f3576Ca = (IMapViewDelegate) C1102eg.m2616f(iMapViewDelegate);
            this.f3575BZ = (ViewGroup) C1102eg.m2616f(viewGroup);
        }

        /* renamed from: ey */
        public IMapViewDelegate mo9076ey() {
            return this.f3576Ca;
        }

        public void onCreate(Bundle savedInstanceState) {
            try {
                this.f3576Ca.onCreate(savedInstanceState);
                this.f3577Cb = (View) C0775c.m1695b(this.f3576Ca.getView());
                this.f3575BZ.removeAllViews();
                this.f3575BZ.addView(this.f3577Cb);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
            throw new UnsupportedOperationException("onCreateView not allowed on MapViewDelegate");
        }

        public void onDestroy() {
            try {
                this.f3576Ca.onDestroy();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onDestroyView() {
            throw new UnsupportedOperationException("onDestroyView not allowed on MapViewDelegate");
        }

        public void onInflate(Activity activity, Bundle attrs, Bundle savedInstanceState) {
            throw new UnsupportedOperationException("onInflate not allowed on MapViewDelegate");
        }

        public void onLowMemory() {
            try {
                this.f3576Ca.onLowMemory();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onPause() {
            try {
                this.f3576Ca.onPause();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onResume() {
            try {
                this.f3576Ca.onResume();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onSaveInstanceState(Bundle outState) {
            try {
                this.f3576Ca.onSaveInstanceState(outState);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }
    }

    /* renamed from: com.google.android.gms.maps.MapView$b */
    static class C1495b extends C0764a<C1494a> {

        /* renamed from: BX */
        protected C0776d<C1494a> f3578BX;

        /* renamed from: Cc */
        private final ViewGroup f3579Cc;

        /* renamed from: Cd */
        private final GoogleMapOptions f3580Cd;
        private final Context mContext;

        C1495b(ViewGroup viewGroup, Context context, GoogleMapOptions googleMapOptions) {
            this.f3579Cc = viewGroup;
            this.mContext = context;
            this.f3580Cd = googleMapOptions;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo6388a(C0776d<C1494a> dVar) {
            this.f3578BX = dVar;
            mo9077ex();
        }

        /* renamed from: ex */
        public void mo9077ex() {
            if (this.f3578BX != null && mo6389cZ() == null) {
                try {
                    this.f3578BX.mo6399a(new C1494a(this.f3579Cc, C1557q.m4202u(this.mContext).mo9208a(C0775c.m1696h(this.mContext), this.f3580Cd)));
                } catch (RemoteException e) {
                    throw new RuntimeRemoteException(e);
                } catch (GooglePlayServicesNotAvailableException e2) {
                }
            }
        }
    }

    public MapView(Context context) {
        super(context);
        this.f3574BY = new C1495b(this, context, (GoogleMapOptions) null);
    }

    public MapView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.f3574BY = new C1495b(this, context, GoogleMapOptions.createFromAttributes(context, attrs));
    }

    public MapView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.f3574BY = new C1495b(this, context, GoogleMapOptions.createFromAttributes(context, attrs));
    }

    public MapView(Context context, GoogleMapOptions options) {
        super(context);
        this.f3574BY = new C1495b(this, context, options);
    }

    public final GoogleMap getMap() {
        if (this.f3573BU != null) {
            return this.f3573BU;
        }
        this.f3574BY.mo9077ex();
        if (this.f3574BY.mo6389cZ() == null) {
            return null;
        }
        try {
            this.f3573BU = new GoogleMap(((C1494a) this.f3574BY.mo6389cZ()).mo9076ey().getMap());
            return this.f3573BU;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void onCreate(Bundle savedInstanceState) {
        this.f3574BY.onCreate(savedInstanceState);
        if (this.f3574BY.mo6389cZ() == null) {
            this.f3574BY.mo6387a((FrameLayout) this);
        }
    }

    public final void onDestroy() {
        this.f3574BY.onDestroy();
    }

    public final void onLowMemory() {
        this.f3574BY.onLowMemory();
    }

    public final void onPause() {
        this.f3574BY.onPause();
    }

    public final void onResume() {
        this.f3574BY.onResume();
    }

    public final void onSaveInstanceState(Bundle outState) {
        this.f3574BY.onSaveInstanceState(outState);
    }
}
