.class Lcom/miniclip/nativeJNI/rotatedBannerImg$2;
.super Ljava/lang/Object;
.source "rotatedBannerImg.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/rotatedBannerImg;-><init>(Landroid/content/Context;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/rotatedBannerImg;)V
    .locals 0

    .prologue
    .line 84
    iput-object p1, p0, Lcom/miniclip/nativeJNI/rotatedBannerImg$2;->this$0:Lcom/miniclip/nativeJNI/rotatedBannerImg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 88
    const-string v0, "http://bit.ly/wm0xXE"

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->openLink(Ljava/lang/String;)V

    .line 92
    return-void
.end method
