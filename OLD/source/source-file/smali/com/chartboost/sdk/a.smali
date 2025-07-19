.class public final Lcom/chartboost/sdk/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/chartboost/sdk/a$a;,
        Lcom/chartboost/sdk/a$b;
    }
.end annotation


# instance fields
.field private a:Lcom/chartboost/sdk/Chartboost;

.field private b:Landroid/app/Activity;

.field private c:Lcom/chartboost/sdk/impl/r;

.field private d:Z

.field private e:Z

.field private f:Z

.field private g:Lcom/chartboost/sdk/impl/s;

.field private h:Lcom/chartboost/sdk/impl/s;


# direct methods
.method protected constructor <init>(Lcom/chartboost/sdk/Chartboost;Landroid/app/Activity;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-boolean v0, p0, Lcom/chartboost/sdk/a;->d:Z

    .line 27
    iput-boolean v0, p0, Lcom/chartboost/sdk/a;->e:Z

    .line 28
    iput-boolean v0, p0, Lcom/chartboost/sdk/a;->f:Z

    .line 35
    iput-object p1, p0, Lcom/chartboost/sdk/a;->a:Lcom/chartboost/sdk/Chartboost;

    .line 36
    iput-object p2, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    .line 37
    return-void
.end method

.method static synthetic a(Lcom/chartboost/sdk/a;)Lcom/chartboost/sdk/Chartboost;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/chartboost/sdk/a;->a:Lcom/chartboost/sdk/Chartboost;

    return-object v0
.end method

.method private b()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 149
    new-instance v0, Lcom/chartboost/sdk/impl/r;

    iget-object v1, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/chartboost/sdk/impl/r;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/chartboost/sdk/a;->c:Lcom/chartboost/sdk/impl/r;

    .line 153
    new-instance v0, Lcom/chartboost/sdk/impl/s;

    iget-object v1, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    iget-object v2, p0, Lcom/chartboost/sdk/a;->c:Lcom/chartboost/sdk/impl/r;

    invoke-direct {v0, v1, v2}, Lcom/chartboost/sdk/impl/s;-><init>(Landroid/content/Context;Lcom/chartboost/sdk/impl/s$a;)V

    iput-object v0, p0, Lcom/chartboost/sdk/a;->h:Lcom/chartboost/sdk/impl/s;

    .line 154
    iget-object v0, p0, Lcom/chartboost/sdk/a;->h:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/s;->b()Lcom/chartboost/sdk/impl/o;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/chartboost/sdk/impl/o;->a(Z)V

    .line 155
    iget-object v0, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    iget-object v1, p0, Lcom/chartboost/sdk/a;->h:Lcom/chartboost/sdk/impl/s;

    .line 156
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 155
    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    iget-object v0, p0, Lcom/chartboost/sdk/a;->h:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/s;->b()Lcom/chartboost/sdk/impl/o;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/o;->a()V

    .line 158
    iget-object v0, p0, Lcom/chartboost/sdk/a;->h:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/s;->b()Lcom/chartboost/sdk/impl/o;

    move-result-object v1

    iget-object v0, p0, Lcom/chartboost/sdk/a;->c:Lcom/chartboost/sdk/impl/r;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/r;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v1, v0}, Lcom/chartboost/sdk/impl/o;->a(Landroid/view/View;)V

    .line 160
    iput-boolean v4, p0, Lcom/chartboost/sdk/a;->d:Z

    .line 161
    return-void
.end method

