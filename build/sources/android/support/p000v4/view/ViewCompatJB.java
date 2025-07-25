package android.support.p000v4.view;

import android.view.View;

/* renamed from: android.support.v4.view.ViewCompatJB */
public class ViewCompatJB {
    public static boolean hasTransientState(View view) {
        return view.hasTransientState();
    }

    public static void setHasTransientState(View view, boolean hasTransientState) {
        view.setHasTransientState(hasTransientState);
    }

    public static void postInvalidateOnAnimation(View view) {
        view.postInvalidateOnAnimation();
    }

    public static void postInvalidateOnAnimation(View view, int left, int top, int right, int bottom) {
        view.postInvalidate(left, top, right, bottom);
    }

    public static void postOnAnimation(View view, Runnable action) {
        view.postOnAnimation(action);
    }

    public static void postOnAnimationDelayed(View view, Runnable action, long delayMillis) {
        view.postOnAnimationDelayed(action, delayMillis);
    }

    public static int getImportantForAccessibility(View view) {
        return view.getImportantForAccessibility();
    }

    public static void setImportantForAccessibility(View view, int mode) {
        view.setImportantForAccessibility(mode);
    }

    public static Object getAccessibilityNodeProvider(View view) {
        return view.getAccessibilityNodeProvider();
    }
}
