package com.chartboost.sdk.impl;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

/* renamed from: com.chartboost.sdk.impl.bh */
public abstract class C0161bh<T> {

    /* renamed from: a */
    final int f231a;

    /* renamed from: b */
    private Queue<T> f232b = new ConcurrentLinkedQueue();

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public abstract T mo1313b();

    public C0161bh(int i) {
        this.f231a = i;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public boolean mo1434a(T t) {
        return true;
    }

    /* renamed from: c */
    public T mo1436c() {
        T poll = this.f232b.poll();
        return poll != null ? poll : mo1313b();
    }

    /* renamed from: b */
    public void mo1435b(T t) {
        if (mo1434a(t) && this.f232b.size() <= this.f231a) {
            this.f232b.add(t);
        }
    }
}
