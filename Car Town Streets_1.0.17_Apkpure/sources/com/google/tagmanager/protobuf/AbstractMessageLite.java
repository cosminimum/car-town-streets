package com.google.tagmanager.protobuf;

import com.google.tagmanager.protobuf.ByteString;
import com.google.tagmanager.protobuf.MessageLite;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
/* loaded from: classes.dex */
public abstract class AbstractMessageLite implements MessageLite {
    protected int memoizedHashCode = 0;

    @Override // com.google.tagmanager.protobuf.MessageLite
    public ByteString toByteString() {
        try {
            ByteString.CodedBuilder out = ByteString.newCodedBuilder(getSerializedSize());
            writeTo(out.getCodedOutput());
            return out.build();
        } catch (IOException e) {
            throw new RuntimeException("Serializing to a ByteString threw an IOException (should never happen).", e);
        }
    }

    @Override // com.google.tagmanager.protobuf.MessageLite
    public byte[] toByteArray() {
        try {
            byte[] result = new byte[getSerializedSize()];
            CodedOutputStream output = CodedOutputStream.newInstance(result);
            writeTo(output);
            output.checkNoSpaceLeft();
            return result;
        } catch (IOException e) {
            throw new RuntimeException("Serializing to a byte array threw an IOException (should never happen).", e);
        }
    }

    @Override // com.google.tagmanager.protobuf.MessageLite
    public void writeTo(OutputStream output) throws IOException {
        int bufferSize = CodedOutputStream.computePreferredBufferSize(getSerializedSize());
        CodedOutputStream codedOutput = CodedOutputStream.newInstance(output, bufferSize);
        writeTo(codedOutput);
        codedOutput.flush();
    }

    @Override // com.google.tagmanager.protobuf.MessageLite
    public void writeDelimitedTo(OutputStream output) throws IOException {
        int serialized = getSerializedSize();
        int bufferSize = CodedOutputStream.computePreferredBufferSize(CodedOutputStream.computeRawVarint32Size(serialized) + serialized);
        CodedOutputStream codedOutput = CodedOutputStream.newInstance(output, bufferSize);
        codedOutput.writeRawVarint32(serialized);
        writeTo(codedOutput);
        codedOutput.flush();
    }

