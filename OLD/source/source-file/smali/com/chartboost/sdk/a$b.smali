.class Lcom/chartboost/sdk/a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/a;

.field private b:Lcom/chartboost/sdk/impl/a;

.field private c:Z


# direct methods
.method public constructor <init>(Lcom/chartboost/sdk/a;Lcom/chartboost/sdk/impl/a;Z)V
    .locals 0

    .prologue
    .line 219
    iput-object p1, p0, Lcom/chartboost/sdk/a$b;->a:Lcom/chartboost/sdk/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 220
    iput-object p2, p0, Lcom/chartboost/sdk/a$b;->b:Lcom/chartboost/sdk/impl/a;

    .line 221
    iput-boolean p3, p0, Lcom/chartboost/sdk/a$b;->c:Z

    .line 222
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 225
    iget-object v0, p0, Lcom/chartboost/sdk/a$b;->b:Lcom/chartboost/sdk/impl/a;

    iget-object v0, v0, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    sget-object v1, Lcom/chartboost/sdk/impl/a$b;->d:Lcom/chartboost/sdk/impl/a$b;

    if-ne v0, v1, :cond_0

    .line 226
    iget-object v0, p0, Lcom/chartboost/sdk/a$b;->b:Lcom/chartboost/sdk/impl/a;

    sget-object v1, Lcom/chartboost/sdk/impl/a$b;->a:Lcom/chartboost/sdk/impl/a$b;

    iput-object v1, v0, Lcom/chartboost/sdk/impl/a;->c:Lcom/chartboost/sdk/impl/a$b;

    .line 227
    iget-object v0, p0, Lcom/chartboost/sdk/a$b;->a:Lcom/chartboost/sdk/a;

    iget-object v1, p0, Lcom/chartboost/sdk/a$b;->b:Lcom/chartboost/sdk/impl/a;

    iget-boolean v2, p0, Lcom/chartboost/sdk/a$b;->c:Z

    invoke-virtual {v0, v1, v2}, Lcom/chartboost/sdk/a;->b(Lcom/chartboost/sdk/impl/a;Z)V

    .line 229
    :cond_0
    return-void
.end method
