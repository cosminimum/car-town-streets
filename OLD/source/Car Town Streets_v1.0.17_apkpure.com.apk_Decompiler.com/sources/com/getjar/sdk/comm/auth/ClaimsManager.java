package com.getjar.sdk.comm.auth;

import android.content.Context;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.InAppPurchaseManager;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;
import java.util.Map;

public class ClaimsManager {
    public static final String KeyClaimsUserAccessID = "claims.user.user_access_id";
    public static final String KeyClaimsUserDeviceID = "claims.user.device.id";
    private static final String _BillingPermission = "com.android.vending.BILLING";
    private static volatile ClaimsManager _Instance = null;
    private final Context _context;

    private ClaimsManager(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("'context' can not be NULL");
        }
        this._context = context;
    }

    protected static synchronized void initialize(Context context) {
        synchronized (ClaimsManager.class) {
            if (_Instance == null) {
                _Instance = new ClaimsManager(context);
            }
        }
    }

    protected static ClaimsManager getInstance() {
        if (_Instance != null) {
            return _Instance;
        }
        throw new IllegalStateException("ClaimsManager.initialize() must be called first");
    }

    public Map<String, String> getCapabilities() {
        AuthManager.initialize(this._context);
        AuthManager.getInstance().waitOnAuth();
        return AuthManager.getInstance().getCapabilities();
    }

    public boolean canBuy() {
        if (!RewardUtility.checkPermission(this._context, _BillingPermission)) {
            Logger.i(Area.AUTH.value() | Area.BUY_GOLD.value(), "Auth: ClaimsManager: canBuy() returning FALSE");
            return false;
        }
        Map<String, String> caps = getCapabilities();
        if (!checkBooleanClaim(caps, "user.currency.buy")) {
            Logger.i(Area.AUTH.value() | Area.BUY_GOLD.value(), "Auth: ClaimsManager: canBuy() returning FALSE");
            return false;
        } else if (!checkBooleanClaim(caps, "app.currency.buy")) {
            Logger.i(Area.AUTH.value() | Area.BUY_GOLD.value(), "Auth: ClaimsManager: canBuy() returning FALSE");
            return false;
        } else if (!checkBooleanClaim(caps, "app.currency.buy_as_merchant")) {
            Logger.i(Area.AUTH.value() | Area.BUY_GOLD.value(), "Auth: ClaimsManager: canBuy() returning FALSE");
            return false;
        } else if (!this._context.getSharedPreferences("GetJarClientPrefs", 0).getBoolean(Constants.BILLING_SUPPORTED_PREFS, true)) {
            Logger.i(Area.AUTH.value() | Area.BUY_GOLD.value(), "Auth: ClaimsManager: canBuy() returning FALSE [isBillingSupported]");
            return false;
        } else {
            Logger.i(Area.AUTH.value() | Area.BUY_GOLD.value(), "Auth: ClaimsManager: canBuy() returning TRUE");
            return true;
        }
    }

    public boolean canEarn() {
        Map<String, String> caps = getCapabilities();
        if (!checkBooleanClaim(caps, "user.currency.earn")) {
            Logger.i(Area.AUTH.value() | Area.EARN.value(), "Auth: ClaimsManager: canEarn() returning FALSE");
            return false;
        } else if (!checkBooleanClaim(caps, "app.currency.earn")) {
            Logger.i(Area.AUTH.value() | Area.EARN.value(), "Auth: ClaimsManager: canEarn() returning FALSE");
            return false;
        } else {
            Logger.i(Area.AUTH.value() | Area.EARN.value(), "Auth: ClaimsManager: canEarn() returning TRUE");
            return true;
        }
    }

    public boolean canPurchaseManagedProducts() {
        Map<String, String> caps = getCapabilities();
        if (!checkBooleanClaim(caps, "user.products.purchase")) {
            Logger.i(Area.AUTH.value() | Area.OFFER.value(), "Auth: ClaimsManager: canPurchaseManagedProducts() returning FALSE");
            return false;
        } else if (!checkBooleanClaim(caps, "app.managed_products.purchase")) {
            Logger.i(Area.AUTH.value() | Area.OFFER.value(), "Auth: ClaimsManager: canPurchaseManagedProducts() returning FALSE");
            return false;
        } else if (!RewardUtility.checkPermission(this._context, _BillingPermission)) {
            Logger.i(Area.AUTH.value() | Area.OFFER.value(), "Auth: ClaimsManager: canPurchaseManagedProducts() returning FALSE");
            return false;
        } else if (this._context.getSharedPreferences("GetJarClientPrefs", 0).contains(Constants.BILLING_API3_SUPPORTED_PREFS) || InAppPurchaseManager.getInstance(this._context).isApi3BillingSupported()) {
            return true;
        } else {
            Logger.i(Area.AUTH.value() | Area.OFFER.value(), "Auth: ClaimsManager: canPurchaseManagedProducts() returning FALSE [isBillingSupported]");
            return false;
        }
    }

    public boolean canViewManagedProducts() {
        if (checkBooleanClaim(getCapabilities(), "app.managed_products.view")) {
            return true;
        }
        Logger.i(Area.AUTH.value() | Area.OFFER.value(), "Auth: ClaimsManager: canViewManagedProducts() returning FALSE");
        return false;
    }

    public boolean canUseUnmanagedLicenses() {
        Map<String, String> caps = getCapabilities();
        if (!checkBooleanClaim(caps, "user.product_licenses.use")) {
            Logger.i(Area.AUTH.value() | Area.LICENSING.value(), "Auth: ClaimsManager: canUseUnmanagedLicenses() returning FALSE");
            return false;
        } else if (!checkBooleanClaim(caps, "app.unmanaged_product_licenses.use")) {
            Logger.i(Area.AUTH.value() | Area.LICENSING.value(), "Auth: ClaimsManager: canUseUnmanagedLicenses() returning FALSE");
            return false;
        } else {
            Logger.i(Area.AUTH.value() | Area.LICENSING.value(), "Auth: ClaimsManager: canUseUnmanagedLicenses() returning TRUE");
            return true;
        }
    }

    public boolean canModifyUnmanagedLicenses() {
        Map<String, String> caps = getCapabilities();
        if (!checkBooleanClaim(caps, "user.product_licenses.modify")) {
            Logger.i(Area.AUTH.value() | Area.LICENSING.value(), "Auth: ClaimsManager: canModifyUnmanagedLicenses() returning FALSE");
            return false;
        } else if (!checkBooleanClaim(caps, "app.unmanaged_product_licenses.modify")) {
            Logger.i(Area.AUTH.value() | Area.LICENSING.value(), "Auth: ClaimsManager: canModifyUnmanagedLicenses() returning FALSE");
            return false;
        } else {
            Logger.i(Area.AUTH.value() | Area.LICENSING.value(), "Auth: ClaimsManager: canModifyUnmanagedLicenses() returning TRUE");
            return true;
        }
    }

    public boolean canPurchaseUnmanagedProducts() {
        Map<String, String> caps = getCapabilities();
        if (!checkBooleanClaim(caps, "app.unmanaged_products.purchase")) {
            Logger.i(Area.AUTH.value() | Area.PURCHASE.value(), "Auth: ClaimsManager: canPurchaseUnmanagedProducts() returning FALSE");
            return false;
        } else if (!checkBooleanClaim(caps, "user.products.purchase")) {
            Logger.i(Area.AUTH.value() | Area.PURCHASE.value(), "Auth: ClaimsManager: canPurchaseUnmanagedProducts() returning FALSE");
            return false;
        } else {
            Logger.i(Area.AUTH.value() | Area.PURCHASE.value(), "Auth: ClaimsManager: canPurchaseUnmanagedProducts() returning TRUE");
            return true;
        }
    }

    private boolean checkBooleanClaim(Map<String, String> claims, String key) {
        if (claims == null) {
            throw new IllegalArgumentException("'claims' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(key)) {
            throw new IllegalArgumentException("'key' cannot be NULL or empty");
        } else {
            try {
                for (Map.Entry<String, String> cap : claims.entrySet()) {
                    if (key.equals(cap.getKey())) {
                        boolean result = Boolean.parseBoolean(cap.getValue());
                        Logger.v(Area.AUTH.value(), String.format(Locale.US, "Auth: ClaimsManager: checkBooleanClaim() returning %1$s for %2$s", new Object[]{Boolean.valueOf(result), key}));
                        return result;
                    }
                }
            } catch (Exception e) {
                Logger.e(Area.AUTH.value(), "Auth: ClaimsManager: checkBooleanClaim() failed", e);
            }
            Logger.v(Area.AUTH.value(), String.format(Locale.US, "Auth: ClaimsManager: checkBooleanClaim() returning false for %1$s", new Object[]{key}));
            return false;
        }
    }
}
