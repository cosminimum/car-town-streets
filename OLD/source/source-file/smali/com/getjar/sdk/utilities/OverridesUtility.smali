.class public final Lcom/getjar/sdk/utilities/OverridesUtility;
.super Ljava/lang/Object;
.source "OverridesUtility.java"


# static fields
.field public static final DEBUG_BUILD:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getOverridesMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<**>;"
        }
    .end annotation

    .prologue
    .line 19
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 22
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 25
    return-object p1
.end method

.method public static getValueBool(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 40
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getValueBool(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/lang/Boolean;

    .prologue
    .line 43
    return-object p1
.end method

.method public static getValueFakeID(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 52
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getValueFakeID(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 55
    return-object p1
.end method

.method public static getValueInt(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 28
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getValueInt(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/lang/Integer;

    .prologue
    .line 31
    return-object p1
.end method

.method public static getValueLong(Ljava/lang/String;)Ljava/lang/Long;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 34
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getValueLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/lang/Long;

    .prologue
    .line 37
    return-object p1
.end method

.method public static getValueUUID(Ljava/lang/String;)Ljava/util/UUID;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 46
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getValueUUID(Ljava/lang/String;Ljava/util/UUID;)Ljava/util/UUID;
    .locals 0
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/util/UUID;

    .prologue
    .line 49
    return-object p1
.end method

.method public static initialize(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 11
    return-void
.end method
