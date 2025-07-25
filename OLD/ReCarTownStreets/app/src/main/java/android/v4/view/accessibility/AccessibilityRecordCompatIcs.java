package android.v4.view.accessibility;

import android.os.Parcelable;
import android.view.View;
import android.view.accessibility.AccessibilityRecord;

import java.util.List;

class AccessibilityRecordCompatIcs {
    AccessibilityRecordCompatIcs() {
    }

    public static Object obtain() {
        return AccessibilityRecord.obtain();
    }

    public static Object obtain(Object record) {
        return AccessibilityRecord.obtain((AccessibilityRecord) record);
    }

    public static int getAddedCount(Object record) {
        return ((AccessibilityRecord) record).getAddedCount();
    }

    public static CharSequence getBeforeText(Object record) {
        return ((AccessibilityRecord) record).getBeforeText();
    }

    public static CharSequence getClassName(Object record) {
        return ((AccessibilityRecord) record).getClassName();
    }

    public static CharSequence getContentDescription(Object record) {
        return ((AccessibilityRecord) record).getContentDescription();
    }

    public static int getCurrentItemIndex(Object record) {
        return ((AccessibilityRecord) record).getCurrentItemIndex();
    }

    public static int getFromIndex(Object record) {
        return ((AccessibilityRecord) record).getFromIndex();
    }

    public static int getItemCount(Object record) {
        return ((AccessibilityRecord) record).getItemCount();
    }

    public static Parcelable getParcelableData(Object record) {
        return ((AccessibilityRecord) record).getParcelableData();
    }

    public static int getRemovedCount(Object record) {
        return ((AccessibilityRecord) record).getRemovedCount();
    }

    public static int getScrollX(Object record) {
        return ((AccessibilityRecord) record).getScrollX();
    }

    public static int getScrollY(Object record) {
        return ((AccessibilityRecord) record).getScrollY();
    }

    public static Object getSource(Object record) {
        return ((AccessibilityRecord) record).getSource();
    }

    public static List<CharSequence> getText(Object record) {
        return ((AccessibilityRecord) record).getText();
    }

    public static int getToIndex(Object record) {
        return ((AccessibilityRecord) record).getToIndex();
    }

    public static int getWindowId(Object record) {
        return ((AccessibilityRecord) record).getWindowId();
    }

    public static boolean isChecked(Object record) {
        return ((AccessibilityRecord) record).isChecked();
    }

    public static boolean isEnabled(Object record) {
        return ((AccessibilityRecord) record).isEnabled();
    }

    public static boolean isFullScreen(Object record) {
        return ((AccessibilityRecord) record).isFullScreen();
    }

    public static boolean isPassword(Object record) {
        return ((AccessibilityRecord) record).isPassword();
    }

    public static boolean isScrollable(Object record) {
        return ((AccessibilityRecord) record).isScrollable();
    }

    public static void recycle(Object record) {
        ((AccessibilityRecord) record).recycle();
    }

    public static void setAddedCount(Object record, int addedCount) {
        ((AccessibilityRecord) record).setAddedCount(addedCount);
    }

    public static void setBeforeText(Object record, CharSequence beforeText) {
        ((AccessibilityRecord) record).setBeforeText(beforeText);
    }

    public static void setChecked(Object record, boolean isChecked) {
        ((AccessibilityRecord) record).setChecked(isChecked);
    }

    public static void setClassName(Object record, CharSequence className) {
        ((AccessibilityRecord) record).setClassName(className);
    }

    public static void setContentDescription(Object record, CharSequence contentDescription) {
        ((AccessibilityRecord) record).setContentDescription(contentDescription);
    }

    public static void setCurrentItemIndex(Object record, int currentItemIndex) {
        ((AccessibilityRecord) record).setCurrentItemIndex(currentItemIndex);
    }

    public static void setEnabled(Object record, boolean isEnabled) {
        ((AccessibilityRecord) record).setEnabled(isEnabled);
    }

    public static void setFromIndex(Object record, int fromIndex) {
        ((AccessibilityRecord) record).setFromIndex(fromIndex);
    }

    public static void setFullScreen(Object record, boolean isFullScreen) {
        ((AccessibilityRecord) record).setFullScreen(isFullScreen);
    }

    public static void setItemCount(Object record, int itemCount) {
        ((AccessibilityRecord) record).setItemCount(itemCount);
    }

    public static void setParcelableData(Object record, Parcelable parcelableData) {
        ((AccessibilityRecord) record).setParcelableData(parcelableData);
    }

    public static void setPassword(Object record, boolean isPassword) {
        ((AccessibilityRecord) record).setPassword(isPassword);
    }

    public static void setRemovedCount(Object record, int removedCount) {
        ((AccessibilityRecord) record).setRemovedCount(removedCount);
    }

    public static void setScrollX(Object record, int scrollX) {
        ((AccessibilityRecord) record).setScrollX(scrollX);
    }

    public static void setScrollY(Object record, int scrollY) {
        ((AccessibilityRecord) record).setScrollY(scrollY);
    }

    public static void setScrollable(Object record, boolean scrollable) {
        ((AccessibilityRecord) record).setScrollable(scrollable);
    }

    public static void setSource(Object record, View source) {
        ((AccessibilityRecord) record).setSource(source);
    }

    public static void setToIndex(Object record, int toIndex) {
        ((AccessibilityRecord) record).setToIndex(toIndex);
    }
}
