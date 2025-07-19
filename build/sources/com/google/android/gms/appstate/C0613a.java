package com.google.android.gms.appstate;

import com.google.android.gms.internal.C1098ee;

/* renamed from: com.google.android.gms.appstate.a */
public final class C0613a implements AppState {

    /* renamed from: jI */
    private final int f1184jI;

    /* renamed from: jJ */
    private final String f1185jJ;

    /* renamed from: jK */
    private final byte[] f1186jK;

    /* renamed from: jL */
    private final boolean f1187jL;

    /* renamed from: jM */
    private final String f1188jM;

    /* renamed from: jN */
    private final byte[] f1189jN;

    public C0613a(AppState appState) {
        this.f1184jI = appState.getKey();
        this.f1185jJ = appState.getLocalVersion();
        this.f1186jK = appState.getLocalData();
        this.f1187jL = appState.hasConflict();
        this.f1188jM = appState.getConflictVersion();
        this.f1189jN = appState.getConflictData();
    }

    /* renamed from: a */
    static int m1137a(AppState appState) {
        return C1098ee.hashCode(Integer.valueOf(appState.getKey()), appState.getLocalVersion(), appState.getLocalData(), Boolean.valueOf(appState.hasConflict()), appState.getConflictVersion(), appState.getConflictData());
    }

    /* renamed from: a */
    static boolean m1138a(AppState appState, Object obj) {
        if (!(obj instanceof AppState)) {
            return false;
        }
        if (appState == obj) {
            return true;
        }
        AppState appState2 = (AppState) obj;
        return C1098ee.equal(Integer.valueOf(appState2.getKey()), Integer.valueOf(appState.getKey())) && C1098ee.equal(appState2.getLocalVersion(), appState.getLocalVersion()) && C1098ee.equal(appState2.getLocalData(), appState.getLocalData()) && C1098ee.equal(Boolean.valueOf(appState2.hasConflict()), Boolean.valueOf(appState.hasConflict())) && C1098ee.equal(appState2.getConflictVersion(), appState.getConflictVersion()) && C1098ee.equal(appState2.getConflictData(), appState.getConflictData());
    }

    /* renamed from: b */
    static String m1139b(AppState appState) {
        return C1098ee.m2604e(appState).mo7535a("Key", Integer.valueOf(appState.getKey())).mo7535a("LocalVersion", appState.getLocalVersion()).mo7535a("LocalData", appState.getLocalData()).mo7535a("HasConflict", Boolean.valueOf(appState.hasConflict())).mo7535a("ConflictVersion", appState.getConflictVersion()).mo7535a("ConflictData", appState.getConflictData()).toString();
    }

    /* renamed from: aK */
    public AppState freeze() {
        return this;
    }

    public boolean equals(Object obj) {
        return m1138a(this, obj);
    }

    public byte[] getConflictData() {
        return this.f1189jN;
    }

    public String getConflictVersion() {
        return this.f1188jM;
    }

    public int getKey() {
        return this.f1184jI;
    }

    public byte[] getLocalData() {
        return this.f1186jK;
    }

    public String getLocalVersion() {
        return this.f1185jJ;
    }

    public boolean hasConflict() {
        return this.f1187jL;
    }

    public int hashCode() {
        return m1137a(this);
    }

    public boolean isDataValid() {
        return true;
    }

    public String toString() {
        return m1139b(this);
    }
}
