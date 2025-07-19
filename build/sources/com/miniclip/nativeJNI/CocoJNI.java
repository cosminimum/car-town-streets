package com.miniclip.nativeJNI;

public class CocoJNI {
    public static native void Maccel(float f, float f2, float f3, long j);

    public static native void MadClicked();

    public static native void MdatePickerClosed();

    public static native void MdatePickerResponce(int i, int i2, int i3);

    public static native void MdisplayInfo(int i, int i2);

    public static native void MfacebookLikeComplete();

    public static native void MfacebookLoginComplete();

    public static native void MfacebookRequestComplete(int i, int i2, byte[] bArr);

    public static native void MfacebookShareCanceled();

    public static native void MfacebookShareComplete();

    public static native void MinterstitialClosed(int i);

    public static native void MkeyboardInputClosed(String str);

    public static native void MkeyboardInputResponse(String str);

    public static native void MlowMemory();

    public static native void MnativeInitBitmap(int i, int i2, byte[] bArr);

    public static native void MnetworkTimeResponce(int i, double d, int i2);

    public static native void MnotifyAspectRatioChange();

    public static native void MonMessageBoxButtonPressed(int i, int i2);

    public static native void Mpause();

    public static native void MpreserveContext(int i);

    public static native void MpressedBackButton();

    public static native void MpressedKey(int i, int i2);

    public static native void MrealDisplayInfo(int i, int i2);

    public static native void Mrender();

    public static native void MrestoreContext();

    public static native void Mresume();

    public static native void Mrun();

    public static native void MsetAPKPath(String str);

    public static native void MsetAdLoadFailed(int i);

    public static native void MsetAppVersionNumber(String str);

    public static native void MsetCountryCode(String str);

    public static native void MsetDensity(float f);

    public static native void MsetFilesPath(String str, String str2);

    public static native void MsetGamePause(int i);

    public static native void MsetInAppResponce(int i, int i2, int i3, String str, String str2, String str3);

    public static native void MsetInAppResponceGetJar(int i, int i2, int i3, String str, String str2, String str3, String str4);

    public static native void MsetIsRetina(int i);

    public static native void MsetMainActivity(Object obj);

    public static native void MsetTapjoyCoins(int i);

    public static native void MshowUpSellScreen();

    public static native void MsimplePingResponce(int i, int i2);

    public static native void MtouchesBegin(int i, float f, float f2);

    public static native void MtouchesCancel(int[] iArr, float[] fArr, float[] fArr2);

    public static native void MtouchesEnd(int i, float f, float f2);

    public static native void MtouchesMove(int[] iArr, float[] fArr, float[] fArr2);

    public static native void NFcallAvailabilityChanged(int i);

    public static native void NFcallBoardDidAppear();

    public static native void NFcallBoardDidDisappear();

    public static native void NFcallBoardWillAppear();

    public static native void NFcallBoardWillDisappear();

    public static native void NFcallNrOfMessagesChanged(int i);

    public static native void NFcallNrOfUnreadMessagesChanged(int i);

    public static native int NFcallShouldShowUrgentMessage();

    static {
        System.loadLibrary("game");
    }
}
