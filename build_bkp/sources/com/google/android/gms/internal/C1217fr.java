package com.google.android.gms.internal;

import android.net.LocalSocket;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import com.google.android.gms.games.multiplayer.realtime.RealTimeSocket;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* renamed from: com.google.android.gms.internal.fr */
final class C1217fr implements RealTimeSocket {

    /* renamed from: om */
    private ParcelFileDescriptor f2833om;

    /* renamed from: uM */
    private final LocalSocket f2834uM;

    /* renamed from: up */
    private final String f2835up;

    C1217fr(LocalSocket localSocket, String str) {
        this.f2834uM = localSocket;
        this.f2835up = str;
    }

    public void close() throws IOException {
        this.f2834uM.close();
    }

    public InputStream getInputStream() throws IOException {
        return this.f2834uM.getInputStream();
    }

    public OutputStream getOutputStream() throws IOException {
        return this.f2834uM.getOutputStream();
    }

    public ParcelFileDescriptor getParcelFileDescriptor() throws IOException {
        if (this.f2833om == null && !isClosed()) {
            Parcel obtain = Parcel.obtain();
            obtain.writeFileDescriptor(this.f2834uM.getFileDescriptor());
            obtain.setDataPosition(0);
            this.f2833om = obtain.readFileDescriptor();
        }
        return this.f2833om;
    }

    public boolean isClosed() {
        return !this.f2834uM.isConnected() && !this.f2834uM.isBound();
    }
}
