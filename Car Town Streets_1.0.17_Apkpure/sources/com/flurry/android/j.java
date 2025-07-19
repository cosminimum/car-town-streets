package com.flurry.android;

import java.util.List;
/* loaded from: classes.dex */
final class j implements Runnable {
    private /* synthetic */ List a;

    /* JADX INFO: Access modifiers changed from: package-private */
    public j(List list) {
        this.a = list;
    }

    @Override // java.lang.Runnable
    public final void run() {
        for (o oVar : this.a) {
            oVar.a();
        }
    }
}
