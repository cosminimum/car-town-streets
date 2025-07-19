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
/* loaded from: classes.dex */
public class DataBufferAdapter<T> extends BaseAdapter {
    private final Context mContext;
    private final int sm;
    private int sn;
    private final int so;
    private final List<DataBuffer<T>> sp;
    private final LayoutInflater sq;
    private boolean sr;

    public DataBufferAdapter(Context context, int resource) {
        this(context, resource, 0, new ArrayList());
    }

    public DataBufferAdapter(Context context, int resource, int textViewResourceId) {
        this(context, resource, textViewResourceId, new ArrayList());
    }

    public DataBufferAdapter(Context context, int resource, int textViewResourceId, List<DataBuffer<T>> objects) {
        this.sr = true;
        this.mContext = context;
        this.sn = resource;
        this.sm = resource;
        this.so = textViewResourceId;
        this.sp = objects;
        this.sq = (LayoutInflater) context.getSystemService("layout_inflater");
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

    private View a(int i, View view, ViewGroup viewGroup, int i2) {
        View inflate = view == null ? this.sq.inflate(i2, viewGroup, false) : view;
        try {
            TextView textView = this.so == 0 ? (TextView) inflate : (TextView) inflate.findViewById(this.so);
            T item = getItem(i);
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
        this.sp.add(buffer);
        if (this.sr) {
            notifyDataSetChanged();
        }
    }

    public void clear() {
        for (DataBuffer<T> dataBuffer : this.sp) {
            dataBuffer.close();
        }
        this.sp.clear();
        if (this.sr) {
            notifyDataSetChanged();
        }
    }

    public Context getContext() {
        return this.mContext;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        int i = 0;
        Iterator<DataBuffer<T>> it = this.sp.iterator();
        while (true) {
            int i2 = i;
            if (it.hasNext()) {
                i = it.next().getCount() + i2;
            } else {
                return i2;
            }
        }
    }

    @Override // android.widget.BaseAdapter, android.widget.SpinnerAdapter
    public View getDropDownView(int position, View convertView, ViewGroup parent) {
        return a(position, convertView, parent, this.sn);
    }

    @Override // android.widget.Adapter
    public T getItem(int position) throws CursorIndexOutOfBoundsException {
        int i = position;
        for (DataBuffer<T> dataBuffer : this.sp) {
            int count = dataBuffer.getCount();
            if (count > i) {
                try {
                    return dataBuffer.mo391get(i);
                } catch (CursorIndexOutOfBoundsException e) {
                    throw new CursorIndexOutOfBoundsException(position, getCount());
                }
            }
            i -= count;
        }
        throw new CursorIndexOutOfBoundsException(position, getCount());
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        return a(position, convertView, parent, this.sm);
    }

    @Override // android.widget.BaseAdapter
    public void notifyDataSetChanged() {
        super.notifyDataSetChanged();
        this.sr = true;
    }

    public void setDropDownViewResource(int resource) {
        this.sn = resource;
    }

    public void setNotifyOnChange(boolean notifyOnChange) {
        this.sr = notifyOnChange;
    }
}
