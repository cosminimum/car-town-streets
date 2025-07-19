.class Lcom/miniclip/newsfeed/NewsfeedScreen$1;
.super Ljava/lang/Object;
.source "NewsfeedScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/newsfeed/NewsfeedScreen;->displayInSeconds(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/newsfeed/NewsfeedScreen;


# direct methods
.method constructor <init>(Lcom/miniclip/newsfeed/NewsfeedScreen;)V
    .locals 0

    .prologue
    .line 98
    iput-object p1, p0, Lcom/miniclip/newsfeed/NewsfeedScreen$1;->this$0:Lcom/miniclip/newsfeed/NewsfeedScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 99
    const-string v0, "NewsfeedScreen"

    const-string v1, "displayInSeconds"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->layout:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/miniclip/newsfeed/NewsfeedDialog;

    iget-object v2, p0, Lcom/miniclip/newsfeed/NewsfeedScreen$1;->this$0:Lcom/miniclip/newsfeed/NewsfeedScreen;

    iget-object v2, v2, Lcom/miniclip/newsfeed/NewsfeedScreen;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/miniclip/newsfeed/NewsfeedScreen$1;->this$0:Lcom/miniclip/newsfeed/NewsfeedScreen;

    iget-object v3, v3, Lcom/miniclip/newsfeed/NewsfeedScreen;->mNewsfeed:Lcom/miniclip/newsfeed/Newsfeed;

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lcom/miniclip/newsfeed/NewsfeedDialog;-><init>(Landroid/content/Context;Lcom/miniclip/newsfeed/Newsfeed;Z)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 103
    return-void
.end method
