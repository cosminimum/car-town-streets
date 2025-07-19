.class Lcom/apsalar/sdk/ApsalarSessionInfo;
.super Ljava/lang/Object;
.source "Apsalar.java"

# interfaces
.implements Lcom/apsalar/sdk/ApsalarJSON;


# instance fields
.field protected abi:Ljava/lang/String;

.field protected apiKey:Ljava/lang/String;

.field protected appName:Ljava/lang/String;

.field protected appVersion:Ljava/lang/String;

.field protected brand:Ljava/lang/String;

.field protected clsPackage:Ljava/lang/String;

.field protected connType:Ljava/lang/String;

.field protected device:Ljava/lang/String;

.field protected deviceId:Ljava/lang/String;

.field protected known_items:Lorg/json/JSONObject;

.field protected manufacturer:Ljava/lang/String;

.field protected model:Ljava/lang/String;

.field protected osVersion:Ljava/lang/String;

.field protected platform:Ljava/lang/String;

.field protected product:Ljava/lang/String;

.field protected retType:Ljava/lang/String;

.field protected sdkVersion:Ljava/lang/String;

.field protected secret:Ljava/lang/String;

.field protected sessionId:Ljava/lang/String;

.field protected sessionStart:J


# direct methods
.method protected constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 631
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 562
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionStart:J

    .line 582
    const-string v0, "4.0.0"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sdkVersion:Ljava/lang/String;

    .line 632
    iput-object p2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->apiKey:Ljava/lang/String;

    .line 633
    iput-object p3, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->secret:Ljava/lang/String;

    .line 635
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 636
    const-string v0, "Android"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->platform:Ljava/lang/String;

    .line 637
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    .line 639
    :try_start_0
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appVersion:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 644
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "android_id"

    invoke-static {v0, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    .line 645
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 646
    const-string v0, "unspecified"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    .line 649
    :cond_0
    invoke-static {}, Lcom/apsalar/sdk/Apsalar;->getNewSessionId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionId:Ljava/lang/String;

    .line 650
    const-string v0, "json"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->retType:Ljava/lang/String;

    .line 652
    const-string v0, "wifi"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->connType:Ljava/lang/String;

    .line 653
    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 654
    invoke-virtual {v0, v3}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v0

    .line 655
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 656
    const-string v0, "wwan"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->connType:Ljava/lang/String;

    .line 659
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    const/16 v2, 0x80

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appName:Ljava/lang/String;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_2

    .line 669
    :goto_1
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->osVersion:Ljava/lang/String;

    .line 670
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->brand:Ljava/lang/String;

    .line 671
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->device:Ljava/lang/String;

    .line 673
    :try_start_2
    const-class v0, Landroid/os/Build;

    const-string v1, "CPU_ABI"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const-class v1, Landroid/os/Build;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->abi:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3

    .line 679
    :goto_2
    :try_start_3
    const-class v0, Landroid/os/Build;

    const-string v1, "MANUFACTURER"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const-class v1, Landroid/os/Build;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->manufacturer:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_4

    .line 685
    :goto_3
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->model:Ljava/lang/String;

    .line 686
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->product:Ljava/lang/String;

    .line 689
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->abi:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->abi:Ljava/lang/String;

    :goto_4
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->abi:Ljava/lang/String;

    .line 690
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->platform:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->platform:Ljava/lang/String;

    :goto_5
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->platform:Ljava/lang/String;

    .line 691
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    :goto_6
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    .line 692
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appVersion:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appVersion:Ljava/lang/String;

    :goto_7
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appVersion:Ljava/lang/String;

    .line 693
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    :goto_8
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    .line 694
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionId:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionId:Ljava/lang/String;

    :goto_9
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionId:Ljava/lang/String;

    .line 695
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->retType:Ljava/lang/String;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->retType:Ljava/lang/String;

    :goto_a
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->retType:Ljava/lang/String;

    .line 696
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->connType:Ljava/lang/String;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->connType:Ljava/lang/String;

    :goto_b
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->connType:Ljava/lang/String;

    .line 697
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appName:Ljava/lang/String;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appName:Ljava/lang/String;

    :goto_c
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appName:Ljava/lang/String;

    .line 698
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->osVersion:Ljava/lang/String;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->osVersion:Ljava/lang/String;

    :goto_d
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->osVersion:Ljava/lang/String;

    .line 699
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->brand:Ljava/lang/String;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->brand:Ljava/lang/String;

    :goto_e
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->brand:Ljava/lang/String;

    .line 700
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->device:Ljava/lang/String;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->device:Ljava/lang/String;

    :goto_f
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->device:Ljava/lang/String;

    .line 701
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->manufacturer:Ljava/lang/String;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->manufacturer:Ljava/lang/String;

    :goto_10
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->manufacturer:Ljava/lang/String;

    .line 702
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->model:Ljava/lang/String;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->model:Ljava/lang/String;

    :goto_11
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->model:Ljava/lang/String;

    .line 703
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->product:Ljava/lang/String;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->product:Ljava/lang/String;

    :goto_12
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->product:Ljava/lang/String;

    .line 704
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sdkVersion:Ljava/lang/String;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sdkVersion:Ljava/lang/String;

    :goto_13
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sdkVersion:Ljava/lang/String;

    .line 705
    return-void

    .line 641
    :catch_0
    move-exception v0

    .line 642
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appVersion:Ljava/lang/String;

    goto/16 :goto_0

    .line 663
    :catch_1
    move-exception v0

    .line 664
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appName:Ljava/lang/String;

    goto/16 :goto_1

    .line 666
    :catch_2
    move-exception v0

    .line 667
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appName:Ljava/lang/String;

    goto/16 :goto_1

    .line 675
    :catch_3
    move-exception v0

    .line 676
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->abi:Ljava/lang/String;

    goto/16 :goto_2

    .line 682
    :catch_4
    move-exception v0

    .line 683
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->manufacturer:Ljava/lang/String;

    goto/16 :goto_3

    .line 689
    :cond_2
    const-string v0, "unknown"

    goto/16 :goto_4

    .line 690
    :cond_3
    const-string v0, "Android"

    goto/16 :goto_5

    .line 691
    :cond_4
    const-string v0, "unknown"

    goto/16 :goto_6

    .line 692
    :cond_5
    const-string v0, "unknown"

    goto/16 :goto_7

    .line 693
    :cond_6
    const-string v0, "unspecified"

    goto/16 :goto_8

    .line 694
    :cond_7
    const-string v0, "unspecified"

    goto/16 :goto_9

    .line 695
    :cond_8
    const-string v0, "json"

    goto/16 :goto_a

    .line 696
    :cond_9
    const-string v0, "wifi"

    goto/16 :goto_b

    .line 697
    :cond_a
    const-string v0, "unknown"

    goto :goto_c

    .line 698
    :cond_b
    const-string v0, "unknown"

    goto :goto_d

    .line 699
    :cond_c
    const-string v0, "unknown"

    goto :goto_e

    .line 700
    :cond_d
    const-string v0, "unknown"

    goto :goto_f

    .line 701
    :cond_e
    const-string v0, "unknown"

    goto :goto_10

    .line 702
    :cond_f
    const-string v0, "unknown"

    goto :goto_11

    .line 703
    :cond_10
    const-string v0, "unknown"

    goto :goto_12

    .line 704
    :cond_11
    const-string v0, "unspecified"

    goto :goto_13
.end method

.method protected constructor <init>(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 586
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 562
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionStart:J

    .line 582
    const-string v0, "4.0.0"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sdkVersion:Ljava/lang/String;

    .line 588
    :try_start_0
    const-string v0, "sessionStart"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionStart:J

    .line 590
    iput-object p2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->apiKey:Ljava/lang/String;

    .line 591
    iput-object p3, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->secret:Ljava/lang/String;

    .line 593
    const-string v0, "abi"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "abi"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->abi:Ljava/lang/String;

    .line 594
    const-string v0, "platform"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "platform"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->platform:Ljava/lang/String;

    .line 596
    const-string v0, "clsPackage"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "clsPackage"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_2
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    .line 598
    const-string v0, "appVersion"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "appVersion"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_3
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appVersion:Ljava/lang/String;

    .line 600
    const-string v0, "deviceId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "deviceId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_4
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    .line 602
    const-string v0, "sessionId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "sessionId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_5
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionId:Ljava/lang/String;

    .line 604
    const-string v0, "retType"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "retType"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_6
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->retType:Ljava/lang/String;

    .line 606
    const-string v0, "connType"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "connType"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_7
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->connType:Ljava/lang/String;

    .line 608
    const-string v0, "appName"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "appName"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_8
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appName:Ljava/lang/String;

    .line 610
    const-string v0, "osVersion"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "osVersion"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_9
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->osVersion:Ljava/lang/String;

    .line 612
    const-string v0, "brand"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "brand"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_a
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->brand:Ljava/lang/String;

    .line 614
    const-string v0, "device"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "device"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_b
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->device:Ljava/lang/String;

    .line 616
    const-string v0, "manufacturer"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "manufacturer"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_c
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->manufacturer:Ljava/lang/String;

    .line 618
    const-string v0, "model"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "model"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_d
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->model:Ljava/lang/String;

    .line 620
    const-string v0, "product"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string v0, "product"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_e
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->product:Ljava/lang/String;

    .line 622
    const-string v0, "sdkVersion"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    const-string v0, "sdkVersion"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_f
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sdkVersion:Ljava/lang/String;

    .line 629
    :goto_10
    return-void

    .line 593
    :cond_0
    const-string v0, "unknown"

    goto/16 :goto_0

    .line 594
    :cond_1
    const-string v0, "Android"

    goto/16 :goto_1

    .line 596
    :cond_2
    const-string v0, "unknown"

    goto/16 :goto_2

    .line 598
    :cond_3
    const-string v0, "unknown"

    goto/16 :goto_3

    .line 600
    :cond_4
    const-string v0, "unspecified"

    goto/16 :goto_4

    .line 602
    :cond_5
    const-string v0, "unspecified"

    goto/16 :goto_5

    .line 604
    :cond_6
    const-string v0, "json"

    goto/16 :goto_6

    .line 606
    :cond_7
    const-string v0, "wifi"

    goto/16 :goto_7

    .line 608
    :cond_8
    const-string v0, "unknown"

    goto/16 :goto_8

    .line 610
    :cond_9
    const-string v0, "unknown"

    goto/16 :goto_9

    .line 612
    :cond_a
    const-string v0, "unknown"

    goto :goto_a

    .line 614
    :cond_b
    const-string v0, "unknown"

    goto :goto_b

    .line 616
    :cond_c
    const-string v0, "unknown"

    goto :goto_c

    .line 618
    :cond_d
    const-string v0, "unknown"

    goto :goto_d

    .line 620
    :cond_e
    const-string v0, "unknown"

    goto :goto_e

    .line 622
    :cond_f
    const-string v0, "unspecified"
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_f

    .line 625
    :catch_0
    move-exception v0

    goto :goto_10
.end method


# virtual methods
.method public toJSON()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 708
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 711
    :try_start_0
    const-string v1, "sessionStart"

    iget-wide v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionStart:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 713
    const-string v1, "apiKey"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->apiKey:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 714
    const-string v1, "secret"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->secret:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 716
    const-string v1, "abi"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->abi:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 717
    const-string v1, "platform"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->platform:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 718
    const-string v1, "clsPackage"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 719
    const-string v1, "appVersion"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appVersion:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 720
    const-string v1, "deviceId"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 721
    const-string v1, "sessionId"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 722
    const-string v1, "retType"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->retType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 723
    const-string v1, "connType"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->connType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 724
    const-string v1, "appName"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->appName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 725
    const-string v1, "osVersion"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->osVersion:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 726
    const-string v1, "brand"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->brand:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 727
    const-string v1, "device"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->device:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 728
    const-string v1, "manufacturer"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->manufacturer:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 729
    const-string v1, "model"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->model:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 730
    const-string v1, "product"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->product:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 731
    const-string v1, "sdkVersion"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSessionInfo;->sdkVersion:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 739
    :goto_0
    return-object v0

    .line 733
    :catch_0
    move-exception v1

    goto :goto_0
.end method
