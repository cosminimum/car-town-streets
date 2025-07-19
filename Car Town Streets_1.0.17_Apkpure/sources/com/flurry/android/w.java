package com.flurry.android;

import android.content.Context;
import android.view.View;
import android.widget.LinearLayout;
import com.google.android.gms.games.GamesActivityResultCodes;
import java.util.ArrayList;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class w extends LinearLayout {
    private View a;
    private List b = new ArrayList();
    private boolean c = true;
    private /* synthetic */ CatalogActivity d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
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

    /* JADX INFO: Access modifiers changed from: package-private */
    public final List a(Context context) {
        p pVar;
        p pVar2;
        v vVar;
        u uVar;
        Long l = null;
        ArrayList arrayList = new ArrayList();
        for (int i = 1; i <= 3; i++) {
            arrayList.add("Flurry_Canvas_Hook_" + i);
        }
        pVar = this.d.f;
        if (pVar == null) {
            vVar = null;
        } else {
            pVar2 = this.d.f;
            vVar = pVar2.b;
        }
        if (vVar != null) {
            l = Long.valueOf(vVar.a);
        }
        uVar = this.d.e;
        List<y> a = uVar.a(context, arrayList, l, 1, true);
        for (y yVar : a) {
            yVar.setOnClickListener(this.d);
        }
        return a;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a() {
        this.c = !this.c;
        a(null, this.c);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(List list) {
        a(list, this.c);
    }

    private void a(List list, boolean z) {
        long k;
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
                p a = yVar.a();
                k = this.d.e.k();
                a.a(new f((byte) 3, k));
            }
        }
        refreshDrawableState();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final List b() {
        return this.b;
    }
}
