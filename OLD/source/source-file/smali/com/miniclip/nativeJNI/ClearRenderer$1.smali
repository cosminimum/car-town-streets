.class Lcom/miniclip/nativeJNI/ClearRenderer$1;
.super Ljava/lang/Object;
.source "ClearRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/ClearRenderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/ClearRenderer;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/ClearRenderer;)V
    .locals 0

    .prologue
    .line 157
    iput-object p1, p0, Lcom/miniclip/nativeJNI/ClearRenderer$1;->this$0:Lcom/miniclip/nativeJNI/ClearRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 160
    const-string v0, "default2"

    invoke-static {v0}, Lcom/miniclip/nativeJNI/cocojava;->displayIntro(Ljava/lang/String;)V

    .line 161
    return-void
.end method
