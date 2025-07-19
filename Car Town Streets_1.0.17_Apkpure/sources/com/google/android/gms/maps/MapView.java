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
import com.google.android.gms.dynamic.LifecycleDelegate;
import com.google.android.gms.dynamic.c;
import com.google.android.gms.dynamic.d;
import com.google.android.gms.internal.eg;
import com.google.android.gms.maps.internal.IMapViewDelegate;
import com.google.android.gms.maps.internal.q;
import com.google.android.gms.maps.model.RuntimeRemoteException;
/* loaded from: classes.dex */
public class MapView extends FrameLayout {
    private GoogleMap BU;
    private final b BY;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class a implements LifecycleDelegate {
        private final ViewGroup BZ;
        private final IMapViewDelegate Ca;
        private View Cb;

        public a(ViewGroup viewGroup, IMapViewDelegate iMapViewDelegate) {
            this.Ca = (IMapViewDelegate) eg.f(iMapViewDelegate);
            this.BZ = (ViewGroup) eg.f(viewGroup);
        }

        public IMapViewDelegate ey() {
            return this.Ca;
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onCreate(Bundle savedInstanceState) {
            try {
                this.Ca.onCreate(savedInstanceState);
                this.Cb = (View) c.b(this.Ca.getView());
                this.BZ.removeAllViews();
                this.BZ.addView(this.Cb);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
            throw new UnsupportedOperationException("onCreateView not allowed on MapViewDelegate");
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onDestroy() {
            try {
                this.Ca.onDestroy();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onDestroyView() {
            throw new UnsupportedOperationException("onDestroyView not allowed on MapViewDelegate");
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onInflate(Activity activity, Bundle attrs, Bundle savedInstanceState) {
            throw new UnsupportedOperationException("onInflate not allowed on MapViewDelegate");
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onLowMemory() {
            try {
                this.Ca.onLowMemory();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onPause() {
            try {
                this.Ca.onPause();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onResume() {
            try {
                this.Ca.onResume();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        @Override // com.google.android.gms.dynamic.LifecycleDelegate
        public void onSaveInstanceState(Bundle outState) {
            try {
                this.Ca.onSaveInstanceState(outState);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }
    }

    /* loaded from: classes.dex */
    static class b extends com.google.android.gms.dynamic.a<a> {
        protected d<a> BX;
        private final ViewGroup Cc;
        private final GoogleMapOptions Cd;
        private final Context mContext;

        b(ViewGroup viewGroup, Context context, GoogleMapOptions googleMapOptions) {
            this.Cc = viewGroup;
            this.mContext = context;
            this.Cd = googleMapOptions;
        }

        @Override // com.google.android.gms.dynamic.a
        protected void a(d<a> dVar) {
            this.BX = dVar;
            ex();
        }

        public void ex() {
            if (this.BX == null || cZ() != null) {
                return;
            }
            try {
                this.BX.a(new a(this.Cc, q.u(this.mContext).a(c.h(this.mContext), this.Cd)));
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            } catch (GooglePlayServicesNotAvailableException e2) {
            }
        }
    }

    public MapView(Context context) {
        super(context);
        this.BY = new b(this, context, null);
    }

    public MapView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.BY = new b(this, context, GoogleMapOptions.createFromAttributes(context, attrs));
    }

    public MapView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.BY = new b(this, context, GoogleMapOptions.createFromAttributes(context, attrs));
    }

    public MapView(Context context, GoogleMapOptions options) {
        super(context);
        this.BY = new b(this, context, options);
    }

    public final GoogleMap getMap() {
        if (this.BU != null) {
            return this.BU;
        }
        this.BY.ex();
        if (this.BY.cZ() == null) {
            return null;
        }
        try {
            this.BU = new GoogleMap(this.BY.cZ().ey().getMap());
            return this.BU;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void onCreate(Bundle savedInstanceState) {
        this.BY.onCreate(savedInstanceState);
        if (this.BY.cZ() == null) {
            this.BY.a(this);
        }
    }

    public final void onDestroy() {
        this.BY.onDestroy();
    }

    public final void onLowMemory() {
        this.BY.onLowMemory();
    }

    public final void onPause() {
        this.BY.onPause();
    }

    public final void onResume() {
        this.BY.onResume();
    }

    public final void onSaveInstanceState(Bundle outState) {
        this.BY.onSaveInstanceState(outState);
    }
}
