.class public Lcom/tapjoy/TapjoyConnectFlag;
.super Ljava/lang/Object;
.source "TapjoyConnectFlag.java"


# static fields
.field public static final DISABLE_VIDEO_OFFERS:Ljava/lang/String; = "disable_video_offers"

.field public static final FLAG_ARRAY:[Ljava/lang/String;

.field public static final SHA_2_UDID:Ljava/lang/String; = "sha_2_udid"

.field public static final STORE_ARRAY:[Ljava/lang/String;

.field public static final STORE_GFAN:Ljava/lang/String; = "gfan"

.field public static final STORE_NAME:Ljava/lang/String; = "store_name"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 41
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "sha_2_udid"

    aput-object v1, v0, v3

    const-string v1, "store_name"

    aput-object v1, v0, v4

    const/4 v1, 0x2

    const-string v2, "disable_video_offers"

    aput-object v2, v0, v1

    sput-object v0, Lcom/tapjoy/TapjoyConnectFlag;->FLAG_ARRAY:[Ljava/lang/String;

    .line 51
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "gfan"

    aput-object v1, v0, v3

    sput-object v0, Lcom/tapjoy/TapjoyConnectFlag;->STORE_ARRAY:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
