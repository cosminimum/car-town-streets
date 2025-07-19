package com.getjar.sdk.comm.auth;

import com.getjar.sdk.comm.auth.AuthResult;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Map;

class UserAuthResult extends AuthResult {
    private final boolean _isNewUser;
    private final String _userAccessId;
    private final String _userDeviceId;

    public UserAuthResult(String providerFilter, String theUserAccessId, String theUserDeviceId, boolean isNewUser, String theAuthToken, Map<String, String> theClaims, Map<String, SettingsValue> settings, long theTtl) {
        super(providerFilter, theAuthToken, theClaims, settings, theTtl);
        if (StringUtility.isNullOrEmpty(theUserAccessId)) {
            throw new IllegalArgumentException("the user acess id is required");
        } else if (StringUtility.isNullOrEmpty(theUserAccessId)) {
            throw new IllegalArgumentException("the user device id is required");
        } else {
            this._userAccessId = theUserAccessId;
            this._userDeviceId = theUserDeviceId;
            this._isNewUser = isNewUser;
        }
    }

    public UserAuthResult(String providerFilter, AuthResult.State state) {
        super(providerFilter, state);
        this._userAccessId = null;
        this._userDeviceId = null;
        this._isNewUser = false;
    }

    public String getUserAccessId() {
        return this._userAccessId;
    }

    public String getUserDeviceId() {
        return this._userDeviceId;
    }

    public boolean isNewUser() {
        return this._isNewUser;
    }
}
