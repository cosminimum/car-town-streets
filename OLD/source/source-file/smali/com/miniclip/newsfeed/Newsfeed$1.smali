.class Lcom/miniclip/newsfeed/Newsfeed$1;
.super Ljava/lang/Object;
.source "Newsfeed.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/newsfeed/Newsfeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/newsfeed/Newsfeed;


# direct methods
.method constructor <init>(Lcom/miniclip/newsfeed/Newsfeed;)V
    .locals 0

    .prologue
    .line 56
    iput-object p1, p0, Lcom/miniclip/newsfeed/Newsfeed$1;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 57
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/newsfeed/Newsfeed$1$1;

    invoke-direct {v1, p0}, Lcom/miniclip/newsfeed/Newsfeed$1$1;-><init>(Lcom/miniclip/newsfeed/Newsfeed$1;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 70
    return-void
.end method
