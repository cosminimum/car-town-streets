package nativeJNI;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

import java.io.Writer;
import java.util.ArrayList;

import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL;
import javax.microedition.khronos.opengles.GL10;

public class GLSurfaceViewProfile extends SurfaceView implements SurfaceHolder.Callback {
    public static final int DEBUG_CHECK_GL_ERROR = 1;
    public static final int DEBUG_LOG_GL_CALLS = 2;
    private static final boolean DRAW_TWICE_AFTER_SIZE_CHANGED = true;
    private static final boolean LOG_EGL = false;
    private static final boolean LOG_PAUSE_RESUME = false;
    private static final boolean LOG_RENDERER = false;
    private static final boolean LOG_RENDERER_DRAW_FRAME = false;
    private static final boolean LOG_SURFACE = false;
    private static final boolean LOG_THREADS = false;
    public static final int RENDERMODE_CONTINUOUSLY = 1;
    public static final int RENDERMODE_WHEN_DIRTY = 0;
    /* access modifiers changed from: private */
    public static final GLThreadManager sGLThreadManager = new GLThreadManager();
    private int mDebugFlags;
    /* access modifiers changed from: private */
    public EGLConfigChooser mEGLConfigChooser;
    /* access modifiers changed from: private */
    public int mEGLContextClientVersion;
    /* access modifiers changed from: private */
    public EGLContextFactory mEGLContextFactory;
    /* access modifiers changed from: private */
    public EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
    /* access modifiers changed from: private */
    public GLThread mGLThread;
    /* access modifiers changed from: private */
    public GLWrapper mGLWrapper;
    /* access modifiers changed from: private */
    public boolean mPreserveEGLContextOnPause;
    /* access modifiers changed from: private */
    public boolean mSizeChanged = true;

