package com.getjar.sdk.comm.auth;

import android.content.Context;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.List;
import java.util.Locale;
/* loaded from: classes.dex */
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
        if (_Instance == null) {
            throw new IllegalStateException("AccountHistoryManager.initialize() must be called first");
        }
        return _Instance;
    }

    public List<AccountHistoryInfo> getAccounts() {
        return AccountHistoryDatabase.getInstance(this._context).getAccounts();
    }

    public String getCurrentAccountName() {
        List<AccountHistoryEvent> events = AccountHistoryDatabase.getInstance(this._context).getEvents();
        for (AccountHistoryEvent event : events) {
            if (event.getEventType().isAuthEvent() || AccountEventType.USER_SWITCHED.equals(event.getEventType())) {
                AccountHistoryInfo account = AccountHistoryDatabase.getInstance(this._context).getAccount(event.getUserAccessId());
                if (account == null) {
                    Logger.e(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "getCurrentAccountName() Failed to load an account info record for user access ID '%1$s'", event.getUserAccessId()));
                } else {
                    return account.getAccountName();
                }
            }
        }
        return null;
    }

    public String getPreviousAccountName() {
        String currentUserAccessId = null;
        List<AccountHistoryEvent> events = AccountHistoryDatabase.getInstance(this._context).getEvents();
        for (AccountHistoryEvent event : events) {
            if (currentUserAccessId == null) {
                currentUserAccessId = event.getUserAccessId();
            } else if (!currentUserAccessId.equals(event.getUserAccessId()) && (event.getEventType().isAuthEvent() || AccountEventType.USER_SWITCHED.equals(event.getEventType()))) {
                AccountHistoryInfo account = AccountHistoryDatabase.getInstance(this._context).getAccount(event.getUserAccessId());
                if (account == null) {
                    Logger.e(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "getPreviousAccountName() Failed to load an account info record for user access ID '%1$s'", event.getUserAccessId()));
                } else {
                    return account.getAccountName();
                }
            }
        }
        return null;
    }

    public boolean isUserSwitchedUINeeded(String userAccessId) {
        if (StringUtility.isNullOrEmpty(userAccessId)) {
            throw new IllegalArgumentException("'userAccessId' can not be NULL or empty");
        }
        List<AccountHistoryEvent> events = AccountHistoryDatabase.getInstance(this._context).getEvents(userAccessId);
        for (AccountHistoryEvent event : events) {
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
        }
        if (StringUtility.isNullOrEmpty(userDeviceId)) {
            throw new IllegalArgumentException("'userDeviceId' cannot be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(accountName)) {
            throw new IllegalArgumentException("'accountName' cannot be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("'providerFilter' cannot be NULL or empty");
        }
        AccountHistoryDatabase.getInstance(this._context).ensureAccountEntry(userAccessId, userDeviceId, accountName, providerFilter, System.currentTimeMillis());
    }

    public void addEvent(String userAccessId, AccountEventType eventType) {
        if (StringUtility.isNullOrEmpty(userAccessId)) {
            throw new IllegalArgumentException("'userAccessId' cannot be NULL or empty");
        }
        if (eventType == null) {
            throw new IllegalArgumentException("'eventType' cannot be NULL");
        }
        AccountHistoryDatabase.getInstance(this._context).insertEvent(userAccessId, eventType, System.currentTimeMillis());
    }
}
