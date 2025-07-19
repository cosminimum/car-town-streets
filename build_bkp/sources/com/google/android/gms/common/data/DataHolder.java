package com.google.android.gms.common.data;

import android.content.ContentValues;
import android.database.AbstractWindowedCursor;
import android.database.CharArrayBuffer;
import android.database.CursorIndexOutOfBoundsException;
import android.database.CursorWindow;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.util.Log;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1066ds;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1102eg;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

public class DataHolder implements SafeParcelable {
    public static final DataHolderCreator CREATOR = new DataHolderCreator();

    /* renamed from: nS */
    private static final Builder f1367nS = new Builder(new String[0], (String) null) {
        public Builder withRow(ContentValues values) {
            throw new UnsupportedOperationException("Cannot add data to empty builder");
        }

        public Builder withRow(HashMap<String, Object> hashMap) {
            throw new UnsupportedOperationException("Cannot add data to empty builder");
        }
    };

    /* renamed from: kg */
    private final int f1368kg;

    /* renamed from: mC */
    private final int f1369mC;
    boolean mClosed;

    /* renamed from: nK */
    private final String[] f1370nK;

    /* renamed from: nL */
    Bundle f1371nL;

    /* renamed from: nM */
    private final CursorWindow[] f1372nM;

    /* renamed from: nN */
    private final Bundle f1373nN;

    /* renamed from: nO */
    int[] f1374nO;

    /* renamed from: nP */
    int f1375nP;

    /* renamed from: nQ */
    private Object f1376nQ;

    /* renamed from: nR */
    private boolean f1377nR;

    public static class Builder {
        /* access modifiers changed from: private */

        /* renamed from: nK */
        public final String[] f1378nK;
        /* access modifiers changed from: private */

        /* renamed from: nT */
        public final ArrayList<HashMap<String, Object>> f1379nT;

        /* renamed from: nU */
        private final String f1380nU;

        /* renamed from: nV */
        private final HashMap<Object, Integer> f1381nV;

        /* renamed from: nW */
        private boolean f1382nW;

        /* renamed from: nX */
        private String f1383nX;

        private Builder(String[] columns, String uniqueColumn) {
            this.f1378nK = (String[]) C1102eg.m2616f(columns);
            this.f1379nT = new ArrayList<>();
            this.f1380nU = uniqueColumn;
            this.f1381nV = new HashMap<>();
            this.f1382nW = false;
            this.f1383nX = null;
        }

        /* renamed from: a */
        private void m1299a(HashMap<String, Object> hashMap) {
            Object obj = hashMap.get(this.f1380nU);
            if (obj != null) {
                Integer remove = this.f1381nV.remove(obj);
                if (remove != null) {
                    this.f1379nT.remove(remove.intValue());
                }
                this.f1381nV.put(obj, Integer.valueOf(this.f1379nT.size()));
            }
        }

        /* renamed from: bx */
        private void m1302bx() {
            if (this.f1380nU != null) {
                this.f1381nV.clear();
                int size = this.f1379nT.size();
                for (int i = 0; i < size; i++) {
                    Object obj = this.f1379nT.get(i).get(this.f1380nU);
                    if (obj != null) {
                        this.f1381nV.put(obj, Integer.valueOf(i));
                    }
                }
            }
        }

        public DataHolder build(int statusCode) {
            return new DataHolder(this, statusCode, (Bundle) null);
        }

        public DataHolder build(int statusCode, Bundle metadata) {
            return new DataHolder(this, statusCode, metadata, -1);
        }

        public DataHolder build(int statusCode, Bundle metadata, int maxResults) {
            return new DataHolder(this, statusCode, metadata, maxResults);
        }

        public int getCount() {
            return this.f1379nT.size();
        }

        public Builder removeRowsWithValue(String column, Object value) {
            for (int size = this.f1379nT.size() - 1; size >= 0; size--) {
                if (C1098ee.equal(this.f1379nT.get(size).get(column), value)) {
                    this.f1379nT.remove(size);
                }
            }
            return this;
        }

        public Builder sort(String sortColumn) {
            C1066ds.m2458d(sortColumn);
            if (!this.f1382nW || !sortColumn.equals(this.f1383nX)) {
                Collections.sort(this.f1379nT, new C0661a(sortColumn));
                m1302bx();
                this.f1382nW = true;
                this.f1383nX = sortColumn;
            }
            return this;
        }

