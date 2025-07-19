package com.chartboost.sdk.impl;

import com.getjar.sdk.comm.auth.AuthMetadataUtility;
import java.nio.ByteOrder;
import java.util.logging.Level;
import java.util.logging.Logger;

/* renamed from: com.chartboost.sdk.impl.x */
public class C0216x extends C0103ag {

    /* renamed from: a */
    static final Logger f389a = Logger.getLogger("com.mongodb");

    /* renamed from: b */
    static final boolean f390b = Boolean.getBoolean("DEBUG.MONGO");

    /* renamed from: c */
    public static final ByteOrder f391c = ByteOrder.LITTLE_ENDIAN;

    /* renamed from: d */
    static final int f392d = Integer.parseInt(System.getProperty("MONGO.POOLSIZE", AuthMetadataUtility.SDK_LEVEL));

    /* renamed from: e */
    static final C0126ay f393e = new C0126ay(-1, -1, -1);

    static {
        if (f389a.getLevel() == null) {
            if (f390b) {
                f389a.setLevel(Level.ALL);
            } else {
                f389a.setLevel(Level.WARNING);
            }
        }
    }
}
