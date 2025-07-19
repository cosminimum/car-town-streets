package com.google.tagmanager;
/* loaded from: classes.dex */
interface LoadCallback<T> {

    /* loaded from: classes.dex */
    public enum Failure {
        NOT_AVAILABLE,
        IO_ERROR,
        SERVER_ERROR
    }

    void onFailure(Failure failure);

    void onSuccess(T t);

    void startLoad();
}
