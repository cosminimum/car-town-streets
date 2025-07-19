.class public Lcom/miniclip/GetJar/GetJar;
.super Ljava/lang/Object;
.source "GetJar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miniclip/GetJar/GetJar$PricingCallback;,
        Lcom/miniclip/GetJar/GetJar$GetJarListener;
    }
.end annotation


# static fields
.field private static APP_TOKEN:Ljava/lang/String;

.field private static DEBUG:Z

.field private static ENCRYPTION_KEY:Ljava/lang/String;

.field private static GETJAR_CONTEXT:Lcom/getjar/sdk/GetJarContext;

.field private static GETJAR_CONTEXT_ID:Ljava/lang/String;

.field private static GETJAR_PAGE:Lcom/getjar/sdk/GetJarPage;

.field private static GETJAR_TAG:Ljava/lang/String;

.field private static dialog:Landroid/app/AlertDialog;

.field private static inAppList:[Ljava/lang/String;

.field private static items:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static licensing:Lcom/getjar/sdk/Licensing;

.field private static mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

.field private static mListener:Lcom/miniclip/GetJar/GetJar$GetJarListener;

.field private static mUser:Lcom/getjar/sdk/User;

.field static userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 40
    const-string v0, "GetJar"

    sput-object v0, Lcom/miniclip/GetJar/GetJar;->GETJAR_TAG:Ljava/lang/String;

    .line 41
    const/4 v0, 0x0

    sput-boolean v0, Lcom/miniclip/GetJar/GetJar;->DEBUG:Z

    .line 43
    sput-object v1, Lcom/miniclip/GetJar/GetJar;->APP_TOKEN:Ljava/lang/String;

    .line 44
    sput-object v1, Lcom/miniclip/GetJar/GetJar;->ENCRYPTION_KEY:Ljava/lang/String;

    .line 45
    sput-object v1, Lcom/miniclip/GetJar/GetJar;->GETJAR_CONTEXT_ID:Ljava/lang/String;

    .line 47
    sput-object v1, Lcom/miniclip/GetJar/GetJar;->GETJAR_CONTEXT:Lcom/getjar/sdk/GetJarContext;

    .line 48
    sput-object v1, Lcom/miniclip/GetJar/GetJar;->GETJAR_PAGE:Lcom/getjar/sdk/GetJarPage;

    .line 50
    sput-object v1, Lcom/miniclip/GetJar/GetJar;->mListener:Lcom/miniclip/GetJar/GetJar$GetJarListener;

    .line 51
    sput-object v1, Lcom/miniclip/GetJar/GetJar;->mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

    .line 52
    sput-object v1, Lcom/miniclip/GetJar/GetJar;->dialog:Landroid/app/AlertDialog;

    .line 54
    sput-object v1, Lcom/miniclip/GetJar/GetJar;->inAppList:[Ljava/lang/String;

    .line 56
    sput-object v1, Lcom/miniclip/GetJar/GetJar;->mUser:Lcom/getjar/sdk/User;

    .line 287
    new-instance v0, Lcom/miniclip/GetJar/GetJar$5;

    invoke-direct {v0}, Lcom/miniclip/GetJar/GetJar$5;-><init>()V

    sput-object v0, Lcom/miniclip/GetJar/GetJar;->userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    return-void
.end method

.method static synthetic access$100()Lcom/miniclip/nativeJNI/InAppActivity;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

    return-object v0
.end method

.method static synthetic access$200()Landroid/app/AlertDialog;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->dialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$202(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .param p0, "x0"    # Landroid/app/AlertDialog;

    .prologue
    .line 34
    sput-object p0, Lcom/miniclip/GetJar/GetJar;->dialog:Landroid/app/AlertDialog;

    return-object p0
.end method

.method static synthetic access$300()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->items:Ljava/util/Hashtable;

    return-object v0
.end method

.method static synthetic access$402(Lcom/getjar/sdk/User;)Lcom/getjar/sdk/User;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/User;

    .prologue
    .line 34
    sput-object p0, Lcom/miniclip/GetJar/GetJar;->mUser:Lcom/getjar/sdk/User;

    return-object p0
.end method

.method public static createPickDialog(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 20
    .param p0, "itemID"    # Ljava/lang/String;
    .param p1, "managed"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "showDialog"    # I

    .prologue
    .line 186
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "itemID = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " managed = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " price = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " title = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " showDialog = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/miniclip/GetJar/GetJar;->debugLog(Ljava/lang/String;)V

    .line 188
    sget-object v3, Lcom/miniclip/GetJar/GetJar;->items:Ljava/util/Hashtable;

    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 241
    :goto_0
    return-void

    .line 191
    :cond_0
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .local v17, "_products":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/Product;>;"
    sget-boolean v3, Lcom/miniclip/GetJar/GetJar;->DEBUG:Z

    if-eqz v3, :cond_1

    const/16 v19, 0x0

    .line 198
    .local v19, "price":I
    :goto_1
    sget-object v3, Lcom/miniclip/GetJar/GetJar;->mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v3}, Lcom/miniclip/nativeJNI/InAppActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "icon_getjar"

    const-string v5, "id"

    sget-object v6, Lcom/miniclip/GetJar/GetJar;->mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v6}, Lcom/miniclip/nativeJNI/InAppActivity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    .line 199
    .local v8, "icon_getjar":I
    sget-object v3, Lcom/miniclip/GetJar/GetJar;->mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v3}, Lcom/miniclip/nativeJNI/InAppActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "icon_googlewallet"

    const-string v5, "id"

    sget-object v6, Lcom/miniclip/GetJar/GetJar;->mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v6}, Lcom/miniclip/nativeJNI/InAppActivity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v15

    .line 201
    .local v15, "icon_googlewallet":I
    const/4 v3, 0x1

    move/from16 v0, p1

    if-ne v0, v3, :cond_2

    .line 202
    new-instance v2, Lcom/getjar/sdk/LicensableProduct;

    const-string v5, "Getjar Gold"

    move/from16 v0, v19

    int-to-long v6, v0

    sget-object v9, Lcom/getjar/sdk/License$LicenseScope;->USER:Lcom/getjar/sdk/License$LicenseScope;

    move-object/from16 v3, p0

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v9}, Lcom/getjar/sdk/LicensableProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JILcom/getjar/sdk/License$LicenseScope;)V

    .line 204
    .local v2, "getJarProduct":Lcom/getjar/sdk/Product;
    new-instance v9, Lcom/getjar/sdk/LicensableProduct;

    const-string v12, "Google Play Store"

    move/from16 v0, v19

    int-to-long v13, v0

    sget-object v16, Lcom/getjar/sdk/License$LicenseScope;->USER:Lcom/getjar/sdk/License$LicenseScope;

    move-object/from16 v10, p0

    move-object/from16 v11, p2

    invoke-direct/range {v9 .. v16}, Lcom/getjar/sdk/LicensableProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JILcom/getjar/sdk/License$LicenseScope;)V

    .line 214
    .local v9, "googlePlayProduct":Lcom/getjar/sdk/Product;
    :goto_2
    move-object/from16 v0, v17

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    move-object/from16 v0, v17

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    new-instance v18, Lcom/miniclip/GetJar/PurchaseMethodAdapter;

    sget-object v3, Lcom/miniclip/GetJar/GetJar;->mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-direct {v0, v3, v1}, Lcom/miniclip/GetJar/PurchaseMethodAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 220
    .local v18, "adapter":Lcom/miniclip/GetJar/PurchaseMethodAdapter;
    const/4 v3, 0x1

    move/from16 v0, p3

    if-ne v0, v3, :cond_3

    .line 221
    sget-object v3, Lcom/miniclip/GetJar/GetJar;->mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

    new-instance v4, Lcom/miniclip/GetJar/GetJar$4;

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-direct {v4, v0, v1}, Lcom/miniclip/GetJar/GetJar$4;-><init>(Ljava/lang/String;Lcom/miniclip/GetJar/PurchaseMethodAdapter;)V

    invoke-virtual {v3, v4}, Lcom/miniclip/nativeJNI/InAppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 196
    .end local v2    # "getJarProduct":Lcom/getjar/sdk/Product;
    .end local v8    # "icon_getjar":I
    .end local v9    # "googlePlayProduct":Lcom/getjar/sdk/Product;
    .end local v15    # "icon_googlewallet":I
    .end local v18    # "adapter":Lcom/miniclip/GetJar/PurchaseMethodAdapter;
    .end local v19    # "price":I
    :cond_1
    sget-object v3, Lcom/miniclip/GetJar/GetJar;->items:Ljava/util/Hashtable;

    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v19

    goto/16 :goto_1

    .line 208
    .restart local v8    # "icon_getjar":I
    .restart local v15    # "icon_googlewallet":I
    .restart local v19    # "price":I
    :cond_2
    new-instance v2, Lcom/getjar/sdk/ConsumableProduct;

    const-string v5, "Getjar Gold"

    move/from16 v0, v19

    int-to-long v6, v0

    move-object/from16 v3, p0

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v8}, Lcom/getjar/sdk/ConsumableProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JI)V

    .line 210
    .restart local v2    # "getJarProduct":Lcom/getjar/sdk/Product;
    new-instance v9, Lcom/getjar/sdk/ConsumableProduct;

    const-string v12, "Google Play Store"

    move/from16 v0, v19

    int-to-long v13, v0

    move-object/from16 v10, p0

    move-object/from16 v11, p2

    invoke-direct/range {v9 .. v15}, Lcom/getjar/sdk/ConsumableProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JI)V

    .restart local v9    # "googlePlayProduct":Lcom/getjar/sdk/Product;
    goto :goto_2

    .line 238
    .restart local v18    # "adapter":Lcom/miniclip/GetJar/PurchaseMethodAdapter;
    :cond_3
    sget-object v3, Lcom/miniclip/GetJar/GetJar;->GETJAR_PAGE:Lcom/getjar/sdk/GetJarPage;

    invoke-virtual {v3, v2}, Lcom/getjar/sdk/GetJarPage;->setProduct(Lcom/getjar/sdk/Product;)V

    .line 239
    sget-object v3, Lcom/miniclip/GetJar/GetJar;->GETJAR_PAGE:Lcom/getjar/sdk/GetJarPage;

    invoke-virtual {v3}, Lcom/getjar/sdk/GetJarPage;->showPage()V

    goto/16 :goto_0
