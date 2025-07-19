.class public final enum Lcom/chartboost/sdk/impl/n$b;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/impl/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/chartboost/sdk/impl/n$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/chartboost/sdk/impl/n$b;

.field public static final enum b:Lcom/chartboost/sdk/impl/n$b;

.field public static final enum c:Lcom/chartboost/sdk/impl/n$b;

.field public static final enum d:Lcom/chartboost/sdk/impl/n$b;

.field public static final enum e:Lcom/chartboost/sdk/impl/n$b;

.field public static final enum f:Lcom/chartboost/sdk/impl/n$b;

.field private static final synthetic g:[Lcom/chartboost/sdk/impl/n$b;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 24
    new-instance v0, Lcom/chartboost/sdk/impl/n$b;

    const-string v1, "CBAnimationTypeNone"

    invoke-direct {v0, v1, v3}, Lcom/chartboost/sdk/impl/n$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/chartboost/sdk/impl/n$b;->a:Lcom/chartboost/sdk/impl/n$b;

    .line 25
    new-instance v0, Lcom/chartboost/sdk/impl/n$b;

    const-string v1, "CBAnimationTypePerspectiveRotate"

    invoke-direct {v0, v1, v4}, Lcom/chartboost/sdk/impl/n$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/chartboost/sdk/impl/n$b;->b:Lcom/chartboost/sdk/impl/n$b;

    .line 26
    new-instance v0, Lcom/chartboost/sdk/impl/n$b;

    const-string v1, "CBAnimationTypeBounce"

    invoke-direct {v0, v1, v5}, Lcom/chartboost/sdk/impl/n$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/chartboost/sdk/impl/n$b;->c:Lcom/chartboost/sdk/impl/n$b;

    .line 27
    new-instance v0, Lcom/chartboost/sdk/impl/n$b;

    const-string v1, "CBAnimationTypePerspectiveZoom"

    invoke-direct {v0, v1, v6}, Lcom/chartboost/sdk/impl/n$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/chartboost/sdk/impl/n$b;->d:Lcom/chartboost/sdk/impl/n$b;

    .line 28
    new-instance v0, Lcom/chartboost/sdk/impl/n$b;

    const-string v1, "CBAnimationTypeSlideFromBottom"

    invoke-direct {v0, v1, v7}, Lcom/chartboost/sdk/impl/n$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/chartboost/sdk/impl/n$b;->e:Lcom/chartboost/sdk/impl/n$b;

    .line 29
    new-instance v0, Lcom/chartboost/sdk/impl/n$b;

    const-string v1, "CBAnimationTypeSlideFromTop"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/chartboost/sdk/impl/n$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/chartboost/sdk/impl/n$b;->f:Lcom/chartboost/sdk/impl/n$b;

    .line 23
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/chartboost/sdk/impl/n$b;

    sget-object v1, Lcom/chartboost/sdk/impl/n$b;->a:Lcom/chartboost/sdk/impl/n$b;

    aput-object v1, v0, v3

    sget-object v1, Lcom/chartboost/sdk/impl/n$b;->b:Lcom/chartboost/sdk/impl/n$b;

    aput-object v1, v0, v4

    sget-object v1, Lcom/chartboost/sdk/impl/n$b;->c:Lcom/chartboost/sdk/impl/n$b;

    aput-object v1, v0, v5

    sget-object v1, Lcom/chartboost/sdk/impl/n$b;->d:Lcom/chartboost/sdk/impl/n$b;

    aput-object v1, v0, v6

    sget-object v1, Lcom/chartboost/sdk/impl/n$b;->e:Lcom/chartboost/sdk/impl/n$b;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/chartboost/sdk/impl/n$b;->f:Lcom/chartboost/sdk/impl/n$b;

    aput-object v2, v0, v1

    sput-object v0, Lcom/chartboost/sdk/impl/n$b;->g:[Lcom/chartboost/sdk/impl/n$b;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/chartboost/sdk/impl/n$b;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/chartboost/sdk/impl/n$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/chartboost/sdk/impl/n$b;

    return-object v0
.end method

.method public static values()[Lcom/chartboost/sdk/impl/n$b;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/chartboost/sdk/impl/n$b;->g:[Lcom/chartboost/sdk/impl/n$b;

    array-length v1, v0

    new-array v2, v1, [Lcom/chartboost/sdk/impl/n$b;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
