package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
/* loaded from: classes.dex */
public class Contents implements SafeParcelable {
    public static final Parcelable.Creator<Contents> CREATOR = new a();
    final int kg;
    final ParcelFileDescriptor om;
    final int qE;
    final int qF;
    final DriveId qG;
    private boolean mClosed = false;
    private boolean qH = false;
    private boolean qI = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Contents(int versionCode, ParcelFileDescriptor parcelFileDescriptor, int requestId, int mode, DriveId driveId) {
        this.kg = versionCode;
        this.om = parcelFileDescriptor;
        this.qE = requestId;
        this.qF = mode;
        this.qG = driveId;
    }

    public int cJ() {
        return this.qE;
    }

    public void close() {
        this.mClosed = true;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public DriveId getDriveId() {
        return this.qG;
    }

    public InputStream getInputStream() {
        if (this.mClosed) {
            throw new IllegalStateException("Contents have been closed, cannot access the input stream.");
        }
        if (this.qF != 268435456) {
            throw new IllegalStateException("getInputStream() can only be used with contents opened with MODE_READ_ONLY.");
        }
        if (this.qH) {
            throw new IllegalStateException("getInputStream() can only be called once per Contents instance.");
        }
        this.qH = true;
        return new FileInputStream(this.om.getFileDescriptor());
    }

    public int getMode() {
        return this.qF;
    }

    public OutputStream getOutputStream() {
        if (this.mClosed) {
            throw new IllegalStateException("Contents have been closed, cannot access the output stream.");
        }
        if (this.qF != 536870912) {
            throw new IllegalStateException("getOutputStream() can only be used with contents opened with MODE_WRITE_ONLY.");
        }
        if (this.qI) {
            throw new IllegalStateException("getOutputStream() can only be called once per Contents instance.");
        }
        this.qI = true;
        return new FileOutputStream(this.om.getFileDescriptor());
    }

    public ParcelFileDescriptor getParcelFileDescriptor() {
        if (this.mClosed) {
            throw new IllegalStateException("Contents have been closed, cannot access the output stream.");
        }
        return this.om;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        a.a(this, dest, flags);
    }
}
