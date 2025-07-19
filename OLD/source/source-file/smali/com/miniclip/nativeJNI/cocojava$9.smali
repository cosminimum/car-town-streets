.class Lcom/miniclip/nativeJNI/cocojava$9;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->firstRun()V
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
    .line 1237
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$9;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1241
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    invoke-virtual {v0}, Lcom/miniclip/newsfeed/Newsfeed;->update()I

    .line 1243
    return-void
.end method
