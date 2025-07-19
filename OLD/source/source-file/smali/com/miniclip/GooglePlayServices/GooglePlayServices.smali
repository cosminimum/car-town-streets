.class public Lcom/miniclip/GooglePlayServices/GooglePlayServices;
.super Ljava/lang/Object;
.source "GooglePlayServices.java"

# interfaces
.implements Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;
.implements Lcom/google/android/gms/games/OnSignOutCompleteListener;
.implements Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;
    }
.end annotation


# static fields
.field public static final CLIENT_ALL:I = 0x7

.field public static final CLIENT_APPSTATE:I = 0x4

.field public static final CLIENT_GAMES:I = 0x1

.field public static final CLIENT_NONE:I = 0x0

.field public static final CLIENT_PLUS:I = 0x2

.field static final RC_RESOLVE:I = 0x2329

.field static final RC_UNUSED:I = 0x232a

.field public static final REQUEST_AUTHORIZATION:I = 0x2328

.field public static final REQUEST_SHARE:I = 0x0

.field static final SIGN_IN_ERROR_MESSAGE:Ljava/lang/String; = "Could not sign in. Please try again."

.field static final SIGN_IN_MESSAGE:Ljava/lang/String; = "Signing in with Google..."

.field static final SIGN_OUT_MESSAGE:Ljava/lang/String; = "Signing out..."

.field public static gPlay:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

.field private static mActivity:Landroid/app/Activity;

.field protected static mContext:Landroid/content/Context;

.field private static mDelegate:I

.field static mPlusClient:Lcom/google/android/gms/plus/PlusClient;

.field private static mToken:Ljava/lang/String;

.field private static people:Lorg/json/JSONObject;


# instance fields
.field mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

.field mAutoSignIn:Z

.field mClientCurrentlyConnecting:I

.field mConnectedClients:I

.field mConnectionProgressDialog:Landroid/app/ProgressDialog;

.field mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

.field mDebugLog:Z

.field mDebugTag:Ljava/lang/String;

.field mExpectingActivityResult:Z

.field mGamesClient:Lcom/google/android/gms/games/GamesClient;

.field mInvitationId:Ljava/lang/String;

.field mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

.field mRequestedClients:I

.field mSignedIn:Z

.field mUserInitiatedSignIn:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 95
    sput-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mActivity:Landroid/app/Activity;

    .line 96
    sput-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    .line 109
    sput-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    .line 112
    const-string v0, ""

    sput-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mToken:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    .line 110
    iput-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    .line 129
    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mRequestedClients:I

    .line 132
    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    .line 135
    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mClientCurrentlyConnecting:I

    .line 138
    iput-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    .line 142
    iput-boolean v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAutoSignIn:Z

    .line 148
    iput-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mUserInitiatedSignIn:Z

    .line 151
    iput-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 155
    iput-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mExpectingActivityResult:Z

    .line 158
    iput-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mSignedIn:Z

    .line 161
    iput-boolean v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDebugLog:Z

    .line 162
    const-string v0, "BaseGameActivity"

    iput-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDebugTag:Ljava/lang/String;

    .line 174
    iput-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    .line 178
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    .line 110
    iput-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    .line 129
    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mRequestedClients:I

    .line 132
    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    .line 135
    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mClientCurrentlyConnecting:I

    .line 138
    iput-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    .line 142
    iput-boolean v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAutoSignIn:Z

    .line 148
    iput-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mUserInitiatedSignIn:Z

    .line 151
    iput-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 155
    iput-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mExpectingActivityResult:Z

    .line 158
    iput-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mSignedIn:Z

    .line 161
    iput-boolean v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDebugLog:Z

    .line 162
    const-string v0, "BaseGameActivity"

    iput-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDebugTag:Ljava/lang/String;

    .line 174
    iput-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    .line 180
    sput-object p1, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mActivity:Landroid/app/Activity;

    .line 181
    sput-object p1, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    .line 182
    return-void
.end method

.method public static GPM_getCurrentPerson()Ljava/lang/String;
    .locals 5

    .prologue
    .line 972
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 973
    .local v1, "person":Lorg/json/JSONObject;
    sget-object v3, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v3}, Lcom/google/android/gms/plus/PlusClient;->getCurrentPerson()Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v2

    .line 974
    .local v2, "personData":Lcom/google/android/gms/plus/model/people/Person;
    const-string v3, "id"

    invoke-interface {v2}, Lcom/google/android/gms/plus/model/people/Person;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 975
    const-string v3, "name"

    invoke-interface {v2}, Lcom/google/android/gms/plus/model/people/Person;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 976
    const-string v3, "url"

    invoke-interface {v2}, Lcom/google/android/gms/plus/model/people/Person;->getImage()Lcom/google/android/gms/plus/model/people/Person$Image;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/android/gms/plus/model/people/Person$Image;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 977
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 982
    .end local v2    # "personData":Lcom/google/android/gms/plus/model/people/Person;
    :goto_0
    return-object v3

    .line 979
    :catch_0
    move-exception v0

    .line 980
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 982
    const-string v3, ""

    goto :goto_0
