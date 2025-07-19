package com.getjar.sdk.utilities;

import android.graphics.Bitmap;
/* loaded from: classes.dex */
public class DownloadUrl {
    private Bitmap mAppIcon;
    private String mAppLink;
    private String mAppName;
    private String mAppPackageName;
    private Bitmap mGetIcon;
    private String mGetJarLink;
    private String mGetJarName;
    private String mGetJarPackageName;

    public DownloadUrl(String aname, String apackage, String alink, String gname, String gpackage, String glink, Bitmap appicon, Bitmap geticon) {
        this.mAppName = aname;
        this.mAppLink = alink;
        this.mGetJarLink = glink;
        this.mGetIcon = geticon;
        this.mAppIcon = appicon;
        this.mAppPackageName = apackage;
        this.mGetJarName = gname;
        this.mGetJarPackageName = gpackage;
    }

    public String getAppName() {
        return this.mAppName;
    }

    public String getAppPackageName() {
        return this.mAppPackageName;
    }

    public String getGetJarName() {
        return this.mGetJarName;
    }

    public String getGetPackageName() {
        return this.mGetJarPackageName;
    }

    public Bitmap getAppIcon() {
        return this.mAppIcon;
    }

    public String getAppLink() {
        return this.mAppLink;
    }

    public Bitmap getGetJarIcon() {
        return this.mGetIcon;
    }

    public String getGetJarLink() {
        return this.mGetJarLink;
    }
}
