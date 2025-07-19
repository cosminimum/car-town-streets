.class public Lcom/getjar/sdk/data/DeviceMetadata;
.super Ljava/lang/Object;
.source "DeviceMetadata.java"


# static fields
.field public static KEY_ANDROID_DEVICE_ANDROID_ID:Ljava/lang/String;

.field public static KEY_ANDROID_DEVICE_BOARD:Ljava/lang/String;

.field public static KEY_ANDROID_DEVICE_BRAND:Ljava/lang/String;

.field public static KEY_ANDROID_DEVICE_DEVICE_ID:Ljava/lang/String;

.field public static KEY_ANDROID_DEVICE_HARDWARE:Ljava/lang/String;

.field public static KEY_ANDROID_DEVICE_MANUFACTURER:Ljava/lang/String;

.field public static KEY_ANDROID_DEVICE_MODEL:Ljava/lang/String;

.field public static KEY_ANDROID_DEVICE_PRODUCT:Ljava/lang/String;

.field public static KEY_ANDROID_DEVICE_SERIAL_NUMBER:Ljava/lang/String;

.field public static KEY_ANDROID_OS_INCREMENTAL:Ljava/lang/String;

.field public static KEY_ANDROID_OS_RELEASE:Ljava/lang/String;

.field public static KEY_ANDROID_OS_SDK_INT:Ljava/lang/String;

.field public static KEY_DEVICE_PLATFORM:Ljava/lang/String;

.field public static KEY_DEVICE_PLATFORM_VERSION:Ljava/lang/String;


# instance fields
.field private final _context:Landroid/content/Context;

