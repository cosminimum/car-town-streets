.class Lcom/miniclip/nativeJNI/ClearRenderer$2;
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
    .line 177
    iput-object p1, p0, Lcom/miniclip/nativeJNI/ClearRenderer$2;->this$0:Lcom/miniclip/nativeJNI/ClearRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/miniclip/nativeJNI/ClearRenderer$2;->this$0:Lcom/miniclip/nativeJNI/ClearRenderer;

    iget-object v0, v0, Lcom/miniclip/nativeJNI/ClearRenderer;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/cocojava;->onRealResume()V

    .line 181
    return-void
.end method
