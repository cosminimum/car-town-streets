.class Lcom/apsalar/sdk/EndSessionTask;
.super Landroid/os/AsyncTask;
.source "Apsalar.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/apsalar/sdk/ApsalarEvent;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field status:Ljava/lang/Integer;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 764
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 765
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/apsalar/sdk/EndSessionTask;->status:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/apsalar/sdk/ApsalarEvent;)Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 768
    const/4 v0, 0x0

    aget-object v0, p1, v0

    .line 769
    invoke-virtual {v0}, Lcom/apsalar/sdk/ApsalarEvent;->REST()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/apsalar/sdk/EndSessionTask;->status:Ljava/lang/Integer;

    .line 773
    iget-object v0, p0, Lcom/apsalar/sdk/EndSessionTask;->status:Ljava/lang/Integer;

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 764
    check-cast p1, [Lcom/apsalar/sdk/ApsalarEvent;

    invoke-virtual {p0, p1}, Lcom/apsalar/sdk/EndSessionTask;->doInBackground([Lcom/apsalar/sdk/ApsalarEvent;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExcute(Ljava/lang/Integer;)V
    .locals 0

    .prologue
    .line 780
    return-void
.end method
