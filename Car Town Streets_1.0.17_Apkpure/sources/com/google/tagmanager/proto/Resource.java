package com.google.tagmanager.proto;

import com.google.analytics.containertag.proto.Serving;
import com.google.tagmanager.protobuf.AbstractParser;
import com.google.tagmanager.protobuf.ByteString;
import com.google.tagmanager.protobuf.CodedInputStream;
import com.google.tagmanager.protobuf.CodedOutputStream;
import com.google.tagmanager.protobuf.ExtensionRegistryLite;
import com.google.tagmanager.protobuf.GeneratedMessageLite;
import com.google.tagmanager.protobuf.Internal;
import com.google.tagmanager.protobuf.InvalidProtocolBufferException;
import com.google.tagmanager.protobuf.MessageLiteOrBuilder;
import com.google.tagmanager.protobuf.MutableMessageLite;
import com.google.tagmanager.protobuf.Parser;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectStreamException;
/* loaded from: classes.dex */
public final class Resource {

    /* loaded from: classes.dex */
    public interface ResourceWithMetadataOrBuilder extends MessageLiteOrBuilder {
        Serving.Resource getResource();

        long getTimeStamp();

        boolean hasResource();

        boolean hasTimeStamp();
    }

    private Resource() {
    }

    public static void registerAllExtensions(ExtensionRegistryLite registry) {
    }

    /* loaded from: classes.dex */
    public static final class ResourceWithMetadata extends GeneratedMessageLite implements ResourceWithMetadataOrBuilder {
        public static final int RESOURCE_FIELD_NUMBER = 2;
        public static final int TIME_STAMP_FIELD_NUMBER = 1;
        private static final long serialVersionUID = 0;
        private int bitField0_;
        private byte memoizedIsInitialized;
        private int memoizedSerializedSize;
        private Serving.Resource resource_;
        private long timeStamp_;
        private final ByteString unknownFields;
        public static Parser<ResourceWithMetadata> PARSER = new AbstractParser<ResourceWithMetadata>() { // from class: com.google.tagmanager.proto.Resource.ResourceWithMetadata.1
            @Override // com.google.tagmanager.protobuf.Parser
            /* renamed from: parsePartialFrom */
            public ResourceWithMetadata mo419parsePartialFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
                return new ResourceWithMetadata(input, extensionRegistry);
            }
        };
        private static volatile MutableMessageLite mutableDefault = null;
        private static final ResourceWithMetadata defaultInstance = new ResourceWithMetadata(true);

        private ResourceWithMetadata(GeneratedMessageLite.Builder builder) {
            super(builder);
            this.memoizedIsInitialized = (byte) -1;
            this.memoizedSerializedSize = -1;
            this.unknownFields = builder.getUnknownFields();
        }

        private ResourceWithMetadata(boolean noInit) {
            this.memoizedIsInitialized = (byte) -1;
            this.memoizedSerializedSize = -1;
            this.unknownFields = ByteString.EMPTY;
        }

        public static ResourceWithMetadata getDefaultInstance() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.MessageLiteOrBuilder
        /* renamed from: getDefaultInstanceForType */
        public ResourceWithMetadata mo453getDefaultInstanceForType() {
            return defaultInstance;
        }

        private ResourceWithMetadata(CodedInputStream input, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
            this.memoizedIsInitialized = (byte) -1;
            this.memoizedSerializedSize = -1;
            initFields();
            ByteString.Output unknownFieldsOutput = ByteString.newOutput();
            CodedOutputStream unknownFieldsCodedOutput = CodedOutputStream.newInstance(unknownFieldsOutput);
            boolean done = false;
            while (!done) {
                try {
                    try {
                        int tag = input.readTag();
                        switch (tag) {
                            case 0:
                                done = true;
                                break;
                            case 8:
                                this.bitField0_ |= 1;
                                this.timeStamp_ = input.readInt64();
                                break;
                            case 18:
                                Serving.Resource.Builder subBuilder = null;
                                subBuilder = (this.bitField0_ & 2) == 2 ? this.resource_.mo398toBuilder() : subBuilder;
                                this.resource_ = (Serving.Resource) input.readMessage(Serving.Resource.PARSER, extensionRegistry);
                                if (subBuilder != null) {
                                    subBuilder.mergeFrom(this.resource_);
                                    this.resource_ = subBuilder.mo401buildPartial();
                                }
                                this.bitField0_ |= 2;
                                break;
                            default:
                                if (parseUnknownField(input, unknownFieldsCodedOutput, extensionRegistry, tag)) {
                                    break;
                                } else {
                                    done = true;
                                    break;
                                }
                        }
                    } catch (InvalidProtocolBufferException e) {
                        throw e.setUnfinishedMessage(this);
                    } catch (IOException e2) {
                        throw new InvalidProtocolBufferException(e2.getMessage()).setUnfinishedMessage(this);
                    }
                } catch (Throwable th) {
                    try {
                        unknownFieldsCodedOutput.flush();
                    } catch (IOException e3) {
                    } finally {
                    }
                    makeExtensionsImmutable();
                    throw th;
                }
            }
            try {
                unknownFieldsCodedOutput.flush();
            } catch (IOException e4) {
            } finally {
            }
            makeExtensionsImmutable();
        }

