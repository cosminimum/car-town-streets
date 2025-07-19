package com.google.android.gms.maps;

import android.graphics.Bitmap;
import android.location.Location;
import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.internal.eg;
import com.google.android.gms.maps.LocationSource;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.ILocationSourceDelegate;
import com.google.android.gms.maps.internal.b;
import com.google.android.gms.maps.internal.d;
import com.google.android.gms.maps.internal.e;
import com.google.android.gms.maps.internal.f;
import com.google.android.gms.maps.internal.g;
import com.google.android.gms.maps.internal.h;
import com.google.android.gms.maps.internal.i;
import com.google.android.gms.maps.internal.j;
import com.google.android.gms.maps.internal.k;
import com.google.android.gms.maps.internal.l;
import com.google.android.gms.maps.internal.m;
import com.google.android.gms.maps.internal.n;
import com.google.android.gms.maps.internal.o;
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
import com.google.android.gms.maps.model.internal.c;
import com.google.android.gms.maps.model.internal.d;
import com.google.android.gms.maps.model.internal.f;
/* loaded from: classes.dex */
public final class GoogleMap {
    public static final int MAP_TYPE_HYBRID = 4;
    public static final int MAP_TYPE_NONE = 0;
    public static final int MAP_TYPE_NORMAL = 1;
    public static final int MAP_TYPE_SATELLITE = 2;
    public static final int MAP_TYPE_TERRAIN = 3;
    private final IGoogleMapDelegate Br;
    private UiSettings Bs;

    /* loaded from: classes.dex */
    public interface CancelableCallback {
        void onCancel();

        void onFinish();
    }

    /* loaded from: classes.dex */
    public interface InfoWindowAdapter {
        View getInfoContents(Marker marker);

        View getInfoWindow(Marker marker);
    }

    /* loaded from: classes.dex */
    public interface OnCameraChangeListener {
        void onCameraChange(CameraPosition cameraPosition);
    }

    /* loaded from: classes.dex */
    public interface OnInfoWindowClickListener {
        void onInfoWindowClick(Marker marker);
    }

    /* loaded from: classes.dex */
    public interface OnMapClickListener {
        void onMapClick(LatLng latLng);
    }

    /* loaded from: classes.dex */
    public interface OnMapLoadedCallback {
        void onMapLoaded();
    }

    /* loaded from: classes.dex */
    public interface OnMapLongClickListener {
        void onMapLongClick(LatLng latLng);
    }

    /* loaded from: classes.dex */
    public interface OnMarkerClickListener {
        boolean onMarkerClick(Marker marker);
    }

    /* loaded from: classes.dex */
    public interface OnMarkerDragListener {
        void onMarkerDrag(Marker marker);

        void onMarkerDragEnd(Marker marker);

        void onMarkerDragStart(Marker marker);
    }

    /* loaded from: classes.dex */
    public interface OnMyLocationButtonClickListener {
        boolean onMyLocationButtonClick();
    }

    @Deprecated
    /* loaded from: classes.dex */
    public interface OnMyLocationChangeListener {
        void onMyLocationChange(Location location);
    }

    /* loaded from: classes.dex */
    public interface SnapshotReadyCallback {
        void onSnapshotReady(Bitmap bitmap);
    }

    /* loaded from: classes.dex */
    private static final class a extends b.a {
        private final CancelableCallback BI;

        a(CancelableCallback cancelableCallback) {
            this.BI = cancelableCallback;
        }

        @Override // com.google.android.gms.maps.internal.b
        public void onCancel() {
            this.BI.onCancel();
        }

