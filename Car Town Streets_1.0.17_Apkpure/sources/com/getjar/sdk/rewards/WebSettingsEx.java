package com.getjar.sdk.rewards;

import android.webkit.WebSettings;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Locale;
/* loaded from: classes.dex */
public abstract class WebSettingsEx {
    private static Class _ZoomDensityClass;

    static {
        _ZoomDensityClass = null;
        _ZoomDensityClass = null;
        Class[] classes = WebSettings.class.getDeclaredClasses();
        for (Class cl : classes) {
            if ("ZoomDensity".equals(cl.getSimpleName())) {
                _ZoomDensityClass = cl;
                return;
            }
        }
    }

    public static void setDefaultZoom(WebSettings webSettings, Object value) {
        try {
            if (_ZoomDensityClass != null) {
                if (value == null) {
                    throw new IllegalArgumentException("'value' can not be NULL");
                }
                if (!_ZoomDensityClass.isInstance(value)) {
                    throw new IllegalArgumentException(String.format(Locale.US, "'value' must be an instance of %1$s", _ZoomDensityClass.getName()));
                }
                Method method = webSettings.getClass().getMethod("setDefaultZoom", _ZoomDensityClass);
                method.invoke(webSettings, value);
                Logger.v(Area.UI.value(), String.format(Locale.US, "WebSettings.setDefaultZoom(ZoomDensity.%1$s) successfully called", value));
            }
        } catch (Exception e) {
            e.printStackTrace();
            Logger.w(Area.UI.value(), String.format(Locale.US, "Unable to call WebSettings.setDefaultZoom(ZoomDensity.%1$s)", value));
        }
    }

    /* loaded from: classes.dex */
    public static class ZoomDensity {
        public static Object CLOSE;
        public static Object FAR;
        public static Object MEDIUM;

        static {
            FAR = null;
            MEDIUM = null;
            CLOSE = null;
            try {
                if (WebSettingsEx._ZoomDensityClass != null) {
                    Object[] arr$ = WebSettingsEx._ZoomDensityClass.getEnumConstants();
                    for (Object obj : arr$) {
                        Field field = obj.getClass().getDeclaredField("value");
                        field.setAccessible(true);
                        if ("FAR".equals(obj.toString())) {
                            FAR = obj;
                        } else if ("MEDIUM".equals(obj.toString())) {
                            MEDIUM = obj;
                        } else if ("CLOSE".equals(obj.toString())) {
                            CLOSE = obj;
                        }
                    }
                }
            } catch (Throwable e) {
                e.printStackTrace();
            }
        }
    }
}
