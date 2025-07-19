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
import com.google.android.gms.internal.ds;
import com.google.android.gms.internal.ee;
import com.google.android.gms.internal.eg;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class DataHolder implements SafeParcelable {
    public static final DataHolderCreator CREATOR = new DataHolderCreator();
    private static final Builder nS = new Builder(new String[0], null) { // from class: com.google.android.gms.common.data.DataHolder.1
        @Override // com.google.android.gms.common.data.DataHolder.Builder
        public Builder withRow(ContentValues values) {
            throw new UnsupportedOperationException("Cannot add data to empty builder");
        }

        @Override // com.google.android.gms.common.data.DataHolder.Builder
        public Builder withRow(HashMap<String, Object> row) {
            throw new UnsupportedOperationException("Cannot add data to empty builder");
        }
    };
    private final int kg;
    private final int mC;
    boolean mClosed;
    private final String[] nK;
    Bundle nL;
    private final CursorWindow[] nM;
    private final Bundle nN;
    int[] nO;
    int nP;
    private Object nQ;
    private boolean nR;

    /* loaded from: classes.dex */
    public static class Builder {
        private final String[] nK;
        private final ArrayList<HashMap<String, Object>> nT;
        private final String nU;
        private final HashMap<Object, Integer> nV;
        private boolean nW;
        private String nX;

        private Builder(String[] columns, String uniqueColumn) {
            this.nK = (String[]) eg.f(columns);
            this.nT = new ArrayList<>();
            this.nU = uniqueColumn;
            this.nV = new HashMap<>();
            this.nW = false;
            this.nX = null;
        }

        private void a(HashMap<String, Object> hashMap) {
            Object obj = hashMap.get(this.nU);
            if (obj == null) {
                return;
            }
            Integer remove = this.nV.remove(obj);
            if (remove != null) {
                this.nT.remove(remove.intValue());
            }
            this.nV.put(obj, Integer.valueOf(this.nT.size()));
        }

        private void bx() {
            if (this.nU != null) {
                this.nV.clear();
                int size = this.nT.size();
                for (int i = 0; i < size; i++) {
                    Object obj = this.nT.get(i).get(this.nU);
                    if (obj != null) {
                        this.nV.put(obj, Integer.valueOf(i));
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
            return this.nT.size();
        }

        public Builder removeRowsWithValue(String column, Object value) {
            for (int size = this.nT.size() - 1; size >= 0; size--) {
                if (ee.equal(this.nT.get(size).get(column), value)) {
                    this.nT.remove(size);
                }
            }
            return this;
        }

        public Builder sort(String sortColumn) {
            ds.d(sortColumn);
            if (!this.nW || !sortColumn.equals(this.nX)) {
                Collections.sort(this.nT, new a(sortColumn));
                bx();
                this.nW = true;
                this.nX = sortColumn;
            }
            return this;
        }

        public Builder withRow(ContentValues values) {
            ds.d(values);
            HashMap<String, Object> hashMap = new HashMap<>(values.size());
            for (Map.Entry<String, Object> entry : values.valueSet()) {
                hashMap.put(entry.getKey(), entry.getValue());
            }
            return withRow(hashMap);
        }

        public Builder withRow(HashMap<String, Object> row) {
            ds.d(row);
            if (this.nU != null) {
                a(row);
            }
            this.nT.add(row);
            this.nW = false;
            return this;
        }
    }

    /* loaded from: classes.dex */
    private static final class a implements Comparator<HashMap<String, Object>> {
        private final String nY;

        a(String str) {
            this.nY = (String) eg.f(str);
        }

        @Override // java.util.Comparator
        /* renamed from: a */
        public int compare(HashMap<String, Object> hashMap, HashMap<String, Object> hashMap2) {
            Object f = eg.f(hashMap.get(this.nY));
            Object f2 = eg.f(hashMap2.get(this.nY));
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
            if (!(f instanceof String)) {
                throw new IllegalArgumentException("Unknown type for lValue " + f);
            }
            return ((String) f).compareTo((String) f2);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public DataHolder(int versionCode, String[] columns, CursorWindow[] windows, int statusCode, Bundle metadata) {
        this.mClosed = false;
        this.nR = true;
        this.kg = versionCode;
        this.nK = columns;
        this.nM = windows;
        this.mC = statusCode;
        this.nN = metadata;
    }

    public DataHolder(AbstractWindowedCursor cursor, int statusCode, Bundle metadata) {
        this(cursor.getColumnNames(), a(cursor), statusCode, metadata);
    }

    private DataHolder(Builder builder, int statusCode, Bundle metadata) {
        this(builder.nK, a(builder, -1), statusCode, metadata);
    }

    private DataHolder(Builder builder, int statusCode, Bundle metadata, int maxResults) {
        this(builder.nK, a(builder, maxResults), statusCode, metadata);
    }

    public DataHolder(String[] columns, CursorWindow[] windows, int statusCode, Bundle metadata) {
        this.mClosed = false;
        this.nR = true;
        this.kg = 1;
        this.nK = (String[]) eg.f(columns);
        this.nM = (CursorWindow[]) eg.f(windows);
        this.mC = statusCode;
        this.nN = metadata;
        validateContents();
    }

    private static CursorWindow[] a(AbstractWindowedCursor abstractWindowedCursor) {
        int i;
        ArrayList arrayList = new ArrayList();
        try {
            int count = abstractWindowedCursor.getCount();
            CursorWindow window = abstractWindowedCursor.getWindow();
            if (window == null || window.getStartPosition() != 0) {
                i = 0;
            } else {
                window.acquireReference();
                abstractWindowedCursor.setWindow(null);
                arrayList.add(window);
                i = window.getNumRows();
            }
            while (i < count) {
                if (!abstractWindowedCursor.moveToPosition(i)) {
                    break;
                }
                CursorWindow window2 = abstractWindowedCursor.getWindow();
                if (window2 != null) {
                    window2.acquireReference();
                    abstractWindowedCursor.setWindow(null);
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

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v40, types: [java.util.List] */
    private static CursorWindow[] a(Builder builder, int i) {
        int i2;
        int i3;
        int i4;
        CursorWindow cursorWindow;
        if (builder.nK.length == 0) {
            return new CursorWindow[0];
        }
        ArrayList subList = (i < 0 || i >= builder.nT.size()) ? builder.nT : builder.nT.subList(0, i);
        int size = subList.size();
        CursorWindow cursorWindow2 = new CursorWindow(false);
        ArrayList arrayList = new ArrayList();
        arrayList.add(cursorWindow2);
        cursorWindow2.setNumColumns(builder.nK.length);
        int i5 = 0;
        int i6 = 0;
        while (i5 < size) {
            try {
                if (!cursorWindow2.allocRow()) {
                    Log.d("DataHolder", "Allocating additional cursor window for large data set (row " + i5 + ")");
                    cursorWindow2 = new CursorWindow(false);
                    cursorWindow2.setStartPosition(i5);
                    cursorWindow2.setNumColumns(builder.nK.length);
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
                Map map = (Map) subList.get(i5);
                boolean z = true;
                for (int i7 = 0; i7 < builder.nK.length && z; i7++) {
                    String str = builder.nK[i7];
                    Object obj = map.get(str);
                    if (obj == null) {
                        z = cursorWindow2.putNull(i2, i7);
                    } else if (obj instanceof String) {
                        z = cursorWindow2.putString((String) obj, i2, i7);
                    } else if (obj instanceof Long) {
                        z = cursorWindow2.putLong(((Long) obj).longValue(), i2, i7);
                    } else if (obj instanceof Integer) {
                        z = cursorWindow2.putLong(((Integer) obj).intValue(), i2, i7);
                    } else if (obj instanceof Boolean) {
                        z = cursorWindow2.putLong(((Boolean) obj).booleanValue() ? 1L : 0L, i2, i7);
                    } else if (!(obj instanceof byte[])) {
                        throw new IllegalArgumentException("Unsupported object for column " + str + ": " + obj);
                    } else {
                        z = cursorWindow2.putBlob((byte[]) obj, i2, i7);
                    }
                }
                if (!z) {
                    Log.d("DataHolder", "Couldn't populate window data for row " + i5 + " - allocating new window.");
                    cursorWindow2.freeLastRow();
                    CursorWindow cursorWindow3 = new CursorWindow(false);
                    cursorWindow3.setNumColumns(builder.nK.length);
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
                int size2 = arrayList.size();
                for (int i8 = 0; i8 < size2; i8++) {
                    ((CursorWindow) arrayList.get(i8)).close();
                }
                throw e;
            }
        }
        return (CursorWindow[]) arrayList.toArray(new CursorWindow[arrayList.size()]);
    }

    private void b(String str, int i) {
        if (this.nL == null || !this.nL.containsKey(str)) {
            throw new IllegalArgumentException("No such column: " + str);
        }
        if (isClosed()) {
            throw new IllegalArgumentException("Buffer is closed.");
        }
        if (i >= 0 && i < this.nP) {
            return;
        }
        throw new CursorIndexOutOfBoundsException(i, this.nP);
    }

    public static Builder builder(String[] columns) {
        return new Builder(columns, null);
    }

    public static Builder builder(String[] columns, String uniqueColumn) {
        eg.f(uniqueColumn);
        return new Builder(columns, uniqueColumn);
    }

    public static DataHolder empty(int statusCode) {
        return empty(statusCode, null);
    }

    public static DataHolder empty(int statusCode, Bundle metadata) {
        return new DataHolder(nS, statusCode, metadata);
    }

    public int C(int i) {
        int i2 = 0;
        eg.p(i >= 0 && i < this.nP);
        while (true) {
            if (i2 >= this.nO.length) {
                break;
            } else if (i < this.nO[i2]) {
                i2--;
                break;
            } else {
                i2++;
            }
        }
        return i2 == this.nO.length ? i2 - 1 : i2;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String[] bv() {
        return this.nK;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CursorWindow[] bw() {
        return this.nM;
    }

    public void c(Object obj) {
        this.nQ = obj;
    }

    public void close() {
        synchronized (this) {
            if (!this.mClosed) {
                this.mClosed = true;
                for (int i = 0; i < this.nM.length; i++) {
                    this.nM[i].close();
                }
            }
        }
    }

    public void copyToBuffer(String column, int row, int windowIndex, CharArrayBuffer dataOut) {
        b(column, row);
        this.nM[windowIndex].copyStringToBuffer(row, this.nL.getInt(column), dataOut);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    protected void finalize() throws Throwable {
        try {
            if (this.nR && this.nM.length > 0 && !isClosed()) {
                Log.e("DataBuffer", "Internal data leak within a DataBuffer object detected!  Be sure to explicitly call close() on all DataBuffer extending objects when you are done with them. (" + (this.nQ == null ? "internal object: " + toString() : this.nQ.toString()) + ")");
                close();
            }
        } finally {
            super.finalize();
        }
    }

    public boolean getBoolean(String column, int row, int windowIndex) {
        b(column, row);
        return Long.valueOf(this.nM[windowIndex].getLong(row, this.nL.getInt(column))).longValue() == 1;
    }

    public byte[] getByteArray(String column, int row, int windowIndex) {
        b(column, row);
        return this.nM[windowIndex].getBlob(row, this.nL.getInt(column));
    }

    public int getCount() {
        return this.nP;
    }

    public int getInteger(String column, int row, int windowIndex) {
        b(column, row);
        return this.nM[windowIndex].getInt(row, this.nL.getInt(column));
    }

    public long getLong(String column, int row, int windowIndex) {
        b(column, row);
        return this.nM[windowIndex].getLong(row, this.nL.getInt(column));
    }

    public Bundle getMetadata() {
        return this.nN;
    }

    public int getStatusCode() {
        return this.mC;
    }

    public String getString(String column, int row, int windowIndex) {
        b(column, row);
        return this.nM[windowIndex].getString(row, this.nL.getInt(column));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public boolean hasColumn(String column) {
        return this.nL.containsKey(column);
    }

    public boolean hasNull(String column, int row, int windowIndex) {
        b(column, row);
        return this.nM[windowIndex].isNull(row, this.nL.getInt(column));
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
        this.nL = new Bundle();
        for (int i = 0; i < this.nK.length; i++) {
            this.nL.putInt(this.nK[i], i);
        }
        this.nO = new int[this.nM.length];
        int i2 = 0;
        for (int i3 = 0; i3 < this.nM.length; i3++) {
            this.nO[i3] = i2;
            i2 += this.nM[i3].getNumRows() - (i2 - this.nM[i3].getStartPosition());
        }
        this.nP = i2;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        DataHolderCreator.a(this, dest, flags);
    }
}
