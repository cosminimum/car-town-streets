package android.support.v4.os;

import android.os.Parcel;
/* loaded from: classes.dex */
public interface ParcelableCompatCreatorCallbacks<T> {
    /* renamed from: createFromParcel */
    T mo11createFromParcel(Parcel parcel, ClassLoader classLoader);

    /* renamed from: newArray */
    T[] mo12newArray(int i);
}
