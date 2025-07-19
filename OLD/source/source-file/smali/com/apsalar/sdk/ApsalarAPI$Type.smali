.class public Lcom/apsalar/sdk/ApsalarAPI$Type;
.super Ljava/lang/Object;
.source "ApEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apsalar/sdk/ApsalarAPI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Type"
.end annotation


# static fields
.field static final END_SESSION:I = 0x4

.field static final EVENT:I = 0x3

.field static final HEARTBEAT:I = 0x2

.field static final NONE:I = 0x0

.field static final REGISTER:I = 0x5

.field static final RETRY:I = -0x1

.field static final SESSION:I = 0x1

.field static final TRIGGER:I = 0x6


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
