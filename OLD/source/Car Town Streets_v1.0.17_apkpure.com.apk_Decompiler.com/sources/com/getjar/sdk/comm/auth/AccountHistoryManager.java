package com.getjar.sdk.comm.auth;

import android.content.Context;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.List;
import java.util.Locale;

public class AccountHistoryManager {
    private static volatile AccountHistoryManager _Instance = null;
    private final Context _context;

    private AccountHistoryManager(Context context) {
        this._context = context;
    }

    public static synchronized void initialize(Context context) {
        synchronized (AccountHistoryManager.class) {
            if (_Instance == null) {
                _Instance = new AccountHistoryManager(context);
            }
        }
    }

    public static AccountHistoryManager getInstance() {
        if (_Instance != null) {
            return _Instance;
        }
        throw new IllegalStateException("AccountHistoryManager.initialize() must be called first");
    }

    public List<AccountHistoryInfo> getAccounts() {
        return AccountHistoryDatabase.getInstance(this._context).getAccounts();
    }

    public String getCurrentAccountName() {
        for (AccountHistoryEvent event : AccountHistoryDatabase.getInstance(this._context).getEvents()) {
            if (event.getEventType().isAuthEvent() || AccountEventType.USER_SWITCHED.equals(event.getEventType())) {
                AccountHistoryInfo account = AccountHistoryDatabase.getInstance(this._context).getAccount(event.getUserAccessId());
                if (account != null) {
                    return account.getAccountName();
                }
                Logger.e(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "getCurrentAccountName() Failed to load an account info record for user access ID '%1$s'", new Object[]{event.getUserAccessId()}));
            }
        }
        return null;
    }

    public String getPreviousAccountName() {
        String currentUserAccessId = null;
        for (AccountHistoryEvent event : AccountHistoryDatabase.getInstance(this._context).getEvents()) {
            if (currentUserAccessId == null) {
                currentUserAccessId = event.getUserAccessId();
            } else if (!currentUserAccessId.equals(event.getUserAccessId()) && (event.getEventType().isAuthEvent() || AccountEventType.USER_SWITCHED.equals(event.getEventType()))) {
                AccountHistoryInfo account = AccountHistoryDatabase.getInstance(this._context).getAccount(event.getUserAccessId());
                if (account != null) {
                    return account.getAccountName();
                }
                Logger.e(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "getPreviousAccountName() Failed to load an account info record for user access ID '%1$s'", new Object[]{event.getUserAccessId()}));
            }
        }
        return null;
    }

    public boolean isUserSwitchedUINeeded(String userAccessId) {
        if (StringUtility.isNullOrEmpty(userAccessId)) {
            throw new IllegalArgumentException("'userAccessId' can not be NULL or empty");
        }
        for (AccountHistoryEvent event : AccountHistoryDatabase.getInstance(this._context).getEvents(userAccessId)) {
            if (AccountEventType.USER_SWITCHED.equals(event.getEventType())) {
                return true;
            }
            if (AccountEventType.USER_SWITCHED_UI_COMPLETED.equals(event.getEventType())) {
                return false;
            }
        }
        return false;
    }

    public void ensureAccountEntry(String userAccessId, String userDeviceId, String accountName, String providerFilter) {
        if (StringUtility.isNullOrEmpty(userAccessId)) {
            throw new IllegalArgumentException("'userAccessId' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(userDeviceId)) {
            throw new IllegalArgumentException("'userDeviceId' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(accountName)) {
            throw new IllegalArgumentException("'accountName' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("'providerFilter' cannot be NULL or empty");
        } else {
            AccountHistoryDatabase.getInstance(this._context).ensureAccountEntry(userAccessId, userDeviceId, accountName, providerFilter, System.currentTimeMillis());
        }
    }

    public void addEvent(String userAccessId, AccountEventType eventType) {
        if (StringUtility.isNullOrEmpty(userAccessId)) {
            throw new IllegalArgumentException("'userAccessId' cannot be NULL or empty");
        } else if (eventType == null) {
            throw new IllegalArgumentException("'eventType' cannot be NULL");
        } else {
            AccountHistoryDatabase.getInstance(this._context).insertEvent(userAccessId, eventType, System.currentTimeMillis());
        }
    }
}
