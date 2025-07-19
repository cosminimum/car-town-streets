.class public Lcom/miniclip/nativeJNI/CocoJNI;
.super Ljava/lang/Object;
.source "CocoJNI.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    const-string v0, "game"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native Maccel(FFFJ)V
.end method

.method public static native MadClicked()V
.end method

.method public static native MdatePickerClosed()V
.end method

.method public static native MdatePickerResponce(III)V
.end method

.method public static native MdisplayInfo(II)V
.end method

.method public static native MfacebookLikeComplete()V
.end method

.method public static native MfacebookLoginComplete()V
.end method

.method public static native MfacebookRequestComplete(II[B)V
.end method

.method public static native MfacebookShareCanceled()V
.end method

.method public static native MfacebookShareComplete()V
.end method

.method public static native MinterstitialClosed(I)V
.end method

.method public static native MkeyboardInputClosed(Ljava/lang/String;)V
.end method

.method public static native MkeyboardInputResponse(Ljava/lang/String;)V
.end method

.method public static native MlowMemory()V
.end method

.method public static native MnativeInitBitmap(II[B)V
.end method

.method public static native MnetworkTimeResponce(IDI)V
.end method

.method public static native MnotifyAspectRatioChange()V
.end method

.method public static native MonMessageBoxButtonPressed(II)V
.end method

.method public static native Mpause()V
.end method

.method public static native MpreserveContext(I)V
.end method

.method public static native MpressedBackButton()V
.end method

.method public static native MpressedKey(II)V
.end method

.method public static native MrealDisplayInfo(II)V
.end method

.method public static native Mrender()V
.end method

.method public static native MrestoreContext()V
.end method

.method public static native Mresume()V
.end method

.method public static native Mrun()V
.end method

.method public static native MsetAPKPath(Ljava/lang/String;)V
.end method

.method public static native MsetAdLoadFailed(I)V
.end method

.method public static native MsetAppVersionNumber(Ljava/lang/String;)V
.end method

.method public static native MsetCountryCode(Ljava/lang/String;)V
.end method

.method public static native MsetDensity(F)V
.end method

.method public static native MsetFilesPath(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native MsetGamePause(I)V
.end method

.method public static native MsetInAppResponce(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native MsetInAppResponceGetJar(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native MsetIsRetina(I)V
.end method

.method public static native MsetMainActivity(Ljava/lang/Object;)V
.end method

.method public static native MsetTapjoyCoins(I)V
.end method

.method public static native MshowUpSellScreen()V
.end method

.method public static native MsimplePingResponce(II)V
.end method

.method public static native MtouchesBegin(IFF)V
.end method

.method public static native MtouchesCancel([I[F[F)V
.end method

.method public static native MtouchesEnd(IFF)V
.end method

.method public static native MtouchesMove([I[F[F)V
.end method

.method public static native NFcallAvailabilityChanged(I)V
.end method

.method public static native NFcallBoardDidAppear()V
.end method

.method public static native NFcallBoardDidDisappear()V
.end method

.method public static native NFcallBoardWillAppear()V
.end method

.method public static native NFcallBoardWillDisappear()V
.end method

.method public static native NFcallNrOfMessagesChanged(I)V
.end method

.method public static native NFcallNrOfUnreadMessagesChanged(I)V
.end method

.method public static native NFcallShouldShowUrgentMessage()I
.end method