.method private b(Lcom/chartboost/sdk/impl/a;)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 57
    iget-boolean v0, p0, Lcom/chartboost/sdk/a;->e:Z

    if-eqz v0, :cond_1

    .line 103
    :cond_0
    :goto_0
    return-void

    .line 59
    :cond_1
    sget-object v0, Lcom/chartboost/sdk/impl/a$b;->b:Lcom/chartboost/sdk/impl/a$b;

    iput-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    .line 61
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v0}, Lcom/chartboost/sdk/b;->b()Z

    move-result v0

    if-nez v0, :cond_2

    .line 62
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    iget-object v0, v0, Lcom/chartboost/sdk/b;->d:Lcom/chartboost/sdk/b$a;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    iget-object v0, v0, Lcom/chartboost/sdk/b;->d:Lcom/chartboost/sdk/b$a;

    invoke-interface {v0}, Lcom/chartboost/sdk/b$a;->a()V

    goto :goto_0

    .line 66
    :cond_2
    iget-boolean v0, p1, Lcom/chartboost/sdk/impl/a;->i:Z

    if-eqz v0, :cond_3

    .line 67
    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/chartboost/sdk/impl/a;->i:Z

    .line 68
    new-instance v0, Lcom/chartboost/sdk/impl/s;

    iget-object v1, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    iget-object v2, p1, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v2}, Lcom/chartboost/sdk/b;->d()Lcom/chartboost/sdk/b$b;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/chartboost/sdk/impl/s;-><init>(Landroid/content/Context;Lcom/chartboost/sdk/impl/s$a;)V

    iput-object v0, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    .line 70
    iget-object v0, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    iget-object v1, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    .line 71
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 70
    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    sget-object v0, Lcom/chartboost/sdk/impl/a$b;->c:Lcom/chartboost/sdk/impl/a$b;

    iput-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    .line 74
    iget-object v0, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    iput-object v0, p1, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    .line 75
    iput-boolean v4, p0, Lcom/chartboost/sdk/a;->e:Z

    goto :goto_0

    .line 78
    :cond_3
    new-instance v0, Lcom/chartboost/sdk/impl/s;

    iget-object v1, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    iget-object v2, p1, Lcom/chartboost/sdk/impl/a;->f:Lcom/chartboost/sdk/b;

    invoke-virtual {v2}, Lcom/chartboost/sdk/b;->d()Lcom/chartboost/sdk/b$b;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/chartboost/sdk/impl/s;-><init>(Landroid/content/Context;Lcom/chartboost/sdk/impl/s$a;)V

    iput-object v0, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    .line 79
    iget-object v0, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    iget-object v1, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    .line 80
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 79
    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    iget-object v0, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/s;->b()Lcom/chartboost/sdk/impl/o;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/o;->a()V

    .line 84
    sget-object v0, Lcom/chartboost/sdk/impl/n$b;->b:Lcom/chartboost/sdk/impl/n$b;

    .line 85
    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v2, Lcom/chartboost/sdk/impl/a$c;->c:Lcom/chartboost/sdk/impl/a$c;

    if-ne v1, v2, :cond_4

    sget-object v0, Lcom/chartboost/sdk/impl/n$b;->d:Lcom/chartboost/sdk/impl/n$b;

    .line 86
    :cond_4
    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->a:Lorg/json/JSONObject;

    const-string v2, "animation"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_5

    .line 87
    invoke-static {}, Lcom/chartboost/sdk/impl/n$b;->values()[Lcom/chartboost/sdk/impl/n$b;

    move-result-object v0

    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->a:Lorg/json/JSONObject;

    const-string v2, "animation"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    aget-object v0, v0, v1

    .line 89
    :cond_5
    sget-object v1, Lcom/chartboost/sdk/impl/a$b;->c:Lcom/chartboost/sdk/impl/a$b;

    iput-object v1, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    .line 90
    iget-object v1, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    iput-object v1, p1, Lcom/chartboost/sdk/impl/a;->h:Lcom/chartboost/sdk/impl/s;

    .line 91
    invoke-static {v0, p1}, Lcom/chartboost/sdk/impl/n;->a(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;)V

    .line 92
    iput-boolean v4, p0, Lcom/chartboost/sdk/a;->e:Z

    .line 94
    iget-object v0, p0, Lcom/chartboost/sdk/a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getDelegate()Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    .line 95
    if-eqz v0, :cond_0

    .line 96
    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v2, Lcom/chartboost/sdk/impl/a$c;->b:Lcom/chartboost/sdk/impl/a$c;

    if-ne v1, v2, :cond_6

    .line 97
    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->e:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/chartboost/sdk/ChartboostDelegate;->didShowInterstitial(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 98
    :cond_6
    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v2, Lcom/chartboost/sdk/impl/a$c;->c:Lcom/chartboost/sdk/impl/a$c;

    if-ne v1, v2, :cond_0

    .line 99
    invoke-interface {v0}, Lcom/chartboost/sdk/ChartboostDelegate;->didShowMoreApps()V

    goto/16 :goto_0
.end method

.method private c(Lcom/chartboost/sdk/impl/a;)Lcom/chartboost/sdk/impl/n$a;
    .locals 1

    .prologue
    .line 234
    new-instance v0, Lcom/chartboost/sdk/a$1;

    invoke-direct {v0, p0}, Lcom/chartboost/sdk/a$1;-><init>(Lcom/chartboost/sdk/a;)V

    .line 243
    return-object v0
.end method


# virtual methods
.method protected a(Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 40
    iput-object p1, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    .line 41
    return-void
.end method

.method protected a(Lcom/chartboost/sdk/a$a;)V
    .locals 1

    .prologue
    .line 47
    iget-boolean v0, p1, Lcom/chartboost/sdk/a$a;->a:Z

    if-eqz v0, :cond_1

    .line 48
    invoke-direct {p0}, Lcom/chartboost/sdk/a;->b()V

    .line 52
    :cond_0
    :goto_0
    return-void

    .line 49
    :cond_1
    iget-object v0, p1, Lcom/chartboost/sdk/a$a;->b:Lcom/chartboost/sdk/impl/a;

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p1, Lcom/chartboost/sdk/a$a;->b:Lcom/chartboost/sdk/impl/a;

    invoke-direct {p0, v0}, Lcom/chartboost/sdk/a;->b(Lcom/chartboost/sdk/impl/a;)V

    goto :goto_0
.end method

.method public a(Lcom/chartboost/sdk/impl/a;)V
    .locals 2

    .prologue
    .line 131
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/chartboost/sdk/a;->e:Z

    .line 133
    new-instance v0, Lcom/chartboost/sdk/a$b;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lcom/chartboost/sdk/a$b;-><init>(Lcom/chartboost/sdk/a;Lcom/chartboost/sdk/impl/a;Z)V

    invoke-virtual {v0}, Lcom/chartboost/sdk/a$b;->run()V

    .line 134
    iget-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    sget-object v1, Lcom/chartboost/sdk/impl/a$b;->c:Lcom/chartboost/sdk/impl/a$b;

    if-ne v0, v1, :cond_0

    .line 135
    sget-object v0, Lcom/chartboost/sdk/impl/a$b;->b:Lcom/chartboost/sdk/impl/a$b;

    iput-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    .line 139
    :goto_0
    invoke-virtual {p1}, Lcom/chartboost/sdk/impl/a;->c()V

    .line 142
    :try_start_0
    iget-object v0, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/s;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 143
    iget-object v1, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    :goto_1
    return-void

    .line 137
    :cond_0
    sget-object v0, Lcom/chartboost/sdk/impl/a$b;->a:Lcom/chartboost/sdk/impl/a$b;

    iput-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    goto :goto_0

    .line 144
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method public a(Lcom/chartboost/sdk/impl/a;Z)V
    .locals 3

    .prologue
    .line 112
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/chartboost/sdk/a;->e:Z

    .line 114
    if-nez p2, :cond_0

    .line 115
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/chartboost/sdk/a;->f:Z

    .line 117
    :cond_0
    sget-object v0, Lcom/chartboost/sdk/impl/a$b;->d:Lcom/chartboost/sdk/impl/a$b;

    iput-object v0, p1, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    .line 119
    sget-object v0, Lcom/chartboost/sdk/impl/n$b;->b:Lcom/chartboost/sdk/impl/n$b;

    .line 120
    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->d:Lcom/chartboost/sdk/impl/a$c;

    sget-object v2, Lcom/chartboost/sdk/impl/a$c;->c:Lcom/chartboost/sdk/impl/a$c;

    if-ne v1, v2, :cond_1

    sget-object v0, Lcom/chartboost/sdk/impl/n$b;->d:Lcom/chartboost/sdk/impl/n$b;

    .line 121
    :cond_1
    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->a:Lorg/json/JSONObject;

    const-string v2, "animation"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_2

    .line 122
    invoke-static {}, Lcom/chartboost/sdk/impl/n$b;->values()[Lcom/chartboost/sdk/impl/n$b;

    move-result-object v0

    iget-object v1, p1, Lcom/chartboost/sdk/impl/a;->a:Lorg/json/JSONObject;

    const-string v2, "animation"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    aget-object v0, v0, v1

    .line 124
    :cond_2
    invoke-direct {p0, p1}, Lcom/chartboost/sdk/a;->c(Lcom/chartboost/sdk/impl/a;)Lcom/chartboost/sdk/impl/n$a;

    move-result-object v1

    .line 125
    invoke-static {v0, p1, v1}, Lcom/chartboost/sdk/impl/n;->b(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;)V

    .line 126
    return-void
.end method

.method public a(Z)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 169
    invoke-virtual {p0}, Lcom/chartboost/sdk/a;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 172
    :try_start_0
    iget-object v0, p0, Lcom/chartboost/sdk/a;->h:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/s;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 173
    iget-object v1, p0, Lcom/chartboost/sdk/a;->h:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    :goto_0
    iput-object v2, p0, Lcom/chartboost/sdk/a;->c:Lcom/chartboost/sdk/impl/r;

    .line 178
    iput-object v2, p0, Lcom/chartboost/sdk/a;->h:Lcom/chartboost/sdk/impl/s;

    .line 179
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/chartboost/sdk/a;->d:Z

    .line 181
    iget-boolean v0, p0, Lcom/chartboost/sdk/a;->f:Z

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 182
    iget-object v0, p0, Lcom/chartboost/sdk/a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getImpressionsUseActivities()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/chartboost/sdk/a;->e:Z

    if-nez v0, :cond_0

    .line 183
    iget-object v0, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    instance-of v0, v0, Lcom/chartboost/sdk/CBImpressionActivity;

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/chartboost/sdk/a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->c()V

    .line 185
    iget-object v0, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 189
    :cond_0
    return-void

    .line 174
    :catch_0
    move-exception v0

    .line 175
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method protected a()Z
    .locals 1

    .prologue
    .line 247
    iget-boolean v0, p0, Lcom/chartboost/sdk/a;->d:Z

    return v0
.end method

.method public b(Lcom/chartboost/sdk/impl/a;Z)V
    .locals 2

    .prologue
    .line 193
    iget-object v0, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    if-nez v0, :cond_1

    .line 211
    :cond_0
    :goto_0
    return-void

    .line 196
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/s;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 197
    iget-object v1, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    :goto_1
    invoke-virtual {p1}, Lcom/chartboost/sdk/impl/a;->b()V

    .line 202
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/chartboost/sdk/a;->g:Lcom/chartboost/sdk/impl/s;

    .line 203
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/chartboost/sdk/a;->f:Z

    .line 205
    iget-object v0, p0, Lcom/chartboost/sdk/a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getImpressionsUseActivities()Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p2, :cond_0

    iget-boolean v0, p0, Lcom/chartboost/sdk/a;->d:Z

    if-nez v0, :cond_0

    .line 206
    iget-object v0, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    instance-of v0, v0, Lcom/chartboost/sdk/CBImpressionActivity;

    if-eqz v0, :cond_0

    .line 207
    iget-object v0, p0, Lcom/chartboost/sdk/a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->c()V

    .line 208
    iget-object v0, p0, Lcom/chartboost/sdk/a;->b:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 198
    :catch_0
    move-exception v0

    .line 199
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
