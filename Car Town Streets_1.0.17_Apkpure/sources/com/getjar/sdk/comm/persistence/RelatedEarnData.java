package com.getjar.sdk.comm.persistence;

import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
/* loaded from: classes.dex */
public class RelatedEarnData implements Serializable {
    private static final long serialVersionUID = -7091798013980336693L;
    private String _itemId;
    private HashMap<String, String> _itemMetadata;
    private String _packageName;
    private HashMap<String, String> _trackingMetadata;

    public RelatedEarnData() {
    }

    public RelatedEarnData(String itemId, String packageName, HashMap<String, String> itemMetadata, HashMap<String, String> trackingMetadata) {
        this._itemId = itemId;
        this._packageName = packageName;
        this._itemMetadata = itemMetadata;
        this._trackingMetadata = trackingMetadata;
        validateObjectState();
    }

    public String getItemId() {
        return this._itemId;
    }

    public String getPackageName() {
        return this._packageName;
    }

    public HashMap<String, String> getItemMetadata() {
        return this._itemMetadata;
    }

    public HashMap<String, String> getTrackingMetadata() {
        return this._trackingMetadata;
    }

    private void validateObjectState() {
        if (StringUtility.isNullOrEmpty(this._itemId)) {
            throw new IllegalStateException("'itemId' can not be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(this._packageName)) {
            throw new IllegalStateException("'packageName' can not be NULL or empty");
        }
        if (this._itemMetadata != null && this._itemMetadata.size() > 0) {
            return;
        }
        throw new IllegalStateException("'itemMetadata' can not be NULL or empty");
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeUTF(this._itemId);
        out.writeUTF(this._packageName);
        out.writeObject(this._itemMetadata);
        out.writeObject(this._trackingMetadata);
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        this._itemId = in.readUTF();
        this._packageName = in.readUTF();
        this._itemMetadata = (HashMap) in.readObject();
        this._trackingMetadata = (HashMap) in.readObject();
    }
}
