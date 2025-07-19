package nativeJNI;

import android.content.Context;
import android.v4.view.MotionEventCompat;
import android.util.Log;
import android.view.MotionEvent;

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

    public void setRenderer(GLSurfaceViewProfile.Renderer renderer) {
        this.mRenderer = (ClearRenderer) renderer;
        super.setRenderer(renderer);
    }

    public boolean onTouchEvent(MotionEvent event) {
        int pointerNumber = event.getPointerCount();
        final int[] ids = new int[pointerNumber];
        float[] xs = new float[pointerNumber];
        float[] ys = new float[pointerNumber];
        for (int i = 0; i < pointerNumber; i++) {
            ids[i] = event.getPointerId(i);
            xs[i] = event.getX(i);
            ys[i] = event.getY(i);
        }
        switch (event.getAction() & MotionEventCompat.ACTION_MASK) {
            case 0:
                final int idDown = event.getPointerId(0);
                final float xDown = xs[0];
                final float f = ys[0];
                queueEvent(new Runnable() {
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionDown(idDown, xDown, f);
                    }
                });
                return true;
            case 1:
                final int idUp = event.getPointerId(0);
                final float f2 = xs[0];
                final float f3 = ys[0];
                queueEvent(new Runnable() {
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionUp(idUp, f2, f3);
                    }
                });
                return true;
            case 2:
                final float[] fArr = xs;
                final float[] fArr2 = ys;
                queueEvent(new Runnable() {
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionMove(ids, fArr, fArr2);
                    }
                });
                return true;
            case 3:
                final float[] fArr3 = xs;
                final float[] fArr4 = ys;
                queueEvent(new Runnable() {
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionCancel(ids, fArr3, fArr4);
                    }
                });
                return true;
            case 5:
                int indexPointerDown = event.getAction() >> 8;
                final int idPointerDown = event.getPointerId(indexPointerDown);
                final float xPointerDown = event.getX(indexPointerDown);
                final float y = event.getY(indexPointerDown);
                queueEvent(new Runnable() {
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionDown(idPointerDown, xPointerDown, y);
                    }
                });
                return true;
            case 6:
                int indexPointUp = event.getAction() >> 8;
                final int idPointerUp = event.getPointerId(indexPointUp);
                final float xPointerUp = event.getX(indexPointUp);
                final float y2 = event.getY(indexPointUp);
                queueEvent(new Runnable() {
                    public void run() {
                        ClearGLSurfaceView.this.mRenderer.handleActionUp(idPointerUp, xPointerUp, y2);
                    }
                });
                return true;
            default:
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

    public void onPause() {
        queueEvent(new Runnable() {
            public void run() {
                ClearGLSurfaceView.this.mRenderer.handleOnPause();
            }
        });
        super.onPause();
    }

    public void onResume() {
        queueEvent(new Runnable() {
            public void run() {
                ClearGLSurfaceView.this.mRenderer.handleOnResume();
            }
        });
        super.onResume();
    }
}
