package com.getjar.sdk;

import com.getjar.sdk.utilities.StringUtility;
import java.util.Date;
/* loaded from: classes.dex */
public class License {
    protected Date creationTime;
    protected String itemId;
    private Date lastServerSyncTime;
    protected LicenseScope licenseScope;
    protected Date modificationTime;

    /* loaded from: classes.dex */
    public enum LicenseScope {
        USER,
        PLATFORM,
        DEVICE
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public License() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public License(String itemId, LicenseScope licenseScope, Date creationTime, Date modificationTime, Date lastCheckedTime) {
        if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("itemId cannot be empty or null");
        }
        if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        }
        if (creationTime == null) {
            throw new IllegalArgumentException("creationTime cannot be null");
        }
        if (modificationTime == null) {
            throw new IllegalArgumentException("modificationTime cannot be null");
        }
        if (lastCheckedTime == null) {
            throw new IllegalArgumentException("lastCheckedTime cannot be null");
        }
        this.licenseScope = licenseScope;
        this.itemId = itemId;
        this.creationTime = creationTime;
        this.modificationTime = modificationTime;
        this.lastServerSyncTime = lastCheckedTime;
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

    /* JADX INFO: Access modifiers changed from: protected */
    public void setLastServerSyncTime(Date lastServerSyncTime) {
        if (lastServerSyncTime == null) {
            throw new IllegalArgumentException("'lastChecked' cannot be null");
        }
        this.lastServerSyncTime = lastServerSyncTime;
    }
}