        public Builder withRow(ContentValues values) {
            C1066ds.m2458d(values);
            HashMap hashMap = new HashMap(values.size());
            for (Map.Entry next : values.valueSet()) {
                hashMap.put(next.getKey(), next.getValue());
            }
            return withRow((HashMap<String, Object>) hashMap);
        }

        public Builder withRow(HashMap<String, Object> row) {
            C1066ds.m2458d(row);
            if (this.f1380nU != null) {
                m1299a(row);
            }
            this.f1379nT.add(row);
            this.f1382nW = false;
            return this;
        }
    }

    /* renamed from: com.google.android.gms.common.data.DataHolder$a */
    private static final class C0661a implements Comparator<HashMap<String, Object>> {

        /* renamed from: nY */
        private final String f1384nY;

        C0661a(String str) {
            this.f1384nY = (String) C1102eg.m2616f(str);
        }

        /* renamed from: a */
        public int compare(HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2) {
            Object f = C1102eg.m2616f(hashMap.get(this.f1384nY));
            Object f2 = C1102eg.m2616f(hashMap2.get(this.f1384nY));
            if (f.equals(f2)) {
                return 0;
            }
            if (f instanceof Boolean) {
                return ((Boolean) f).compareTo((Boolean) f2);
            }
            if (f instanceof Long) {
                return ((Long) f).compareTo((Long) f2);
            }
            if (f instanceof Integer) {
                return ((Integer) f).compareTo((Integer) f2);
            }
            if (f instanceof String) {
                return ((String) f).compareTo((String) f2);
            }
            throw new IllegalArgumentException("Unknown type for lValue " + f);
        }
    }

    DataHolder(int versionCode, String[] columns, CursorWindow[] windows, int statusCode, Bundle metadata) {
        this.mClosed = false;
        this.f1377nR = true;
        this.f1368kg = versionCode;
        this.f1370nK = columns;
        this.f1372nM = windows;
        this.f1369mC = statusCode;
        this.f1373nN = metadata;
    }

    public DataHolder(AbstractWindowedCursor cursor, int statusCode, Bundle metadata) {
        this(cursor.getColumnNames(), m1292a(cursor), statusCode, metadata);
    }

    private DataHolder(Builder builder, int statusCode, Bundle metadata) {
        this(builder.f1378nK, m1293a(builder, -1), statusCode, metadata);
    }

    private DataHolder(Builder builder, int statusCode, Bundle metadata, int maxResults) {
        this(builder.f1378nK, m1293a(builder, maxResults), statusCode, metadata);
    }

    public DataHolder(String[] columns, CursorWindow[] windows, int statusCode, Bundle metadata) {
        this.mClosed = false;
        this.f1377nR = true;
        this.f1368kg = 1;
        this.f1370nK = (String[]) C1102eg.m2616f(columns);
        this.f1372nM = (CursorWindow[]) C1102eg.m2616f(windows);
        this.f1369mC = statusCode;
        this.f1373nN = metadata;
        validateContents();
    }

    /* JADX INFO: finally extract failed */
    /* renamed from: a */
    private static CursorWindow[] m1292a(AbstractWindowedCursor abstractWindowedCursor) {
        int i;
        ArrayList arrayList = new ArrayList();
        try {
            int count = abstractWindowedCursor.getCount();
            CursorWindow window = abstractWindowedCursor.getWindow();
            if (window == null || window.getStartPosition() != 0) {
                i = 0;
            } else {
                window.acquireReference();
                abstractWindowedCursor.setWindow((CursorWindow) null);
                arrayList.add(window);
                i = window.getNumRows();
            }
            while (i < count && abstractWindowedCursor.moveToPosition(i)) {
                CursorWindow window2 = abstractWindowedCursor.getWindow();
                if (window2 != null) {
                    window2.acquireReference();
                    abstractWindowedCursor.setWindow((CursorWindow) null);
                } else {
                    window2 = new CursorWindow(false);
                    window2.setStartPosition(i);
                    abstractWindowedCursor.fillWindow(i, window2);
                }
                if (window2.getNumRows() == 0) {
                    break;
                }
                arrayList.add(window2);
                i = window2.getNumRows() + window2.getStartPosition();
            }
            abstractWindowedCursor.close();
            return (CursorWindow[]) arrayList.toArray(new CursorWindow[arrayList.size()]);
        } catch (Throwable th) {
            abstractWindowedCursor.close();
            throw th;
        }
    }

