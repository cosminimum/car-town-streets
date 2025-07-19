package com.google.tagmanager.protobuf;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

public class LazyStringArrayList extends AbstractList<String> implements LazyStringList, RandomAccess {
    public static final LazyStringList EMPTY = new UnmodifiableLazyStringList(new LazyStringArrayList());
    private final List<Object> list;

    public LazyStringArrayList() {
        this.list = new ArrayList();
    }

    public LazyStringArrayList(LazyStringList from) {
        this.list = new ArrayList(from.size());
        addAll(from);
    }

    public LazyStringArrayList(List<String> from) {
        this.list = new ArrayList(from);
    }

    public String get(int index) {
        Object o = this.list.get(index);
        if (o instanceof String) {
            return (String) o;
        }
        if (o instanceof ByteString) {
            ByteString bs = (ByteString) o;
            String s = bs.toStringUtf8();
            if (!bs.isValidUtf8()) {
                return s;
            }
            this.list.set(index, s);
            return s;
        }
        byte[] ba = (byte[]) o;
        String s2 = Internal.toStringUtf8(ba);
        if (!Internal.isValidUtf8(ba)) {
            return s2;
        }
        this.list.set(index, s2);
        return s2;
    }

    public int size() {
        return this.list.size();
    }

    public String set(int index, String s) {
        return asString(this.list.set(index, s));
    }

    public void add(int index, String element) {
        this.list.add(index, element);
        this.modCount++;
    }

    public boolean addAll(Collection<? extends String> c) {
        return addAll(size(), c);
    }

    public boolean addAll(int index, Collection<? extends String> c) {
        Collection<? extends String> collection;
        if (c instanceof LazyStringList) {
            collection = ((LazyStringList) c).getUnderlyingElements();
        } else {
            collection = c;
        }
        boolean ret = this.list.addAll(index, collection);
        this.modCount++;
        return ret;
    }

    public boolean addAllByteString(Collection<? extends ByteString> values) {
        boolean ret = this.list.addAll(values);
        this.modCount++;
        return ret;
    }

    public boolean addAllByteArray(Collection<byte[]> c) {
        boolean ret = this.list.addAll(c);
        this.modCount++;
        return ret;
    }

    public String remove(int index) {
        Object o = this.list.remove(index);
        this.modCount++;
        return asString(o);
    }

    public void clear() {
        this.list.clear();
        this.modCount++;
    }

    public void add(ByteString element) {
        this.list.add(element);
        this.modCount++;
    }

    public void add(byte[] element) {
        this.list.add(element);
        this.modCount++;
    }

    public ByteString getByteString(int index) {
        Object o = this.list.get(index);
        ByteString b = asByteString(o);
        if (b != o) {
            this.list.set(index, b);
        }
        return b;
    }

    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r2v0, resolved type: java.util.List<java.lang.Object>} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r1v0, resolved type: java.lang.Object} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v0, resolved type: byte[]} */
    /* JADX WARNING: Multi-variable type inference failed */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public byte[] getByteArray(int r4) {
        /*
            r3 = this;
            java.util.List<java.lang.Object> r2 = r3.list
            java.lang.Object r1 = r2.get(r4)
            byte[] r0 = asByteArray(r1)
            if (r0 == r1) goto L_0x0011
            java.util.List<java.lang.Object> r2 = r3.list
            r2.set(r4, r0)
        L_0x0011:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.tagmanager.protobuf.LazyStringArrayList.getByteArray(int):byte[]");
    }

    public void set(int index, ByteString s) {
        this.list.set(index, s);
    }

    public void set(int index, byte[] s) {
        this.list.set(index, s);
    }

    private static String asString(Object o) {
        if (o instanceof String) {
            return (String) o;
        }
        if (o instanceof ByteString) {
            return ((ByteString) o).toStringUtf8();
        }
        return Internal.toStringUtf8((byte[]) o);
    }

    private static ByteString asByteString(Object o) {
        if (o instanceof ByteString) {
            return (ByteString) o;
        }
        if (o instanceof String) {
            return ByteString.copyFromUtf8((String) o);
        }
        return ByteString.copyFrom((byte[]) (byte[]) o);
    }

    /* access modifiers changed from: private */
    public static byte[] asByteArray(Object o) {
        if (o instanceof byte[]) {
            return (byte[]) o;
        }
        if (o instanceof String) {
            return Internal.toByteArray((String) o);
        }
        return ((ByteString) o).toByteArray();
    }

    public List<?> getUnderlyingElements() {
        return Collections.unmodifiableList(this.list);
    }

    public void mergeFrom(LazyStringList other) {
        for (Object o : other.getUnderlyingElements()) {
            if (o instanceof byte[]) {
                byte[] b = (byte[]) o;
                this.list.add(Arrays.copyOf(b, b.length));
            } else {
                this.list.add(o);
            }
        }
    }

    private static class ByteArrayListView extends AbstractList<byte[]> {
        private final List<Object> list;

        ByteArrayListView(List<Object> list2) {
            this.list = list2;
        }

        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r2v0, resolved type: java.util.List<java.lang.Object>} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r1v0, resolved type: java.lang.Object} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v0, resolved type: byte[]} */
        /* JADX WARNING: Multi-variable type inference failed */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public byte[] get(int r4) {
            /*
                r3 = this;
                java.util.List<java.lang.Object> r2 = r3.list
                java.lang.Object r1 = r2.get(r4)
                byte[] r0 = com.google.tagmanager.protobuf.LazyStringArrayList.asByteArray(r1)
                if (r0 == r1) goto L_0x0011
                java.util.List<java.lang.Object> r2 = r3.list
                r2.set(r4, r0)
            L_0x0011:
                return r0
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.tagmanager.protobuf.LazyStringArrayList.ByteArrayListView.get(int):byte[]");
        }

        public int size() {
            return this.list.size();
        }

        public byte[] set(int index, byte[] s) {
            return LazyStringArrayList.asByteArray(this.list.set(index, s));
        }

        public void add(int index, byte[] s) {
            this.list.add(index, s);
            this.modCount++;
        }

        public byte[] remove(int index) {
            Object o = this.list.remove(index);
            this.modCount++;
            return LazyStringArrayList.asByteArray(o);
        }
    }

    public List<byte[]> asByteArrayList() {
        return new ByteArrayListView(this.list);
    }
}
