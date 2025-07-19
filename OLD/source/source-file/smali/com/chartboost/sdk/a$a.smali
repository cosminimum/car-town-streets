.class public final Lcom/chartboost/sdk/a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "a"
.end annotation


# instance fields
.field protected a:Z

.field protected b:Lcom/chartboost/sdk/impl/a;


# direct methods
.method public constructor <init>(Lcom/chartboost/sdk/impl/a;)V
    .locals 1

    .prologue
    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/chartboost/sdk/a$a;->a:Z

    .line 271
    iput-object p1, p0, Lcom/chartboost/sdk/a$a;->b:Lcom/chartboost/sdk/impl/a;

    .line 272
    return-void
.end method

.method protected constructor <init>(ZLcom/chartboost/sdk/impl/a;)V
    .locals 0

    .prologue
    .line 261
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 262
    iput-boolean p1, p0, Lcom/chartboost/sdk/a$a;->a:Z

    .line 263
    iput-object p2, p0, Lcom/chartboost/sdk/a$a;->b:Lcom/chartboost/sdk/impl/a;

    .line 264
    return-void
.end method