    public interface EGLConfigChooser {
        EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay);
    }

    public interface EGLContextFactory {
        EGLContext createContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig);

        void destroyContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLContext eGLContext);
    }

    public interface EGLWindowSurfaceFactory {
        EGLSurface createWindowSurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, Object obj);

        void destroySurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLSurface eGLSurface);
    }

    public interface GLWrapper {
        GL wrap(GL gl);
    }

    public interface Renderer {
        void onDrawFrame(GL10 gl10);

        void onSurfaceChanged(GL10 gl10, int i, int i2);

        void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig);
    }

    public GLSurfaceViewProfile(Context context) {
        super(context);
        init();
    }

    public GLSurfaceViewProfile(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    private void init() {
        getHolder().addCallback(this);
    }

    public void setGLWrapper(GLWrapper glWrapper) {
        this.mGLWrapper = glWrapper;
    }

    public void setDebugFlags(int debugFlags) {
        this.mDebugFlags = debugFlags;
    }

    public int getDebugFlags() {
        return this.mDebugFlags;
    }

    public void setPreserveEGLContextOnPause(boolean preserveOnPause) {
        this.mPreserveEGLContextOnPause = preserveOnPause;
    }

    public boolean getPreserveEGLContextOnPause() {
        return this.mPreserveEGLContextOnPause;
    }

    public void setRenderer(Renderer renderer) {
        checkRenderThreadState();
        if (this.mEGLConfigChooser == null) {
            this.mEGLConfigChooser = new SimpleEGLConfigChooser(true);
        }
        if (this.mEGLContextFactory == null) {
            this.mEGLContextFactory = new DefaultContextFactory();
        }
        if (this.mEGLWindowSurfaceFactory == null) {
            this.mEGLWindowSurfaceFactory = new DefaultWindowSurfaceFactory();
        }
        this.mGLThread = new GLThread(renderer);
        this.mGLThread.start();
    }

    public void setEGLContextFactory(EGLContextFactory factory) {
        checkRenderThreadState();
        this.mEGLContextFactory = factory;
    }

    public void setEGLWindowSurfaceFactory(EGLWindowSurfaceFactory factory) {
        checkRenderThreadState();
        this.mEGLWindowSurfaceFactory = factory;
    }

    public void setEGLConfigChooser(EGLConfigChooser configChooser) {
        checkRenderThreadState();
        this.mEGLConfigChooser = configChooser;
    }

    public void setEGLConfigChooser(boolean needDepth) {
        setEGLConfigChooser((EGLConfigChooser) new SimpleEGLConfigChooser(needDepth));
    }

    public void setEGLConfigChooser(int redSize, int greenSize, int blueSize, int alphaSize, int depthSize, int stencilSize) {
        setEGLConfigChooser((EGLConfigChooser) new ComponentSizeChooser(redSize, greenSize, blueSize, alphaSize, depthSize, stencilSize));
    }

    public void setEGLContextClientVersion(int version) {
        checkRenderThreadState();
        this.mEGLContextClientVersion = version;
    }

    public void setRenderMode(int renderMode) {
        this.mGLThread.setRenderMode(renderMode);
    }

    public int getRenderMode() {
        return this.mGLThread.getRenderMode();
    }

    public void requestRender() {
        this.mGLThread.requestRender();
    }

    public void surfaceCreated(SurfaceHolder holder) {
        this.mGLThread.surfaceCreated();
    }

    public void surfaceDestroyed(SurfaceHolder holder) {
        this.mGLThread.surfaceDestroyed();
    }

    public void surfaceChanged(SurfaceHolder holder, int format, int w, int h) {
        this.mGLThread.onWindowResize(w, h);
    }

    public void onPause() {
        this.mGLThread.onPause();
    }

    public void onResume() {
        this.mGLThread.onResume();
    }

    public void queueEvent(Runnable r) {
        this.mGLThread.queueEvent(r);
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mGLThread.requestExitAndWait();
    }

    private class DefaultContextFactory implements EGLContextFactory {
        private int EGL_CONTEXT_CLIENT_VERSION;

        private DefaultContextFactory() {
            this.EGL_CONTEXT_CLIENT_VERSION = 12440;
        }

        public EGLContext createContext(EGL10 egl, EGLDisplay display, EGLConfig config) {
            int[] attrib_list = {this.EGL_CONTEXT_CLIENT_VERSION, GLSurfaceViewProfile.this.mEGLContextClientVersion, 12344};
            EGLContext eGLContext = EGL10.EGL_NO_CONTEXT;
            if (GLSurfaceViewProfile.this.mEGLContextClientVersion == 0) {
                attrib_list = null;
            }
            return egl.eglCreateContext(display, config, eGLContext, attrib_list);
        }

        public void destroyContext(EGL10 egl, EGLDisplay display, EGLContext context) {
            if (!egl.eglDestroyContext(display, context)) {
                Log.e("DefaultContextFactory", "display:" + display + " context: " + context);
                throw new RuntimeException("eglDestroyContext failed: ");
            }
        }
    }

    private static class DefaultWindowSurfaceFactory implements EGLWindowSurfaceFactory {
        private DefaultWindowSurfaceFactory() {
        }

        public EGLSurface createWindowSurface(EGL10 egl, EGLDisplay display, EGLConfig config, Object nativeWindow) {
            return egl.eglCreateWindowSurface(display, config, nativeWindow, (int[]) null);
        }

        public void destroySurface(EGL10 egl, EGLDisplay display, EGLSurface surface) {
            egl.eglDestroySurface(display, surface);
        }
    }

    private abstract class BaseConfigChooser implements EGLConfigChooser {
        protected int[] mConfigSpec;

        /* access modifiers changed from: package-private */
        public abstract EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr);

        public BaseConfigChooser(int[] configSpec) {
            this.mConfigSpec = filterConfigSpec(configSpec);
        }

        public EGLConfig chooseConfig(EGL10 egl, EGLDisplay display) {
            int[] num_config = new int[1];
            if (!egl.eglChooseConfig(display, this.mConfigSpec, (EGLConfig[]) null, 0, num_config)) {
                throw new IllegalArgumentException("eglChooseConfig failed");
            }
            int numConfigs = num_config[0];
            if (numConfigs <= 0) {
                throw new IllegalArgumentException("No configs match configSpec");
            }
            EGLConfig[] configs = new EGLConfig[numConfigs];
            if (!egl.eglChooseConfig(display, this.mConfigSpec, configs, numConfigs, num_config)) {
                throw new IllegalArgumentException("eglChooseConfig#2 failed");
            }
            EGLConfig config = chooseConfig(egl, display, configs);
            if (config != null) {
                return config;
            }
            throw new IllegalArgumentException("No config chosen");
        }

        private int[] filterConfigSpec(int[] configSpec) {
            if (GLSurfaceViewProfile.this.mEGLContextClientVersion != 2) {
                return configSpec;
            }
            int len = configSpec.length;
            int[] newConfigSpec = new int[(len + 2)];
            System.arraycopy(configSpec, 0, newConfigSpec, 0, len - 1);
            newConfigSpec[len - 1] = 12352;
            newConfigSpec[len] = 4;
            newConfigSpec[len + 1] = 12344;
            return newConfigSpec;
        }
    }

    private class ComponentSizeChooser extends BaseConfigChooser {
        protected int mAlphaSize;
        protected int mBlueSize;
        protected int mDepthSize;
        protected int mGreenSize;
        protected int mRedSize;
        protected int mStencilSize;
        private int[] mValue = new int[1];

        public ComponentSizeChooser(int redSize, int greenSize, int blueSize, int alphaSize, int depthSize, int stencilSize) {
            super(new int[]{12324, redSize, 12323, greenSize, 12322, blueSize, 12321, alphaSize, 12325, depthSize, 12326, stencilSize, 12344});
            this.mRedSize = redSize;
            this.mGreenSize = greenSize;
            this.mBlueSize = blueSize;
            this.mAlphaSize = alphaSize;
            this.mDepthSize = depthSize;
            this.mStencilSize = stencilSize;
        }

        public EGLConfig chooseConfig(EGL10 egl, EGLDisplay display, EGLConfig[] configs) {
            for (EGLConfig config : configs) {
                int d = findConfigAttrib(egl, display, config, 12325, 0);
                int s = findConfigAttrib(egl, display, config, 12326, 0);
                if (d >= this.mDepthSize && s >= this.mStencilSize) {
                    int r = findConfigAttrib(egl, display, config, 12324, 0);
                    int g = findConfigAttrib(egl, display, config, 12323, 0);
                    int b = findConfigAttrib(egl, display, config, 12322, 0);
                    int a = findConfigAttrib(egl, display, config, 12321, 0);
                    if (r == this.mRedSize && g == this.mGreenSize && b == this.mBlueSize && a == this.mAlphaSize) {
                        return config;
                    }
                }
            }
            return null;
        }

        private int findConfigAttrib(EGL10 egl, EGLDisplay display, EGLConfig config, int attribute, int defaultValue) {
            if (egl.eglGetConfigAttrib(display, config, attribute, this.mValue)) {
                return this.mValue[0];
            }
            return defaultValue;
        }
    }

    private class SimpleEGLConfigChooser extends ComponentSizeChooser {
        /* JADX WARNING: Illegal instructions before constructor call */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public SimpleEGLConfigChooser(boolean r10) {
            /*
                r8 = this;
                r2 = 5
                r5 = 0
                com.miniclip.nativeJNI.GLSurfaceViewProfile.this = r9
                r3 = 6
                if (r10 == 0) goto L_0x0011
                r6 = 16
            L_0x0009:
                r0 = r8
                r1 = r9
                r4 = r2
                r7 = r5
                r0.<init>(r2, r3, r4, r5, r6, r7)
                return
            L_0x0011:
                r6 = r5
                goto L_0x0009
            */
            throw new UnsupportedOperationException("Method not decompiled: com.miniclip.nativeJNI.GLSurfaceViewProfile.SimpleEGLConfigChooser.<init>(com.miniclip.nativeJNI.GLSurfaceViewProfile, boolean):void");
        }
    }

    private class EglHelper {
        EGL10 mEgl;
        EGLConfig mEglConfig;
        EGLContext mEglContext;
        EGLDisplay mEglDisplay;
        EGLSurface mEglSurface;

        public EglHelper() {
        }

        public void start() {
            this.mEgl = (EGL10) EGLContext.getEGL();
            this.mEglDisplay = this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            if (this.mEglDisplay == EGL10.EGL_NO_DISPLAY) {
                throw new RuntimeException("eglGetDisplay failed");
            }
            if (!this.mEgl.eglInitialize(this.mEglDisplay, new int[2])) {
                throw new RuntimeException("eglInitialize failed");
            }
            this.mEglConfig = GLSurfaceViewProfile.this.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
            this.mEglContext = GLSurfaceViewProfile.this.mEGLContextFactory.createContext(this.mEgl, this.mEglDisplay, this.mEglConfig);
            if (this.mEglContext == null || this.mEglContext == EGL10.EGL_NO_CONTEXT) {
                this.mEglContext = null;
                throwEglException("createContext");
            }
            this.mEglSurface = null;
        }

        public GL createSurface(SurfaceHolder holder) {
            if (this.mEgl == null) {
                throw new RuntimeException("egl not initialized");
            } else if (this.mEglDisplay == null) {
                throw new RuntimeException("eglDisplay not initialized");
            } else if (this.mEglConfig == null) {
                throw new RuntimeException("mEglConfig not initialized");
            } else {
                if (!(this.mEglSurface == null || this.mEglSurface == EGL10.EGL_NO_SURFACE)) {
                    this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                    GLSurfaceViewProfile.this.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface);
                }
                this.mEglSurface = GLSurfaceViewProfile.this.mEGLWindowSurfaceFactory.createWindowSurface(this.mEgl, this.mEglDisplay, this.mEglConfig, holder);
                if (this.mEglSurface == null || this.mEglSurface == EGL10.EGL_NO_SURFACE) {
                    int error = this.mEgl.eglGetError();
                    if (error == 12299) {
                        Log.e("EglHelper", "createWindowSurface returned EGL_BAD_NATIVE_WINDOW.");
                        return null;
                    }
                    throwEglException("createWindowSurface", error);
                }
                if (!this.mEgl.eglMakeCurrent(this.mEglDisplay, this.mEglSurface, this.mEglSurface, this.mEglContext)) {
                    throwEglException("eglMakeCurrent");
                }
                GL gl = this.mEglContext.getGL();
                if (GLSurfaceViewProfile.this.mGLWrapper != null) {
                    return GLSurfaceViewProfile.this.mGLWrapper.wrap(gl);
                }
                return gl;
            }
        }

        public boolean swap() {
            if (!this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface)) {
                int error = this.mEgl.eglGetError();
                switch (error) {
                    case 12299:
                        Log.e("EglHelper", "eglSwapBuffers returned EGL_BAD_NATIVE_WINDOW. tid=" + Thread.currentThread().getId());
                        break;
                    case 12302:
                        return false;
                    default:
                        throwEglException("eglSwapBuffers", error);
                        break;
                }
            }
            return true;
        }

        public void destroySurface() {
            if (this.mEglSurface != null && this.mEglSurface != EGL10.EGL_NO_SURFACE) {
                this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                GLSurfaceViewProfile.this.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface);
                this.mEglSurface = null;
            }
        }

        public void finish() {
            if (this.mEglContext != null) {
                GLSurfaceViewProfile.this.mEGLContextFactory.destroyContext(this.mEgl, this.mEglDisplay, this.mEglContext);
                this.mEglContext = null;
            }
            if (this.mEglDisplay != null) {
                this.mEgl.eglTerminate(this.mEglDisplay);
                this.mEglDisplay = null;
            }
        }

        private void throwEglException(String function) {
            throwEglException(function, this.mEgl.eglGetError());
        }

        private void throwEglException(String function, int error) {
            throw new RuntimeException(function + " failed: ");
        }
    }

    class GLThread extends Thread {
        private EglHelper mEglHelper;
        private ArrayList<Runnable> mEventQueue = new ArrayList<>();
        /* access modifiers changed from: private */
        public boolean mExited;
        private boolean mHasSurface;
        private boolean mHaveEglContext;
        private boolean mHaveEglSurface;
        private int mHeight = 0;
        private boolean mPaused;
        private boolean mRenderComplete;
        private int mRenderMode = 1;
        private Renderer mRenderer;
        private boolean mRequestPaused;
        private boolean mRequestRender = true;
        private boolean mShouldExit;
        private boolean mShouldReleaseEglContext;
        private boolean mWaitingForSurface;
        private int mWidth = 0;

        GLThread(Renderer renderer) {
            this.mRenderer = renderer;
        }

        public void run() {
            setName("GLThread " + getId());
            try {
                guardedRun();
            } catch (InterruptedException e) {
            } finally {
                GLSurfaceViewProfile.sGLThreadManager.threadExiting(this);
            }
        }

        private void stopEglSurfaceLocked() {
            if (this.mHaveEglSurface) {
                this.mHaveEglSurface = false;
                this.mEglHelper.destroySurface();
            }
        }

        private void stopEglContextLocked() {
            if (this.mHaveEglContext) {
                this.mEglHelper.finish();
                this.mHaveEglContext = false;
                GLSurfaceViewProfile.sGLThreadManager.releaseEglContextLocked(this);
            }
        }

        /* JADX WARNING: type inference failed for: r13v59, types: [javax.microedition.khronos.opengles.GL] */
        /* JADX WARNING: Code restructure failed: missing block: B:106:0x01a9, code lost:
            if (r3 == false) goto L_0x01da;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:109:?, code lost:
            r6 = r16.mEglHelper.createSurface(r16.this$0.getHolder());
         */
        /* JADX WARNING: Code restructure failed: missing block: B:110:0x01bf, code lost:
            if (r6 != null) goto L_0x01d2;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:111:0x01c1, code lost:
            r14 = com.miniclip.nativeJNI.GLSurfaceViewProfile.access$700();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:112:0x01c5, code lost:
            monitor-enter(r14);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:114:?, code lost:
            stopEglSurfaceLocked();
            stopEglContextLocked();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:115:0x01cc, code lost:
            monitor-exit(r14);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:121:?, code lost:
            com.miniclip.nativeJNI.GLSurfaceViewProfile.access$700().checkGLDriver(r6);
            r3 = false;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:122:0x01da, code lost:
            if (r2 == false) goto L_0x01ea;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:123:0x01dc, code lost:
            r16.mRenderer.onSurfaceCreated(r6, r16.mEglHelper.mEglConfig);
            r2 = false;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:124:0x01ea, code lost:
            if (r9 == false) goto L_0x01f4;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:125:0x01ec, code lost:
            r16.mRenderer.onSurfaceChanged(r6, r11, r7);
            r9 = false;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:126:0x01f4, code lost:
            r16.mRenderer.onDrawFrame(r6);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:127:0x0203, code lost:
            if (r16.mEglHelper.swap() != false) goto L_0x0206;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:128:0x0205, code lost:
            r8 = true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:129:0x0206, code lost:
            if (r12 == false) goto L_0x0021;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:130:0x0208, code lost:
            r4 = true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:149:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:23:0x0055, code lost:
            if (r5 == null) goto L_0x01a9;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:25:?, code lost:
            r5.run();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:26:0x005a, code lost:
            r5 = null;
         */
        /* JADX WARNING: Multi-variable type inference failed */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        private void guardedRun() throws InterruptedException {
            /*
                r16 = this;
                r15 = 0
                com.miniclip.nativeJNI.GLSurfaceViewProfile$EglHelper r13 = new com.miniclip.nativeJNI.GLSurfaceViewProfile$EglHelper
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile r14 = com.miniclip.nativeJNI.GLSurfaceViewProfile.this
                r13.<init>()
                r0 = r16
                r0.mEglHelper = r13
                r0 = r16
                r0.mHaveEglContext = r15
                r0 = r16
                r0.mHaveEglSurface = r15
                r6 = 0
                r2 = 0
                r3 = 0
                r8 = 0
                r9 = 0
                r12 = 0
                r4 = 0
                r1 = 0
                r11 = 0
                r7 = 0
                r5 = 0
            L_0x0021:
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r14 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x0160 }
                monitor-enter(r14)     // Catch:{ all -> 0x0160 }
            L_0x0026:
                r0 = r16
                boolean r13 = r0.mShouldExit     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x003d
                monitor-exit(r14)     // Catch:{ all -> 0x015d }
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r14 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager
                monitor-enter(r14)
                r16.stopEglSurfaceLocked()     // Catch:{ all -> 0x003a }
                r16.stopEglContextLocked()     // Catch:{ all -> 0x003a }
                monitor-exit(r14)     // Catch:{ all -> 0x003a }
            L_0x0039:
                return
            L_0x003a:
                r13 = move-exception
                monitor-exit(r14)     // Catch:{ all -> 0x003a }
                throw r13
            L_0x003d:
                r0 = r16
                java.util.ArrayList<java.lang.Runnable> r13 = r0.mEventQueue     // Catch:{ all -> 0x015d }
                boolean r13 = r13.isEmpty()     // Catch:{ all -> 0x015d }
                if (r13 != 0) goto L_0x005c
                r0 = r16
                java.util.ArrayList<java.lang.Runnable> r13 = r0.mEventQueue     // Catch:{ all -> 0x015d }
                r15 = 0
                java.lang.Object r13 = r13.remove(r15)     // Catch:{ all -> 0x015d }
                r0 = r13
                java.lang.Runnable r0 = (java.lang.Runnable) r0     // Catch:{ all -> 0x015d }
                r5 = r0
            L_0x0054:
                monitor-exit(r14)     // Catch:{ all -> 0x015d }
                if (r5 == 0) goto L_0x01a9
                r5.run()     // Catch:{ all -> 0x0160 }
                r5 = 0
                goto L_0x0021
            L_0x005c:
                r0 = r16
                boolean r13 = r0.mPaused     // Catch:{ all -> 0x015d }
                r0 = r16
                boolean r15 = r0.mRequestPaused     // Catch:{ all -> 0x015d }
                if (r13 == r15) goto L_0x0075
                r0 = r16
                boolean r13 = r0.mRequestPaused     // Catch:{ all -> 0x015d }
                r0 = r16
                r0.mPaused = r13     // Catch:{ all -> 0x015d }
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x015d }
                r13.notifyAll()     // Catch:{ all -> 0x015d }
            L_0x0075:
                r0 = r16
                boolean r13 = r0.mShouldReleaseEglContext     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x0087
                r16.stopEglSurfaceLocked()     // Catch:{ all -> 0x015d }
                r16.stopEglContextLocked()     // Catch:{ all -> 0x015d }
                r13 = 0
                r0 = r16
                r0.mShouldReleaseEglContext = r13     // Catch:{ all -> 0x015d }
                r1 = 1
            L_0x0087:
                if (r8 == 0) goto L_0x0090
                r16.stopEglSurfaceLocked()     // Catch:{ all -> 0x015d }
                r16.stopEglContextLocked()     // Catch:{ all -> 0x015d }
                r8 = 0
            L_0x0090:
                r0 = r16
                boolean r13 = r0.mHaveEglSurface     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x00c7
                r0 = r16
                boolean r13 = r0.mPaused     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x00c7
                r16.stopEglSurfaceLocked()     // Catch:{ all -> 0x015d }
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.this     // Catch:{ all -> 0x015d }
                boolean r13 = r13.mPreserveEGLContextOnPause     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x00b3
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x015d }
                boolean r13 = r13.shouldReleaseEGLContextWhenPausing()     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x00b6
            L_0x00b3:
                r16.stopEglContextLocked()     // Catch:{ all -> 0x015d }
            L_0x00b6:
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x015d }
                boolean r13 = r13.shouldTerminateEGLWhenPausing()     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x00c7
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile$EglHelper r13 = r0.mEglHelper     // Catch:{ all -> 0x015d }
                r13.finish()     // Catch:{ all -> 0x015d }
            L_0x00c7:
                r0 = r16
                boolean r13 = r0.mHasSurface     // Catch:{ all -> 0x015d }
                if (r13 != 0) goto L_0x00e8
                r0 = r16
                boolean r13 = r0.mWaitingForSurface     // Catch:{ all -> 0x015d }
                if (r13 != 0) goto L_0x00e8
                r0 = r16
                boolean r13 = r0.mHaveEglSurface     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x00dc
                r16.stopEglSurfaceLocked()     // Catch:{ all -> 0x015d }
            L_0x00dc:
                r13 = 1
                r0 = r16
                r0.mWaitingForSurface = r13     // Catch:{ all -> 0x015d }
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x015d }
                r13.notifyAll()     // Catch:{ all -> 0x015d }
            L_0x00e8:
                r0 = r16
                boolean r13 = r0.mHasSurface     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x0100
                r0 = r16
                boolean r13 = r0.mWaitingForSurface     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x0100
                r13 = 0
                r0 = r16
                r0.mWaitingForSurface = r13     // Catch:{ all -> 0x015d }
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x015d }
                r13.notifyAll()     // Catch:{ all -> 0x015d }
            L_0x0100:
                if (r4 == 0) goto L_0x0110
                r12 = 0
                r4 = 0
                r13 = 1
                r0 = r16
                r0.mRenderComplete = r13     // Catch:{ all -> 0x015d }
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x015d }
                r13.notifyAll()     // Catch:{ all -> 0x015d }
            L_0x0110:
                boolean r13 = r16.readyToDraw()     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x01a0
                r0 = r16
                boolean r13 = r0.mHaveEglContext     // Catch:{ all -> 0x015d }
                if (r13 != 0) goto L_0x011f
                if (r1 == 0) goto L_0x016e
                r1 = 0
            L_0x011f:
                r0 = r16
                boolean r13 = r0.mHaveEglContext     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x0132
                r0 = r16
                boolean r13 = r0.mHaveEglSurface     // Catch:{ all -> 0x015d }
                if (r13 != 0) goto L_0x0132
                r13 = 1
                r0 = r16
                r0.mHaveEglSurface = r13     // Catch:{ all -> 0x015d }
                r3 = 1
                r9 = 1
            L_0x0132:
                r0 = r16
                boolean r13 = r0.mHaveEglSurface     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x01a0
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.this     // Catch:{ all -> 0x015d }
                boolean r13 = r13.mSizeChanged     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x019a
                r9 = 1
                r0 = r16
                int r11 = r0.mWidth     // Catch:{ all -> 0x015d }
                r0 = r16
                int r7 = r0.mHeight     // Catch:{ all -> 0x015d }
                r12 = 1
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.this     // Catch:{ all -> 0x015d }
                r15 = 0
                boolean unused = r13.mSizeChanged = r15     // Catch:{ all -> 0x015d }
            L_0x0154:
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x015d }
                r13.notifyAll()     // Catch:{ all -> 0x015d }
                goto L_0x0054
            L_0x015d:
                r13 = move-exception
                monitor-exit(r14)     // Catch:{ all -> 0x015d }
                throw r13     // Catch:{ all -> 0x0160 }
            L_0x0160:
                r13 = move-exception
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r14 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager
                monitor-enter(r14)
                r16.stopEglSurfaceLocked()     // Catch:{ all -> 0x020b }
                r16.stopEglContextLocked()     // Catch:{ all -> 0x020b }
                monitor-exit(r14)     // Catch:{ all -> 0x020b }
                throw r13
            L_0x016e:
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x015d }
                r0 = r16
                boolean r13 = r13.tryAcquireEglContextLocked(r0)     // Catch:{ all -> 0x015d }
                if (r13 == 0) goto L_0x011f
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile$EglHelper r13 = r0.mEglHelper     // Catch:{ RuntimeException -> 0x018f }
                r13.start()     // Catch:{ RuntimeException -> 0x018f }
                r13 = 1
                r0 = r16
                r0.mHaveEglContext = r13     // Catch:{ all -> 0x015d }
                r2 = 1
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x015d }
                r13.notifyAll()     // Catch:{ all -> 0x015d }
                goto L_0x011f
            L_0x018f:
                r10 = move-exception
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x015d }
                r0 = r16
                r13.releaseEglContextLocked(r0)     // Catch:{ all -> 0x015d }
                throw r10     // Catch:{ all -> 0x015d }
            L_0x019a:
                r13 = 0
                r0 = r16
                r0.mRequestRender = r13     // Catch:{ all -> 0x015d }
                goto L_0x0154
            L_0x01a0:
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x015d }
                r13.wait()     // Catch:{ all -> 0x015d }
                goto L_0x0026
            L_0x01a9:
                if (r3 == 0) goto L_0x01da
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile$EglHelper r13 = r0.mEglHelper     // Catch:{ all -> 0x0160 }
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile r14 = com.miniclip.nativeJNI.GLSurfaceViewProfile.this     // Catch:{ all -> 0x0160 }
                android.view.SurfaceHolder r14 = r14.getHolder()     // Catch:{ all -> 0x0160 }
                javax.microedition.khronos.opengles.GL r13 = r13.createSurface(r14)     // Catch:{ all -> 0x0160 }
                r0 = r13
                javax.microedition.khronos.opengles.GL10 r0 = (javax.microedition.khronos.opengles.GL10) r0     // Catch:{ all -> 0x0160 }
                r6 = r0
                if (r6 != 0) goto L_0x01d2
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r14 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager
                monitor-enter(r14)
                r16.stopEglSurfaceLocked()     // Catch:{ all -> 0x01cf }
                r16.stopEglContextLocked()     // Catch:{ all -> 0x01cf }
                monitor-exit(r14)     // Catch:{ all -> 0x01cf }
                goto L_0x0039
            L_0x01cf:
                r13 = move-exception
                monitor-exit(r14)     // Catch:{ all -> 0x01cf }
                throw r13
            L_0x01d2:
                com.miniclip.nativeJNI.GLSurfaceViewProfile$GLThreadManager r13 = com.miniclip.nativeJNI.GLSurfaceViewProfile.sGLThreadManager     // Catch:{ all -> 0x0160 }
                r13.checkGLDriver(r6)     // Catch:{ all -> 0x0160 }
                r3 = 0
            L_0x01da:
                if (r2 == 0) goto L_0x01ea
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile$Renderer r13 = r0.mRenderer     // Catch:{ all -> 0x0160 }
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile$EglHelper r14 = r0.mEglHelper     // Catch:{ all -> 0x0160 }
                javax.microedition.khronos.egl.EGLConfig r14 = r14.mEglConfig     // Catch:{ all -> 0x0160 }
                r13.onSurfaceCreated(r6, r14)     // Catch:{ all -> 0x0160 }
                r2 = 0
            L_0x01ea:
                if (r9 == 0) goto L_0x01f4
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile$Renderer r13 = r0.mRenderer     // Catch:{ all -> 0x0160 }
                r13.onSurfaceChanged(r6, r11, r7)     // Catch:{ all -> 0x0160 }
                r9 = 0
            L_0x01f4:
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile$Renderer r13 = r0.mRenderer     // Catch:{ all -> 0x0160 }
                r13.onDrawFrame(r6)     // Catch:{ all -> 0x0160 }
                r0 = r16
                com.miniclip.nativeJNI.GLSurfaceViewProfile$EglHelper r13 = r0.mEglHelper     // Catch:{ all -> 0x0160 }
                boolean r13 = r13.swap()     // Catch:{ all -> 0x0160 }
                if (r13 != 0) goto L_0x0206
                r8 = 1
            L_0x0206:
                if (r12 == 0) goto L_0x0021
                r4 = 1
                goto L_0x0021
            L_0x020b:
                r13 = move-exception
                monitor-exit(r14)     // Catch:{ all -> 0x020b }
                throw r13
            */
            throw new UnsupportedOperationException("Method not decompiled: com.miniclip.nativeJNI.GLSurfaceViewProfile.GLThread.guardedRun():void");
        }

        public boolean ableToDraw() {
            return this.mHaveEglContext && this.mHaveEglSurface && readyToDraw();
        }

        private boolean readyToDraw() {
            return !this.mPaused && this.mHasSurface && this.mWidth > 0 && this.mHeight > 0 && (this.mRequestRender || this.mRenderMode == 1);
        }

        public void setRenderMode(int renderMode) {
            if (renderMode < 0 || renderMode > 1) {
                throw new IllegalArgumentException("renderMode");
            }
            synchronized (GLSurfaceViewProfile.sGLThreadManager) {
                this.mRenderMode = renderMode;
                GLSurfaceViewProfile.sGLThreadManager.notifyAll();
            }
        }

        public int getRenderMode() {
            int i;
            synchronized (GLSurfaceViewProfile.sGLThreadManager) {
                i = this.mRenderMode;
            }
            return i;
        }

        public void requestRender() {
            synchronized (GLSurfaceViewProfile.sGLThreadManager) {
                this.mRequestRender = true;
                GLSurfaceViewProfile.sGLThreadManager.notifyAll();
            }
        }

        public void surfaceCreated() {
            synchronized (GLSurfaceViewProfile.sGLThreadManager) {
                this.mHasSurface = true;
                GLSurfaceViewProfile.sGLThreadManager.notifyAll();
                while (this.mWaitingForSurface && !this.mExited) {
                    try {
                        GLSurfaceViewProfile.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void surfaceDestroyed() {
            synchronized (GLSurfaceViewProfile.sGLThreadManager) {
                this.mHasSurface = false;
                GLSurfaceViewProfile.sGLThreadManager.notifyAll();
                while (!this.mWaitingForSurface && !this.mExited) {
                    try {
                        GLSurfaceViewProfile.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onPause() {
            synchronized (GLSurfaceViewProfile.sGLThreadManager) {
                this.mRequestPaused = true;
                GLSurfaceViewProfile.sGLThreadManager.notifyAll();
                while (!this.mExited && !this.mPaused) {
                    try {
                        GLSurfaceViewProfile.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onResume() {
            synchronized (GLSurfaceViewProfile.sGLThreadManager) {
                this.mRequestPaused = false;
                this.mRequestRender = true;
                this.mRenderComplete = false;
                GLSurfaceViewProfile.sGLThreadManager.notifyAll();
                while (!this.mExited && this.mPaused && !this.mRenderComplete) {
                    try {
                        GLSurfaceViewProfile.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onWindowResize(int w, int h) {
            synchronized (GLSurfaceViewProfile.sGLThreadManager) {
                this.mWidth = w;
                this.mHeight = h;
                boolean unused = GLSurfaceViewProfile.this.mSizeChanged = true;
                this.mRequestRender = true;
                this.mRenderComplete = false;
                GLSurfaceViewProfile.sGLThreadManager.notifyAll();
                while (!this.mExited && !this.mPaused && !this.mRenderComplete && GLSurfaceViewProfile.this.mGLThread != null && GLSurfaceViewProfile.this.mGLThread.ableToDraw()) {
                    try {
                        GLSurfaceViewProfile.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void requestExitAndWait() {
            synchronized (GLSurfaceViewProfile.sGLThreadManager) {
                this.mShouldExit = true;
                GLSurfaceViewProfile.sGLThreadManager.notifyAll();
                while (!this.mExited) {
                    try {
                        GLSurfaceViewProfile.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void requestReleaseEglContextLocked() {
            this.mShouldReleaseEglContext = true;
            GLSurfaceViewProfile.sGLThreadManager.notifyAll();
        }

        public void queueEvent(Runnable r) {
            if (r == null) {
                throw new IllegalArgumentException("r must not be null");
            }
            synchronized (GLSurfaceViewProfile.sGLThreadManager) {
                this.mEventQueue.add(r);
                GLSurfaceViewProfile.sGLThreadManager.notifyAll();
            }
        }
    }

    static class LogWriter extends Writer {
        private StringBuilder mBuilder = new StringBuilder();

        LogWriter() {
        }

        public void close() {
            flushBuilder();
        }

        public void flush() {
            flushBuilder();
        }

        public void write(char[] buf, int offset, int count) {
            for (int i = 0; i < count; i++) {
                char c = buf[offset + i];
                if (c == 10) {
                    flushBuilder();
                } else {
                    this.mBuilder.append(c);
                }
            }
        }

        private void flushBuilder() {
            if (this.mBuilder.length() > 0) {
                Log.v("GLSurfaceView", this.mBuilder.toString());
                this.mBuilder.delete(0, this.mBuilder.length());
            }
        }
    }

    private void checkRenderThreadState() {
        if (this.mGLThread != null) {
            throw new IllegalStateException("setRenderer has already been called for this instance.");
        }
    }

    private static class GLThreadManager {
        private static String TAG = "GLThreadManager";
        private static final int kGLES_20 = 131072;
        private static final String kMSM7K_RENDERER_PREFIX = "Q3Dimension MSM7500 ";
        private GLThread mEglOwner;
        private boolean mGLESDriverCheckComplete;
        private int mGLESVersion;
        private boolean mGLESVersionCheckComplete;
        private boolean mLimitedGLESContexts;
        private boolean mMultipleGLESContextsAllowed;

        private GLThreadManager() {
        }

        public synchronized void threadExiting(GLThread thread) {
            boolean unused = thread.mExited = true;
            if (this.mEglOwner == thread) {
                this.mEglOwner = null;
            }
            notifyAll();
        }

        public boolean tryAcquireEglContextLocked(GLThread thread) {
            if (this.mEglOwner == thread || this.mEglOwner == null) {
                this.mEglOwner = thread;
                notifyAll();
                return true;
            }
            checkGLESVersion();
            if (this.mMultipleGLESContextsAllowed) {
                return true;
            }
            if (this.mEglOwner != null) {
                this.mEglOwner.requestReleaseEglContextLocked();
            }
            return false;
        }

        public void releaseEglContextLocked(GLThread thread) {
            if (this.mEglOwner == thread) {
                this.mEglOwner = null;
            }
            notifyAll();
        }

        public synchronized boolean shouldReleaseEGLContextWhenPausing() {
            return this.mLimitedGLESContexts;
        }

        public synchronized boolean shouldTerminateEGLWhenPausing() {
            checkGLESVersion();
            return !this.mMultipleGLESContextsAllowed;
        }

        public synchronized void checkGLDriver(GL10 gl) {
            boolean z;
            boolean z2 = true;
            synchronized (this) {
                if (!this.mGLESDriverCheckComplete) {
                    checkGLESVersion();
                    String renderer = gl.glGetString(7937);
                    if (this.mGLESVersion < 131072) {
                        if (!renderer.startsWith(kMSM7K_RENDERER_PREFIX)) {
                            z = true;
                        } else {
                            z = false;
                        }
                        this.mMultipleGLESContextsAllowed = z;
                        notifyAll();
                    }
                    if (this.mMultipleGLESContextsAllowed) {
                        z2 = false;
                    }
                    this.mLimitedGLESContexts = z2;
                    this.mGLESDriverCheckComplete = true;
                }
            }
        }

        private void checkGLESVersion() {
            if (!this.mGLESVersionCheckComplete) {
                this.mGLESVersion = 0;
                this.mMultipleGLESContextsAllowed = false;
                if (this.mGLESVersion >= 131072) {
                    this.mMultipleGLESContextsAllowed = true;
                }
                this.mGLESVersionCheckComplete = true;
            }
        }
    }
}
