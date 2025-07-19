package com.google.tagmanager;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

public class PreviewActivity extends Activity {
    public void onCreate(Bundle savedInstanceState) {
        try {
            super.onCreate(savedInstanceState);
            Log.m4390i("Preview activity");
            Uri data = getIntent().getData();
            if (!TagManager.getInstance(this).setPreviewData(data)) {
                Log.m4394w("Cannot preview the app with the uri: " + data);
                return;
            }
            Intent intent = getPackageManager().getLaunchIntentForPackage(getPackageName());
            if (intent != null) {
                Log.m4390i("Invoke the launch activity for package name: " + getPackageName());
                startActivity(intent);
                return;
            }
            Log.m4390i("No launch activity found for package name: " + getPackageName());
        } catch (Exception e) {
            Log.m4388e("Calling preview threw an exception: " + e.getMessage());
        }
    }
}