.end method

.method static debugLog(Ljava/lang/String;)V
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 253
    sget-boolean v0, Lcom/miniclip/GetJar/GetJar;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 254
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->GETJAR_TAG:Ljava/lang/String;

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    :cond_0
    return-void
.end method

.method public static dismissPickDialog()V
    .locals 1

    .prologue
    .line 180
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->dialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 181
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 182
    :cond_0
    return-void
.end method

.method public static getJarResponce(I)V
    .locals 2
    .param p0, "value"    # I

    .prologue
    .line 139
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

    new-instance v1, Lcom/miniclip/GetJar/GetJar$2;

    invoke-direct {v1, p0}, Lcom/miniclip/GetJar/GetJar$2;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/InAppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 157
    sget-object v0, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v1, Lcom/miniclip/GetJar/GetJar$3;

    invoke-direct {v1, p0}, Lcom/miniclip/GetJar/GetJar$3;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 177
    return-void
.end method

.method public static inAppPurchase(Ljava/lang/String;ILjava/lang/String;III)V
    .locals 7
    .param p0, "itemID"    # Ljava/lang/String;
    .param p1, "managed"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "callback"    # I
    .param p4, "self"    # I
    .param p5, "showDialog"    # I

    .prologue
    .line 246
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->mListener:Lcom/miniclip/GetJar/GetJar$GetJarListener;

    if-eqz v0, :cond_0

    .line 247
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->mListener:Lcom/miniclip/GetJar/GetJar$GetJarListener;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-interface/range {v0 .. v6}, Lcom/miniclip/GetJar/GetJar$GetJarListener;->onGetJarInAppPurchase(Ljava/lang/String;ILjava/lang/String;III)V

    .line 248
    invoke-static {p0, p1, p2, p5}, Lcom/miniclip/GetJar/GetJar;->createPickDialog(Ljava/lang/String;ILjava/lang/String;I)V

    .line 250
    :cond_0
    return-void
