package com.millennialmedia.android;

import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.ColorDrawable;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.net.Uri;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import com.facebook.widget.WebDialog;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.millennialmedia.android.MMAdViewSDK;
import com.millennialmedia.android.MMMedia;
import java.io.File;

public class AdViewOverlayActivity extends MMBaseActivity {
    private SensorEventListener accelerometerEventListener = new SensorEventListener() {
        private long currentTime = 0;
        private float force = BitmapDescriptorFactory.HUE_RED;
        private float lastX = BitmapDescriptorFactory.HUE_RED;
        private float lastY = BitmapDescriptorFactory.HUE_RED;
        private float lastZ = BitmapDescriptorFactory.HUE_RED;
        private long prevShakeTime = 0;
        private long prevTime = 0;
        private long timeDifference = 0;

        /* renamed from: x */
        private float f3953x = BitmapDescriptorFactory.HUE_RED;

        /* renamed from: y */
        private float f3954y = BitmapDescriptorFactory.HUE_RED;

        /* renamed from: z */
        private float f3955z = BitmapDescriptorFactory.HUE_RED;

        public void onSensorChanged(SensorEvent event) {
            this.currentTime = event.timestamp;
            this.f3953x = event.values[0];
            this.f3954y = event.values[1];
            this.f3955z = event.values[2];
            this.timeDifference = this.currentTime - this.prevTime;
            if (this.timeDifference > 500) {
                AdViewOverlayActivity.this.didAccelerate(this.f3953x, this.f3954y, this.f3955z);
                this.force = Math.abs(((((this.f3953x + this.f3954y) + this.f3955z) - this.lastX) - this.lastY) - this.lastZ) / ((float) this.timeDifference);
                AdViewOverlayActivity.this.didAccelerate(this.f3953x, this.f3954y, this.f3955z);
                if (this.force > 0.2f) {
                    if (this.currentTime - this.prevShakeTime >= 1000) {
                        AdViewOverlayActivity.this.didShake(this.force);
                    }
                    this.prevShakeTime = this.currentTime;
                }
                this.lastX = this.f3953x;
                this.lastY = this.f3954y;
                this.lastZ = this.f3955z;
                this.prevTime = this.currentTime;
            }
        }

        public void onAccuracyChanged(Sensor sensor, int accuracy) {
        }
    };
    private final int interval = 1000;
    private AdViewOverlayView mmOverlay;
    private SensorManager sensorManager;
    private OverlaySettings settings;
    private final float threshold = 0.2f;

    public /* bridge */ /* synthetic */ boolean dispatchTouchEvent(MotionEvent x0) {
        return super.dispatchTouchEvent(x0);
    }

    public /* bridge */ /* synthetic */ File getCacheDir() {
        return super.getCacheDir();
    }

    public /* bridge */ /* synthetic */ ContentResolver getContentResolver() {
        return super.getContentResolver();
    }

    public /* bridge */ /* synthetic */ Intent getIntent() {
        return super.getIntent();
    }

    public /* bridge */ /* synthetic */ Object getLastNonConfigurationInstance() {
        return super.getLastNonConfigurationInstance();
    }

    public /* bridge */ /* synthetic */ Object getSystemService(String x0) {
        return super.getSystemService(x0);
    }

    public /* bridge */ /* synthetic */ Window getWindow() {
        return super.getWindow();
    }

    public /* bridge */ /* synthetic */ Intent registerReceiver(BroadcastReceiver x0, IntentFilter x1) {
        return super.registerReceiver(x0, x1);
    }

    public /* bridge */ /* synthetic */ void setContentView(View x0) {
        super.setContentView(x0);
    }

    public /* bridge */ /* synthetic */ void setRequestedOrientation(int x0) {
        super.setRequestedOrientation(x0);
    }

    public /* bridge */ /* synthetic */ void setTheme(int x0) {
        super.setTheme(x0);
    }

    public /* bridge */ /* synthetic */ void startActivity(Intent x0) {
        super.startActivity(x0);
    }

    public /* bridge */ /* synthetic */ void startActivityForResult(Intent x0, int x1) {
        super.startActivityForResult(x0, x1);
    }

