package com.google.tagmanager.protobuf;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public abstract class ByteString implements Iterable<Byte> {
    static final /* synthetic */ boolean $assertionsDisabled;
    static final int CONCATENATE_BY_COPY_SIZE = 128;
    public static final ByteString EMPTY;
    static final int MAX_READ_FROM_CHUNK_SIZE = 8192;
    static final int MIN_READ_FROM_CHUNK_SIZE = 256;

    /* loaded from: classes.dex */
    public interface ByteIterator extends Iterator<Byte> {
        byte nextByte();
    }

    public abstract ByteBuffer asReadOnlyByteBuffer();

    public abstract List<ByteBuffer> asReadOnlyByteBufferList();

    public abstract byte byteAt(int i);

    public abstract void copyTo(ByteBuffer byteBuffer);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract void copyToInternal(byte[] bArr, int i, int i2, int i3);

    public abstract boolean equals(Object obj);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract int getTreeDepth();

    public abstract int hashCode();

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract boolean isBalanced();

    public abstract boolean isValidUtf8();

    @Override // java.lang.Iterable
    /* renamed from: iterator */
    public abstract Iterator<Byte> iterator2();

    public abstract CodedInputStream newCodedInput();

    public abstract InputStream newInput();

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract int partialHash(int i, int i2, int i3);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract int partialIsValidUtf8(int i, int i2, int i3);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract int peekCachedHashCode();

    public abstract int size();

    public abstract ByteString substring(int i, int i2);

    public abstract String toString(String str) throws UnsupportedEncodingException;

    public abstract void writeTo(OutputStream outputStream) throws IOException;

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void writeToInternal(OutputStream outputStream, int i, int i2) throws IOException;

    static {
        $assertionsDisabled = !ByteString.class.desiredAssertionStatus();
        EMPTY = new LiteralByteString(new byte[0]);
    }

    public boolean isEmpty() {
        return size() == 0;
    }

    public ByteString substring(int beginIndex) {
        return substring(beginIndex, size());
    }

    public boolean startsWith(ByteString prefix) {
        return size() >= prefix.size() && substring(0, prefix.size()).equals(prefix);
    }

    public boolean endsWith(ByteString suffix) {
        return size() >= suffix.size() && substring(size() - suffix.size()).equals(suffix);
    }

    public static ByteString copyFrom(byte[] bytes, int offset, int size) {
        byte[] copy = new byte[size];
        System.arraycopy(bytes, offset, copy, 0, size);
        return new LiteralByteString(copy);
    }

    public static ByteString copyFrom(byte[] bytes) {
        return copyFrom(bytes, 0, bytes.length);
    }

    public static ByteString copyFrom(ByteBuffer bytes, int size) {
        byte[] copy = new byte[size];
        bytes.get(copy);
        return new LiteralByteString(copy);
    }

    public static ByteString copyFrom(ByteBuffer bytes) {
        return copyFrom(bytes, bytes.remaining());
    }

    public static ByteString copyFrom(String text, String charsetName) throws UnsupportedEncodingException {
        return new LiteralByteString(text.getBytes(charsetName));
    }

    public static ByteString copyFromUtf8(String text) {
        try {
            return new LiteralByteString(text.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("UTF-8 not supported?", e);
        }
    }

    public static ByteString readFrom(InputStream streamToDrain) throws IOException {
        return readFrom(streamToDrain, 256, 8192);
    }

    public static ByteString readFrom(InputStream streamToDrain, int chunkSize) throws IOException {
        return readFrom(streamToDrain, chunkSize, chunkSize);
    }

    public static ByteString readFrom(InputStream streamToDrain, int minChunkSize, int maxChunkSize) throws IOException {
        Collection<ByteString> results = new ArrayList<>();
        int chunkSize = minChunkSize;
        while (true) {
            ByteString chunk = readChunk(streamToDrain, chunkSize);
            if (chunk != null) {
                results.add(chunk);
                chunkSize = Math.min(chunkSize * 2, maxChunkSize);
            } else {
                return copyFrom(results);
            }
        }
    }

    private static ByteString readChunk(InputStream in, int chunkSize) throws IOException {
        byte[] buf = new byte[chunkSize];
        int bytesRead = 0;
        while (bytesRead < chunkSize) {
            int count = in.read(buf, bytesRead, chunkSize - bytesRead);
            if (count == -1) {
                break;
            }
            bytesRead += count;
        }
        if (bytesRead == 0) {
            return null;
        }
        return copyFrom(buf, 0, bytesRead);
    }

    public ByteString concat(ByteString other) {
        int thisSize = size();
        int otherSize = other.size();
        if (thisSize + otherSize >= 2147483647L) {
            throw new IllegalArgumentException("ByteString would be too long: " + thisSize + "+" + otherSize);
        }
        return RopeByteString.concatenate(this, other);
    }

    public static ByteString copyFrom(Iterable<ByteString> byteStrings) {
        Collection<ByteString> collection;
        if (!(byteStrings instanceof Collection)) {
            collection = new ArrayList<>();
            for (ByteString byteString : byteStrings) {
                collection.add(byteString);
            }
        } else {
            collection = (Collection) byteStrings;
        }
        if (collection.isEmpty()) {
            ByteString result = EMPTY;
            return result;
        }
        ByteString result2 = balancedConcat(collection.iterator(), collection.size());
        return result2;
    }

    private static ByteString balancedConcat(Iterator<ByteString> iterator, int length) {
        if ($assertionsDisabled || length >= 1) {
            if (length == 1) {
                ByteString result = iterator.next();
                return result;
            }
            int halfLength = length >>> 1;
            ByteString left = balancedConcat(iterator, halfLength);
            ByteString right = balancedConcat(iterator, length - halfLength);
            ByteString result2 = left.concat(right);
            return result2;
        }
        throw new AssertionError();
    }

    public void copyTo(byte[] target, int offset) {
        copyTo(target, 0, offset, size());
    }

    public void copyTo(byte[] target, int sourceOffset, int targetOffset, int numberToCopy) {
        if (sourceOffset < 0) {
            throw new IndexOutOfBoundsException("Source offset < 0: " + sourceOffset);
        }
        if (targetOffset < 0) {
            throw new IndexOutOfBoundsException("Target offset < 0: " + targetOffset);
        }
        if (numberToCopy < 0) {
            throw new IndexOutOfBoundsException("Length < 0: " + numberToCopy);
        }
        if (sourceOffset + numberToCopy > size()) {
            throw new IndexOutOfBoundsException("Source end offset < 0: " + (sourceOffset + numberToCopy));
        }
        if (targetOffset + numberToCopy > target.length) {
            throw new IndexOutOfBoundsException("Target end offset < 0: " + (targetOffset + numberToCopy));
        }
        if (numberToCopy > 0) {
            copyToInternal(target, sourceOffset, targetOffset, numberToCopy);
        }
    }

    public byte[] toByteArray() {
        int size = size();
        if (size == 0) {
            return Internal.EMPTY_BYTE_ARRAY;
        }
        byte[] result = new byte[size];
        copyToInternal(result, 0, 0, size);
        return result;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void writeTo(OutputStream out, int sourceOffset, int numberToWrite) throws IOException {
        if (sourceOffset < 0) {
            throw new IndexOutOfBoundsException("Source offset < 0: " + sourceOffset);
        }
        if (numberToWrite < 0) {
            throw new IndexOutOfBoundsException("Length < 0: " + numberToWrite);
        }
        if (sourceOffset + numberToWrite > size()) {
            throw new IndexOutOfBoundsException("Source end offset exceeded: " + (sourceOffset + numberToWrite));
        }
        if (numberToWrite > 0) {
            writeToInternal(out, sourceOffset, numberToWrite);
        }
    }

    public String toStringUtf8() {
        try {
            return toString("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("UTF-8 not supported?", e);
        }
    }

    public static Output newOutput(int initialCapacity) {
        return new Output(initialCapacity);
    }

    public static Output newOutput() {
        return new Output(128);
    }

    /* loaded from: classes.dex */
    public static final class Output extends OutputStream {
        private static final byte[] EMPTY_BYTE_ARRAY = new byte[0];
        private byte[] buffer;
        private int bufferPos;
        private final ArrayList<ByteString> flushedBuffers;
        private int flushedBuffersTotalBytes;
        private final int initialCapacity;

        Output(int initialCapacity) {
            if (initialCapacity < 0) {
                throw new IllegalArgumentException("Buffer size < 0");
            }
            this.initialCapacity = initialCapacity;
            this.flushedBuffers = new ArrayList<>();
            this.buffer = new byte[initialCapacity];
        }

        @Override // java.io.OutputStream
        public synchronized void write(int b) {
            if (this.bufferPos == this.buffer.length) {
                flushFullBuffer(1);
            }
            byte[] bArr = this.buffer;
            int i = this.bufferPos;
            this.bufferPos = i + 1;
            bArr[i] = (byte) b;
        }

        @Override // java.io.OutputStream
        public synchronized void write(byte[] b, int offset, int length) {
            if (length <= this.buffer.length - this.bufferPos) {
                System.arraycopy(b, offset, this.buffer, this.bufferPos, length);
                this.bufferPos += length;
            } else {
                int copySize = this.buffer.length - this.bufferPos;
                System.arraycopy(b, offset, this.buffer, this.bufferPos, copySize);
                int length2 = length - copySize;
                flushFullBuffer(length2);
                System.arraycopy(b, offset + copySize, this.buffer, 0, length2);
                this.bufferPos = length2;
            }
        }

        public synchronized ByteString toByteString() {
            flushLastBuffer();
            return ByteString.copyFrom(this.flushedBuffers);
        }

        public void writeTo(OutputStream out) throws IOException {
            ByteString[] cachedFlushBuffers;
            byte[] cachedBuffer;
            int cachedBufferPos;
            synchronized (this) {
                cachedFlushBuffers = (ByteString[]) this.flushedBuffers.toArray(new ByteString[this.flushedBuffers.size()]);
                cachedBuffer = this.buffer;
                cachedBufferPos = this.bufferPos;
            }
            for (ByteString byteString : cachedFlushBuffers) {
                byteString.writeTo(out);
            }
            byte[] cachedBufferCopy = new byte[cachedBufferPos];
            System.arraycopy(cachedBuffer, 0, cachedBufferCopy, 0, cachedBufferPos);
            out.write(cachedBufferCopy);
        }

        public synchronized int size() {
            return this.flushedBuffersTotalBytes + this.bufferPos;
        }

        public synchronized void reset() {
            this.flushedBuffers.clear();
            this.flushedBuffersTotalBytes = 0;
            this.bufferPos = 0;
        }

        public String toString() {
            return String.format("<ByteString.Output@%s size=%d>", Integer.toHexString(System.identityHashCode(this)), Integer.valueOf(size()));
        }

        private void flushFullBuffer(int minSize) {
            this.flushedBuffers.add(new LiteralByteString(this.buffer));
            this.flushedBuffersTotalBytes += this.buffer.length;
            int newSize = Math.max(this.initialCapacity, Math.max(minSize, this.flushedBuffersTotalBytes >>> 1));
            this.buffer = new byte[newSize];
            this.bufferPos = 0;
        }

        private void flushLastBuffer() {
            if (this.bufferPos < this.buffer.length) {
                if (this.bufferPos > 0) {
                    byte[] bufferCopy = new byte[this.bufferPos];
                    System.arraycopy(this.buffer, 0, bufferCopy, 0, this.bufferPos);
                    this.flushedBuffers.add(new LiteralByteString(bufferCopy));
                }
            } else {
                this.flushedBuffers.add(new LiteralByteString(this.buffer));
                this.buffer = EMPTY_BYTE_ARRAY;
            }
            this.flushedBuffersTotalBytes += this.bufferPos;
            this.bufferPos = 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static CodedBuilder newCodedBuilder(int size) {
        return new CodedBuilder(size);
    }

    /* loaded from: classes.dex */
    static final class CodedBuilder {
        private final byte[] buffer;
        private final CodedOutputStream output;

        private CodedBuilder(int size) {
            this.buffer = new byte[size];
            this.output = CodedOutputStream.newInstance(this.buffer);
        }

        public ByteString build() {
            this.output.checkNoSpaceLeft();
            return new LiteralByteString(this.buffer);
        }

        public CodedOutputStream getCodedOutput() {
            return this.output;
        }
    }

    public String toString() {
        return String.format("<ByteString@%s size=%d>", Integer.toHexString(System.identityHashCode(this)), Integer.valueOf(size()));
    }
}
