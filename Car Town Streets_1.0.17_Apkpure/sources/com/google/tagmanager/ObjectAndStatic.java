package com.google.tagmanager;
/* loaded from: classes.dex */
class ObjectAndStatic<T> {
    private final boolean mIsStatic;
    private final T mObject;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ObjectAndStatic(T object, boolean isStatic) {
        this.mObject = object;
        this.mIsStatic = isStatic;
    }

    public T getObject() {
        return this.mObject;
    }

    public boolean isStatic() {
        return this.mIsStatic;
    }
}
