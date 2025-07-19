package com.miniclip.nativeJNI;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.view.WindowManager;

public class cocoaccel implements SensorEventListener {
    private Sensor mAccelerometer;
    private Context mContext;
    private int mRotation = 0;
    private SensorManager mSensorManager;
    int t = 0;

    private static native void onSensorChanged(float f, float f2, float f3, long j);

    public cocoaccel(Context context) {
        this.mContext = context;
        this.mRotation = 1;
        this.mSensorManager = (SensorManager) this.mContext.getSystemService("sensor");
        this.mAccelerometer = this.mSensorManager.getDefaultSensor(1);
        try {
            this.mRotation = ((WindowManager) this.mContext.getSystemService("window")).getDefaultDisplay().getRotation();
        } catch (NoSuchMethodError e) {
            e.printStackTrace();
        }
    }

    public void enable() {
        this.mSensorManager.registerListener(this, this.mAccelerometer, 1);
    }

    public void disable() {
        this.mSensorManager.unregisterListener(this);
    }

    public void onSensorChanged(SensorEvent event) {
        if (event.sensor.getType() == 1) {
            if (this.mRotation == 0) {
                CocoJNI.Maccel(-event.values[0], event.values[1], event.values[2], event.timestamp);
            } else if (this.mRotation == 2) {
                CocoJNI.Maccel(event.values[0], -event.values[1], event.values[2], event.timestamp);
            } else if (this.mRotation == 1) {
                CocoJNI.Maccel(event.values[1], event.values[0], event.values[2], event.timestamp);
            } else if (this.mRotation == 3) {
                CocoJNI.Maccel(-event.values[1], -event.values[0], event.values[2], event.timestamp);
            }
        }
    }

    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    }
}
