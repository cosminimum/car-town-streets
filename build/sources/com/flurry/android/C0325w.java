package com.flurry.android;

import android.content.Context;
import android.view.View;
import android.widget.LinearLayout;
import com.google.android.gms.games.GamesActivityResultCodes;
import java.util.ArrayList;
import java.util.List;

/* renamed from: com.flurry.android.w */
final class C0325w extends LinearLayout {

    /* renamed from: a */
    private View f651a;

    /* renamed from: b */
    private List f652b = new ArrayList();

    /* renamed from: c */
    private boolean f653c = true;

    /* renamed from: d */
    private /* synthetic */ CatalogActivity f654d;

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public C0325w(CatalogActivity catalogActivity, Context context) {
        super(context);
        this.f654d = catalogActivity;
        setOrientation(1);
        setGravity(48);
        this.f651a = new C0321s(catalogActivity, context);
        this.f651a.setId(GamesActivityResultCodes.RESULT_SIGN_IN_FAILED);
        this.f651a.setOnClickListener(catalogActivity);
        m612a(mo2461a(context), this.f653c);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final List mo2461a(Context context) {
        Long l = null;
        ArrayList arrayList = new ArrayList();
        for (int i = 1; i <= 3; i++) {
            arrayList.add("Flurry_Canvas_Hook_" + i);
        }
        C0324v vVar = this.f654d.f417f == null ? null : this.f654d.f417f.f610b;
        if (vVar != null) {
            l = Long.valueOf(vVar.f643a);
        }
        List<C0327y> a = this.f654d.f416e.mo2428a(context, arrayList, l, 1, true);
        for (C0327y onClickListener : a) {
            onClickListener.setOnClickListener(this.f654d);
        }
        return a;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2462a() {
        this.f653c = !this.f653c;
        m612a((List) null, this.f653c);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2463a(List list) {
        m612a(list, this.f653c);
    }

    /* renamed from: a */
    private void m612a(List list, boolean z) {
        removeAllViews();
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(0, 0, 0, 0);
        addView(this.f651a, layoutParams);
        if (list != null) {
            this.f652b.clear();
            this.f652b.addAll(list);
        }
        if (z) {
            for (C0327y yVar : this.f652b) {
                addView(yVar, layoutParams);
                yVar.mo2465a().mo2419a(new C0308f((byte) 3, this.f654d.f416e.mo2453k()));
            }
        }
        refreshDrawableState();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public final List mo2464b() {
        return this.f652b;
    }
}
