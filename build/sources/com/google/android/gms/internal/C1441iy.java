package com.google.android.gms.internal;

import java.io.IOException;

/* renamed from: com.google.android.gms.internal.iy */
public class C1441iy extends IOException {
    public C1441iy(String str) {
        super(str);
    }

    /* renamed from: gg */
    static C1441iy m3977gg() {
        return new C1441iy("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either than the input has been truncated or that an embedded message misreported its own length.");
    }

    /* renamed from: gh */
    static C1441iy m3978gh() {
        return new C1441iy("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
    }

    /* renamed from: gi */
    static C1441iy m3979gi() {
        return new C1441iy("CodedInputStream encountered a malformed varint.");
    }

    /* renamed from: gj */
    static C1441iy m3980gj() {
        return new C1441iy("Protocol message contained an invalid tag (zero).");
    }

    /* renamed from: gk */
    static C1441iy m3981gk() {
        return new C1441iy("Protocol message end-group tag did not match expected tag.");
    }

    /* renamed from: gl */
    static C1441iy m3982gl() {
        return new C1441iy("Protocol message tag had invalid wire type.");
    }
}
