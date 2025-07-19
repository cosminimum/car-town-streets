package com.getjar.sdk.listener;

import com.getjar.sdk.License;
import java.util.List;

public interface GetUnmanagedProductLicensesListener {
    void getUnmanagedProductLicensesEvent(List<License> list);
}
