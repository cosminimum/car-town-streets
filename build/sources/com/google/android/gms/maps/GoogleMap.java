package com.google.android.gms.maps;

import android.graphics.Bitmap;
import android.location.Location;
import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.dynamic.C0772b;
import com.google.android.gms.dynamic.C0775c;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.maps.LocationSource;
import com.google.android.gms.maps.internal.C1514b;
import com.google.android.gms.maps.internal.C1520d;
import com.google.android.gms.maps.internal.C1523e;
import com.google.android.gms.maps.internal.C1526f;
import com.google.android.gms.maps.internal.C1529g;
import com.google.android.gms.maps.internal.C1532h;
import com.google.android.gms.maps.internal.C1535i;
import com.google.android.gms.maps.internal.C1538j;
import com.google.android.gms.maps.internal.C1541k;
import com.google.android.gms.maps.internal.C1544l;
import com.google.android.gms.maps.internal.C1547m;
import com.google.android.gms.maps.internal.C1550n;
import com.google.android.gms.maps.internal.C1553o;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.ILocationSourceDelegate;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.Circle;
import com.google.android.gms.maps.model.CircleOptions;
import com.google.android.gms.maps.model.GroundOverlay;
import com.google.android.gms.maps.model.GroundOverlayOptions;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.Polygon;
import com.google.android.gms.maps.model.PolygonOptions;
import com.google.android.gms.maps.model.Polyline;
import com.google.android.gms.maps.model.PolylineOptions;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import com.google.android.gms.maps.model.TileOverlay;
import com.google.android.gms.maps.model.TileOverlayOptions;
import com.google.android.gms.maps.model.internal.C1578c;
import com.google.android.gms.maps.model.internal.C1581d;
import com.google.android.gms.maps.model.internal.C1587f;

public final class GoogleMap {
    public static final int MAP_TYPE_HYBRID = 4;
    public static final int MAP_TYPE_NONE = 0;
    public static final int MAP_TYPE_NORMAL = 1;
    public static final int MAP_TYPE_SATELLITE = 2;
    public static final int MAP_TYPE_TERRAIN = 3;

    /* renamed from: Br */
    private final IGoogleMapDelegate f3526Br;

    /* renamed from: Bs */
    private UiSettings f3527Bs;

    public interface CancelableCallback {
        void onCancel();

        void onFinish();
    }

    public interface InfoWindowAdapter {
        View getInfoContents(Marker marker);

        View getInfoWindow(Marker marker);
    }

    public interface OnCameraChangeListener {
        void onCameraChange(CameraPosition cameraPosition);
    }

    public interface OnInfoWindowClickListener {
        void onInfoWindowClick(Marker marker);
    }

    public interface OnMapClickListener {
        void onMapClick(LatLng latLng);
    }

    public interface OnMapLoadedCallback {
        void onMapLoaded();
    }

    public interface OnMapLongClickListener {
        void onMapLongClick(LatLng latLng);
    }

    public interface OnMarkerClickListener {
        boolean onMarkerClick(Marker marker);
    }

    public interface OnMarkerDragListener {
        void onMarkerDrag(Marker marker);

        void onMarkerDragEnd(Marker marker);

        void onMarkerDragStart(Marker marker);
    }

    public interface OnMyLocationButtonClickListener {
        boolean onMyLocationButtonClick();
    }

    @Deprecated
    public interface OnMyLocationChangeListener {
        void onMyLocationChange(Location location);
    }

    public interface SnapshotReadyCallback {
        void onSnapshotReady(Bitmap bitmap);
    }

    /* renamed from: com.google.android.gms.maps.GoogleMap$a */
    private static final class C1491a extends C1514b.C1515a {

        /* renamed from: BI */
        private final CancelableCallback f3554BI;

        C1491a(CancelableCallback cancelableCallback) {
            this.f3554BI = cancelableCallback;
        }

        public void onCancel() {
            this.f3554BI.onCancel();
        }

        public void onFinish() {
            this.f3554BI.onFinish();
        }
    }

    protected GoogleMap(IGoogleMapDelegate map) {
        this.f3526Br = (IGoogleMapDelegate) C1102eg.m2616f(map);
    }

