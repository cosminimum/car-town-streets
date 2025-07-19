package com.getjar.sdk.comm.auth;

import android.app.Activity;
import android.app.Dialog;
import java.util.List;

public interface AuthUIParentInterface {
    Activity getParentActivity();

    String getTheTitle();

    void relinquishUI();

    void takeoverUI(List<Dialog> list);
}