    @Override // com.google.tagmanager.protobuf.MessageLite
    public MutableMessageLite mutableCopy() {
        throw new UnsupportedOperationException("mutableCopy() is not implemented.");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public UninitializedMessageException newUninitializedMessageException() {
        return new UninitializedMessageException(this);
    }

    protected static void checkByteStringIsUtf8(ByteString byteString) throws IllegalArgumentException {
        if (!byteString.isValidUtf8()) {
            throw new IllegalArgumentException("Byte string is not UTF-8.");
        }
    }

    /* loaded from: classes.dex */
    public static abstract class Builder<BuilderType extends Builder> implements MessageLite.Builder {
        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        /* renamed from: clone */
        public abstract BuilderType mo451clone();

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        /* renamed from: mergeFrom */
        public abstract BuilderType mo411mergeFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException;

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        /* renamed from: mergeFrom */
        public BuilderType mo410mergeFrom(CodedInputStream input) throws IOException {
            return mo411mergeFrom(input, ExtensionRegistryLite.getEmptyRegistry());
        }

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        /* renamed from: mergeFrom */
        public BuilderType mo408mergeFrom(ByteString data) throws InvalidProtocolBufferException {
            try {
                CodedInputStream input = data.newCodedInput();
                mo410mergeFrom(input);
                input.checkLastTagWas(0);
                return this;
            } catch (InvalidProtocolBufferException e) {
                throw e;
            } catch (IOException e2) {
                throw new RuntimeException("Reading from a ByteString threw an IOException (should never happen).", e2);
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        /* renamed from: mergeFrom */
        public BuilderType mo409mergeFrom(ByteString data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
            try {
                CodedInputStream input = data.newCodedInput();
                mo411mergeFrom(input, extensionRegistry);
                input.checkLastTagWas(0);
                return this;
            } catch (InvalidProtocolBufferException e) {
                throw e;
            } catch (IOException e2) {
                throw new RuntimeException("Reading from a ByteString threw an IOException (should never happen).", e2);
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        /* renamed from: mergeFrom */
        public BuilderType mo414mergeFrom(byte[] data) throws InvalidProtocolBufferException {
            return mo415mergeFrom(data, 0, data.length);
        }

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        /* renamed from: mergeFrom */
        public BuilderType mo415mergeFrom(byte[] data, int off, int len) throws InvalidProtocolBufferException {
            try {
                CodedInputStream input = CodedInputStream.newInstance(data, off, len);
                mo410mergeFrom(input);
                input.checkLastTagWas(0);
                return this;
            } catch (InvalidProtocolBufferException e) {
                throw e;
            } catch (IOException e2) {
                throw new RuntimeException("Reading from a byte array threw an IOException (should never happen).", e2);
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        /* renamed from: mergeFrom */
        public BuilderType mo417mergeFrom(byte[] data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
            return mo416mergeFrom(data, 0, data.length, extensionRegistry);
        }

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        /* renamed from: mergeFrom */
        public BuilderType mo416mergeFrom(byte[] data, int off, int len, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
            try {
                CodedInputStream input = CodedInputStream.newInstance(data, off, len);
                mo411mergeFrom(input, extensionRegistry);
                input.checkLastTagWas(0);
                return this;
            } catch (InvalidProtocolBufferException e) {
                throw e;
            } catch (IOException e2) {
                throw new RuntimeException("Reading from a byte array threw an IOException (should never happen).", e2);
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        /* renamed from: mergeFrom */
        public BuilderType mo412mergeFrom(InputStream input) throws IOException {
            CodedInputStream codedInput = CodedInputStream.newInstance(input);
            mo410mergeFrom(codedInput);
            codedInput.checkLastTagWas(0);
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        /* renamed from: mergeFrom */
        public BuilderType mo413mergeFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
            CodedInputStream codedInput = CodedInputStream.newInstance(input);
            mo411mergeFrom(codedInput, extensionRegistry);
            codedInput.checkLastTagWas(0);
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes.dex */
        public static final class LimitedInputStream extends FilterInputStream {
            private int limit;

            /* JADX INFO: Access modifiers changed from: package-private */
            public LimitedInputStream(InputStream in, int limit) {
                super(in);
                this.limit = limit;
            }

            @Override // java.io.FilterInputStream, java.io.InputStream
            public int available() throws IOException {
                return Math.min(super.available(), this.limit);
            }

            @Override // java.io.FilterInputStream, java.io.InputStream
            public int read() throws IOException {
                if (this.limit <= 0) {
                    return -1;
                }
                int result = super.read();
                if (result >= 0) {
                    this.limit--;
                    return result;
                }
                return result;
            }

            @Override // java.io.FilterInputStream, java.io.InputStream
            public int read(byte[] b, int off, int len) throws IOException {
                if (this.limit <= 0) {
                    return -1;
                }
                int result = super.read(b, off, Math.min(len, this.limit));
                if (result >= 0) {
                    this.limit -= result;
                    return result;
                }
                return result;
            }

            @Override // java.io.FilterInputStream, java.io.InputStream
            public long skip(long n) throws IOException {
                long result = super.skip(Math.min(n, this.limit));
                if (result >= 0) {
                    this.limit = (int) (this.limit - result);
                }
                return result;
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        public boolean mergeDelimitedFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
            int firstByte = input.read();
            if (firstByte == -1) {
                return false;
            }
            int size = CodedInputStream.readRawVarint32(firstByte, input);
            InputStream limitedInput = new LimitedInputStream(input, size);
            mo413mergeFrom(limitedInput, extensionRegistry);
            return true;
        }

        @Override // com.google.tagmanager.protobuf.MessageLite.Builder
        public boolean mergeDelimitedFrom(InputStream input) throws IOException {
            return mergeDelimitedFrom(input, ExtensionRegistryLite.getEmptyRegistry());
        }

        /* JADX INFO: Access modifiers changed from: protected */
        public static UninitializedMessageException newUninitializedMessageException(MessageLite message) {
            return new UninitializedMessageException(message);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        public static <T> void addAll(Iterable<T> values, Collection<? super T> list) {
            if (values instanceof LazyStringList) {
                checkForNullValues(((LazyStringList) values).getUnderlyingElements());
                list.addAll((Collection) values);
            } else if (values instanceof Collection) {
                checkForNullValues(values);
                list.addAll((Collection) values);
            } else {
                for (T value : values) {
                    if (value == null) {
                        throw new NullPointerException();
                    }
                    list.add(value);
                }
            }
        }

        private static void checkForNullValues(Iterable<?> values) {
            for (Object value : values) {
                if (value == null) {
                    throw new NullPointerException();
                }
            }
        }
    }
}
