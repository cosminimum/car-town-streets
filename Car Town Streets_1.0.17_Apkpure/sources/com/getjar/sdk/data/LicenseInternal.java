package com.getjar.sdk.data;

import com.getjar.sdk.License;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Date;
/* loaded from: classes.dex */
public class LicenseInternal extends License implements Serializable {
    private static final long serialVersionUID = -2979070449375236570L;
    private InternalLicenseState internalLicenseState;
    private boolean isLicenseStale;
    private String licenseId;
    private ExternalLicenseState licenseState;
    private LicenseType licenseType;
    private String platform;

    /* loaded from: classes.dex */
    public enum ExternalLicenseState {
        ACQUIRED,
        REVOKED
    }

    /* loaded from: classes.dex */
    public enum InternalLicenseState {
        SYNCED,
        UNSYNCED
    }

    /* loaded from: classes.dex */
    public enum LicenseType {
        UNMANAGED
    }

    public LicenseInternal() {
        this.licenseType = LicenseType.UNMANAGED;
        this.isLicenseStale = false;
    }

    public LicenseInternal(String licenseId, String platform, License.LicenseScope licenseScope, String itemId, ExternalLicenseState licenseState, LicenseType licenseType, Date creationTime, Date modificationTime, Date lastChecked) {
        super(itemId, licenseScope, creationTime, modificationTime, lastChecked);
        this.licenseType = LicenseType.UNMANAGED;
        this.isLicenseStale = false;
        if (StringUtility.isNullOrEmpty(licenseId)) {
            throw new IllegalArgumentException("licenseId cannot be empty or null");
        }
        if (StringUtility.isNullOrEmpty(platform)) {
            throw new IllegalArgumentException("platform cannot be empty or null");
        }
        if (licenseState == null) {
            throw new IllegalArgumentException("licenseState cannot be null");
        }
        if (licenseType == null) {
            throw new IllegalArgumentException("licenseType cannot be null");
        }
        this.licenseId = licenseId;
        this.platform = platform;
        this.licenseState = licenseState;
        this.licenseType = licenseType;
    }

    public boolean isStale() {
        return this.isLicenseStale;
    }

    public void setLicenseStale(boolean isLicenseState) {
        this.isLicenseStale = isLicenseState;
    }

    public String getLicenseId() {
        return this.licenseId;
    }

    public ExternalLicenseState getLicenseState() {
        return this.licenseState;
    }

    public InternalLicenseState getInternalLicenseState() {
        return this.internalLicenseState;
    }

    public void setInternalLicenseState(InternalLicenseState internalLicenseState) {
        if (internalLicenseState == null) {
            throw new IllegalArgumentException("'internalLicenseState' cannot be null");
        }
        this.internalLicenseState = internalLicenseState;
    }

    public void setLastServerSyncTimeInternal() {
        setLastServerSyncTime(new Date());
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        validateObjectState();
        out.writeUTF(this.licenseId);
        out.writeUTF(getItemId());
        out.writeUTF(this.platform);
        out.writeLong(getCreationTime().getTime());
        out.writeLong(getModificationTime().getTime());
        out.writeLong(getLastCheckedTime().getTime());
        out.writeObject(this.licenseState);
        out.writeObject(getLicenseScope());
        out.writeObject(this.licenseType);
        out.writeObject(this.internalLicenseState);
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        this.licenseId = in.readUTF();
        this.itemId = in.readUTF();
        this.platform = in.readUTF();
        this.creationTime = new Date(in.readLong());
        this.modificationTime = new Date(in.readLong());
        setLastServerSyncTime(new Date(in.readLong()));
        this.licenseState = (ExternalLicenseState) in.readObject();
        this.licenseScope = (License.LicenseScope) in.readObject();
        this.licenseType = (LicenseType) in.readObject();
        this.internalLicenseState = (InternalLicenseState) in.readObject();
        validateObjectState();
    }

    private void validateObjectState() {
        if (StringUtility.isNullOrEmpty(this.licenseId)) {
            throw new IllegalStateException("licenseId cannot be null or empty");
        }
        if (StringUtility.isNullOrEmpty(getItemId())) {
            throw new IllegalStateException("itemId cannot be null or empty");
        }
        if (StringUtility.isNullOrEmpty(this.platform)) {
            throw new IllegalStateException("platform cannot be null or empty");
        }
        if (getCreationTime() == null) {
            throw new IllegalStateException("creationTime cannot be null");
        }
        if (getModificationTime() == null) {
            throw new IllegalStateException("modificationTime cannot be null");
        }
        if (getLastCheckedTime() == null) {
            throw new IllegalStateException("lastCheckedTime cannot be null");
        }
        if (this.licenseState == null) {
            throw new IllegalStateException("licenseState cannot be null");
        }
        if (getLicenseScope() != null) {
            return;
        }
        throw new IllegalStateException("licenseScope cannot be null");
    }
}
