package com.flurry.android;

import java.util.List;

final class j implements Runnable {
    private /* synthetic */ List a;

    j(List list) {
        this.a = list;
    }

    public final void run() {
        for (o a2 : this.a) {
            a2.a();
        }
    }
}
