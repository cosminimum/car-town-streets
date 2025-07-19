.class public Lcom/getjar/sdk/Product;
.super Ljava/lang/Object;
.source "Product.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/getjar/sdk/Product;",
            ">;"
        }
    .end annotation
.end field

.field public static final ITEM_ID_PATTERN:Ljava/util/regex/Pattern;

.field public static final ITEM_ID_REGEX:Ljava/lang/String; = "[\\w\\-_\\.]{1,100}"


# instance fields
.field protected mDeveloperPayload:Ljava/lang/String;

.field protected mProductAmount:J

.field protected mProductDescription:Ljava/lang/String;

.field protected mProductId:Ljava/lang/String;

.field protected mProductImageResourceId:Ljava/lang/Integer;

.field protected mProductName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-string v0, "[\\w\\-_\\.]{1,100}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/Product;->ITEM_ID_PATTERN:Ljava/util/regex/Pattern;

    .line 223
    new-instance v0, Lcom/getjar/sdk/Product$1;

    invoke-direct {v0}, Lcom/getjar/sdk/Product$1;-><init>()V

    sput-object v0, Lcom/getjar/sdk/Product;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v2, 0x0

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductId:Ljava/lang/String;

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductName:Ljava/lang/String;

    .line 27
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductDescription:Ljava/lang/String;

    .line 29
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mDeveloperPayload:Ljava/lang/String;

    .line 30
    iput-object v2, p0, Lcom/getjar/sdk/Product;->mProductImageResourceId:Ljava/lang/Integer;

    .line 234
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductId:Ljava/lang/String;

    .line 235
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductName:Ljava/lang/String;

    .line 236
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductDescription:Ljava/lang/String;

    .line 237
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/getjar/sdk/Product;->mProductAmount:J

    .line 238
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductImageResourceId:Ljava/lang/Integer;

    .line 239
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mProductImageResourceId:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 241
    iput-object v2, p0, Lcom/getjar/sdk/Product;->mProductImageResourceId:Ljava/lang/Integer;

    .line 243
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mDeveloperPayload:Ljava/lang/String;

    .line 244
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 5
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductId:Ljava/lang/String;

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductName:Ljava/lang/String;

    .line 27
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductDescription:Ljava/lang/String;

    .line 29
    const-string v0, ""

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mDeveloperPayload:Ljava/lang/String;

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductImageResourceId:Ljava/lang/Integer;

    .line 50
    invoke-static {p1}, Lcom/getjar/sdk/Product;->validateProductId(Ljava/lang/String;)V

    .line 51
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "product \'%s\' needs a name"

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-gez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "product \'%s\' needs an amount greater than or equal to zero"

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_1
    iput-object p1, p0, Lcom/getjar/sdk/Product;->mProductId:Ljava/lang/String;

    .line 55
    iput-object p2, p0, Lcom/getjar/sdk/Product;->mProductName:Ljava/lang/String;

    .line 56
    if-nez p3, :cond_2

    const-string p3, ""

    .end local p3    # "theProductDescription":Ljava/lang/String;
    :cond_2
    iput-object p3, p0, Lcom/getjar/sdk/Product;->mProductDescription:Ljava/lang/String;

    .line 57
    iput-wide p4, p0, Lcom/getjar/sdk/Product;->mProductAmount:J

    .line 58
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JI)V
    .locals 4
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J
    .param p6, "imageResourceId"    # I

    .prologue
    .line 79
    invoke-direct/range {p0 .. p5}, Lcom/getjar/sdk/Product;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 84
    if-gez p6, :cond_0

    .line 85
    sget-object v0, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "\'imageResourceId\' cannot be less than 0"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 88
    :cond_0
    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductImageResourceId:Ljava/lang/Integer;

    .line 89
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JILjava/lang/String;)V
    .locals 0
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J
    .param p6, "imageResourceId"    # I
    .param p7, "developerPayload"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-direct/range {p0 .. p6}, Lcom/getjar/sdk/Product;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JI)V

    .line 112
    if-nez p7, :cond_0

    const-string p7, ""

    .end local p7    # "developerPayload":Ljava/lang/String;
    :cond_0
    iput-object p7, p0, Lcom/getjar/sdk/Product;->mDeveloperPayload:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public static validateProductId(Ljava/lang/String;)V
    .locals 6
    .param p0, "theProductId"    # Ljava/lang/String;

    .prologue
    .line 122
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'theProductId\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_0
    sget-object v0, Lcom/getjar/sdk/Product;->ITEM_ID_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-nez v0, :cond_1

    .line 124
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "\'theProductId\' is too long or contains invalid characters. Product IDs must match the RegEx pattern \'%1$s\'."

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "[\\w\\-_\\.]{1,100}"

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 128
    :cond_1
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 205
    const/4 v0, 0x0

    return v0
.end method

.method public getAmount()J
    .locals 2

    .prologue
    .line 163
    iget-wide v0, p0, Lcom/getjar/sdk/Product;->mProductAmount:J

    return-wide v0
.end method

.method public getDeveloperPayload()Ljava/lang/String;
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mDeveloperPayload:Ljava/lang/String;

    return-object v0
.end method

.method public getImageResourceId()I
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mProductImageResourceId:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getProductDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mProductDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getProductId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mProductId:Ljava/lang/String;

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mProductName:Ljava/lang/String;

    return-object v0
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 194
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 195
    .local v0, "jo":Lorg/json/JSONObject;
    const-string v1, "amount"

    iget-wide v2, p0, Lcom/getjar/sdk/Product;->mProductAmount:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 196
    const-string v1, "product_id"

    iget-object v2, p0, Lcom/getjar/sdk/Product;->mProductId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 197
    const-string v1, "product_description"

    iget-object v2, p0, Lcom/getjar/sdk/Product;->mProductDescription:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 198
    const-string v1, "product_name"

    iget-object v2, p0, Lcom/getjar/sdk/Product;->mProductName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 199
    const-string v1, "developer_payload"

    iget-object v2, p0, Lcom/getjar/sdk/Product;->mDeveloperPayload:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 200
    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 210
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mProductId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 211
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mProductName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 212
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mProductDescription:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 213
    iget-wide v0, p0, Lcom/getjar/sdk/Product;->mProductAmount:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 214
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mProductImageResourceId:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 216
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/Product;->mProductImageResourceId:Ljava/lang/Integer;

    .line 218
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mProductImageResourceId:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 219
    iget-object v0, p0, Lcom/getjar/sdk/Product;->mDeveloperPayload:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 220
    return-void
.end method