        @Override // com.google.android.gms.maps.internal.b
        public void onFinish() {
            this.BI.onFinish();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public GoogleMap(IGoogleMapDelegate map) {
        this.Br = (IGoogleMapDelegate) eg.f(map);
    }

    public final Circle addCircle(CircleOptions options) {
        try {
            return new Circle(this.Br.addCircle(options));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final GroundOverlay addGroundOverlay(GroundOverlayOptions options) {
        try {
            c addGroundOverlay = this.Br.addGroundOverlay(options);
            if (addGroundOverlay == null) {
                return null;
            }
            return new GroundOverlay(addGroundOverlay);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Marker addMarker(MarkerOptions options) {
        try {
            d addMarker = this.Br.addMarker(options);
            if (addMarker == null) {
                return null;
            }
            return new Marker(addMarker);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Polygon addPolygon(PolygonOptions options) {
        try {
            return new Polygon(this.Br.addPolygon(options));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Polyline addPolyline(PolylineOptions options) {
        try {
            return new Polyline(this.Br.addPolyline(options));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final TileOverlay addTileOverlay(TileOverlayOptions options) {
        try {
            f addTileOverlay = this.Br.addTileOverlay(options);
            if (addTileOverlay == null) {
                return null;
            }
            return new TileOverlay(addTileOverlay);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void animateCamera(CameraUpdate update) {
        try {
            this.Br.animateCamera(update.el());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void animateCamera(CameraUpdate update, int durationMs, CancelableCallback callback) {
        try {
            this.Br.animateCameraWithDurationAndCallback(update.el(), durationMs, callback == null ? null : new a(callback));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void animateCamera(CameraUpdate update, CancelableCallback callback) {
        try {
            this.Br.animateCameraWithCallback(update.el(), callback == null ? null : new a(callback));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void clear() {
        try {
            this.Br.clear();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IGoogleMapDelegate en() {
        return this.Br;
    }

    public final CameraPosition getCameraPosition() {
        try {
            return this.Br.getCameraPosition();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final int getMapType() {
        try {
            return this.Br.getMapType();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final float getMaxZoomLevel() {
        try {
            return this.Br.getMaxZoomLevel();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final float getMinZoomLevel() {
        try {
            return this.Br.getMinZoomLevel();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    @Deprecated
    public final Location getMyLocation() {
        try {
            return this.Br.getMyLocation();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final Projection getProjection() {
        try {
            return new Projection(this.Br.getProjection());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final UiSettings getUiSettings() {
        try {
            if (this.Bs == null) {
                this.Bs = new UiSettings(this.Br.getUiSettings());
            }
            return this.Bs;
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isBuildingsEnabled() {
        try {
            return this.Br.isBuildingsEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isIndoorEnabled() {
        try {
            return this.Br.isIndoorEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isMyLocationEnabled() {
        try {
            return this.Br.isMyLocationEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean isTrafficEnabled() {
        try {
            return this.Br.isTrafficEnabled();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void moveCamera(CameraUpdate update) {
        try {
            this.Br.moveCamera(update.el());
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setBuildingsEnabled(boolean enabled) {
        try {
            this.Br.setBuildingsEnabled(enabled);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final boolean setIndoorEnabled(boolean enabled) {
        try {
            return this.Br.setIndoorEnabled(enabled);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setInfoWindowAdapter(final InfoWindowAdapter adapter) {
        try {
            if (adapter == null) {
                this.Br.setInfoWindowAdapter(null);
            } else {
                this.Br.setInfoWindowAdapter(new d.a() { // from class: com.google.android.gms.maps.GoogleMap.11
                    @Override // com.google.android.gms.maps.internal.d
                    public com.google.android.gms.dynamic.b f(com.google.android.gms.maps.model.internal.d dVar) {
                        return com.google.android.gms.dynamic.c.h(adapter.getInfoWindow(new Marker(dVar)));
                    }

                    @Override // com.google.android.gms.maps.internal.d
                    public com.google.android.gms.dynamic.b g(com.google.android.gms.maps.model.internal.d dVar) {
                        return com.google.android.gms.dynamic.c.h(adapter.getInfoContents(new Marker(dVar)));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setLocationSource(final LocationSource source) {
        try {
            if (source == null) {
                this.Br.setLocationSource(null);
            } else {
                this.Br.setLocationSource(new ILocationSourceDelegate.a() { // from class: com.google.android.gms.maps.GoogleMap.1
                    @Override // com.google.android.gms.maps.internal.ILocationSourceDelegate
                    public void activate(final g listener) {
                        source.activate(new LocationSource.OnLocationChangedListener() { // from class: com.google.android.gms.maps.GoogleMap.1.1
                            @Override // com.google.android.gms.maps.LocationSource.OnLocationChangedListener
                            public void onLocationChanged(Location location) {
                                try {
                                    listener.g(com.google.android.gms.dynamic.c.h(location));
                                } catch (RemoteException e) {
                                    throw new RuntimeRemoteException(e);
                                }
                            }
                        });
                    }

                    @Override // com.google.android.gms.maps.internal.ILocationSourceDelegate
                    public void deactivate() {
                        source.deactivate();
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setMapType(int type) {
        try {
            this.Br.setMapType(type);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setMyLocationEnabled(boolean enabled) {
        try {
            this.Br.setMyLocationEnabled(enabled);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnCameraChangeListener(final OnCameraChangeListener listener) {
        try {
            if (listener == null) {
                this.Br.setOnCameraChangeListener(null);
            } else {
                this.Br.setOnCameraChangeListener(new e.a() { // from class: com.google.android.gms.maps.GoogleMap.5
                    @Override // com.google.android.gms.maps.internal.e
                    public void onCameraChange(CameraPosition position) {
                        listener.onCameraChange(position);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnInfoWindowClickListener(final OnInfoWindowClickListener listener) {
        try {
            if (listener == null) {
                this.Br.setOnInfoWindowClickListener(null);
            } else {
                this.Br.setOnInfoWindowClickListener(new f.a() { // from class: com.google.android.gms.maps.GoogleMap.10
                    @Override // com.google.android.gms.maps.internal.f
                    public void e(com.google.android.gms.maps.model.internal.d dVar) {
                        listener.onInfoWindowClick(new Marker(dVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnMapClickListener(final OnMapClickListener listener) {
        try {
            if (listener == null) {
                this.Br.setOnMapClickListener(null);
            } else {
                this.Br.setOnMapClickListener(new h.a() { // from class: com.google.android.gms.maps.GoogleMap.6
                    @Override // com.google.android.gms.maps.internal.h
                    public void onMapClick(LatLng point) {
                        listener.onMapClick(point);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public void setOnMapLoadedCallback(final OnMapLoadedCallback callback) {
        try {
            if (callback == null) {
                this.Br.setOnMapLoadedCallback(null);
            } else {
                this.Br.setOnMapLoadedCallback(new i.a() { // from class: com.google.android.gms.maps.GoogleMap.3
                    @Override // com.google.android.gms.maps.internal.i
                    public void onMapLoaded() throws RemoteException {
                        callback.onMapLoaded();
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnMapLongClickListener(final OnMapLongClickListener listener) {
        try {
            if (listener == null) {
                this.Br.setOnMapLongClickListener(null);
            } else {
                this.Br.setOnMapLongClickListener(new j.a() { // from class: com.google.android.gms.maps.GoogleMap.7
                    @Override // com.google.android.gms.maps.internal.j
                    public void onMapLongClick(LatLng point) {
                        listener.onMapLongClick(point);
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnMarkerClickListener(final OnMarkerClickListener listener) {
        try {
            if (listener == null) {
                this.Br.setOnMarkerClickListener(null);
            } else {
                this.Br.setOnMarkerClickListener(new k.a() { // from class: com.google.android.gms.maps.GoogleMap.8
                    @Override // com.google.android.gms.maps.internal.k
                    public boolean a(com.google.android.gms.maps.model.internal.d dVar) {
                        return listener.onMarkerClick(new Marker(dVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnMarkerDragListener(final OnMarkerDragListener listener) {
        try {
            if (listener == null) {
                this.Br.setOnMarkerDragListener(null);
            } else {
                this.Br.setOnMarkerDragListener(new l.a() { // from class: com.google.android.gms.maps.GoogleMap.9
                    @Override // com.google.android.gms.maps.internal.l
                    public void b(com.google.android.gms.maps.model.internal.d dVar) {
                        listener.onMarkerDragStart(new Marker(dVar));
                    }

                    @Override // com.google.android.gms.maps.internal.l
                    public void c(com.google.android.gms.maps.model.internal.d dVar) {
                        listener.onMarkerDragEnd(new Marker(dVar));
                    }

                    @Override // com.google.android.gms.maps.internal.l
                    public void d(com.google.android.gms.maps.model.internal.d dVar) {
                        listener.onMarkerDrag(new Marker(dVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setOnMyLocationButtonClickListener(final OnMyLocationButtonClickListener listener) {
        try {
            if (listener == null) {
                this.Br.setOnMyLocationButtonClickListener(null);
            } else {
                this.Br.setOnMyLocationButtonClickListener(new m.a() { // from class: com.google.android.gms.maps.GoogleMap.2
                    @Override // com.google.android.gms.maps.internal.m
                    public boolean onMyLocationButtonClick() throws RemoteException {
                        return listener.onMyLocationButtonClick();
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    @Deprecated
    public final void setOnMyLocationChangeListener(final OnMyLocationChangeListener listener) {
        try {
            if (listener == null) {
                this.Br.setOnMyLocationChangeListener(null);
            } else {
                this.Br.setOnMyLocationChangeListener(new n.a() { // from class: com.google.android.gms.maps.GoogleMap.12
                    @Override // com.google.android.gms.maps.internal.n
                    public void d(com.google.android.gms.dynamic.b bVar) {
                        listener.onMyLocationChange((Location) com.google.android.gms.dynamic.c.b(bVar));
                    }
                });
            }
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setPadding(int left, int top, int right, int bottom) {
        try {
            this.Br.setPadding(left, top, right, bottom);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void setTrafficEnabled(boolean enabled) {
        try {
            this.Br.setTrafficEnabled(enabled);
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void snapshot(SnapshotReadyCallback callback) {
        snapshot(callback, null);
    }

    public final void snapshot(final SnapshotReadyCallback callback, Bitmap bitmap) {
        try {
            this.Br.snapshot(new o.a() { // from class: com.google.android.gms.maps.GoogleMap.4
                @Override // com.google.android.gms.maps.internal.o
                public void c(com.google.android.gms.dynamic.b bVar) throws RemoteException {
                    callback.onSnapshotReady((Bitmap) com.google.android.gms.dynamic.c.b(bVar));
                }

                @Override // com.google.android.gms.maps.internal.o
                public void onSnapshotReady(Bitmap snapshot) throws RemoteException {
                    callback.onSnapshotReady(snapshot);
                }
            }, (com.google.android.gms.dynamic.c) (bitmap != null ? com.google.android.gms.dynamic.c.h(bitmap) : null));
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }

    public final void stopAnimation() {
        try {
            this.Br.stopAnimation();
        } catch (RemoteException e) {
            throw new RuntimeRemoteException(e);
        }
    }
}
