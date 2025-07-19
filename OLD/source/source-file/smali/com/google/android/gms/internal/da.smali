.class public final Lcom/google/android/gms/internal/da;
.super Lcom/google/android/gms/internal/cy;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/cw;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/cy;-><init>(Lcom/google/android/gms/internal/cw;)V

    return-void
.end method


# virtual methods
.method public onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "requestedOrientation"    # I
    .param p3, "customViewCallback"    # Landroid/webkit/WebChromeClient$CustomViewCallback;

    .prologue
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/da;->a(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V

    return-void
.end method
