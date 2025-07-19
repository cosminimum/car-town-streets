.class Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;
.super Ljava/lang/Object;
.source "UserAuth.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/UserAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EnsureUserAuthCallable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Lcom/getjar/sdk/User;",
        ">;"
    }
.end annotation


# instance fields
.field private theTitle:Ljava/lang/String;

.field final synthetic this$0:Lcom/getjar/sdk/UserAuth;

.field private userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/UserAuth;Ljava/lang/String;)V
    .locals 2
    .param p2, "theTitle"    # Ljava/lang/String;

    .prologue
    .line 115
    iput-object p1, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->this$0:Lcom/getjar/sdk/UserAuth;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;

    .line 116
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "theTitle cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 117
    :cond_0
    iput-object p2, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->theTitle:Ljava/lang/String;

    .line 118
    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/UserAuth;Ljava/lang/String;Lcom/getjar/sdk/listener/EnsureUserAuthListener;)V
    .locals 2
    .param p2, "theTitle"    # Ljava/lang/String;
    .param p3, "userAuthListener"    # Lcom/getjar/sdk/listener/EnsureUserAuthListener;

    .prologue
    .line 109
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;-><init>(Lcom/getjar/sdk/UserAuth;Ljava/lang/String;)V

    .line 110
    if-nez p3, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "userAuthListener cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_0
    iput-object p3, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;

    .line 113
    return-void
.end method


# virtual methods
.method public call()Lcom/getjar/sdk/User;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 122
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UserAuth: EnsureUserAuthCallable: call() START"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 128
    const/4 v1, 0x0

    .line 132
    .local v1, "user":Lcom/getjar/sdk/User;
    :try_start_0
    iget-object v3, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->this$0:Lcom/getjar/sdk/UserAuth;

    invoke-static {v3}, Lcom/getjar/sdk/UserAuth;->access$000(Lcom/getjar/sdk/UserAuth;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 133
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UserAuth: EnsureUserAuthCallable: waitOnAuthWithUI() start"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 134
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    iget-object v4, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->theTitle:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuthWithUI(Ljava/lang/String;)V

    .line 135
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UserAuth: EnsureUserAuthCallable: waitOnAuthWithUI() finished"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 138
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UserAuth: EnsureUserAuthCallable: Creating User instance"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 139
    new-instance v2, Lcom/getjar/sdk/User;

    invoke-direct {v2}, Lcom/getjar/sdk/User;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    .end local v1    # "user":Lcom/getjar/sdk/User;
    .local v2, "user":Lcom/getjar/sdk/User;
    :try_start_1
    iget-object v3, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;

    invoke-interface {v3, v2}, Lcom/getjar/sdk/listener/EnsureUserAuthListener;->userAuthCompleted(Lcom/getjar/sdk/User;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 155
    :cond_0
    :goto_0
    if-nez v2, :cond_1

    .line 156
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning null]"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    move-object v1, v2

    .line 168
    .end local v2    # "user":Lcom/getjar/sdk/User;
    .restart local v1    # "user":Lcom/getjar/sdk/User;
    :goto_1
    return-object v1

    .line 150
    .end local v1    # "user":Lcom/getjar/sdk/User;
    .restart local v2    # "user":Lcom/getjar/sdk/User;
    :catch_0
    move-exception v0

    .line 151
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UserAuth: EnsureUserAuthCallable: callback failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 161
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning user instance]"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    move-object v1, v2

    .line 166
    .end local v2    # "user":Lcom/getjar/sdk/User;
    .restart local v1    # "user":Lcom/getjar/sdk/User;
    goto :goto_1

    .line 141
    :catch_1
    move-exception v0

    .line 144
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UserAuth: EnsureUserAuthCallable: failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 149
    :try_start_3
    iget-object v3, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;

    invoke-interface {v3, v1}, Lcom/getjar/sdk/listener/EnsureUserAuthListener;->userAuthCompleted(Lcom/getjar/sdk/User;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 155
    :cond_2
    :goto_2
    if-nez v1, :cond_3

    .line 156
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning null]"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_1

    .line 150
    :catch_2
    move-exception v0

    .line 151
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UserAuth: EnsureUserAuthCallable: callback failed"

    invoke-static {v3, v4, v5, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 161
    :cond_3
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning user instance]"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_1

    .line 148
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    .line 149
    :try_start_4
    iget-object v4, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;

    invoke-interface {v4, v1}, Lcom/getjar/sdk/listener/EnsureUserAuthListener;->userAuthCompleted(Lcom/getjar/sdk/User;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 155
    :cond_4
    :goto_3
    if-nez v1, :cond_5

    .line 156
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning null]"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 161
    :goto_4
    throw v3

    .line 150
    :catch_3
    move-exception v0

    .line 151
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "UserAuth: EnsureUserAuthCallable: callback failed"

    invoke-static {v4, v5, v6, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 161
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_5
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "UserAuth: EnsureUserAuthCallable: call() FINISHED [returning user instance]"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_4
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 104
    invoke-virtual {p0}, Lcom/getjar/sdk/UserAuth$EnsureUserAuthCallable;->call()Lcom/getjar/sdk/User;

    move-result-object v0

    return-object v0
.end method
