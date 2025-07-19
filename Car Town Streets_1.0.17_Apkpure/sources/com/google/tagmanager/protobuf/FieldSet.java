package com.google.tagmanager.protobuf;

import com.google.tagmanager.protobuf.FieldSet.FieldDescriptorLite;
import com.google.tagmanager.protobuf.Internal;
import com.google.tagmanager.protobuf.LazyField;
import com.google.tagmanager.protobuf.MessageLite;
import com.google.tagmanager.protobuf.WireFormat;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class FieldSet<FieldDescriptorType extends FieldDescriptorLite<FieldDescriptorType>> {
    private static final FieldSet DEFAULT_INSTANCE = new FieldSet(true);
    private boolean isImmutable;
    private boolean hasLazyField = false;
    private final SmallSortedMap<FieldDescriptorType, Object> fields = SmallSortedMap.newFieldMap(16);

    /* loaded from: classes.dex */
    public interface FieldDescriptorLite<T extends FieldDescriptorLite<T>> extends Comparable<T> {
        Internal.EnumLiteMap<?> getEnumType();

        WireFormat.JavaType getLiteJavaType();

        WireFormat.FieldType getLiteType();

        int getNumber();

        MessageLite.Builder internalMergeFrom(MessageLite.Builder builder, MessageLite messageLite);

        MutableMessageLite internalMergeFrom(MutableMessageLite mutableMessageLite, MutableMessageLite mutableMessageLite2);

        boolean isPacked();

        boolean isRepeated();
    }

    private FieldSet() {
    }

    private FieldSet(boolean dummy) {
        makeImmutable();
    }

    public static <T extends FieldDescriptorLite<T>> FieldSet<T> newFieldSet() {
        return new FieldSet<>();
    }

    public static <T extends FieldDescriptorLite<T>> FieldSet<T> emptySet() {
        return DEFAULT_INSTANCE;
    }

    public void makeImmutable() {
        if (!this.isImmutable) {
            this.fields.makeImmutable();
            this.isImmutable = true;
        }
    }

    public boolean isImmutable() {
        return this.isImmutable;
    }

    /* renamed from: clone */
    public FieldSet<FieldDescriptorType> m444clone() {
        FieldSet<FieldDescriptorType> clone = newFieldSet();
        for (int i = 0; i < this.fields.getNumArrayEntries(); i++) {
            Map.Entry<FieldDescriptorType, Object> entry = this.fields.getArrayEntryAt(i);
            FieldDescriptorType descriptor = entry.getKey();
            clone.setField(descriptor, entry.getValue());
        }
        for (Map.Entry<FieldDescriptorType, Object> entry2 : this.fields.getOverflowEntries()) {
            FieldDescriptorType descriptor2 = entry2.getKey();
            clone.setField(descriptor2, entry2.getValue());
        }
        clone.hasLazyField = this.hasLazyField;
        return clone;
    }

    private Object convertToImmutable(FieldDescriptorType descriptor, Object value) {
        if (descriptor.getLiteJavaType() == WireFormat.JavaType.MESSAGE) {
            if (descriptor.isRepeated()) {
                List<Object> mutableMessages = (List) value;
                List<Object> immutableMessages = new ArrayList<>();
                for (Object mutableMessage : mutableMessages) {
                    immutableMessages.add(((MutableMessageLite) mutableMessage).immutableCopy());
                }
                return immutableMessages;
            } else if (value instanceof LazyField) {
                return ((MutableMessageLite) ((LazyField) value).getValue()).immutableCopy();
            } else {
                return ((MutableMessageLite) value).immutableCopy();
            }
        } else if (descriptor.getLiteJavaType() != WireFormat.JavaType.BYTE_STRING) {
            return value;
        } else {
            if (descriptor.isRepeated()) {
                List<Object> mutableFields = (List) value;
                List<Object> immutableFields = new ArrayList<>();
                for (Object mutableField : mutableFields) {
                    immutableFields.add(ByteString.copyFrom((byte[]) mutableField));
                }
                return immutableFields;
            }
            return ByteString.copyFrom((byte[]) value);
        }
    }

    private Object convertToMutable(FieldDescriptorType descriptor, Object value) {
        if (descriptor.getLiteJavaType() == WireFormat.JavaType.MESSAGE) {
            if (descriptor.isRepeated()) {
                List<Object> mutableMessages = new ArrayList<>();
                List<Object> immutableMessages = (List) value;
                for (Object immutableMessage : immutableMessages) {
                    mutableMessages.add(((MessageLite) immutableMessage).mutableCopy());
                }
                return mutableMessages;
            } else if (value instanceof LazyField) {
                return ((LazyField) value).getValue().mutableCopy();
            } else {
                return ((MessageLite) value).mutableCopy();
            }
        } else if (descriptor.getLiteJavaType() != WireFormat.JavaType.BYTE_STRING) {
            return value;
        } else {
            if (descriptor.isRepeated()) {
                List<Object> immutableFields = (List) value;
                List<Object> mutableFields = new ArrayList<>();
                for (Object immutableField : immutableFields) {
                    mutableFields.add(((ByteString) immutableField).toByteArray());
                }
                return mutableFields;
            }
            return ((ByteString) value).toByteArray();
        }
    }

    public FieldSet<FieldDescriptorType> cloneWithAllFieldsToImmutable() {
        FieldSet<FieldDescriptorType> clone = newFieldSet();
        for (int i = 0; i < this.fields.getNumArrayEntries(); i++) {
            Map.Entry<FieldDescriptorType, Object> entry = this.fields.getArrayEntryAt(i);
            FieldDescriptorType descriptor = entry.getKey();
            clone.setField(descriptor, convertToImmutable(descriptor, entry.getValue()));
        }
        for (Map.Entry<FieldDescriptorType, Object> entry2 : this.fields.getOverflowEntries()) {
            FieldDescriptorType descriptor2 = entry2.getKey();
            clone.setField(descriptor2, convertToImmutable(descriptor2, entry2.getValue()));
        }
        clone.hasLazyField = false;
        return clone;
    }

    public FieldSet<FieldDescriptorType> cloneWithAllFieldsToMutable() {
        FieldSet<FieldDescriptorType> clone = newFieldSet();
        for (int i = 0; i < this.fields.getNumArrayEntries(); i++) {
            Map.Entry<FieldDescriptorType, Object> entry = this.fields.getArrayEntryAt(i);
            FieldDescriptorType descriptor = entry.getKey();
            clone.setField(descriptor, convertToMutable(descriptor, entry.getValue()));
        }
        for (Map.Entry<FieldDescriptorType, Object> entry2 : this.fields.getOverflowEntries()) {
            FieldDescriptorType descriptor2 = entry2.getKey();
            clone.setField(descriptor2, convertToMutable(descriptor2, entry2.getValue()));
        }
        clone.hasLazyField = false;
        return clone;
    }

    public void clear() {
        this.fields.clear();
        this.hasLazyField = false;
    }

    public Map<FieldDescriptorType, Object> getAllFields() {
        if (!this.hasLazyField) {
            return this.fields.isImmutable() ? this.fields : Collections.unmodifiableMap(this.fields);
        }
        SmallSortedMap<FieldDescriptorType, Object> result = SmallSortedMap.newFieldMap(16);
        for (int i = 0; i < this.fields.getNumArrayEntries(); i++) {
            cloneFieldEntry(result, this.fields.getArrayEntryAt(i));
        }
        for (Map.Entry<FieldDescriptorType, Object> entry : this.fields.getOverflowEntries()) {
            cloneFieldEntry(result, entry);
        }
        if (this.fields.isImmutable()) {
            result.makeImmutable();
            return result;
        }
        return result;
    }

    private void cloneFieldEntry(Map<FieldDescriptorType, Object> map, Map.Entry<FieldDescriptorType, Object> entry) {
        FieldDescriptorType key = entry.getKey();
        Object value = entry.getValue();
        if (value instanceof LazyField) {
            map.put(key, ((LazyField) value).getValue());
        } else {
            map.put(key, value);
        }
    }

    public Iterator<Map.Entry<FieldDescriptorType, Object>> iterator() {
        return this.hasLazyField ? new LazyField.LazyIterator(this.fields.entrySet().iterator()) : this.fields.entrySet().iterator();
    }

    public boolean hasField(FieldDescriptorType descriptor) {
        if (descriptor.isRepeated()) {
            throw new IllegalArgumentException("hasField() can only be called on non-repeated fields.");
        }
        return this.fields.get(descriptor) != null;
    }

    public Object getField(FieldDescriptorType descriptor) {
        Object o = this.fields.get(descriptor);
        if (o instanceof LazyField) {
            return ((LazyField) o).getValue();
        }
        return o;
    }

    public void setField(FieldDescriptorType descriptor, Object value) {
        if (descriptor.isRepeated()) {
            if (!(value instanceof List)) {
                throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
            }
            List newList = new ArrayList();
            newList.addAll((List) value);
            for (Object element : newList) {
                verifyType(descriptor.getLiteType(), element);
            }
            value = newList;
        } else {
            verifyType(descriptor.getLiteType(), value);
        }
        if (value instanceof LazyField) {
            this.hasLazyField = true;
        }
        this.fields.put((SmallSortedMap<FieldDescriptorType, Object>) descriptor, (FieldDescriptorType) value);
    }

    public void clearField(FieldDescriptorType descriptor) {
        this.fields.remove(descriptor);
        if (this.fields.isEmpty()) {
            this.hasLazyField = false;
        }
    }

    public int getRepeatedFieldCount(FieldDescriptorType descriptor) {
        if (!descriptor.isRepeated()) {
            throw new IllegalArgumentException("getRepeatedField() can only be called on repeated fields.");
        }
        Object value = getField(descriptor);
        if (value != null) {
            return ((List) value).size();
        }
        return 0;
    }

    public Object getRepeatedField(FieldDescriptorType descriptor, int index) {
        if (!descriptor.isRepeated()) {
            throw new IllegalArgumentException("getRepeatedField() can only be called on repeated fields.");
        }
        Object value = getField(descriptor);
        if (value == null) {
            throw new IndexOutOfBoundsException();
        }
        return ((List) value).get(index);
    }

    public void setRepeatedField(FieldDescriptorType descriptor, int index, Object value) {
        if (!descriptor.isRepeated()) {
            throw new IllegalArgumentException("getRepeatedField() can only be called on repeated fields.");
        }
        Object list = getField(descriptor);
        if (list == null) {
            throw new IndexOutOfBoundsException();
        }
        verifyType(descriptor.getLiteType(), value);
        ((List) list).set(index, value);
    }

    public void addRepeatedField(FieldDescriptorType descriptor, Object value) {
        List<Object> list;
        if (!descriptor.isRepeated()) {
            throw new IllegalArgumentException("addRepeatedField() can only be called on repeated fields.");
        }
        verifyType(descriptor.getLiteType(), value);
        Object existingValue = getField(descriptor);
        if (existingValue == null) {
            list = new ArrayList<>();
            this.fields.put((SmallSortedMap<FieldDescriptorType, Object>) descriptor, (FieldDescriptorType) list);
        } else {
            list = (List) existingValue;
        }
        list.add(value);
    }

    private static void verifyType(WireFormat.FieldType type, Object value) {
        if (value == null) {
            throw new NullPointerException();
        }
        boolean isValid = false;
        switch (type.getJavaType()) {
            case INT:
                isValid = value instanceof Integer;
                break;
            case LONG:
                isValid = value instanceof Long;
                break;
            case FLOAT:
                isValid = value instanceof Float;
                break;
            case DOUBLE:
                isValid = value instanceof Double;
                break;
            case BOOLEAN:
                isValid = value instanceof Boolean;
                break;
            case STRING:
                isValid = value instanceof String;
                break;
            case BYTE_STRING:
                if (!(value instanceof ByteString) && !(value instanceof byte[])) {
                    isValid = false;
                    break;
                } else {
                    isValid = true;
                    break;
                }
                break;
            case ENUM:
                if (!(value instanceof Integer) && !(value instanceof Internal.EnumLite)) {
                    isValid = false;
                    break;
                } else {
                    isValid = true;
                    break;
                }
                break;
            case MESSAGE:
                if (!(value instanceof MessageLite) && !(value instanceof LazyField)) {
                    isValid = false;
                    break;
                } else {
                    isValid = true;
                    break;
                }
                break;
        }
        if (!isValid) {
            throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
        }
    }

    public boolean isInitialized() {
        for (int i = 0; i < this.fields.getNumArrayEntries(); i++) {
            if (!isInitialized(this.fields.getArrayEntryAt(i))) {
                return false;
            }
        }
        for (Map.Entry<FieldDescriptorType, Object> entry : this.fields.getOverflowEntries()) {
            if (!isInitialized(entry)) {
                return false;
            }
        }
        return true;
    }

    private boolean isInitialized(Map.Entry<FieldDescriptorType, Object> entry) {
        FieldDescriptorType descriptor = entry.getKey();
        if (descriptor.getLiteJavaType() == WireFormat.JavaType.MESSAGE) {
            if (descriptor.isRepeated()) {
                for (MessageLite element : (List) entry.getValue()) {
                    if (!element.isInitialized()) {
                        return false;
                    }
                }
            } else {
                Object value = entry.getValue();
                if (value instanceof MessageLite) {
                    if (!((MessageLite) value).isInitialized()) {
                        return false;
                    }
                } else if (value instanceof LazyField) {
                    return true;
                } else {
                    throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
                }
            }
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getWireFormatForFieldType(WireFormat.FieldType type, boolean isPacked) {
        if (isPacked) {
            return 2;
        }
        return type.getWireType();
    }

    public void mergeFrom(FieldSet<FieldDescriptorType> other) {
        for (int i = 0; i < other.fields.getNumArrayEntries(); i++) {
            mergeFromField(other.fields.getArrayEntryAt(i));
        }
        for (Map.Entry<FieldDescriptorType, Object> entry : other.fields.getOverflowEntries()) {
            mergeFromField(entry);
        }
    }

    private void mergeFromField(Map.Entry<FieldDescriptorType, Object> entry) {
        MessageLite mo400build;
        FieldDescriptorType descriptor = entry.getKey();
        Object otherValue = entry.getValue();
        if (otherValue instanceof LazyField) {
            otherValue = ((LazyField) otherValue).getValue();
        }
        if (descriptor.isRepeated()) {
            Object value = getField(descriptor);
            if (value == null) {
                this.fields.put((SmallSortedMap<FieldDescriptorType, Object>) descriptor, (FieldDescriptorType) new ArrayList((List) otherValue));
            } else {
                ((List) value).addAll((List) otherValue);
            }
        } else if (descriptor.getLiteJavaType() == WireFormat.JavaType.MESSAGE) {
            Object value2 = getField(descriptor);
            if (value2 == null) {
                this.fields.put((SmallSortedMap<FieldDescriptorType, Object>) descriptor, (FieldDescriptorType) otherValue);
                return;
            }
            if (value2 instanceof MutableMessageLite) {
                mo400build = descriptor.internalMergeFrom((MutableMessageLite) value2, (MutableMessageLite) otherValue);
            } else {
                mo400build = descriptor.internalMergeFrom(((MessageLite) value2).mo398toBuilder(), (MessageLite) otherValue).mo400build();
            }
            this.fields.put((SmallSortedMap<FieldDescriptorType, Object>) descriptor, (FieldDescriptorType) mo400build);
        } else {
            this.fields.put((SmallSortedMap<FieldDescriptorType, Object>) descriptor, (FieldDescriptorType) otherValue);
        }
    }

    public static Object readPrimitiveField(CodedInputStream input, WireFormat.FieldType type, boolean checkUtf8) throws IOException {
        switch (type) {
            case DOUBLE:
                return Double.valueOf(input.readDouble());
            case FLOAT:
                return Float.valueOf(input.readFloat());
            case INT64:
                return Long.valueOf(input.readInt64());
            case UINT64:
                return Long.valueOf(input.readUInt64());
            case INT32:
                return Integer.valueOf(input.readInt32());
            case FIXED64:
                return Long.valueOf(input.readFixed64());
            case FIXED32:
                return Integer.valueOf(input.readFixed32());
            case BOOL:
                return Boolean.valueOf(input.readBool());
            case STRING:
                if (checkUtf8) {
                    return input.readStringRequireUtf8();
                }
                return input.readString();
            case BYTES:
                return input.readBytes();
            case UINT32:
                return Integer.valueOf(input.readUInt32());
            case SFIXED32:
                return Integer.valueOf(input.readSFixed32());
            case SFIXED64:
                return Long.valueOf(input.readSFixed64());
            case SINT32:
                return Integer.valueOf(input.readSInt32());
            case SINT64:
                return Long.valueOf(input.readSInt64());
            case GROUP:
                throw new IllegalArgumentException("readPrimitiveField() cannot handle nested groups.");
            case MESSAGE:
                throw new IllegalArgumentException("readPrimitiveField() cannot handle embedded messages.");
            case ENUM:
                throw new IllegalArgumentException("readPrimitiveField() cannot handle enums.");
            default:
                throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
        }
    }

    public static Object readPrimitiveFieldForMutable(CodedInputStream input, WireFormat.FieldType type, boolean checkUtf8) throws IOException {
        return type == WireFormat.FieldType.BYTES ? input.readByteArray() : readPrimitiveField(input, type, checkUtf8);
    }

    public void writeTo(CodedOutputStream output) throws IOException {
        for (int i = 0; i < this.fields.getNumArrayEntries(); i++) {
            Map.Entry<FieldDescriptorType, Object> entry = this.fields.getArrayEntryAt(i);
            writeField(entry.getKey(), entry.getValue(), output);
        }
        for (Map.Entry<FieldDescriptorType, Object> entry2 : this.fields.getOverflowEntries()) {
            writeField(entry2.getKey(), entry2.getValue(), output);
        }
    }

    public void writeMessageSetTo(CodedOutputStream output) throws IOException {
        for (int i = 0; i < this.fields.getNumArrayEntries(); i++) {
            writeMessageSetTo(this.fields.getArrayEntryAt(i), output);
        }
        for (Map.Entry<FieldDescriptorType, Object> entry : this.fields.getOverflowEntries()) {
            writeMessageSetTo(entry, output);
        }
    }

    private void writeMessageSetTo(Map.Entry<FieldDescriptorType, Object> entry, CodedOutputStream output) throws IOException {
        FieldDescriptorType descriptor = entry.getKey();
        if (descriptor.getLiteJavaType() == WireFormat.JavaType.MESSAGE && !descriptor.isRepeated() && !descriptor.isPacked()) {
            output.writeMessageSetExtension(entry.getKey().getNumber(), (MessageLite) entry.getValue());
        } else {
            writeField(descriptor, entry.getValue(), output);
        }
    }

    private static void writeElement(CodedOutputStream output, WireFormat.FieldType type, int number, Object value) throws IOException {
        if (type == WireFormat.FieldType.GROUP) {
            if (Internal.isProto1Group((MessageLite) value)) {
                output.writeTag(number, 3);
                output.writeGroupNoTag((MessageLite) value);
                return;
            }
            output.writeGroup(number, (MessageLite) value);
            return;
        }
        output.writeTag(number, getWireFormatForFieldType(type, false));
        writeElementNoTag(output, type, value);
    }

    private static void writeElementNoTag(CodedOutputStream output, WireFormat.FieldType type, Object value) throws IOException {
        switch (type) {
            case DOUBLE:
                output.writeDoubleNoTag(((Double) value).doubleValue());
                return;
            case FLOAT:
                output.writeFloatNoTag(((Float) value).floatValue());
                return;
            case INT64:
                output.writeInt64NoTag(((Long) value).longValue());
                return;
            case UINT64:
                output.writeUInt64NoTag(((Long) value).longValue());
                return;
            case INT32:
                output.writeInt32NoTag(((Integer) value).intValue());
                return;
            case FIXED64:
                output.writeFixed64NoTag(((Long) value).longValue());
                return;
            case FIXED32:
                output.writeFixed32NoTag(((Integer) value).intValue());
                return;
            case BOOL:
                output.writeBoolNoTag(((Boolean) value).booleanValue());
                return;
            case STRING:
                output.writeStringNoTag((String) value);
                return;
            case BYTES:
                if (value instanceof ByteString) {
                    output.writeBytesNoTag((ByteString) value);
                    return;
                } else {
                    output.writeByteArrayNoTag((byte[]) value);
                    return;
                }
            case UINT32:
                output.writeUInt32NoTag(((Integer) value).intValue());
                return;
            case SFIXED32:
                output.writeSFixed32NoTag(((Integer) value).intValue());
                return;
            case SFIXED64:
                output.writeSFixed64NoTag(((Long) value).longValue());
                return;
            case SINT32:
                output.writeSInt32NoTag(((Integer) value).intValue());
                return;
            case SINT64:
                output.writeSInt64NoTag(((Long) value).longValue());
                return;
            case GROUP:
                output.writeGroupNoTag((MessageLite) value);
                return;
            case MESSAGE:
                output.writeMessageNoTag((MessageLite) value);
                return;
            case ENUM:
                if (value instanceof Internal.EnumLite) {
                    output.writeEnumNoTag(((Internal.EnumLite) value).getNumber());
                    return;
                } else {
                    output.writeEnumNoTag(((Integer) value).intValue());
                    return;
                }
            default:
                return;
        }
    }

    public static void writeField(FieldDescriptorLite<?> descriptor, Object value, CodedOutputStream output) throws IOException {
        WireFormat.FieldType type = descriptor.getLiteType();
        int number = descriptor.getNumber();
        if (descriptor.isRepeated()) {
            List<?> valueList = (List) value;
            if (descriptor.isPacked()) {
                output.writeTag(number, 2);
                int dataSize = 0;
                for (Object element : valueList) {
                    dataSize += computeElementSizeNoTag(type, element);
                }
                output.writeRawVarint32(dataSize);
                for (Object element2 : valueList) {
                    writeElementNoTag(output, type, element2);
                }
                return;
            }
            for (Object element3 : valueList) {
                writeElement(output, type, number, element3);
            }
        } else if (value instanceof LazyField) {
            writeElement(output, type, number, ((LazyField) value).getValue());
        } else {
            writeElement(output, type, number, value);
        }
    }

    public int getSerializedSize() {
        int size = 0;
        for (int i = 0; i < this.fields.getNumArrayEntries(); i++) {
            Map.Entry<FieldDescriptorType, Object> entry = this.fields.getArrayEntryAt(i);
            size += computeFieldSize(entry.getKey(), entry.getValue());
        }
        for (Map.Entry<FieldDescriptorType, Object> entry2 : this.fields.getOverflowEntries()) {
            size += computeFieldSize(entry2.getKey(), entry2.getValue());
        }
        return size;
    }

    public int getMessageSetSerializedSize() {
        int size = 0;
        for (int i = 0; i < this.fields.getNumArrayEntries(); i++) {
            size += getMessageSetSerializedSize(this.fields.getArrayEntryAt(i));
        }
        for (Map.Entry<FieldDescriptorType, Object> entry : this.fields.getOverflowEntries()) {
            size += getMessageSetSerializedSize(entry);
        }
        return size;
    }

    private int getMessageSetSerializedSize(Map.Entry<FieldDescriptorType, Object> entry) {
        FieldDescriptorType descriptor = entry.getKey();
        Object value = entry.getValue();
        if (descriptor.getLiteJavaType() == WireFormat.JavaType.MESSAGE && !descriptor.isRepeated() && !descriptor.isPacked()) {
            if (value instanceof LazyField) {
                return CodedOutputStream.computeLazyFieldMessageSetExtensionSize(entry.getKey().getNumber(), (LazyField) value);
            }
            return CodedOutputStream.computeMessageSetExtensionSize(entry.getKey().getNumber(), (MessageLite) value);
        }
        return computeFieldSize(descriptor, value);
    }

    private static int computeElementSize(WireFormat.FieldType type, int number, Object value) {
        int tagSize = CodedOutputStream.computeTagSize(number);
        if (type == WireFormat.FieldType.GROUP && !Internal.isProto1Group((MessageLite) value)) {
            tagSize *= 2;
        }
        return computeElementSizeNoTag(type, value) + tagSize;
    }

    private static int computeElementSizeNoTag(WireFormat.FieldType type, Object value) {
        switch (type) {
            case DOUBLE:
                return CodedOutputStream.computeDoubleSizeNoTag(((Double) value).doubleValue());
            case FLOAT:
                return CodedOutputStream.computeFloatSizeNoTag(((Float) value).floatValue());
            case INT64:
                return CodedOutputStream.computeInt64SizeNoTag(((Long) value).longValue());
            case UINT64:
                return CodedOutputStream.computeUInt64SizeNoTag(((Long) value).longValue());
            case INT32:
                return CodedOutputStream.computeInt32SizeNoTag(((Integer) value).intValue());
            case FIXED64:
                return CodedOutputStream.computeFixed64SizeNoTag(((Long) value).longValue());
            case FIXED32:
                return CodedOutputStream.computeFixed32SizeNoTag(((Integer) value).intValue());
            case BOOL:
                return CodedOutputStream.computeBoolSizeNoTag(((Boolean) value).booleanValue());
            case STRING:
                return CodedOutputStream.computeStringSizeNoTag((String) value);
            case BYTES:
                if (value instanceof ByteString) {
                    return CodedOutputStream.computeBytesSizeNoTag((ByteString) value);
                }
                return CodedOutputStream.computeByteArraySizeNoTag((byte[]) value);
            case UINT32:
                return CodedOutputStream.computeUInt32SizeNoTag(((Integer) value).intValue());
            case SFIXED32:
                return CodedOutputStream.computeSFixed32SizeNoTag(((Integer) value).intValue());
            case SFIXED64:
                return CodedOutputStream.computeSFixed64SizeNoTag(((Long) value).longValue());
            case SINT32:
                return CodedOutputStream.computeSInt32SizeNoTag(((Integer) value).intValue());
            case SINT64:
                return CodedOutputStream.computeSInt64SizeNoTag(((Long) value).longValue());
            case GROUP:
                return CodedOutputStream.computeGroupSizeNoTag((MessageLite) value);
            case MESSAGE:
                if (value instanceof LazyField) {
                    return CodedOutputStream.computeLazyFieldSizeNoTag((LazyField) value);
                }
                return CodedOutputStream.computeMessageSizeNoTag((MessageLite) value);
            case ENUM:
                if (value instanceof Internal.EnumLite) {
                    return CodedOutputStream.computeEnumSizeNoTag(((Internal.EnumLite) value).getNumber());
                }
                return CodedOutputStream.computeEnumSizeNoTag(((Integer) value).intValue());
            default:
                throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
        }
    }

    public static int computeFieldSize(FieldDescriptorLite<?> descriptor, Object value) {
        WireFormat.FieldType type = descriptor.getLiteType();
        int number = descriptor.getNumber();
        if (descriptor.isRepeated()) {
            if (descriptor.isPacked()) {
                int dataSize = 0;
                for (Object element : (List) value) {
                    dataSize += computeElementSizeNoTag(type, element);
                }
                return CodedOutputStream.computeTagSize(number) + dataSize + CodedOutputStream.computeRawVarint32Size(dataSize);
            }
            int size = 0;
            for (Object element2 : (List) value) {
                size += computeElementSize(type, number, element2);
            }
            return size;
        }
        int size2 = computeElementSize(type, number, value);
        return size2;
    }
}
