package com.getjar.sdk.comm.auth;

import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
/* loaded from: classes.dex */
public class SettingsValue implements Serializable {
    private static final long serialVersionUID = 6297419565666938543L;
    private String type;
    private String value;

    private SettingsValue() {
    }

    public SettingsValue(String value, String type) {
        if (StringUtility.isNullOrEmpty(type)) {
            throw new IllegalArgumentException("'type' cannot be null or empty");
        }
        this.type = type;
        this.value = value == null ? "" : value;
    }

    public String getType() {
        return this.type;
    }

    public String getValue() {
        return this.value;
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeUTF(this.type);
        out.writeUTF(this.value);
    }

    private void readObject(ObjectInputStream in) throws IOException {
        this.type = in.readUTF();
        this.value = in.readUTF();
    }
}
