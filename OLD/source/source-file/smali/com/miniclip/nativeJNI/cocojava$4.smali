.class Lcom/miniclip/nativeJNI/cocojava$4;
.super Landroid/os/Handler;
.source "cocojava.java"


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
    .line 1003
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$4;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 1005
    const/4 v0, 0x0

    .line 1007
    .local v0, "dm":Lcom/miniclip/nativeJNI/DialogMessage;
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 1031
    :goto_0
    return-void

    .line 1009
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .end local v0    # "dm":Lcom/miniclip/nativeJNI/DialogMessage;
    check-cast v0, Lcom/miniclip/nativeJNI/DialogMessage;

    .line 1010
    .restart local v0    # "dm":Lcom/miniclip/nativeJNI/DialogMessage;
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$4;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    iget v2, v0, Lcom/miniclip/nativeJNI/DialogMessage;->msgId:I

    iget-object v3, v0, Lcom/miniclip/nativeJNI/DialogMessage;->title:Ljava/lang/String;

    iget-object v4, v0, Lcom/miniclip/nativeJNI/DialogMessage;->message:Ljava/lang/String;

    iget-object v5, v0, Lcom/miniclip/nativeJNI/DialogMessage;->buttonTitles:[Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/miniclip/nativeJNI/cocojava;->showDialog(ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .line 1014
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .end local v0    # "dm":Lcom/miniclip/nativeJNI/DialogMessage;
    check-cast v0, Lcom/miniclip/nativeJNI/DialogMessage;

    .line 1015
    .restart local v0    # "dm":Lcom/miniclip/nativeJNI/DialogMessage;
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$4;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    iget v2, v0, Lcom/miniclip/nativeJNI/DialogMessage;->msgId:I

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/cocojava;->hideDialog(I)V

    goto :goto_0

    .line 1019
    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .end local v0    # "dm":Lcom/miniclip/nativeJNI/DialogMessage;
    check-cast v0, Lcom/miniclip/nativeJNI/DialogMessage;

    .line 1020
    .restart local v0    # "dm":Lcom/miniclip/nativeJNI/DialogMessage;
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$4;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    iget v2, v0, Lcom/miniclip/nativeJNI/DialogMessage;->msgId:I

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/cocojava;->closeDialog(I)V

    goto :goto_0

    .line 1024
    :pswitch_3
    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocojava$4;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/miniclip/nativeJNI/cocojava;->access$100(Lcom/miniclip/nativeJNI/cocojava;Ljava/lang/String;)V

    goto :goto_0

    .line 1028
    :pswitch_4
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$4;->this$0:Lcom/miniclip/nativeJNI/cocojava;

    invoke-virtual {v1}, Lcom/miniclip/nativeJNI/cocojava;->finish()V

    goto :goto_0

    .line 1007
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
