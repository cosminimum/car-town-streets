package com.getjar.sdk.data;

import com.getjar.sdk.License;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Date;

public class LicenseInternal extends License implements Serializable {
    private static final long serialVersionUID = -2979070449375236570L;
    private InternalLicenseState internalLicenseState;
    private boolean isLicenseStale = false;
    private String licenseId;
    private ExternalLicenseState licenseState;
    private LicenseType licenseType = LicenseType.UNMANAGED;
    private String platform;

    public enum ExternalLicenseState {
        ACQUIRED,
        REVOKED
    }

    public enum InternalLicenseState {
        SYNCED,
        UNSYNCED
    }

    public enum LicenseType {
        UNMANAGED
    }

    public LicenseInternal() {
    }

    public LicenseInternal(String licenseId2, String platform2, License.LicenseScope licenseScope, String itemId, ExternalLicenseState licenseState2, LicenseType licenseType2, Date creationTime, Date modificationTime, Date lastChecked) {
        super(itemId, licenseScope, creationTime, modificationTime, lastChecked);
        if (StringUtility.isNullOrEmpty(licenseId2)) {
            throw new IllegalArgumentException("licenseId cannot be empty or null");
        } else if (StringUtility.isNullOrEmpty(platform2)) {
            throw new IllegalArgumentException("platform cannot be empty or null");
        } else if (licenseState2 == null) {
            throw new IllegalArgumentException("licenseState cannot be null");
        } else if (licenseType2 == null) {
            throw new IllegalArgumentException("licenseType cannot be null");
        } else {
            this.licenseId = licenseId2;
            this.platform = platform2;
            this.licenseState = licenseState2;
            this.licenseType = licenseType2;
        }
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

    public void setInternalLicenseState(InternalLicenseState internalLicenseState2) {
        if (internalLicenseState2 == null) {
            throw new IllegalArgumentException("'internalLicenseState' cannot be null");
        }
        this.internalLicenseState = internalLicenseState2;
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
        } else if (StringUtility.isNullOrEmpty(getItemId())) {
            throw new IllegalStateException("itemId cannot be null or empty");
        } else if (StringUtility.isNullOrEmpty(this.platform)) {
            throw new IllegalStateException("platform cannot be null or empty");
        } else if (getCreationTime() == null) {
            throw new IllegalStateException("creationTime cannot be null");
        } else if (getModificationTime() == null) {
            throw new IllegalStateException("modificationTime cannot be null");
        } else if (getLastCheckedTime() == null) {
            throw new IllegalStateException("lastCheckedTime cannot be null");
        } else if (this.licenseState == null) {
            throw new IllegalStateException("licenseState cannot be null");
        } else if (getLicenseScope() == null) {
            throw new IllegalStateException("licenseScope cannot be null");
        }
    }
}
