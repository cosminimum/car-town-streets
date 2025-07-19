.class Lcom/miniclip/newsfeed/NewsfeedDialog$1;
.super Ljava/lang/Object;
.source "NewsfeedDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/newsfeed/NewsfeedDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/newsfeed/NewsfeedDialog;


# direct methods
.method constructor <init>(Lcom/miniclip/newsfeed/NewsfeedDialog;)V
    .locals 0

    .prologue
    .line 243
    iput-object p1, p0, Lcom/miniclip/newsfeed/NewsfeedDialog$1;->this$0:Lcom/miniclip/newsfeed/NewsfeedDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/16 v1, 0xff

    .line 245
    iget-object v0, p0, Lcom/miniclip/newsfeed/NewsfeedDialog$1;->this$0:Lcom/miniclip/newsfeed/NewsfeedDialog;

    invoke-static {v0}, Lcom/miniclip/newsfeed/NewsfeedDialog;->access$000(Lcom/miniclip/newsfeed/NewsfeedDialog;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 246
    iget-object v0, p0, Lcom/miniclip/newsfeed/NewsfeedDialog$1;->this$0:Lcom/miniclip/newsfeed/NewsfeedDialog;

    invoke-static {v0}, Lcom/miniclip/newsfeed/NewsfeedDialog;->access$100(Lcom/miniclip/newsfeed/NewsfeedDialog;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 247
    return-void
.end method
