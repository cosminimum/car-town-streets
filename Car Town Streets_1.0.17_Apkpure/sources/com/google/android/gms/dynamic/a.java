package com.google.android.gms.dynamic;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.dynamic.LifecycleDelegate;
import java.util.Iterator;
import java.util.LinkedList;
/* loaded from: classes.dex */
public abstract class a<T extends LifecycleDelegate> {
    private T ss;
    private Bundle st;
    private LinkedList<AbstractC0017a> su;
    private final d<T> sv = (d<T>) new d<T>() { // from class: com.google.android.gms.dynamic.a.1
        @Override // com.google.android.gms.dynamic.d
        public void a(T t) {
            a.this.ss = t;
            Iterator it = a.this.su.iterator();
            while (it.hasNext()) {
                ((AbstractC0017a) it.next()).b(a.this.ss);
            }
            a.this.su.clear();
            a.this.st = null;
        }
    };

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: com.google.android.gms.dynamic.a$a  reason: collision with other inner class name */
    /* loaded from: classes.dex */
    public interface AbstractC0017a {
        void b(LifecycleDelegate lifecycleDelegate);

        int getState();
    }

    private void a(Bundle bundle, AbstractC0017a abstractC0017a) {
        if (this.ss != null) {
            abstractC0017a.b(this.ss);
            return;
        }
        if (this.su == null) {
            this.su = new LinkedList<>();
        }
        this.su.add(abstractC0017a);
        if (bundle != null) {
            if (this.st == null) {
                this.st = (Bundle) bundle.clone();
            } else {
                this.st.putAll(bundle);
            }
        }
        a(this.sv);
    }

    private void ay(int i) {
        while (!this.su.isEmpty() && this.su.getLast().getState() >= i) {
            this.su.removeLast();
        }
    }

    public void a(FrameLayout frameLayout) {
        final Context context = frameLayout.getContext();
        final int isGooglePlayServicesAvailable = GooglePlayServicesUtil.isGooglePlayServicesAvailable(context);
        String b = GooglePlayServicesUtil.b(context, isGooglePlayServicesAvailable, -1);
        String b2 = GooglePlayServicesUtil.b(context, isGooglePlayServicesAvailable);
        LinearLayout linearLayout = new LinearLayout(frameLayout.getContext());
        linearLayout.setOrientation(1);
        linearLayout.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
        frameLayout.addView(linearLayout);
        TextView textView = new TextView(frameLayout.getContext());
        textView.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
        textView.setText(b);
        linearLayout.addView(textView);
        if (b2 != null) {
            Button button = new Button(context);
            button.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
            button.setText(b2);
            linearLayout.addView(button);
            button.setOnClickListener(new View.OnClickListener() { // from class: com.google.android.gms.dynamic.a.5
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    context.startActivity(GooglePlayServicesUtil.a(context, isGooglePlayServicesAvailable, -1));
                }
            });
        }
    }

    protected abstract void a(d<T> dVar);

    public T cZ() {
        return this.ss;
    }

    public void onCreate(final Bundle savedInstanceState) {
        a(savedInstanceState, new AbstractC0017a() { // from class: com.google.android.gms.dynamic.a.3
            @Override // com.google.android.gms.dynamic.a.AbstractC0017a
            public void b(LifecycleDelegate lifecycleDelegate) {
                a.this.ss.onCreate(savedInstanceState);
            }

            @Override // com.google.android.gms.dynamic.a.AbstractC0017a
            public int getState() {
                return 1;
            }
        });
    }

    public View onCreateView(final LayoutInflater inflater, final ViewGroup container, final Bundle savedInstanceState) {
        final FrameLayout frameLayout = new FrameLayout(inflater.getContext());
        a(savedInstanceState, new AbstractC0017a() { // from class: com.google.android.gms.dynamic.a.4
            @Override // com.google.android.gms.dynamic.a.AbstractC0017a
            public void b(LifecycleDelegate lifecycleDelegate) {
                frameLayout.removeAllViews();
                frameLayout.addView(a.this.ss.onCreateView(inflater, container, savedInstanceState));
            }

            @Override // com.google.android.gms.dynamic.a.AbstractC0017a
            public int getState() {
                return 2;
            }
        });
        if (this.ss == null) {
            a(frameLayout);
        }
        return frameLayout;
    }

    public void onDestroy() {
        if (this.ss != null) {
            this.ss.onDestroy();
        } else {
            ay(1);
        }
    }

    public void onDestroyView() {
        if (this.ss != null) {
            this.ss.onDestroyView();
        } else {
            ay(2);
        }
    }

    public void onInflate(final Activity activity, final Bundle attrs, final Bundle savedInstanceState) {
        a(savedInstanceState, new AbstractC0017a() { // from class: com.google.android.gms.dynamic.a.2
            @Override // com.google.android.gms.dynamic.a.AbstractC0017a
            public void b(LifecycleDelegate lifecycleDelegate) {
                a.this.ss.onInflate(activity, attrs, savedInstanceState);
            }

            @Override // com.google.android.gms.dynamic.a.AbstractC0017a
            public int getState() {
                return 0;
            }
        });
    }

    public void onLowMemory() {
        if (this.ss != null) {
            this.ss.onLowMemory();
        }
    }

    public void onPause() {
        if (this.ss != null) {
            this.ss.onPause();
        } else {
            ay(3);
        }
    }

    public void onResume() {
        a((Bundle) null, new AbstractC0017a() { // from class: com.google.android.gms.dynamic.a.6
            @Override // com.google.android.gms.dynamic.a.AbstractC0017a
            public void b(LifecycleDelegate lifecycleDelegate) {
                a.this.ss.onResume();
            }

            @Override // com.google.android.gms.dynamic.a.AbstractC0017a
            public int getState() {
                return 3;
            }
        });
    }

    public void onSaveInstanceState(Bundle outState) {
        if (this.ss != null) {
            this.ss.onSaveInstanceState(outState);
        } else if (this.st == null) {
        } else {
            outState.putAll(this.st);
        }
    }
}
