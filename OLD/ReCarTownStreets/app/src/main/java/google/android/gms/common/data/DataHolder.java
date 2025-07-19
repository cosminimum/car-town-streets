package google.android.gms.common.data;

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

public class DataHolder implements SafeParcelable {
    public static final DataHolderCreator CREATOR = new DataHolderCreator();
    private static final Builder nS = new Builder(new String[0], (String) null) {
        public Builder withRow(ContentValues values) {
            throw new UnsupportedOperationException("Cannot add data to empty builder");
        }

        public Builder withRow(HashMap<String, Object> hashMap) {
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

    public static class Builder {
        /* access modifiers changed from: private */
        public final String[] nK;
        /* access modifiers changed from: private */
        public final ArrayList<HashMap<String, Object>> nT;
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
            if (obj != null) {
                Integer remove = this.nV.remove(obj);
                if (remove != null) {
                    this.nT.remove(remove.intValue());
                }
                this.nV.put(obj, Integer.valueOf(this.nT.size()));
            }
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
            HashMap hashMap = new HashMap(values.size());
            for (Map.Entry next : values.valueSet()) {
                hashMap.put(next.getKey(), next.getValue());
            }
            return withRow((HashMap<String, Object>) hashMap);
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

    private static final class a implements Comparator<HashMap<String, Object>> {
        private final String nY;

        a(String str) {
            this.nY = (String) eg.f(str);
        }

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
            if (f instanceof String) {
                return ((String) f).compareTo((String) f2);
            }
            throw new IllegalArgumentException("Unknown type for lValue " + f);
        }
    }

    DataHolder(int versionCode, String[] columns, CursorWindow[] windows, int statusCode, Bundle metadata) {
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

    /* JADX INFO: finally extract failed */
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

    private static CursorWindow[] a(Builder builder, int i) {
        int i2;
        int i3;
        int i4;
        CursorWindow cursorWindow;
        if (builder.nK.length == 0) {
            return new CursorWindow[0];
        }
        ArrayList b = (i < 0 || i >= builder.nT.size()) ? builder.nT : builder.nT.subList(0, i);
        int size = b.size();
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
                Map map = (Map) b.get(i5);
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

    private void b(String str, int i) {
        if (this.nL == null || !this.nL.containsKey(str)) {
            throw new IllegalArgumentException("No such column: " + str);
        } else if (isClosed()) {
            throw new IllegalArgumentException("Buffer is closed.");
        } else if (i < 0 || i >= this.nP) {
            throw new CursorIndexOutOfBoundsException(i, this.nP);
        }
    }

    public static Builder builder(String[] columns) {
        return new Builder(columns, (String) null);
    }

    public static Builder builder(String[] columns, String uniqueColumn) {
        eg.f(uniqueColumn);
        return new Builder(columns, uniqueColumn);
    }

    public static DataHolder empty(int statusCode) {
        return empty(statusCode, (Bundle) null);
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

    /* access modifiers changed from: package-private */
    public String[] bv() {
        return this.nK;
    }

    /* access modifiers changed from: package-private */
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
                for (CursorWindow close : this.nM) {
                    close.close();
                }
            }
        }
    }

    public void copyToBuffer(String column, int row, int windowIndex, CharArrayBuffer dataOut) {
        b(column, row);
        this.nM[windowIndex].copyStringToBuffer(row, this.nL.getInt(column), dataOut);
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
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

    /* access modifiers changed from: package-private */
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

    public void writeToParcel(Parcel dest, int flags) {
        DataHolderCreator.a(this, dest, flags);
    }
}
