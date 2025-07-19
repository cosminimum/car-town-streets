package com.getjar.sdk;

import com.getjar.sdk.utilities.StringUtility;
import java.util.Date;

public class License {
    protected Date creationTime;
    protected String itemId;
    private Date lastServerSyncTime;
    protected LicenseScope licenseScope;
    protected Date modificationTime;

    public enum LicenseScope {
        USER,
        PLATFORM,
        DEVICE
    }

    protected License() {
    }

    protected License(String itemId2, LicenseScope licenseScope2, Date creationTime2, Date modificationTime2, Date lastCheckedTime) {
        if (StringUtility.isNullOrEmpty(itemId2)) {
            throw new IllegalArgumentException("itemId cannot be empty or null");
        } else if (licenseScope2 == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        } else if (creationTime2 == null) {
            throw new IllegalArgumentException("creationTime cannot be null");
        } else if (modificationTime2 == null) {
            throw new IllegalArgumentException("modificationTime cannot be null");
        } else if (lastCheckedTime == null) {
            throw new IllegalArgumentException("lastCheckedTime cannot be null");
        } else {
            this.licenseScope = licenseScope2;
            this.itemId = itemId2;
            this.creationTime = creationTime2;
            this.modificationTime = modificationTime2;
            this.lastServerSyncTime = lastCheckedTime;
        }
    }

    public Date getModificationTime() {
        return this.modificationTime;
    }

    public Date getLastCheckedTime() {
        return this.lastServerSyncTime;
    }

    public LicenseScope getLicenseScope() {
        return this.licenseScope;
    }

    public String getItemId() {
        return this.itemId;
    }

    public Date getCreationTime() {
        return this.creationTime;
    }

    /* access modifiers changed from: protected */
    public void setLastServerSyncTime(Date lastServerSyncTime2) {
        if (lastServerSyncTime2 == null) {
            throw new IllegalArgumentException("'lastChecked' cannot be null");
        }
        this.lastServerSyncTime = lastServerSyncTime2;
    }
}
