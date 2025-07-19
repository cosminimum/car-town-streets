package com.google.tagmanager.protobuf;

import com.google.tagmanager.protobuf.ByteString;
import java.util.Iterator;
import java.util.NoSuchElementException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class BoundedByteString extends LiteralByteString {
    private final int bytesLength;
    private final int bytesOffset;

    /* JADX INFO: Access modifiers changed from: package-private */
    public BoundedByteString(byte[] bytes, int offset, int length) {
        super(bytes);
        if (offset < 0) {
            throw new IllegalArgumentException("Offset too small: " + offset);
        }
        if (length < 0) {
            throw new IllegalArgumentException("Length too small: " + offset);
        }
        if (offset + length > bytes.length) {
            throw new IllegalArgumentException("Offset+Length too large: " + offset + "+" + length);
        }
        this.bytesOffset = offset;
        this.bytesLength = length;
    }

    @Override // com.google.tagmanager.protobuf.LiteralByteString, com.google.tagmanager.protobuf.ByteString
    public byte byteAt(int index) {
        if (index < 0) {
            throw new ArrayIndexOutOfBoundsException("Index too small: " + index);
        }
        if (index >= size()) {
            throw new ArrayIndexOutOfBoundsException("Index too large: " + index + ", " + size());
        }
        return this.bytes[this.bytesOffset + index];
    }

    @Override // com.google.tagmanager.protobuf.LiteralByteString, com.google.tagmanager.protobuf.ByteString
    public int size() {
        return this.bytesLength;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.tagmanager.protobuf.LiteralByteString
    public int getOffsetIntoBytes() {
        return this.bytesOffset;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.tagmanager.protobuf.LiteralByteString, com.google.tagmanager.protobuf.ByteString
    public void copyToInternal(byte[] target, int sourceOffset, int targetOffset, int numberToCopy) {
        System.arraycopy(this.bytes, getOffsetIntoBytes() + sourceOffset, target, targetOffset, numberToCopy);
    }

    @Override // com.google.tagmanager.protobuf.LiteralByteString, com.google.tagmanager.protobuf.ByteString, java.lang.Iterable
    /* renamed from: iterator */
    public Iterator<Byte> iterator2() {
        return new BoundedByteIterator();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class BoundedByteIterator implements ByteString.ByteIterator {
        private final int limit;
        private int position;

        private BoundedByteIterator() {
            this.position = BoundedByteString.this.getOffsetIntoBytes();
            this.limit = this.position + BoundedByteString.this.size();
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.position < this.limit;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.Iterator
        /* renamed from: next */
        public Byte mo443next() {
            return Byte.valueOf(nextByte());
        }

        @Override // com.google.tagmanager.protobuf.ByteString.ByteIterator
        public byte nextByte() {
            if (this.position >= this.limit) {
                throw new NoSuchElementException();
            }
            byte[] bArr = BoundedByteString.this.bytes;
            int i = this.position;
            this.position = i + 1;
            return bArr[i];
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }
}
