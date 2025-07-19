.class public final Lcom/AdX/tag/AdXConnect;
.super Ljava/lang/Object;
.source "AdXConnect.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/AdX/tag/AdXConnect$ConnectEventTask;,
        Lcom/AdX/tag/AdXConnect$ConnectTask;
    }
.end annotation


# static fields
.field public static final ATTRIBUTION_ID_COLUMN_NAME:Ljava/lang/String; = "aid"

.field public static final ATTRIBUTION_ID_CONTENT_URI:Landroid/net/Uri;

.field private static AdXConnectEventInstance:Lcom/AdX/tag/AdXConnect;

.field private static AdXConnectInstance:Lcom/AdX/tag/AdXConnect;

.field private static AdXURLConnection:Lcom/AdX/tag/AdXURLConnection;

.field private static AdX_PREFERENCE:Ljava/lang/String;

.field private static MODREFERRAL:Ljava/lang/String;

.field private static RECEIVER_DONE:Ljava/lang/String;

.field private static REFERRAL_URL:Ljava/lang/String;

.field private static UPDATE:Ljava/lang/String;

.field private static referralURL:Ljava/lang/String;


# instance fields
.field private AdXClickURL:Ljava/lang/String;

.field private SEND_TAG:Ljava/lang/String;

.field private androidID:Ljava/lang/String;

.field private appID:Ljava/lang/String;

.field private appVersion:Ljava/lang/String;

.field private clientID:Ljava/lang/String;

.field private connectEventTask:Lcom/AdX/tag/AdXConnect$ConnectEventTask;

.field private connectTask:Lcom/AdX/tag/AdXConnect$ConnectTask;

.field private context:Landroid/content/Context;

.field private deviceCountryCode:Ljava/lang/String;

.field private deviceID:Ljava/lang/String;

.field private deviceLanguage:Ljava/lang/String;

.field private deviceName:Ljava/lang/String;

.field private deviceOSVersion:Ljava/lang/String;

.field private deviceScreenDensity:Ljava/lang/String;

.field private deviceScreenLayoutSize:Ljava/lang/String;

.field private deviceType:Ljava/lang/String;

.field private fbattribution:Ljava/lang/String;

.field private libraryVersion:Ljava/lang/String;

.field private tagVersion:Ljava/lang/String;

