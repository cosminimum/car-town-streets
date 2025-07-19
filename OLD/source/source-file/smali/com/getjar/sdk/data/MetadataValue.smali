.class public Lcom/getjar/sdk/data/MetadataValue;
.super Ljava/lang/Object;
.source "MetadataValue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;
    }
.end annotation


# instance fields
.field private _reliability:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

.field private _value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "reliability"    # Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/getjar/sdk/data/MetadataValue;->_value:Ljava/lang/String;

    .line 22
    iput-object p2, p0, Lcom/getjar/sdk/data/MetadataValue;->_reliability:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    .line 23
    return-void
.end method


# virtual methods
.method public getReliability()Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/getjar/sdk/data/MetadataValue;->_reliability:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/getjar/sdk/data/MetadataValue;->_value:Ljava/lang/String;

    return-object v0
.end method