    public final Circle addCircle(CircleOptions options) {
        try {
            return new Circle(this.f3526Br.addCircle(options));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final GroundOverlay addGroundOverlay(GroundOverlayOptions options) {
        try {
            C1578c addGroundOverlay = this.f3526Br.addGroundOverlay(options);
            if (addGroundOverlay != null) {
                return new GroundOverlay(addGroundOverlay);
            }
            return null;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Marker addMarker(MarkerOptions options) {
        try {
            C1581d addMarker = this.f3526Br.addMarker(options);
            if (addMarker != null) {
                return new Marker(addMarker);
            }
            return null;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Polygon addPolygon(PolygonOptions options) {
        try {
            return new Polygon(this.f3526Br.addPolygon(options));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Polyline addPolyline(PolylineOptions options) {
        try {
            return new Polyline(this.f3526Br.addPolyline(options));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final TileOverlay addTileOverlay(TileOverlayOptions options) {
        try {
            C1587f addTileOverlay = this.f3526Br.addTileOverlay(options);
            if (addTileOverlay != null) {
                return new TileOverlay(addTileOverlay);
            }
            return null;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void animateCamera(CameraUpdate update) {
        try {
            this.f3526Br.animateCamera(update.mo8938el());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void animateCamera(CameraUpdate update, int durationMs, CancelableCallback callback) {
        try {
            this.f3526Br.animateCameraWithDurationAndCallback(update.mo8938el(), durationMs, callback == null ? null : new C1491a(callback));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void animateCamera(CameraUpdate update, CancelableCallback callback) {
        try {
            this.f3526Br.animateCameraWithCallback(update.mo8938el(), callback == null ? null : new C1491a(callback));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void clear() {
        try {
            this.f3526Br.clear();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: en */
    public IGoogleMapDelegate mo8949en() {
        return this.f3526Br;
    }

    public final CameraPosition getCameraPosition() {
        try {
            return this.f3526Br.getCameraPosition();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final int getMapType() {
        try {
            return this.f3526Br.getMapType();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final float getMaxZoomLevel() {
        try {
            return this.f3526Br.getMaxZoomLevel();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final float getMinZoomLevel() {
        try {
            return this.f3526Br.getMinZoomLevel();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    @Deprecated
    public final Location getMyLocation() {
        try {
            return this.f3526Br.getMyLocation();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Projection getProjection() {
        try {
            return new Projection(this.f3526Br.getProjection());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final UiSettings getUiSettings() {
        try {
            if (this.f3527Bs == null) {
                this.f3527Bs = new UiSettings(this.f3526Br.getUiSettings());
            }
            return this.f3527Bs;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isBuildingsEnabled() {
        try {
            return this.f3526Br.isBuildingsEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isIndoorEnabled() {
        try {
            return this.f3526Br.isIndoorEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isMyLocationEnabled() {
        try {
            return this.f3526Br.isMyLocationEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isTrafficEnabled() {
        try {
            return this.f3526Br.isTrafficEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void moveCamera(CameraUpdate update) {
        try {
            this.f3526Br.moveCamera(update.mo8938el());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setBuildingsEnabled(boolean enabled) {
        try {
            this.f3526Br.setBuildingsEnabled(enabled);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean setIndoorEnabled(boolean enabled) {
        try {
            return this.f3526Br.setIndoorEnabled(enabled);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setInfoWindowAdapter(final InfoWindowAdapter adapter) {
        if (adapter == null) {
            try {
                this.f3526Br.setInfoWindowAdapter((C1520d) null);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } else {
            this.f3526Br.setInfoWindowAdapter(new C1520d.C1521a() {
                /* renamed from: f */
                public C0772b mo8986f(C1581d dVar) {
                    return C0775c.m1696h(adapter.getInfoWindow(new Marker(dVar)));
                }

                /* renamed from: g */
                public C0772b mo8987g(C1581d dVar) {
                    return C0775c.m1696h(adapter.getInfoContents(new Marker(dVar)));
                }
            });
        }
    }

    public final void setLocationSource(final LocationSource source) {
        if (source == null) {
            try {
                this.f3526Br.setLocationSource((ILocationSourceDelegate) null);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } else {
            this.f3526Br.setLocationSource(new ILocationSourceDelegate.C1503a() {
                public void activate(final C1529g listener) {
                    source.activate(new LocationSource.OnLocationChangedListener() {
                        public void onLocationChanged(Location location) {
                            try {
                                listener.mo9225g(C0775c.m1696h(location));
                            } catch (RemoteException e) {
                                throw new RuntimeRemoteException(e);
                            }
                        }
                    });
                }

                public void deactivate() {
                    source.deactivate();
                }
            });
        }
    }

    public final void setMapType(int type) {
        try {
            this.f3526Br.setMapType(type);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setMyLocationEnabled(boolean enabled) {
        try {
            this.f3526Br.setMyLocationEnabled(enabled);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnCameraChangeListener(final OnCameraChangeListener listener) {
        if (listener == null) {
            try {
                this.f3526Br.setOnCameraChangeListener((C1523e) null);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } else {
            this.f3526Br.setOnCameraChangeListener(new C1523e.C1524a() {
                public void onCameraChange(CameraPosition position) {
                    listener.onCameraChange(position);
                }
            });
        }
    }

    public final void setOnInfoWindowClickListener(final OnInfoWindowClickListener listener) {
        if (listener == null) {
            try {
                this.f3526Br.setOnInfoWindowClickListener((C1526f) null);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } else {
            this.f3526Br.setOnInfoWindowClickListener(new C1526f.C1527a() {
                /* renamed from: e */
                public void mo8985e(C1581d dVar) {
                    listener.onInfoWindowClick(new Marker(dVar));
                }
            });
        }
    }

    public final void setOnMapClickListener(final OnMapClickListener listener) {
        if (listener == null) {
            try {
                this.f3526Br.setOnMapClickListener((C1532h) null);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } else {
            this.f3526Br.setOnMapClickListener(new C1532h.C1533a() {
                public void onMapClick(LatLng point) {
                    listener.onMapClick(point);
                }
            });
        }
    }

    public void setOnMapLoadedCallback(final OnMapLoadedCallback callback) {
        if (callback == null) {
            try {
                this.f3526Br.setOnMapLoadedCallback((C1535i) null);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } else {
            this.f3526Br.setOnMapLoadedCallback(new C1535i.C1536a() {
                public void onMapLoaded() throws RemoteException {
                    callback.onMapLoaded();
                }
            });
        }
    }

    public final void setOnMapLongClickListener(final OnMapLongClickListener listener) {
        if (listener == null) {
            try {
                this.f3526Br.setOnMapLongClickListener((C1538j) null);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } else {
            this.f3526Br.setOnMapLongClickListener(new C1538j.C1539a() {
                public void onMapLongClick(LatLng point) {
                    listener.onMapLongClick(point);
                }
            });
        }
    }

    public final void setOnMarkerClickListener(final OnMarkerClickListener listener) {
        if (listener == null) {
            try {
                this.f3526Br.setOnMarkerClickListener((C1541k) null);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } else {
            this.f3526Br.setOnMarkerClickListener(new C1541k.C1542a() {
                /* renamed from: a */
                public boolean mo8996a(C1581d dVar) {
                    return listener.onMarkerClick(new Marker(dVar));
                }
            });
        }
    }

    public final void setOnMarkerDragListener(final OnMarkerDragListener listener) {
        if (listener == null) {
            try {
                this.f3526Br.setOnMarkerDragListener((C1544l) null);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } else {
            this.f3526Br.setOnMarkerDragListener(new C1544l.C1545a() {
                /* renamed from: b */
                public void mo8997b(C1581d dVar) {
                    listener.onMarkerDragStart(new Marker(dVar));
                }

                /* renamed from: c */
                public void mo8998c(C1581d dVar) {
                    listener.onMarkerDragEnd(new Marker(dVar));
                }

                /* renamed from: d */
                public void mo8999d(C1581d dVar) {
                    listener.onMarkerDrag(new Marker(dVar));
                }
            });
        }
    }

    public final void setOnMyLocationButtonClickListener(final OnMyLocationButtonClickListener listener) {
        if (listener == null) {
            try {
                this.f3526Br.setOnMyLocationButtonClickListener((C1547m) null);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } else {
            this.f3526Br.setOnMyLocationButtonClickListener(new C1547m.C1548a() {
                public boolean onMyLocationButtonClick() throws RemoteException {
                    return listener.onMyLocationButtonClick();
                }
            });
        }
    }

    @Deprecated
    public final void setOnMyLocationChangeListener(final OnMyLocationChangeListener listener) {
        if (listener == null) {
            try {
                this.f3526Br.setOnMyLocationChangeListener((C1550n) null);
            } catch (RemoteException e) {
                throw new RuntimeRemoteException(e);
            }
        } else {
            this.f3526Br.setOnMyLocationChangeListener(new C1550n.C1551a() {
                /* renamed from: d */
                public void mo8988d(C0772b bVar) {
                    listener.onMyLocationChange((Location) C0775c.m1695b(bVar));
                }
            });
        }
    }

    public final void setPadding(int left, int top, int right, int bottom) {
        try {
            this.f3526Br.setPadding(left, top, right, bottom);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setTrafficEnabled(boolean enabled) {
        try {
            this.f3526Br.setTrafficEnabled(enabled);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void snapshot(SnapshotReadyCallback callback) {
        snapshot(callback, (Bitmap) null);
    }

    public final void snapshot(final SnapshotReadyCallback callback, Bitmap bitmap) {
        try {
            this.f3526Br.snapshot(new C1553o.C1554a() {
                /* renamed from: c */
                public void mo8991c(C0772b bVar) throws RemoteException {
                    callback.onSnapshotReady((Bitmap) C0775c.m1695b(bVar));
                }

                public void onSnapshotReady(Bitmap snapshot) throws RemoteException {
                    callback.onSnapshotReady(snapshot);
                }
            }, (C0775c) (bitmap != null ? C0775c.m1696h(bitmap) : null));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void stopAnimation() {
        try {
            this.f3526Br.stopAnimation();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }
}
