package com.tapjoy;

import android.os.Build;
import java.lang.reflect.Field;
/* loaded from: classes.dex */
public class TapjoyHardwareUtil {
    public String getSerial() {
        String serial = null;
        try {
            Class<?> clazz = Class.forName("android.os.Build");
            Field field = clazz.getDeclaredField("SERIAL");
            if (!field.isAccessible()) {
                field.setAccessible(true);
            }
            serial = field.get(Build.class).toString();
            TapjoyLog.i("TapjoyHardwareUtil", "serial: " + serial);
            return serial;
        } catch (Exception e) {
            TapjoyLog.e("TapjoyHardwareUtil", e.toString());
            return serial;
        }
    }
}
