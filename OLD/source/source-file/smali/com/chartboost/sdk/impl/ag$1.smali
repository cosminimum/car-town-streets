.class final Lcom/chartboost/sdk/impl/ag$1;
.super Ljava/lang/ThreadLocal;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/impl/ag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Lcom/chartboost/sdk/impl/ai;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 319
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected a()Lcom/chartboost/sdk/impl/ai;
    .locals 1

    .prologue
    .line 321
    new-instance v0, Lcom/chartboost/sdk/impl/al;

    invoke-direct {v0}, Lcom/chartboost/sdk/impl/al;-><init>()V

    return-object v0
.end method

.method protected synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 319
    invoke-virtual {p0}, Lcom/chartboost/sdk/impl/ag$1;->a()Lcom/chartboost/sdk/impl/ai;

    move-result-object v0

    return-object v0
.end method
