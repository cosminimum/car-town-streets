package com.google.android.gms.maps;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.os.RemoteException;
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

public class MapFragment extends Fragment {

    /* renamed from: BT */
    private final C1493b f3566BT = new C1493b(this);

    /* renamed from: BU */
    private GoogleMap f3567BU;

    /* renamed from: com.google.android.gms.maps.MapFragment$a */
    static class C1492a implements LifecycleDelegate {

        /* renamed from: BV */
        private final Fragment f3568BV;

        /* renamed from: BW */
        private final IMapFragmentDelegate f3569BW;

        public C1492a(Fragment fragment, IMapFragmentDelegate iMapFragmentDelegate) {
            this.f3569BW = (IMapFragmentDelegate) C1102eg.m2616f(iMapFragmentDelegate);
            this.f3568BV = (Fragment) C1102eg.m2616f(fragment);
        }

        /* renamed from: ew */
        public IMapFragmentDelegate mo9067ew() {
            return this.f3569BW;
        }

        public void onCreate(Bundle savedInstanceState) {
            if (savedInstanceState == null) {
                try {
                    savedInstanceState = new Bundle();
                } catch (RemoteException e) {
                    throw new RuntimeRemoteException(e);
                }
            }
            Bundle arguments = this.f3568BV.getArguments();
            if (arguments != null && arguments.containsKey("MapOptions")) {
                C1556p.m4197a(savedInstanceState, "MapOptions", arguments.getParcelable("MapOptions"));
            }
            this.f3569BW.onCreate(savedInstanceState);
        }

        public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
            try {
                return (View) C0775c.m1695b(this.f3569BW.onCreateView(C0775c.m1696h(inflater), C0775c.m1696h(container), savedInstanceState));
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onDestroy() {
            try {
                this.f3569BW.onDestroy();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onDestroyView() {
            try {
                this.f3569BW.onDestroyView();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onInflate(Activity activity, Bundle attrs, Bundle savedInstanceState) {
            try {
                this.f3569BW.onInflate(C0775c.m1696h(activity), (GoogleMapOptions) attrs.getParcelable("MapOptions"), savedInstanceState);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onLowMemory() {
            try {
                this.f3569BW.onLowMemory();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onPause() {
            try {
                this.f3569BW.onPause();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onResume() {
            try {
                this.f3569BW.onResume();
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }

        public void onSaveInstanceState(Bundle outState) {
            try {
                this.f3569BW.onSaveInstanceState(outState);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        }
    }

    /* renamed from: com.google.android.gms.maps.MapFragment$b */
    static class C1493b extends C0764a<C1492a> {

        /* renamed from: BV */
        private final Fragment f3570BV;

        /* renamed from: BX */
        protected C0776d<C1492a> f3571BX;

        /* renamed from: gs */
        private Activity f3572gs;

        C1493b(Fragment fragment) {
            this.f3570BV = fragment;
        }

        /* access modifiers changed from: private */
        public void setActivity(Activity activity) {
            this.f3572gs = activity;
            mo9068ex();
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo6388a(C0776d<C1492a> dVar) {
            this.f3571BX = dVar;
            mo9068ex();
        }

        /* renamed from: ex */
        public void mo9068ex() {
            if (this.f3572gs != null && this.f3571BX != null && mo6389cZ() == null) {
                try {
                    MapsInitializer.initialize(this.f3572gs);
                    this.f3571BX.mo6399a(new C1492a(this.f3570BV, C1557q.m4202u(this.f3572gs).mo9213f(C0775c.m1696h(this.f3572gs))));
                } catch (RemoteException e) {
                    throw new RuntimeRemoteException(e);
                } catch (GooglePlayServicesNotAvailableException e2) {
                }
            }
        }
    }

    public static MapFragment newInstance() {
        return new MapFragment();
    }

    public static MapFragment newInstance(GoogleMapOptions options) {
        MapFragment mapFragment = new MapFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable("MapOptions", options);
        mapFragment.setArguments(bundle);
        return mapFragment;
    }

    /* access modifiers changed from: protected */
    /* renamed from: ew */
    public IMapFragmentDelegate mo9053ew() {
        this.f3566BT.mo9068ex();
        if (this.f3566BT.mo6389cZ() == null) {
            return null;
        }
        return ((C1492a) this.f3566BT.mo6389cZ()).mo9067ew();
    }

    public final GoogleMap getMap() {
        IMapFragmentDelegate ew = mo9053ew();
        if (ew == null) {
            return null;
        }
        try {
            IGoogleMapDelegate map = ew.getMap();
            if (map == null) {
                return null;
            }
            if (this.f3567BU == null || this.f3567BU.mo8949en().asBinder() != map.asBinder()) {
                this.f3567BU = new GoogleMap(map);
            }
            return this.f3567BU;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void onActivityCreated(Bundle savedInstanceState) {
        if (savedInstanceState != null) {
            savedInstanceState.setClassLoader(MapFragment.class.getClassLoader());
        }
        super.onActivityCreated(savedInstanceState);
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.f3566BT.setActivity(activity);
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.f3566BT.onCreate(savedInstanceState);
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return this.f3566BT.onCreateView(inflater, container, savedInstanceState);
    }

    public void onDestroy() {
        this.f3566BT.onDestroy();
        super.onDestroy();
    }

    public void onDestroyView() {
        this.f3566BT.onDestroyView();
        super.onDestroyView();
    }

    public void onInflate(Activity activity, AttributeSet attrs, Bundle savedInstanceState) {
        super.onInflate(activity, attrs, savedInstanceState);
        this.f3566BT.setActivity(activity);
        GoogleMapOptions createFromAttributes = GoogleMapOptions.createFromAttributes(activity, attrs);
        Bundle bundle = new Bundle();
        bundle.putParcelable("MapOptions", createFromAttributes);
        this.f3566BT.onInflate(activity, bundle, savedInstanceState);
    }

    public void onLowMemory() {
        this.f3566BT.onLowMemory();
        super.onLowMemory();
    }

    public void onPause() {
        this.f3566BT.onPause();
        super.onPause();
    }

    public void onResume() {
        super.onResume();
        this.f3566BT.onResume();
    }

    public void onSaveInstanceState(Bundle outState) {
        if (outState != null) {
            outState.setClassLoader(MapFragment.class.getClassLoader());
        }
        super.onSaveInstanceState(outState);
        this.f3566BT.onSaveInstanceState(outState);
    }

    public void setArguments(Bundle args) {
        super.setArguments(args);
    }
}
