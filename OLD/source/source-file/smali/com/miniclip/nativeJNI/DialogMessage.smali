.class Lcom/miniclip/nativeJNI/DialogMessage;
.super Ljava/lang/Object;
.source "cocojava.java"


# instance fields
.field public buttonTitles:[Ljava/lang/String;

.field public message:Ljava/lang/String;

.field public msgId:I

.field public title:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "msgId"    # I

    .prologue
    const/4 v0, 0x0

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    iput p1, p0, Lcom/miniclip/nativeJNI/DialogMessage;->msgId:I

    .line 155
    iput-object v0, p0, Lcom/miniclip/nativeJNI/DialogMessage;->message:Ljava/lang/String;

    .line 156
    iput-object v0, p0, Lcom/miniclip/nativeJNI/DialogMessage;->title:Ljava/lang/String;

    .line 157
    iput-object v0, p0, Lcom/miniclip/nativeJNI/DialogMessage;->buttonTitles:[Ljava/lang/String;

    .line 158
    return-void
.end method
