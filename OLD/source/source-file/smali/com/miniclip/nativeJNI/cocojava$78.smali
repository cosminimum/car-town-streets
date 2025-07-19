.class final Lcom/miniclip/nativeJNI/cocojava$78;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->NF_setSandBox(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$sandBoxMode:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 4338
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$78;->val$sandBoxMode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 4340
    iget v0, p0, Lcom/miniclip/nativeJNI/cocojava$78;->val$sandBoxMode:I

    if-eqz v0, :cond_0

    .line 4341
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miniclip/newsfeed/Newsfeed;->setSandBoxMode(Z)V

    .line 4344
    :goto_0
    return-void

    .line 4343
    :cond_0
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mCurrentNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miniclip/newsfeed/Newsfeed;->setSandBoxMode(Z)V

    goto :goto_0
.end method
