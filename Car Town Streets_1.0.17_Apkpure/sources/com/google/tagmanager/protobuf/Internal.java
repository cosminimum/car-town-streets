package com.google.tagmanager.protobuf;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public class Internal {
    private static final int DEFAULT_BUFFER_SIZE = 4096;
    public static final byte[] EMPTY_BYTE_ARRAY = new byte[0];
    public static final ByteBuffer EMPTY_BYTE_BUFFER = ByteBuffer.wrap(EMPTY_BYTE_ARRAY);

    /* loaded from: classes.dex */
    public interface EnumLite {
        int getNumber();
    }

    /* loaded from: classes.dex */
    public interface EnumLiteMap<T extends EnumLite> {
        /* renamed from: findValueByNumber */
        T mo329findValueByNumber(int i);
    }

    public static String stringDefaultValue(String bytes) {
        try {
            return new String(bytes.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException("Java VM does not support a standard character set.", e);
        }
    }

    public static ByteString bytesDefaultValue(String bytes) {
        try {
            return ByteString.copyFrom(bytes.getBytes("ISO-8859-1"));
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException("Java VM does not support a standard character set.", e);
        }
    }

    public static byte[] byteArrayDefaultValue(String bytes) {
        try {
            return bytes.getBytes("ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException("Java VM does not support a standard character set.", e);
        }
    }

    public static ByteBuffer byteBufferDefaultValue(String bytes) {
        return ByteBuffer.wrap(byteArrayDefaultValue(bytes));
    }

    public static ByteBuffer copyByteBuffer(ByteBuffer source) {
        ByteBuffer temp = source.duplicate();
        temp.clear();
        ByteBuffer result = ByteBuffer.allocate(temp.capacity());
        result.put(temp);
        result.clear();
        return result;
    }

    public static boolean isValidUtf8(ByteString byteString) {
        return byteString.isValidUtf8();
    }

    public static boolean isValidUtf8(byte[] byteArray) {
        return Utf8.isValidUtf8(byteArray);
    }

    public static byte[] toByteArray(String value) {
        try {
            return value.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("UTF-8 not supported?", e);
        }
    }

    public static String toStringUtf8(byte[] bytes) {
        try {
            return new String(bytes, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("UTF-8 not supported?", e);
        }
    }

    public static int hashLong(long n) {
        return (int) ((n >>> 32) ^ n);
    }

    public static int hashBoolean(boolean b) {
        return b ? 1231 : 1237;
    }

    public static int hashEnum(EnumLite e) {
        return e.getNumber();
    }

    public static int hashEnumList(List<? extends EnumLite> list) {
        int hash = 1;
        for (EnumLite e : list) {
            hash = (hash * 31) + hashEnum(e);
        }
        return hash;
    }

    public static boolean equals(List<byte[]> a, List<byte[]> b) {
        if (a.size() != b.size()) {
            return false;
        }
        for (int i = 0; i < a.size(); i++) {
            if (!Arrays.equals(a.get(i), b.get(i))) {
                return false;
            }
        }
        return true;
    }

    public static int hashCode(List<byte[]> list) {
        int hash = 1;
        for (byte[] bytes : list) {
            hash = (hash * 31) + hashCode(bytes);
        }
        return hash;
    }

    public static int hashCode(byte[] bytes) {
        return LiteralByteString.hashCode(bytes);
    }

    public static boolean equalsByteBuffer(ByteBuffer a, ByteBuffer b) {
        if (a.capacity() != b.capacity()) {
            return false;
        }
        return a.duplicate().clear().equals(b.duplicate().clear());
    }

    public static boolean equalsByteBuffer(List<ByteBuffer> a, List<ByteBuffer> b) {
        if (a.size() != b.size()) {
            return false;
        }
        for (int i = 0; i < a.size(); i++) {
            if (!equalsByteBuffer(a.get(i), b.get(i))) {
                return false;
            }
        }
        return true;
    }

    public static int hashCodeByteBuffer(List<ByteBuffer> list) {
        int hash = 1;
        for (ByteBuffer bytes : list) {
            hash = (hash * 31) + hashCodeByteBuffer(bytes);
        }
        return hash;
    }

    public static int hashCodeByteBuffer(ByteBuffer bytes) {
        int bufferSize = 4096;
        int i = 1;
        if (bytes.hasArray()) {
            int h = LiteralByteString.hashCode(bytes.capacity(), bytes.array(), bytes.arrayOffset(), bytes.capacity());
            if (h != 0) {
                return h;
            }
            return 1;
        }
        if (bytes.capacity() <= 4096) {
            bufferSize = bytes.capacity();
        }
        byte[] buffer = new byte[bufferSize];
        ByteBuffer duplicated = bytes.duplicate();
        duplicated.clear();
        int h2 = bytes.capacity();
        while (duplicated.remaining() > 0) {
            int length = duplicated.remaining() <= bufferSize ? duplicated.remaining() : bufferSize;
            duplicated.get(buffer, 0, length);
            h2 = LiteralByteString.hashCode(h2, buffer, 0, length);
        }
        if (h2 != 0) {
            i = h2;
        }
        int h3 = i;
        return h3;
    }

    public static <T extends MutableMessageLite> T mergeFrom(T message, CodedInputStream input, ExtensionRegistryLite registry) throws IOException {
        if (!message.mergeFrom(input, registry)) {
            throw InvalidProtocolBufferException.parseFailure();
        }
        return message;
    }

    public static <T extends MutableMessageLite> T mergeFrom(T message, CodedInputStream input) throws IOException {
        if (!message.mergeFrom(input)) {
            throw InvalidProtocolBufferException.parseFailure();
        }
        return message;
    }

    public static <T extends MutableMessageLite> T mergeFrom(T message, byte[] bytes) throws IOException {
        if (!message.mergeFrom(bytes)) {
            throw InvalidProtocolBufferException.parseFailure();
        }
        return message;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isProto1Group(MessageLite message) {
        return (message instanceof AbstractMutableMessageLite) && ((AbstractMutableMessageLite) message).isProto1Group();
    }
}