        static {
            defaultInstance.initFields();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMessageLite, com.google.tagmanager.protobuf.MessageLite
        public Parser<ResourceWithMetadata> getParserForType() {
            return PARSER;
        }

        @Override // com.google.tagmanager.proto.Resource.ResourceWithMetadataOrBuilder
        public boolean hasTimeStamp() {
            return (this.bitField0_ & 1) == 1;
        }

        @Override // com.google.tagmanager.proto.Resource.ResourceWithMetadataOrBuilder
        public long getTimeStamp() {
            return this.timeStamp_;
        }

        @Override // com.google.tagmanager.proto.Resource.ResourceWithMetadataOrBuilder
        public boolean hasResource() {
            return (this.bitField0_ & 2) == 2;
        }

        @Override // com.google.tagmanager.proto.Resource.ResourceWithMetadataOrBuilder
        public Serving.Resource getResource() {
            return this.resource_;
        }

        private void initFields() {
            this.timeStamp_ = 0L;
            this.resource_ = Serving.Resource.getDefaultInstance();
        }

        @Override // com.google.tagmanager.protobuf.MessageLiteOrBuilder
        public final boolean isInitialized() {
            boolean z = true;
            byte isInitialized = this.memoizedIsInitialized;
            if (isInitialized != -1) {
                if (isInitialized != 1) {
                    z = false;
                }
                return z;
            } else if (!hasTimeStamp()) {
                this.memoizedIsInitialized = (byte) 0;
                return false;
            } else if (!hasResource()) {
                this.memoizedIsInitialized = (byte) 0;
                return false;
            } else if (!getResource().isInitialized()) {
                this.memoizedIsInitialized = (byte) 0;
                return false;
            } else {
                this.memoizedIsInitialized = (byte) 1;
                return true;
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        public void writeTo(CodedOutputStream output) throws IOException {
            getSerializedSize();
            if ((this.bitField0_ & 1) == 1) {
                output.writeInt64(1, this.timeStamp_);
            }
            if ((this.bitField0_ & 2) == 2) {
                output.writeMessage(2, this.resource_);
            }
            output.writeRawBytes(this.unknownFields);
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        public int getSerializedSize() {
            int size = this.memoizedSerializedSize;
            if (size != -1) {
                return size;
            }
            int size2 = 0;
            if ((this.bitField0_ & 1) == 1) {
                size2 = 0 + CodedOutputStream.computeInt64Size(1, this.timeStamp_);
            }
            if ((this.bitField0_ & 2) == 2) {
                size2 += CodedOutputStream.computeMessageSize(2, this.resource_);
            }
            int size3 = size2 + this.unknownFields.size();
            this.memoizedSerializedSize = size3;
            return size3;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.tagmanager.protobuf.GeneratedMessageLite
        public Object writeReplace() throws ObjectStreamException {
            return super.writeReplace();
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof ResourceWithMetadata)) {
                return super.equals(obj);
            }
            ResourceWithMetadata other = (ResourceWithMetadata) obj;
            boolean result = 1 != 0 && hasTimeStamp() == other.hasTimeStamp();
            if (hasTimeStamp()) {
                result = result && getTimeStamp() == other.getTimeStamp();
            }
            boolean result2 = result && hasResource() == other.hasResource();
            if (hasResource()) {
                result2 = result2 && getResource().equals(other.getResource());
            }
            return result2;
        }

        public int hashCode() {
            if (this.memoizedHashCode != 0) {
                return this.memoizedHashCode;
            }
            int hash = ResourceWithMetadata.class.hashCode() + 779;
            if (hasTimeStamp()) {
                hash = (((hash * 37) + 1) * 53) + Internal.hashLong(getTimeStamp());
            }
            if (hasResource()) {
                hash = (((hash * 37) + 2) * 53) + getResource().hashCode();
            }
            int hash2 = (hash * 29) + this.unknownFields.hashCode();
            this.memoizedHashCode = hash2;
            return hash2;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMessageLite
        protected MutableMessageLite internalMutableDefault() {
            if (mutableDefault == null) {
                mutableDefault = internalMutableDefault("com.google.tagmanager.proto.MutableResource$ResourceWithMetadata");
            }
            return mutableDefault;
        }

        public static ResourceWithMetadata parseFrom(ByteString data) throws InvalidProtocolBufferException {
            return PARSER.mo422parseFrom(data);
        }

        public static ResourceWithMetadata parseFrom(ByteString data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
            return PARSER.mo423parseFrom(data, extensionRegistry);
        }

        public static ResourceWithMetadata parseFrom(byte[] data) throws InvalidProtocolBufferException {
            return PARSER.mo428parseFrom(data);
        }

        public static ResourceWithMetadata parseFrom(byte[] data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
            return PARSER.mo431parseFrom(data, extensionRegistry);
        }

        public static ResourceWithMetadata parseFrom(InputStream input) throws IOException {
            return PARSER.mo426parseFrom(input);
        }

        public static ResourceWithMetadata parseFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
            return PARSER.mo427parseFrom(input, extensionRegistry);
        }

        public static ResourceWithMetadata parseDelimitedFrom(InputStream input) throws IOException {
            return PARSER.mo420parseDelimitedFrom(input);
        }

        public static ResourceWithMetadata parseDelimitedFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
            return PARSER.mo421parseDelimitedFrom(input, extensionRegistry);
        }

        public static ResourceWithMetadata parseFrom(CodedInputStream input) throws IOException {
            return PARSER.mo424parseFrom(input);
        }

        public static ResourceWithMetadata parseFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
            return PARSER.mo425parseFrom(input, extensionRegistry);
        }

        public static Builder newBuilder() {
            return Builder.create();
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        /* renamed from: newBuilderForType */
        public Builder mo397newBuilderForType() {
            return newBuilder();
        }

        public static Builder newBuilder(ResourceWithMetadata prototype) {
            return newBuilder().mergeFrom(prototype);
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        /* renamed from: toBuilder */
        public Builder mo398toBuilder() {
            return newBuilder(this);
        }

        /* loaded from: classes.dex */
        public static final class Builder extends GeneratedMessageLite.Builder<ResourceWithMetadata, Builder> implements ResourceWithMetadataOrBuilder {
            private int bitField0_;
            private Serving.Resource resource_ = Serving.Resource.getDefaultInstance();
            private long timeStamp_;

            private Builder() {
                maybeForceBuilderInitialization();
            }

            private void maybeForceBuilderInitialization() {
            }

            /* JADX INFO: Access modifiers changed from: private */
            public static Builder create() {
                return new Builder();
            }

            @Override // com.google.tagmanager.protobuf.GeneratedMessageLite.Builder, com.google.tagmanager.protobuf.MessageLite.Builder
            /* renamed from: clear */
            public Builder mo449clear() {
                super.mo449clear();
                this.timeStamp_ = 0L;
                this.bitField0_ &= -2;
                this.resource_ = Serving.Resource.getDefaultInstance();
                this.bitField0_ &= -3;
                return this;
            }

            @Override // com.google.tagmanager.protobuf.GeneratedMessageLite.Builder, com.google.tagmanager.protobuf.AbstractMessageLite.Builder, com.google.tagmanager.protobuf.MessageLite.Builder
            /* renamed from: clone */
            public Builder mo451clone() {
                return create().mergeFrom(mo401buildPartial());
            }

            @Override // com.google.tagmanager.protobuf.GeneratedMessageLite.Builder, com.google.tagmanager.protobuf.MessageLiteOrBuilder
            /* renamed from: getDefaultInstanceForType */
            public ResourceWithMetadata mo453getDefaultInstanceForType() {
                return ResourceWithMetadata.getDefaultInstance();
            }

            @Override // com.google.tagmanager.protobuf.MessageLite.Builder
            /* renamed from: build */
            public ResourceWithMetadata mo400build() {
                ResourceWithMetadata result = mo401buildPartial();
                if (!result.isInitialized()) {
                    throw newUninitializedMessageException(result);
                }
                return result;
            }

            @Override // com.google.tagmanager.protobuf.MessageLite.Builder
            /* renamed from: buildPartial */
            public ResourceWithMetadata mo401buildPartial() {
                ResourceWithMetadata result = new ResourceWithMetadata(this);
                int from_bitField0_ = this.bitField0_;
                int to_bitField0_ = 0;
                if ((from_bitField0_ & 1) == 1) {
                    to_bitField0_ = 0 | 1;
                }
                result.timeStamp_ = this.timeStamp_;
                if ((from_bitField0_ & 2) == 2) {
                    to_bitField0_ |= 2;
                }
                result.resource_ = this.resource_;
                result.bitField0_ = to_bitField0_;
                return result;
            }

            @Override // com.google.tagmanager.protobuf.GeneratedMessageLite.Builder
            public Builder mergeFrom(ResourceWithMetadata other) {
                if (other != ResourceWithMetadata.getDefaultInstance()) {
                    if (other.hasTimeStamp()) {
                        setTimeStamp(other.getTimeStamp());
                    }
                    if (other.hasResource()) {
                        mergeResource(other.getResource());
                    }
                    setUnknownFields(getUnknownFields().concat(other.unknownFields));
                }
                return this;
            }

            @Override // com.google.tagmanager.protobuf.MessageLiteOrBuilder
            public final boolean isInitialized() {
                return hasTimeStamp() && hasResource() && getResource().isInitialized();
            }

            @Override // com.google.tagmanager.protobuf.AbstractMessageLite.Builder, com.google.tagmanager.protobuf.MessageLite.Builder
            /* renamed from: mergeFrom */
            public Builder mo411mergeFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
                ResourceWithMetadata parsedMessage = null;
                try {
                    try {
                        parsedMessage = ResourceWithMetadata.PARSER.mo419parsePartialFrom(input, extensionRegistry);
                        return this;
                    } catch (InvalidProtocolBufferException e) {
                        ResourceWithMetadata resourceWithMetadata = (ResourceWithMetadata) e.getUnfinishedMessage();
                        throw e;
                    }
                } finally {
                    if (parsedMessage != null) {
                        mergeFrom(parsedMessage);
                    }
                }
            }

            @Override // com.google.tagmanager.proto.Resource.ResourceWithMetadataOrBuilder
            public boolean hasTimeStamp() {
                return (this.bitField0_ & 1) == 1;
            }

            @Override // com.google.tagmanager.proto.Resource.ResourceWithMetadataOrBuilder
            public long getTimeStamp() {
                return this.timeStamp_;
            }

            public Builder setTimeStamp(long value) {
                this.bitField0_ |= 1;
                this.timeStamp_ = value;
                return this;
            }

            public Builder clearTimeStamp() {
                this.bitField0_ &= -2;
                this.timeStamp_ = 0L;
                return this;
            }

            @Override // com.google.tagmanager.proto.Resource.ResourceWithMetadataOrBuilder
            public boolean hasResource() {
                return (this.bitField0_ & 2) == 2;
            }

            @Override // com.google.tagmanager.proto.Resource.ResourceWithMetadataOrBuilder
            public Serving.Resource getResource() {
                return this.resource_;
            }

            public Builder setResource(Serving.Resource value) {
                if (value == null) {
                    throw new NullPointerException();
                }
                this.resource_ = value;
                this.bitField0_ |= 2;
                return this;
            }

            public Builder setResource(Serving.Resource.Builder builderForValue) {
                this.resource_ = builderForValue.mo400build();
                this.bitField0_ |= 2;
                return this;
            }

            public Builder mergeResource(Serving.Resource value) {
                if ((this.bitField0_ & 2) == 2 && this.resource_ != Serving.Resource.getDefaultInstance()) {
                    this.resource_ = Serving.Resource.newBuilder(this.resource_).mergeFrom(value).mo401buildPartial();
                } else {
                    this.resource_ = value;
                }
                this.bitField0_ |= 2;
                return this;
            }

            public Builder clearResource() {
                this.resource_ = Serving.Resource.getDefaultInstance();
                this.bitField0_ &= -3;
                return this;
            }
        }
    }
}
