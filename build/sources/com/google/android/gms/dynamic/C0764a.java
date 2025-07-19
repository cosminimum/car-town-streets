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

/* renamed from: com.google.android.gms.dynamic.a */
public abstract class C0764a<T extends LifecycleDelegate> {
    /* access modifiers changed from: private */

    /* renamed from: ss */
    public T f1609ss;
    /* access modifiers changed from: private */

    /* renamed from: st */
    public Bundle f1610st;
    /* access modifiers changed from: private */

    /* renamed from: su */
    public LinkedList<C0771a> f1611su;

    /* renamed from: sv */
    private final C0776d<T> f1612sv = new C0776d<T>() {
        /* renamed from: a */
        public void mo6399a(T t) {
            LifecycleDelegate unused = C0764a.this.f1609ss = t;
            Iterator it = C0764a.this.f1611su.iterator();
            while (it.hasNext()) {
                ((C0771a) it.next()).mo6400b(C0764a.this.f1609ss);
            }
            C0764a.this.f1611su.clear();
            Bundle unused2 = C0764a.this.f1610st = null;
        }
    };

    /* renamed from: com.google.android.gms.dynamic.a$a */
    private interface C0771a {
        /* renamed from: b */
        void mo6400b(LifecycleDelegate lifecycleDelegate);

        int getState();
    }

    /* renamed from: a */
    private void m1682a(Bundle bundle, C0771a aVar) {
        if (this.f1609ss != null) {
            aVar.mo6400b(this.f1609ss);
            return;
        }
        if (this.f1611su == null) {
            this.f1611su = new LinkedList<>();
        }
        this.f1611su.add(aVar);
        if (bundle != null) {
            if (this.f1610st == null) {
                this.f1610st = (Bundle) bundle.clone();
            } else {
                this.f1610st.putAll(bundle);
            }
        }
        mo6388a(this.f1612sv);
    }

    /* renamed from: ay */
    private void m1683ay(int i) {
        while (!this.f1611su.isEmpty() && this.f1611su.getLast().getState() >= i) {
            this.f1611su.removeLast();
        }
    }

    /* renamed from: a */
    public void mo6387a(FrameLayout frameLayout) {
        final Context context = frameLayout.getContext();
        final int isGooglePlayServicesAvailable = GooglePlayServicesUtil.isGooglePlayServicesAvailable(context);
        String b = GooglePlayServicesUtil.m1233b(context, isGooglePlayServicesAvailable, -1);
        String b2 = GooglePlayServicesUtil.m1232b(context, isGooglePlayServicesAvailable);
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
            button.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    context.startActivity(GooglePlayServicesUtil.m1228a(context, isGooglePlayServicesAvailable, -1));
                }
            });
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public abstract void mo6388a(C0776d<T> dVar);

    /* renamed from: cZ */
    public T mo6389cZ() {
        return this.f1609ss;
    }

    public void onCreate(final Bundle savedInstanceState) {
        m1682a(savedInstanceState, (C0771a) new C0771a() {
            /* renamed from: b */
            public void mo6400b(LifecycleDelegate lifecycleDelegate) {
                C0764a.this.f1609ss.onCreate(savedInstanceState);
            }

            public int getState() {
                return 1;
            }
        });
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        final FrameLayout frameLayout = new FrameLayout(inflater.getContext());
        final LayoutInflater layoutInflater = inflater;
        final ViewGroup viewGroup = container;
        final Bundle bundle = savedInstanceState;
        m1682a(savedInstanceState, (C0771a) new C0771a() {
            /* renamed from: b */
            public void mo6400b(LifecycleDelegate lifecycleDelegate) {
                frameLayout.removeAllViews();
                frameLayout.addView(C0764a.this.f1609ss.onCreateView(layoutInflater, viewGroup, bundle));
            }

            public int getState() {
                return 2;
            }
        });
        if (this.f1609ss == null) {
            mo6387a(frameLayout);
        }
        return frameLayout;
    }

    public void onDestroy() {
        if (this.f1609ss != null) {
            this.f1609ss.onDestroy();
        } else {
            m1683ay(1);
        }
    }

    public void onDestroyView() {
        if (this.f1609ss != null) {
            this.f1609ss.onDestroyView();
        } else {
            m1683ay(2);
        }
    }

    public void onInflate(final Activity activity, final Bundle attrs, final Bundle savedInstanceState) {
        m1682a(savedInstanceState, (C0771a) new C0771a() {
            /* renamed from: b */
            public void mo6400b(LifecycleDelegate lifecycleDelegate) {
                C0764a.this.f1609ss.onInflate(activity, attrs, savedInstanceState);
            }

            public int getState() {
                return 0;
            }
        });
    }

    public void onLowMemory() {
        if (this.f1609ss != null) {
            this.f1609ss.onLowMemory();
        }
    }

    public void onPause() {
        if (this.f1609ss != null) {
            this.f1609ss.onPause();
        } else {
            m1683ay(3);
        }
    }

    public void onResume() {
        m1682a((Bundle) null, (C0771a) new C0771a() {
            /* renamed from: b */
            public void mo6400b(LifecycleDelegate lifecycleDelegate) {
                C0764a.this.f1609ss.onResume();
            }

            public int getState() {
                return 3;
            }
        });
    }

    public void onSaveInstanceState(Bundle outState) {
        if (this.f1609ss != null) {
            this.f1609ss.onSaveInstanceState(outState);
        } else if (this.f1610st != null) {
            outState.putAll(this.f1610st);
        }
    }
}
