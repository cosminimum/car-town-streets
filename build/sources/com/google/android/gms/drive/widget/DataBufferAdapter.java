package com.google.android.gms.drive.widget;

import android.content.Context;
import android.database.CursorIndexOutOfBoundsException;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.google.android.gms.common.data.DataBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class DataBufferAdapter<T> extends BaseAdapter {
    private final Context mContext;

    /* renamed from: sm */
    private final int f1603sm;

    /* renamed from: sn */
    private int f1604sn;

    /* renamed from: so */
    private final int f1605so;

    /* renamed from: sp */
    private final List<DataBuffer<T>> f1606sp;

    /* renamed from: sq */
    private final LayoutInflater f1607sq;

    /* renamed from: sr */
    private boolean f1608sr;

    public DataBufferAdapter(Context context, int resource) {
        this(context, resource, 0, new ArrayList());
    }

    public DataBufferAdapter(Context context, int resource, int textViewResourceId) {
        this(context, resource, textViewResourceId, new ArrayList());
    }

    public DataBufferAdapter(Context context, int resource, int textViewResourceId, List<DataBuffer<T>> objects) {
        this.f1608sr = true;
        this.mContext = context;
        this.f1604sn = resource;
        this.f1603sm = resource;
        this.f1605so = textViewResourceId;
        this.f1606sp = objects;
        this.f1607sq = (LayoutInflater) context.getSystemService("layout_inflater");
    }

    public DataBufferAdapter(Context context, int resource, int textViewResourceId, DataBuffer<T>... buffers) {
        this(context, resource, textViewResourceId, Arrays.asList(buffers));
    }

    public DataBufferAdapter(Context context, int resource, List<DataBuffer<T>> objects) {
        this(context, resource, 0, objects);
    }

    public DataBufferAdapter(Context context, int resource, DataBuffer<T>... buffers) {
        this(context, resource, 0, Arrays.asList(buffers));
    }

    /* renamed from: a */
    private View m1678a(int i, View view, ViewGroup viewGroup, int i2) {
        View inflate = view == null ? this.f1607sq.inflate(i2, viewGroup, false) : view;
        try {
            TextView textView = this.f1605so == 0 ? (TextView) inflate : (TextView) inflate.findViewById(this.f1605so);
            Object item = getItem(i);
            if (item instanceof CharSequence) {
                textView.setText((CharSequence) item);
            } else {
                textView.setText(item.toString());
            }
            return inflate;
        } catch (ClassCastException e) {
            Log.e("DataBufferAdapter", "You must supply a resource ID for a TextView");
            throw new IllegalStateException("DataBufferAdapter requires the resource ID to be a TextView", e);
        }
    }

    public void append(DataBuffer<T> buffer) {
        this.f1606sp.add(buffer);
        if (this.f1608sr) {
            notifyDataSetChanged();
        }
    }

    public void clear() {
        for (DataBuffer<T> close : this.f1606sp) {
            close.close();
        }
        this.f1606sp.clear();
        if (this.f1608sr) {
            notifyDataSetChanged();
        }
    }

    public Context getContext() {
        return this.mContext;
    }

    public int getCount() {
        int i = 0;
        Iterator<DataBuffer<T>> it = this.f1606sp.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = it.next().getCount() + i2;
        }
    }

    public View getDropDownView(int position, View convertView, ViewGroup parent) {
        return m1678a(position, convertView, parent, this.f1604sn);
    }

    public T getItem(int position) throws CursorIndexOutOfBoundsException {
        int i = position;
        for (DataBuffer next : this.f1606sp) {
            int count = next.getCount();
            if (count <= i) {
                i -= count;
            } else {
                try {
                    return next.get(i);
                } catch (CursorIndexOutOfBoundsException e) {
                    throw new CursorIndexOutOfBoundsException(position, getCount());
                }
            }
        }
        throw new CursorIndexOutOfBoundsException(position, getCount());
    }

    public long getItemId(int position) {
        return (long) position;
    }

    public View getView(int position, View convertView, ViewGroup parent) {
        return m1678a(position, convertView, parent, this.f1603sm);
    }

    public void notifyDataSetChanged() {
        super.notifyDataSetChanged();
        this.f1608sr = true;
    }

    public void setDropDownViewResource(int resource) {
        this.f1604sn = resource;
    }

    public void setNotifyOnChange(boolean notifyOnChange) {
        this.f1608sr = notifyOnChange;
    }
}
