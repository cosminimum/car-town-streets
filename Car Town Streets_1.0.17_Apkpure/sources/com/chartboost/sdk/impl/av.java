package com.chartboost.sdk.impl;
/* loaded from: classes.dex */
public class av extends au {
    final aj b;

    public aj b() {
        return this.b;
    }

    @Override // com.chartboost.sdk.impl.au
    public boolean equals(Object o) {
        if (!(o instanceof av)) {
            return false;
        }
        av avVar = (av) o;
        return this.a.equals(avVar.a) && this.b.equals(avVar.b);
    }

    @Override // com.chartboost.sdk.impl.au
    public int hashCode() {
        return this.a.hashCode() ^ this.b.hashCode();
    }
}
