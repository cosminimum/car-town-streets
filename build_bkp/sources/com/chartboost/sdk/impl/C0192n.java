package com.chartboost.sdk.impl;

import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.ScaleAnimation;
import android.view.animation.TranslateAnimation;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.Libraries.CBOrientation;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;

/* renamed from: com.chartboost.sdk.impl.n */
public class C0192n {

    /* renamed from: a */
    private static /* synthetic */ int[] f318a;

    /* renamed from: b */
    private static /* synthetic */ int[] f319b;

    /* renamed from: com.chartboost.sdk.impl.n$a */
    public interface C0195a {
        /* renamed from: a */
        void mo1228a(C0069a aVar);
    }

    /* renamed from: com.chartboost.sdk.impl.n$b */
    public enum C0196b {
        CBAnimationTypeNone,
        CBAnimationTypePerspectiveRotate,
        CBAnimationTypeBounce,
        CBAnimationTypePerspectiveZoom,
        CBAnimationTypeSlideFromBottom,
        CBAnimationTypeSlideFromTop
    }

    /* renamed from: a */
    static /* synthetic */ int[] m415a() {
        int[] iArr = f318a;
        if (iArr == null) {
            iArr = new int[CBOrientation.Difference.values().length];
            try {
                iArr[CBOrientation.Difference.ANGLE_0.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[CBOrientation.Difference.ANGLE_180.ordinal()] = 3;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[CBOrientation.Difference.ANGLE_270.ordinal()] = 4;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[CBOrientation.Difference.ANGLE_90.ordinal()] = 2;
            } catch (NoSuchFieldError e4) {
            }
            f318a = iArr;
        }
        return iArr;
    }

    /* renamed from: b */
    static /* synthetic */ int[] m418b() {
        int[] iArr = f319b;
        if (iArr == null) {
            iArr = new int[C0196b.values().length];
            try {
                iArr[C0196b.CBAnimationTypeBounce.ordinal()] = 3;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[C0196b.CBAnimationTypeNone.ordinal()] = 1;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[C0196b.CBAnimationTypePerspectiveRotate.ordinal()] = 2;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[C0196b.CBAnimationTypePerspectiveZoom.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                iArr[C0196b.CBAnimationTypeSlideFromBottom.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                iArr[C0196b.CBAnimationTypeSlideFromTop.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            f319b = iArr;
        }
        return iArr;
    }

    /* renamed from: a */
    public static void m412a(C0196b bVar, C0069a aVar) {
        m413a(bVar, aVar, (C0195a) null);
    }

    /* renamed from: a */
    public static void m413a(C0196b bVar, C0069a aVar, C0195a aVar2) {
        m417b(bVar, aVar, aVar2, true);
    }

    /* renamed from: b */
    public static void m416b(C0196b bVar, C0069a aVar, C0195a aVar2) {
        m419c(bVar, aVar, aVar2, false);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:3:0x0007, code lost:
        r1 = r8.f109h.mo1498c();
     */
    /* renamed from: b */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void m417b(com.chartboost.sdk.impl.C0192n.C0196b r7, com.chartboost.sdk.impl.C0069a r8, com.chartboost.sdk.impl.C0192n.C0195a r9, java.lang.Boolean r10) {
        /*
            if (r8 == 0) goto L_0x0006
            com.chartboost.sdk.impl.s r0 = r8.f109h
            if (r0 != 0) goto L_0x0007
        L_0x0006:
            return
        L_0x0007:
            com.chartboost.sdk.impl.s r0 = r8.f109h
            android.view.View r1 = r0.mo1498c()
            if (r1 == 0) goto L_0x0006
            android.view.ViewTreeObserver r6 = r1.getViewTreeObserver()
            boolean r0 = r6.isAlive()
            if (r0 == 0) goto L_0x0006
            com.chartboost.sdk.impl.n$1 r0 = new com.chartboost.sdk.impl.n$1
            r2 = r7
            r3 = r8
            r4 = r9
            r5 = r10
            r0.<init>(r1, r2, r3, r4, r5)
            r6.addOnGlobalLayoutListener(r0)
            goto L_0x0006
        */
        throw new UnsupportedOperationException("Method not decompiled: com.chartboost.sdk.impl.C0192n.m417b(com.chartboost.sdk.impl.n$b, com.chartboost.sdk.impl.a, com.chartboost.sdk.impl.n$a, java.lang.Boolean):void");
    }

    /* access modifiers changed from: private */
    /* renamed from: c */
    public static void m419c(C0196b bVar, C0069a aVar, C0195a aVar2, Boolean bool) {
        View c;
        float f;
        float f2;
        float f3;
        float f4;
        float f5;
        float f6;
        C0199p pVar;
        ScaleAnimation scaleAnimation;
        TranslateAnimation translateAnimation;
        C0199p pVar2;
        ScaleAnimation scaleAnimation2;
        TranslateAnimation translateAnimation2;
        AnimationSet animationSet = new AnimationSet(true);
        animationSet.addAnimation(new AlphaAnimation(1.0f, 1.0f));
        if (aVar != null && aVar.f109h != null && (c = aVar.f109h.mo1498c()) != null) {
            float width = (float) c.getWidth();
            float height = (float) c.getHeight();
            float f7 = (1.0f - 0.4f) / 2.0f;
            CBOrientation.Difference forcedOrientationDifference = C0038Chartboost.sharedChartboost().getForcedOrientationDifference();
            switch (m418b()[bVar.ordinal()]) {
                case 2:
                    switch (m415a()[forcedOrientationDifference.ordinal()]) {
                        case 2:
                            if (!bool.booleanValue()) {
                                pVar = new C0199p(BitmapDescriptorFactory.HUE_RED, -60.0f, width / 2.0f, height / 2.0f, false);
                                break;
                            } else {
                                pVar = new C0199p(60.0f, BitmapDescriptorFactory.HUE_RED, width / 2.0f, height / 2.0f, false);
                                break;
                            }
                        case 3:
                            if (!bool.booleanValue()) {
                                pVar = new C0199p(BitmapDescriptorFactory.HUE_RED, -60.0f, width / 2.0f, height / 2.0f, true);
                                break;
                            } else {
                                pVar = new C0199p(60.0f, BitmapDescriptorFactory.HUE_RED, width / 2.0f, height / 2.0f, true);
                                break;
                            }
                        case 4:
                            if (!bool.booleanValue()) {
                                pVar = new C0199p(BitmapDescriptorFactory.HUE_RED, 60.0f, width / 2.0f, height / 2.0f, false);
                                break;
                            } else {
                                pVar = new C0199p(-60.0f, BitmapDescriptorFactory.HUE_RED, width / 2.0f, height / 2.0f, false);
                                break;
                            }
                        default:
                            if (!bool.booleanValue()) {
                                pVar = new C0199p(BitmapDescriptorFactory.HUE_RED, 60.0f, width / 2.0f, height / 2.0f, true);
                                break;
                            } else {
                                pVar = new C0199p(-60.0f, BitmapDescriptorFactory.HUE_RED, width / 2.0f, height / 2.0f, true);
                                break;
                            }
                    }
                    pVar.setDuration(600);
                    pVar.setFillAfter(true);
                    animationSet.addAnimation(pVar);
                    if (bool.booleanValue()) {
                        scaleAnimation = new ScaleAnimation(0.4f, 1.0f, 0.4f, 1.0f);
                    } else {
                        scaleAnimation = new ScaleAnimation(1.0f, 0.4f, 1.0f, 0.4f);
                    }
                    scaleAnimation.setDuration(600);
                    scaleAnimation.setFillAfter(true);
                    animationSet.addAnimation(scaleAnimation);
                    switch (m415a()[forcedOrientationDifference.ordinal()]) {
                        case 2:
                            if (!bool.booleanValue()) {
                                translateAnimation = new TranslateAnimation(BitmapDescriptorFactory.HUE_RED, width * f7, BitmapDescriptorFactory.HUE_RED, height);
                                break;
                            } else {
                                translateAnimation = new TranslateAnimation(width * f7, BitmapDescriptorFactory.HUE_RED, (-height) * 0.4f, BitmapDescriptorFactory.HUE_RED);
                                break;
                            }
                        case 3:
                            if (!bool.booleanValue()) {
                                translateAnimation = new TranslateAnimation(BitmapDescriptorFactory.HUE_RED, (-width) * 0.4f, BitmapDescriptorFactory.HUE_RED, height * f7);
                                break;
                            } else {
                                translateAnimation = new TranslateAnimation(width, BitmapDescriptorFactory.HUE_RED, height * f7, BitmapDescriptorFactory.HUE_RED);
                                break;
                            }
                        case 4:
                            if (!bool.booleanValue()) {
                                translateAnimation = new TranslateAnimation(BitmapDescriptorFactory.HUE_RED, width * f7, BitmapDescriptorFactory.HUE_RED, (-height) * 0.4f);
                                break;
                            } else {
                                translateAnimation = new TranslateAnimation(width * f7, BitmapDescriptorFactory.HUE_RED, height, BitmapDescriptorFactory.HUE_RED);
                                break;
                            }
                        default:
                            if (!bool.booleanValue()) {
                                translateAnimation = new TranslateAnimation(BitmapDescriptorFactory.HUE_RED, width, BitmapDescriptorFactory.HUE_RED, height * f7);
                                break;
                            } else {
                                translateAnimation = new TranslateAnimation((-width) * 0.4f, BitmapDescriptorFactory.HUE_RED, height * f7, BitmapDescriptorFactory.HUE_RED);
                                break;
                            }
                    }
                    translateAnimation.setDuration(600);
                    translateAnimation.setFillAfter(true);
                    animationSet.addAnimation(translateAnimation);
                    break;
                case 3:
                    if (!bool.booleanValue()) {
                        ScaleAnimation scaleAnimation3 = new ScaleAnimation(1.0f, BitmapDescriptorFactory.HUE_RED, 1.0f, BitmapDescriptorFactory.HUE_RED, 1, 0.5f, 1, 0.5f);
                        scaleAnimation3.setDuration(600);
                        scaleAnimation3.setStartOffset(0);
                        scaleAnimation3.setFillAfter(true);
                        animationSet.addAnimation(scaleAnimation3);
                        break;
                    } else {
                        ScaleAnimation scaleAnimation4 = new ScaleAnimation(0.6f, 1.1f, 0.6f, 1.1f, 1, 0.5f, 1, 0.5f);
                        scaleAnimation4.setDuration((long) Math.round(((float) 600) * 0.6f));
                        scaleAnimation4.setStartOffset(0);
                        scaleAnimation4.setFillAfter(true);
                        animationSet.addAnimation(scaleAnimation4);
                        ScaleAnimation scaleAnimation5 = new ScaleAnimation(1.0f, 0.81818175f, 1.0f, 0.81818175f, 1, 0.5f, 1, 0.5f);
                        scaleAnimation5.setDuration((long) Math.round(((float) 600) * 0.19999999f));
                        scaleAnimation5.setStartOffset((long) Math.round(((float) 600) * 0.6f));
                        scaleAnimation5.setFillAfter(true);
                        animationSet.addAnimation(scaleAnimation5);
                        ScaleAnimation scaleAnimation6 = new ScaleAnimation(1.0f, 1.1111112f, 1.0f, 1.1111112f, 1, 0.5f, 1, 0.5f);
                        scaleAnimation6.setDuration((long) Math.round(((float) 600) * 0.099999964f));
                        scaleAnimation6.setStartOffset((long) Math.round(((float) 600) * 0.8f));
                        scaleAnimation6.setFillAfter(true);
                        animationSet.addAnimation(scaleAnimation6);
                        break;
                    }
                case 4:
                    switch (m415a()[forcedOrientationDifference.ordinal()]) {
                        case 2:
                            if (!bool.booleanValue()) {
                                pVar2 = new C0199p(BitmapDescriptorFactory.HUE_RED, 60.0f, width / 2.0f, height / 2.0f, true);
                                break;
                            } else {
                                pVar2 = new C0199p(-60.0f, BitmapDescriptorFactory.HUE_RED, width / 2.0f, height / 2.0f, true);
                                break;
                            }
                        case 3:
                            if (!bool.booleanValue()) {
                                pVar2 = new C0199p(BitmapDescriptorFactory.HUE_RED, -60.0f, width / 2.0f, height / 2.0f, false);
                                break;
                            } else {
                                pVar2 = new C0199p(60.0f, BitmapDescriptorFactory.HUE_RED, width / 2.0f, height / 2.0f, false);
                                break;
                            }
                        case 4:
                            if (!bool.booleanValue()) {
                                pVar2 = new C0199p(BitmapDescriptorFactory.HUE_RED, -60.0f, width / 2.0f, height / 2.0f, true);
                                break;
                            } else {
                                pVar2 = new C0199p(60.0f, BitmapDescriptorFactory.HUE_RED, width / 2.0f, height / 2.0f, true);
                                break;
                            }
                        default:
                            if (!bool.booleanValue()) {
                                pVar2 = new C0199p(BitmapDescriptorFactory.HUE_RED, 60.0f, width / 2.0f, height / 2.0f, false);
                                break;
                            } else {
                                pVar2 = new C0199p(-60.0f, BitmapDescriptorFactory.HUE_RED, width / 2.0f, height / 2.0f, false);
                                break;
                            }
                    }
                    pVar2.setDuration(600);
                    pVar2.setFillAfter(true);
                    animationSet.addAnimation(pVar2);
                    if (bool.booleanValue()) {
                        scaleAnimation2 = new ScaleAnimation(0.4f, 1.0f, 0.4f, 1.0f);
                    } else {
                        scaleAnimation2 = new ScaleAnimation(1.0f, 0.4f, 1.0f, 0.4f);
                    }
                    scaleAnimation2.setDuration(600);
                    scaleAnimation2.setFillAfter(true);
                    animationSet.addAnimation(scaleAnimation2);
                    switch (m415a()[forcedOrientationDifference.ordinal()]) {
                        case 2:
                            if (!bool.booleanValue()) {
                                translateAnimation2 = new TranslateAnimation(BitmapDescriptorFactory.HUE_RED, (-width) * 0.4f, BitmapDescriptorFactory.HUE_RED, height * f7);
                                break;
                            } else {
                                translateAnimation2 = new TranslateAnimation(width, BitmapDescriptorFactory.HUE_RED, height * f7, BitmapDescriptorFactory.HUE_RED);
                                break;
                            }
                        case 3:
                            if (!bool.booleanValue()) {
                                translateAnimation2 = new TranslateAnimation(BitmapDescriptorFactory.HUE_RED, width * f7, BitmapDescriptorFactory.HUE_RED, (-height) * 0.4f);
                                break;
                            } else {
                                translateAnimation2 = new TranslateAnimation(width * f7, BitmapDescriptorFactory.HUE_RED, height, BitmapDescriptorFactory.HUE_RED);
                                break;
                            }
                        case 4:
                            if (!bool.booleanValue()) {
                                translateAnimation2 = new TranslateAnimation(BitmapDescriptorFactory.HUE_RED, width, BitmapDescriptorFactory.HUE_RED, height * f7);
                                break;
                            } else {
                                translateAnimation2 = new TranslateAnimation((-width) * 0.4f, BitmapDescriptorFactory.HUE_RED, height * f7, BitmapDescriptorFactory.HUE_RED);
                                break;
                            }
                        default:
                            if (!bool.booleanValue()) {
                                translateAnimation2 = new TranslateAnimation(BitmapDescriptorFactory.HUE_RED, width * f7, BitmapDescriptorFactory.HUE_RED, height);
                                break;
                            } else {
                                translateAnimation2 = new TranslateAnimation(width * f7, BitmapDescriptorFactory.HUE_RED, (-height) * 0.4f, BitmapDescriptorFactory.HUE_RED);
                                break;
                            }
                    }
                    translateAnimation2.setDuration(600);
                    translateAnimation2.setFillAfter(true);
                    animationSet.addAnimation(translateAnimation2);
                    break;
                case 5:
                    switch (m415a()[forcedOrientationDifference.ordinal()]) {
                        case 1:
                            f6 = bool.booleanValue() ? height : BitmapDescriptorFactory.HUE_RED;
                            if (bool.booleanValue()) {
                                height = BitmapDescriptorFactory.HUE_RED;
                            }
                            f4 = 0.0f;
                            f5 = 0.0f;
                            break;
                        case 2:
                            float f8 = bool.booleanValue() ? -width : BitmapDescriptorFactory.HUE_RED;
                            f4 = bool.booleanValue() ? BitmapDescriptorFactory.HUE_RED : -width;
                            height = 0.0f;
                            f5 = f8;
                            f6 = 0.0f;
                            break;
                        case 3:
                            f6 = bool.booleanValue() ? -height : BitmapDescriptorFactory.HUE_RED;
                            height = bool.booleanValue() ? BitmapDescriptorFactory.HUE_RED : -height;
                            f5 = 0.0f;
                            f4 = 0.0f;
                            break;
                        case 4:
                            float f9 = bool.booleanValue() ? width : BitmapDescriptorFactory.HUE_RED;
                            if (bool.booleanValue()) {
                                width = BitmapDescriptorFactory.HUE_RED;
                            }
                            height = 0.0f;
                            f4 = width;
                            f5 = f9;
                            f6 = 0.0f;
                            break;
                        default:
                            height = 0.0f;
                            f6 = 0.0f;
                            f4 = 0.0f;
                            f5 = 0.0f;
                            break;
                    }
                    TranslateAnimation translateAnimation3 = new TranslateAnimation(f5, f4, f6, height);
                    translateAnimation3.setDuration(600);
                    translateAnimation3.setFillAfter(true);
                    animationSet.addAnimation(translateAnimation3);
                    break;
                case 6:
                    switch (m415a()[forcedOrientationDifference.ordinal()]) {
                        case 1:
                            f3 = bool.booleanValue() ? -height : BitmapDescriptorFactory.HUE_RED;
                            f = bool.booleanValue() ? BitmapDescriptorFactory.HUE_RED : -height;
                            width = 0.0f;
                            f2 = 0.0f;
                            break;
                        case 2:
                            float f10 = bool.booleanValue() ? width : BitmapDescriptorFactory.HUE_RED;
                            if (bool.booleanValue()) {
                                width = BitmapDescriptorFactory.HUE_RED;
                            }
                            f = 0.0f;
                            f2 = f10;
                            f3 = 0.0f;
                            break;
                        case 3:
                            f3 = bool.booleanValue() ? height : BitmapDescriptorFactory.HUE_RED;
                            if (bool.booleanValue()) {
                                height = BitmapDescriptorFactory.HUE_RED;
                            }
                            f = height;
                            width = 0.0f;
                            f2 = 0.0f;
                            break;
                        case 4:
                            float f11 = bool.booleanValue() ? -width : BitmapDescriptorFactory.HUE_RED;
                            width = bool.booleanValue() ? BitmapDescriptorFactory.HUE_RED : -width;
                            f = 0.0f;
                            f2 = f11;
                            f3 = 0.0f;
                            break;
                        default:
                            f = 0.0f;
                            f3 = 0.0f;
                            width = 0.0f;
                            f2 = 0.0f;
                            break;
                    }
                    TranslateAnimation translateAnimation4 = new TranslateAnimation(f2, width, f3, f);
                    translateAnimation4.setDuration(600);
                    translateAnimation4.setFillAfter(true);
                    animationSet.addAnimation(translateAnimation4);
                    break;
            }
            final C0195a aVar3 = aVar2;
            final C0069a aVar4 = aVar;
            animationSet.setAnimationListener(new Animation.AnimationListener() {
                public void onAnimationEnd(Animation animation) {
                    if (C0195a.this != null) {
                        C0195a.this.mo1228a(aVar4);
                    }
                }

                public void onAnimationRepeat(Animation animation) {
                }

                public void onAnimationStart(Animation animation) {
                }
            });
            c.startAnimation(animationSet);
        }
    }
}
