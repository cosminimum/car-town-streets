package com.chartboost.sdk.impl;

import android.content.Context;
import android.view.MotionEvent;
import android.view.OrientationEventListener;
import android.view.View;
import android.widget.RelativeLayout;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.Libraries.CBOrientation;

/* renamed from: com.chartboost.sdk.impl.s */
public class C0204s extends RelativeLayout {
    /* access modifiers changed from: private */

    /* renamed from: a */
    public View f359a;

    /* renamed from: b */
    private C0197o f360b;

    /* renamed from: c */
    private OrientationEventListener f361c;
    /* access modifiers changed from: private */

    /* renamed from: d */
    public CBOrientation.Difference f362d = null;

    /* renamed from: com.chartboost.sdk.impl.s$a */
    public interface C0207a {
        /* renamed from: a */
        void mo1242a();
    }

    public C0204s(Context context, C0207a aVar) {
        super(context);
        this.f359a = (View) aVar;
        this.f360b = new C0197o(context);
        addView(this.f360b, new RelativeLayout.LayoutParams(-1, -1));
        addView(this.f359a, new RelativeLayout.LayoutParams(-1, -1));
        this.f362d = C0038Chartboost.sharedChartboost().getForcedOrientationDifference();
        this.f361c = new OrientationEventListener(context, 3) {
            public void onOrientationChanged(int orientation) {
                CBOrientation.Difference forcedOrientationDifference = C0038Chartboost.sharedChartboost().getForcedOrientationDifference();
                if (C0204s.this.f362d != forcedOrientationDifference) {
                    C0204s.this.f362d = forcedOrientationDifference;
                    ((C0207a) C0204s.this.f359a).mo1242a();
                    C0204s.this.invalidate();
                }
            }
        };
        this.f361c.enable();
        setOnTouchListener(new View.OnTouchListener() {
            public boolean onTouch(View v, MotionEvent event) {
                return true;
            }
        });
    }

    /* renamed from: a */
    public void mo1496a() {
        if (this.f361c != null) {
            this.f361c.disable();
        }
        this.f361c = null;
    }

    public boolean onTouchEvent(MotionEvent ev) {
        return true;
    }

    /* renamed from: b */
    public C0197o mo1497b() {
        return this.f360b;
    }

    /* renamed from: c */
    public View mo1498c() {
        return this.f359a;
    }
}
