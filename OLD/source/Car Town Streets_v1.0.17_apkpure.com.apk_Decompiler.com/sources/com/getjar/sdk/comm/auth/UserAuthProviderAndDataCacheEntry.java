package com.getjar.sdk.comm.auth;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Locale;

public class UserAuthProviderAndDataCacheEntry implements Serializable {
    private static final long serialVersionUID = -6814393690712845165L;
    private HashMap<String, String> _cachedProviderData = null;
    private Class<? extends UserAuthProvider> _userAuthProviderType = null;

    public UserAuthProviderAndDataCacheEntry() {
    }

    public UserAuthProviderAndDataCacheEntry(Class<? extends UserAuthProvider> userAuthProviderType, HashMap<String, String> cachedProviderData) {
        this._userAuthProviderType = userAuthProviderType;
        this._cachedProviderData = cachedProviderData;
        validateObjectState();
    }

    public Class<? extends UserAuthProvider> getUserAuthProviderType() {
        return this._userAuthProviderType;
    }

    public HashMap<String, String> getCachedProviderData() {
        return this._cachedProviderData;
    }

    private void validateObjectState() {
        if (this._userAuthProviderType == null) {
            throw new IllegalArgumentException("'userAuthProviderType' can not be NULL");
        } else if (!UserAuthProvider.class.isAssignableFrom(this._userAuthProviderType)) {
            throw new IllegalArgumentException(String.format(Locale.US, "'userAuthProviderType' must implement UserAuthProviderInterface [type:%1$s]", new Object[]{this._userAuthProviderType.getName()}));
        }
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeObject(this._userAuthProviderType);
        out.writeObject(this._cachedProviderData);
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        this._userAuthProviderType = (Class) in.readObject();
        this._cachedProviderData = (HashMap) in.readObject();
        validateObjectState();
    }
}
