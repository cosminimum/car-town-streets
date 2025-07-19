.class public Lcom/apsalar/sdk/ApsalarAPI$Status;
.super Ljava/lang/Object;
.source "ApEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apsalar/sdk/ApsalarAPI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Status"
.end annotation


# static fields
.field static final INVALID:I = -0x1

.field static final POSTPONE:I = 0x0

.field static final SUCCESS:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
