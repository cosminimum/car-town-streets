package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.view.Display;
import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;

/* renamed from: com.google.android.gms.internal.fq */
public class C1213fq {

    /* renamed from: te */
    protected C1141fl f2827te;

    /* renamed from: uI */
    protected C1215a f2828uI;

    /* renamed from: com.google.android.gms.internal.fq$a */
    public static final class C1215a {
        public int bottom;
        public int gravity;
        public int left;
        public int right;
        public int top;

        /* renamed from: uJ */
        public IBinder f2829uJ;

        /* renamed from: uK */
        public int f2830uK;

        private C1215a(int i, IBinder iBinder) {
            this.f2830uK = -1;
            this.left = 0;
            this.top = 0;
            this.right = 0;
            this.bottom = 0;
            this.gravity = i;
            this.f2829uJ = iBinder;
        }

        /* renamed from: do */
        public Bundle mo7955do() {
            Bundle bundle = new Bundle();
            bundle.putInt("popupLocationInfo.gravity", this.gravity);
            bundle.putInt("popupLocationInfo.displayId", this.f2830uK);
            bundle.putInt("popupLocationInfo.left", this.left);
            bundle.putInt("popupLocationInfo.top", this.top);
            bundle.putInt("popupLocationInfo.right", this.right);
            bundle.putInt("popupLocationInfo.bottom", this.bottom);
            return bundle;
        }
    }

    /* renamed from: com.google.android.gms.internal.fq$b */
    private static final class C1216b extends C1213fq implements View.OnAttachStateChangeListener, ViewTreeObserver.OnGlobalLayoutListener {

        /* renamed from: tT */
        private boolean f2831tT = false;

        /* renamed from: uL */
        private WeakReference<View> f2832uL;

        protected C1216b(C1141fl flVar, int i) {
            super(flVar, i);
        }

        /* renamed from: f */
        private void m3310f(View view) {
            Display display;
            int i = -1;
            if (C1135fg.m2770cI() && (display = view.getDisplay()) != null) {
                i = display.getDisplayId();
            }
            IBinder windowToken = view.getWindowToken();
            int[] iArr = new int[2];
            view.getLocationInWindow(iArr);
            int width = view.getWidth();
            int height = view.getHeight();
            this.f2828uI.f2830uK = i;
            this.f2828uI.f2829uJ = windowToken;
            this.f2828uI.left = iArr[0];
            this.f2828uI.top = iArr[1];
            this.f2828uI.right = iArr[0] + width;
            this.f2828uI.bottom = iArr[1] + height;
            if (this.f2831tT) {
                mo7950dl();
                this.f2831tT = false;
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: aF */
        public void mo7949aF(int i) {
            this.f2828uI = new C1215a(i, (IBinder) null);
        }

        /* renamed from: dl */
        public void mo7950dl() {
            if (this.f2828uI.f2829uJ != null) {
                C1213fq.super.mo7950dl();
            } else {
                this.f2831tT = this.f2832uL != null;
            }
        }

        /* renamed from: e */
        public void mo7953e(View view) {
            this.f2827te.mo7750df();
            if (this.f2832uL != null) {
                View view2 = (View) this.f2832uL.get();
                Context context = this.f2827te.getContext();
                if (view2 == null && (context instanceof Activity)) {
                    view2 = ((Activity) context).getWindow().getDecorView();
                }
                if (view2 != null) {
                    view2.removeOnAttachStateChangeListener(this);
                    ViewTreeObserver viewTreeObserver = view2.getViewTreeObserver();
                    if (C1135fg.m2769cH()) {
                        viewTreeObserver.removeOnGlobalLayoutListener(this);
                    } else {
                        viewTreeObserver.removeGlobalOnLayoutListener(this);
                    }
                }
            }
            this.f2832uL = null;
            Context context2 = this.f2827te.getContext();
            if (view == null && (context2 instanceof Activity)) {
                View findViewById = ((Activity) context2).findViewById(16908290);
                if (findViewById == null) {
                    findViewById = ((Activity) context2).getWindow().getDecorView();
                }
                C1206fn.m2981c("PopupManager", "You have not specified a View to use as content view for popups. Falling back to the Activity content view which may not work properly in future versions of the API. Use setViewForPopups() to set your content view.");
                view = findViewById;
            }
            if (view != null) {
                m3310f(view);
                this.f2832uL = new WeakReference<>(view);
                view.addOnAttachStateChangeListener(this);
                view.getViewTreeObserver().addOnGlobalLayoutListener(this);
                return;
            }
            C1206fn.m2982d("PopupManager", "No content view usable to display popups. Popups will not be displayed in response to this client's calls. Use setViewForPopups() to set your content view.");
        }

        public void onGlobalLayout() {
            View view;
            if (this.f2832uL != null && (view = (View) this.f2832uL.get()) != null) {
                m3310f(view);
            }
        }

        public void onViewAttachedToWindow(View v) {
            m3310f(v);
        }

        public void onViewDetachedFromWindow(View v) {
            this.f2827te.mo7750df();
            v.removeOnAttachStateChangeListener(this);
        }
    }

    private C1213fq(C1141fl flVar, int i) {
        this.f2827te = flVar;
        mo7949aF(i);
    }

    /* renamed from: a */
    public static C1213fq m3303a(C1141fl flVar, int i) {
        return C1135fg.m2766cE() ? new C1216b(flVar, i) : new C1213fq(flVar, i);
    }

    /* access modifiers changed from: protected */
    /* renamed from: aF */
    public void mo7949aF(int i) {
        this.f2828uI = new C1215a(i, new Binder());
    }

    /* renamed from: dl */
    public void mo7950dl() {
        this.f2827te.mo7724a(this.f2828uI.f2829uJ, this.f2828uI.mo7955do());
    }

    /* renamed from: dm */
    public Bundle mo7951dm() {
        return this.f2828uI.mo7955do();
    }

    /* renamed from: dn */
    public IBinder mo7952dn() {
        return this.f2828uI.f2829uJ;
    }

    /* renamed from: e */
    public void mo7953e(View view) {
    }

    public void setGravity(int gravity) {
        this.f2828uI.gravity = gravity;
    }
}
