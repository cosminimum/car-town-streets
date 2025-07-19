package com.chartboost.sdk.impl;

import android.app.Activity;
import android.content.Context;
import android.database.DataSetObserver;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import java.util.ArrayList;
import java.util.List;

/* renamed from: com.chartboost.sdk.impl.q */
public class C0200q {

    /* renamed from: a */
    private ScrollView f343a;

    /* renamed from: b */
    private HorizontalScrollView f344b;

    /* renamed from: c */
    private ViewGroup f345c;
    /* access modifiers changed from: private */

    /* renamed from: d */
    public LinearLayout f346d;
    /* access modifiers changed from: private */

    /* renamed from: e */
    public BaseAdapter f347e;
    /* access modifiers changed from: private */

    /* renamed from: f */
    public List<List<View>> f348f;
    /* access modifiers changed from: private */

    /* renamed from: g */
    public List<List<View>> f349g;
    /* access modifiers changed from: private */

    /* renamed from: h */
    public List<Integer> f350h;
    /* access modifiers changed from: private */

    /* renamed from: i */
    public int f351i;

    /* renamed from: j */
    private DataSetObserver f352j = new DataSetObserver() {
        public void onChanged() {
            LinearLayout.LayoutParams layoutParams;
            int childCount = C0200q.this.f346d.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = C0200q.this.f346d.getChildAt(i);
                ((List) C0200q.this.f349g.get(((Integer) C0200q.this.f350h.get(i)).intValue())).remove(childAt);
                ((List) C0200q.this.f348f.get(((Integer) C0200q.this.f350h.get(i)).intValue())).add(childAt);
            }
            C0200q.this.f350h.clear();
            C0200q.this.f346d.removeAllViews();
            int count = C0200q.this.f347e.getCount();
            for (int i2 = 0; i2 < count; i2++) {
                int itemViewType = C0200q.this.f347e.getItemViewType(i2);
                List list = (List) C0200q.this.f349g.get(itemViewType);
                List list2 = (List) C0200q.this.f348f.get(itemViewType);
                C0200q.this.f350h.add(Integer.valueOf(itemViewType));
                View view = null;
                if (!list2.isEmpty()) {
                    view = (View) list2.get(0);
                    list2.remove(0);
                }
                View view2 = C0200q.this.f347e.getView(i2, view, C0200q.this.f346d);
                list.add(view2);
                if (C0200q.this.f351i == 0) {
                    layoutParams = new LinearLayout.LayoutParams(-2, -1);
                } else {
                    layoutParams = new LinearLayout.LayoutParams(-1, -2);
                }
                if (i2 < count - 1) {
                    layoutParams.setMargins(0, 0, 0, 1);
                }
                C0200q.this.f346d.addView(view2, layoutParams);
            }
            C0200q.this.f346d.requestLayout();
        }
    };

    public C0200q(Context context, int i) {
        this.f346d = new LinearLayout(context);
        this.f351i = i;
        this.f346d.setOrientation(i);
        if (i == 0) {
            this.f345c = m426a(context);
        } else {
            this.f345c = m428b(context);
        }
        this.f345c.addView(this.f346d);
        this.f348f = new ArrayList();
        this.f349g = new ArrayList();
        this.f350h = new ArrayList();
        this.f346d.setOnTouchListener(new View.OnTouchListener() {
            public boolean onTouch(View view, MotionEvent ev) {
                try {
                    View currentFocus = ((Activity) C0200q.this.f346d.getContext()).getCurrentFocus();
                    if (currentFocus != null) {
                        ((InputMethodManager) C0200q.this.f346d.getContext().getSystemService("input_method")).hideSoftInputFromWindow(currentFocus.getApplicationWindowToken(), 0);
                    }
                } catch (Exception e) {
                }
                return false;
            }
        });
    }

    /* renamed from: a */
    private HorizontalScrollView m426a(Context context) {
        if (this.f344b == null) {
            this.f344b = new HorizontalScrollView(context);
            this.f344b.setFillViewport(true);
        }
        return this.f344b;
    }

    /* renamed from: b */
    private ScrollView m428b(Context context) {
        if (this.f343a == null) {
            this.f343a = new ScrollView(context);
            this.f343a.setFillViewport(true);
        }
        return this.f343a;
    }

    /* renamed from: a */
    public ViewGroup mo1489a() {
        return this.f345c;
    }

    /* renamed from: a */
    public void mo1491a(BaseAdapter baseAdapter) {
        if (this.f347e != null) {
            this.f347e.unregisterDataSetObserver(this.f352j);
        }
        this.f347e = baseAdapter;
        this.f347e.registerDataSetObserver(this.f352j);
        this.f346d.removeAllViews();
        this.f348f.clear();
        this.f349g.clear();
        for (int i = 0; i < this.f347e.getViewTypeCount(); i++) {
            this.f348f.add(new ArrayList());
            this.f349g.add(new ArrayList());
        }
        this.f350h.clear();
        this.f347e.notifyDataSetChanged();
    }

    /* renamed from: a */
    public void mo1490a(int i) {
        if (i != this.f351i) {
            this.f351i = i;
            this.f346d.setOrientation(i);
            this.f345c.removeView(this.f346d);
            if (i == 0) {
                this.f345c = m426a(m431d());
            } else {
                this.f345c = m428b(m431d());
            }
            this.f345c.addView(this.f346d);
        }
    }

    /* renamed from: d */
    private Context m431d() {
        return this.f346d.getContext();
    }

    /* renamed from: b */
    public LinearLayout mo1492b() {
        return this.f346d;
    }

    /* renamed from: c */
    public void mo1493c() {
        if (this.f345c == this.f343a && this.f343a != null) {
            this.f343a.fullScroll(130);
        } else if (this.f345c == this.f344b && this.f344b != null) {
            this.f344b.fullScroll(66);
        }
    }
}
