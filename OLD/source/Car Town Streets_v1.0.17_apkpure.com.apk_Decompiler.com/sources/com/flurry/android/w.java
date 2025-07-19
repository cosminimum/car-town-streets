package com.flurry.android;

import android.content.Context;
import android.view.View;
import android.widget.LinearLayout;
import com.google.android.gms.games.GamesActivityResultCodes;
import java.util.ArrayList;
import java.util.List;

final class w extends LinearLayout {
    private View a;
    private List b = new ArrayList();
    private boolean c = true;
    private /* synthetic */ CatalogActivity d;

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public w(CatalogActivity catalogActivity, Context context) {
        super(context);
        this.d = catalogActivity;
        setOrientation(1);
        setGravity(48);
        this.a = new s(catalogActivity, context);
        this.a.setId(GamesActivityResultCodes.RESULT_SIGN_IN_FAILED);
        this.a.setOnClickListener(catalogActivity);
        a(a(context), this.c);
    }

    /* access modifiers changed from: package-private */
    public final List a(Context context) {
        Long l = null;
        ArrayList arrayList = new ArrayList();
        for (int i = 1; i <= 3; i++) {
            arrayList.add("Flurry_Canvas_Hook_" + i);
        }
        v vVar = this.d.f == null ? null : this.d.f.b;
        if (vVar != null) {
            l = Long.valueOf(vVar.a);
        }
        List<y> a2 = this.d.e.a(context, arrayList, l, 1, true);
        for (y onClickListener : a2) {
            onClickListener.setOnClickListener(this.d);
        }
        return a2;
    }

    /* access modifiers changed from: package-private */
    public final void a() {
        this.c = !this.c;
        a((List) null, this.c);
    }

    /* access modifiers changed from: package-private */
    public final void a(List list) {
        a(list, this.c);
    }

    private void a(List list, boolean z) {
        removeAllViews();
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(0, 0, 0, 0);
        addView(this.a, layoutParams);
        if (list != null) {
            this.b.clear();
            this.b.addAll(list);
        }
        if (z) {
            for (y yVar : this.b) {
                addView(yVar, layoutParams);
                yVar.a().a(new f((byte) 3, this.d.e.k()));
            }
        }
        refreshDrawableState();
    }

    /* access modifiers changed from: package-private */
    public final List b() {
        return this.b;
    }
}
