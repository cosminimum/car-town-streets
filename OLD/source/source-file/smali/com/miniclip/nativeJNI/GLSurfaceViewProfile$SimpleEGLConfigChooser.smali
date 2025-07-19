.class Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$SimpleEGLConfigChooser;
.super Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;
.source "GLSurfaceViewProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SimpleEGLConfigChooser"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;


# direct methods
.method public constructor <init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;Z)V
    .locals 8
    .param p2, "withDepthBuffer"    # Z

    .prologue
    const/4 v2, 0x5

    const/4 v5, 0x0

    .line 904
    iput-object p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$SimpleEGLConfigChooser;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    .line 905
    const/4 v3, 0x6

    if-eqz p2, :cond_0

    const/16 v6, 0x10

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move v4, v2

    move v7, v5

    invoke-direct/range {v0 .. v7}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;-><init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;IIIIII)V

    .line 906
    return-void

    :cond_0
    move v6, v5

    .line 905
    goto :goto_0
.end method
