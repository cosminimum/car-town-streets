.class final enum Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;
.super Ljava/lang/Enum;
.source "MraidView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mopub/mobileads/MraidView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "NativeCloseButtonStyle"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

.field public static final enum AD_CONTROLLED:Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

.field public static final enum ALWAYS_HIDDEN:Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

.field public static final enum ALWAYS_VISIBLE:Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 77
    new-instance v0, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    const-string v1, "ALWAYS_VISIBLE"

    invoke-direct {v0, v1, v2}, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;->ALWAYS_VISIBLE:Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    .line 78
    new-instance v0, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    const-string v1, "ALWAYS_HIDDEN"

    invoke-direct {v0, v1, v3}, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;->ALWAYS_HIDDEN:Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    .line 79
    new-instance v0, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    const-string v1, "AD_CONTROLLED"

    invoke-direct {v0, v1, v4}, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;->AD_CONTROLLED:Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    .line 76
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    sget-object v1, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;->ALWAYS_VISIBLE:Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;->ALWAYS_HIDDEN:Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;->AD_CONTROLLED:Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    aput-object v1, v0, v4

    sput-object v0, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;->$VALUES:[Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 76
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 76
    const-class v0, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    return-object v0
.end method

.method public static values()[Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;
    .locals 1

    .prologue
    .line 76
    sget-object v0, Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;->$VALUES:[Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    invoke-virtual {v0}, [Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mopub/mobileads/MraidView$NativeCloseButtonStyle;

    return-object v0
.end method
