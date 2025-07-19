package com.google.tagmanager.protobuf;

import com.google.tagmanager.protobuf.GeneratedMessageLite;
import com.google.tagmanager.protobuf.GeneratedMutableMessageLite;
import com.google.tagmanager.protobuf.MessageLite;
import com.google.tagmanager.protobuf.WireFormat;
import java.io.IOException;
import java.io.ObjectStreamException;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class GeneratedMutableMessageLite<MessageType extends GeneratedMutableMessageLite<MessageType>> extends AbstractMutableMessageLite implements Serializable {
    private static final long serialVersionUID = 1;
    protected ByteString unknownFields = ByteString.EMPTY;

    @Override // com.google.tagmanager.protobuf.MutableMessageLite, com.google.tagmanager.protobuf.MessageLiteOrBuilder
    /* renamed from: getDefaultInstanceForType */
    public abstract MessageType mo453getDefaultInstanceForType();

    protected abstract MessageLite internalImmutableDefault();

    public abstract MessageType mergeFrom(MessageType messagetype);

    @Override // com.google.tagmanager.protobuf.MessageLite
    public Parser<MessageType> getParserForType() {
        throw new UnsupportedOperationException("This is supposed to be overridden by subclasses.");
    }

    @Override // com.google.tagmanager.protobuf.MutableMessageLite
    /* renamed from: clear */
    public MessageType mo454clear() {
        assertMutable();
        this.unknownFields = ByteString.EMPTY;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean parseUnknownField(CodedInputStream input, CodedOutputStream unknownFieldsCodedOutput, ExtensionRegistryLite extensionRegistry, int tag) throws IOException {
        return input.skipField(tag, unknownFieldsCodedOutput);
    }

    static MessageLite.Builder internalCopyToBuilder(MutableMessageLite fromMessage, MessageLite toMessagePrototype) {
        MessageLite.Builder builder = toMessagePrototype.mo397newBuilderForType();
        try {
            builder.mo414mergeFrom(fromMessage.toByteArray());
            return builder;
        } catch (InvalidProtocolBufferException e) {
            throw new RuntimeException("Failed to parse serialized bytes (should not happen)");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static MessageLite internalImmutableDefault(String name) {
        try {
            Method defaultInstanceMethod = GeneratedMessageLite.getMethodOrDie(Class.forName(name), "getDefaultInstance", new Class[0]);
            return (MessageLite) GeneratedMessageLite.invokeOrDie(defaultInstanceMethod, null, new Object[0]);
        } catch (ClassNotFoundException e) {
            throw new UnsupportedOperationException("Cannot load the corresponding immutable class. Please add necessary dependencies.");
        }
    }

    @Override // com.google.tagmanager.protobuf.MutableMessageLite
    public MessageLite immutableCopy() {
        MessageLite immutableDefaultInstance = internalImmutableDefault();
        return this == mo453getDefaultInstanceForType() ? immutableDefaultInstance : internalCopyToBuilder(this, immutableDefaultInstance).mo401buildPartial();
    }

    /* loaded from: classes.dex */
    public static abstract class ExtendableMutableMessage<MessageType extends ExtendableMutableMessage<MessageType>> extends GeneratedMutableMessageLite<MessageType> {
        private FieldSet<GeneratedMessageLite.ExtensionDescriptor> extensions = FieldSet.emptySet();

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite, com.google.tagmanager.protobuf.MessageLiteOrBuilder
        /* renamed from: getDefaultInstanceForType */
        public /* bridge */ /* synthetic */ MessageLite mo453getDefaultInstanceForType() {
            return super.mo453getDefaultInstanceForType();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void internalSetExtensionSet(FieldSet<GeneratedMessageLite.ExtensionDescriptor> extensions) {
            this.extensions = extensions;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clear */
        public MessageType mo454clear() {
            assertMutable();
            this.extensions = FieldSet.emptySet();
            return (MessageType) super.mo454clear();
        }

        private void ensureExtensionsIsMutable() {
            if (this.extensions.isImmutable()) {
                this.extensions = this.extensions.m444clone();
            }
        }

        private void verifyExtensionContainingType(GeneratedMessageLite.GeneratedExtension<MessageType, ?> extension) {
            if (extension.getContainingTypeDefaultInstance() != getDefaultInstanceForType()) {
                throw new IllegalArgumentException("This extension is for a different message type.  Please make sure that you are not suppressing any generics type warnings.");
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        public final <Type> boolean hasExtension(GeneratedMessageLite.GeneratedExtension<MessageType, Type> extension) {
            verifyExtensionContainingType(extension);
            return this.extensions.hasField(extension.descriptor);
        }

        public final <Type> int getExtensionCount(GeneratedMessageLite.GeneratedExtension<MessageType, List<Type>> extension) {
            verifyExtensionContainingType(extension);
            return this.extensions.getRepeatedFieldCount(extension.descriptor);
        }

        /* JADX WARN: Multi-variable type inference failed */
        public final <Type> Type getExtension(GeneratedMessageLite.GeneratedExtension<MessageType, Type> extension) {
            verifyExtensionContainingType(extension);
            Object value = this.extensions.getField(extension.descriptor);
            if (value == null) {
                return extension.defaultValue;
            }
            if (extension.descriptor.isRepeated) {
                return (Type) Collections.unmodifiableList((List) extension.fromFieldSetType(value));
            }
            return (Type) extension.fromFieldSetType(value);
        }

        public final <Type> Type getExtension(GeneratedMessageLite.GeneratedExtension<MessageType, List<Type>> extension, int index) {
            verifyExtensionContainingType(extension);
            return (Type) extension.singularFromFieldSetType(this.extensions.getRepeatedField(extension.descriptor, index));
        }

        /* JADX WARN: Multi-variable type inference failed */
        public final <Type extends MutableMessageLite> Type getMutableExtension(GeneratedMessageLite.GeneratedExtension<MessageType, Type> extension) {
            assertMutable();
            verifyExtensionContainingType(extension);
            ensureExtensionsIsMutable();
            GeneratedMessageLite.ExtensionDescriptor descriptor = extension.descriptor;
            if (descriptor.getLiteJavaType() != WireFormat.JavaType.MESSAGE) {
                throw new UnsupportedOperationException("getMutableExtension() called on a non-Message type.");
            }
            if (descriptor.isRepeated()) {
                throw new UnsupportedOperationException("getMutableExtension() called on a repeated type.");
            }
            Object value = this.extensions.getField(extension.descriptor);
            if (value != null) {
                return (Type) value;
            }
            MutableMessageLite default_instance = (MutableMessageLite) extension.defaultValue;
            Type message = (Type) default_instance.mo395newMessageForType();
            this.extensions.setField(extension.descriptor, message);
            return message;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public final <Type> MessageType setExtension(GeneratedMessageLite.GeneratedExtension<MessageType, Type> extension, Type value) {
            assertMutable();
            verifyExtensionContainingType(extension);
            ensureExtensionsIsMutable();
            this.extensions.setField(extension.descriptor, extension.toFieldSetType(value));
            return this;
        }

        public final <Type> MessageType setExtension(GeneratedMessageLite.GeneratedExtension<MessageType, List<Type>> extension, int index, Type value) {
            assertMutable();
            verifyExtensionContainingType(extension);
            ensureExtensionsIsMutable();
            this.extensions.setRepeatedField(extension.descriptor, index, extension.singularToFieldSetType(value));
            return this;
        }

        public final <Type> MessageType addExtension(GeneratedMessageLite.GeneratedExtension<MessageType, List<Type>> extension, Type value) {
            assertMutable();
            verifyExtensionContainingType(extension);
            ensureExtensionsIsMutable();
            this.extensions.addRepeatedField(extension.descriptor, extension.singularToFieldSetType(value));
            return this;
        }

        public final <Type> MessageType clearExtension(GeneratedMessageLite.GeneratedExtension<MessageType, ?> extension) {
            assertMutable();
            verifyExtensionContainingType(extension);
            ensureExtensionsIsMutable();
            this.extensions.clearField(extension.descriptor);
            return this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        public boolean extensionsAreInitialized() {
            return this.extensions.isInitialized();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public boolean parseUnknownField(CodedInputStream input, CodedOutputStream unknownFieldsCodedOutput, ExtensionRegistryLite extensionRegistry, int tag) throws IOException {
            ensureExtensionsIsMutable();
            return GeneratedMutableMessageLite.parseUnknownField(this.extensions, getDefaultInstanceForType(), input, unknownFieldsCodedOutput, extensionRegistry, tag);
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        public MessageLite immutableCopy() {
            GeneratedMessageLite.ExtendableBuilder builder = (GeneratedMessageLite.ExtendableBuilder) internalCopyToBuilder(this, internalImmutableDefault());
            builder.internalSetExtensionSet(this.extensions.cloneWithAllFieldsToImmutable());
            return builder.buildPartial();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        /* loaded from: classes.dex */
        public class ExtensionWriter {
            private final Iterator<Map.Entry<GeneratedMessageLite.ExtensionDescriptor, Object>> iter;
            private final boolean messageSetWireFormat;
            private Map.Entry<GeneratedMessageLite.ExtensionDescriptor, Object> next;

            private ExtensionWriter(boolean messageSetWireFormat) {
                this.iter = ExtendableMutableMessage.this.extensions.iterator();
                if (this.iter.hasNext()) {
                    this.next = this.iter.next();
                }
                this.messageSetWireFormat = messageSetWireFormat;
            }

            public void writeUntil(int end, CodedOutputStream output) throws IOException {
                while (this.next != null && this.next.getKey().getNumber() < end) {
                    GeneratedMessageLite.ExtensionDescriptor extension = this.next.getKey();
                    if (this.messageSetWireFormat && extension.getLiteJavaType() == WireFormat.JavaType.MESSAGE && !extension.isRepeated()) {
                        output.writeMessageSetExtension(extension.getNumber(), (MessageLite) this.next.getValue());
                    } else {
                        FieldSet.writeField(extension, this.next.getValue(), output);
                    }
                    if (this.iter.hasNext()) {
                        this.next = this.iter.next();
                    } else {
                        this.next = null;
                    }
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        public ExtendableMutableMessage<MessageType>.ExtensionWriter newExtensionWriter() {
            return new ExtensionWriter(false);
        }

        protected ExtendableMutableMessage<MessageType>.ExtensionWriter newMessageSetExtensionWriter() {
            return new ExtensionWriter(true);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        public int extensionsSerializedSize() {
            return this.extensions.getSerializedSize();
        }

        protected int extensionsSerializedSizeAsMessageSet() {
            return this.extensions.getMessageSetSerializedSize();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        public final void mergeExtensionFields(MessageType other) {
            ensureExtensionsIsMutable();
            this.extensions.mergeFrom(other.extensions);
        }
    }

    static <MessageType extends MutableMessageLite> boolean parseUnknownField(FieldSet<GeneratedMessageLite.ExtensionDescriptor> extensions, MessageType defaultInstance, CodedInputStream input, CodedOutputStream unknownFieldsCodedOutput, ExtensionRegistryLite extensionRegistry, int tag) throws IOException {
        Object mo329findValueByNumber;
        int wireType = WireFormat.getTagWireType(tag);
        int fieldNumber = WireFormat.getTagFieldNumber(tag);
        GeneratedMessageLite.GeneratedExtension<MessageType, ?> extension = extensionRegistry.findLiteExtensionByNumber(defaultInstance, fieldNumber);
        boolean unknown = false;
        boolean packed = false;
        if (extension == null) {
            unknown = true;
        } else if (wireType == FieldSet.getWireFormatForFieldType(extension.descriptor.getLiteType(), false)) {
            packed = false;
        } else if (extension.descriptor.isRepeated && extension.descriptor.type.isPackable() && wireType == FieldSet.getWireFormatForFieldType(extension.descriptor.getLiteType(), true)) {
            packed = true;
        } else {
            unknown = true;
        }
        if (unknown) {
            return input.skipField(tag, unknownFieldsCodedOutput);
        }
        if (packed) {
            int length = input.readRawVarint32();
            int limit = input.pushLimit(length);
            if (extension.descriptor.getLiteType() == WireFormat.FieldType.ENUM) {
                while (input.getBytesUntilLimit() > 0) {
                    Object mo329findValueByNumber2 = extension.descriptor.getEnumType().mo329findValueByNumber(input.readEnum());
                    if (mo329findValueByNumber2 == null) {
                        return true;
                    }
                    extensions.addRepeatedField(extension.descriptor, extension.singularToFieldSetType(mo329findValueByNumber2));
                }
            } else {
                while (input.getBytesUntilLimit() > 0) {
                    Object value = FieldSet.readPrimitiveFieldForMutable(input, extension.descriptor.getLiteType(), false);
                    extensions.addRepeatedField(extension.descriptor, value);
                }
            }
            input.popLimit(limit);
        } else {
            switch (extension.descriptor.getLiteJavaType()) {
                case MESSAGE:
                    MutableMessageLite message = ((MutableMessageLite) extension.messageDefaultInstance).mo395newMessageForType();
                    if (extension.descriptor.getLiteType() == WireFormat.FieldType.GROUP) {
                        input.readGroup(extension.getNumber(), message, extensionRegistry);
                    } else {
                        input.readMessage(message, extensionRegistry);
                    }
                    mo329findValueByNumber = message;
                    break;
                case ENUM:
                    int rawValue = input.readEnum();
                    mo329findValueByNumber = extension.descriptor.getEnumType().mo329findValueByNumber(rawValue);
                    if (mo329findValueByNumber == null) {
                        unknownFieldsCodedOutput.writeRawVarint32(tag);
                        unknownFieldsCodedOutput.writeUInt32NoTag(rawValue);
                        return true;
                    }
                    break;
                default:
                    mo329findValueByNumber = FieldSet.readPrimitiveFieldForMutable(input, extension.descriptor.getLiteType(), false);
                    break;
            }
            if (extension.descriptor.isRepeated()) {
                extensions.addRepeatedField(extension.descriptor, extension.singularToFieldSetType(mo329findValueByNumber));
            } else {
                extensions.setField(extension.descriptor, extension.singularToFieldSetType(mo329findValueByNumber));
            }
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class SerializedForm implements Serializable {
        private static final long serialVersionUID = 0;
        private byte[] asBytes;
        private String messageClassName;

        SerializedForm(MutableMessageLite regularForm) {
            this.messageClassName = regularForm.getClass().getName();
            this.asBytes = regularForm.toByteArray();
        }

        protected Object readResolve() throws ObjectStreamException {
            try {
                Class messageClass = Class.forName(this.messageClassName);
                Method newMessage = messageClass.getMethod("newMessage", new Class[0]);
                MutableMessageLite message = (MutableMessageLite) newMessage.invoke(null, new Object[0]);
                if (!message.mergeFrom(CodedInputStream.newInstance(this.asBytes))) {
                    throw new RuntimeException("Unable to understand proto buffer");
                }
                return message;
            } catch (ClassNotFoundException e) {
                throw new RuntimeException("Unable to find proto buffer class", e);
            } catch (IllegalAccessException e2) {
                throw new RuntimeException("Unable to call newMessage method", e2);
            } catch (NoSuchMethodException e3) {
                throw new RuntimeException("Unable to find newMessage method", e3);
            } catch (InvocationTargetException e4) {
                throw new RuntimeException("Error calling newMessage", e4.getCause());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Object writeReplace() throws ObjectStreamException {
        return new SerializedForm(this);
    }
}
