package com.google.android.gms.common.internal.safeparcel;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.List;

/* renamed from: com.google.android.gms.common.internal.safeparcel.b */
public class C0677b {
    /* renamed from: B */
    private static int m1389B(Parcel parcel, int i) {
        parcel.writeInt(-65536 | i);
        parcel.writeInt(0);
        return parcel.dataPosition();
    }

    /* renamed from: C */
    private static void m1390C(Parcel parcel, int i) {
        int dataPosition = parcel.dataPosition();
        parcel.setDataPosition(i - 4);
        parcel.writeInt(dataPosition - i);
        parcel.setDataPosition(dataPosition);
    }

    /* renamed from: D */
    public static void m1391D(Parcel parcel, int i) {
        m1390C(parcel, i);
    }

    /* renamed from: a */
    public static void m1392a(Parcel parcel, int i, byte b) {
        m1410b(parcel, i, 4);
        parcel.writeInt(b);
    }

    /* renamed from: a */
    public static void m1393a(Parcel parcel, int i, double d) {
        m1410b(parcel, i, 8);
        parcel.writeDouble(d);
    }

    /* renamed from: a */
    public static void m1394a(Parcel parcel, int i, float f) {
        m1410b(parcel, i, 4);
        parcel.writeFloat(f);
    }

    /* renamed from: a */
    public static void m1395a(Parcel parcel, int i, long j) {
        m1410b(parcel, i, 8);
        parcel.writeLong(j);
    }

    /* renamed from: a */
    public static void m1396a(Parcel parcel, int i, Bundle bundle, boolean z) {
        if (bundle != null) {
            int B = m1389B(parcel, i);
            parcel.writeBundle(bundle);
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: a */
    public static void m1397a(Parcel parcel, int i, IBinder iBinder, boolean z) {
        if (iBinder != null) {
            int B = m1389B(parcel, i);
            parcel.writeStrongBinder(iBinder);
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: a */
    public static void m1398a(Parcel parcel, int i, Parcel parcel2, boolean z) {
        if (parcel2 != null) {
            int B = m1389B(parcel, i);
            parcel.appendFrom(parcel2, 0, parcel2.dataSize());
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: a */
    public static void m1399a(Parcel parcel, int i, Parcelable parcelable, int i2, boolean z) {
        if (parcelable != null) {
            int B = m1389B(parcel, i);
            parcelable.writeToParcel(parcel, i2);
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: a */
    public static void m1400a(Parcel parcel, int i, Boolean bool, boolean z) {
        int i2 = 0;
        if (bool != null) {
            m1410b(parcel, i, 4);
            if (bool.booleanValue()) {
                i2 = 1;
            }
            parcel.writeInt(i2);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: a */
    public static void m1401a(Parcel parcel, int i, String str, boolean z) {
        if (str != null) {
            int B = m1389B(parcel, i);
            parcel.writeString(str);
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: a */
    public static void m1402a(Parcel parcel, int i, List<String> list, boolean z) {
        if (list != null) {
            int B = m1389B(parcel, i);
            parcel.writeStringList(list);
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: a */
    public static void m1403a(Parcel parcel, int i, short s) {
        m1410b(parcel, i, 4);
        parcel.writeInt(s);
    }

    /* renamed from: a */
    public static void m1404a(Parcel parcel, int i, boolean z) {
        m1410b(parcel, i, 4);
        parcel.writeInt(z ? 1 : 0);
    }

    /* renamed from: a */
    public static void m1405a(Parcel parcel, int i, byte[] bArr, boolean z) {
        if (bArr != null) {
            int B = m1389B(parcel, i);
            parcel.writeByteArray(bArr);
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: a */
    public static void m1406a(Parcel parcel, int i, float[] fArr, boolean z) {
        if (fArr != null) {
            int B = m1389B(parcel, i);
            parcel.writeFloatArray(fArr);
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: a */
    public static <T extends Parcelable> void m1407a(Parcel parcel, int i, T[] tArr, int i2, boolean z) {
        if (tArr != null) {
            int B = m1389B(parcel, i);
            parcel.writeInt(r3);
            for (T t : tArr) {
                if (t == null) {
                    parcel.writeInt(0);
                } else {
                    m1409a(parcel, t, i2);
                }
            }
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: a */
    public static void m1408a(Parcel parcel, int i, String[] strArr, boolean z) {
        if (strArr != null) {
            int B = m1389B(parcel, i);
            parcel.writeStringArray(strArr);
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: a */
    private static <T extends Parcelable> void m1409a(Parcel parcel, T t, int i) {
        int dataPosition = parcel.dataPosition();
        parcel.writeInt(1);
        int dataPosition2 = parcel.dataPosition();
        t.writeToParcel(parcel, i);
        int dataPosition3 = parcel.dataPosition();
        parcel.setDataPosition(dataPosition);
        parcel.writeInt(dataPosition3 - dataPosition2);
        parcel.setDataPosition(dataPosition3);
    }

    /* renamed from: b */
    private static void m1410b(Parcel parcel, int i, int i2) {
        if (i2 >= 65535) {
            parcel.writeInt(-65536 | i);
            parcel.writeInt(i2);
            return;
        }
        parcel.writeInt((i2 << 16) | i);
    }

    /* renamed from: b */
    public static <T extends Parcelable> void m1411b(Parcel parcel, int i, List<T> list, boolean z) {
        if (list != null) {
            int B = m1389B(parcel, i);
            int size = list.size();
            parcel.writeInt(size);
            for (int i2 = 0; i2 < size; i2++) {
                Parcelable parcelable = (Parcelable) list.get(i2);
                if (parcelable == null) {
                    parcel.writeInt(0);
                } else {
                    m1409a(parcel, parcelable, 0);
                }
            }
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: c */
    public static void m1412c(Parcel parcel, int i, int i2) {
        m1410b(parcel, i, 4);
        parcel.writeInt(i2);
    }

    /* renamed from: c */
    public static void m1413c(Parcel parcel, int i, List list, boolean z) {
        if (list != null) {
            int B = m1389B(parcel, i);
            parcel.writeList(list);
            m1390C(parcel, B);
        } else if (z) {
            m1410b(parcel, i, 0);
        }
    }

    /* renamed from: o */
    public static int m1414o(Parcel parcel) {
        return m1389B(parcel, 20293);
    }
}
