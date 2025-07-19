package com.getjar.sdk;

import android.content.Intent;
import android.content.SharedPreferences;
import com.getjar.sdk.License;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.GetJarActivity;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import com.google.android.gms.drive.DriveFile;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Locale;

public final class GetJarPage {
    private String _lang = Constants.DEFAULT_LANGUAGE;
    private final GetJarContext mGjContext;
    private Collection<Product> mProducts = Collections.unmodifiableCollection(new ArrayList(0));

    public GetJarPage(GetJarContext getJarContext) {
        Logger.m640d(Area.UI.value() | Area.DEVELOPER_API.value(), "GetJarPage");
        if (getJarContext == null) {
            throw new IllegalArgumentException("Must have a valid context.");
        }
        this.mGjContext = getJarContext;
    }

    public void setProducts(Collection<Product> products) {
        Logger.m640d(Area.PURCHASE.value() | Area.UI.value() | Area.DEVELOPER_API.value(), "GetJarPage.setProducts()");
        if (products == null || products.size() == 0) {
            throw new IllegalArgumentException("need a list of products to offer");
        }
        this.mProducts = Collections.unmodifiableCollection(new ArrayList<>(products));
    }

    public void setProduct(Product product) {
        Logger.m640d(Area.PURCHASE.value() | Area.UI.value() | Area.DEVELOPER_API.value(), "GetJarPage.setProduct()");
        if (product == null) {
            throw new IllegalArgumentException("'product' cannot be NULL");
        }
        ArrayList<Product> newProducts = new ArrayList<>(1);
        newProducts.add(product);
        this.mProducts = Collections.unmodifiableCollection(newProducts);
    }

    public void setLicensableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount, License.LicenseScope licenseScope) {
        Logger.m640d(Area.PURCHASE.value() | Area.LICENSING.value() | Area.UI.value() | Area.DEVELOPER_API.value(), "GetJarPage.setProduct()");
        Product newProduct = new LicensableProduct(theProductId, theProductName, theProductDescription, theAmount, licenseScope);
        ArrayList<Product> newProducts = new ArrayList<>(1);
        newProducts.add(newProduct);
        this.mProducts = Collections.unmodifiableCollection(newProducts);
    }

    public void setLicensableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount, int imageResourceId, License.LicenseScope licenseScope) {
        Logger.m640d(Area.PURCHASE.value() | Area.LICENSING.value() | Area.UI.value() | Area.DEVELOPER_API.value(), "GetJarPage.setProduct()");
        Product newProduct = new LicensableProduct(theProductId, theProductName, theProductDescription, theAmount, imageResourceId, licenseScope);
        ArrayList<Product> newProducts = new ArrayList<>(1);
        newProducts.add(newProduct);
        this.mProducts = Collections.unmodifiableCollection(newProducts);
    }

    public void setConsumableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount) {
        Logger.m640d(Area.PURCHASE.value() | Area.UI.value() | Area.DEVELOPER_API.value(), "GetJarPage.setProduct()");
        Product newProduct = new ConsumableProduct(theProductId, theProductName, theProductDescription, theAmount);
        ArrayList<Product> newProducts = new ArrayList<>(1);
        newProducts.add(newProduct);
        this.mProducts = Collections.unmodifiableCollection(newProducts);
    }

    public void setConsumableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount, int imageResourceId) {
        Logger.m640d(Area.PURCHASE.value() | Area.UI.value() | Area.DEVELOPER_API.value(), "GetJarPage.setProduct()");
        Product newProduct = new ConsumableProduct(theProductId, theProductName, theProductDescription, theAmount, imageResourceId);
        ArrayList<Product> newProducts = new ArrayList<>(1);
        newProducts.add(newProduct);
        this.mProducts = Collections.unmodifiableCollection(newProducts);
    }

    @Deprecated
    public void setGoogleInAppBillingKey(String publicKey) {
        if (StringUtility.isNullOrEmpty(publicKey)) {
            throw new IllegalArgumentException("'publicKey' cannot be null or empty");
        }
        SharedPreferences.Editor editor = this.mGjContext.getAndroidContext().getSharedPreferences("GetJarClientPrefs", 0).edit();
        editor.putString(Constants.BILLING_PUBLIC_KEY, publicKey);
        editor.commit();
    }

    public Collection<Product> getProducts() {
        Logger.m640d(Area.PURCHASE.value() | Area.UI.value() | Area.DEVELOPER_API.value(), "GetJarPage.getProducts()");
        return this.mProducts;
    }

    public void showPage() {
        Logger.m640d(Area.PURCHASE.value() | Area.UI.value() | Area.DEVELOPER_API.value(), "showPage() -- deviceObject Id:" + Utility.getDeviceObjectId(this.mGjContext.getAndroidContext()));
        if (this.mProducts == null || this.mProducts.size() <= 0) {
            throw new IllegalStateException("Product list not set");
        }
        for (Product product : this.mProducts) {
            String licenseScope = "";
            if (product instanceof LicensableProduct) {
                licenseScope = String.format(Locale.US, " LicenseScope:%1$s", new Object[]{((LicensableProduct) product).getLicenseScope().name()});
            }
            Logger.m646v(Area.PURCHASE.value() | Area.UI.value() | Area.DEVELOPER_API.value(), String.format(Locale.US, "GetJarPage: showPage() PRODUCT [ProductName:'%1$s' ProductDescription:'%2$s' ProductId:'%3$s' ProductAmount:%4$d ProductImageResourceId:%5$d%6$s]", new Object[]{product.mProductName, product.mProductDescription, product.mProductId, Long.valueOf(product.mProductAmount), product.mProductImageResourceId, licenseScope}));
        }
        Intent intent = new Intent(this.mGjContext.getAndroidContext(), GetJarActivity.class);
        intent.addFlags(DriveFile.MODE_READ_ONLY);
        intent.putParcelableArrayListExtra(Constants.PRODUCT_LIST, new ArrayList(this.mProducts));
        intent.putExtra(Constants.GETJAR_CONTEXT_ID_KEY, this.mGjContext.getGetJarContextId());
        intent.putExtra(Constants.KEY_LANGUAGE, this._lang.replace("_", "-"));
        intent.putExtra(Constants.EXTRA_WEBVIEW, true);
        this.mGjContext.getAndroidContext().startActivity(intent);
    }
}
