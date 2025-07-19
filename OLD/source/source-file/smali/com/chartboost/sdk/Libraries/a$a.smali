.class public Lcom/chartboost/sdk/Libraries/a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/Libraries/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:Landroid/graphics/Bitmap;

.field private b:I

.field private c:Z


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;I)V
    .locals 1

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    invoke-virtual {p0, p1}, Lcom/chartboost/sdk/Libraries/a$a;->a(Landroid/graphics/Bitmap;)V

    .line 88
    invoke-virtual {p0, p2}, Lcom/chartboost/sdk/Libraries/a$a;->a(I)V

    .line 89
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/chartboost/sdk/Libraries/a$a;->a(Z)V

    .line 90
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .prologue
    .line 98
    iget-boolean v0, p0, Lcom/chartboost/sdk/Libraries/a$a;->c:Z

    if-eqz v0, :cond_1

    .line 104
    :cond_0
    :goto_0
    return-void

    .line 101
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/a$a;->a:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/a$a;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/a$a;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 103
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public a(I)V
    .locals 0

    .prologue
    .line 119
    iput p1, p0, Lcom/chartboost/sdk/Libraries/a$a;->b:I

    .line 120
    return-void
.end method

.method public a(Landroid/graphics/Bitmap;)V
    .locals 0

    .prologue
    .line 111
    iput-object p1, p0, Lcom/chartboost/sdk/Libraries/a$a;->a:Landroid/graphics/Bitmap;

    .line 112
    return-void
.end method

.method public a(Z)V
    .locals 0

    .prologue
    .line 135
    iput-boolean p1, p0, Lcom/chartboost/sdk/Libraries/a$a;->c:Z

    .line 136
    return-void
.end method

.method public b()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/a$a;->a:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public c()I
    .locals 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/a$a;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget v1, p0, Lcom/chartboost/sdk/Libraries/a$a;->b:I

    mul-int/2addr v0, v1

    return v0
.end method

.method public d()I
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/chartboost/sdk/Libraries/a$a;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/chartboost/sdk/Libraries/a$a;->b:I

    mul-int/2addr v0, v1

    return v0
.end method
