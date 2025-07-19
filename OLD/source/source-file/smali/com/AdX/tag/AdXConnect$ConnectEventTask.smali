.class Lcom/AdX/tag/AdXConnect$ConnectEventTask;
.super Landroid/os/AsyncTask;
.source "AdXConnect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/AdX/tag/AdXConnect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectEventTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/AdX/tag/AdXConnect;


# direct methods
.method private constructor <init>(Lcom/AdX/tag/AdXConnect;)V
    .locals 0

    .prologue
    .line 570
    iput-object p1, p0, Lcom/AdX/tag/AdXConnect$ConnectEventTask;->this$0:Lcom/AdX/tag/AdXConnect;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/AdX/tag/AdXConnect;Lcom/AdX/tag/AdXConnect$ConnectEventTask;)V
    .locals 0

    .prologue
    .line 570
    invoke-direct {p0, p1}, Lcom/AdX/tag/AdXConnect$ConnectEventTask;-><init>(Lcom/AdX/tag/AdXConnect;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 5
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 575
    const/4 v2, 0x0

    .line 577
    .local v2, "returnValue":Z
    iget-object v3, p0, Lcom/AdX/tag/AdXConnect$ConnectEventTask;->this$0:Lcom/AdX/tag/AdXConnect;

    invoke-static {v3}, Lcom/AdX/tag/AdXConnect;->access$0(Lcom/AdX/tag/AdXConnect;)Ljava/lang/String;

    move-result-object v0

    .line 580
    .local v0, "connectURLParams":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "http://ad-x.co.uk/API/androidevent.php?oursecret="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/AdX/tag/AdXConnect$ConnectEventTask;->this$0:Lcom/AdX/tag/AdXConnect;

    invoke-static {v4}, Lcom/AdX/tag/AdXConnect;->access$3(Lcom/AdX/tag/AdXConnect;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/AdX/tag/AdXURLConnection;->connectToURL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 583
    .local v1, "result":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 584
    iget-object v3, p0, Lcom/AdX/tag/AdXConnect$ConnectEventTask;->this$0:Lcom/AdX/tag/AdXConnect;

    invoke-static {v3, v1}, Lcom/AdX/tag/AdXConnect;->access$2(Lcom/AdX/tag/AdXConnect;Ljava/lang/String;)Z

    move-result v2

    .line 586
    :cond_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    return-object v3
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/AdX/tag/AdXConnect$ConnectEventTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
