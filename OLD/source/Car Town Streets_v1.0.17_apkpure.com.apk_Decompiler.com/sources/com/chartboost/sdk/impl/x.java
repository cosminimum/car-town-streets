package com.chartboost.sdk.impl;

import com.getjar.sdk.comm.auth.AuthMetadataUtility;
import java.nio.ByteOrder;
import java.util.logging.Level;
import java.util.logging.Logger;

public class x extends ag {
    static final Logger a = Logger.getLogger("com.mongodb");
    static final boolean b = Boolean.getBoolean("DEBUG.MONGO");
    public static final ByteOrder c = ByteOrder.LITTLE_ENDIAN;
    static final int d = Integer.parseInt(System.getProperty("MONGO.POOLSIZE", AuthMetadataUtility.SDK_LEVEL));
    static final ay e = new ay(-1, -1, -1);

    static {
        if (a.getLevel() == null) {
            if (b) {
                a.setLevel(Level.ALL);
            } else {
                a.setLevel(Level.WARNING);
            }
        }
    }
}
