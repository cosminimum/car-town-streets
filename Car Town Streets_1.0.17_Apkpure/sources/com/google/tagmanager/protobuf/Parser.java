package com.google.tagmanager.protobuf;

import java.io.InputStream;
/* loaded from: classes.dex */
public interface Parser<MessageType> {
    /* renamed from: parseDelimitedFrom */
    MessageType mo420parseDelimitedFrom(InputStream inputStream) throws InvalidProtocolBufferException;

    /* renamed from: parseDelimitedFrom */
    MessageType mo421parseDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

    /* renamed from: parseFrom */
    MessageType mo422parseFrom(ByteString byteString) throws InvalidProtocolBufferException;

    /* renamed from: parseFrom */
    MessageType mo423parseFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

    /* renamed from: parseFrom */
    MessageType mo424parseFrom(CodedInputStream codedInputStream) throws InvalidProtocolBufferException;

    /* renamed from: parseFrom */
    MessageType mo425parseFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

    /* renamed from: parseFrom */
    MessageType mo426parseFrom(InputStream inputStream) throws InvalidProtocolBufferException;

    /* renamed from: parseFrom */
    MessageType mo427parseFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

    /* renamed from: parseFrom */
    MessageType mo428parseFrom(byte[] bArr) throws InvalidProtocolBufferException;

    /* renamed from: parseFrom */
    MessageType mo429parseFrom(byte[] bArr, int i, int i2) throws InvalidProtocolBufferException;

    /* renamed from: parseFrom */
    MessageType mo430parseFrom(byte[] bArr, int i, int i2, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

    /* renamed from: parseFrom */
    MessageType mo431parseFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialDelimitedFrom */
    MessageType mo432parsePartialDelimitedFrom(InputStream inputStream) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialDelimitedFrom */
    MessageType mo433parsePartialDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialFrom */
    MessageType mo434parsePartialFrom(ByteString byteString) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialFrom */
    MessageType mo435parsePartialFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialFrom */
    MessageType mo436parsePartialFrom(CodedInputStream codedInputStream) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialFrom */
    MessageType mo419parsePartialFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialFrom */
    MessageType mo437parsePartialFrom(InputStream inputStream) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialFrom */
    MessageType mo438parsePartialFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialFrom */
    MessageType mo439parsePartialFrom(byte[] bArr) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialFrom */
    MessageType mo440parsePartialFrom(byte[] bArr, int i, int i2) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialFrom */
    MessageType mo441parsePartialFrom(byte[] bArr, int i, int i2, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;

    /* renamed from: parsePartialFrom */
    MessageType mo442parsePartialFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException;
}
