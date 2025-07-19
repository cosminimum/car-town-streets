.class public Lcom/chartboost/sdk/impl/b;
.super Lcom/chartboost/sdk/b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/chartboost/sdk/impl/b$a;
    }
.end annotation


# instance fields
.field public h:Lcom/chartboost/sdk/Libraries/a$a;

.field public i:Lcom/chartboost/sdk/Libraries/a$a;

.field public j:Lcom/chartboost/sdk/Libraries/a$a;

.field public k:Lcom/chartboost/sdk/Libraries/a$a;

.field public l:Lcom/chartboost/sdk/Libraries/a$a;


# direct methods
.method public constructor <init>(Lcom/chartboost/sdk/impl/a;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 161
    invoke-direct {p0, p1}, Lcom/chartboost/sdk/b;-><init>(Lcom/chartboost/sdk/impl/a;)V

    .line 163
    const/4 v0, 0x5

    iput v0, p0, Lcom/chartboost/sdk/impl/b;->e:I

    .line 165
    iput-object v1, p0, Lcom/chartboost/sdk/impl/b;->j:Lcom/chartboost/sdk/Libraries/a$a;

    .line 166
    iput-object v1, p0, Lcom/chartboost/sdk/impl/b;->k:Lcom/chartboost/sdk/Libraries/a$a;

    .line 167
    iput-object v1, p0, Lcom/chartboost/sdk/impl/b;->h:Lcom/chartboost/sdk/Libraries/a$a;

    .line 168
    iput-object v1, p0, Lcom/chartboost/sdk/impl/b;->i:Lcom/chartboost/sdk/Libraries/a$a;

    .line 169
    iput-object v1, p0, Lcom/chartboost/sdk/impl/b;->l:Lcom/chartboost/sdk/Libraries/a$a;

    .line 171
    return-void
.end method

.method static synthetic a(Lcom/chartboost/sdk/impl/b;)Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/chartboost/sdk/impl/b;->f:Lorg/json/JSONObject;

    return-object v0
.end method

.method static synthetic a(Lcom/chartboost/sdk/impl/b;Lcom/chartboost/sdk/Libraries/a$a;)V
    .locals 0

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/chartboost/sdk/impl/b;->a(Lcom/chartboost/sdk/Libraries/a$a;)V

    return-void
.end method


# virtual methods
.method protected a(Landroid/content/Context;)Lcom/chartboost/sdk/b$b;
    .locals 2

    .prologue
    .line 175
    new-instance v0, Lcom/chartboost/sdk/impl/b$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/chartboost/sdk/impl/b$a;-><init>(Lcom/chartboost/sdk/impl/b;Landroid/content/Context;Lcom/chartboost/sdk/impl/b$a;)V

    return-object v0
.end method

.method public a(Lorg/json/JSONObject;)V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 181
    invoke-super {p0, p1}, Lcom/chartboost/sdk/b;->a(Lorg/json/JSONObject;)V

    .line 183
    new-instance v0, Lcom/chartboost/sdk/impl/b$1;

    invoke-direct {v0, p0}, Lcom/chartboost/sdk/impl/b$1;-><init>(Lcom/chartboost/sdk/impl/b;)V

    .line 184
    new-instance v1, Lcom/chartboost/sdk/impl/b$2;

    invoke-direct {v1, p0}, Lcom/chartboost/sdk/impl/b$2;-><init>(Lcom/chartboost/sdk/impl/b;)V

    .line 185
    new-instance v2, Lcom/chartboost/sdk/impl/b$3;

    invoke-direct {v2, p0}, Lcom/chartboost/sdk/impl/b$3;-><init>(Lcom/chartboost/sdk/impl/b;)V

    .line 186
    new-instance v3, Lcom/chartboost/sdk/impl/b$4;

    invoke-direct {v3, p0}, Lcom/chartboost/sdk/impl/b$4;-><init>(Lcom/chartboost/sdk/impl/b;)V

    .line 187
    new-instance v4, Lcom/chartboost/sdk/impl/b$5;

    invoke-direct {v4, p0}, Lcom/chartboost/sdk/impl/b$5;-><init>(Lcom/chartboost/sdk/impl/b;)V

    .line 189
    const-string v5, "ad-landscape"

    invoke-virtual {p0, v5, v0, v6}, Lcom/chartboost/sdk/impl/b;->a(Ljava/lang/String;Lcom/chartboost/sdk/Libraries/e$b;Z)V

    .line 190
    const-string v0, "ad-portrait"

    invoke-virtual {p0, v0, v1, v6}, Lcom/chartboost/sdk/impl/b;->a(Ljava/lang/String;Lcom/chartboost/sdk/Libraries/e$b;Z)V

    .line 191
    const-string v0, "frame-landscape"

    invoke-virtual {p0, v0, v2}, Lcom/chartboost/sdk/impl/b;->a(Ljava/lang/String;Lcom/chartboost/sdk/Libraries/e$b;)V

    .line 192
    const-string v0, "frame-portrait"

    invoke-virtual {p0, v0, v3}, Lcom/chartboost/sdk/impl/b;->a(Ljava/lang/String;Lcom/chartboost/sdk/Libraries/e$b;)V

    .line 193
    const-string v0, "close"

    invoke-virtual {p0, v0, v4}, Lcom/chartboost/sdk/impl/b;->a(Ljava/lang/String;Lcom/chartboost/sdk/Libraries/e$b;)V

    .line 194
    return-void
.end method

.method public c()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 199
    invoke-super {p0}, Lcom/chartboost/sdk/b;->c()V

    .line 200
    iget-object v0, p0, Lcom/chartboost/sdk/impl/b;->i:Lcom/chartboost/sdk/Libraries/a$a;

    if-eqz v0, :cond_0

    .line 201
    iget-object v0, p0, Lcom/chartboost/sdk/impl/b;->i:Lcom/chartboost/sdk/Libraries/a$a;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Libraries/a$a;->a()V

    .line 202
    iput-object v1, p0, Lcom/chartboost/sdk/impl/b;->i:Lcom/chartboost/sdk/Libraries/a$a;

    .line 204
    :cond_0
    iget-object v0, p0, Lcom/chartboost/sdk/impl/b;->h:Lcom/chartboost/sdk/Libraries/a$a;

    if-eqz v0, :cond_1

    .line 205
    iget-object v0, p0, Lcom/chartboost/sdk/impl/b;->h:Lcom/chartboost/sdk/Libraries/a$a;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Libraries/a$a;->a()V

    .line 206
    iput-object v1, p0, Lcom/chartboost/sdk/impl/b;->h:Lcom/chartboost/sdk/Libraries/a$a;

    .line 208
    :cond_1
    iput-object v1, p0, Lcom/chartboost/sdk/impl/b;->k:Lcom/chartboost/sdk/Libraries/a$a;

    .line 209
    iput-object v1, p0, Lcom/chartboost/sdk/impl/b;->j:Lcom/chartboost/sdk/Libraries/a$a;

    .line 210
    iput-object v1, p0, Lcom/chartboost/sdk/impl/b;->l:Lcom/chartboost/sdk/Libraries/a$a;

    .line 211
    return-void
.end method
