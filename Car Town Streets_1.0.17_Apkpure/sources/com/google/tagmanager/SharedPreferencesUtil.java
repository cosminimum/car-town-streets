package com.google.tagmanager;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
/* loaded from: classes.dex */
class SharedPreferencesUtil {
    SharedPreferencesUtil() {
    }

    static void saveEditorAsync(final SharedPreferences.Editor editor) {
        if (Build.VERSION.SDK_INT >= 9) {
            editor.apply();
        } else {
            new Thread(new Runnable() { // from class: com.google.tagmanager.SharedPreferencesUtil.1
                @Override // java.lang.Runnable
                public void run() {
                    editor.commit();
                }
            }).start();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @SuppressLint({"CommitPrefEdits"})
    public static void saveAsync(Context context, String sharedPreferencesName, String key, String value) {
        SharedPreferences settings = context.getSharedPreferences(sharedPreferencesName, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString(key, value);
        saveEditorAsync(editor);
    }
}
