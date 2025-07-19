package com.millennialmedia.android;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.MotionEvent;
import com.millennialmedia.android.MMAdViewSDK;

public class MMActivity extends Activity {
    private MMBaseActivity activity;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        String className = null;
        try {
            className = getIntent().getStringExtra("class");
            this.activity = (MMBaseActivity) Class.forName(className).newInstance();
            this.activity.activity = this;
            this.activity.onCreate(savedInstanceState);
        } catch (Exception e) {
            MMAdViewSDK.Log.e("Could not start activity for %s. %s", className, e.getMessage());
            e.printStackTrace();
            super.onCreate(savedInstanceState);
            finish();
        }
    }

    /* access modifiers changed from: package-private */
    public void onCreateSuper(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        if (this.activity != null) {
            this.activity.onDestroy();
        } else {
            super.onDestroy();
        }
    }

    /* access modifiers changed from: package-private */
    public void onDestroySuper() {
        super.onDestroy();
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        if (this.activity != null) {
            this.activity.onStart();
        } else {
            super.onStart();
        }
    }

    /* access modifiers changed from: package-private */
    public void onStartSuper() {
        super.onStart();
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        if (this.activity != null) {
            this.activity.onStop();
        } else {
            super.onStop();
        }
    }

    /* access modifiers changed from: package-private */
    public void onStopSuper() {
        super.onStop();
    }

    /* access modifiers changed from: protected */
    public void onRestart() {
        if (this.activity != null) {
            this.activity.onRestart();
        } else {
            super.onRestart();
        }
    }

    /* access modifiers changed from: package-private */
    public void onRestartSuper() {
        super.onRestart();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        if (this.activity != null) {
            this.activity.onResume();
        } else {
            super.onResume();
        }
    }

    /* access modifiers changed from: package-private */
    public void onResumeSuper() {
        super.onResume();
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        if (this.activity != null) {
            this.activity.onPause();
        } else {
            super.onPause();
        }
    }

    /* access modifiers changed from: package-private */
    public void onPauseSuper() {
        super.onPause();
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle outState) {
        if (this.activity != null) {
            this.activity.onSaveInstanceState(outState);
        } else {
            super.onSaveInstanceState(outState);
        }
    }

    /* access modifiers changed from: package-private */
    public void onSaveInstanceStateSuper(Bundle outState) {
        super.onSaveInstanceState(outState);
    }

    /* access modifiers changed from: protected */
    public void onRestoreInstanceState(Bundle savedInstanceState) {
        if (this.activity != null) {
            this.activity.onRestoreInstanceState(savedInstanceState);
        } else {
            super.onRestoreInstanceState(savedInstanceState);
        }
    }

    /* access modifiers changed from: package-private */
    public void onRestoreInstanceStateSuper(Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
    }

    public Object onRetainNonConfigurationInstance() {
        if (this.activity != null) {
            return this.activity.onRetainNonConfigurationInstance();
        }
        return super.onRetainNonConfigurationInstance();
    }

    /* access modifiers changed from: package-private */
    public Object onRetainNonConfigurationInstanceSuper() {
        return super.onRetainNonConfigurationInstance();
    }

    /* access modifiers changed from: protected */
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (this.activity != null) {
            this.activity.onActivityResult(requestCode, resultCode, data);
        } else {
            super.onActivityResult(requestCode, resultCode, data);
        }
    }

    /* access modifiers changed from: package-private */
    public void onActivityResultSuper(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (this.activity != null) {
            return this.activity.onKeyDown(keyCode, event);
        }
        return super.onKeyDown(keyCode, event);
    }

    /* access modifiers changed from: package-private */
    public boolean onKeyDownSuper(int keyCode, KeyEvent event) {
        return super.onKeyDown(keyCode, event);
    }

    public boolean dispatchTouchEvent(MotionEvent ev) {
        if (this.activity != null) {
            return this.activity.dispatchTouchEvent(ev);
        }
        return super.dispatchTouchEvent(ev);
    }

    /* access modifiers changed from: package-private */
    public boolean dispatchTouchEventSuper(MotionEvent ev) {
        return super.dispatchTouchEvent(ev);
    }
}