    /* renamed from: a */
    private static CursorWindow[] m1293a(Builder builder, int i) {
        int i2;
        int i3;
        int i4;
        CursorWindow cursorWindow;
        if (builder.f1378nK.length == 0) {
            return new CursorWindow[0];
        }
        ArrayList b = (i < 0 || i >= builder.f1379nT.size()) ? builder.f1379nT : builder.f1379nT.subList(0, i);
        int size = b.size();
        CursorWindow cursorWindow2 = new CursorWindow(false);
        ArrayList arrayList = new ArrayList();
        arrayList.add(cursorWindow2);
        cursorWindow2.setNumColumns(builder.f1378nK.length);
        int i5 = 0;
        int i6 = 0;
        while (i5 < size) {
            try {
                if (!cursorWindow2.allocRow()) {
                    Log.d("DataHolder", "Allocating additional cursor window for large data set (row " + i5 + ")");
                    cursorWindow2 = new CursorWindow(false);
                    cursorWindow2.setStartPosition(i5);
                    cursorWindow2.setNumColumns(builder.f1378nK.length);
                    arrayList.add(cursorWindow2);
                    if (!cursorWindow2.allocRow()) {
                        Log.e("DataHolder", "Unable to allocate row to hold data.");
                        arrayList.remove(cursorWindow2);
                        return (CursorWindow[]) arrayList.toArray(new CursorWindow[arrayList.size()]);
                    }
                    i2 = 0;
                } else {
                    i2 = i6;
                }
                Map map = (Map) b.get(i5);
                boolean z = true;
                for (int i7 = 0; i7 < builder.f1378nK.length && z; i7++) {
                    String str = builder.f1378nK[i7];
                    Object obj = map.get(str);
                    if (obj == null) {
                        z = cursorWindow2.putNull(i2, i7);
                    } else if (obj instanceof String) {
                        z = cursorWindow2.putString((String) obj, i2, i7);
                    } else if (obj instanceof Long) {
                        z = cursorWindow2.putLong(((Long) obj).longValue(), i2, i7);
                    } else if (obj instanceof Integer) {
                        z = cursorWindow2.putLong((long) ((Integer) obj).intValue(), i2, i7);
                    } else if (obj instanceof Boolean) {
                        z = cursorWindow2.putLong(((Boolean) obj).booleanValue() ? 1 : 0, i2, i7);
                    } else if (obj instanceof byte[]) {
                        z = cursorWindow2.putBlob((byte[]) obj, i2, i7);
                    } else {
                        throw new IllegalArgumentException("Unsupported object for column " + str + ": " + obj);
                    }
                }
                if (!z) {
                    Log.d("DataHolder", "Couldn't populate window data for row " + i5 + " - allocating new window.");
                    cursorWindow2.freeLastRow();
                    CursorWindow cursorWindow3 = new CursorWindow(false);
                    cursorWindow3.setNumColumns(builder.f1378nK.length);
                    arrayList.add(cursorWindow3);
                    i4 = i5 - 1;
                    cursorWindow = cursorWindow3;
                    i3 = 0;
                } else {
                    i3 = i2 + 1;
                    i4 = i5;
                    cursorWindow = cursorWindow2;
                }
                cursorWindow2 = cursorWindow;
                i5 = i4 + 1;
                i6 = i3;
            } catch (RuntimeException e) {
                RuntimeException runtimeException = e;
                int size2 = arrayList.size();
                for (int i8 = 0; i8 < size2; i8++) {
                    ((CursorWindow) arrayList.get(i8)).close();
                }
                throw runtimeException;
            }
        }
        return (CursorWindow[]) arrayList.toArray(new CursorWindow[arrayList.size()]);
    }

    /* renamed from: b */
    private void m1294b(String str, int i) {
        if (this.f1371nL == null || !this.f1371nL.containsKey(str)) {
            throw new IllegalArgumentException("No such column: " + str);
        } else if (isClosed()) {
            throw new IllegalArgumentException("Buffer is closed.");
        } else if (i < 0 || i >= this.f1375nP) {
            throw new CursorIndexOutOfBoundsException(i, this.f1375nP);
        }
    }

    public static Builder builder(String[] columns) {
        return new Builder(columns, (String) null);
    }

    public static Builder builder(String[] columns, String uniqueColumn) {
        C1102eg.m2616f(uniqueColumn);
        return new Builder(columns, uniqueColumn);
    }

