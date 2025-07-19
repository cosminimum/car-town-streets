package com.google.android.gms.internal;

import android.net.LocalSocket;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import com.google.android.gms.games.multiplayer.realtime.RealTimeSocket;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
/* loaded from: classes.dex */
final class fr implements RealTimeSocket {
    private ParcelFileDescriptor om;
    private final LocalSocket uM;
    private final String up;

    /* JADX INFO: Access modifiers changed from: package-private */
    public fr(LocalSocket localSocket, String str) {
        this.uM = localSocket;
        this.up = str;
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeSocket
    public void close() throws IOException {
        this.uM.close();
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeSocket
    public InputStream getInputStream() throws IOException {
        return this.uM.getInputStream();
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeSocket
    public OutputStream getOutputStream() throws IOException {
        return this.uM.getOutputStream();
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeSocket
    public ParcelFileDescriptor getParcelFileDescriptor() throws IOException {
        if (this.om == null && !isClosed()) {
            Parcel obtain = Parcel.obtain();
            obtain.writeFileDescriptor(this.uM.getFileDescriptor());
            obtain.setDataPosition(0);
            this.om = obtain.readFileDescriptor();
        }
        return this.om;
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.RealTimeSocket
    public boolean isClosed() {
        return !this.uM.isConnected() && !this.uM.isBound();
    }
}
