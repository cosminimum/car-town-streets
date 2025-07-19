package com.google.tagmanager;

import android.annotation.TargetApi;
import android.os.Build;
import java.io.File;
/* loaded from: classes.dex */
class FutureApis {
    private FutureApis() {
    }

    public static int version() {
        try {
            int version = Integer.parseInt(Build.VERSION.SDK);
            return version;
        } catch (NumberFormatException e) {
            Log.e("Invalid version number: " + Build.VERSION.SDK);
            return 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @TargetApi(9)
    public static boolean setOwnerOnlyReadWrite(String path) {
        if (version() < 9) {
            return false;
        }
        File file = new File(path);
        file.setReadable(false, false);
        file.setWritable(false, false);
        file.setReadable(true, true);
        file.setWritable(true, true);
        return true;
    }
}
