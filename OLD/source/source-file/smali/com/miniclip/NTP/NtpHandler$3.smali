.class Lcom/miniclip/NTP/NtpHandler$3;
.super Ljava/lang/Object;
.source "NtpHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/NTP/NtpHandler;->getOffsetFromServerListAsync(Ljava/lang/String;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/NTP/NtpHandler;

.field final synthetic val$callback:I


# direct methods
.method constructor <init>(Lcom/miniclip/NTP/NtpHandler;I)V
    .locals 0

    .prologue
    .line 128
    iput-object p1, p0, Lcom/miniclip/NTP/NtpHandler$3;->this$0:Lcom/miniclip/NTP/NtpHandler;

    iput p2, p0, Lcom/miniclip/NTP/NtpHandler$3;->val$callback:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/miniclip/NTP/NtpHandler$3;->this$0:Lcom/miniclip/NTP/NtpHandler;

    invoke-static {v0}, Lcom/miniclip/NTP/NtpHandler;->access$000(Lcom/miniclip/NTP/NtpHandler;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 133
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/NTP/NtpHandler$3$1;

    invoke-direct {v1, p0}, Lcom/miniclip/NTP/NtpHandler$3$1;-><init>(Lcom/miniclip/NTP/NtpHandler$3;)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 140
    :cond_0
    iget-object v0, p0, Lcom/miniclip/NTP/NtpHandler$3;->this$0:Lcom/miniclip/NTP/NtpHandler;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miniclip/NTP/NtpHandler;->access$002(Lcom/miniclip/NTP/NtpHandler;I)I

    .line 141
    return-void
.end method
