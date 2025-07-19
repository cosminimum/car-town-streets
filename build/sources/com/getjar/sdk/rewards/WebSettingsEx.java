package com.getjar.sdk.rewards;

import android.webkit.WebSettings;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import java.util.Locale;

public abstract class WebSettingsEx {
    /* access modifiers changed from: private */
    public static Class _ZoomDensityClass;

    static {
        _ZoomDensityClass = null;
        _ZoomDensityClass = null;
        for (Class cl : WebSettings.class.getDeclaredClasses()) {
            if ("ZoomDensity".equals(cl.getSimpleName())) {
                _ZoomDensityClass = cl;
                return;
            }
        }
    }

    public static void setDefaultZoom(WebSettings webSettings, Object value) {
        try {
            if (_ZoomDensityClass == null) {
                return;
            }
            if (value == null) {
                throw new IllegalArgumentException("'value' can not be NULL");
            } else if (!_ZoomDensityClass.isInstance(value)) {
                throw new IllegalArgumentException(String.format(Locale.US, "'value' must be an instance of %1$s", new Object[]{_ZoomDensityClass.getName()}));
            } else {
                webSettings.getClass().getMethod("setDefaultZoom", new Class[]{_ZoomDensityClass}).invoke(webSettings, new Object[]{value});
                Logger.m646v(Area.UI.value(), String.format(Locale.US, "WebSettings.setDefaultZoom(ZoomDensity.%1$s) successfully called", new Object[]{value}));
            }
        } catch (Exception e) {
            e.printStackTrace();
            Logger.m648w(Area.UI.value(), String.format(Locale.US, "Unable to call WebSettings.setDefaultZoom(ZoomDensity.%1$s)", new Object[]{value}));
        }
    }

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
                    for (Object obj : WebSettingsEx._ZoomDensityClass.getEnumConstants()) {
                        obj.getClass().getDeclaredField("value").setAccessible(true);
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
