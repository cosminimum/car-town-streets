.class Lcom/miniclip/NTP/NtpHandler$1;
.super Ljava/lang/Thread;
.source "NtpHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/NTP/NtpHandler;->getOffsetFromServerAsync(Ljava/lang/String;Lcom/miniclip/NTP/NtpHandler$NtpResponce;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/NTP/NtpHandler;

.field final synthetic val$onComplete:Lcom/miniclip/NTP/NtpHandler$NtpResponce;

.field final synthetic val$serverName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miniclip/NTP/NtpHandler;Ljava/lang/String;Lcom/miniclip/NTP/NtpHandler$NtpResponce;)V
    .locals 0

    .prologue
    .line 86
    iput-object p1, p0, Lcom/miniclip/NTP/NtpHandler$1;->this$0:Lcom/miniclip/NTP/NtpHandler;

    iput-object p2, p0, Lcom/miniclip/NTP/NtpHandler$1;->val$serverName:Ljava/lang/String;

    iput-object p3, p0, Lcom/miniclip/NTP/NtpHandler$1;->val$onComplete:Lcom/miniclip/NTP/NtpHandler$NtpResponce;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 90
    :try_start_0
    iget-object v3, p0, Lcom/miniclip/NTP/NtpHandler$1;->this$0:Lcom/miniclip/NTP/NtpHandler;

    iget-object v4, p0, Lcom/miniclip/NTP/NtpHandler$1;->val$serverName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/miniclip/NTP/NtpHandler;->getOffsetFromServer(Ljava/lang/String;)D

    move-result-wide v1

    .line 91
    .local v1, "time":D
    iget-object v3, p0, Lcom/miniclip/NTP/NtpHandler$1;->val$onComplete:Lcom/miniclip/NTP/NtpHandler$NtpResponce;

    invoke-interface {v3, v1, v2}, Lcom/miniclip/NTP/NtpHandler$NtpResponce;->success(D)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .end local v1    # "time":D
    :goto_0
    return-void

    .line 92
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 94
    iget-object v3, p0, Lcom/miniclip/NTP/NtpHandler$1;->val$onComplete:Lcom/miniclip/NTP/NtpHandler$NtpResponce;

    invoke-interface {v3}, Lcom/miniclip/NTP/NtpHandler$NtpResponce;->failure()V

    goto :goto_0
.end method
