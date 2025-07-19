.class Lcom/miniclip/newsfeed/Newsfeed$3;
.super Ljava/lang/Object;
.source "Newsfeed.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/newsfeed/Newsfeed;->checkServer()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/newsfeed/Newsfeed;

.field final synthetic val$messagesNumF:I

.field final synthetic val$messagesNumUnreadF:I


# direct methods
.method constructor <init>(Lcom/miniclip/newsfeed/Newsfeed;II)V
    .locals 0

    .prologue
    .line 345
    iput-object p1, p0, Lcom/miniclip/newsfeed/Newsfeed$3;->this$0:Lcom/miniclip/newsfeed/Newsfeed;

    iput p2, p0, Lcom/miniclip/newsfeed/Newsfeed$3;->val$messagesNumUnreadF:I

    iput p3, p0, Lcom/miniclip/newsfeed/Newsfeed$3;->val$messagesNumF:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 348
    iget v0, p0, Lcom/miniclip/newsfeed/Newsfeed$3;->val$messagesNumUnreadF:I

    invoke-static {v0}, Lcom/miniclip/nativeJNI/CocoJNI;->NFcallNrOfUnreadMessagesChanged(I)V

    .line 349
    iget v0, p0, Lcom/miniclip/newsfeed/Newsfeed$3;->val$messagesNumF:I

    invoke-static {v0}, Lcom/miniclip/nativeJNI/CocoJNI;->NFcallNrOfMessagesChanged(I)V

    .line 350
    return-void
.end method