.end method

.method public static restorePurchases(II)I
    .locals 8
    .param p0, "callback"    # I
    .param p1, "self"    # I

    .prologue
    .line 110
    sget-object v6, Lcom/miniclip/GetJar/GetJar;->licensing:Lcom/getjar/sdk/Licensing;

    if-nez v6, :cond_1

    .line 111
    const/4 v1, 0x0

    .line 135
    :cond_0
    :goto_0
    return v1

    .line 113
    :cond_1
    const/4 v1, 0x0

    .line 116
    .local v1, "count":I
    :try_start_0
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->inAppList:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v5, :cond_0

    aget-object v4, v0, v2

    .line 117
    .local v4, "itemId":Ljava/lang/String;
    sget-object v6, Lcom/miniclip/GetJar/GetJar;->licensing:Lcom/getjar/sdk/Licensing;

    invoke-virtual {v6, v4}, Lcom/getjar/sdk/Licensing;->isUnmanagedProductLicensed(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 120
    .local v3, "isLicensed":Z
    if-nez v3, :cond_2

    .line 116
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 123
    :cond_2
    sget-object v6, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v7, Lcom/miniclip/GetJar/GetJar$1;

    invoke-direct {v7, p0, p1, v4}, Lcom/miniclip/GetJar/GetJar$1;-><init>(IILjava/lang/String;)V

    invoke-virtual {v6, v7}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 132
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "isLicensed":Z
    .end local v4    # "itemId":Ljava/lang/String;
    .end local v5    # "len$":I
    :catch_0
    move-exception v6

    goto :goto_0
.end method

.method public static setup(Lcom/miniclip/nativeJNI/InAppActivity;Lcom/miniclip/GetJar/GetJar$GetJarListener;Ljava/lang/String;Ljava/lang/String;Ljava/util/Hashtable;ZLandroid/os/ResultReceiver;)V
    .locals 9
    .param p0, "activity"    # Lcom/miniclip/nativeJNI/InAppActivity;
    .param p1, "listener"    # Lcom/miniclip/GetJar/GetJar$GetJarListener;
    .param p2, "appToken"    # Ljava/lang/String;
    .param p3, "encryptionKey"    # Ljava/lang/String;
    .param p5, "useRecommendedPrices"    # Z
    .param p6, "resultReceiver"    # Landroid/os/ResultReceiver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miniclip/nativeJNI/InAppActivity;",
            "Lcom/miniclip/GetJar/GetJar$GetJarListener;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;Z",
            "Landroid/os/ResultReceiver;",
            ")V"
        }
    .end annotation

    .prologue
    .line 65
    .local p4, "items":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/lang/Integer;>;"
    sput-object p0, Lcom/miniclip/GetJar/GetJar;->mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

    .line 66
    sput-object p1, Lcom/miniclip/GetJar/GetJar;->mListener:Lcom/miniclip/GetJar/GetJar$GetJarListener;

    .line 67
    sput-object p2, Lcom/miniclip/GetJar/GetJar;->APP_TOKEN:Ljava/lang/String;

    .line 68
    sput-object p3, Lcom/miniclip/GetJar/GetJar;->ENCRYPTION_KEY:Ljava/lang/String;

    .line 69
    sput-object p4, Lcom/miniclip/GetJar/GetJar;->items:Ljava/util/Hashtable;

    .line 72
    :try_start_0
    sget-object v6, Lcom/miniclip/GetJar/GetJar;->APP_TOKEN:Ljava/lang/String;

    sget-object v7, Lcom/miniclip/GetJar/GetJar;->ENCRYPTION_KEY:Ljava/lang/String;

    sget-object v8, Lcom/miniclip/GetJar/GetJar;->mActivity:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-static {v6, v7, v8, p6}, Lcom/getjar/sdk/GetJarManager;->createContext(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;)Lcom/getjar/sdk/GetJarContext;

    move-result-object v6

    sput-object v6, Lcom/miniclip/GetJar/GetJar;->GETJAR_CONTEXT:Lcom/getjar/sdk/GetJarContext;

    .line 73
    new-instance v6, Lcom/getjar/sdk/GetJarPage;

    sget-object v7, Lcom/miniclip/GetJar/GetJar;->GETJAR_CONTEXT:Lcom/getjar/sdk/GetJarContext;

    invoke-direct {v6, v7}, Lcom/getjar/sdk/GetJarPage;-><init>(Lcom/getjar/sdk/GetJarContext;)V

    sput-object v6, Lcom/miniclip/GetJar/GetJar;->GETJAR_PAGE:Lcom/getjar/sdk/GetJarPage;

    .line 74
    new-instance v6, Lcom/getjar/sdk/Licensing;

    sget-object v7, Lcom/miniclip/GetJar/GetJar;->GETJAR_CONTEXT:Lcom/getjar/sdk/GetJarContext;

    invoke-direct {v6, v7}, Lcom/getjar/sdk/Licensing;-><init>(Lcom/getjar/sdk/GetJarContext;)V

    sput-object v6, Lcom/miniclip/GetJar/GetJar;->licensing:Lcom/getjar/sdk/Licensing;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :try_start_1
    new-instance v6, Lcom/getjar/sdk/UserAuth;

    sget-object v7, Lcom/miniclip/GetJar/GetJar;->GETJAR_CONTEXT:Lcom/getjar/sdk/GetJarContext;

    invoke-direct {v6, v7}, Lcom/getjar/sdk/UserAuth;-><init>(Lcom/getjar/sdk/GetJarContext;)V

    const-string v7, "Pick an email account for using with GetJar"

    sget-object v8, Lcom/miniclip/GetJar/GetJar;->userAuthListener:Lcom/getjar/sdk/listener/EnsureUserAuthListener;

    invoke-virtual {v6, v7, v8}, Lcom/getjar/sdk/UserAuth;->ensureUserAsync(Ljava/lang/String;Lcom/getjar/sdk/listener/EnsureUserAuthListener;)Ljava/util/concurrent/Future;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 83
    :goto_0
    if-eqz p5, :cond_1

    .line 85
    :try_start_2
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .local v5, "prices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/Pricing;>;"
    invoke-virtual {p4}, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 89
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    :cond_0
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 91
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 93
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    new-instance v4, Lcom/getjar/sdk/Pricing;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-direct {v4, v6}, Lcom/getjar/sdk/Pricing;-><init>(I)V

    .line 95
    .local v4, "price":Lcom/getjar/sdk/Pricing;
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 96
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 104
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    .end local v4    # "price":Lcom/getjar/sdk/Pricing;
    .end local v5    # "prices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/Pricing;>;"
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 107
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_2
    return-void

    .line 100
    .restart local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    .restart local v5    # "prices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/Pricing;>;"
    :cond_2
    :try_start_3
    new-instance v3, Lcom/getjar/sdk/Localization;

    sget-object v6, Lcom/miniclip/GetJar/GetJar;->GETJAR_CONTEXT:Lcom/getjar/sdk/GetJarContext;

    invoke-direct {v3, v6}, Lcom/getjar/sdk/Localization;-><init>(Lcom/getjar/sdk/GetJarContext;)V

    .line 101
    .local v3, "localization":Lcom/getjar/sdk/Localization;
    new-instance v6, Lcom/miniclip/GetJar/GetJar$PricingCallback;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Lcom/miniclip/GetJar/GetJar$PricingCallback;-><init>(Lcom/miniclip/GetJar/GetJar$1;)V

    invoke-virtual {v3, v5, v6}, Lcom/getjar/sdk/Localization;->getRecommendedPricesAsync(Ljava/util/Collection;Lcom/getjar/sdk/listener/RecommendedPricesListener;)Ljava/util/concurrent/Future;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    .line 80
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    .end local v3    # "localization":Lcom/getjar/sdk/Localization;
    .end local v5    # "prices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/Pricing;>;"
    :catch_1
    move-exception v6

    goto :goto_0
.end method

.method public static showOfferWall(Lcom/getjar/sdk/Product;)V
    .locals 1
    .param p0, "product"    # Lcom/getjar/sdk/Product;

    .prologue
    .line 258
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->GETJAR_PAGE:Lcom/getjar/sdk/GetJarPage;

    invoke-virtual {v0, p0}, Lcom/getjar/sdk/GetJarPage;->setProduct(Lcom/getjar/sdk/Product;)V

    .line 259
    sget-object v0, Lcom/miniclip/GetJar/GetJar;->GETJAR_PAGE:Lcom/getjar/sdk/GetJarPage;

    invoke-virtual {v0}, Lcom/getjar/sdk/GetJarPage;->showPage()V

    .line 260
    return-void
.end method
