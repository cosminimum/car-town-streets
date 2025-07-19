.class Lcom/apsalar/sdk/ApsalarThread$State;
.super Ljava/lang/Object;
.source "ApThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apsalar/sdk/ApsalarThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "State"
.end annotation


# static fields
.field static final BUFFERING:I = 0x3

.field static final NOMINAL:I = 0x2

.field static final RECOVERY:I = 0x1


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
