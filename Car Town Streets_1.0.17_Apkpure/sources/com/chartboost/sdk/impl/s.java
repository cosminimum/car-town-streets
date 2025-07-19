package com.chartboost.sdk.impl;

import android.content.Context;
import android.view.MotionEvent;
import android.view.OrientationEventListener;
import android.view.View;
import android.widget.RelativeLayout;
import com.chartboost.sdk.Chartboost;
import com.chartboost.sdk.Libraries.CBOrientation;
/* loaded from: classes.dex */
public class s extends RelativeLayout {
    private View a;
    private o b;
    private OrientationEventListener c;
    private CBOrientation.Difference d;

    /* loaded from: classes.dex */
    public interface a {
        void a();
    }

    public s(Context context, a aVar) {
        super(context);
        this.d = null;
        this.a = (View) aVar;
        this.b = new o(context);
        addView(this.b, new RelativeLayout.LayoutParams(-1, -1));
        addView(this.a, new RelativeLayout.LayoutParams(-1, -1));
        this.d = Chartboost.sharedChartboost().getForcedOrientationDifference();
        this.c = new OrientationEventListener(context, 3) { // from class: com.chartboost.sdk.impl.s.1
            @Override // android.view.OrientationEventListener
            public void onOrientationChanged(int orientation) {
                CBOrientation.Difference forcedOrientationDifference = Chartboost.sharedChartboost().getForcedOrientationDifference();
                if (s.this.d != forcedOrientationDifference) {
                    s.this.d = forcedOrientationDifference;
                    ((a) s.this.a).a();
                    s.this.invalidate();
                }
            }
        };
        this.c.enable();
        setOnTouchListener(new View.OnTouchListener() { // from class: com.chartboost.sdk.impl.s.2
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                return true;
            }
        });
    }

    public void a() {
        if (this.c != null) {
            this.c.disable();
        }
        this.c = null;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        return true;
    }

    public o b() {
        return this.b;
    }

    public View c() {
        return this.a;
    }
}
