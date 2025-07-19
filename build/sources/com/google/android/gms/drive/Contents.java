package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class Contents implements SafeParcelable {
    public static final Parcelable.Creator<Contents> CREATOR = new C0681a();

    /* renamed from: kg */
    final int f1427kg;
    private boolean mClosed = false;

    /* renamed from: om */
    final ParcelFileDescriptor f1428om;

    /* renamed from: qE */
    final int f1429qE;

    /* renamed from: qF */
    final int f1430qF;

    /* renamed from: qG */
    final DriveId f1431qG;

    /* renamed from: qH */
    private boolean f1432qH = false;

    /* renamed from: qI */
    private boolean f1433qI = false;

    Contents(int versionCode, ParcelFileDescriptor parcelFileDescriptor, int requestId, int mode, DriveId driveId) {
        this.f1427kg = versionCode;
        this.f1428om = parcelFileDescriptor;
        this.f1429qE = requestId;
        this.f1430qF = mode;
        this.f1431qG = driveId;
    }

    /* renamed from: cJ */
    public int mo6033cJ() {
        return this.f1429qE;
    }

    public void close() {
        this.mClosed = true;
    }

    public int describeContents() {
        return 0;
    }

    public DriveId getDriveId() {
        return this.f1431qG;
    }

    public InputStream getInputStream() {
        if (this.mClosed) {
            throw new IllegalStateException("Contents have been closed, cannot access the input stream.");
        } else if (this.f1430qF != 268435456) {
            throw new IllegalStateException("getInputStream() can only be used with contents opened with MODE_READ_ONLY.");
        } else if (this.f1432qH) {
            throw new IllegalStateException("getInputStream() can only be called once per Contents instance.");
        } else {
            this.f1432qH = true;
            return new FileInputStream(this.f1428om.getFileDescriptor());
        }
    }

    public int getMode() {
        return this.f1430qF;
    }

    public OutputStream getOutputStream() {
        if (this.mClosed) {
            throw new IllegalStateException("Contents have been closed, cannot access the output stream.");
        } else if (this.f1430qF != 536870912) {
            throw new IllegalStateException("getOutputStream() can only be used with contents opened with MODE_WRITE_ONLY.");
        } else if (this.f1433qI) {
            throw new IllegalStateException("getOutputStream() can only be called once per Contents instance.");
        } else {
            this.f1433qI = true;
            return new FileOutputStream(this.f1428om.getFileDescriptor());
        }
    }

    public ParcelFileDescriptor getParcelFileDescriptor() {
        if (!this.mClosed) {
            return this.f1428om;
        }
        throw new IllegalStateException("Contents have been closed, cannot access the output stream.");
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0681a.m1425a(this, dest, flags);
    }
}
