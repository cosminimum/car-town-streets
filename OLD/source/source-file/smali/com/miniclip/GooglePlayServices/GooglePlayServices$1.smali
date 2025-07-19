.class Lcom/miniclip/GooglePlayServices/GooglePlayServices$1;
.super Ljava/lang/Thread;
.source "GooglePlayServices.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/GooglePlayServices/GooglePlayServices;->onConnected(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/GooglePlayServices/GooglePlayServices;


# direct methods
.method constructor <init>(Lcom/miniclip/GooglePlayServices/GooglePlayServices;)V
    .locals 0

    .prologue
    .line 373
    iput-object p1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$1;->this$0:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 377
    :try_start_0
    invoke-static {}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->access$100()Landroid/app/Activity;

    move-result-object v1

    sget-object v2, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v2}, Lcom/google/android/gms/plus/PlusClient;->getAccountName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "oauth2:https://www.googleapis.com/auth/plus.login profile https://www.googleapis.com/auth/userinfo.email"

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/auth/GoogleAuthUtil;->getToken(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->access$002(Ljava/lang/String;)Ljava/lang/String;

    .line 380
    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$1;->this$0:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Connected with token: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->access$000()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 382
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v2, Lcom/miniclip/GooglePlayServices/GooglePlayServices$1$1;

    invoke-direct {v2, p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$1$1;-><init>(Lcom/miniclip/GooglePlayServices/GooglePlayServices$1;)V

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Lcom/google/android/gms/auth/UserRecoverableAuthException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/android/gms/auth/GoogleAuthException; {:try_start_0 .. :try_end_0} :catch_2

    .line 400
    :goto_0
    return-void

    .line 389
    :catch_0
    move-exception v0

    .line 390
    .local v0, "e":Lcom/google/android/gms/auth/UserRecoverableAuthException;
    invoke-static {}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->access$100()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/android/gms/auth/UserRecoverableAuthException;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const/16 v3, 0x2328

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 394
    invoke-virtual {v0}, Lcom/google/android/gms/auth/UserRecoverableAuthException;->printStackTrace()V

    goto :goto_0

    .line 395
    .end local v0    # "e":Lcom/google/android/gms/auth/UserRecoverableAuthException;
    :catch_1
    move-exception v0

    .line 396
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 397
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 398
    .local v0, "e":Lcom/google/android/gms/auth/GoogleAuthException;
    invoke-virtual {v0}, Lcom/google/android/gms/auth/GoogleAuthException;->printStackTrace()V

    goto :goto_0
.end method
