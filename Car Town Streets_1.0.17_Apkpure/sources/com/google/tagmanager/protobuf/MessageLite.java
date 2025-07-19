package com.google.tagmanager.protobuf;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
/* loaded from: classes.dex */
public interface MessageLite extends MessageLiteOrBuilder {

    /* loaded from: classes.dex */
    public interface Builder extends MessageLiteOrBuilder, Cloneable {
        /* renamed from: build */
        MessageLite mo400build();

        /* renamed from: buildPartial */
        MessageLite mo401buildPartial();

        /* renamed from: clear */
        Builder mo449clear();

        /* renamed from: clone */
        Builder mo451clone();

        boolean mergeDelimitedFrom(InputStream inputStream) throws IOException;

        boolean mergeDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException;

        /* renamed from: mergeFrom */
        Builder mo408mergeFrom(ByteString byteString) throws InvalidProtocolBufferException;

        /* renamed from: mergeFrom */
        Builder mo409mergeFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

        /* renamed from: mergeFrom */
        Builder mo410mergeFrom(CodedInputStream codedInputStream) throws IOException;

        /* renamed from: mergeFrom */
        Builder mo411mergeFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException;

        /* renamed from: mergeFrom */
        Builder mo412mergeFrom(InputStream inputStream) throws IOException;

        /* renamed from: mergeFrom */
        Builder mo413mergeFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException;

        /* renamed from: mergeFrom */
        Builder mo414mergeFrom(byte[] bArr) throws InvalidProtocolBufferException;

        /* renamed from: mergeFrom */
        Builder mo415mergeFrom(byte[] bArr, int i, int i2) throws InvalidProtocolBufferException;

        /* renamed from: mergeFrom */
        Builder mo416mergeFrom(byte[] bArr, int i, int i2, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

        /* renamed from: mergeFrom */
        Builder mo417mergeFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;
    }

    Parser<? extends MessageLite> getParserForType();

    int getSerializedSize();

    MutableMessageLite mutableCopy();

    /* renamed from: newBuilderForType */
    Builder mo397newBuilderForType();

    /* renamed from: toBuilder */
    Builder mo398toBuilder();

    byte[] toByteArray();

    ByteString toByteString();

    void writeDelimitedTo(OutputStream outputStream) throws IOException;

    void writeTo(CodedOutputStream codedOutputStream) throws IOException;

    void writeTo(OutputStream outputStream) throws IOException;
}
