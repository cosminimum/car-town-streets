.class public Lcom/chartboost/sdk/impl/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/chartboost/sdk/impl/a$a;,
        Lcom/chartboost/sdk/impl/a$b;,
        Lcom/chartboost/sdk/impl/a$c;
    }
.end annotation


# instance fields
.field public a:Lorg/json/JSONObject;

.field public b:Ljava/util/Date;

.field public c:Lcom/chartboost/sdk/impl/a$b;

.field public d:Lcom/chartboost/sdk/impl/a$c;

.field public e:Ljava/lang/String;

.field public f:Lcom/chartboost/sdk/b;

.field public g:Lcom/chartboost/sdk/impl/a$a;

.field public h:Lcom/chartboost/sdk/impl/s;

.field public i:Z

.field public j:Z

.field public k:Z


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;Lcom/chartboost/sdk/impl/a$c;Lcom/chartboost/sdk/impl/a$a;Lcom/chartboost/sdk/impl/a$b;Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    if-nez p1, :cond_0

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 78
    :cond_0
    iput-object p4, p0, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    .line 79
    iput-object p5, p0, Lcom/chartboost/sdk/impl/a;->e:Ljava/lang/String;

    .line 80
    iput-object p1, p0, Lcom/chartboost/sdk/impl/a;->a:Lorg/json/JSONObject;

    .line 81
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/a;->b:Ljava/util/Date;

    .line 82
    iput-object p3, p0, Lcom/chartboost/sdk/impl/a;->g:Lcom/chartboost/sdk/impl/a$a;

    .line 83
    iput-object p2, p0, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    .line 84
    iput-boolean v1, p0, Lcom/chartboost/sdk/impl/a;->i:Z

    .line 85
    iput-boolean v1, p0, Lcom/chartboost/sdk/impl/a;->j:Z

    .line 86
    iput-boolean v1, p0, Lcom/chartboost/sdk/impl/a;->k:Z

    .line 87
    const-string v0, "type"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "native"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 89
    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v2, Lcom/chartboost/sdk/impl/a$c;->b:Lcom/chartboost/sdk/impl/a$c;

    if-ne v1, v2, :cond_1

    .line 90
    new-instance v0, Lcom/chartboost/sdk/impl/b;

    invoke-direct {v0, p0}, Lcom/chartboost/sdk/impl/b;-><init>(Lcom/chartboost/sdk/impl/a;)V

    .line 91
    iput-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    .line 105
    :goto_0
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    new-instance v1, Lcom/chartboost/sdk/impl/a$1;

    invoke-direct {v1, p0, p0}, Lcom/chartboost/sdk/impl/a$1;-><init>(Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/a;)V

    iput-object v1, v0, Lcom/chartboost/sdk/b;->c:Lcom/chartboost/sdk/b$a;

    .line 112
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    new-instance v1, Lcom/chartboost/sdk/impl/a$2;

    invoke-direct {v1, p0, p0}, Lcom/chartboost/sdk/impl/a$2;-><init>(Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/a;)V

    iput-object v1, v0, Lcom/chartboost/sdk/b;->a:Lcom/chartboost/sdk/b$a;

    .line 119
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    new-instance v1, Lcom/chartboost/sdk/impl/a$3;

    invoke-direct {v1, p0, p0}, Lcom/chartboost/sdk/impl/a$3;-><init>(Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/a;)V

    iput-object v1, v0, Lcom/chartboost/sdk/b;->b:Lcom/chartboost/sdk/b$c;

    .line 139
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    new-instance v1, Lcom/chartboost/sdk/impl/a$4;

    invoke-direct {v1, p0, p0}, Lcom/chartboost/sdk/impl/a$4;-><init>(Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/a;)V

    iput-object v1, v0, Lcom/chartboost/sdk/b;->d:Lcom/chartboost/sdk/b$a;

    .line 147
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v0, p1}, Lcom/chartboost/sdk/b;->a(Lorg/json/JSONObject;)V

    .line 148
    return-void

    .line 93
    :cond_1
    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v1, Lcom/chartboost/sdk/impl/a$c;->c:Lcom/chartboost/sdk/impl/a$c;

    if-ne v0, v1, :cond_2

    .line 94
    new-instance v0, Lcom/chartboost/sdk/impl/h;

    invoke-direct {v0, p0}, Lcom/chartboost/sdk/impl/h;-><init>(Lcom/chartboost/sdk/impl/a;)V

    .line 95
    iput-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    goto :goto_0

    .line 99
    :cond_2
    new-instance v0, Lcom/chartboost/sdk/impl/v;

    invoke-direct {v0, p0}, Lcom/chartboost/sdk/impl/v;-><init>(Lcom/chartboost/sdk/impl/a;)V

    .line 100
    iput-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    goto :goto_0
.end method


# virtual methods
.method public a()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 154
    iput-boolean v0, p0, Lcom/chartboost/sdk/impl/a;->i:Z

    .line 155
    iput-boolean v0, p0, Lcom/chartboost/sdk/impl/a;->j:Z

    .line 156
    iput-boolean v0, p0, Lcom/chartboost/sdk/impl/a;->k:Z

    .line 157
    iget-object v2, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v2}, Lcom/chartboost/sdk/b;->a()Z

    .line 158
    iget-object v2, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v2}, Lcom/chartboost/sdk/b;->d()Lcom/chartboost/sdk/b$b;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 165
    :goto_0
    return v0

    .line 162
    :cond_0
    iput-boolean v1, p0, Lcom/chartboost/sdk/impl/a;->i:Z

    .line 163
    iput-boolean v1, p0, Lcom/chartboost/sdk/impl/a;->j:Z

    .line 164
    iput-boolean v1, p0, Lcom/chartboost/sdk/impl/a;->k:Z

    move v0, v1

    .line 165
    goto :goto_0
.end method

.method public b()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 170
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/s;->a()V

    .line 173
    :try_start_0
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v0}, Lcom/chartboost/sdk/b;->d()Lcom/chartboost/sdk/b$b;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chartboost/sdk/b$b;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v1}, Lcom/chartboost/sdk/b;->d()Lcom/chartboost/sdk/b$b;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/impl/s;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    if-eqz v0, :cond_1

    .line 180
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v0}, Lcom/chartboost/sdk/b;->c()V

    .line 181
    :cond_1
    iput-object v2, p0, Lcom/chartboost/sdk/impl/a;->a:Lorg/json/JSONObject;

    .line 182
    iput-object v2, p0, Lcom/chartboost/sdk/impl/a;->b:Ljava/util/Date;

    .line 183
    iput-object v2, p0, Lcom/chartboost/sdk/impl/a;->g:Lcom/chartboost/sdk/impl/a$a;

    .line 184
    iput-object v2, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    .line 185
    iput-object v2, p0, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    .line 186
    return-void

    .line 175
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public c()V
    .locals 2

    .prologue
    .line 189
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/s;->a()V

    .line 192
    :try_start_0
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v0}, Lcom/chartboost/sdk/b;->d()Lcom/chartboost/sdk/b$b;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chartboost/sdk/b$b;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v1}, Lcom/chartboost/sdk/b;->d()Lcom/chartboost/sdk/b$b;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/impl/s;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    if-eqz v0, :cond_1

    .line 199
    iget-object v0, p0, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v0}, Lcom/chartboost/sdk/b;->e()V

    .line 200
    :cond_1
    return-void

    .line 194
    :catch_0
    move-exception v0

    goto :goto_0
.end method