.end method

.method public static GPM_getToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 895
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mToken:Ljava/lang/String;

    return-object v0
.end method

.method public static GPM_getVisiblePeople()Ljava/lang/String;
    .locals 1

    .prologue
    .line 965
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->people:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static GPM_gift()V
    .locals 2

    .prologue
    .line 937
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices$8;

    invoke-direct {v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$8;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 942
    return-void
.end method

.method public static GPM_giftAll()V
    .locals 2

    .prologue
    .line 945
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices$9;

    invoke-direct {v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$9;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 950
    return-void
.end method

.method public static GPM_invite()V
    .locals 2

    .prologue
    .line 921
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices$6;

    invoke-direct {v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$6;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 926
    return-void
.end method

.method public static GPM_inviteAll()V
    .locals 2

    .prologue
    .line 929
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices$7;

    invoke-direct {v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$7;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 934
    return-void
.end method

.method public static GPM_isConnected()Z
    .locals 1

    .prologue
    .line 961
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->isConnected()Z

    move-result v0

    return v0
.end method

.method public static GPM_share(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 953
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices$10;

    invoke-direct {v1, p0, p1, p2}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$10;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 958
    return-void
.end method

.method public static GPM_signIn(I)V
    .locals 2
    .param p0, "delegate"    # I

    .prologue
    .line 903
    sput p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDelegate:I

    .line 904
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices$4;

    invoke-direct {v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$4;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 909
    return-void
.end method

.method public static GPM_signOut(I)V
    .locals 2
    .param p0, "delegate"    # I

    .prologue
    .line 912
    sput p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDelegate:I

    .line 913
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices$5;

    invoke-direct {v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$5;-><init>()V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 918
    return-void
.end method

.method public static native MGooglePlusSignInCallbackOnFailure(Ljava/lang/String;I)V
.end method

.method public static native MGooglePlusSignInCallbackOnSuccess(Ljava/lang/String;I)V
.end method

.method public static native MPeopleLoaded(Ljava/lang/String;I)V
.end method

.method public static Setup(Landroid/app/Activity;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 67
    new-instance v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    invoke-direct {v0, p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;-><init>(Landroid/app/Activity;)V

    sput-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->gPlay:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    .line 68
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->gPlay:Lcom/miniclip/GooglePlayServices/GooglePlayServices;

    check-cast p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    .end local p0    # "activity":Landroid/app/Activity;
    invoke-virtual {v0, p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->setup(Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;)V

    .line 69
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mToken:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$002(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 58
    sput-object p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mToken:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$200()I
    .locals 1

    .prologue
    .line 58
    sget v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDelegate:I

    return v0
.end method

.method static synthetic access$300()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->people:Lorg/json/JSONObject;

    return-object v0
.end method


# virtual methods
.method public beginUserInitiatedSignIn()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 561
    iget-boolean v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mSignedIn:Z

    if-eqz v1, :cond_1

    .line 592
    :cond_0
    :goto_0
    return-void

    .line 565
    :cond_1
    iput-boolean v3, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAutoSignIn:Z

    .line 568
    sget-object v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    .line 569
    .local v0, "result":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "beginUserInitiatedSignIn: isGooglePlayServicesAvailable returned "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 570
    if-eqz v0, :cond_2

    .line 572
    const-string v1, "beginUserInitiatedSignIn: Google Play services not available. Show error dialog."

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 574
    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    invoke-interface {v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;->onSignInFailed()V

    goto :goto_0

    .line 579
    :cond_2
    iput-boolean v3, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mUserInitiatedSignIn:Z

    .line 580
    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz v1, :cond_3

    .line 582
    const-string v1, "beginUserInitiatedSignIn: continuing pending sign-in flow."

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 583
    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    const-string v2, "Signing in with Google..."

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 584
    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 585
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->resolveConnectionResult()V

    goto :goto_0

    .line 589
    :cond_3
    const-string v1, "beginUserInitiatedSignIn: starting new sign-in flow."

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 590
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->startConnections()V

    goto :goto_0
.end method

.method connectCurrentClient()V
    .locals 1

    .prologue
    .line 290
    const-string v0, "tagg connecting a client"

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 291
    iget v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mClientCurrentlyConnecting:I

    packed-switch v0, :pswitch_data_0

    .line 307
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 293
    :pswitch_1
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->connect()V

    goto :goto_0

    .line 296
    :pswitch_2
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateClient;->connect()V

    goto :goto_0

    .line 299
    :pswitch_3
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 301
    const-string v0, "...........................1"

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 302
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->disconnect()V

    .line 303
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->connect()V

    goto :goto_0

    .line 291
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method connectNextClient()V
    .locals 5

    .prologue
    .line 251
    iget v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mRequestedClients:I

    iget v3, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    xor-int/lit8 v3, v3, -0x1

    and-int v1, v2, v3

    .line 252
    .local v1, "pendingClients":I
    if-nez v1, :cond_0

    .line 253
    const-string v2, "All clients now connected. Sign-in successful."

    invoke-virtual {p0, v2}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 254
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->succeedSignIn()V

    .line 286
    :goto_0
    return-void

    .line 257
    :cond_0
    const-string v2, "tagg"

    const-string v3, "tagg connect next"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    iget-object v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    const-string v3, "Signing in with Google..."

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 259
    iget-object v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->show()V

    .line 262
    :try_start_0
    iget-object v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    if-eqz v2, :cond_1

    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_1

    .line 263
    const-string v2, "Connecting GamesClient."

    invoke-virtual {p0, v2}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 264
    const/4 v2, 0x1

    iput v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mClientCurrentlyConnecting:I

    .line 279
    :goto_1
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->connectCurrentClient()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 281
    :catch_0
    move-exception v0

    .line 282
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDebugTag:Ljava/lang/String;

    const-string v3, "*** EXCEPTION while attempting to connect. Details follow."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 284
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->giveUp()V

    goto :goto_0

    .line 266
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1
    :try_start_1
    sget-object v2, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v2, :cond_2

    and-int/lit8 v2, v1, 0x2

    if-eqz v2, :cond_2

    .line 267
    const-string v2, "Connecting PlusClient."

    invoke-virtual {p0, v2}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 268
    const/4 v2, 0x2

    iput v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mClientCurrentlyConnecting:I

    goto :goto_1

    .line 270
    :cond_2
    iget-object v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    if-eqz v2, :cond_3

    and-int/lit8 v2, v1, 0x4

    if-eqz v2, :cond_3

    .line 271
    const-string v2, "Connecting AppStateClient."

    invoke-virtual {p0, v2}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 272
    const/4 v2, 0x4

    iput v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mClientCurrentlyConnecting:I

    goto :goto_1

    .line 275
    :cond_3
    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Not all clients connected, yet no one is next. R="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mRequestedClients:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", C="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
.end method

.method debugLog(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 733
    iget-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDebugLog:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDebugTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GooglePlayServices: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    :cond_0
    return-void
.end method

.method public enableDebugLog(ZLjava/lang/String;)V
    .locals 0
    .param p1, "enabled"    # Z
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 728
    iput-boolean p1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDebugLog:Z

    .line 729
    iput-object p2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mDebugTag:Ljava/lang/String;

    .line 730
    return-void
.end method

.method public getAppStateClient()Lcom/google/android/gms/appstate/AppStateClient;
    .locals 2

    .prologue
    .line 226
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    if-nez v0, :cond_0

    .line 227
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No AppStateClient. Did you request it at setup?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 229
    :cond_0
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    return-object v0
.end method

.method getErrorDialog(I)Landroid/app/Dialog;
    .locals 7
    .param p1, "errorCode"    # I

    .prologue
    .line 640
    invoke-static {p1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isUserRecoverableError(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 642
    iget-object v3, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v3}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v3

    sget-object v4, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mActivity:Landroid/app/Activity;

    const/16 v5, 0x232a

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getErrorDialog(ILandroid/app/Activity;ILandroid/content/DialogInterface$OnCancelListener;)Landroid/app/Dialog;

    move-result-object v0

    .line 644
    .local v0, "errorDialog":Landroid/app/Dialog;
    if-eqz v0, :cond_0

    .line 708
    .end local v0    # "errorDialog":Landroid/app/Dialog;
    :goto_0
    return-object v0

    .line 650
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 703
    const-string v2, "An unexpected error occurred during sign-in. Try again later."

    .line 704
    .local v2, "userMessage":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v4}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 707
    .local v1, "logMessage":Ljava/lang/String;
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ERROR CODE "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": message="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; details="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 708
    invoke-virtual {p0, v2}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->makeSignInErrorDialog(Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 652
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_0
    const-string v2, "Application configuration problem."

    .line 653
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "DEVELOPER_ERROR: Check package name, signing certificate, app ID."

    .line 654
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 656
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_1
    const-string v2, "Internal error. Please try again later."

    .line 657
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "INTERNAL_ERROR"

    .line 658
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 660
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_2
    const-string v2, "Invalid account. Try using a different account."

    .line 661
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "INVALID_ACCOUNT"

    .line 662
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 664
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_3
    const-string v2, "Cannot verify application license."

    .line 665
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "LICENSE_CHECK_FAILED: app license could not be verified."

    .line 666
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 668
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_4
    const-string v2, "There was a network problem while connecting. Please check that you are online and try again later."

    .line 669
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "NETWORK_ERROR: check connection, try again."

    .line 670
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 673
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_5
    const-string v2, "There was a sign-in issue that could not be resolved."

    .line 674
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "RESOLUTION_REQUIRED: Result resolution is required, but was not performed."

    .line 675
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 677
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_6
    const-string v2, "Cannot sign-in. Verify that Google Play services are enabled and try again."

    .line 678
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "SERVICE_DISABLED: Google Play services may have been manually disabled."

    .line 679
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 681
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_7
    const-string v2, "Cannot sign-in. Verify that Google Play services are correctly set up and try again."

    .line 682
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "SERVICE_INVALID. Google Play services may need to be reinstalled on device."

    .line 683
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 685
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_8
    const-string v2, "Cannot sign-in. Verify that Google Play services are correctly installed and try again."

    .line 686
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "SERVICE_MISSING. Google Play services may not be installed on the device."

    .line 687
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 689
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_9
    const-string v2, "A newer version of Google Play services is required. Please update and try again."

    .line 690
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "SERVICE_VERSION_UPDATE_REQUIRED. Must install newer version of Google Play services."

    .line 691
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 694
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_a
    const-string v2, "There was an issue with sign-in."

    .line 695
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "SIGN_IN_REQUIRED"

    .line 696
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 699
    .end local v1    # "logMessage":Ljava/lang/String;
    .end local v2    # "userMessage":Ljava/lang/String;
    :pswitch_b
    const-string v2, "Sign-in successful."

    .line 700
    .restart local v2    # "userMessage":Ljava/lang/String;
    const-string v1, "SUCCESS"

    .line 701
    .restart local v1    # "logMessage":Ljava/lang/String;
    goto :goto_1

    .line 650
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_8
        :pswitch_9
        :pswitch_6
        :pswitch_a
        :pswitch_2
        :pswitch_5
        :pswitch_4
        :pswitch_1
        :pswitch_7
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public getGamesClient()Lcom/google/android/gms/games/GamesClient;
    .locals 2

    .prologue
    .line 219
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    if-nez v0, :cond_0

    .line 220
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No GamesClient. Did you request it at setup?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 222
    :cond_0
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    return-object v0
.end method

.method public getInvitationId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 724
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mInvitationId:Ljava/lang/String;

    return-object v0
.end method

.method public getPlusClient()Lcom/google/android/gms/plus/PlusClient;
    .locals 2

    .prologue
    .line 233
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    if-nez v0, :cond_0

    .line 234
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No PlusClient. Did you request it at setup?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 236
    :cond_0
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    return-object v0
.end method

.method giveUp()V
    .locals 4

    .prologue
    .line 528
    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 529
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "giveUp: giving up on connection. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    if-nez v1, :cond_1

    const-string v1, "(no connection result)"

    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 533
    const/4 v0, 0x0

    .line 534
    .local v0, "errorDialog":Landroid/app/Dialog;
    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz v1, :cond_2

    .line 536
    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->getErrorDialog(I)Landroid/app/Dialog;

    move-result-object v0

    .line 543
    :goto_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAutoSignIn:Z

    .line 544
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 545
    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    invoke-interface {v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;->onSignInFailed()V

    .line 547
    :cond_0
    sget-object v1, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v2, Lcom/miniclip/GooglePlayServices/GooglePlayServices$2;

    invoke-direct {v2, p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$2;-><init>(Lcom/miniclip/GooglePlayServices/GooglePlayServices;)V

    invoke-virtual {v1, v2}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 554
    return-void

    .line 529
    .end local v0    # "errorDialog":Landroid/app/Dialog;
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Status code: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v3}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 540
    .restart local v0    # "errorDialog":Landroid/app/Dialog;
    :cond_2
    const-string v1, "Could not sign in. Please try again."

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->makeSignInErrorDialog(Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_1
.end method

.method public isSignedIn()Z
    .locals 1

    .prologue
    .line 240
    iget-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mSignedIn:Z

    return v0
.end method

.method killConnections(I)V
    .locals 1
    .param p1, "whatClients"    # I

    .prologue
    .line 310
    and-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 312
    iget v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    .line 313
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->disconnect()V

    .line 315
    :cond_0
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 317
    iget v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    .line 318
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->disconnect()V

    .line 320
    :cond_1
    and-int/lit8 v0, p1, 0x4

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 322
    iget v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    .line 323
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateClient;->disconnect()V

    .line 325
    :cond_2
    return-void
.end method

.method public loadVisiblePeople()V
    .locals 2

    .prologue
    .line 422
    const-string v0, "load Visible People"

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 423
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/google/android/gms/plus/PlusClient;->loadVisiblePeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Ljava/lang/String;)V

    .line 424
    return-void
.end method

.method makeSignInErrorDialog(Ljava/lang/String;)Landroid/app/Dialog;
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 717
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Sign-in error"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "responseCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 499
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onActivityResult.................., req "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " response "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 501
    const/16 v0, 0x2329

    if-ne p1, v0, :cond_0

    .line 504
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mExpectingActivityResult:Z

    .line 505
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onActivityResult, req "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " response "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 506
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 508
    const-string v0, "responseCode == RESULT_OK. So connecting."

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 509
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->connectCurrentClient()V

    .line 518
    :cond_0
    :goto_0
    return-void

    .line 514
    :cond_1
    const-string v0, "responseCode != RESULT_OK, so not reconnecting."

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 515
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->giveUp()V

    goto :goto_0
.end method

.method public onConnected(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "connectionHint"    # Landroid/os/Bundle;

    .prologue
    .line 351
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onConnected: connected! client="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mClientCurrentlyConnecting:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 354
    iget v3, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    iget v4, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mClientCurrentlyConnecting:I

    or-int/2addr v3, v4

    iput v3, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    .line 358
    iget v3, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mClientCurrentlyConnecting:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    if-eqz p1, :cond_0

    .line 359
    const-string v3, "onConnected: connection hint provided. Checking for invite."

    invoke-virtual {p0, v3}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 360
    const-string v3, "invitation"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/Invitation;

    .line 361
    .local v0, "inv":Lcom/google/android/gms/games/multiplayer/Invitation;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/google/android/gms/games/multiplayer/Invitation;->getInvitationId()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 363
    const-string v3, "onConnected: connection hint has a room invite!"

    invoke-virtual {p0, v3}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 364
    invoke-interface {v0}, Lcom/google/android/gms/games/multiplayer/Invitation;->getInvitationId()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mInvitationId:Ljava/lang/String;

    .line 365
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invitation ID: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mInvitationId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 369
    .end local v0    # "inv":Lcom/google/android/gms/games/multiplayer/Invitation;
    :cond_0
    const-string v1, "oauth2:https://www.googleapis.com/auth/plus.login profile https://www.googleapis.com/auth/userinfo.email"

    .line 373
    .local v1, "scope":Ljava/lang/String;
    new-instance v2, Lcom/miniclip/GooglePlayServices/GooglePlayServices$1;

    invoke-direct {v2, p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$1;-><init>(Lcom/miniclip/GooglePlayServices/GooglePlayServices;)V

    .line 402
    .local v2, "thread":Ljava/lang/Thread;
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 405
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->loadVisiblePeople()V

    .line 417
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->connectNextClient()V

    .line 418
    return-void
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 2
    .param p1, "result"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    .line 440
    iput-object p1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 441
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onConnectionFailed: result "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 442
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 444
    iget-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mUserInitiatedSignIn:Z

    if-nez v0, :cond_1

    .line 448
    const-string v0, "onConnectionFailed: since user didn\'t initiate sign-in, failing now."

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 449
    iput-object p1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 450
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    invoke-interface {v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;->onSignInFailed()V

    .line 460
    :cond_0
    :goto_0
    return-void

    .line 454
    :cond_1
    const-string v0, "onConnectionFailed: since user initiated sign-in, trying to resolve problem."

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 459
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->resolveConnectionResult()V

    goto :goto_0
.end method

.method public onDisconnected()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 596
    const-string v0, "onDisconnected."

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 597
    iput-object v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 598
    iput-boolean v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAutoSignIn:Z

    .line 599
    iput-boolean v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mSignedIn:Z

    .line 600
    iput-object v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mInvitationId:Ljava/lang/String;

    .line 601
    iput v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    .line 602
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    invoke-interface {v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;->onSignInFailed()V

    .line 603
    :cond_0
    return-void
.end method

.method public onPeopleLoaded(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/plus/model/people/PersonBuffer;Ljava/lang/String;)V
    .locals 7
    .param p1, "status"    # Lcom/google/android/gms/common/ConnectionResult;
    .param p2, "personBuffer"    # Lcom/google/android/gms/plus/model/people/PersonBuffer;
    .param p3, "nextPageToken"    # Ljava/lang/String;

    .prologue
    .line 822
    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    .line 880
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error when listing people: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 883
    :goto_0
    return-void

    .line 825
    :sswitch_0
    :try_start_0
    invoke-virtual {p2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->getCount()I

    move-result v0

    .line 826
    .local v0, "count":I
    const-string v4, ""

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "count : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 827
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v0, :cond_0

    .line 828
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 831
    .local v3, "person":Lorg/json/JSONObject;
    :try_start_1
    const-string v4, "id"

    invoke-virtual {p2, v2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->get(I)Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 832
    const-string v4, "name"

    invoke-virtual {p2, v2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->get(I)Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person;->getDisplayName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 833
    const-string v4, "url"

    invoke-virtual {p2, v2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->get(I)Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person;->getImage()Lcom/google/android/gms/plus/model/people/Person$Image;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person$Image;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 841
    :goto_2
    :try_start_2
    sget-object v4, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->people:Lorg/json/JSONObject;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 846
    :goto_3
    :try_start_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "people are:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2, v2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->get(I)Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person;->getDisplayName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2, v2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->get(I)Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " isPlusUser : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2, v2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->get(I)Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person;->isPlusUser()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " isVerified : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2, v2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->get(I)Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person;->isVerified()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " hasCircledByCount : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2, v2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->get(I)Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person;->hasCircledByCount()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " getObjectType : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2, v2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->get(I)Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person;->getObjectType()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Image : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2, v2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->get(I)Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person;->getImage()Lcom/google/android/gms/plus/model/people/Person$Image;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/plus/model/people/Person$Image;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 827
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 836
    :catch_0
    move-exception v1

    .line 838
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_2

    .line 860
    .end local v0    # "count":I
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "i":I
    .end local v3    # "person":Lorg/json/JSONObject;
    :catchall_0
    move-exception v4

    invoke-virtual {p2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->close()V

    throw v4

    .line 842
    .restart local v0    # "count":I
    .restart local v2    # "i":I
    .restart local v3    # "person":Lorg/json/JSONObject;
    :catch_1
    move-exception v1

    .line 844
    .restart local v1    # "e":Lorg/json/JSONException;
    :try_start_4
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_3

    .line 860
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v3    # "person":Lorg/json/JSONObject;
    :cond_0
    invoke-virtual {p2}, Lcom/google/android/gms/plus/model/people/PersonBuffer;->close()V

    .line 862
    sget-object v4, Lcom/miniclip/nativeJNI/cocojava;->mGLView:Lcom/miniclip/nativeJNI/ClearGLSurfaceView;

    new-instance v5, Lcom/miniclip/GooglePlayServices/GooglePlayServices$3;

    invoke-direct {v5, p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$3;-><init>(Lcom/miniclip/GooglePlayServices/GooglePlayServices;)V

    invoke-virtual {v4, v5}, Lcom/miniclip/nativeJNI/ClearGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 874
    .end local v0    # "count":I
    .end local v2    # "i":I
    :sswitch_1
    sget-object v4, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v4}, Lcom/google/android/gms/plus/PlusClient;->disconnect()V

    .line 875
    const-string v4, "...........................3"

    invoke-virtual {p0, v4}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 876
    sget-object v4, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v4}, Lcom/google/android/gms/plus/PlusClient;->connect()V

    goto/16 :goto_0

    .line 822
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x4 -> :sswitch_1
    .end sparse-switch
.end method

.method public onSignOutComplete()V
    .locals 1

    .prologue
    .line 759
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 760
    :cond_0
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->disconnect()V

    .line 761
    :cond_1
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 607
    const-string v0, "onStart."

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 608
    iget-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mExpectingActivityResult:Z

    if-eqz v0, :cond_0

    .line 612
    const-string v0, "onStart: won\'t connect because we\'re expecting activity result."

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 625
    :goto_0
    return-void

    .line 614
    :cond_0
    iget-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAutoSignIn:Z

    if-nez v0, :cond_1

    .line 618
    const-string v0, "onStart: not signing in because user specifically signed out."

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    goto :goto_0

    .line 622
    :cond_1
    const-string v0, "onStart: connecting clients."

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 623
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->startConnections()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 629
    const-string v0, "onStop: disconnecting clients."

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 632
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->killConnections(I)V

    .line 635
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mSignedIn:Z

    .line 636
    return-void
.end method

.method public reconnectClients(I)V
    .locals 2
    .param p1, "whatClients"    # I

    .prologue
    .line 328
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    const-string v1, "Signing in with Google..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 329
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 331
    and-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 333
    iget v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    .line 334
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->reconnect()V

    .line 336
    :cond_0
    and-int/lit8 v0, p1, 0x4

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 338
    iget v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    .line 339
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateClient;->reconnect()V

    .line 343
    :cond_1
    const-string v0, "...........................2"

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 344
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->connect()V

    .line 345
    return-void
.end method

.method resolveConnectionResult()V
    .locals 4

    .prologue
    .line 468
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "resolveConnectionResult: trying to resolve result: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 469
    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 471
    const-string v1, "result has resolution. Starting it."

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 474
    :try_start_0
    const-string v1, "trying to resolve"

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 475
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mExpectingActivityResult:Z

    .line 476
    iget-object v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    sget-object v2, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mActivity:Landroid/app/Activity;

    const/16 v3, 0x2329

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/common/ConnectionResult;->startResolutionForResult(Landroid/app/Activity;I)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 488
    :goto_0
    return-void

    .line 477
    :catch_0
    move-exception v0

    .line 479
    .local v0, "e":Landroid/content/IntentSender$SendIntentException;
    const-string v1, "SendIntentException."

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 480
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->connectCurrentClient()V

    goto :goto_0

    .line 485
    .end local v0    # "e":Landroid/content/IntentSender$SendIntentException;
    :cond_0
    const-string v1, "resolveConnectionResult: result has no resolution. Giving up."

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 486
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->giveUp()V

    goto :goto_0
.end method

.method public setup(Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    .prologue
    .line 185
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->setup(Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;I)V

    .line 186
    return-void
.end method

.method public setup(Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;I)V
    .locals 5
    .param p1, "listener"    # Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;
    .param p2, "clientsToUse"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 189
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    sput-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->people:Lorg/json/JSONObject;

    .line 190
    const-string v0, "tagg"

    const-string v1, "tagg setting up"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    iput-object p1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    .line 192
    new-instance v0, Landroid/app/ProgressDialog;

    sget-object v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    .line 193
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    const-string v1, "Signing in with Google..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 194
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 196
    iput p2, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mRequestedClients:I

    .line 198
    and-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_0

    .line 199
    const-string v0, "onCreate: creating GamesClient"

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 200
    new-instance v0, Lcom/google/android/gms/games/GamesClient$Builder;

    sget-object v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0, p0}, Lcom/google/android/gms/games/GamesClient$Builder;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    const/16 v1, 0x31

    invoke-virtual {v0, v1}, Lcom/google/android/gms/games/GamesClient$Builder;->setGravityForPopups(I)Lcom/google/android/gms/games/GamesClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient$Builder;->create()Lcom/google/android/gms/games/GamesClient;

    move-result-object v0

    iput-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    .line 204
    :cond_0
    and-int/lit8 v0, p2, 0x2

    if-eqz v0, :cond_1

    .line 205
    const-string v0, "onCreate: creating GamesPlusClient"

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 206
    new-instance v0, Lcom/google/android/gms/plus/PlusClient$Builder;

    sget-object v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0, p0}, Lcom/google/android/gms/plus/PlusClient$Builder;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "http://schemas.google.com/AddActivity"

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/google/android/gms/plus/PlusClient$Builder;->setActions([Ljava/lang/String;)Lcom/google/android/gms/plus/PlusClient$Builder;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "https://www.googleapis.com/auth/plus.login"

    aput-object v2, v1, v3

    const-string v2, "profile"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "https://www.googleapis.com/auth/userinfo.email"

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/google/android/gms/plus/PlusClient$Builder;->setScopes([Ljava/lang/String;)Lcom/google/android/gms/plus/PlusClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient$Builder;->build()Lcom/google/android/gms/plus/PlusClient;

    move-result-object v0

    sput-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    .line 212
    :cond_1
    and-int/lit8 v0, p2, 0x4

    if-eqz v0, :cond_2

    .line 213
    const-string v0, "onCreate: creating AppStateClient"

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 214
    new-instance v0, Lcom/google/android/gms/appstate/AppStateClient$Builder;

    sget-object v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0, p0}, Lcom/google/android/gms/appstate/AppStateClient$Builder;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateClient$Builder;->create()Lcom/google/android/gms/appstate/AppStateClient;

    move-result-object v0

    iput-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    .line 216
    :cond_2
    return-void
.end method

.method public share(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "url"    # Ljava/lang/String;

    .prologue
    .line 807
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "tagg sharing type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " text "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " url "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 809
    new-instance v1, Lcom/google/android/gms/plus/PlusShare$Builder;

    sget-object v2, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Lcom/google/android/gms/plus/PlusShare$Builder;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1, p1}, Lcom/google/android/gms/plus/PlusShare$Builder;->setType(Ljava/lang/String;)Lcom/google/android/gms/plus/PlusShare$Builder;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/google/android/gms/plus/PlusShare$Builder;->setText(Ljava/lang/CharSequence;)Lcom/google/android/gms/plus/PlusShare$Builder;

    move-result-object v1

    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/plus/PlusShare$Builder;->setContentUrl(Landroid/net/Uri;)Lcom/google/android/gms/plus/PlusShare$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/plus/PlusShare$Builder;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 815
    .local v0, "shareIntent":Landroid/content/Intent;
    sget-object v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mActivity:Landroid/app/Activity;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 817
    return-void
.end method

.method public showAchievements()V
    .locals 3

    .prologue
    .line 798
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->isSignedIn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 799
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->getGamesClient()Lcom/google/android/gms/games/GamesClient;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/games/GamesClient;->getAchievementsIntent()Landroid/content/Intent;

    move-result-object v1

    const/16 v2, 0x232a

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 803
    :goto_0
    return-void

    .line 801
    :cond_0
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->beginUserInitiatedSignIn()V

    goto :goto_0
.end method

.method public showAlert(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 712
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 714
    return-void
.end method

.method public showLeaderboard(Ljava/lang/String;)V
    .locals 3
    .param p1, "leaderboardId"    # Ljava/lang/String;

    .prologue
    .line 770
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->isSignedIn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 771
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->getGamesClient()Lcom/google/android/gms/games/GamesClient;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/android/gms/games/GamesClient;->getLeaderboardIntent(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const/16 v2, 0x232a

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 775
    :goto_0
    return-void

    .line 773
    :cond_0
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->beginUserInitiatedSignIn()V

    goto :goto_0
.end method

.method public showLeaderboards()V
    .locals 3

    .prologue
    .line 778
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->isSignedIn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 779
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->getGamesClient()Lcom/google/android/gms/games/GamesClient;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/games/GamesClient;->getAllLeaderboardsIntent()Landroid/content/Intent;

    move-result-object v1

    const/16 v2, 0x232a

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 783
    :goto_0
    return-void

    .line 781
    :cond_0
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->beginUserInitiatedSignIn()V

    goto :goto_0
.end method

.method signOut()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 739
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 740
    iput-boolean v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAutoSignIn:Z

    .line 741
    iput-boolean v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mSignedIn:Z

    .line 743
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 744
    sget-object v0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->clearDefaultAccount()V

    .line 746
    :cond_0
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 747
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    const-string v1, "Signing out..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 748
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 749
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/games/GamesClient;->signOut(Lcom/google/android/gms/games/OnSignOutCompleteListener;)V

    .line 754
    :cond_1
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->killConnections(I)V

    .line 755
    return-void
.end method

.method startConnections()V
    .locals 1

    .prologue
    .line 244
    const/4 v0, 0x0

    iput v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectedClients:I

    .line 245
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mInvitationId:Ljava/lang/String;

    .line 246
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->connectNextClient()V

    .line 247
    return-void
.end method

.method succeedSignIn()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 427
    const-string v0, "All requested clients connected. Sign-in succeeded!"

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 428
    iput-boolean v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mSignedIn:Z

    .line 429
    iput-boolean v1, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mAutoSignIn:Z

    .line 430
    const-string v0, "tagg SIGNED IN"

    invoke-virtual {p0, v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->debugLog(Ljava/lang/String;)V

    .line 431
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mConnectionProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 432
    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->mListener:Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;

    invoke-interface {v0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices$GooglePlayServicesListener;->onSignInSucceeded()V

    .line 433
    :cond_0
    return-void
.end method

.method public unlockAchievement(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "achievementId"    # Ljava/lang/String;
    .param p2, "userData"    # Ljava/lang/Object;

    .prologue
    .line 792
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->isSignedIn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 793
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->getGamesClient()Lcom/google/android/gms/games/GamesClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/games/GamesClient;->unlockAchievement(Ljava/lang/String;)V

    .line 795
    :cond_0
    return-void
.end method

.method public updateAchievement(Ljava/lang/String;FLjava/lang/Object;)V
    .locals 2
    .param p1, "achievementId"    # Ljava/lang/String;
    .param p2, "progressValue"    # F
    .param p3, "userData"    # Ljava/lang/Object;

    .prologue
    .line 786
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->isSignedIn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 787
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->getGamesClient()Lcom/google/android/gms/games/GamesClient;

    move-result-object v0

    float-to-int v1, p2

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/games/GamesClient;->incrementAchievement(Ljava/lang/String;I)V

    .line 789
    :cond_0
    return-void
.end method

.method public updateScore(Ljava/lang/String;JLjava/lang/Object;)V
    .locals 2
    .param p1, "leaderboardId"    # Ljava/lang/String;
    .param p2, "scoreValue"    # J
    .param p4, "userData"    # Ljava/lang/Object;

    .prologue
    .line 764
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->isSignedIn()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    .line 765
    invoke-virtual {p0}, Lcom/miniclip/GooglePlayServices/GooglePlayServices;->getGamesClient()Lcom/google/android/gms/games/GamesClient;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gms/games/GamesClient;->submitScore(Ljava/lang/String;J)V

    .line 767
    :cond_0
    return-void
.end method
