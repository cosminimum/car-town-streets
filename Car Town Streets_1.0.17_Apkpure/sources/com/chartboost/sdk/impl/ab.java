package com.chartboost.sdk.impl;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class ab extends aa {
    private bd<af> a = new bd<>();

    /* JADX INFO: Access modifiers changed from: package-private */
    public void a(Class cls, af afVar) {
        this.a.a(cls, afVar);
    }

    @Override // com.chartboost.sdk.impl.af
    public void a(Object obj, StringBuilder sb) {
        Object a = x.a(obj);
        if (a == null) {
            sb.append(" null ");
            return;
        }
        af afVar = null;
        for (Class<?> cls : bd.a((Class) a.getClass())) {
            afVar = this.a.a(cls);
            if (afVar != null) {
                break;
            }
        }
        if (afVar == null && a.getClass().isArray()) {
            afVar = this.a.a((Object) Object[].class);
        }
        if (afVar == null) {
            throw new RuntimeException("json can't serialize type : " + a.getClass());
        }
        afVar.a(a, sb);
    }
}
