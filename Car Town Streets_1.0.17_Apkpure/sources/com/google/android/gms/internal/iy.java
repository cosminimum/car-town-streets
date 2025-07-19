package com.google.android.gms.internal;

import java.io.IOException;
/* loaded from: classes.dex */
public class iy extends IOException {
    public iy(String str) {
        super(str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static iy gg() {
        return new iy("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either than the input has been truncated or that an embedded message misreported its own length.");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static iy gh() {
        return new iy("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static iy gi() {
        return new iy("CodedInputStream encountered a malformed varint.");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static iy gj() {
        return new iy("Protocol message contained an invalid tag (zero).");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static iy gk() {
        return new iy("Protocol message end-group tag did not match expected tag.");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static iy gl() {
        return new iy("Protocol message tag had invalid wire type.");
    }
}
