package com.google.analytics.containertag.proto;

import com.google.analytics.midtier.proto.containertag.MutableTypeSystem;
import com.google.tagmanager.protobuf.AbstractMutableMessageLite;
import com.google.tagmanager.protobuf.ByteString;
import com.google.tagmanager.protobuf.CodedInputStream;
import com.google.tagmanager.protobuf.CodedOutputStream;
import com.google.tagmanager.protobuf.ExtensionRegistryLite;
import com.google.tagmanager.protobuf.GeneratedMessageLite;
import com.google.tagmanager.protobuf.GeneratedMutableMessageLite;
import com.google.tagmanager.protobuf.Internal;
import com.google.tagmanager.protobuf.MessageLite;
import com.google.tagmanager.protobuf.MutableMessageLite;
import com.google.tagmanager.protobuf.Parser;
import com.google.tagmanager.protobuf.WireFormat;
import java.io.IOException;
import java.io.ObjectStreamException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public final class MutableDebug {
    private MutableDebug() {
    }

    public static void registerAllExtensions(ExtensionRegistryLite registry) {
        registry.add(MacroEvaluationInfo.macro);
    }

    /* loaded from: classes.dex */
    public static final class DebugEvents extends GeneratedMutableMessageLite<DebugEvents> implements MutableMessageLite {
        public static final int EVENT_FIELD_NUMBER = 1;
        private static final long serialVersionUID = 0;
        private List<EventInfo> event_ = null;
        private static volatile MessageLite immutableDefault = null;
        private static final DebugEvents defaultInstance = new DebugEvents(true);
        public static Parser<DebugEvents> PARSER = AbstractMutableMessageLite.internalNewParserForType(defaultInstance);

        private DebugEvents() {
            initFields();
        }

        private DebugEvents(boolean noInit) {
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: newMessageForType */
        public DebugEvents mo395newMessageForType() {
            return new DebugEvents();
        }

        public static DebugEvents newMessage() {
            return new DebugEvents();
        }

        private void initFields() {
        }

        public static DebugEvents getDefaultInstance() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite, com.google.tagmanager.protobuf.MessageLiteOrBuilder
        /* renamed from: getDefaultInstanceForType */
        public final DebugEvents mo453getDefaultInstanceForType() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MessageLite
        public Parser<DebugEvents> getParserForType() {
            return PARSER;
        }

        private void ensureEventInitialized() {
            if (this.event_ == null) {
                this.event_ = new ArrayList();
            }
        }

        public int getEventCount() {
            if (this.event_ == null) {
                return 0;
            }
            return this.event_.size();
        }

        public List<EventInfo> getEventList() {
            return this.event_ == null ? Collections.emptyList() : Collections.unmodifiableList(this.event_);
        }

        public List<EventInfo> getMutableEventList() {
            assertMutable();
            ensureEventInitialized();
            return this.event_;
        }

        public EventInfo getEvent(int index) {
            return this.event_.get(index);
        }

        public EventInfo getMutableEvent(int index) {
            return this.event_.get(index);
        }

        public EventInfo addEvent() {
            assertMutable();
            ensureEventInitialized();
            EventInfo value = EventInfo.newMessage();
            this.event_.add(value);
            return value;
        }

        public DebugEvents addEvent(EventInfo value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureEventInitialized();
            this.event_.add(value);
            return this;
        }

        public DebugEvents addAllEvent(Iterable<? extends EventInfo> values) {
            assertMutable();
            ensureEventInitialized();
            AbstractMutableMessageLite.addAll(values, this.event_);
            return this;
        }

        public DebugEvents setEvent(int index, EventInfo value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureEventInitialized();
            this.event_.set(index, value);
            return this;
        }

        public DebugEvents clearEvent() {
            assertMutable();
            this.event_ = null;
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MessageLiteOrBuilder
        public final boolean isInitialized() {
            for (int i = 0; i < getEventCount(); i++) {
                if (!getEvent(i).isInitialized()) {
                    return false;
                }
            }
            return true;
        }

        @Override // com.google.tagmanager.protobuf.AbstractMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clone */
        public DebugEvents mo418clone() {
            return mo395newMessageForType().mergeFrom(this);
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public DebugEvents mergeFrom(DebugEvents other) {
            if (this == other) {
                throw new IllegalArgumentException("mergeFrom(message) called on the same message.");
            }
            assertMutable();
            if (other != getDefaultInstance()) {
                if (other.event_ != null && !other.event_.isEmpty()) {
                    ensureEventInitialized();
                    AbstractMutableMessageLite.addAll(other.event_, this.event_);
                }
                this.unknownFields = this.unknownFields.concat(other.unknownFields);
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public boolean mergeFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) {
            assertMutable();
            try {
                ByteString.Output unknownFieldsOutput = ByteString.newOutput();
                CodedOutputStream unknownFieldsCodedOutput = CodedOutputStream.newInstance(unknownFieldsOutput);
                boolean done = false;
                while (!done) {
                    int tag = input.readTag();
                    switch (tag) {
                        case 0:
                            done = true;
                            break;
                        case 10:
                            input.readMessage(addEvent(), extensionRegistry);
                            break;
                        default:
                            if (parseUnknownField(input, unknownFieldsCodedOutput, extensionRegistry, tag)) {
                                break;
                            } else {
                                done = true;
                                break;
                            }
                    }
                }
                unknownFieldsCodedOutput.flush();
                this.unknownFields = unknownFieldsOutput.toByteString();
                return true;
            } catch (IOException e) {
                return false;
            }
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public void writeToWithCachedSizes(CodedOutputStream output) throws IOException {
            int bytesWrittenBefore = output.getTotalBytesWritten();
            if (this.event_ != null) {
                for (int i = 0; i < this.event_.size(); i++) {
                    output.writeMessageWithCachedSizes(1, this.event_.get(i));
                }
            }
            output.writeRawBytes(this.unknownFields);
            int bytesWrittenAfter = output.getTotalBytesWritten();
            if (getCachedSize() != bytesWrittenAfter - bytesWrittenBefore) {
                throw new RuntimeException("Serialized size doesn't match cached size. You may forget to call getSerializedSize() or the message is being modified concurrently.");
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        public int getSerializedSize() {
            int size = 0;
            if (this.event_ != null) {
                for (int i = 0; i < this.event_.size(); i++) {
                    size += CodedOutputStream.computeMessageSize(1, this.event_.get(i));
                }
            }
            int size2 = size + this.unknownFields.size();
            this.cachedSize = size2;
            return size2;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public Object writeReplace() throws ObjectStreamException {
            return super.writeReplace();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clear */
        public DebugEvents mo454clear() {
            assertMutable();
            super.mo454clear();
            this.event_ = null;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof DebugEvents)) {
                return super.equals(obj);
            }
            DebugEvents other = (DebugEvents) obj;
            boolean result = 1 != 0 && getEventList().equals(other.getEventList());
            return result;
        }

        public int hashCode() {
            int hash = 41;
            if (getEventCount() > 0) {
                int hash2 = 1517 + 1;
                hash = 80454 + getEventList().hashCode();
            }
            return (hash * 29) + this.unknownFields.hashCode();
        }

        static {
            defaultInstance.initFields();
            defaultInstance.makeImmutable();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        protected MessageLite internalImmutableDefault() {
            if (immutableDefault == null) {
                immutableDefault = internalImmutableDefault("com.google.analytics.containertag.proto.Debug$DebugEvents");
            }
            return immutableDefault;
        }
    }

    /* loaded from: classes.dex */
    public static final class EventInfo extends GeneratedMutableMessageLite<EventInfo> implements MutableMessageLite {
        public static final int CONTAINER_ID_FIELD_NUMBER = 3;
        public static final int CONTAINER_VERSION_FIELD_NUMBER = 2;
        public static final int DATA_LAYER_EVENT_RESULT_FIELD_NUMBER = 7;
        public static final int EVENT_TYPE_FIELD_NUMBER = 1;
        public static final int KEY_FIELD_NUMBER = 4;
        public static final int MACRO_RESULT_FIELD_NUMBER = 6;
        private static final long serialVersionUID = 0;
        private int bitField0_;
        private DataLayerEventEvaluationInfo dataLayerEventResult_;
        private MacroEvaluationInfo macroResult_;
        private static volatile MessageLite immutableDefault = null;
        private static final EventInfo defaultInstance = new EventInfo(true);
        public static Parser<EventInfo> PARSER = AbstractMutableMessageLite.internalNewParserForType(defaultInstance);
        private EventType eventType_ = EventType.DATA_LAYER_EVENT;
        private Object containerVersion_ = Internal.EMPTY_BYTE_ARRAY;
        private Object containerId_ = Internal.EMPTY_BYTE_ARRAY;
        private Object key_ = Internal.EMPTY_BYTE_ARRAY;

        private EventInfo() {
            initFields();
        }

        private EventInfo(boolean noInit) {
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: newMessageForType */
        public EventInfo mo395newMessageForType() {
            return new EventInfo();
        }

        public static EventInfo newMessage() {
            return new EventInfo();
        }

        private void initFields() {
            this.eventType_ = EventType.DATA_LAYER_EVENT;
            this.macroResult_ = MacroEvaluationInfo.getDefaultInstance();
            this.dataLayerEventResult_ = DataLayerEventEvaluationInfo.getDefaultInstance();
        }

        public static EventInfo getDefaultInstance() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite, com.google.tagmanager.protobuf.MessageLiteOrBuilder
        /* renamed from: getDefaultInstanceForType */
        public final EventInfo mo453getDefaultInstanceForType() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MessageLite
        public Parser<EventInfo> getParserForType() {
            return PARSER;
        }

        /* loaded from: classes.dex */
        public enum EventType implements Internal.EnumLite {
            DATA_LAYER_EVENT(0, 1),
            MACRO_REFERENCE(1, 2);
            
            public static final int DATA_LAYER_EVENT_VALUE = 1;
            public static final int MACRO_REFERENCE_VALUE = 2;
            private static Internal.EnumLiteMap<EventType> internalValueMap = new Internal.EnumLiteMap<EventType>() { // from class: com.google.analytics.containertag.proto.MutableDebug.EventInfo.EventType.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.google.tagmanager.protobuf.Internal.EnumLiteMap
                /* renamed from: findValueByNumber */
                public EventType mo329findValueByNumber(int number) {
                    return EventType.valueOf(number);
                }
            };
            private final int value;

            @Override // com.google.tagmanager.protobuf.Internal.EnumLite
            public final int getNumber() {
                return this.value;
            }

            public static EventType valueOf(int value) {
                switch (value) {
                    case 1:
                        return DATA_LAYER_EVENT;
                    case 2:
                        return MACRO_REFERENCE;
                    default:
                        return null;
                }
            }

            public static Internal.EnumLiteMap<EventType> internalGetValueMap() {
                return internalValueMap;
            }

            EventType(int index, int value) {
                this.value = value;
            }
        }

        public boolean hasEventType() {
            return (this.bitField0_ & 1) == 1;
        }

        public EventType getEventType() {
            return this.eventType_;
        }

        public EventInfo setEventType(EventType value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 1;
            this.eventType_ = value;
            return this;
        }

        public EventInfo clearEventType() {
            assertMutable();
            this.bitField0_ &= -2;
            this.eventType_ = EventType.DATA_LAYER_EVENT;
            return this;
        }

        public boolean hasContainerVersion() {
            return (this.bitField0_ & 2) == 2;
        }

        public String getContainerVersion() {
            Object ref = this.containerVersion_;
            if (ref instanceof String) {
                return (String) ref;
            }
            byte[] byteArray = (byte[]) ref;
            String s = Internal.toStringUtf8(byteArray);
            if (Internal.isValidUtf8(byteArray)) {
                this.containerVersion_ = s;
            }
            return s;
        }

        public byte[] getContainerVersionAsBytes() {
            Object ref = this.containerVersion_;
            if (ref instanceof String) {
                String s = (String) ref;
                byte[] byteArray = Internal.toByteArray(s);
                this.containerVersion_ = byteArray;
                return byteArray;
            }
            return (byte[]) ref;
        }

        public EventInfo setContainerVersion(String value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 2;
            this.containerVersion_ = value;
            return this;
        }

        public EventInfo setContainerVersionAsBytes(byte[] value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 2;
            this.containerVersion_ = value;
            return this;
        }

        public EventInfo clearContainerVersion() {
            assertMutable();
            this.bitField0_ &= -3;
            this.containerVersion_ = Internal.EMPTY_BYTE_ARRAY;
            return this;
        }

        public boolean hasContainerId() {
            return (this.bitField0_ & 4) == 4;
        }

        public String getContainerId() {
            Object ref = this.containerId_;
            if (ref instanceof String) {
                return (String) ref;
            }
            byte[] byteArray = (byte[]) ref;
            String s = Internal.toStringUtf8(byteArray);
            if (Internal.isValidUtf8(byteArray)) {
                this.containerId_ = s;
            }
            return s;
        }

        public byte[] getContainerIdAsBytes() {
            Object ref = this.containerId_;
            if (ref instanceof String) {
                String s = (String) ref;
                byte[] byteArray = Internal.toByteArray(s);
                this.containerId_ = byteArray;
                return byteArray;
            }
            return (byte[]) ref;
        }

        public EventInfo setContainerId(String value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 4;
            this.containerId_ = value;
            return this;
        }

        public EventInfo setContainerIdAsBytes(byte[] value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 4;
            this.containerId_ = value;
            return this;
        }

        public EventInfo clearContainerId() {
            assertMutable();
            this.bitField0_ &= -5;
            this.containerId_ = Internal.EMPTY_BYTE_ARRAY;
            return this;
        }

        public boolean hasKey() {
            return (this.bitField0_ & 8) == 8;
        }

        public String getKey() {
            Object ref = this.key_;
            if (ref instanceof String) {
                return (String) ref;
            }
            byte[] byteArray = (byte[]) ref;
            String s = Internal.toStringUtf8(byteArray);
            if (Internal.isValidUtf8(byteArray)) {
                this.key_ = s;
            }
            return s;
        }

        public byte[] getKeyAsBytes() {
            Object ref = this.key_;
            if (ref instanceof String) {
                String s = (String) ref;
                byte[] byteArray = Internal.toByteArray(s);
                this.key_ = byteArray;
                return byteArray;
            }
            return (byte[]) ref;
        }

        public EventInfo setKey(String value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 8;
            this.key_ = value;
            return this;
        }

        public EventInfo setKeyAsBytes(byte[] value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 8;
            this.key_ = value;
            return this;
        }

        public EventInfo clearKey() {
            assertMutable();
            this.bitField0_ &= -9;
            this.key_ = Internal.EMPTY_BYTE_ARRAY;
            return this;
        }

        private void ensureMacroResultInitialized() {
            if (this.macroResult_ == MacroEvaluationInfo.getDefaultInstance()) {
                this.macroResult_ = MacroEvaluationInfo.newMessage();
            }
        }

        public boolean hasMacroResult() {
            return (this.bitField0_ & 16) == 16;
        }

        public MacroEvaluationInfo getMacroResult() {
            return this.macroResult_;
        }

        public MacroEvaluationInfo getMutableMacroResult() {
            assertMutable();
            ensureMacroResultInitialized();
            this.bitField0_ |= 16;
            return this.macroResult_;
        }

        public EventInfo setMacroResult(MacroEvaluationInfo value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 16;
            this.macroResult_ = value;
            return this;
        }

        public EventInfo clearMacroResult() {
            assertMutable();
            this.bitField0_ &= -17;
            if (this.macroResult_ != MacroEvaluationInfo.getDefaultInstance()) {
                this.macroResult_.mo454clear();
            }
            return this;
        }

        private void ensureDataLayerEventResultInitialized() {
            if (this.dataLayerEventResult_ == DataLayerEventEvaluationInfo.getDefaultInstance()) {
                this.dataLayerEventResult_ = DataLayerEventEvaluationInfo.newMessage();
            }
        }

        public boolean hasDataLayerEventResult() {
            return (this.bitField0_ & 32) == 32;
        }

        public DataLayerEventEvaluationInfo getDataLayerEventResult() {
            return this.dataLayerEventResult_;
        }

        public DataLayerEventEvaluationInfo getMutableDataLayerEventResult() {
            assertMutable();
            ensureDataLayerEventResultInitialized();
            this.bitField0_ |= 32;
            return this.dataLayerEventResult_;
        }

        public EventInfo setDataLayerEventResult(DataLayerEventEvaluationInfo value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 32;
            this.dataLayerEventResult_ = value;
            return this;
        }

        public EventInfo clearDataLayerEventResult() {
            assertMutable();
            this.bitField0_ &= -33;
            if (this.dataLayerEventResult_ != DataLayerEventEvaluationInfo.getDefaultInstance()) {
                this.dataLayerEventResult_.mo454clear();
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MessageLiteOrBuilder
        public final boolean isInitialized() {
            if (!hasMacroResult() || getMacroResult().isInitialized()) {
                return !hasDataLayerEventResult() || getDataLayerEventResult().isInitialized();
            }
            return false;
        }

        @Override // com.google.tagmanager.protobuf.AbstractMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clone */
        public EventInfo mo418clone() {
            return mo395newMessageForType().mergeFrom(this);
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public EventInfo mergeFrom(EventInfo other) {
            if (this == other) {
                throw new IllegalArgumentException("mergeFrom(message) called on the same message.");
            }
            assertMutable();
            if (other != getDefaultInstance()) {
                if (other.hasEventType()) {
                    setEventType(other.getEventType());
                }
                if (other.hasContainerVersion()) {
                    this.bitField0_ |= 2;
                    if (other.containerVersion_ instanceof String) {
                        this.containerVersion_ = other.containerVersion_;
                    } else {
                        byte[] ba = (byte[]) other.containerVersion_;
                        this.containerVersion_ = Arrays.copyOf(ba, ba.length);
                    }
                }
                if (other.hasContainerId()) {
                    this.bitField0_ |= 4;
                    if (other.containerId_ instanceof String) {
                        this.containerId_ = other.containerId_;
                    } else {
                        byte[] ba2 = (byte[]) other.containerId_;
                        this.containerId_ = Arrays.copyOf(ba2, ba2.length);
                    }
                }
                if (other.hasKey()) {
                    this.bitField0_ |= 8;
                    if (other.key_ instanceof String) {
                        this.key_ = other.key_;
                    } else {
                        byte[] ba3 = (byte[]) other.key_;
                        this.key_ = Arrays.copyOf(ba3, ba3.length);
                    }
                }
                if (other.hasMacroResult()) {
                    ensureMacroResultInitialized();
                    this.macroResult_.mergeFrom(other.getMacroResult());
                    this.bitField0_ |= 16;
                }
                if (other.hasDataLayerEventResult()) {
                    ensureDataLayerEventResultInitialized();
                    this.dataLayerEventResult_.mergeFrom(other.getDataLayerEventResult());
                    this.bitField0_ |= 32;
                }
                this.unknownFields = this.unknownFields.concat(other.unknownFields);
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public boolean mergeFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) {
            assertMutable();
            try {
                ByteString.Output unknownFieldsOutput = ByteString.newOutput();
                CodedOutputStream unknownFieldsCodedOutput = CodedOutputStream.newInstance(unknownFieldsOutput);
                boolean done = false;
                while (!done) {
                    int tag = input.readTag();
                    switch (tag) {
                        case 0:
                            done = true;
                            break;
                        case 8:
                            int rawValue = input.readEnum();
                            EventType value = EventType.valueOf(rawValue);
                            if (value == null) {
                                unknownFieldsCodedOutput.writeRawVarint32(tag);
                                unknownFieldsCodedOutput.writeRawVarint32(rawValue);
                                break;
                            } else {
                                this.bitField0_ |= 1;
                                this.eventType_ = value;
                                break;
                            }
                        case 18:
                            this.bitField0_ |= 2;
                            this.containerVersion_ = input.readByteArray();
                            break;
                        case 26:
                            this.bitField0_ |= 4;
                            this.containerId_ = input.readByteArray();
                            break;
                        case 34:
                            this.bitField0_ |= 8;
                            this.key_ = input.readByteArray();
                            break;
                        case 50:
                            if (this.macroResult_ == MacroEvaluationInfo.getDefaultInstance()) {
                                this.macroResult_ = MacroEvaluationInfo.newMessage();
                            }
                            this.bitField0_ |= 16;
                            input.readMessage(this.macroResult_, extensionRegistry);
                            break;
                        case 58:
                            if (this.dataLayerEventResult_ == DataLayerEventEvaluationInfo.getDefaultInstance()) {
                                this.dataLayerEventResult_ = DataLayerEventEvaluationInfo.newMessage();
                            }
                            this.bitField0_ |= 32;
                            input.readMessage(this.dataLayerEventResult_, extensionRegistry);
                            break;
                        default:
                            if (parseUnknownField(input, unknownFieldsCodedOutput, extensionRegistry, tag)) {
                                break;
                            } else {
                                done = true;
                                break;
                            }
                    }
                }
                unknownFieldsCodedOutput.flush();
                this.unknownFields = unknownFieldsOutput.toByteString();
                return true;
            } catch (IOException e) {
                return false;
            }
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public void writeToWithCachedSizes(CodedOutputStream output) throws IOException {
            int bytesWrittenBefore = output.getTotalBytesWritten();
            if ((this.bitField0_ & 1) == 1) {
                output.writeEnum(1, this.eventType_.getNumber());
            }
            if ((this.bitField0_ & 2) == 2) {
                output.writeByteArray(2, getContainerVersionAsBytes());
            }
            if ((this.bitField0_ & 4) == 4) {
                output.writeByteArray(3, getContainerIdAsBytes());
            }
            if ((this.bitField0_ & 8) == 8) {
                output.writeByteArray(4, getKeyAsBytes());
            }
            if ((this.bitField0_ & 16) == 16) {
                output.writeMessageWithCachedSizes(6, this.macroResult_);
            }
            if ((this.bitField0_ & 32) == 32) {
                output.writeMessageWithCachedSizes(7, this.dataLayerEventResult_);
            }
            output.writeRawBytes(this.unknownFields);
            int bytesWrittenAfter = output.getTotalBytesWritten();
            if (getCachedSize() != bytesWrittenAfter - bytesWrittenBefore) {
                throw new RuntimeException("Serialized size doesn't match cached size. You may forget to call getSerializedSize() or the message is being modified concurrently.");
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        public int getSerializedSize() {
            int size = 0;
            if ((this.bitField0_ & 1) == 1) {
                size = 0 + CodedOutputStream.computeEnumSize(1, this.eventType_.getNumber());
            }
            if ((this.bitField0_ & 2) == 2) {
                size += CodedOutputStream.computeByteArraySize(2, getContainerVersionAsBytes());
            }
            if ((this.bitField0_ & 4) == 4) {
                size += CodedOutputStream.computeByteArraySize(3, getContainerIdAsBytes());
            }
            if ((this.bitField0_ & 8) == 8) {
                size += CodedOutputStream.computeByteArraySize(4, getKeyAsBytes());
            }
            if ((this.bitField0_ & 16) == 16) {
                size += CodedOutputStream.computeMessageSize(6, this.macroResult_);
            }
            if ((this.bitField0_ & 32) == 32) {
                size += CodedOutputStream.computeMessageSize(7, this.dataLayerEventResult_);
            }
            int size2 = size + this.unknownFields.size();
            this.cachedSize = size2;
            return size2;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public Object writeReplace() throws ObjectStreamException {
            return super.writeReplace();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clear */
        public EventInfo mo454clear() {
            assertMutable();
            super.mo454clear();
            this.eventType_ = EventType.DATA_LAYER_EVENT;
            this.bitField0_ &= -2;
            this.containerVersion_ = Internal.EMPTY_BYTE_ARRAY;
            this.bitField0_ &= -3;
            this.containerId_ = Internal.EMPTY_BYTE_ARRAY;
            this.bitField0_ &= -5;
            this.key_ = Internal.EMPTY_BYTE_ARRAY;
            this.bitField0_ &= -9;
            if (this.macroResult_ != MacroEvaluationInfo.getDefaultInstance()) {
                this.macroResult_.mo454clear();
            }
            this.bitField0_ &= -17;
            if (this.dataLayerEventResult_ != DataLayerEventEvaluationInfo.getDefaultInstance()) {
                this.dataLayerEventResult_.mo454clear();
            }
            this.bitField0_ &= -33;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof EventInfo)) {
                return super.equals(obj);
            }
            EventInfo other = (EventInfo) obj;
            boolean result = 1 != 0 && hasEventType() == other.hasEventType();
            if (hasEventType()) {
                result = result && getEventType() == other.getEventType();
            }
            boolean result2 = result && hasContainerVersion() == other.hasContainerVersion();
            if (hasContainerVersion()) {
                result2 = result2 && getContainerVersion().equals(other.getContainerVersion());
            }
            boolean result3 = result2 && hasContainerId() == other.hasContainerId();
            if (hasContainerId()) {
                result3 = result3 && getContainerId().equals(other.getContainerId());
            }
            boolean result4 = result3 && hasKey() == other.hasKey();
            if (hasKey()) {
                result4 = result4 && getKey().equals(other.getKey());
            }
            boolean result5 = result4 && hasMacroResult() == other.hasMacroResult();
            if (hasMacroResult()) {
                result5 = result5 && getMacroResult().equals(other.getMacroResult());
            }
            boolean result6 = result5 && hasDataLayerEventResult() == other.hasDataLayerEventResult();
            if (hasDataLayerEventResult()) {
                result6 = result6 && getDataLayerEventResult().equals(other.getDataLayerEventResult());
            }
            return result6;
        }

        public int hashCode() {
            int hash = 41;
            if (hasEventType()) {
                int hash2 = 1517 + 1;
                hash = 80454 + Internal.hashEnum(getEventType());
            }
            if (hasContainerVersion()) {
                hash = (((hash * 37) + 2) * 53) + getContainerVersion().hashCode();
            }
            if (hasContainerId()) {
                hash = (((hash * 37) + 3) * 53) + getContainerId().hashCode();
            }
            if (hasKey()) {
                hash = (((hash * 37) + 4) * 53) + getKey().hashCode();
            }
            if (hasMacroResult()) {
                hash = (((hash * 37) + 6) * 53) + getMacroResult().hashCode();
            }
            if (hasDataLayerEventResult()) {
                hash = (((hash * 37) + 7) * 53) + getDataLayerEventResult().hashCode();
            }
            return (hash * 29) + this.unknownFields.hashCode();
        }

        static {
            defaultInstance.initFields();
            defaultInstance.makeImmutable();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        protected MessageLite internalImmutableDefault() {
            if (immutableDefault == null) {
                immutableDefault = internalImmutableDefault("com.google.analytics.containertag.proto.Debug$EventInfo");
            }
            return immutableDefault;
        }
    }

    /* loaded from: classes.dex */
    public static final class ResolvedRule extends GeneratedMutableMessageLite<ResolvedRule> implements MutableMessageLite {
        public static final int ADD_MACROS_FIELD_NUMBER = 5;
        public static final int ADD_TAGS_FIELD_NUMBER = 3;
        public static final int NEGATIVE_PREDICATES_FIELD_NUMBER = 2;
        public static final int POSITIVE_PREDICATES_FIELD_NUMBER = 1;
        public static final int REMOVE_MACROS_FIELD_NUMBER = 6;
        public static final int REMOVE_TAGS_FIELD_NUMBER = 4;
        public static final int RESULT_FIELD_NUMBER = 7;
        private static final long serialVersionUID = 0;
        private int bitField0_;
        private MutableTypeSystem.Value result_;
        private static volatile MessageLite immutableDefault = null;
        private static final ResolvedRule defaultInstance = new ResolvedRule(true);
        public static Parser<ResolvedRule> PARSER = AbstractMutableMessageLite.internalNewParserForType(defaultInstance);
        private List<ResolvedFunctionCall> positivePredicates_ = null;
        private List<ResolvedFunctionCall> negativePredicates_ = null;
        private List<ResolvedFunctionCall> addTags_ = null;
        private List<ResolvedFunctionCall> removeTags_ = null;
        private List<ResolvedFunctionCall> addMacros_ = null;
        private List<ResolvedFunctionCall> removeMacros_ = null;

        private ResolvedRule() {
            initFields();
        }

        private ResolvedRule(boolean noInit) {
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: newMessageForType */
        public ResolvedRule mo395newMessageForType() {
            return new ResolvedRule();
        }

        public static ResolvedRule newMessage() {
            return new ResolvedRule();
        }

        private void initFields() {
            this.result_ = MutableTypeSystem.Value.getDefaultInstance();
        }

        public static ResolvedRule getDefaultInstance() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite, com.google.tagmanager.protobuf.MessageLiteOrBuilder
        /* renamed from: getDefaultInstanceForType */
        public final ResolvedRule mo453getDefaultInstanceForType() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MessageLite
        public Parser<ResolvedRule> getParserForType() {
            return PARSER;
        }

        private void ensurePositivePredicatesInitialized() {
            if (this.positivePredicates_ == null) {
                this.positivePredicates_ = new ArrayList();
            }
        }

        public int getPositivePredicatesCount() {
            if (this.positivePredicates_ == null) {
                return 0;
            }
            return this.positivePredicates_.size();
        }

        public List<ResolvedFunctionCall> getPositivePredicatesList() {
            return this.positivePredicates_ == null ? Collections.emptyList() : Collections.unmodifiableList(this.positivePredicates_);
        }

        public List<ResolvedFunctionCall> getMutablePositivePredicatesList() {
            assertMutable();
            ensurePositivePredicatesInitialized();
            return this.positivePredicates_;
        }

        public ResolvedFunctionCall getPositivePredicates(int index) {
            return this.positivePredicates_.get(index);
        }

        public ResolvedFunctionCall getMutablePositivePredicates(int index) {
            return this.positivePredicates_.get(index);
        }

        public ResolvedFunctionCall addPositivePredicates() {
            assertMutable();
            ensurePositivePredicatesInitialized();
            ResolvedFunctionCall value = ResolvedFunctionCall.newMessage();
            this.positivePredicates_.add(value);
            return value;
        }

        public ResolvedRule addPositivePredicates(ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensurePositivePredicatesInitialized();
            this.positivePredicates_.add(value);
            return this;
        }

        public ResolvedRule addAllPositivePredicates(Iterable<? extends ResolvedFunctionCall> values) {
            assertMutable();
            ensurePositivePredicatesInitialized();
            AbstractMutableMessageLite.addAll(values, this.positivePredicates_);
            return this;
        }

        public ResolvedRule setPositivePredicates(int index, ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensurePositivePredicatesInitialized();
            this.positivePredicates_.set(index, value);
            return this;
        }

        public ResolvedRule clearPositivePredicates() {
            assertMutable();
            this.positivePredicates_ = null;
            return this;
        }

        private void ensureNegativePredicatesInitialized() {
            if (this.negativePredicates_ == null) {
                this.negativePredicates_ = new ArrayList();
            }
        }

        public int getNegativePredicatesCount() {
            if (this.negativePredicates_ == null) {
                return 0;
            }
            return this.negativePredicates_.size();
        }

        public List<ResolvedFunctionCall> getNegativePredicatesList() {
            return this.negativePredicates_ == null ? Collections.emptyList() : Collections.unmodifiableList(this.negativePredicates_);
        }

        public List<ResolvedFunctionCall> getMutableNegativePredicatesList() {
            assertMutable();
            ensureNegativePredicatesInitialized();
            return this.negativePredicates_;
        }

        public ResolvedFunctionCall getNegativePredicates(int index) {
            return this.negativePredicates_.get(index);
        }

        public ResolvedFunctionCall getMutableNegativePredicates(int index) {
            return this.negativePredicates_.get(index);
        }

        public ResolvedFunctionCall addNegativePredicates() {
            assertMutable();
            ensureNegativePredicatesInitialized();
            ResolvedFunctionCall value = ResolvedFunctionCall.newMessage();
            this.negativePredicates_.add(value);
            return value;
        }

        public ResolvedRule addNegativePredicates(ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureNegativePredicatesInitialized();
            this.negativePredicates_.add(value);
            return this;
        }

        public ResolvedRule addAllNegativePredicates(Iterable<? extends ResolvedFunctionCall> values) {
            assertMutable();
            ensureNegativePredicatesInitialized();
            AbstractMutableMessageLite.addAll(values, this.negativePredicates_);
            return this;
        }

        public ResolvedRule setNegativePredicates(int index, ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureNegativePredicatesInitialized();
            this.negativePredicates_.set(index, value);
            return this;
        }

        public ResolvedRule clearNegativePredicates() {
            assertMutable();
            this.negativePredicates_ = null;
            return this;
        }

        private void ensureAddTagsInitialized() {
            if (this.addTags_ == null) {
                this.addTags_ = new ArrayList();
            }
        }

        public int getAddTagsCount() {
            if (this.addTags_ == null) {
                return 0;
            }
            return this.addTags_.size();
        }

        public List<ResolvedFunctionCall> getAddTagsList() {
            return this.addTags_ == null ? Collections.emptyList() : Collections.unmodifiableList(this.addTags_);
        }

        public List<ResolvedFunctionCall> getMutableAddTagsList() {
            assertMutable();
            ensureAddTagsInitialized();
            return this.addTags_;
        }

        public ResolvedFunctionCall getAddTags(int index) {
            return this.addTags_.get(index);
        }

        public ResolvedFunctionCall getMutableAddTags(int index) {
            return this.addTags_.get(index);
        }

        public ResolvedFunctionCall addAddTags() {
            assertMutable();
            ensureAddTagsInitialized();
            ResolvedFunctionCall value = ResolvedFunctionCall.newMessage();
            this.addTags_.add(value);
            return value;
        }

        public ResolvedRule addAddTags(ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureAddTagsInitialized();
            this.addTags_.add(value);
            return this;
        }

        public ResolvedRule addAllAddTags(Iterable<? extends ResolvedFunctionCall> values) {
            assertMutable();
            ensureAddTagsInitialized();
            AbstractMutableMessageLite.addAll(values, this.addTags_);
            return this;
        }

        public ResolvedRule setAddTags(int index, ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureAddTagsInitialized();
            this.addTags_.set(index, value);
            return this;
        }

        public ResolvedRule clearAddTags() {
            assertMutable();
            this.addTags_ = null;
            return this;
        }

        private void ensureRemoveTagsInitialized() {
            if (this.removeTags_ == null) {
                this.removeTags_ = new ArrayList();
            }
        }

        public int getRemoveTagsCount() {
            if (this.removeTags_ == null) {
                return 0;
            }
            return this.removeTags_.size();
        }

        public List<ResolvedFunctionCall> getRemoveTagsList() {
            return this.removeTags_ == null ? Collections.emptyList() : Collections.unmodifiableList(this.removeTags_);
        }

        public List<ResolvedFunctionCall> getMutableRemoveTagsList() {
            assertMutable();
            ensureRemoveTagsInitialized();
            return this.removeTags_;
        }

        public ResolvedFunctionCall getRemoveTags(int index) {
            return this.removeTags_.get(index);
        }

        public ResolvedFunctionCall getMutableRemoveTags(int index) {
            return this.removeTags_.get(index);
        }

        public ResolvedFunctionCall addRemoveTags() {
            assertMutable();
            ensureRemoveTagsInitialized();
            ResolvedFunctionCall value = ResolvedFunctionCall.newMessage();
            this.removeTags_.add(value);
            return value;
        }

        public ResolvedRule addRemoveTags(ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureRemoveTagsInitialized();
            this.removeTags_.add(value);
            return this;
        }

        public ResolvedRule addAllRemoveTags(Iterable<? extends ResolvedFunctionCall> values) {
            assertMutable();
            ensureRemoveTagsInitialized();
            AbstractMutableMessageLite.addAll(values, this.removeTags_);
            return this;
        }

        public ResolvedRule setRemoveTags(int index, ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureRemoveTagsInitialized();
            this.removeTags_.set(index, value);
            return this;
        }

        public ResolvedRule clearRemoveTags() {
            assertMutable();
            this.removeTags_ = null;
            return this;
        }

        private void ensureAddMacrosInitialized() {
            if (this.addMacros_ == null) {
                this.addMacros_ = new ArrayList();
            }
        }

        public int getAddMacrosCount() {
            if (this.addMacros_ == null) {
                return 0;
            }
            return this.addMacros_.size();
        }

        public List<ResolvedFunctionCall> getAddMacrosList() {
            return this.addMacros_ == null ? Collections.emptyList() : Collections.unmodifiableList(this.addMacros_);
        }

        public List<ResolvedFunctionCall> getMutableAddMacrosList() {
            assertMutable();
            ensureAddMacrosInitialized();
            return this.addMacros_;
        }

        public ResolvedFunctionCall getAddMacros(int index) {
            return this.addMacros_.get(index);
        }

        public ResolvedFunctionCall getMutableAddMacros(int index) {
            return this.addMacros_.get(index);
        }

        public ResolvedFunctionCall addAddMacros() {
            assertMutable();
            ensureAddMacrosInitialized();
            ResolvedFunctionCall value = ResolvedFunctionCall.newMessage();
            this.addMacros_.add(value);
            return value;
        }

        public ResolvedRule addAddMacros(ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureAddMacrosInitialized();
            this.addMacros_.add(value);
            return this;
        }

        public ResolvedRule addAllAddMacros(Iterable<? extends ResolvedFunctionCall> values) {
            assertMutable();
            ensureAddMacrosInitialized();
            AbstractMutableMessageLite.addAll(values, this.addMacros_);
            return this;
        }

        public ResolvedRule setAddMacros(int index, ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureAddMacrosInitialized();
            this.addMacros_.set(index, value);
            return this;
        }

        public ResolvedRule clearAddMacros() {
            assertMutable();
            this.addMacros_ = null;
            return this;
        }

        private void ensureRemoveMacrosInitialized() {
            if (this.removeMacros_ == null) {
                this.removeMacros_ = new ArrayList();
            }
        }

        public int getRemoveMacrosCount() {
            if (this.removeMacros_ == null) {
                return 0;
            }
            return this.removeMacros_.size();
        }

        public List<ResolvedFunctionCall> getRemoveMacrosList() {
            return this.removeMacros_ == null ? Collections.emptyList() : Collections.unmodifiableList(this.removeMacros_);
        }

        public List<ResolvedFunctionCall> getMutableRemoveMacrosList() {
            assertMutable();
            ensureRemoveMacrosInitialized();
            return this.removeMacros_;
        }

        public ResolvedFunctionCall getRemoveMacros(int index) {
            return this.removeMacros_.get(index);
        }

        public ResolvedFunctionCall getMutableRemoveMacros(int index) {
            return this.removeMacros_.get(index);
        }

        public ResolvedFunctionCall addRemoveMacros() {
            assertMutable();
            ensureRemoveMacrosInitialized();
            ResolvedFunctionCall value = ResolvedFunctionCall.newMessage();
            this.removeMacros_.add(value);
            return value;
        }

        public ResolvedRule addRemoveMacros(ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureRemoveMacrosInitialized();
            this.removeMacros_.add(value);
            return this;
        }

        public ResolvedRule addAllRemoveMacros(Iterable<? extends ResolvedFunctionCall> values) {
            assertMutable();
            ensureRemoveMacrosInitialized();
            AbstractMutableMessageLite.addAll(values, this.removeMacros_);
            return this;
        }

        public ResolvedRule setRemoveMacros(int index, ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureRemoveMacrosInitialized();
            this.removeMacros_.set(index, value);
            return this;
        }

        public ResolvedRule clearRemoveMacros() {
            assertMutable();
            this.removeMacros_ = null;
            return this;
        }

        private void ensureResultInitialized() {
            if (this.result_ == MutableTypeSystem.Value.getDefaultInstance()) {
                this.result_ = MutableTypeSystem.Value.newMessage();
            }
        }

        public boolean hasResult() {
            return (this.bitField0_ & 1) == 1;
        }

        public MutableTypeSystem.Value getResult() {
            return this.result_;
        }

        public MutableTypeSystem.Value getMutableResult() {
            assertMutable();
            ensureResultInitialized();
            this.bitField0_ |= 1;
            return this.result_;
        }

        public ResolvedRule setResult(MutableTypeSystem.Value value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 1;
            this.result_ = value;
            return this;
        }

        public ResolvedRule clearResult() {
            assertMutable();
            this.bitField0_ &= -2;
            if (this.result_ != MutableTypeSystem.Value.getDefaultInstance()) {
                this.result_.mo454clear();
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MessageLiteOrBuilder
        public final boolean isInitialized() {
            for (int i = 0; i < getPositivePredicatesCount(); i++) {
                if (!getPositivePredicates(i).isInitialized()) {
                    return false;
                }
            }
            for (int i2 = 0; i2 < getNegativePredicatesCount(); i2++) {
                if (!getNegativePredicates(i2).isInitialized()) {
                    return false;
                }
            }
            for (int i3 = 0; i3 < getAddTagsCount(); i3++) {
                if (!getAddTags(i3).isInitialized()) {
                    return false;
                }
            }
            for (int i4 = 0; i4 < getRemoveTagsCount(); i4++) {
                if (!getRemoveTags(i4).isInitialized()) {
                    return false;
                }
            }
            for (int i5 = 0; i5 < getAddMacrosCount(); i5++) {
                if (!getAddMacros(i5).isInitialized()) {
                    return false;
                }
            }
            for (int i6 = 0; i6 < getRemoveMacrosCount(); i6++) {
                if (!getRemoveMacros(i6).isInitialized()) {
                    return false;
                }
            }
            return !hasResult() || getResult().isInitialized();
        }

        @Override // com.google.tagmanager.protobuf.AbstractMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clone */
        public ResolvedRule mo418clone() {
            return mo395newMessageForType().mergeFrom(this);
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public ResolvedRule mergeFrom(ResolvedRule other) {
            if (this == other) {
                throw new IllegalArgumentException("mergeFrom(message) called on the same message.");
            }
            assertMutable();
            if (other != getDefaultInstance()) {
                if (other.positivePredicates_ != null && !other.positivePredicates_.isEmpty()) {
                    ensurePositivePredicatesInitialized();
                    AbstractMutableMessageLite.addAll(other.positivePredicates_, this.positivePredicates_);
                }
                if (other.negativePredicates_ != null && !other.negativePredicates_.isEmpty()) {
                    ensureNegativePredicatesInitialized();
                    AbstractMutableMessageLite.addAll(other.negativePredicates_, this.negativePredicates_);
                }
                if (other.addTags_ != null && !other.addTags_.isEmpty()) {
                    ensureAddTagsInitialized();
                    AbstractMutableMessageLite.addAll(other.addTags_, this.addTags_);
                }
                if (other.removeTags_ != null && !other.removeTags_.isEmpty()) {
                    ensureRemoveTagsInitialized();
                    AbstractMutableMessageLite.addAll(other.removeTags_, this.removeTags_);
                }
                if (other.addMacros_ != null && !other.addMacros_.isEmpty()) {
                    ensureAddMacrosInitialized();
                    AbstractMutableMessageLite.addAll(other.addMacros_, this.addMacros_);
                }
                if (other.removeMacros_ != null && !other.removeMacros_.isEmpty()) {
                    ensureRemoveMacrosInitialized();
                    AbstractMutableMessageLite.addAll(other.removeMacros_, this.removeMacros_);
                }
                if (other.hasResult()) {
                    ensureResultInitialized();
                    this.result_.mergeFrom(other.getResult());
                    this.bitField0_ |= 1;
                }
                this.unknownFields = this.unknownFields.concat(other.unknownFields);
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public boolean mergeFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) {
            assertMutable();
            try {
                ByteString.Output unknownFieldsOutput = ByteString.newOutput();
                CodedOutputStream unknownFieldsCodedOutput = CodedOutputStream.newInstance(unknownFieldsOutput);
                boolean done = false;
                while (!done) {
                    int tag = input.readTag();
                    switch (tag) {
                        case 0:
                            done = true;
                            break;
                        case 10:
                            input.readMessage(addPositivePredicates(), extensionRegistry);
                            break;
                        case 18:
                            input.readMessage(addNegativePredicates(), extensionRegistry);
                            break;
                        case 26:
                            input.readMessage(addAddTags(), extensionRegistry);
                            break;
                        case 34:
                            input.readMessage(addRemoveTags(), extensionRegistry);
                            break;
                        case 42:
                            input.readMessage(addAddMacros(), extensionRegistry);
                            break;
                        case 50:
                            input.readMessage(addRemoveMacros(), extensionRegistry);
                            break;
                        case 58:
                            if (this.result_ == MutableTypeSystem.Value.getDefaultInstance()) {
                                this.result_ = MutableTypeSystem.Value.newMessage();
                            }
                            this.bitField0_ |= 1;
                            input.readMessage(this.result_, extensionRegistry);
                            break;
                        default:
                            if (parseUnknownField(input, unknownFieldsCodedOutput, extensionRegistry, tag)) {
                                break;
                            } else {
                                done = true;
                                break;
                            }
                    }
                }
                unknownFieldsCodedOutput.flush();
                this.unknownFields = unknownFieldsOutput.toByteString();
                return true;
            } catch (IOException e) {
                return false;
            }
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public void writeToWithCachedSizes(CodedOutputStream output) throws IOException {
            int bytesWrittenBefore = output.getTotalBytesWritten();
            if (this.positivePredicates_ != null) {
                for (int i = 0; i < this.positivePredicates_.size(); i++) {
                    output.writeMessageWithCachedSizes(1, this.positivePredicates_.get(i));
                }
            }
            if (this.negativePredicates_ != null) {
                for (int i2 = 0; i2 < this.negativePredicates_.size(); i2++) {
                    output.writeMessageWithCachedSizes(2, this.negativePredicates_.get(i2));
                }
            }
            if (this.addTags_ != null) {
                for (int i3 = 0; i3 < this.addTags_.size(); i3++) {
                    output.writeMessageWithCachedSizes(3, this.addTags_.get(i3));
                }
            }
            if (this.removeTags_ != null) {
                for (int i4 = 0; i4 < this.removeTags_.size(); i4++) {
                    output.writeMessageWithCachedSizes(4, this.removeTags_.get(i4));
                }
            }
            if (this.addMacros_ != null) {
                for (int i5 = 0; i5 < this.addMacros_.size(); i5++) {
                    output.writeMessageWithCachedSizes(5, this.addMacros_.get(i5));
                }
            }
            if (this.removeMacros_ != null) {
                for (int i6 = 0; i6 < this.removeMacros_.size(); i6++) {
                    output.writeMessageWithCachedSizes(6, this.removeMacros_.get(i6));
                }
            }
            if ((this.bitField0_ & 1) == 1) {
                output.writeMessageWithCachedSizes(7, this.result_);
            }
            output.writeRawBytes(this.unknownFields);
            int bytesWrittenAfter = output.getTotalBytesWritten();
            if (getCachedSize() != bytesWrittenAfter - bytesWrittenBefore) {
                throw new RuntimeException("Serialized size doesn't match cached size. You may forget to call getSerializedSize() or the message is being modified concurrently.");
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        public int getSerializedSize() {
            int size = 0;
            if (this.positivePredicates_ != null) {
                for (int i = 0; i < this.positivePredicates_.size(); i++) {
                    size += CodedOutputStream.computeMessageSize(1, this.positivePredicates_.get(i));
                }
            }
            if (this.negativePredicates_ != null) {
                for (int i2 = 0; i2 < this.negativePredicates_.size(); i2++) {
                    size += CodedOutputStream.computeMessageSize(2, this.negativePredicates_.get(i2));
                }
            }
            if (this.addTags_ != null) {
                for (int i3 = 0; i3 < this.addTags_.size(); i3++) {
                    size += CodedOutputStream.computeMessageSize(3, this.addTags_.get(i3));
                }
            }
            if (this.removeTags_ != null) {
                for (int i4 = 0; i4 < this.removeTags_.size(); i4++) {
                    size += CodedOutputStream.computeMessageSize(4, this.removeTags_.get(i4));
                }
            }
            if (this.addMacros_ != null) {
                for (int i5 = 0; i5 < this.addMacros_.size(); i5++) {
                    size += CodedOutputStream.computeMessageSize(5, this.addMacros_.get(i5));
                }
            }
            if (this.removeMacros_ != null) {
                for (int i6 = 0; i6 < this.removeMacros_.size(); i6++) {
                    size += CodedOutputStream.computeMessageSize(6, this.removeMacros_.get(i6));
                }
            }
            if ((this.bitField0_ & 1) == 1) {
                size += CodedOutputStream.computeMessageSize(7, this.result_);
            }
            int size2 = size + this.unknownFields.size();
            this.cachedSize = size2;
            return size2;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public Object writeReplace() throws ObjectStreamException {
            return super.writeReplace();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clear */
        public ResolvedRule mo454clear() {
            assertMutable();
            super.mo454clear();
            this.positivePredicates_ = null;
            this.negativePredicates_ = null;
            this.addTags_ = null;
            this.removeTags_ = null;
            this.addMacros_ = null;
            this.removeMacros_ = null;
            if (this.result_ != MutableTypeSystem.Value.getDefaultInstance()) {
                this.result_.mo454clear();
            }
            this.bitField0_ &= -2;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof ResolvedRule)) {
                return super.equals(obj);
            }
            ResolvedRule other = (ResolvedRule) obj;
            boolean result = 1 != 0 && getPositivePredicatesList().equals(other.getPositivePredicatesList());
            boolean result2 = result && getNegativePredicatesList().equals(other.getNegativePredicatesList());
            boolean result3 = result2 && getAddTagsList().equals(other.getAddTagsList());
            boolean result4 = result3 && getRemoveTagsList().equals(other.getRemoveTagsList());
            boolean result5 = result4 && getAddMacrosList().equals(other.getAddMacrosList());
            boolean result6 = result5 && getRemoveMacrosList().equals(other.getRemoveMacrosList());
            boolean result7 = result6 && hasResult() == other.hasResult();
            if (hasResult()) {
                result7 = result7 && getResult().equals(other.getResult());
            }
            return result7;
        }

        public int hashCode() {
            int hash = 41;
            if (getPositivePredicatesCount() > 0) {
                int hash2 = 1517 + 1;
                hash = 80454 + getPositivePredicatesList().hashCode();
            }
            if (getNegativePredicatesCount() > 0) {
                hash = (((hash * 37) + 2) * 53) + getNegativePredicatesList().hashCode();
            }
            if (getAddTagsCount() > 0) {
                hash = (((hash * 37) + 3) * 53) + getAddTagsList().hashCode();
            }
            if (getRemoveTagsCount() > 0) {
                hash = (((hash * 37) + 4) * 53) + getRemoveTagsList().hashCode();
            }
            if (getAddMacrosCount() > 0) {
                hash = (((hash * 37) + 5) * 53) + getAddMacrosList().hashCode();
            }
            if (getRemoveMacrosCount() > 0) {
                hash = (((hash * 37) + 6) * 53) + getRemoveMacrosList().hashCode();
            }
            if (hasResult()) {
                hash = (((hash * 37) + 7) * 53) + getResult().hashCode();
            }
            return (hash * 29) + this.unknownFields.hashCode();
        }

        static {
            defaultInstance.initFields();
            defaultInstance.makeImmutable();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        protected MessageLite internalImmutableDefault() {
            if (immutableDefault == null) {
                immutableDefault = internalImmutableDefault("com.google.analytics.containertag.proto.Debug$ResolvedRule");
            }
            return immutableDefault;
        }
    }

    /* loaded from: classes.dex */
    public static final class ResolvedFunctionCall extends GeneratedMutableMessageLite<ResolvedFunctionCall> implements MutableMessageLite {
        public static final int ASSOCIATED_RULE_NAME_FIELD_NUMBER = 3;
        public static final int PROPERTIES_FIELD_NUMBER = 1;
        public static final int RESULT_FIELD_NUMBER = 2;
        private static final long serialVersionUID = 0;
        private int bitField0_;
        private MutableTypeSystem.Value result_;
        private static volatile MessageLite immutableDefault = null;
        private static final ResolvedFunctionCall defaultInstance = new ResolvedFunctionCall(true);
        public static Parser<ResolvedFunctionCall> PARSER = AbstractMutableMessageLite.internalNewParserForType(defaultInstance);
        private List<ResolvedProperty> properties_ = null;
        private Object associatedRuleName_ = Internal.EMPTY_BYTE_ARRAY;

        private ResolvedFunctionCall() {
            initFields();
        }

        private ResolvedFunctionCall(boolean noInit) {
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: newMessageForType */
        public ResolvedFunctionCall mo395newMessageForType() {
            return new ResolvedFunctionCall();
        }

        public static ResolvedFunctionCall newMessage() {
            return new ResolvedFunctionCall();
        }

        private void initFields() {
            this.result_ = MutableTypeSystem.Value.getDefaultInstance();
        }

        public static ResolvedFunctionCall getDefaultInstance() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite, com.google.tagmanager.protobuf.MessageLiteOrBuilder
        /* renamed from: getDefaultInstanceForType */
        public final ResolvedFunctionCall mo453getDefaultInstanceForType() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MessageLite
        public Parser<ResolvedFunctionCall> getParserForType() {
            return PARSER;
        }

        private void ensurePropertiesInitialized() {
            if (this.properties_ == null) {
                this.properties_ = new ArrayList();
            }
        }

        public int getPropertiesCount() {
            if (this.properties_ == null) {
                return 0;
            }
            return this.properties_.size();
        }

        public List<ResolvedProperty> getPropertiesList() {
            return this.properties_ == null ? Collections.emptyList() : Collections.unmodifiableList(this.properties_);
        }

        public List<ResolvedProperty> getMutablePropertiesList() {
            assertMutable();
            ensurePropertiesInitialized();
            return this.properties_;
        }

        public ResolvedProperty getProperties(int index) {
            return this.properties_.get(index);
        }

        public ResolvedProperty getMutableProperties(int index) {
            return this.properties_.get(index);
        }

        public ResolvedProperty addProperties() {
            assertMutable();
            ensurePropertiesInitialized();
            ResolvedProperty value = ResolvedProperty.newMessage();
            this.properties_.add(value);
            return value;
        }

        public ResolvedFunctionCall addProperties(ResolvedProperty value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensurePropertiesInitialized();
            this.properties_.add(value);
            return this;
        }

        public ResolvedFunctionCall addAllProperties(Iterable<? extends ResolvedProperty> values) {
            assertMutable();
            ensurePropertiesInitialized();
            AbstractMutableMessageLite.addAll(values, this.properties_);
            return this;
        }

        public ResolvedFunctionCall setProperties(int index, ResolvedProperty value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensurePropertiesInitialized();
            this.properties_.set(index, value);
            return this;
        }

        public ResolvedFunctionCall clearProperties() {
            assertMutable();
            this.properties_ = null;
            return this;
        }

        private void ensureResultInitialized() {
            if (this.result_ == MutableTypeSystem.Value.getDefaultInstance()) {
                this.result_ = MutableTypeSystem.Value.newMessage();
            }
        }

        public boolean hasResult() {
            return (this.bitField0_ & 1) == 1;
        }

        public MutableTypeSystem.Value getResult() {
            return this.result_;
        }

        public MutableTypeSystem.Value getMutableResult() {
            assertMutable();
            ensureResultInitialized();
            this.bitField0_ |= 1;
            return this.result_;
        }

        public ResolvedFunctionCall setResult(MutableTypeSystem.Value value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 1;
            this.result_ = value;
            return this;
        }

        public ResolvedFunctionCall clearResult() {
            assertMutable();
            this.bitField0_ &= -2;
            if (this.result_ != MutableTypeSystem.Value.getDefaultInstance()) {
                this.result_.mo454clear();
            }
            return this;
        }

        public boolean hasAssociatedRuleName() {
            return (this.bitField0_ & 2) == 2;
        }

        public String getAssociatedRuleName() {
            Object ref = this.associatedRuleName_;
            if (ref instanceof String) {
                return (String) ref;
            }
            byte[] byteArray = (byte[]) ref;
            String s = Internal.toStringUtf8(byteArray);
            if (Internal.isValidUtf8(byteArray)) {
                this.associatedRuleName_ = s;
            }
            return s;
        }

        public byte[] getAssociatedRuleNameAsBytes() {
            Object ref = this.associatedRuleName_;
            if (ref instanceof String) {
                String s = (String) ref;
                byte[] byteArray = Internal.toByteArray(s);
                this.associatedRuleName_ = byteArray;
                return byteArray;
            }
            return (byte[]) ref;
        }

        public ResolvedFunctionCall setAssociatedRuleName(String value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 2;
            this.associatedRuleName_ = value;
            return this;
        }

        public ResolvedFunctionCall setAssociatedRuleNameAsBytes(byte[] value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 2;
            this.associatedRuleName_ = value;
            return this;
        }

        public ResolvedFunctionCall clearAssociatedRuleName() {
            assertMutable();
            this.bitField0_ &= -3;
            this.associatedRuleName_ = Internal.EMPTY_BYTE_ARRAY;
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MessageLiteOrBuilder
        public final boolean isInitialized() {
            for (int i = 0; i < getPropertiesCount(); i++) {
                if (!getProperties(i).isInitialized()) {
                    return false;
                }
            }
            return !hasResult() || getResult().isInitialized();
        }

        @Override // com.google.tagmanager.protobuf.AbstractMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clone */
        public ResolvedFunctionCall mo418clone() {
            return mo395newMessageForType().mergeFrom(this);
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public ResolvedFunctionCall mergeFrom(ResolvedFunctionCall other) {
            if (this == other) {
                throw new IllegalArgumentException("mergeFrom(message) called on the same message.");
            }
            assertMutable();
            if (other != getDefaultInstance()) {
                if (other.properties_ != null && !other.properties_.isEmpty()) {
                    ensurePropertiesInitialized();
                    AbstractMutableMessageLite.addAll(other.properties_, this.properties_);
                }
                if (other.hasResult()) {
                    ensureResultInitialized();
                    this.result_.mergeFrom(other.getResult());
                    this.bitField0_ |= 1;
                }
                if (other.hasAssociatedRuleName()) {
                    this.bitField0_ |= 2;
                    if (other.associatedRuleName_ instanceof String) {
                        this.associatedRuleName_ = other.associatedRuleName_;
                    } else {
                        byte[] ba = (byte[]) other.associatedRuleName_;
                        this.associatedRuleName_ = Arrays.copyOf(ba, ba.length);
                    }
                }
                this.unknownFields = this.unknownFields.concat(other.unknownFields);
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public boolean mergeFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) {
            assertMutable();
            try {
                ByteString.Output unknownFieldsOutput = ByteString.newOutput();
                CodedOutputStream unknownFieldsCodedOutput = CodedOutputStream.newInstance(unknownFieldsOutput);
                boolean done = false;
                while (!done) {
                    int tag = input.readTag();
                    switch (tag) {
                        case 0:
                            done = true;
                            break;
                        case 10:
                            input.readMessage(addProperties(), extensionRegistry);
                            break;
                        case 18:
                            if (this.result_ == MutableTypeSystem.Value.getDefaultInstance()) {
                                this.result_ = MutableTypeSystem.Value.newMessage();
                            }
                            this.bitField0_ |= 1;
                            input.readMessage(this.result_, extensionRegistry);
                            break;
                        case 26:
                            this.bitField0_ |= 2;
                            this.associatedRuleName_ = input.readByteArray();
                            break;
                        default:
                            if (parseUnknownField(input, unknownFieldsCodedOutput, extensionRegistry, tag)) {
                                break;
                            } else {
                                done = true;
                                break;
                            }
                    }
                }
                unknownFieldsCodedOutput.flush();
                this.unknownFields = unknownFieldsOutput.toByteString();
                return true;
            } catch (IOException e) {
                return false;
            }
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public void writeToWithCachedSizes(CodedOutputStream output) throws IOException {
            int bytesWrittenBefore = output.getTotalBytesWritten();
            if (this.properties_ != null) {
                for (int i = 0; i < this.properties_.size(); i++) {
                    output.writeMessageWithCachedSizes(1, this.properties_.get(i));
                }
            }
            if ((this.bitField0_ & 1) == 1) {
                output.writeMessageWithCachedSizes(2, this.result_);
            }
            if ((this.bitField0_ & 2) == 2) {
                output.writeByteArray(3, getAssociatedRuleNameAsBytes());
            }
            output.writeRawBytes(this.unknownFields);
            int bytesWrittenAfter = output.getTotalBytesWritten();
            if (getCachedSize() != bytesWrittenAfter - bytesWrittenBefore) {
                throw new RuntimeException("Serialized size doesn't match cached size. You may forget to call getSerializedSize() or the message is being modified concurrently.");
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        public int getSerializedSize() {
            int size = 0;
            if (this.properties_ != null) {
                for (int i = 0; i < this.properties_.size(); i++) {
                    size += CodedOutputStream.computeMessageSize(1, this.properties_.get(i));
                }
            }
            if ((this.bitField0_ & 1) == 1) {
                size += CodedOutputStream.computeMessageSize(2, this.result_);
            }
            if ((this.bitField0_ & 2) == 2) {
                size += CodedOutputStream.computeByteArraySize(3, getAssociatedRuleNameAsBytes());
            }
            int size2 = size + this.unknownFields.size();
            this.cachedSize = size2;
            return size2;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public Object writeReplace() throws ObjectStreamException {
            return super.writeReplace();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clear */
        public ResolvedFunctionCall mo454clear() {
            assertMutable();
            super.mo454clear();
            this.properties_ = null;
            if (this.result_ != MutableTypeSystem.Value.getDefaultInstance()) {
                this.result_.mo454clear();
            }
            this.bitField0_ &= -2;
            this.associatedRuleName_ = Internal.EMPTY_BYTE_ARRAY;
            this.bitField0_ &= -3;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof ResolvedFunctionCall)) {
                return super.equals(obj);
            }
            ResolvedFunctionCall other = (ResolvedFunctionCall) obj;
            boolean result = (1 != 0 && getPropertiesList().equals(other.getPropertiesList())) && hasResult() == other.hasResult();
            if (hasResult()) {
                result = result && getResult().equals(other.getResult());
            }
            boolean result2 = result && hasAssociatedRuleName() == other.hasAssociatedRuleName();
            if (hasAssociatedRuleName()) {
                result2 = result2 && getAssociatedRuleName().equals(other.getAssociatedRuleName());
            }
            return result2;
        }

        public int hashCode() {
            int hash = 41;
            if (getPropertiesCount() > 0) {
                int hash2 = 1517 + 1;
                hash = 80454 + getPropertiesList().hashCode();
            }
            if (hasResult()) {
                hash = (((hash * 37) + 2) * 53) + getResult().hashCode();
            }
            if (hasAssociatedRuleName()) {
                hash = (((hash * 37) + 3) * 53) + getAssociatedRuleName().hashCode();
            }
            return (hash * 29) + this.unknownFields.hashCode();
        }

        static {
            defaultInstance.initFields();
            defaultInstance.makeImmutable();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        protected MessageLite internalImmutableDefault() {
            if (immutableDefault == null) {
                immutableDefault = internalImmutableDefault("com.google.analytics.containertag.proto.Debug$ResolvedFunctionCall");
            }
            return immutableDefault;
        }
    }

    /* loaded from: classes.dex */
    public static final class RuleEvaluationStepInfo extends GeneratedMutableMessageLite<RuleEvaluationStepInfo> implements MutableMessageLite {
        public static final int ENABLED_FUNCTIONS_FIELD_NUMBER = 2;
        public static final int RULES_FIELD_NUMBER = 1;
        private static final long serialVersionUID = 0;
        private static volatile MessageLite immutableDefault = null;
        private static final RuleEvaluationStepInfo defaultInstance = new RuleEvaluationStepInfo(true);
        public static Parser<RuleEvaluationStepInfo> PARSER = AbstractMutableMessageLite.internalNewParserForType(defaultInstance);
        private List<ResolvedRule> rules_ = null;
        private List<ResolvedFunctionCall> enabledFunctions_ = null;

        private RuleEvaluationStepInfo() {
            initFields();
        }

        private RuleEvaluationStepInfo(boolean noInit) {
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: newMessageForType */
        public RuleEvaluationStepInfo mo395newMessageForType() {
            return new RuleEvaluationStepInfo();
        }

        public static RuleEvaluationStepInfo newMessage() {
            return new RuleEvaluationStepInfo();
        }

        private void initFields() {
        }

        public static RuleEvaluationStepInfo getDefaultInstance() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite, com.google.tagmanager.protobuf.MessageLiteOrBuilder
        /* renamed from: getDefaultInstanceForType */
        public final RuleEvaluationStepInfo mo453getDefaultInstanceForType() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MessageLite
        public Parser<RuleEvaluationStepInfo> getParserForType() {
            return PARSER;
        }

        private void ensureRulesInitialized() {
            if (this.rules_ == null) {
                this.rules_ = new ArrayList();
            }
        }

        public int getRulesCount() {
            if (this.rules_ == null) {
                return 0;
            }
            return this.rules_.size();
        }

        public List<ResolvedRule> getRulesList() {
            return this.rules_ == null ? Collections.emptyList() : Collections.unmodifiableList(this.rules_);
        }

        public List<ResolvedRule> getMutableRulesList() {
            assertMutable();
            ensureRulesInitialized();
            return this.rules_;
        }

        public ResolvedRule getRules(int index) {
            return this.rules_.get(index);
        }

        public ResolvedRule getMutableRules(int index) {
            return this.rules_.get(index);
        }

        public ResolvedRule addRules() {
            assertMutable();
            ensureRulesInitialized();
            ResolvedRule value = ResolvedRule.newMessage();
            this.rules_.add(value);
            return value;
        }

        public RuleEvaluationStepInfo addRules(ResolvedRule value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureRulesInitialized();
            this.rules_.add(value);
            return this;
        }

        public RuleEvaluationStepInfo addAllRules(Iterable<? extends ResolvedRule> values) {
            assertMutable();
            ensureRulesInitialized();
            AbstractMutableMessageLite.addAll(values, this.rules_);
            return this;
        }

        public RuleEvaluationStepInfo setRules(int index, ResolvedRule value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureRulesInitialized();
            this.rules_.set(index, value);
            return this;
        }

        public RuleEvaluationStepInfo clearRules() {
            assertMutable();
            this.rules_ = null;
            return this;
        }

        private void ensureEnabledFunctionsInitialized() {
            if (this.enabledFunctions_ == null) {
                this.enabledFunctions_ = new ArrayList();
            }
        }

        public int getEnabledFunctionsCount() {
            if (this.enabledFunctions_ == null) {
                return 0;
            }
            return this.enabledFunctions_.size();
        }

        public List<ResolvedFunctionCall> getEnabledFunctionsList() {
            return this.enabledFunctions_ == null ? Collections.emptyList() : Collections.unmodifiableList(this.enabledFunctions_);
        }

        public List<ResolvedFunctionCall> getMutableEnabledFunctionsList() {
            assertMutable();
            ensureEnabledFunctionsInitialized();
            return this.enabledFunctions_;
        }

        public ResolvedFunctionCall getEnabledFunctions(int index) {
            return this.enabledFunctions_.get(index);
        }

        public ResolvedFunctionCall getMutableEnabledFunctions(int index) {
            return this.enabledFunctions_.get(index);
        }

        public ResolvedFunctionCall addEnabledFunctions() {
            assertMutable();
            ensureEnabledFunctionsInitialized();
            ResolvedFunctionCall value = ResolvedFunctionCall.newMessage();
            this.enabledFunctions_.add(value);
            return value;
        }

        public RuleEvaluationStepInfo addEnabledFunctions(ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureEnabledFunctionsInitialized();
            this.enabledFunctions_.add(value);
            return this;
        }

        public RuleEvaluationStepInfo addAllEnabledFunctions(Iterable<? extends ResolvedFunctionCall> values) {
            assertMutable();
            ensureEnabledFunctionsInitialized();
            AbstractMutableMessageLite.addAll(values, this.enabledFunctions_);
            return this;
        }

        public RuleEvaluationStepInfo setEnabledFunctions(int index, ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureEnabledFunctionsInitialized();
            this.enabledFunctions_.set(index, value);
            return this;
        }

        public RuleEvaluationStepInfo clearEnabledFunctions() {
            assertMutable();
            this.enabledFunctions_ = null;
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MessageLiteOrBuilder
        public final boolean isInitialized() {
            for (int i = 0; i < getRulesCount(); i++) {
                if (!getRules(i).isInitialized()) {
                    return false;
                }
            }
            for (int i2 = 0; i2 < getEnabledFunctionsCount(); i2++) {
                if (!getEnabledFunctions(i2).isInitialized()) {
                    return false;
                }
            }
            return true;
        }

        @Override // com.google.tagmanager.protobuf.AbstractMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clone */
        public RuleEvaluationStepInfo mo418clone() {
            return mo395newMessageForType().mergeFrom(this);
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public RuleEvaluationStepInfo mergeFrom(RuleEvaluationStepInfo other) {
            if (this == other) {
                throw new IllegalArgumentException("mergeFrom(message) called on the same message.");
            }
            assertMutable();
            if (other != getDefaultInstance()) {
                if (other.rules_ != null && !other.rules_.isEmpty()) {
                    ensureRulesInitialized();
                    AbstractMutableMessageLite.addAll(other.rules_, this.rules_);
                }
                if (other.enabledFunctions_ != null && !other.enabledFunctions_.isEmpty()) {
                    ensureEnabledFunctionsInitialized();
                    AbstractMutableMessageLite.addAll(other.enabledFunctions_, this.enabledFunctions_);
                }
                this.unknownFields = this.unknownFields.concat(other.unknownFields);
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public boolean mergeFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) {
            assertMutable();
            try {
                ByteString.Output unknownFieldsOutput = ByteString.newOutput();
                CodedOutputStream unknownFieldsCodedOutput = CodedOutputStream.newInstance(unknownFieldsOutput);
                boolean done = false;
                while (!done) {
                    int tag = input.readTag();
                    switch (tag) {
                        case 0:
                            done = true;
                            break;
                        case 10:
                            input.readMessage(addRules(), extensionRegistry);
                            break;
                        case 18:
                            input.readMessage(addEnabledFunctions(), extensionRegistry);
                            break;
                        default:
                            if (parseUnknownField(input, unknownFieldsCodedOutput, extensionRegistry, tag)) {
                                break;
                            } else {
                                done = true;
                                break;
                            }
                    }
                }
                unknownFieldsCodedOutput.flush();
                this.unknownFields = unknownFieldsOutput.toByteString();
                return true;
            } catch (IOException e) {
                return false;
            }
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public void writeToWithCachedSizes(CodedOutputStream output) throws IOException {
            int bytesWrittenBefore = output.getTotalBytesWritten();
            if (this.rules_ != null) {
                for (int i = 0; i < this.rules_.size(); i++) {
                    output.writeMessageWithCachedSizes(1, this.rules_.get(i));
                }
            }
            if (this.enabledFunctions_ != null) {
                for (int i2 = 0; i2 < this.enabledFunctions_.size(); i2++) {
                    output.writeMessageWithCachedSizes(2, this.enabledFunctions_.get(i2));
                }
            }
            output.writeRawBytes(this.unknownFields);
            int bytesWrittenAfter = output.getTotalBytesWritten();
            if (getCachedSize() != bytesWrittenAfter - bytesWrittenBefore) {
                throw new RuntimeException("Serialized size doesn't match cached size. You may forget to call getSerializedSize() or the message is being modified concurrently.");
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        public int getSerializedSize() {
            int size = 0;
            if (this.rules_ != null) {
                for (int i = 0; i < this.rules_.size(); i++) {
                    size += CodedOutputStream.computeMessageSize(1, this.rules_.get(i));
                }
            }
            if (this.enabledFunctions_ != null) {
                for (int i2 = 0; i2 < this.enabledFunctions_.size(); i2++) {
                    size += CodedOutputStream.computeMessageSize(2, this.enabledFunctions_.get(i2));
                }
            }
            int size2 = size + this.unknownFields.size();
            this.cachedSize = size2;
            return size2;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public Object writeReplace() throws ObjectStreamException {
            return super.writeReplace();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clear */
        public RuleEvaluationStepInfo mo454clear() {
            assertMutable();
            super.mo454clear();
            this.rules_ = null;
            this.enabledFunctions_ = null;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof RuleEvaluationStepInfo)) {
                return super.equals(obj);
            }
            RuleEvaluationStepInfo other = (RuleEvaluationStepInfo) obj;
            boolean result = 1 != 0 && getRulesList().equals(other.getRulesList());
            boolean result2 = result && getEnabledFunctionsList().equals(other.getEnabledFunctionsList());
            return result2;
        }

        public int hashCode() {
            int hash = 41;
            if (getRulesCount() > 0) {
                int hash2 = 1517 + 1;
                hash = 80454 + getRulesList().hashCode();
            }
            if (getEnabledFunctionsCount() > 0) {
                hash = (((hash * 37) + 2) * 53) + getEnabledFunctionsList().hashCode();
            }
            return (hash * 29) + this.unknownFields.hashCode();
        }

        static {
            defaultInstance.initFields();
            defaultInstance.makeImmutable();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        protected MessageLite internalImmutableDefault() {
            if (immutableDefault == null) {
                immutableDefault = internalImmutableDefault("com.google.analytics.containertag.proto.Debug$RuleEvaluationStepInfo");
            }
            return immutableDefault;
        }
    }

    /* loaded from: classes.dex */
    public static final class DataLayerEventEvaluationInfo extends GeneratedMutableMessageLite<DataLayerEventEvaluationInfo> implements MutableMessageLite {
        public static final int RESULTS_FIELD_NUMBER = 2;
        public static final int RULES_EVALUATION_FIELD_NUMBER = 1;
        private static final long serialVersionUID = 0;
        private int bitField0_;
        private List<ResolvedFunctionCall> results_ = null;
        private RuleEvaluationStepInfo rulesEvaluation_;
        private static volatile MessageLite immutableDefault = null;
        private static final DataLayerEventEvaluationInfo defaultInstance = new DataLayerEventEvaluationInfo(true);
        public static Parser<DataLayerEventEvaluationInfo> PARSER = AbstractMutableMessageLite.internalNewParserForType(defaultInstance);

        private DataLayerEventEvaluationInfo() {
            initFields();
        }

        private DataLayerEventEvaluationInfo(boolean noInit) {
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: newMessageForType */
        public DataLayerEventEvaluationInfo mo395newMessageForType() {
            return new DataLayerEventEvaluationInfo();
        }

        public static DataLayerEventEvaluationInfo newMessage() {
            return new DataLayerEventEvaluationInfo();
        }

        private void initFields() {
            this.rulesEvaluation_ = RuleEvaluationStepInfo.getDefaultInstance();
        }

        public static DataLayerEventEvaluationInfo getDefaultInstance() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite, com.google.tagmanager.protobuf.MessageLiteOrBuilder
        /* renamed from: getDefaultInstanceForType */
        public final DataLayerEventEvaluationInfo mo453getDefaultInstanceForType() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MessageLite
        public Parser<DataLayerEventEvaluationInfo> getParserForType() {
            return PARSER;
        }

        private void ensureRulesEvaluationInitialized() {
            if (this.rulesEvaluation_ == RuleEvaluationStepInfo.getDefaultInstance()) {
                this.rulesEvaluation_ = RuleEvaluationStepInfo.newMessage();
            }
        }

        public boolean hasRulesEvaluation() {
            return (this.bitField0_ & 1) == 1;
        }

        public RuleEvaluationStepInfo getRulesEvaluation() {
            return this.rulesEvaluation_;
        }

        public RuleEvaluationStepInfo getMutableRulesEvaluation() {
            assertMutable();
            ensureRulesEvaluationInitialized();
            this.bitField0_ |= 1;
            return this.rulesEvaluation_;
        }

        public DataLayerEventEvaluationInfo setRulesEvaluation(RuleEvaluationStepInfo value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 1;
            this.rulesEvaluation_ = value;
            return this;
        }

        public DataLayerEventEvaluationInfo clearRulesEvaluation() {
            assertMutable();
            this.bitField0_ &= -2;
            if (this.rulesEvaluation_ != RuleEvaluationStepInfo.getDefaultInstance()) {
                this.rulesEvaluation_.mo454clear();
            }
            return this;
        }

        private void ensureResultsInitialized() {
            if (this.results_ == null) {
                this.results_ = new ArrayList();
            }
        }

        public int getResultsCount() {
            if (this.results_ == null) {
                return 0;
            }
            return this.results_.size();
        }

        public List<ResolvedFunctionCall> getResultsList() {
            return this.results_ == null ? Collections.emptyList() : Collections.unmodifiableList(this.results_);
        }

        public List<ResolvedFunctionCall> getMutableResultsList() {
            assertMutable();
            ensureResultsInitialized();
            return this.results_;
        }

        public ResolvedFunctionCall getResults(int index) {
            return this.results_.get(index);
        }

        public ResolvedFunctionCall getMutableResults(int index) {
            return this.results_.get(index);
        }

        public ResolvedFunctionCall addResults() {
            assertMutable();
            ensureResultsInitialized();
            ResolvedFunctionCall value = ResolvedFunctionCall.newMessage();
            this.results_.add(value);
            return value;
        }

        public DataLayerEventEvaluationInfo addResults(ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureResultsInitialized();
            this.results_.add(value);
            return this;
        }

        public DataLayerEventEvaluationInfo addAllResults(Iterable<? extends ResolvedFunctionCall> values) {
            assertMutable();
            ensureResultsInitialized();
            AbstractMutableMessageLite.addAll(values, this.results_);
            return this;
        }

        public DataLayerEventEvaluationInfo setResults(int index, ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            ensureResultsInitialized();
            this.results_.set(index, value);
            return this;
        }

        public DataLayerEventEvaluationInfo clearResults() {
            assertMutable();
            this.results_ = null;
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MessageLiteOrBuilder
        public final boolean isInitialized() {
            if (!hasRulesEvaluation() || getRulesEvaluation().isInitialized()) {
                for (int i = 0; i < getResultsCount(); i++) {
                    if (!getResults(i).isInitialized()) {
                        return false;
                    }
                }
                return true;
            }
            return false;
        }

        @Override // com.google.tagmanager.protobuf.AbstractMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clone */
        public DataLayerEventEvaluationInfo mo418clone() {
            return mo395newMessageForType().mergeFrom(this);
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public DataLayerEventEvaluationInfo mergeFrom(DataLayerEventEvaluationInfo other) {
            if (this == other) {
                throw new IllegalArgumentException("mergeFrom(message) called on the same message.");
            }
            assertMutable();
            if (other != getDefaultInstance()) {
                if (other.hasRulesEvaluation()) {
                    ensureRulesEvaluationInitialized();
                    this.rulesEvaluation_.mergeFrom(other.getRulesEvaluation());
                    this.bitField0_ |= 1;
                }
                if (other.results_ != null && !other.results_.isEmpty()) {
                    ensureResultsInitialized();
                    AbstractMutableMessageLite.addAll(other.results_, this.results_);
                }
                this.unknownFields = this.unknownFields.concat(other.unknownFields);
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public boolean mergeFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) {
            assertMutable();
            try {
                ByteString.Output unknownFieldsOutput = ByteString.newOutput();
                CodedOutputStream unknownFieldsCodedOutput = CodedOutputStream.newInstance(unknownFieldsOutput);
                boolean done = false;
                while (!done) {
                    int tag = input.readTag();
                    switch (tag) {
                        case 0:
                            done = true;
                            break;
                        case 10:
                            if (this.rulesEvaluation_ == RuleEvaluationStepInfo.getDefaultInstance()) {
                                this.rulesEvaluation_ = RuleEvaluationStepInfo.newMessage();
                            }
                            this.bitField0_ |= 1;
                            input.readMessage(this.rulesEvaluation_, extensionRegistry);
                            break;
                        case 18:
                            input.readMessage(addResults(), extensionRegistry);
                            break;
                        default:
                            if (parseUnknownField(input, unknownFieldsCodedOutput, extensionRegistry, tag)) {
                                break;
                            } else {
                                done = true;
                                break;
                            }
                    }
                }
                unknownFieldsCodedOutput.flush();
                this.unknownFields = unknownFieldsOutput.toByteString();
                return true;
            } catch (IOException e) {
                return false;
            }
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public void writeToWithCachedSizes(CodedOutputStream output) throws IOException {
            int bytesWrittenBefore = output.getTotalBytesWritten();
            if ((this.bitField0_ & 1) == 1) {
                output.writeMessageWithCachedSizes(1, this.rulesEvaluation_);
            }
            if (this.results_ != null) {
                for (int i = 0; i < this.results_.size(); i++) {
                    output.writeMessageWithCachedSizes(2, this.results_.get(i));
                }
            }
            output.writeRawBytes(this.unknownFields);
            int bytesWrittenAfter = output.getTotalBytesWritten();
            if (getCachedSize() != bytesWrittenAfter - bytesWrittenBefore) {
                throw new RuntimeException("Serialized size doesn't match cached size. You may forget to call getSerializedSize() or the message is being modified concurrently.");
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        public int getSerializedSize() {
            int size = 0;
            if ((this.bitField0_ & 1) == 1) {
                size = 0 + CodedOutputStream.computeMessageSize(1, this.rulesEvaluation_);
            }
            if (this.results_ != null) {
                for (int i = 0; i < this.results_.size(); i++) {
                    size += CodedOutputStream.computeMessageSize(2, this.results_.get(i));
                }
            }
            int size2 = size + this.unknownFields.size();
            this.cachedSize = size2;
            return size2;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public Object writeReplace() throws ObjectStreamException {
            return super.writeReplace();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clear */
        public DataLayerEventEvaluationInfo mo454clear() {
            assertMutable();
            super.mo454clear();
            if (this.rulesEvaluation_ != RuleEvaluationStepInfo.getDefaultInstance()) {
                this.rulesEvaluation_.mo454clear();
            }
            this.bitField0_ &= -2;
            this.results_ = null;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof DataLayerEventEvaluationInfo)) {
                return super.equals(obj);
            }
            DataLayerEventEvaluationInfo other = (DataLayerEventEvaluationInfo) obj;
            boolean result = 1 != 0 && hasRulesEvaluation() == other.hasRulesEvaluation();
            if (hasRulesEvaluation()) {
                result = result && getRulesEvaluation().equals(other.getRulesEvaluation());
            }
            return result && getResultsList().equals(other.getResultsList());
        }

        public int hashCode() {
            int hash = 41;
            if (hasRulesEvaluation()) {
                int hash2 = 1517 + 1;
                hash = 80454 + getRulesEvaluation().hashCode();
            }
            if (getResultsCount() > 0) {
                hash = (((hash * 37) + 2) * 53) + getResultsList().hashCode();
            }
            return (hash * 29) + this.unknownFields.hashCode();
        }

        static {
            defaultInstance.initFields();
            defaultInstance.makeImmutable();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        protected MessageLite internalImmutableDefault() {
            if (immutableDefault == null) {
                immutableDefault = internalImmutableDefault("com.google.analytics.containertag.proto.Debug$DataLayerEventEvaluationInfo");
            }
            return immutableDefault;
        }
    }

    /* loaded from: classes.dex */
    public static final class MacroEvaluationInfo extends GeneratedMutableMessageLite<MacroEvaluationInfo> implements MutableMessageLite {
        public static final int MACRO_FIELD_NUMBER = 47497405;
        public static final int RESULT_FIELD_NUMBER = 3;
        public static final int RULES_EVALUATION_FIELD_NUMBER = 1;
        private static final long serialVersionUID = 0;
        private int bitField0_;
        private ResolvedFunctionCall result_;
        private RuleEvaluationStepInfo rulesEvaluation_;
        private static volatile MessageLite immutableDefault = null;
        private static final MacroEvaluationInfo defaultInstance = new MacroEvaluationInfo(true);
        public static Parser<MacroEvaluationInfo> PARSER = AbstractMutableMessageLite.internalNewParserForType(defaultInstance);
        public static final GeneratedMessageLite.GeneratedExtension<MutableTypeSystem.Value, MacroEvaluationInfo> macro = GeneratedMessageLite.newSingularGeneratedExtension(MutableTypeSystem.Value.getDefaultInstance(), getDefaultInstance(), getDefaultInstance(), null, 47497405, WireFormat.FieldType.MESSAGE, MacroEvaluationInfo.class);

        private MacroEvaluationInfo() {
            initFields();
        }

        private MacroEvaluationInfo(boolean noInit) {
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: newMessageForType */
        public MacroEvaluationInfo mo395newMessageForType() {
            return new MacroEvaluationInfo();
        }

        public static MacroEvaluationInfo newMessage() {
            return new MacroEvaluationInfo();
        }

        private void initFields() {
            this.rulesEvaluation_ = RuleEvaluationStepInfo.getDefaultInstance();
            this.result_ = ResolvedFunctionCall.getDefaultInstance();
        }

        public static MacroEvaluationInfo getDefaultInstance() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite, com.google.tagmanager.protobuf.MessageLiteOrBuilder
        /* renamed from: getDefaultInstanceForType */
        public final MacroEvaluationInfo mo453getDefaultInstanceForType() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MessageLite
        public Parser<MacroEvaluationInfo> getParserForType() {
            return PARSER;
        }

        private void ensureRulesEvaluationInitialized() {
            if (this.rulesEvaluation_ == RuleEvaluationStepInfo.getDefaultInstance()) {
                this.rulesEvaluation_ = RuleEvaluationStepInfo.newMessage();
            }
        }

        public boolean hasRulesEvaluation() {
            return (this.bitField0_ & 1) == 1;
        }

        public RuleEvaluationStepInfo getRulesEvaluation() {
            return this.rulesEvaluation_;
        }

        public RuleEvaluationStepInfo getMutableRulesEvaluation() {
            assertMutable();
            ensureRulesEvaluationInitialized();
            this.bitField0_ |= 1;
            return this.rulesEvaluation_;
        }

        public MacroEvaluationInfo setRulesEvaluation(RuleEvaluationStepInfo value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 1;
            this.rulesEvaluation_ = value;
            return this;
        }

        public MacroEvaluationInfo clearRulesEvaluation() {
            assertMutable();
            this.bitField0_ &= -2;
            if (this.rulesEvaluation_ != RuleEvaluationStepInfo.getDefaultInstance()) {
                this.rulesEvaluation_.mo454clear();
            }
            return this;
        }

        private void ensureResultInitialized() {
            if (this.result_ == ResolvedFunctionCall.getDefaultInstance()) {
                this.result_ = ResolvedFunctionCall.newMessage();
            }
        }

        public boolean hasResult() {
            return (this.bitField0_ & 2) == 2;
        }

        public ResolvedFunctionCall getResult() {
            return this.result_;
        }

        public ResolvedFunctionCall getMutableResult() {
            assertMutable();
            ensureResultInitialized();
            this.bitField0_ |= 2;
            return this.result_;
        }

        public MacroEvaluationInfo setResult(ResolvedFunctionCall value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 2;
            this.result_ = value;
            return this;
        }

        public MacroEvaluationInfo clearResult() {
            assertMutable();
            this.bitField0_ &= -3;
            if (this.result_ != ResolvedFunctionCall.getDefaultInstance()) {
                this.result_.mo454clear();
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MessageLiteOrBuilder
        public final boolean isInitialized() {
            if (!hasRulesEvaluation() || getRulesEvaluation().isInitialized()) {
                return !hasResult() || getResult().isInitialized();
            }
            return false;
        }

        @Override // com.google.tagmanager.protobuf.AbstractMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clone */
        public MacroEvaluationInfo mo418clone() {
            return mo395newMessageForType().mergeFrom(this);
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public MacroEvaluationInfo mergeFrom(MacroEvaluationInfo other) {
            if (this == other) {
                throw new IllegalArgumentException("mergeFrom(message) called on the same message.");
            }
            assertMutable();
            if (other != getDefaultInstance()) {
                if (other.hasRulesEvaluation()) {
                    ensureRulesEvaluationInitialized();
                    this.rulesEvaluation_.mergeFrom(other.getRulesEvaluation());
                    this.bitField0_ |= 1;
                }
                if (other.hasResult()) {
                    ensureResultInitialized();
                    this.result_.mergeFrom(other.getResult());
                    this.bitField0_ |= 2;
                }
                this.unknownFields = this.unknownFields.concat(other.unknownFields);
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public boolean mergeFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) {
            assertMutable();
            try {
                ByteString.Output unknownFieldsOutput = ByteString.newOutput();
                CodedOutputStream unknownFieldsCodedOutput = CodedOutputStream.newInstance(unknownFieldsOutput);
                boolean done = false;
                while (!done) {
                    int tag = input.readTag();
                    switch (tag) {
                        case 0:
                            done = true;
                            break;
                        case 10:
                            if (this.rulesEvaluation_ == RuleEvaluationStepInfo.getDefaultInstance()) {
                                this.rulesEvaluation_ = RuleEvaluationStepInfo.newMessage();
                            }
                            this.bitField0_ |= 1;
                            input.readMessage(this.rulesEvaluation_, extensionRegistry);
                            break;
                        case 26:
                            if (this.result_ == ResolvedFunctionCall.getDefaultInstance()) {
                                this.result_ = ResolvedFunctionCall.newMessage();
                            }
                            this.bitField0_ |= 2;
                            input.readMessage(this.result_, extensionRegistry);
                            break;
                        default:
                            if (parseUnknownField(input, unknownFieldsCodedOutput, extensionRegistry, tag)) {
                                break;
                            } else {
                                done = true;
                                break;
                            }
                    }
                }
                unknownFieldsCodedOutput.flush();
                this.unknownFields = unknownFieldsOutput.toByteString();
                return true;
            } catch (IOException e) {
                return false;
            }
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public void writeToWithCachedSizes(CodedOutputStream output) throws IOException {
            int bytesWrittenBefore = output.getTotalBytesWritten();
            if ((this.bitField0_ & 1) == 1) {
                output.writeMessageWithCachedSizes(1, this.rulesEvaluation_);
            }
            if ((this.bitField0_ & 2) == 2) {
                output.writeMessageWithCachedSizes(3, this.result_);
            }
            output.writeRawBytes(this.unknownFields);
            int bytesWrittenAfter = output.getTotalBytesWritten();
            if (getCachedSize() != bytesWrittenAfter - bytesWrittenBefore) {
                throw new RuntimeException("Serialized size doesn't match cached size. You may forget to call getSerializedSize() or the message is being modified concurrently.");
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        public int getSerializedSize() {
            int size = 0;
            if ((this.bitField0_ & 1) == 1) {
                size = 0 + CodedOutputStream.computeMessageSize(1, this.rulesEvaluation_);
            }
            if ((this.bitField0_ & 2) == 2) {
                size += CodedOutputStream.computeMessageSize(3, this.result_);
            }
            int size2 = size + this.unknownFields.size();
            this.cachedSize = size2;
            return size2;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public Object writeReplace() throws ObjectStreamException {
            return super.writeReplace();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clear */
        public MacroEvaluationInfo mo454clear() {
            assertMutable();
            super.mo454clear();
            if (this.rulesEvaluation_ != RuleEvaluationStepInfo.getDefaultInstance()) {
                this.rulesEvaluation_.mo454clear();
            }
            this.bitField0_ &= -2;
            if (this.result_ != ResolvedFunctionCall.getDefaultInstance()) {
                this.result_.mo454clear();
            }
            this.bitField0_ &= -3;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof MacroEvaluationInfo)) {
                return super.equals(obj);
            }
            MacroEvaluationInfo other = (MacroEvaluationInfo) obj;
            boolean result = 1 != 0 && hasRulesEvaluation() == other.hasRulesEvaluation();
            if (hasRulesEvaluation()) {
                result = result && getRulesEvaluation().equals(other.getRulesEvaluation());
            }
            boolean result2 = result && hasResult() == other.hasResult();
            if (hasResult()) {
                result2 = result2 && getResult().equals(other.getResult());
            }
            return result2;
        }

        public int hashCode() {
            int hash = 41;
            if (hasRulesEvaluation()) {
                int hash2 = 1517 + 1;
                hash = 80454 + getRulesEvaluation().hashCode();
            }
            if (hasResult()) {
                hash = (((hash * 37) + 3) * 53) + getResult().hashCode();
            }
            return (hash * 29) + this.unknownFields.hashCode();
        }

        static {
            defaultInstance.initFields();
            defaultInstance.makeImmutable();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        protected MessageLite internalImmutableDefault() {
            if (immutableDefault == null) {
                immutableDefault = internalImmutableDefault("com.google.analytics.containertag.proto.Debug$MacroEvaluationInfo");
            }
            return immutableDefault;
        }
    }

    /* loaded from: classes.dex */
    public static final class ResolvedProperty extends GeneratedMutableMessageLite<ResolvedProperty> implements MutableMessageLite {
        public static final int KEY_FIELD_NUMBER = 1;
        public static final int VALUE_FIELD_NUMBER = 2;
        private static final long serialVersionUID = 0;
        private int bitField0_;
        private Object key_ = Internal.EMPTY_BYTE_ARRAY;
        private MutableTypeSystem.Value value_;
        private static volatile MessageLite immutableDefault = null;
        private static final ResolvedProperty defaultInstance = new ResolvedProperty(true);
        public static Parser<ResolvedProperty> PARSER = AbstractMutableMessageLite.internalNewParserForType(defaultInstance);

        private ResolvedProperty() {
            initFields();
        }

        private ResolvedProperty(boolean noInit) {
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: newMessageForType */
        public ResolvedProperty mo395newMessageForType() {
            return new ResolvedProperty();
        }

        public static ResolvedProperty newMessage() {
            return new ResolvedProperty();
        }

        private void initFields() {
            this.value_ = MutableTypeSystem.Value.getDefaultInstance();
        }

        public static ResolvedProperty getDefaultInstance() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite, com.google.tagmanager.protobuf.MessageLiteOrBuilder
        /* renamed from: getDefaultInstanceForType */
        public final ResolvedProperty mo453getDefaultInstanceForType() {
            return defaultInstance;
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MessageLite
        public Parser<ResolvedProperty> getParserForType() {
            return PARSER;
        }

        public boolean hasKey() {
            return (this.bitField0_ & 1) == 1;
        }

        public String getKey() {
            Object ref = this.key_;
            if (ref instanceof String) {
                return (String) ref;
            }
            byte[] byteArray = (byte[]) ref;
            String s = Internal.toStringUtf8(byteArray);
            if (Internal.isValidUtf8(byteArray)) {
                this.key_ = s;
            }
            return s;
        }

        public byte[] getKeyAsBytes() {
            Object ref = this.key_;
            if (ref instanceof String) {
                String s = (String) ref;
                byte[] byteArray = Internal.toByteArray(s);
                this.key_ = byteArray;
                return byteArray;
            }
            return (byte[]) ref;
        }

        public ResolvedProperty setKey(String value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 1;
            this.key_ = value;
            return this;
        }

        public ResolvedProperty setKeyAsBytes(byte[] value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 1;
            this.key_ = value;
            return this;
        }

        public ResolvedProperty clearKey() {
            assertMutable();
            this.bitField0_ &= -2;
            this.key_ = Internal.EMPTY_BYTE_ARRAY;
            return this;
        }

        private void ensureValueInitialized() {
            if (this.value_ == MutableTypeSystem.Value.getDefaultInstance()) {
                this.value_ = MutableTypeSystem.Value.newMessage();
            }
        }

        public boolean hasValue() {
            return (this.bitField0_ & 2) == 2;
        }

        public MutableTypeSystem.Value getValue() {
            return this.value_;
        }

        public MutableTypeSystem.Value getMutableValue() {
            assertMutable();
            ensureValueInitialized();
            this.bitField0_ |= 2;
            return this.value_;
        }

        public ResolvedProperty setValue(MutableTypeSystem.Value value) {
            assertMutable();
            if (value == null) {
                throw new NullPointerException();
            }
            this.bitField0_ |= 2;
            this.value_ = value;
            return this;
        }

        public ResolvedProperty clearValue() {
            assertMutable();
            this.bitField0_ &= -3;
            if (this.value_ != MutableTypeSystem.Value.getDefaultInstance()) {
                this.value_.mo454clear();
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MessageLiteOrBuilder
        public final boolean isInitialized() {
            return !hasValue() || getValue().isInitialized();
        }

        @Override // com.google.tagmanager.protobuf.AbstractMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clone */
        public ResolvedProperty mo418clone() {
            return mo395newMessageForType().mergeFrom(this);
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public ResolvedProperty mergeFrom(ResolvedProperty other) {
            if (this == other) {
                throw new IllegalArgumentException("mergeFrom(message) called on the same message.");
            }
            assertMutable();
            if (other != getDefaultInstance()) {
                if (other.hasKey()) {
                    this.bitField0_ |= 1;
                    if (other.key_ instanceof String) {
                        this.key_ = other.key_;
                    } else {
                        byte[] ba = (byte[]) other.key_;
                        this.key_ = Arrays.copyOf(ba, ba.length);
                    }
                }
                if (other.hasValue()) {
                    ensureValueInitialized();
                    this.value_.mergeFrom(other.getValue());
                    this.bitField0_ |= 2;
                }
                this.unknownFields = this.unknownFields.concat(other.unknownFields);
            }
            return this;
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public boolean mergeFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) {
            assertMutable();
            try {
                ByteString.Output unknownFieldsOutput = ByteString.newOutput();
                CodedOutputStream unknownFieldsCodedOutput = CodedOutputStream.newInstance(unknownFieldsOutput);
                boolean done = false;
                while (!done) {
                    int tag = input.readTag();
                    switch (tag) {
                        case 0:
                            done = true;
                            break;
                        case 10:
                            this.bitField0_ |= 1;
                            this.key_ = input.readByteArray();
                            break;
                        case 18:
                            if (this.value_ == MutableTypeSystem.Value.getDefaultInstance()) {
                                this.value_ = MutableTypeSystem.Value.newMessage();
                            }
                            this.bitField0_ |= 2;
                            input.readMessage(this.value_, extensionRegistry);
                            break;
                        default:
                            if (parseUnknownField(input, unknownFieldsCodedOutput, extensionRegistry, tag)) {
                                break;
                            } else {
                                done = true;
                                break;
                            }
                    }
                }
                unknownFieldsCodedOutput.flush();
                this.unknownFields = unknownFieldsOutput.toByteString();
                return true;
            } catch (IOException e) {
                return false;
            }
        }

        @Override // com.google.tagmanager.protobuf.MutableMessageLite
        public void writeToWithCachedSizes(CodedOutputStream output) throws IOException {
            int bytesWrittenBefore = output.getTotalBytesWritten();
            if ((this.bitField0_ & 1) == 1) {
                output.writeByteArray(1, getKeyAsBytes());
            }
            if ((this.bitField0_ & 2) == 2) {
                output.writeMessageWithCachedSizes(2, this.value_);
            }
            output.writeRawBytes(this.unknownFields);
            int bytesWrittenAfter = output.getTotalBytesWritten();
            if (getCachedSize() != bytesWrittenAfter - bytesWrittenBefore) {
                throw new RuntimeException("Serialized size doesn't match cached size. You may forget to call getSerializedSize() or the message is being modified concurrently.");
            }
        }

        @Override // com.google.tagmanager.protobuf.MessageLite
        public int getSerializedSize() {
            int size = 0;
            if ((this.bitField0_ & 1) == 1) {
                size = 0 + CodedOutputStream.computeByteArraySize(1, getKeyAsBytes());
            }
            if ((this.bitField0_ & 2) == 2) {
                size += CodedOutputStream.computeMessageSize(2, this.value_);
            }
            int size2 = size + this.unknownFields.size();
            this.cachedSize = size2;
            return size2;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        public Object writeReplace() throws ObjectStreamException {
            return super.writeReplace();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite, com.google.tagmanager.protobuf.MutableMessageLite
        /* renamed from: clear */
        public ResolvedProperty mo454clear() {
            assertMutable();
            super.mo454clear();
            this.key_ = Internal.EMPTY_BYTE_ARRAY;
            this.bitField0_ &= -2;
            if (this.value_ != MutableTypeSystem.Value.getDefaultInstance()) {
                this.value_.mo454clear();
            }
            this.bitField0_ &= -3;
            return this;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof ResolvedProperty)) {
                return super.equals(obj);
            }
            ResolvedProperty other = (ResolvedProperty) obj;
            boolean result = 1 != 0 && hasKey() == other.hasKey();
            if (hasKey()) {
                result = result && getKey().equals(other.getKey());
            }
            boolean result2 = result && hasValue() == other.hasValue();
            if (hasValue()) {
                result2 = result2 && getValue().equals(other.getValue());
            }
            return result2;
        }

        public int hashCode() {
            int hash = 41;
            if (hasKey()) {
                int hash2 = 1517 + 1;
                hash = 80454 + getKey().hashCode();
            }
            if (hasValue()) {
                hash = (((hash * 37) + 2) * 53) + getValue().hashCode();
            }
            return (hash * 29) + this.unknownFields.hashCode();
        }

        static {
            defaultInstance.initFields();
            defaultInstance.makeImmutable();
        }

        @Override // com.google.tagmanager.protobuf.GeneratedMutableMessageLite
        protected MessageLite internalImmutableDefault() {
            if (immutableDefault == null) {
                immutableDefault = internalImmutableDefault("com.google.analytics.containertag.proto.Debug$ResolvedProperty");
            }
            return immutableDefault;
        }
    }
}
