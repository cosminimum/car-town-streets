package com.google.android.gms.common.data;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class DataBufferUtils {
    private DataBufferUtils() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <T, E extends Freezable<T>> ArrayList<T> freezeAndClose(DataBuffer<E> buffer) {
        ArrayList<T> arrayList = (ArrayList<T>) new ArrayList(buffer.getCount());
        try {
            Iterator<E> it = buffer.iterator();
            while (it.hasNext()) {
                arrayList.add(it.next().mo358freeze());
            }
            return arrayList;
        } finally {
            buffer.close();
        }
    }

    public static boolean hasNextPage(DataBuffer<?> buffer) {
        Bundle metadata = buffer.getMetadata();
        return (metadata == null || metadata.getString("next_page_token") == null) ? false : true;
    }

    public static boolean hasPrevPage(DataBuffer<?> buffer) {
        Bundle metadata = buffer.getMetadata();
        return (metadata == null || metadata.getString("prev_page_token") == null) ? false : true;
    }
}
