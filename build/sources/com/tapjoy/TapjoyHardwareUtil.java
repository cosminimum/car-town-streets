package com.tapjoy;

import android.os.Build;
import java.lang.reflect.Field;

public class TapjoyHardwareUtil {
    public String getSerial() {
        try {
            Field field = Class.forName("android.os.Build").getDeclaredField("SERIAL");
            if (!field.isAccessible()) {
                field.setAccessible(true);
            }
            String serial = field.get(Build.class).toString();
            TapjoyLog.m4436i("TapjoyHardwareUtil", "serial: " + serial);
            return serial;
        } catch (Exception e) {
            TapjoyLog.m4435e("TapjoyHardwareUtil", e.toString());
            return null;
        }
    }
}
