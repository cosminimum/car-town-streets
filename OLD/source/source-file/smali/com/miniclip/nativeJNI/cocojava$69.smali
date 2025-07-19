.class final Lcom/miniclip/nativeJNI/cocojava$69;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->sendEmail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$dest:Ljava/lang/String;

.field final synthetic val$subj:Ljava/lang/String;

.field final synthetic val$txt:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 4159
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocojava$69;->val$dest:Ljava/lang/String;

    iput-object p2, p0, Lcom/miniclip/nativeJNI/cocojava$69;->val$subj:Ljava/lang/String;

    iput-object p3, p0, Lcom/miniclip/nativeJNI/cocojava$69;->val$txt:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 4161
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4162
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 4164
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$69;->val$dest:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 4165
    const-string v1, "android.intent.extra.EMAIL"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miniclip/nativeJNI/cocojava$69;->val$dest:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 4167
    :cond_0
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$69;->val$subj:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 4168
    const-string v1, "android.intent.extra.SUBJECT"

    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocojava$69;->val$subj:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 4170
    :cond_1
    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocojava$69;->val$txt:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 4171
    const-string v1, "android.intent.extra.TEXT"

    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocojava$69;->val$txt:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 4173
    :cond_2
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mContext:Landroid/content/Context;

    const-string v2, "Send email..."

    invoke-static {v0, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 4175
    return-void
.end method
