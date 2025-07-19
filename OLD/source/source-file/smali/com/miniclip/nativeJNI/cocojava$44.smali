.class Lcom/miniclip/nativeJNI/cocojava$44;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->restoreOriginalAspectRatio()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/cocojava;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/cocojava;)V
    .locals 0

    .prologue
    .line 2971
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$44;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 2974
    const-string v0, "INFO"

    const-string v1, "RES FIX width:%d height:%d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    sget v3, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2976
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-static {v4, v4, v0, v1}, Landroid/opengl/GLES10;->glViewport(IIII)V

    .line 2977
    sput-boolean v5, Lcom/miniclip/nativeJNI/cocojava;->mADS_BLOCKED_NOW:Z

    .line 2980
    sget v0, Lcom/miniclip/nativeJNI/cocojava;->mWidth:I

    sget v1, Lcom/miniclip/nativeJNI/cocojava;->mHeight:I

    invoke-static {v0, v1}, Lcom/miniclip/nativeJNI/CocoJNI;->MdisplayInfo(II)V

    .line 2981
    invoke-static {}, Lcom/miniclip/nativeJNI/CocoJNI;->MnotifyAspectRatioChange()V

    .line 2982
    return-void
.end method