.field private urlParams:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 40
    sput-object v0, Lcom/AdX/tag/AdXConnect;->AdXConnectInstance:Lcom/AdX/tag/AdXConnect;

    .line 41
    sput-object v0, Lcom/AdX/tag/AdXConnect;->AdXConnectEventInstance:Lcom/AdX/tag/AdXConnect;

    .line 42
    sput-object v0, Lcom/AdX/tag/AdXConnect;->AdXURLConnection:Lcom/AdX/tag/AdXURLConnection;

    .line 61
    const-string v0, "content://com.facebook.katana.provider.AttributionIdProvider"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/AdX/tag/AdXConnect;->ATTRIBUTION_ID_CONTENT_URI:Landroid/net/Uri;

    .line 64
    const-string v0, ""

    sput-object v0, Lcom/AdX/tag/AdXConnect;->referralURL:Ljava/lang/String;

    .line 66
    const-string v0, "AdXPrefrences"

    sput-object v0, Lcom/AdX/tag/AdXConnect;->AdX_PREFERENCE:Ljava/lang/String;

    .line 68
    const-string v0, "AdXReferral"

    sput-object v0, Lcom/AdX/tag/AdXConnect;->MODREFERRAL:Ljava/lang/String;

    .line 69
    const-string v0, "ReceiverDone"

    sput-object v0, Lcom/AdX/tag/AdXConnect;->RECEIVER_DONE:Ljava/lang/String;

    .line 70
    const-string v0, "AdXUpdate"

    sput-object v0, Lcom/AdX/tag/AdXConnect;->UPDATE:Ljava/lang/String;

    .line 71
    const-string v0, "InstallReferral"

    sput-object v0, Lcom/AdX/tag/AdXConnect;->REFERRAL_URL:Ljava/lang/String;

    .line 34
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;I)V
    .locals 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "update"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v4, p0, Lcom/AdX/tag/AdXConnect;->connectTask:Lcom/AdX/tag/AdXConnect$ConnectTask;

    .line 37
    iput-object v4, p0, Lcom/AdX/tag/AdXConnect;->connectEventTask:Lcom/AdX/tag/AdXConnect$ConnectEventTask;

    .line 38
    iput-object v4, p0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    .line 45
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    .line 46
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->deviceName:Ljava/lang/String;

    .line 47
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->deviceType:Ljava/lang/String;

    .line 48
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->deviceOSVersion:Ljava/lang/String;

    .line 49
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->deviceCountryCode:Ljava/lang/String;

    .line 50
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->deviceLanguage:Ljava/lang/String;

    .line 51
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->androidID:Ljava/lang/String;

    .line 52
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->appID:Ljava/lang/String;

    .line 53
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->clientID:Ljava/lang/String;

    .line 54
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->appVersion:Ljava/lang/String;

    .line 55
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->libraryVersion:Ljava/lang/String;

    .line 56
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->deviceScreenDensity:Ljava/lang/String;

    .line 57
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->deviceScreenLayoutSize:Ljava/lang/String;

    .line 58
    const-string v2, "2.3.8"

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->tagVersion:Ljava/lang/String;

    .line 59
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 60
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->fbattribution:Ljava/lang/String;

    .line 65
    const-string v2, ""

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->AdXClickURL:Ljava/lang/String;

    .line 67
    const-string v2, "SendTag"

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->SEND_TAG:Ljava/lang/String;

    .line 176
    iput-object p1, p0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    .line 178
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    sget-object v3, Lcom/AdX/tag/AdXConnect;->AdX_PREFERENCE:Ljava/lang/String;

    invoke-virtual {v2, v3, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 180
    .local v1, "settings":Landroid/content/SharedPreferences;
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->SEND_TAG:Ljava/lang/String;

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 181
    .local v0, "sendTag":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v2, "stop"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 183
    const-string v2, "AdXAppTracker"

    const-string v3, "SendTag is set to stop "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    :goto_0
    return-void

    .line 188
    :cond_0
    invoke-direct {p0}, Lcom/AdX/tag/AdXConnect;->getApplicationData()V

    .line 189
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/AdX/tag/AdXConnect;->getFacebookAttributionId(Landroid/content/Context;)Ljava/lang/String;

    .line 192
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "udid="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 193
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "androidID="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->androidID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 194
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "device_name="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->deviceName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 195
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "device_type="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->deviceType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 196
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "os_version="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->deviceOSVersion:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 197
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "country_code="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->deviceCountryCode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 198
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "language="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->deviceLanguage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 199
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "app_id="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->appID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 200
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "clientid="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->clientID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 201
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "app_version="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->appVersion:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 202
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "tag_version="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->tagVersion:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 203
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "fbattribution="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->fbattribution:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 204
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "update="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 210
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->deviceScreenDensity:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->deviceScreenLayoutSize:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 212
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "&"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 213
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "screen_density="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->deviceScreenDensity:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 214
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "screen_layout_size="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/AdX/tag/AdXConnect;->deviceScreenLayoutSize:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 219
    :cond_1
    new-instance v2, Lcom/AdX/tag/AdXConnect$ConnectTask;

    invoke-direct {v2, p0, v4}, Lcom/AdX/tag/AdXConnect$ConnectTask;-><init>(Lcom/AdX/tag/AdXConnect;Lcom/AdX/tag/AdXConnect$ConnectTask;)V

    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->connectTask:Lcom/AdX/tag/AdXConnect$ConnectTask;

    .line 220
    iget-object v2, p0, Lcom/AdX/tag/AdXConnect;->connectTask:Lcom/AdX/tag/AdXConnect$ConnectTask;

    new-array v3, v5, [Ljava/lang/Void;

    invoke-virtual {v2, v3}, Lcom/AdX/tag/AdXConnect$ConnectTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "event"    # Ljava/lang/String;
    .param p3, "data"    # Ljava/lang/String;
    .param p4, "currency"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 272
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->connectTask:Lcom/AdX/tag/AdXConnect$ConnectTask;

    .line 37
    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->connectEventTask:Lcom/AdX/tag/AdXConnect$ConnectEventTask;

    .line 38
    iput-object v2, p0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    .line 45
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    .line 46
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->deviceName:Ljava/lang/String;

    .line 47
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->deviceType:Ljava/lang/String;

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->deviceOSVersion:Ljava/lang/String;

    .line 49
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->deviceCountryCode:Ljava/lang/String;

    .line 50
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->deviceLanguage:Ljava/lang/String;

    .line 51
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->androidID:Ljava/lang/String;

    .line 52
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->appID:Ljava/lang/String;

    .line 53
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->clientID:Ljava/lang/String;

    .line 54
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->appVersion:Ljava/lang/String;

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->libraryVersion:Ljava/lang/String;

    .line 56
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->deviceScreenDensity:Ljava/lang/String;

    .line 57
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->deviceScreenLayoutSize:Ljava/lang/String;

    .line 58
    const-string v0, "2.3.8"

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->tagVersion:Ljava/lang/String;

    .line 59
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 60
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->fbattribution:Ljava/lang/String;

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->AdXClickURL:Ljava/lang/String;

    .line 67
    const-string v0, "SendTag"

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->SEND_TAG:Ljava/lang/String;

    .line 274
    iput-object p1, p0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    .line 276
    const-string v0, "AdXAppTracker"

    const-string v1, "In Constructor "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    invoke-direct {p0}, Lcom/AdX/tag/AdXConnect;->getApplicationData()V

    .line 280
    const-string v0, "AdXAppTracker"

    const-string v1, "Got Application Data "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "udid="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 282
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "androidID="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/AdX/tag/AdXConnect;->androidID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 283
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "device_name="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/AdX/tag/AdXConnect;->deviceName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 284
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "device_type="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/AdX/tag/AdXConnect;->deviceType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 285
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "os_version="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/AdX/tag/AdXConnect;->deviceOSVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 286
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "country_code="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/AdX/tag/AdXConnect;->deviceCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 287
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "language="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/AdX/tag/AdXConnect;->deviceLanguage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 288
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "app_id="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/AdX/tag/AdXConnect;->appID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 289
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "event="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 290
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "data="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 291
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "currency="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 292
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->AdXClickURL:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 293
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "AdXClickURL="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/AdX/tag/AdXConnect;->AdXClickURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    .line 297
    :cond_0
    new-instance v0, Lcom/AdX/tag/AdXConnect$ConnectEventTask;

    invoke-direct {v0, p0, v2}, Lcom/AdX/tag/AdXConnect$ConnectEventTask;-><init>(Lcom/AdX/tag/AdXConnect;Lcom/AdX/tag/AdXConnect$ConnectEventTask;)V

    iput-object v0, p0, Lcom/AdX/tag/AdXConnect;->connectEventTask:Lcom/AdX/tag/AdXConnect$ConnectEventTask;

    .line 298
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->connectEventTask:Lcom/AdX/tag/AdXConnect$ConnectEventTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/AdX/tag/AdXConnect$ConnectEventTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 299
    return-void
.end method

.method static synthetic access$0(Lcom/AdX/tag/AdXConnect;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->urlParams:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    sget-object v0, Lcom/AdX/tag/AdXConnect;->referralURL:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/AdX/tag/AdXConnect;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 597
    invoke-direct {p0, p1}, Lcom/AdX/tag/AdXConnect;->handleConnectResponse(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$3(Lcom/AdX/tag/AdXConnect;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/AdX/tag/AdXConnect;->clientID:Ljava/lang/String;

    return-object v0
.end method

.method private buildDocument(Ljava/lang/String;)Lorg/w3c/dom/Document;
    .locals 8
    .param p1, "xml"    # Ljava/lang/String;

    .prologue
    .line 653
    const/4 v0, 0x0

    .line 657
    .local v0, "document":Lorg/w3c/dom/Document;
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v3

    .line 661
    .local v3, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    new-instance v4, Ljava/io/ByteArrayInputStream;

    const-string v5, "UTF-8"

    invoke-virtual {p1, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 663
    .local v4, "is":Ljava/io/InputStream;
    invoke-virtual {v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 664
    .local v1, "documentBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v1, v4}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 671
    .end local v1    # "documentBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v3    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v4    # "is":Ljava/io/InputStream;
    :goto_0
    return-object v0

    .line 666
    :catch_0
    move-exception v2

    .line 668
    .local v2, "e":Ljava/lang/Exception;
    const-string v5, "AdXAppTracker"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "buildDocument exception: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static doBroadcastConnectInstance(Landroid/content/Context;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 125
    sget-object v2, Lcom/AdX/tag/AdXConnect;->AdXURLConnection:Lcom/AdX/tag/AdXURLConnection;

    if-nez v2, :cond_0

    .line 126
    new-instance v2, Lcom/AdX/tag/AdXURLConnection;

    invoke-direct {v2}, Lcom/AdX/tag/AdXURLConnection;-><init>()V

    sput-object v2, Lcom/AdX/tag/AdXConnect;->AdXURLConnection:Lcom/AdX/tag/AdXURLConnection;

    .line 128
    :cond_0
    sget-object v2, Lcom/AdX/tag/AdXConnect;->AdXConnectInstance:Lcom/AdX/tag/AdXConnect;

    if-nez v2, :cond_1

    .line 129
    new-instance v2, Lcom/AdX/tag/AdXConnect;

    invoke-direct {v2, p0, v4}, Lcom/AdX/tag/AdXConnect;-><init>(Landroid/content/Context;I)V

    sput-object v2, Lcom/AdX/tag/AdXConnect;->AdXConnectInstance:Lcom/AdX/tag/AdXConnect;

    .line 131
    :cond_1
    const-string v2, "AdXAppTracker"

    const-string v3, "Broadcast Receiver - sending to AdX."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    sget-object v2, Lcom/AdX/tag/AdXConnect;->AdX_PREFERENCE:Ljava/lang/String;

    invoke-virtual {p0, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 133
    .local v1, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 134
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v2, Lcom/AdX/tag/AdXConnect;->RECEIVER_DONE:Ljava/lang/String;

    const-string v3, "done"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 135
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 136
    return-void
.end method

.method public static getAdXConnectEventInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/AdX/tag/AdXConnect;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;
    .param p3, "currency"    # Ljava/lang/String;

    .prologue
    .line 141
    sget-object v0, Lcom/AdX/tag/AdXConnect;->AdXURLConnection:Lcom/AdX/tag/AdXURLConnection;

    if-nez v0, :cond_0

    .line 142
    new-instance v0, Lcom/AdX/tag/AdXURLConnection;

    invoke-direct {v0}, Lcom/AdX/tag/AdXURLConnection;-><init>()V

    sput-object v0, Lcom/AdX/tag/AdXConnect;->AdXURLConnection:Lcom/AdX/tag/AdXURLConnection;

    .line 144
    :cond_0
    sget-object v0, Lcom/AdX/tag/AdXConnect;->AdXConnectEventInstance:Lcom/AdX/tag/AdXConnect;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    sput-object v0, Lcom/AdX/tag/AdXConnect;->AdXConnectEventInstance:Lcom/AdX/tag/AdXConnect;

    .line 145
    :cond_1
    new-instance v0, Lcom/AdX/tag/AdXConnect;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/AdX/tag/AdXConnect;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/AdX/tag/AdXConnect;->AdXConnectEventInstance:Lcom/AdX/tag/AdXConnect;

    .line 147
    sget-object v0, Lcom/AdX/tag/AdXConnect;->AdXConnectEventInstance:Lcom/AdX/tag/AdXConnect;

    return-object v0
.end method

.method public static getAdXConnectInstance(Landroid/content/Context;Z)Lcom/AdX/tag/AdXConnect;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "update"    # Z

    .prologue
    const/4 v4, 0x0

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 91
    sget-object v5, Lcom/AdX/tag/AdXConnect;->AdX_PREFERENCE:Ljava/lang/String;

    invoke-virtual {p0, v5, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 92
    .local v2, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 94
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v5, Lcom/AdX/tag/AdXConnect;->UPDATE:Ljava/lang/String;

    const/4 v6, -0x1

    invoke-interface {v2, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 95
    .local v3, "updateValue":I
    if-gez v3, :cond_0

    .line 97
    if-eqz p1, :cond_4

    sget-object v5, Lcom/AdX/tag/AdXConnect;->UPDATE:Ljava/lang/String;

    invoke-interface {v0, v5, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const/4 v3, 0x1

    .line 99
    :goto_0
    const-string v5, "AdXAppTracker"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Update flag set to "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    :cond_0
    sget-object v5, Lcom/AdX/tag/AdXConnect;->RECEIVER_DONE:Ljava/lang/String;

    invoke-interface {v2, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 103
    .local v1, "receiverDone":Ljava/lang/String;
    if-eq v3, v8, :cond_1

    if-eqz v1, :cond_5

    const-string v5, "done"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 105
    :cond_1
    const-string v4, "AdXAppTracker"

    const-string v5, "Sending to AdX"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    sget-object v4, Lcom/AdX/tag/AdXConnect;->AdXURLConnection:Lcom/AdX/tag/AdXURLConnection;

    if-nez v4, :cond_2

    .line 107
    new-instance v4, Lcom/AdX/tag/AdXURLConnection;

    invoke-direct {v4}, Lcom/AdX/tag/AdXURLConnection;-><init>()V

    sput-object v4, Lcom/AdX/tag/AdXConnect;->AdXURLConnection:Lcom/AdX/tag/AdXURLConnection;

    .line 109
    :cond_2
    sget-object v4, Lcom/AdX/tag/AdXConnect;->AdXConnectInstance:Lcom/AdX/tag/AdXConnect;

    if-nez v4, :cond_3

    .line 110
    new-instance v4, Lcom/AdX/tag/AdXConnect;

    invoke-direct {v4, p0, v3}, Lcom/AdX/tag/AdXConnect;-><init>(Landroid/content/Context;I)V

    sput-object v4, Lcom/AdX/tag/AdXConnect;->AdXConnectInstance:Lcom/AdX/tag/AdXConnect;

    .line 112
    :cond_3
    sget-object v4, Lcom/AdX/tag/AdXConnect;->AdXConnectInstance:Lcom/AdX/tag/AdXConnect;

    .line 120
    :goto_1
    return-object v4

    .line 98
    .end local v1    # "receiverDone":Ljava/lang/String;
    :cond_4
    sget-object v5, Lcom/AdX/tag/AdXConnect;->UPDATE:Ljava/lang/String;

    invoke-interface {v0, v5, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const/4 v3, 0x0

    goto :goto_0

    .line 115
    .restart local v1    # "receiverDone":Ljava/lang/String;
    :cond_5
    const-string v5, "AdXAppTracker"

    const-string v6, "Re Referral yet - deferring.."

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    sget-object v5, Lcom/AdX/tag/AdXConnect;->RECEIVER_DONE:Ljava/lang/String;

    const-string v6, "done"

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 118
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_1
.end method

.method public static getAdXReferral(Landroid/content/Context;I)Ljava/lang/String;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "timeout"    # I

    .prologue
    const/4 v5, 0x0

    .line 152
    sget-object v3, Lcom/AdX/tag/AdXConnect;->AdX_PREFERENCE:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 154
    .local v1, "settings":Landroid/content/SharedPreferences;
    sget-object v3, Lcom/AdX/tag/AdXConnect;->MODREFERRAL:Ljava/lang/String;

    invoke-interface {v1, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 155
    .local v2, "tempReferralURL":Ljava/lang/String;
    const/4 v0, 0x0

    .line 156
    .local v0, "count":I
    :goto_0
    if-ge v0, p1, :cond_0

    if-eqz v2, :cond_1

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 166
    :cond_0
    return-object v2

    .line 160
    :cond_1
    const-wide/16 v3, 0x3e8

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 161
    add-int/lit8 v0, v0, 0x1

    .line 162
    sget-object v3, Lcom/AdX/tag/AdXConnect;->MODREFERRAL:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 163
    const-string v3, "AdXAppTracker"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Count "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 164
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method private getApplicationData()V
    .locals 25

    .prologue
    .line 332
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v12

    .line 340
    .local v12, "manager":Landroid/content/pm/PackageManager;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v21

    const-string v22, "android_id"

    invoke-static/range {v21 .. v22}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->androidID:Ljava/lang/String;

    .line 342
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v21

    const/16 v22, 0x80

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v12, v0, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v10

    .line 344
    .local v10, "info":Landroid/content/pm/ApplicationInfo;
    if-eqz v10, :cond_b

    iget-object v0, v10, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    move-object/from16 v21, v0

    if-eqz v21, :cond_b

    .line 347
    iget-object v0, v10, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    move-object/from16 v21, v0

    const-string v22, "APP_NAME"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 348
    .local v13, "metaDataValue":Ljava/lang/String;
    if-eqz v13, :cond_2

    const-string v21, ""

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_2

    .line 350
    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->appID:Ljava/lang/String;

    .line 359
    iget-object v0, v10, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    move-object/from16 v21, v0

    const-string v22, "ADX_CLIENT_ID"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 360
    if-eqz v13, :cond_3

    const-string v21, ""

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_3

    .line 362
    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->clientID:Ljava/lang/String;

    .line 372
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v21

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v12, v0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v15

    .line 373
    .local v15, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v0, v15, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->appVersion:Ljava/lang/String;

    .line 376
    const-string v21, "android"

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->deviceType:Ljava/lang/String;

    .line 379
    sget-object v21, Landroid/os/Build;->MODEL:Ljava/lang/String;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->deviceName:Ljava/lang/String;

    .line 382
    sget-object v21, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->deviceOSVersion:Ljava/lang/String;

    .line 385
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->deviceCountryCode:Ljava/lang/String;

    .line 386
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->deviceLanguage:Ljava/lang/String;

    .line 389
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->tagVersion:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->libraryVersion:Ljava/lang/String;

    .line 391
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget-object v22, Lcom/AdX/tag/AdXConnect;->AdX_PREFERENCE:Ljava/lang/String;

    const/16 v23, 0x0

    invoke-virtual/range {v21 .. v23}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 394
    .local v17, "settings":Landroid/content/SharedPreferences;
    iget-object v0, v10, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    move-object/from16 v21, v0

    const-string v22, "DEVICE_ID"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 397
    if-eqz v13, :cond_4

    const-string v21, ""

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_4

    .line 399
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 488
    :cond_0
    :goto_0
    :try_start_1
    new-instance v14, Landroid/util/DisplayMetrics;

    invoke-direct {v14}, Landroid/util/DisplayMetrics;-><init>()V

    .line 489
    .local v14, "metrics":Landroid/util/DisplayMetrics;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    const-string v22, "window"

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Landroid/view/WindowManager;

    .line 490
    .local v20, "windowManager":Landroid/view/WindowManager;
    invoke-interface/range {v20 .. v20}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 500
    .end local v14    # "metrics":Landroid/util/DisplayMetrics;
    .end local v20    # "windowManager":Landroid/view/WindowManager;
    :goto_1
    :try_start_2
    sget-object v21, Lcom/AdX/tag/AdXConnect;->REFERRAL_URL:Ljava/lang/String;

    const/16 v22, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 501
    .local v19, "tempReferralURL":Ljava/lang/String;
    if-eqz v19, :cond_1

    const-string v21, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_1

    .line 502
    sput-object v19, Lcom/AdX/tag/AdXConnect;->referralURL:Ljava/lang/String;

    .line 504
    :cond_1
    const-string v21, "AdXAppTracker"

    const-string v22, "Metadata successfully loaded"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "APP_ID = ["

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->appID:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 509
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "deviceName: ["

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceName:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "deviceType: ["

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceType:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "libraryVersion: ["

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->libraryVersion:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 512
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "deviceOSVersion: ["

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceOSVersion:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 514
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "COUNTRY_CODE: ["

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceCountryCode:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 515
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "LANGUAGE_CODE: ["

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceLanguage:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "density: ["

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceScreenDensity:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "screen_layout: ["

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceScreenLayoutSize:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 520
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "referralURL: ["

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v23, Lcom/AdX/tag/AdXConnect;->referralURL:Ljava/lang/String;

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 534
    .end local v10    # "info":Landroid/content/pm/ApplicationInfo;
    .end local v13    # "metaDataValue":Ljava/lang/String;
    .end local v15    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v17    # "settings":Landroid/content/SharedPreferences;
    .end local v19    # "tempReferralURL":Ljava/lang/String;
    :goto_2
    return-void

    .line 354
    .restart local v10    # "info":Landroid/content/pm/ApplicationInfo;
    .restart local v13    # "metaDataValue":Ljava/lang/String;
    :cond_2
    const-string v21, "AdXAppTracker"

    const-string v22, "APP_NAME can\'t be empty."

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    .line 530
    .end local v10    # "info":Landroid/content/pm/ApplicationInfo;
    .end local v13    # "metaDataValue":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 532
    .local v7, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v21, "AdXAppTracker"

    const-string v22, "Add APP_ID to AndroidManifest.xml file. For more detail integration document."

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 366
    .end local v7    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v10    # "info":Landroid/content/pm/ApplicationInfo;
    .restart local v13    # "metaDataValue":Ljava/lang/String;
    :cond_3
    :try_start_3
    const-string v21, "AdXAppTracker"

    const-string v22, "ADX_CLIENT_ID can\'t be empty."

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    .line 406
    .restart local v15    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v17    # "settings":Landroid/content/SharedPreferences;
    :cond_4
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    const-string v22, "phone"

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/telephony/TelephonyManager;

    .line 408
    .local v18, "telephonyManager":Landroid/telephony/TelephonyManager;
    if-eqz v18, :cond_5

    .line 410
    invoke-virtual/range {v18 .. v18}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    .line 415
    :cond_5
    const/4 v11, 0x0

    .line 420
    .local v11, "invalidDeviceID":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    move-object/from16 v21, v0

    if-nez v21, :cond_6

    .line 422
    const-string v21, "AdXAppTracker"

    const-string v22, "Device id is null."

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    const/4 v11, 0x1

    .line 444
    :goto_3
    if-eqz v11, :cond_0

    .line 446
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 447
    .local v3, "buff":Ljava/lang/StringBuffer;
    const-string v21, "EMULATOR"

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 448
    const-string v21, "emulatorDeviceId"

    const/16 v22, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 451
    .local v6, "deviceId":Ljava/lang/String;
    if-eqz v6, :cond_9

    const-string v21, ""

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_9

    .line 453
    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_0

    .line 476
    .end local v3    # "buff":Ljava/lang/StringBuffer;
    .end local v6    # "deviceId":Ljava/lang/String;
    .end local v11    # "invalidDeviceID":Z
    .end local v18    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_1
    move-exception v7

    .line 478
    .local v7, "e":Ljava/lang/Exception;
    :try_start_5
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "Error getting deviceID. e: "

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 479
    const/16 v21, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;
    :try_end_5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_0

    .line 429
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v11    # "invalidDeviceID":Z
    .restart local v18    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_6
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v21

    if-eqz v21, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    move-object/from16 v21, v0

    const-string v22, "000000000000000"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    move-object/from16 v21, v0

    const-string v22, "0"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_8

    .line 431
    :cond_7
    const-string v21, "AdXAppTracker"

    const-string v22, "Device id is empty or an emulator."

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    const/4 v11, 0x1

    goto/16 :goto_3

    .line 440
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    goto/16 :goto_3

    .line 458
    .restart local v3    # "buff":Ljava/lang/StringBuffer;
    .restart local v6    # "deviceId":Ljava/lang/String;
    :cond_9
    const-string v5, "1234567890abcdefghijklmnopqrstuvw"

    .line 460
    .local v5, "constantChars":Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_4
    const/16 v21, 0x20

    move/from16 v0, v21

    if-lt v9, v0, :cond_a

    .line 467
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    .line 470
    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    .line 471
    .local v8, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v21, "emulatorDeviceId"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/AdX/tag/AdXConnect;->deviceID:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-interface {v8, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 472
    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_0

    .line 462
    .end local v8    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_a
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v21

    const-wide/high16 v23, 0x4059000000000000L    # 100.0

    mul-double v21, v21, v23

    move-wide/from16 v0, v21

    double-to-int v0, v0

    move/from16 v16, v0

    .line 463
    .local v16, "randomChar":I
    rem-int/lit8 v4, v16, 0x1e

    .line 464
    .local v4, "ch":I
    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_6 .. :try_end_6} :catch_0

    .line 460
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 494
    .end local v3    # "buff":Ljava/lang/StringBuffer;
    .end local v4    # "ch":I
    .end local v5    # "constantChars":Ljava/lang/String;
    .end local v6    # "deviceId":Ljava/lang/String;
    .end local v9    # "i":I
    .end local v11    # "invalidDeviceID":Z
    .end local v16    # "randomChar":I
    .end local v18    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :catch_2
    move-exception v7

    .line 496
    .restart local v7    # "e":Ljava/lang/Exception;
    :try_start_7
    const-string v21, "AdXAppTracker"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "Error getting screen density/dimensions/layout: "

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 526
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v13    # "metaDataValue":Ljava/lang/String;
    .end local v15    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v17    # "settings":Landroid/content/SharedPreferences;
    :cond_b
    const-string v21, "AdXAppTracker"

    const-string v22, "Add APP_ID to AndroidManifest.xml file. For more detail integration document."

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_7} :catch_0

    goto/16 :goto_2
.end method

.method public static getFacebookAttributionId(Landroid/content/Context;)Ljava/lang/String;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v10, 0x0

    .line 302
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "aid"

    aput-object v1, v2, v0

    .line 303
    .local v2, "projection":[Ljava/lang/String;
    const-string v6, ""

    .line 305
    .local v6, "attributionId":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/AdX/tag/AdXConnect;->ATTRIBUTION_ID_CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 308
    .local v7, "c":Landroid/database/Cursor;
    if-eqz v7, :cond_0

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    move-object v0, v10

    .line 322
    .end local v7    # "c":Landroid/database/Cursor;
    :goto_0
    return-object v0

    .line 309
    .restart local v7    # "c":Landroid/database/Cursor;
    :cond_1
    const-string v0, "aid"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .end local v7    # "c":Landroid/database/Cursor;
    :goto_1
    move-object v0, v6

    .line 322
    goto :goto_0

    .line 311
    :catch_0
    move-exception v8

    .line 312
    .local v8, "e":Ljava/lang/Exception;
    const-string v0, "AdXAppTracker"

    invoke-virtual {v8}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    const-string v0, "AdXAppTracker"

    const-string v1, "Retry"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/AdX/tag/AdXConnect;->ATTRIBUTION_ID_CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 317
    .restart local v7    # "c":Landroid/database/Cursor;
    if-eqz v7, :cond_2

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    move-object v0, v10

    goto :goto_0

    .line 319
    :cond_3
    const-string v0, "aid"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v6

    goto :goto_1

    .line 320
    .end local v7    # "c":Landroid/database/Cursor;
    :catch_1
    move-exception v9

    .local v9, "e2":Ljava/lang/Exception;
    const-string v0, "AdXAppTracker"

    invoke-virtual {v9}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private getNodeTrimValue(Lorg/w3c/dom/NodeList;)Ljava/lang/String;
    .locals 9
    .param p1, "nodeList"    # Lorg/w3c/dom/NodeList;

    .prologue
    const/4 v6, 0x0

    .line 684
    const/4 v7, 0x0

    invoke-interface {p1, v7}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 685
    .local v0, "element":Lorg/w3c/dom/Element;
    const-string v5, ""

    .line 686
    .local v5, "nodeValue":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 688
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 690
    .local v2, "itemNodeList":Lorg/w3c/dom/NodeList;
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    .line 691
    .local v3, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v3, :cond_1

    .line 698
    if-eqz v5, :cond_0

    const-string v7, ""

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 700
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 707
    .end local v1    # "i":I
    .end local v2    # "itemNodeList":Lorg/w3c/dom/NodeList;
    .end local v3    # "length":I
    :cond_0
    return-object v6

    .line 693
    .restart local v1    # "i":I
    .restart local v2    # "itemNodeList":Lorg/w3c/dom/NodeList;
    .restart local v3    # "length":I
    :cond_1
    invoke-interface {v2, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 694
    .local v4, "node":Lorg/w3c/dom/Node;
    if-eqz v4, :cond_2

    .line 695
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 691
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private handleConnectResponse(Ljava/lang/String;)Z
    .locals 10
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 602
    invoke-direct {p0, p1}, Lcom/AdX/tag/AdXConnect;->buildDocument(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 604
    .local v0, "document":Lorg/w3c/dom/Document;
    if-eqz v0, :cond_3

    .line 606
    const-string v7, "Referral"

    invoke-interface {v0, v7}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/AdX/tag/AdXConnect;->getNodeTrimValue(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v3

    .line 609
    .local v3, "nodeValue1":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 612
    const-string v7, "AdXAppTracker"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Successfully get returned referral "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    iget-object v7, p0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    sget-object v8, Lcom/AdX/tag/AdXConnect;->AdX_PREFERENCE:Ljava/lang/String;

    invoke-virtual {v7, v8, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 614
    .local v4, "settings":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 615
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v7, Lcom/AdX/tag/AdXConnect;->MODREFERRAL:Ljava/lang/String;

    invoke-interface {v1, v7, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 616
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 619
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v4    # "settings":Landroid/content/SharedPreferences;
    :cond_0
    const-string v7, "Success"

    invoke-interface {v0, v7}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/AdX/tag/AdXConnect;->getNodeTrimValue(Lorg/w3c/dom/NodeList;)Ljava/lang/String;

    move-result-object v2

    .line 622
    .local v2, "nodeValue":Ljava/lang/String;
    if-eqz v2, :cond_1

    const-string v7, "true"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 624
    const-string v6, "AdXAppTracker"

    const-string v7, "Successfully connected to AdX site."

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    .end local v2    # "nodeValue":Ljava/lang/String;
    .end local v3    # "nodeValue1":Ljava/lang/String;
    :goto_0
    return v5

    .line 627
    .restart local v2    # "nodeValue":Ljava/lang/String;
    .restart local v3    # "nodeValue1":Ljava/lang/String;
    :cond_1
    if-eqz v2, :cond_2

    const-string v7, "stop"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 629
    const-string v7, "AdXAppTracker"

    const-string v8, "Successfully connected to AdX site - stopping tags from now on."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 630
    iget-object v7, p0, Lcom/AdX/tag/AdXConnect;->context:Landroid/content/Context;

    sget-object v8, Lcom/AdX/tag/AdXConnect;->AdX_PREFERENCE:Ljava/lang/String;

    invoke-virtual {v7, v8, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 631
    .restart local v4    # "settings":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 632
    .restart local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v6, p0, Lcom/AdX/tag/AdXConnect;->SEND_TAG:Ljava/lang/String;

    const-string v7, "stop"

    invoke-interface {v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 633
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0

    .line 638
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v4    # "settings":Landroid/content/SharedPreferences;
    :cond_2
    const-string v5, "AdXAppTracker"

    const-string v7, "AdX Connect call failed."

    invoke-static {v5, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .end local v2    # "nodeValue":Ljava/lang/String;
    .end local v3    # "nodeValue1":Ljava/lang/String;
    :cond_3
    move v5, v6

    .line 642
    goto :goto_0
.end method


# virtual methods
.method public finalize()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 716
    sput-object v0, Lcom/AdX/tag/AdXConnect;->AdXConnectInstance:Lcom/AdX/tag/AdXConnect;

    .line 717
    sput-object v0, Lcom/AdX/tag/AdXConnect;->AdXConnectEventInstance:Lcom/AdX/tag/AdXConnect;

    .line 718
    const-string v0, "AdX App Tracker"

    const-string v1, "Cleaning resources."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 719
    return-void
.end method
