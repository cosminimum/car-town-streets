.class Lcom/miniclip/nativeJNI/cocojava$100$1;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava$100;->onDismiss(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/nativeJNI/cocojava$100;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava$100;)V
    .locals 0

    .prologue
    .line 4791
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$100$1;->this$1:Lcom/miniclip/nativeJNI/cocojava$100;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 4794
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->MdatePickerClosed()V

    .line 4795
    return-void
.end method