    public static DataHolder empty(int statusCode) {
        return empty(statusCode, (Bundle) null);
    }

    public static DataHolder empty(int statusCode, Bundle metadata) {
        return new DataHolder(f1367nS, statusCode, metadata);
    }

    /* renamed from: C */
    public int mo5935C(int i) {
        int i2 = 0;
        C1102eg.m2617p(i >= 0 && i < this.f1375nP);
        while (true) {
            if (i2 >= this.f1374nO.length) {
                break;
            } else if (i < this.f1374nO[i2]) {
                i2--;
                break;
            } else {
                i2++;
            }
        }
        return i2 == this.f1374nO.length ? i2 - 1 : i2;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: bv */
    public String[] mo5936bv() {
        return this.f1370nK;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: bw */
    public CursorWindow[] mo5937bw() {
        return this.f1372nM;
    }

    /* renamed from: c */
    public void mo5938c(Object obj) {
        this.f1376nQ = obj;
    }

    public void close() {
        synchronized (this) {
            if (!this.mClosed) {
                this.mClosed = true;
                for (CursorWindow close : this.f1372nM) {
                    close.close();
                }
            }
        }
    }

    public void copyToBuffer(String column, int row, int windowIndex, CharArrayBuffer dataOut) {
        m1294b(column, row);
        this.f1372nM[windowIndex].copyStringToBuffer(row, this.f1371nL.getInt(column), dataOut);
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        try {
            if (this.f1377nR && this.f1372nM.length > 0 && !isClosed()) {
                Log.e("DataBuffer", "Internal data leak within a DataBuffer object detected!  Be sure to explicitly call close() on all DataBuffer extending objects when you are done with them. (" + (this.f1376nQ == null ? "internal object: " + toString() : this.f1376nQ.toString()) + ")");
                close();
            }
        } finally {
            super.finalize();
        }
    }

    public boolean getBoolean(String column, int row, int windowIndex) {
        m1294b(column, row);
        return Long.valueOf(this.f1372nM[windowIndex].getLong(row, this.f1371nL.getInt(column))).longValue() == 1;
    }

    public byte[] getByteArray(String column, int row, int windowIndex) {
        m1294b(column, row);
        return this.f1372nM[windowIndex].getBlob(row, this.f1371nL.getInt(column));
    }

    public int getCount() {
        return this.f1375nP;
    }

    public int getInteger(String column, int row, int windowIndex) {
        m1294b(column, row);
        return this.f1372nM[windowIndex].getInt(row, this.f1371nL.getInt(column));
    }

    public long getLong(String column, int row, int windowIndex) {
        m1294b(column, row);
        return this.f1372nM[windowIndex].getLong(row, this.f1371nL.getInt(column));
    }

    public Bundle getMetadata() {
        return this.f1373nN;
    }

    public int getStatusCode() {
        return this.f1369mC;
    }

    public String getString(String column, int row, int windowIndex) {
        m1294b(column, row);
        return this.f1372nM[windowIndex].getString(row, this.f1371nL.getInt(column));
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f1368kg;
    }

    public boolean hasColumn(String column) {
        return this.f1371nL.containsKey(column);
    }

    public boolean hasNull(String column, int row, int windowIndex) {
        m1294b(column, row);
        return this.f1372nM[windowIndex].isNull(row, this.f1371nL.getInt(column));
    }

    public boolean isClosed() {
        boolean z;
        synchronized (this) {
            z = this.mClosed;
        }
        return z;
    }

    public Uri parseUri(String column, int row, int windowIndex) {
        String string = getString(column, row, windowIndex);
        if (string == null) {
            return null;
        }
        return Uri.parse(string);
    }

    public void validateContents() {
        this.f1371nL = new Bundle();
        for (int i = 0; i < this.f1370nK.length; i++) {
            this.f1371nL.putInt(this.f1370nK[i], i);
        }
        this.f1374nO = new int[this.f1372nM.length];
        int i2 = 0;
        for (int i3 = 0; i3 < this.f1372nM.length; i3++) {
            this.f1374nO[i3] = i2;
            i2 += this.f1372nM[i3].getNumRows() - (i2 - this.f1372nM[i3].getStartPosition());
        }
        this.f1375nP = i2;
    }

    public void writeToParcel(Parcel dest, int flags) {
        DataHolderCreator.m1304a(this, dest, flags);
    }
}
