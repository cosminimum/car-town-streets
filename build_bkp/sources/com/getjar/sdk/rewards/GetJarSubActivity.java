package com.getjar.sdk.rewards;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Bundle;
import com.getjar.sdk.comm.auth.AuthUIParentInterface;

public interface GetJarSubActivity extends AuthUIParentInterface {
    void close();

    void onActivityResult(int i, int i2, Intent intent);

    void onBackPressed();

    void onConfigurationChanged(Configuration configuration);

    void onCreate(Bundle bundle);

    void onDestroy();

    void onNewIntent(Intent intent);

    void onPause();

    void onResume();

    void onSaveInstanceState(Bundle bundle);

    void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str);
}
