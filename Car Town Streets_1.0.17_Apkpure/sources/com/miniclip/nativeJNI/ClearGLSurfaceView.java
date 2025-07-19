package com.miniclip.nativeJNI;

import android.content.Context;
import android.support.v4.view.MotionEventCompat;
import android.util.Log;
import android.view.MotionEvent;
import com.miniclip.nativeJNI.GLSurfaceViewProfile;
/* loaded from: classes.dex */
public class ClearGLSurfaceView extends GLSurfaceViewProfile {
    Context mContext;
    ClearRenderer mRenderer;

    public ClearGLSurfaceView(Context context) {
        super(context);
        this.mContext = context;
        if (cocojava.mUSE_PRESERVE_CONTEXT && cocojava.mHAS_RETINA && cocojava.mWidth > 799) {
            setPreserveEGLContextOnPause(true);
            CocoJNI.MpreserveContext(1);
        }
    }

    @Override // com.miniclip.nativeJNI.GLSurfaceViewProfile
    public void setRenderer(GLSurfaceViewProfile.Renderer renderer) {
        this.mRenderer = (ClearRenderer) renderer;
        super.setRenderer(renderer);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        int pointerNumber = event.getPointerCount();
        final int[] ids = new int[pointerNumber];
        final float[] xs = new float[pointerNumber];
        final float[] ys = new float[pointerNumber];
        for (int i = 0; i < pointerNumber; i++) {
            ids[i] = event.getPointerId(i);
            xs[i] = event.getX(i);
            ys[i] = event.getY(i);
        }
        switch (event.getAction() & MotionEventCompat.ACTION_MASK) {
            case 0:
                final int idDown = event.getPointerId(0);
                final float xDown = xs[0];
                final float yDown = ys[0];
                queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.ClearGLSurfaceView.2
                    @Override // java.lang.Runnable
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionDown(idDown, xDown, yDown);
                    }
                });
                return true;
            case 1:
                final int idUp = event.getPointerId(0);
                final float xUp = xs[0];
                final float yUp = ys[0];
                queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.ClearGLSurfaceView.5
                    @Override // java.lang.Runnable
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionUp(idUp, xUp, yUp);
                    }
                });
                return true;
            case 2:
                queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.ClearGLSurfaceView.3
                    @Override // java.lang.Runnable
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionMove(ids, xs, ys);
                    }
                });
                return true;
            case 3:
                queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.ClearGLSurfaceView.6
                    @Override // java.lang.Runnable
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionCancel(ids, xs, ys);
                    }
                });
                return true;
            case 4:
            default:
                return true;
            case 5:
                int indexPointerDown = event.getAction() >> 8;
                final int idPointerDown = event.getPointerId(indexPointerDown);
                final float xPointerDown = event.getX(indexPointerDown);
                final float yPointerDown = event.getY(indexPointerDown);
                queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.ClearGLSurfaceView.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionDown(idPointerDown, xPointerDown, yPointerDown);
                    }
                });
                return true;
            case 6:
                int indexPointUp = event.getAction() >> 8;
                final int idPointerUp = event.getPointerId(indexPointUp);
                final float xPointerUp = event.getX(indexPointUp);
                final float yPointerUp = event.getY(indexPointUp);
                queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.ClearGLSurfaceView.4
                    @Override // java.lang.Runnable
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionUp(idPointerUp, xPointerUp, yPointerUp);
                    }
                });
                return true;
        }
    }

    private void dumpEvent(MotionEvent event) {
        String[] names = {"DOWN", "UP", "MOVE", "CANCEL", "OUTSIDE", "POINTER_DOWN", "POINTER_UP", "7?", "8?", "9?"};
        StringBuilder sb = new StringBuilder();
        int action = event.getAction();
        int actionCode = action & MotionEventCompat.ACTION_MASK;
        if (actionCode != 2) {
            sb.append("event ACTION_").append(names[actionCode]);
            if (actionCode == 5 || actionCode == 6) {
                sb.append("(pid ").append(action >> 8);
                sb.append(")");
            }
            sb.append("[");
            for (int i = 0; i < event.getPointerCount(); i++) {
                sb.append("#").append(i);
                sb.append("(pid ").append(event.getPointerId(i));
                sb.append(")=").append((int) event.getX(i));
                sb.append(",").append((int) event.getY(i));
                if (i + 1 < event.getPointerCount()) {
                    sb.append(";");
                }
            }
            sb.append("]");
            Log.i("ClearGLSurefaceView", sb.toString());
        }
    }

    @Override // com.miniclip.nativeJNI.GLSurfaceViewProfile
    public void onPause() {
        queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.ClearGLSurfaceView.7
            @Override // java.lang.Runnable
            public void run() {
                ClearGLSurfaceView.this.mRenderer.handleOnPause();
            }
        });
        super.onPause();
    }

    @Override // com.miniclip.nativeJNI.GLSurfaceViewProfile
    public void onResume() {
        queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.ClearGLSurfaceView.8
            @Override // java.lang.Runnable
            public void run() {
                ClearGLSurfaceView.this.mRenderer.handleOnResume();
            }
        });
        super.onResume();
    }
}
