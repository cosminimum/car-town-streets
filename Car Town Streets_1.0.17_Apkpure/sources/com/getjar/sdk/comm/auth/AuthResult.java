package com.getjar.sdk.comm.auth;

import com.getjar.sdk.utilities.StringUtility;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
class AuthResult {
    private final String _authToken;
    private final Map<String, String> _claims;
    private final String _providerFilter;
    private final Map<String, SettingsValue> _settings;
    private final State _state;
    private final long _ttl;

    /* loaded from: classes.dex */
    public enum State {
        SUCCEEDED,
        UNKNOWN_FAILURE,
        BLACKLISTED,
        UNSUPPORTED;

        public boolean succeeded() {
            State currentValue = values()[ordinal()];
            switch (currentValue) {
                case SUCCEEDED:
                    return true;
                default:
                    return false;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AuthResult(String providerFilter, String authToken, Map<String, String> claims, Map<String, SettingsValue> settings, long ttl) {
        if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("'providerFilter' cannot be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(authToken)) {
            throw new IllegalArgumentException("'authToken' cannot be NULL or empty");
        }
        if (claims == null) {
            throw new IllegalArgumentException("'claims' cannot be NULL");
        }
        if (ttl < 0) {
            throw new IllegalArgumentException("'ttl' cannot be less than zero");
        }
        this._providerFilter = providerFilter;
        this._authToken = authToken;
        this._claims = Collections.unmodifiableMap(new HashMap(claims));
        this._settings = Collections.unmodifiableMap(new HashMap(settings));
        this._ttl = ttl;
        this._state = State.SUCCEEDED;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AuthResult(String providerFilter, State state) {
        if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("'providerFilter' cannot be NULL or empty");
        }
        if (state == null) {
            throw new IllegalArgumentException("'state' cannot be NULL");
        }
        if (state == State.SUCCEEDED) {
            throw new IllegalArgumentException("'state' cannot be set to State.SUCCEEDED here");
        }
        this._providerFilter = providerFilter;
        this._authToken = null;
        this._claims = null;
        this._settings = null;
        this._ttl = 0L;
        this._state = state;
    }

    public String getProviderFilter() {
        return this._providerFilter;
    }

    public String getAuthToken() {
        return this._authToken;
    }

    public Map<String, String> getClaims() {
        return this._claims;
    }

    public Map<String, SettingsValue> getSettings() {
        return this._settings;
    }

    public long getTTL() {
        return this._ttl;
    }

    public State getState() {
        return this._state;
    }
}
