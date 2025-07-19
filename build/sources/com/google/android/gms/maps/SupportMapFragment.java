package com.google.android.gms.maps;

import android.app.Activity;
import android.os.Bundle;
import android.os.RemoteException;
import android.support.p000v4.app.Fragment;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.dynamic.C0764a;
import com.google.android.gms.dynamic.C0775c;
import com.google.android.gms.dynamic.C0776d;
import com.google.android.gms.dynamic.LifecycleDelegate;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.maps.internal.C1556p;
import com.google.android.gms.maps.internal.C1557q;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.IMapFragmentDelegate;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public class SupportMapFragment extends Fragment {

    /* renamed from: BU */
    private GoogleMap f3582BU;

    /* renamed from: Cf */
    private final C1497b f3583Cf = new C1497b(this);

    /* renamed from: com.google.android.gms.maps.SupportMapFragment$a */
    static class C1496a implements LifecycleDelegate {

        /* renamed from: BW */
        private final IMapFragmentDelegate f3584BW;

        /* renamed from: Cg */
        private final Fragment f3585Cg;

        public C1496a(Fragment fragment, IMapFragmentDelegate iMapFragmentDelegate) {
            this.f3584BW = (IMapFragmentDelegate) C1102eg.m2616f(iMapFragmentDelegate);
            this.f3585Cg = (Fragment) C1102eg.m2616f(fragment);
        }

        /* renamed from: ew */
        public IMapFragmentDelegate mo9083ew() {
            return this.f3584BW;
        }

        public void onCreate(Bundle savedInstanceState) {
            if (savedInstanceState == null) {
                try {
                    savedInstanceState = new Bundle();
                } catch (RemoteException e) {
                    throw new RuntimeRemoteException(e);
                }
            }
            Bundle arguments = this.f3585Cg.getArguments();
            if (arguments != null && arguments.containsKey("MapOptions")) {
                C1556p.m4197a(savedInstanceState, "MapOptions", arguments.getParcelable("MapOptions"));
            }
            this.f3584BW.onCreate(savedInstanceState);
        }

        public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
            try {
                return (View) C0775c.m1695b(this.f3584BW.onCreateView(C0775c.m1696h(inflater), C0775c.m1696h(container), savedInstanceState));
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onDestroy() {
            try {
                this.f3584BW.onDestroy();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onDestroyView() {
            try {
                this.f3584BW.onDestroyView();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onInflate(Activity activity, Bundle attrs, Bundle savedInstanceState) {
            try {
                this.f3584BW.onInflate(C0775c.m1696h(activity), (GoogleMapOptions) attrs.getParcelable("MapOptions"), savedInstanceState);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onLowMemory() {
            try {
                this.f3584BW.onLowMemory();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onPause() {
            try {
                this.f3584BW.onPause();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onResume() {
            try {
                this.f3584BW.onResume();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onSaveInstanceState(Bundle outState) {
            try {
                this.f3584BW.onSaveInstanceState(outState);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }
    }

    /* renamed from: com.google.android.gms.maps.SupportMapFragment$b */
    static class C1497b extends C0764a<C1496a> {

        /* renamed from: BX */
        protected C0776d<C1496a> f3586BX;

        /* renamed from: Cg */
        private final Fragment f3587Cg;

        /* renamed from: gs */
        private Activity f3588gs;

        C1497b(Fragment fragment) {
            this.f3587Cg = fragment;
        }

        /* access modifiers changed from: private */
        public void setActivity(Activity activity) {
            this.f3588gs = activity;
            mo9084ex();
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo6388a(C0776d<C1496a> dVar) {
            this.f3586BX = dVar;
            mo9084ex();
        }

        /* renamed from: ex */
        public void mo9084ex() {
            if (this.f3588gs != null && this.f3586BX != null && mo6389cZ() == null) {
                try {
                    MapsInitializer.initialize(this.f3588gs);
                    this.f3586BX.mo6399a(new C1496a(this.f3587Cg, C1557q.m4202u(this.f3588gs).mo9213f(C0775c.m1696h(this.f3588gs))));
                } catch (RemoteException e) {
                    throw new RuntimeRemoteException(e);
                } catch (GooglePlayServicesNotAvailableException e2) {
                }
            }
        }
    }

    public static SupportMapFragment newInstance() {
        return new SupportMapFragment();
    }

    public static SupportMapFragment newInstance(GoogleMapOptions options) {
        SupportMapFragment supportMapFragment = new SupportMapFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable("MapOptions", options);
        supportMapFragment.setArguments(bundle);
        return supportMapFragment;
    }

    /* access modifiers changed from: protected */
    /* renamed from: ew */
    public IMapFragmentDelegate mo9081ew() {
        this.f3583Cf.mo9084ex();
        if (this.f3583Cf.mo6389cZ() == null) {
            return null;
        }
        return ((C1496a) this.f3583Cf.mo6389cZ()).mo9083ew();
    }

    public final GoogleMap getMap() {
        IMapFragmentDelegate ew = mo9081ew();
        if (ew == null) {
            return null;
        }
        try {
            IGoogleMapDelegate map = ew.getMap();
            if (map == null) {
                return null;
            }
            if (this.f3582BU == null || this.f3582BU.mo8949en().asBinder() != map.asBinder()) {
                this.f3582BU = new GoogleMap(map);
            }
            return this.f3582BU;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void onActivityCreated(Bundle savedInstanceState) {
        if (savedInstanceState != null) {
            savedInstanceState.setClassLoader(SupportMapFragment.class.getClassLoader());
        }
        super.onActivityCreated(savedInstanceState);
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.f3583Cf.setActivity(activity);
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.f3583Cf.onCreate(savedInstanceState);
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return this.f3583Cf.onCreateView(inflater, container, savedInstanceState);
    }

    public void onDestroy() {
        this.f3583Cf.onDestroy();
        super.onDestroy();
    }

    public void onDestroyView() {
        this.f3583Cf.onDestroyView();
        super.onDestroyView();
    }

    public void onInflate(Activity activity, AttributeSet attrs, Bundle savedInstanceState) {
        super.onInflate(activity, attrs, savedInstanceState);
        this.f3583Cf.setActivity(activity);
        GoogleMapOptions createFromAttributes = GoogleMapOptions.createFromAttributes(activity, attrs);
        Bundle bundle = new Bundle();
        bundle.putParcelable("MapOptions", createFromAttributes);
        this.f3583Cf.onInflate(activity, bundle, savedInstanceState);
    }

    public void onLowMemory() {
        this.f3583Cf.onLowMemory();
        super.onLowMemory();
    }

    public void onPause() {
        this.f3583Cf.onPause();
        super.onPause();
    }

    public void onResume() {
        super.onResume();
        this.f3583Cf.onResume();
    }

    public void onSaveInstanceState(Bundle outState) {
        if (outState != null) {
            outState.setClassLoader(SupportMapFragment.class.getClassLoader());
        }
        super.onSaveInstanceState(outState);
        this.f3583Cf.onSaveInstanceState(outState);
    }

    public void setArguments(Bundle args) {
        super.setArguments(args);
    }
}