.field private _deviceMetadata:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _deviceMetadataWithReliability:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/MetadataValue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-string v0, "device.platform"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_DEVICE_PLATFORM:Ljava/lang/String;

    .line 45
    const-string v0, "device.platform_version"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_DEVICE_PLATFORM_VERSION:Ljava/lang/String;

    .line 47
    const-string v0, "android.device.android_id"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_ANDROID_ID:Ljava/lang/String;

    .line 48
    const-string v0, "android.device.board"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_BOARD:Ljava/lang/String;

    .line 49
    const-string v0, "android.device.brand"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_BRAND:Ljava/lang/String;

    .line 50
    const-string v0, "android.device.device_id"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_DEVICE_ID:Ljava/lang/String;

    .line 51
    const-string v0, "android.device.hardware"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_HARDWARE:Ljava/lang/String;

    .line 52
    const-string v0, "android.device.manufacturer"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_MANUFACTURER:Ljava/lang/String;

    .line 53
    const-string v0, "android.device.model"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_MODEL:Ljava/lang/String;

    .line 54
    const-string v0, "android.device.product"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_PRODUCT:Ljava/lang/String;

    .line 55
    const-string v0, "android.device.serial_number"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_SERIAL_NUMBER:Ljava/lang/String;

    .line 56
    const-string v0, "android.os.incremental"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_OS_INCREMENTAL:Ljava/lang/String;

    .line 57
    const-string v0, "android.os.release"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_OS_RELEASE:Ljava/lang/String;

    .line 58
    const-string v0, "android.os.sdk_int"

    sput-object v0, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_OS_SDK_INT:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x0

    const/16 v9, 0xe

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    .line 62
    iput-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    .line 66
    iput-object p1, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_context:Landroid/content/Context;

    .line 67
    invoke-static {p1}, Lcom/getjar/sdk/utilities/OverridesUtility;->initialize(Landroid/content/Context;)V

    .line 70
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/DeviceMetadata;->findSdkInt(Landroid/content/Context;)I

    move-result v4

    .line 71
    .local v4, "sdkInt":I
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/DeviceMetadata;->findHardware(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 72
    .local v2, "hardware":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/DeviceMetadata;->findManufacturer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 75
    .local v3, "manufacturer":Ljava/lang/String;
    invoke-direct {p0, p1, v4}, Lcom/getjar/sdk/data/DeviceMetadata;->findSerialNo(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v5

    .line 76
    .local v5, "serialNumber":Ljava/lang/String;
    invoke-static {v5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 77
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "Failed to get a serial number"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 81
    :cond_0
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/DeviceMetadata;->findAndroidId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "androidId":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 83
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "Failed to get the Android ID"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 87
    :cond_1
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/DeviceMetadata;->findDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, "deviceId":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 89
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "Failed to get the device ID [TelephonyManager.getDeviceId()]"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 92
    :cond_2
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6, v9}, Ljava/util/HashMap;-><init>(I)V

    iput-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    .line 93
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_DEVICE_PLATFORM:Ljava/lang/String;

    const-string v8, "android"

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_DEVICE_PLATFORM_VERSION:Ljava/lang/String;

    sget-object v8, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_ANDROID_ID:Ljava/lang/String;

    invoke-interface {v6, v7, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_BOARD:Ljava/lang/String;

    sget-object v8, Landroid/os/Build;->BOARD:Ljava/lang/String;

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_BRAND:Ljava/lang/String;

    sget-object v8, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_DEVICE_ID:Ljava/lang/String;

    invoke-interface {v6, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_HARDWARE:Ljava/lang/String;

    invoke-interface {v6, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_MANUFACTURER:Ljava/lang/String;

    invoke-interface {v6, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_MODEL:Ljava/lang/String;

    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_PRODUCT:Ljava/lang/String;

    sget-object v8, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_SERIAL_NUMBER:Ljava/lang/String;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_OS_INCREMENTAL:Ljava/lang/String;

    sget-object v8, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_OS_RELEASE:Ljava/lang/String;

    sget-object v8, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_OS_SDK_INT:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    const-string v7, "legacy.device.user_agent"

    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;

    move-result-object v8

    invoke-virtual {v8, p1}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getWebKitUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6, v9}, Ljava/util/HashMap;-><init>(I)V

    iput-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    .line 110
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_DEVICE_PLATFORM:Ljava/lang/String;

    const-string v8, "android"

    invoke-direct {p0, v8}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_DEVICE_PLATFORM_VERSION:Ljava/lang/String;

    sget-object v8, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-direct {p0, v8}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_ANDROID_ID:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_BOARD:Ljava/lang/String;

    sget-object v8, Landroid/os/Build;->BOARD:Ljava/lang/String;

    invoke-direct {p0, v8}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_BRAND:Ljava/lang/String;

    sget-object v8, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-direct {p0, v8}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_DEVICE_ID:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_HARDWARE:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_MANUFACTURER:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_MODEL:Ljava/lang/String;

    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-direct {p0, v8}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_PRODUCT:Ljava/lang/String;

    sget-object v8, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-direct {p0, v8}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_DEVICE_SERIAL_NUMBER:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_OS_INCREMENTAL:Ljava/lang/String;

    sget-object v8, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    invoke-direct {p0, v8}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_OS_RELEASE:Ljava/lang/String;

    sget-object v8, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-direct {p0, v8}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    sget-object v7, Lcom/getjar/sdk/data/DeviceMetadata;->KEY_ANDROID_OS_SDK_INT:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    iget-object v6, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    const-string v7, "legacy.device.user_agent"

    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;

    move-result-object v8

    invoke-virtual {v8, p1}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getWebKitUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    return-void
.end method

.method private findAndroidId(Landroid/content/Context;)Ljava/lang/String;
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x1

    .line 188
    const-string v2, "identity.android.id"

    invoke-static {v2}, Lcom/getjar/sdk/utilities/OverridesUtility;->getValueFakeID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 189
    .local v1, "overrideAndroidID":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 190
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "[*** OVERRIDE ***] Override value being used: \'identity.android.id\' = \'%1$s\'"

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 198
    .end local v1    # "overrideAndroidID":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 194
    .restart local v1    # "overrideAndroidID":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "android_id"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 195
    .local v0, "androidID":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-gt v2, v6, :cond_2

    .line 196
    :cond_1
    const-string v1, ""

    goto :goto_0

    :cond_2
    move-object v1, v0

    .line 198
    goto :goto_0
.end method

.method private findDeviceId(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 167
    const-string v3, "identity.device.id"

    invoke-static {v3}, Lcom/getjar/sdk/utilities/OverridesUtility;->getValueFakeID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 168
    .local v1, "overrideDeviceID":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 169
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "[*** OVERRIDE ***] Override value being used: \'identity.device.id\' = \'%1$s\'"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 178
    .end local v1    # "overrideDeviceID":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 173
    .restart local v1    # "overrideDeviceID":Ljava/lang/String;
    :cond_0
    const-string v0, "android.permission.READ_PHONE_STATE"

    .line 174
    .local v0, "READ_PHONE_PERMISSION":Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 175
    const-string v3, "phone"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 176
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 178
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_1
    const-string v1, ""

    goto :goto_0
.end method

.method private findHardware(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 255
    const-string v2, ""

    .line 257
    .local v2, "hardware":Ljava/lang/String;
    :try_start_0
    const-class v3, Landroid/os/Build;

    const-string v4, "HARDWARE"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 258
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :goto_0
    return-object v2

    .line 259
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method private findManufacturer(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 264
    const-string v2, ""

    .line 266
    .local v2, "manufacturer":Ljava/lang/String;
    :try_start_0
    const-class v3, Landroid/os/Build;

    const-string v4, "MANUFACTURER"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 267
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :goto_0
    return-object v2

    .line 268
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method private findSdkInt(Landroid/content/Context;)I
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 244
    const/4 v1, 0x3

    .line 246
    .local v1, "sdkLevel":I
    :try_start_0
    const-class v3, Landroid/os/Build$VERSION;

    const-string v4, "SDK_INT"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 247
    .local v2, "sdkLevelField":Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 251
    .end local v2    # "sdkLevelField":Ljava/lang/reflect/Field;
    :goto_0
    return v1

    .line 248
    :catch_0
    move-exception v0

    .line 249
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v3, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    goto :goto_0

    :catch_1
    move-exception v3

    goto :goto_0
.end method

.method private findSerialNo(Landroid/content/Context;I)Ljava/lang/String;
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sdkLevel"    # I

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 209
    const-string v6, "identity.serial.number"

    invoke-static {v6}, Lcom/getjar/sdk/utilities/OverridesUtility;->getValueFakeID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 210
    .local v4, "overrideSerialNumber":Ljava/lang/String;
    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 211
    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "[*** OVERRIDE ***] Override value being used: \'identity.serial.number\' = \'%1$s\'"

    new-array v10, v10, [Ljava/lang/Object;

    aput-object v4, v10, v11

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 237
    .end local v4    # "overrideSerialNumber":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 217
    .restart local v4    # "overrideSerialNumber":Ljava/lang/String;
    :cond_0
    const/16 v6, 0x9

    if-lt p2, v6, :cond_1

    .line 220
    :try_start_0
    const-class v6, Landroid/os/Build;

    const-string v7, "SERIAL"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 221
    .local v2, "field":Ljava/lang/reflect/Field;
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v4, v6

    goto :goto_0

    .line 225
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :cond_1
    const-string v6, "android.os.SystemProperties"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 226
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v6, "get"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Ljava/lang/String;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-class v9, Ljava/lang/String;

    aput-object v9, v7, v8

    invoke-virtual {v1, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 227
    .local v3, "get":Ljava/lang/reflect/Method;
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v8, "ro.serialno"

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const/4 v8, 0x0

    aput-object v8, v6, v7

    invoke-virtual {v3, v1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v5, v0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .local v5, "serialNumber":Ljava/lang/String;
    move-object v4, v5

    .line 228
    goto :goto_0

    .line 236
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "get":Ljava/lang/reflect/Method;
    .end local v5    # "serialNumber":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 237
    :goto_1
    const-string v4, ""

    goto :goto_0

    .line 235
    :catch_1
    move-exception v6

    goto :goto_1

    .line 234
    :catch_2
    move-exception v6

    goto :goto_1

    .line 233
    :catch_3
    move-exception v6

    goto :goto_1

    .line 232
    :catch_4
    move-exception v6

    goto :goto_1
.end method

.method private getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 130
    new-instance v1, Lcom/getjar/sdk/data/MetadataValue;

    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->NOT_AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    :goto_0
    invoke-direct {v1, p1, v0}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    return-object v1

    :cond_0
    sget-object v0, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    goto :goto_0
.end method


# virtual methods
.method public getMetadata()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 134
    iget-object v0, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    const-string v1, "legacy.device.user_agent"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    iget-object v0, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    const-string v1, "legacy.device.user_agent"

    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;

    move-result-object v2

    iget-object v3, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_context:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getWebKitUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadata:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getMetadataValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 156
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadata()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getMetadataWithReliability()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/MetadataValue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 142
    iget-object v1, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    const-string v2, "legacy.device.user_agent"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/MetadataValue;

    .line 143
    .local v0, "value":Lcom/getjar/sdk/data/MetadataValue;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/MetadataValue;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 144
    :cond_0
    iget-object v1, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    const-string v2, "legacy.device.user_agent"

    invoke-static {}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getInstance()Lcom/getjar/sdk/comm/UserAgentValuesManager;

    move-result-object v3

    iget-object v4, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_context:Landroid/content/Context;

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->getWebKitUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataValueInstance(Ljava/lang/String;)Lcom/getjar/sdk/data/MetadataValue;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    :cond_1
    iget-object v1, p0, Lcom/getjar/sdk/data/DeviceMetadata;->_deviceMetadataWithReliability:Ljava/util/Map;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    return-object v1
.end method

.method public toJsonString()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 274
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadata()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/utilities/Utility;->mapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toJsonStringWithReliabilities()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 279
    invoke-virtual {p0}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataWithReliability()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/utilities/Utility;->metadataMapToJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
