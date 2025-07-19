.class public Lcom/getjar/sdk/rewards/WebSettingsEx$ZoomDensity;
.super Ljava/lang/Object;
.source "WebSettingsEx.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/WebSettingsEx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ZoomDensity"
.end annotation


# static fields
.field public static CLOSE:Ljava/lang/Object;

.field public static FAR:Ljava/lang/Object;

.field public static MEDIUM:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v6, 0x0

    .line 63
    sput-object v6, Lcom/getjar/sdk/rewards/WebSettingsEx$ZoomDensity;->FAR:Ljava/lang/Object;

    .line 64
    sput-object v6, Lcom/getjar/sdk/rewards/WebSettingsEx$ZoomDensity;->MEDIUM:Ljava/lang/Object;

    .line 65
    sput-object v6, Lcom/getjar/sdk/rewards/WebSettingsEx$ZoomDensity;->CLOSE:Ljava/lang/Object;

    .line 71
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/rewards/WebSettingsEx;->access$000()Ljava/lang/Class;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 74
    invoke-static {}, Lcom/getjar/sdk/rewards/WebSettingsEx;->access$000()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v5, v0, v3

    .line 75
    .local v5, "obj":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "value"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 76
    .local v2, "field":Ljava/lang/reflect/Field;
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 77
    const-string v6, "FAR"

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 78
    sput-object v5, Lcom/getjar/sdk/rewards/WebSettingsEx$ZoomDensity;->FAR:Ljava/lang/Object;

    .line 74
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 79
    :cond_1
    const-string v6, "MEDIUM"

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 80
    sput-object v5, Lcom/getjar/sdk/rewards/WebSettingsEx$ZoomDensity;->MEDIUM:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 86
    .end local v2    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 87
    .end local v1    # "e":Ljava/lang/Throwable;
    :cond_2
    return-void

    .line 81
    .restart local v2    # "field":Ljava/lang/reflect/Field;
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    .restart local v5    # "obj":Ljava/lang/Object;
    :cond_3
    :try_start_1
    const-string v6, "CLOSE"

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 82
    sput-object v5, Lcom/getjar/sdk/rewards/WebSettingsEx$ZoomDensity;->CLOSE:Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
