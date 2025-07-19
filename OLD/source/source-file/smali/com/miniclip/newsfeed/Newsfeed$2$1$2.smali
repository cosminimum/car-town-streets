.class Lcom/miniclip/newsfeed/Newsfeed$2$1$2;
.super Ljava/lang/Object;
.source "Newsfeed.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/newsfeed/Newsfeed$2$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/miniclip/newsfeed/Newsfeed$2$1;


# direct methods
.method constructor <init>(Lcom/miniclip/newsfeed/Newsfeed$2$1;)V
    .locals 0

    .prologue
    .line 152
    iput-object p1, p0, Lcom/miniclip/newsfeed/Newsfeed$2$1$2;->this$2:Lcom/miniclip/newsfeed/Newsfeed$2$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 155
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/miniclip/nativeJNI/CocoJNI;->NFcallAvailabilityChanged(I)V

    .line 156
    return-void
.end method
