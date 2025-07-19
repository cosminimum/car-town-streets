package com.google.tagmanager;
/* loaded from: classes.dex */
interface Cache<K, V> {
    V get(K k);

    void put(K k, V v);
}
