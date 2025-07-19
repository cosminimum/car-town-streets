package com.google.tagmanager.protobuf;

import com.google.tagmanager.protobuf.AbstractMessageLite;
import com.google.tagmanager.protobuf.MessageLite;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public abstract class AbstractParser<MessageType extends MessageLite> implements Parser<MessageType> {
    private static final ExtensionRegistryLite EMPTY_REGISTRY = ExtensionRegistryLite.getEmptyRegistry();

    private UninitializedMessageException newUninitializedMessageException(MessageType message) {
        if (message instanceof AbstractMessageLite) {
            return ((AbstractMessageLite) message).newUninitializedMessageException();
        }
        if (message instanceof AbstractMutableMessageLite) {
            return ((AbstractMutableMessageLite) message).newUninitializedMessageException();
        }
        return new UninitializedMessageException(message);
    }

    private MessageType checkMessageInitialized(MessageType message) throws InvalidProtocolBufferException {
        if (message != null && !message.isInitialized()) {
            throw newUninitializedMessageException(message).asInvalidProtocolBufferException().setUnfinishedMessage(message);
        }
        return message;
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parsePartialFrom */
    public MessageType mo436parsePartialFrom(CodedInputStream input) throws InvalidProtocolBufferException {
        return (MessageType) parsePartialFrom(input, EMPTY_REGISTRY);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseFrom */
    public MessageType mo425parseFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return (MessageType) checkMessageInitialized((MessageLite) parsePartialFrom(input, extensionRegistry));
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseFrom */
    public MessageType mo424parseFrom(CodedInputStream input) throws InvalidProtocolBufferException {
        return mo425parseFrom(input, EMPTY_REGISTRY);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parsePartialFrom */
    public MessageType mo435parsePartialFrom(ByteString data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        try {
            try {
                CodedInputStream input = data.newCodedInput();
                MessageType message = (MessageType) parsePartialFrom(input, extensionRegistry);
                try {
                    input.checkLastTagWas(0);
                    return message;
                } catch (InvalidProtocolBufferException e) {
                    throw e.setUnfinishedMessage(message);
                }
            } catch (IOException e2) {
                throw new RuntimeException("Reading from a ByteString threw an IOException (should never happen).", e2);
            }
        } catch (InvalidProtocolBufferException e3) {
            throw e3;
        }
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parsePartialFrom */
    public MessageType mo434parsePartialFrom(ByteString data) throws InvalidProtocolBufferException {
        return mo435parsePartialFrom(data, EMPTY_REGISTRY);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseFrom */
    public MessageType mo423parseFrom(ByteString data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return checkMessageInitialized(mo435parsePartialFrom(data, extensionRegistry));
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseFrom */
    public MessageType mo422parseFrom(ByteString data) throws InvalidProtocolBufferException {
        return mo423parseFrom(data, EMPTY_REGISTRY);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parsePartialFrom */
    public MessageType mo441parsePartialFrom(byte[] data, int off, int len, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        try {
            try {
                CodedInputStream input = CodedInputStream.newInstance(data, off, len);
                MessageType message = (MessageType) parsePartialFrom(input, extensionRegistry);
                try {
                    input.checkLastTagWas(0);
                    return message;
                } catch (InvalidProtocolBufferException e) {
                    throw e.setUnfinishedMessage(message);
                }
            } catch (IOException e2) {
                throw new RuntimeException("Reading from a byte array threw an IOException (should never happen).", e2);
            }
        } catch (InvalidProtocolBufferException e3) {
            throw e3;
        }
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parsePartialFrom */
    public MessageType mo440parsePartialFrom(byte[] data, int off, int len) throws InvalidProtocolBufferException {
        return mo441parsePartialFrom(data, off, len, EMPTY_REGISTRY);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parsePartialFrom */
    public MessageType mo442parsePartialFrom(byte[] data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return mo441parsePartialFrom(data, 0, data.length, extensionRegistry);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parsePartialFrom */
    public MessageType mo439parsePartialFrom(byte[] data) throws InvalidProtocolBufferException {
        return mo441parsePartialFrom(data, 0, data.length, EMPTY_REGISTRY);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseFrom */
    public MessageType mo430parseFrom(byte[] data, int off, int len, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return checkMessageInitialized(mo441parsePartialFrom(data, off, len, extensionRegistry));
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseFrom */
    public MessageType mo429parseFrom(byte[] data, int off, int len) throws InvalidProtocolBufferException {
        return mo430parseFrom(data, off, len, EMPTY_REGISTRY);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseFrom */
    public MessageType mo431parseFrom(byte[] data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return mo430parseFrom(data, 0, data.length, extensionRegistry);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseFrom */
    public MessageType mo428parseFrom(byte[] data) throws InvalidProtocolBufferException {
        return mo431parseFrom(data, EMPTY_REGISTRY);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parsePartialFrom */
    public MessageType mo438parsePartialFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        CodedInputStream codedInput = CodedInputStream.newInstance(input);
        MessageType message = (MessageType) parsePartialFrom(codedInput, extensionRegistry);
        try {
            codedInput.checkLastTagWas(0);
            return message;
        } catch (InvalidProtocolBufferException e) {
            throw e.setUnfinishedMessage(message);
        }
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parsePartialFrom */
    public MessageType mo437parsePartialFrom(InputStream input) throws InvalidProtocolBufferException {
        return mo438parsePartialFrom(input, EMPTY_REGISTRY);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseFrom */
    public MessageType mo427parseFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return checkMessageInitialized(mo438parsePartialFrom(input, extensionRegistry));
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseFrom */
    public MessageType mo426parseFrom(InputStream input) throws InvalidProtocolBufferException {
        return mo427parseFrom(input, EMPTY_REGISTRY);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parsePartialDelimitedFrom */
    public MessageType mo433parsePartialDelimitedFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        try {
            int firstByte = input.read();
            if (firstByte == -1) {
                return null;
            }
            int size = CodedInputStream.readRawVarint32(firstByte, input);
            InputStream limitedInput = new AbstractMessageLite.Builder.LimitedInputStream(input, size);
            return mo438parsePartialFrom(limitedInput, extensionRegistry);
        } catch (IOException e) {
            throw new InvalidProtocolBufferException(e.getMessage());
        }
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parsePartialDelimitedFrom */
    public MessageType mo432parsePartialDelimitedFrom(InputStream input) throws InvalidProtocolBufferException {
        return mo433parsePartialDelimitedFrom(input, EMPTY_REGISTRY);
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseDelimitedFrom */
    public MessageType mo421parseDelimitedFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return checkMessageInitialized(mo433parsePartialDelimitedFrom(input, extensionRegistry));
    }

    @Override // com.google.tagmanager.protobuf.Parser
    /* renamed from: parseDelimitedFrom */
    public MessageType mo420parseDelimitedFrom(InputStream input) throws InvalidProtocolBufferException {
        return mo421parseDelimitedFrom(input, EMPTY_REGISTRY);
    }
}
