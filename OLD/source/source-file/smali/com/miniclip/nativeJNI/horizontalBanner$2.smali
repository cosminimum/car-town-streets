.class Lcom/miniclip/nativeJNI/horizontalBanner$2;
.super Ljava/lang/Object;
.source "horizontalBanner.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/horizontalBanner;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/horizontalBanner;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/horizontalBanner;)V
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/miniclip/nativeJNI/horizontalBanner$2;->this$0:Lcom/miniclip/nativeJNI/horizontalBanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 61
    const-string v0, "http://bit.ly/wm0xXE"

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->openLink(Ljava/lang/String;)V

    .line 65
    return-void
.end method
