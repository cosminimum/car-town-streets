package com.miniclip.nativeJNI;

import android.app.Activity;
import android.content.Context;
import android.opengl.GLES10;
import android.util.Log;
import com.miniclip.nativeJNI.GLSurfaceViewProfile;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

public class ClearRenderer implements GLSurfaceViewProfile.Renderer {
    private static final long NANOSECONDSPERMINISECOND = 1000000;
    private static final long NANOSECONDSPERSECOND = 1000000000;
    public static long animationInterval = 33333333;
    public static String mGLRenderer = "";
    public float TouchConvertionRatioX = 1.0f;
    public float TouchConvertionRatioY = 1.0f;
    private int curIntervalD = 0;
    private int firstHeight = 0;
    private int firstWidth = 0;
    private int frames = 0;
    public boolean hasStarted = false;
    public boolean hasSwitched = false;
    private long[] intervalsD = new long[100];
    private long last;
    Context mContext;
    private boolean mProfile = false;
    private long start = 0;

    public void setContext(Context c) {
        this.mContext = c;
    }

    public void onSurfaceCreated(GL10 gl, EGLConfig config) {
        this.last = System.nanoTime();
    }

    public void onSurfaceChanged(GL10 gl, int w, int h) {
        CocoJNI.MrestoreContext();
        Log.i("Dim", String.format("width: %d, height: %d", new Object[]{Integer.valueOf(w), Integer.valueOf(h)}));
        if (w != h) {
            if (cocojava.mINGAME_LANDSCAPE && h > w) {
                int temp = w;
                w = h;
                h = temp;
            }
            Log.i("After Hack Dim", String.format("width: %d, height: %d", new Object[]{Integer.valueOf(w), Integer.valueOf(h)}));
            if (cocojava.mHAS_RETINA && cocojava.mWidth > 799 && cocojava.getNumCores() > 1 && cocojava.getTotalRAM() > 512000000) {
                CocoJNI.MsetIsRetina(1);
            }
            if (cocojava.mUSE_ADS_VERTICAL) {
                if (this.firstWidth == 0 || this.firstHeight == 0) {
                    this.firstWidth = w;
                    this.firstHeight = h;
                }
                int h2 = this.firstHeight;
                GLES10.glViewport(0, 0, w, h);
                CocoJNI.MrealDisplayInfo(w, h);
                CocoJNI.MdisplayInfo(this.firstWidth - ((int) (cocojava.mDensity * 50.0f)), h2);
            } else if (cocojava.mUSE_ADS_HORIZONTAL) {
                if (this.firstWidth == 0 || this.firstHeight == 0) {
                    this.firstWidth = w;
                    this.firstHeight = h;
                }
                GLES10.glViewport(0, 0, w, h);
                CocoJNI.MrealDisplayInfo(w, h);
                CocoJNI.MdisplayInfo(this.firstWidth, this.firstHeight - ((int) (cocojava.mDensity * 50.0f)));
            } else if (cocojava.mMinimumResolutionSD) {
                CocoJNI.MrealDisplayInfo(w, h);
                CocoJNI.MdisplayInfo(cocojava.mWidth, cocojava.mHeight);
            } else {
                CocoJNI.MrealDisplayInfo(w, h);
                CocoJNI.MdisplayInfo(w, h);
            }
        }
    }

    public void onDrawFrame(GL10 gl) {
        cocojava cocojava = (cocojava) this.mContext;
        if (cocojava.mENOUGH_MEMORY) {
            if (!this.hasStarted) {
                if (this.frames > 40 && cocojava.mHasSecondIntro) {
                    ((Activity) this.mContext).runOnUiThread(new Runnable() {
                        public void run() {
                            cocojava.displayIntro("default2");
                        }
                    });
                }
                if (this.frames > 40) {
                    mGLRenderer = GLES10.glGetString(7937);
                    ((cocojava) this.mContext).createResources();
                    Log.i("GL_RENDERER", mGLRenderer);
                    Log.i("JAVAINFO", "assets unpacked");
                    Log.i("JAVAINFO", this.mContext.getPackageName());
                    CocoJNI.Mrun();
                    this.hasStarted = true;
                    ((Activity) this.mContext).runOnUiThread(new Runnable() {
                        public void run() {
                            ((cocojava) ClearRenderer.this.mContext).onRealResume();
                        }
                    });
                } else {
                    this.frames++;
                    return;
                }
            }
            if (!this.hasSwitched) {
                if (this.frames > 80) {
                    cocojava.setContentToGl();
                    this.hasSwitched = true;
                } else {
                    this.frames++;
                }
            }
            long now = System.nanoTime();
            long interval = now - this.last;
            if (this.mProfile) {
                this.start = System.nanoTime();
            }
            CocoJNI.Mrender();
            if (this.mProfile) {
                this.intervalsD[this.curIntervalD] = System.nanoTime() - this.start;
                this.curIntervalD++;
                this.curIntervalD %= 100;
                if (this.curIntervalD == 0) {
                    long avgInterval = 0;
                    for (int i = 0; i < 100; i++) {
                        avgInterval += this.intervalsD[i];
                    }
                    Log.i("GLView", String.format("average draw interval: %d", new Object[]{Long.valueOf((avgInterval / 100) / 1000)}));
                    Log.i("GLView", String.format("last draw interval: %d", new Object[]{Long.valueOf(this.intervalsD[0] / 1000)}));
                }
            }
            if (interval < animationInterval) {
                try {
                    Thread.sleep(((animationInterval - interval) * 2) / NANOSECONDSPERMINISECOND);
                } catch (Exception e) {
                }
            }
            this.last = now;
        }
    }

    public void handleActionDown(int id, float x, float y) {
        CocoJNI.MtouchesBegin(id, this.TouchConvertionRatioX * x, this.TouchConvertionRatioY * y);
    }

    public void handleActionUp(int id, float x, float y) {
        CocoJNI.MtouchesEnd(id, this.TouchConvertionRatioX * x, this.TouchConvertionRatioY * y);
    }

    public void handleActionCancel(int[] id, float[] x, float[] y) {
        for (int i = 0; i < x.length; i++) {
            x[i] = x[i] * this.TouchConvertionRatioX;
            y[i] = y[i] * this.TouchConvertionRatioY;
        }
        CocoJNI.MtouchesCancel(id, x, y);
    }

    public void handleActionMove(int[] id, float[] x, float[] y) {
        for (int i = 0; i < x.length; i++) {
            x[i] = x[i] * this.TouchConvertionRatioX;
            y[i] = y[i] * this.TouchConvertionRatioY;
        }
        CocoJNI.MtouchesMove(id, x, y);
    }

    public void handleOnPause() {
        CocoJNI.Mpause();
    }

    public void handleOnResume() {
        CocoJNI.Mresume();
    }
}
