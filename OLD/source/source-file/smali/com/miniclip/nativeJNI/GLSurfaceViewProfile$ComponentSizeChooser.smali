.class Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;
.super Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$BaseConfigChooser;
.source "GLSurfaceViewProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ComponentSizeChooser"
.end annotation


# instance fields
.field protected mAlphaSize:I

.field protected mBlueSize:I

.field protected mDepthSize:I

.field protected mGreenSize:I

.field protected mRedSize:I

.field protected mStencilSize:I

.field private mValue:[I

.field final synthetic this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;


# direct methods
.method public constructor <init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;IIIIII)V
    .locals 4
    .param p2, "redSize"    # I
    .param p3, "greenSize"    # I
    .param p4, "blueSize"    # I
    .param p5, "alphaSize"    # I
    .param p6, "depthSize"    # I
    .param p7, "stencilSize"    # I

    .prologue
    const/4 v3, 0x1

    .line 835
    iput-object p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    .line 836
    const/16 v0, 0xd

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x3024

    aput v2, v0, v1

    aput p2, v0, v3

    const/4 v1, 0x2

    const/16 v2, 0x3023

    aput v2, v0, v1

    const/4 v1, 0x3

    aput p3, v0, v1

    const/4 v1, 0x4

    const/16 v2, 0x3022

    aput v2, v0, v1

    const/4 v1, 0x5

    aput p4, v0, v1

    const/4 v1, 0x6

    const/16 v2, 0x3021

    aput v2, v0, v1

    const/4 v1, 0x7

    aput p5, v0, v1

    const/16 v1, 0x8

    const/16 v2, 0x3025

    aput v2, v0, v1

    const/16 v1, 0x9

    aput p6, v0, v1

    const/16 v1, 0xa

    const/16 v2, 0x3026

    aput v2, v0, v1

    const/16 v1, 0xb

    aput p7, v0, v1

    const/16 v1, 0xc

    const/16 v2, 0x3038

    aput v2, v0, v1

    invoke-direct {p0, p1, v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$BaseConfigChooser;-><init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;[I)V

    .line 844
    new-array v0, v3, [I

    iput-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mValue:[I

    .line 845
    iput p2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mRedSize:I

    .line 846
    iput p3, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mGreenSize:I

    .line 847
    iput p4, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mBlueSize:I

    .line 848
    iput p5, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mAlphaSize:I

    .line 849
    iput p6, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mDepthSize:I

    .line 850
    iput p7, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mStencilSize:I

    .line 851
    return-void
.end method

.method private findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 2
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p2, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p3, "config"    # Ljavax/microedition/khronos/egl/EGLConfig;
    .param p4, "attribute"    # I
    .param p5, "defaultValue"    # I

    .prologue
    .line 882
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mValue:[I

    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 883
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mValue:[I

    const/4 v1, 0x0

    aget p5, v0, v1

    .line 885
    .end local p5    # "defaultValue":I
    :cond_0
    return p5
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 15
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p2, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p3, "configs"    # [Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    .line 856
    move-object/from16 v7, p3

    .local v7, "arr$":[Ljavax/microedition/khronos/egl/EGLConfig;
    array-length v12, v7

    .local v12, "len$":I
    const/4 v11, 0x0

    .local v11, "i$":I
    :goto_0
    if-ge v11, v12, :cond_1

    aget-object v3, v7, v11

    .line 857
    .local v3, "config":Ljavax/microedition/khronos/egl/EGLConfig;
    const/16 v4, 0x3025

    const/4 v5, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v9

    .line 859
    .local v9, "d":I
    const/16 v4, 0x3026

    const/4 v5, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v14

    .line 861
    .local v14, "s":I
    iget v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mDepthSize:I

    if-lt v9, v0, :cond_0

    iget v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mStencilSize:I

    if-lt v14, v0, :cond_0

    .line 862
    const/16 v4, 0x3024

    const/4 v5, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v13

    .line 864
    .local v13, "r":I
    const/16 v4, 0x3023

    const/4 v5, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v10

    .line 866
    .local v10, "g":I
    const/16 v4, 0x3022

    const/4 v5, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v8

    .line 868
    .local v8, "b":I
    const/16 v4, 0x3021

    const/4 v5, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v6

    .line 870
    .local v6, "a":I
    iget v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mRedSize:I

    if-ne v13, v0, :cond_0

    iget v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mGreenSize:I

    if-ne v10, v0, :cond_0

    iget v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mBlueSize:I

    if-ne v8, v0, :cond_0

    iget v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$ComponentSizeChooser;->mAlphaSize:I

    if-ne v6, v0, :cond_0

    .line 876
    .end local v3    # "config":Ljavax/microedition/khronos/egl/EGLConfig;
    .end local v6    # "a":I
    .end local v8    # "b":I
    .end local v9    # "d":I
    .end local v10    # "g":I
    .end local v13    # "r":I
    .end local v14    # "s":I
    :goto_1
    return-object v3

    .line 856
    .restart local v3    # "config":Ljavax/microedition/khronos/egl/EGLConfig;
    .restart local v9    # "d":I
    .restart local v14    # "s":I
    :cond_0
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 876
    .end local v3    # "config":Ljavax/microedition/khronos/egl/EGLConfig;
    .end local v9    # "d":I
    .end local v14    # "s":I
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method
