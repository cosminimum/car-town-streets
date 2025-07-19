package com.getjar.sdk.data;

public class MetadataValue {
    private MetadataReliability _reliability;
    private String _value;

    public enum MetadataReliability {
        UNKNOWN,
        AVAILABLE,
        NOT_AVAILABLE
    }

    public MetadataValue(String value, MetadataReliability reliability) {
        this._value = value;
        this._reliability = reliability;
    }

    public String getValue() {
        return this._value;
    }

    public MetadataReliability getReliability() {
        return this._reliability;
    }
}