    public /* bridge */ /* synthetic */ void unregisterReceiver(BroadcastReceiver x0) {
        super.unregisterReceiver(x0);
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        Uri uri;
        setTheme(WebDialog.DEFAULT_THEME);
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        getWindow().setBackgroundDrawable(new ColorDrawable(0));
        getWindow().clearFlags(1024);
        getWindow().addFlags(2048);
        getWindow().addFlags(16777216);
        this.settings = (OverlaySettings) getIntent().getParcelableExtra("settings");
        if (this.settings == null) {
            this.settings = new OverlaySettings();
        }
        this.settings.log();
        if (this.settings.orientation != null && this.settings.orientation.equalsIgnoreCase(Constants.LANDSCAPE)) {
            setRequestedOrientation(0);
        } else if (this.settings.orientation == null || !this.settings.orientation.equalsIgnoreCase(Constants.PORTRAIT)) {
            setRequestedOrientation(2);
        } else {
            setRequestedOrientation(1);
        }
        Intent i = getIntent();
        if (!(i == null || (uri = i.getData()) == null)) {
            MMAdViewSDK.Log.m4429v("Path: %s", uri.getLastPathSegment());
        }
        this.mmOverlay = new AdViewOverlayView(this.activity, this.settings);
        setContentView(this.mmOverlay);
        if (getLastNonConfigurationInstance() == null) {
            this.mmOverlay.loadWebContent(getIntent().getDataString());
        }
        this.settings.state = "expanded";
    }

    public void finish() {
        MMAdViewSDK.Event.overlayClosed(this.activity);
        super.finish();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        MMAdViewSDK.Log.m4416d("Overlay onResume");
        if (this.settings.canAccelerate) {
            startAccelerating();
        }
        this.settings.state = "expanded";
        super.onResume();
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        MMAdViewSDK.Log.m4416d("Overlay onDestroy");
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        super.onStop();
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        MMAdViewSDK.Log.m4416d("Overlay onPause");
        if (this.settings.canAccelerate) {
            stopAccelerating();
        }
        MMMedia.Audio.sharedAudio(this.activity).stop();
        setResult(0);
        this.settings.state = "hidden";
        super.onPause();
    }

    public Object onRetainNonConfigurationInstance() {
        return this.mmOverlay.getNonConfigurationInstance();
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode != 4 || event.getRepeatCount() != 0) {
            return super.onKeyDown(keyCode, event);
        }
        if (this.mmOverlay.goBack()) {
            return true;
        }
        this.mmOverlay.dismiss(true);
        return true;
    }

    /* access modifiers changed from: private */
    public void didAccelerate(float x, float y, float z) {
        MMAdViewSDK.Log.m4429v("Accelerometer x:%fy:%fz:%f", Float.valueOf(x), Float.valueOf(y), Float.valueOf(z));
        this.mmOverlay.injectJS("javascript:didAccelerate(" + x + "," + y + "," + z + ")");
    }

    /* access modifiers changed from: private */
    public void didShake(float force) {
        MMAdViewSDK.Log.m4429v("Phone shaken: %f", Float.valueOf(force));
        this.mmOverlay.injectJS("javascript:didShake(" + force + ")");
    }

    private void startAccelerating() {
        this.sensorManager = (SensorManager) getSystemService("sensor");
        if (!Boolean.valueOf(this.sensorManager.registerListener(this.accelerometerEventListener, this.sensorManager.getDefaultSensor(1), 1)).booleanValue()) {
            MMAdViewSDK.Log.m4431w("Accelerometer not supported by this device. Unregistering listener.");
            this.sensorManager.unregisterListener(this.accelerometerEventListener, this.sensorManager.getDefaultSensor(1));
            this.accelerometerEventListener = null;
            this.sensorManager = null;
        }
    }

    private void stopAccelerating() {
        try {
            if (this.sensorManager != null && this.accelerometerEventListener != null) {
                this.sensorManager.unregisterListener(this.accelerometerEventListener, this.sensorManager.getDefaultSensor(1));
            }
        } catch (Exception e) {
        }
    }
}
