package com.miniclip.GooglePlayServices;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentSender;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.appstate.AppStateClient;
import com.google.android.gms.auth.GoogleAuthException;
import com.google.android.gms.auth.GoogleAuthUtil;
import com.google.android.gms.auth.UserRecoverableAuthException;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.games.GamesClient;
import com.google.android.gms.games.OnSignOutCompleteListener;
import com.google.android.gms.games.multiplayer.Invitation;
import com.google.android.gms.plus.PlusClient;
import com.google.android.gms.plus.PlusShare;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import com.miniclip.nativeJNI.cocojava;
import java.io.IOException;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.miniclip.GooglePlayServices.GooglePlayServices */
public class C1793GooglePlayServices implements GooglePlayServicesClient.ConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener, OnSignOutCompleteListener, PlusClient.OnPeopleLoadedListener {
    public static final int CLIENT_ALL = 7;
    public static final int CLIENT_APPSTATE = 4;
    public static final int CLIENT_GAMES = 1;
    public static final int CLIENT_NONE = 0;
    public static final int CLIENT_PLUS = 2;
    static final int RC_RESOLVE = 9001;
    static final int RC_UNUSED = 9002;
    public static final int REQUEST_AUTHORIZATION = 9000;
    public static final int REQUEST_SHARE = 0;
    static final String SIGN_IN_ERROR_MESSAGE = "Could not sign in. Please try again.";
    static final String SIGN_IN_MESSAGE = "Signing in with Google...";
    static final String SIGN_OUT_MESSAGE = "Signing out...";
    public static C1793GooglePlayServices gPlay;
    /* access modifiers changed from: private */
    public static Activity mActivity = null;
    protected static Context mContext = null;
    /* access modifiers changed from: private */
    public static int mDelegate;
    static PlusClient mPlusClient = null;
    /* access modifiers changed from: private */
    public static String mToken = "";
    /* access modifiers changed from: private */
    public static JSONObject people;
    AppStateClient mAppStateClient = null;
    boolean mAutoSignIn = true;
    int mClientCurrentlyConnecting = 0;
    int mConnectedClients = 0;
    ProgressDialog mConnectionProgressDialog = null;
    ConnectionResult mConnectionResult = null;
    boolean mDebugLog = true;
    String mDebugTag = "BaseGameActivity";
    boolean mExpectingActivityResult = false;
    GamesClient mGamesClient = null;
    String mInvitationId;
    GooglePlayServicesListener mListener = null;
    int mRequestedClients = 0;
    boolean mSignedIn = false;
    boolean mUserInitiatedSignIn = false;

    /* renamed from: com.miniclip.GooglePlayServices.GooglePlayServices$GooglePlayServicesListener */
    public interface GooglePlayServicesListener {
        void onSignInFailed();

        void onSignInSucceeded();
    }

    public static native void MGooglePlusSignInCallbackOnFailure(String str, int i);

    public static native void MGooglePlusSignInCallbackOnSuccess(String str, int i);

    public static native void MPeopleLoaded(String str, int i);

    public static void Setup(Activity activity) {
        gPlay = new C1793GooglePlayServices(activity);
        gPlay.setup((GooglePlayServicesListener) activity);
    }

    public C1793GooglePlayServices() {
    }

    public C1793GooglePlayServices(Activity activity) {
        mActivity = activity;
        mContext = activity;
    }

    public void setup(GooglePlayServicesListener listener) {
        setup(listener, 2);
    }

    public void setup(GooglePlayServicesListener listener, int clientsToUse) {
        people = new JSONObject();
        Log.d("tagg", "tagg setting up");
        this.mListener = listener;
        this.mConnectionProgressDialog = new ProgressDialog(mContext);
        this.mConnectionProgressDialog.setMessage(SIGN_IN_MESSAGE);
        this.mConnectionProgressDialog.setCancelable(false);
        this.mRequestedClients = clientsToUse;
        if ((clientsToUse & 1) != 0) {
            debugLog("onCreate: creating GamesClient");
            this.mGamesClient = new GamesClient.Builder(mContext, this, this).setGravityForPopups(49).create();
        }
        if ((clientsToUse & 2) != 0) {
            debugLog("onCreate: creating GamesPlusClient");
            mPlusClient = new PlusClient.Builder(mContext, this, this).setActions("http://schemas.google.com/AddActivity").setScopes(Scopes.PLUS_LOGIN, Scopes.PROFILE, "https://www.googleapis.com/auth/userinfo.email").build();
        }
        if ((clientsToUse & 4) != 0) {
            debugLog("onCreate: creating AppStateClient");
            this.mAppStateClient = new AppStateClient.Builder(mContext, this, this).create();
        }
    }

    public GamesClient getGamesClient() {
        if (this.mGamesClient != null) {
            return this.mGamesClient;
        }
        throw new IllegalStateException("No GamesClient. Did you request it at setup?");
    }

    public AppStateClient getAppStateClient() {
        if (this.mAppStateClient != null) {
            return this.mAppStateClient;
        }
        throw new IllegalStateException("No AppStateClient. Did you request it at setup?");
    }

    public PlusClient getPlusClient() {
        if (mPlusClient != null) {
            return mPlusClient;
        }
        throw new IllegalStateException("No PlusClient. Did you request it at setup?");
    }

    public boolean isSignedIn() {
        return this.mSignedIn;
    }

    /* access modifiers changed from: package-private */
    public void startConnections() {
        this.mConnectedClients = 0;
        this.mInvitationId = null;
        connectNextClient();
    }

    /* access modifiers changed from: package-private */
    public void connectNextClient() {
        int pendingClients = this.mRequestedClients & (this.mConnectedClients ^ -1);
        if (pendingClients == 0) {
            debugLog("All clients now connected. Sign-in successful.");
            succeedSignIn();
            return;
        }
        Log.d("tagg", "tagg connect next");
        this.mConnectionProgressDialog.setMessage(SIGN_IN_MESSAGE);
        this.mConnectionProgressDialog.show();
        try {
            if (this.mGamesClient != null && (pendingClients & 1) != 0) {
                debugLog("Connecting GamesClient.");
                this.mClientCurrentlyConnecting = 1;
            } else if (mPlusClient != null && (pendingClients & 2) != 0) {
                debugLog("Connecting PlusClient.");
                this.mClientCurrentlyConnecting = 2;
            } else if (this.mAppStateClient == null || (pendingClients & 4) == 0) {
                throw new AssertionError("Not all clients connected, yet no one is next. R=" + this.mRequestedClients + ", C=" + this.mConnectedClients);
            } else {
                debugLog("Connecting AppStateClient.");
                this.mClientCurrentlyConnecting = 4;
            }
            connectCurrentClient();
        } catch (Exception ex) {
            Log.e(this.mDebugTag, "*** EXCEPTION while attempting to connect. Details follow.");
            ex.printStackTrace();
            giveUp();
        }
    }

    /* access modifiers changed from: package-private */
    public void connectCurrentClient() {
        debugLog("tagg connecting a client");
        switch (this.mClientCurrentlyConnecting) {
            case 1:
                this.mGamesClient.connect();
                return;
            case 2:
                if (!mPlusClient.isConnected()) {
                    debugLog("...........................1");
                    mPlusClient.disconnect();
                    mPlusClient.connect();
                    return;
                }
                return;
            case 4:
                this.mAppStateClient.connect();
                return;
            default:
                return;
        }
    }

    /* access modifiers changed from: package-private */
    public void killConnections(int whatClients) {
        if (!((whatClients & 1) == 0 || this.mGamesClient == null || !this.mGamesClient.isConnected())) {
            this.mConnectedClients &= -2;
            this.mGamesClient.disconnect();
        }
        if (!((whatClients & 2) == 0 || mPlusClient == null || !mPlusClient.isConnected())) {
            this.mConnectedClients &= -3;
            mPlusClient.disconnect();
        }
        if ((whatClients & 4) != 0 && this.mAppStateClient != null && this.mAppStateClient.isConnected()) {
            this.mConnectedClients &= -5;
            this.mAppStateClient.disconnect();
        }
    }

    public void reconnectClients(int whatClients) {
        this.mConnectionProgressDialog.setMessage(SIGN_IN_MESSAGE);
        this.mConnectionProgressDialog.show();
        if (!((whatClients & 1) == 0 || this.mGamesClient == null || !this.mGamesClient.isConnected())) {
            this.mConnectedClients &= -2;
            this.mGamesClient.reconnect();
        }
        if (!((whatClients & 4) == 0 || this.mAppStateClient == null || !this.mAppStateClient.isConnected())) {
            this.mConnectedClients &= -5;
            this.mAppStateClient.reconnect();
        }
        debugLog("...........................2");
        mPlusClient.connect();
    }

    public void onConnected(Bundle connectionHint) {
        debugLog("onConnected: connected! client=" + this.mClientCurrentlyConnecting);
        this.mConnectedClients |= this.mClientCurrentlyConnecting;
        if (this.mClientCurrentlyConnecting == 1 && connectionHint != null) {
            debugLog("onConnected: connection hint provided. Checking for invite.");
            Invitation inv = (Invitation) connectionHint.getParcelable("invitation");
            if (!(inv == null || inv.getInvitationId() == null)) {
                debugLog("onConnected: connection hint has a room invite!");
                this.mInvitationId = inv.getInvitationId();
                debugLog("Invitation ID: " + this.mInvitationId);
            }
        }
        new Thread() {
            public void run() {
                try {
                    String unused = C1793GooglePlayServices.mToken = GoogleAuthUtil.getToken(C1793GooglePlayServices.mActivity, C1793GooglePlayServices.mPlusClient.getAccountName(), "oauth2:https://www.googleapis.com/auth/plus.login profile https://www.googleapis.com/auth/userinfo.email");
                    C1793GooglePlayServices.this.debugLog("Connected with token: " + C1793GooglePlayServices.mToken);
                    cocojava.mGLView.queueEvent(new Runnable() {
                        public void run() {
                            C1793GooglePlayServices.MGooglePlusSignInCallbackOnSuccess(C1793GooglePlayServices.mToken, C1793GooglePlayServices.mDelegate);
                        }
                    });
                } catch (UserRecoverableAuthException e) {
                    C1793GooglePlayServices.mActivity.startActivityForResult(e.getIntent(), C1793GooglePlayServices.REQUEST_AUTHORIZATION);
                    e.printStackTrace();
                } catch (IOException e2) {
                    e2.printStackTrace();
                } catch (GoogleAuthException e3) {
                    e3.printStackTrace();
                }
            }
        }.start();
        loadVisiblePeople();
        connectNextClient();
    }

    public void loadVisiblePeople() {
        debugLog("load Visible People");
        mPlusClient.loadVisiblePeople(this, (String) null);
    }

    /* access modifiers changed from: package-private */
    public void succeedSignIn() {
        debugLog("All requested clients connected. Sign-in succeeded!");
        this.mSignedIn = true;
        this.mAutoSignIn = true;
        debugLog("tagg SIGNED IN");
        this.mConnectionProgressDialog.dismiss();
        if (this.mListener != null) {
            this.mListener.onSignInSucceeded();
        }
    }

    public void onConnectionFailed(ConnectionResult result) {
        this.mConnectionResult = result;
        debugLog("onConnectionFailed: result " + result.getErrorCode());
        this.mConnectionProgressDialog.dismiss();
        if (!this.mUserInitiatedSignIn) {
            debugLog("onConnectionFailed: since user didn't initiate sign-in, failing now.");
            this.mConnectionResult = result;
            if (this.mListener != null) {
                this.mListener.onSignInFailed();
                return;
            }
            return;
        }
        debugLog("onConnectionFailed: since user initiated sign-in, trying to resolve problem.");
        resolveConnectionResult();
    }

    /* access modifiers changed from: package-private */
    public void resolveConnectionResult() {
        debugLog("resolveConnectionResult: trying to resolve result: " + this.mConnectionResult);
        if (this.mConnectionResult.hasResolution()) {
            debugLog("result has resolution. Starting it.");
            try {
                debugLog("trying to resolve");
                this.mExpectingActivityResult = true;
                this.mConnectionResult.startResolutionForResult(mActivity, RC_RESOLVE);
            } catch (IntentSender.SendIntentException e) {
                debugLog("SendIntentException.");
                connectCurrentClient();
            }
        } else {
            debugLog("resolveConnectionResult: result has no resolution. Giving up.");
            giveUp();
        }
    }

    public void onActivityResult(int requestCode, int responseCode, Intent intent) {
        debugLog("onActivityResult.................., req " + requestCode + " response " + responseCode);
        if (requestCode == RC_RESOLVE) {
            this.mExpectingActivityResult = false;
            debugLog("onActivityResult, req " + requestCode + " response " + responseCode);
            if (responseCode == -1) {
                debugLog("responseCode == RESULT_OK. So connecting.");
                connectCurrentClient();
                return;
            }
            debugLog("responseCode != RESULT_OK, so not reconnecting.");
            giveUp();
        }
    }

    /* access modifiers changed from: package-private */
    public void giveUp() {
        String str;
        Dialog errorDialog;
        this.mConnectionProgressDialog.dismiss();
        StringBuilder append = new StringBuilder().append("giveUp: giving up on connection. ");
        if (this.mConnectionResult == null) {
            str = "(no connection result)";
        } else {
            str = "Status code: " + this.mConnectionResult.getErrorCode();
        }
        debugLog(append.append(str).toString());
        if (this.mConnectionResult != null) {
            errorDialog = getErrorDialog(this.mConnectionResult.getErrorCode());
        } else {
            errorDialog = makeSignInErrorDialog(SIGN_IN_ERROR_MESSAGE);
        }
        this.mAutoSignIn = false;
        errorDialog.show();
        if (this.mListener != null) {
            this.mListener.onSignInFailed();
        }
        cocojava.mGLView.queueEvent(new Runnable() {
            public void run() {
                C1793GooglePlayServices.MGooglePlusSignInCallbackOnFailure("Cancelled", C1793GooglePlayServices.mDelegate);
            }
        });
    }

    public void beginUserInitiatedSignIn() {
        if (!this.mSignedIn) {
            this.mAutoSignIn = true;
            int result = GooglePlayServicesUtil.isGooglePlayServicesAvailable(mContext);
            debugLog("beginUserInitiatedSignIn: isGooglePlayServicesAvailable returned " + result);
            if (result != 0) {
                debugLog("beginUserInitiatedSignIn: Google Play services not available. Show error dialog.");
                if (this.mListener != null) {
                    this.mListener.onSignInFailed();
                    return;
                }
                return;
            }
            this.mUserInitiatedSignIn = true;
            if (this.mConnectionResult != null) {
                debugLog("beginUserInitiatedSignIn: continuing pending sign-in flow.");
                this.mConnectionProgressDialog.setMessage(SIGN_IN_MESSAGE);
                this.mConnectionProgressDialog.show();
                resolveConnectionResult();
                return;
            }
            debugLog("beginUserInitiatedSignIn: starting new sign-in flow.");
            startConnections();
        }
    }

    public void onDisconnected() {
        debugLog("onDisconnected.");
        this.mConnectionResult = null;
        this.mAutoSignIn = false;
        this.mSignedIn = false;
        this.mInvitationId = null;
        this.mConnectedClients = 0;
        if (this.mListener != null) {
            this.mListener.onSignInFailed();
        }
    }

    public void onStart() {
        debugLog("onStart.");
        if (this.mExpectingActivityResult) {
            debugLog("onStart: won't connect because we're expecting activity result.");
        } else if (!this.mAutoSignIn) {
            debugLog("onStart: not signing in because user specifically signed out.");
        } else {
            debugLog("onStart: connecting clients.");
            startConnections();
        }
    }

    public void onStop() {
        debugLog("onStop: disconnecting clients.");
        killConnections(7);
        this.mSignedIn = false;
    }

    /* access modifiers changed from: package-private */
    public Dialog getErrorDialog(int errorCode) {
        String userMessage;
        String logMessage;
        Dialog errorDialog;
        if (GooglePlayServicesUtil.isUserRecoverableError(errorCode) && (errorDialog = GooglePlayServicesUtil.getErrorDialog(this.mConnectionResult.getErrorCode(), mActivity, RC_UNUSED, (DialogInterface.OnCancelListener) null)) != null) {
            return errorDialog;
        }
        switch (errorCode) {
            case 0:
                userMessage = "Sign-in successful.";
                logMessage = "SUCCESS";
                break;
            case 1:
                userMessage = "Cannot sign-in. Verify that Google Play services are correctly installed and try again.";
                logMessage = "SERVICE_MISSING. Google Play services may not be installed on the device.";
                break;
            case 2:
                userMessage = "A newer version of Google Play services is required. Please update and try again.";
                logMessage = "SERVICE_VERSION_UPDATE_REQUIRED. Must install newer version of Google Play services.";
                break;
            case 3:
                userMessage = "Cannot sign-in. Verify that Google Play services are enabled and try again.";
                logMessage = "SERVICE_DISABLED: Google Play services may have been manually disabled.";
                break;
            case 4:
                userMessage = "There was an issue with sign-in.";
                logMessage = "SIGN_IN_REQUIRED";
                break;
            case 5:
                userMessage = "Invalid account. Try using a different account.";
                logMessage = "INVALID_ACCOUNT";
                break;
            case 6:
                userMessage = "There was a sign-in issue that could not be resolved.";
                logMessage = "RESOLUTION_REQUIRED: Result resolution is required, but was not performed.";
                break;
            case 7:
                userMessage = "There was a network problem while connecting. Please check that you are online and try again later.";
                logMessage = "NETWORK_ERROR: check connection, try again.";
                break;
            case 8:
                userMessage = "Internal error. Please try again later.";
                logMessage = "INTERNAL_ERROR";
                break;
            case 9:
                userMessage = "Cannot sign-in. Verify that Google Play services are correctly set up and try again.";
                logMessage = "SERVICE_INVALID. Google Play services may need to be reinstalled on device.";
                break;
            case 10:
                userMessage = "Application configuration problem.";
                logMessage = "DEVELOPER_ERROR: Check package name, signing certificate, app ID.";
                break;
            case 11:
                userMessage = "Cannot verify application license.";
                logMessage = "LICENSE_CHECK_FAILED: app license could not be verified.";
                break;
            default:
                userMessage = "An unexpected error occurred during sign-in. Try again later.";
                logMessage = "Unexpected error: " + this.mConnectionResult.getErrorCode();
                break;
        }
        debugLog("ERROR CODE " + errorCode + ": message=" + userMessage + "; details=" + logMessage);
        return makeSignInErrorDialog(userMessage);
    }

    public void showAlert(String title, String message) {
        new AlertDialog.Builder(mContext).setTitle(title).setMessage(message).setNeutralButton("OK", (DialogInterface.OnClickListener) null).create().show();
    }

    /* access modifiers changed from: package-private */
    public Dialog makeSignInErrorDialog(String message) {
        return new AlertDialog.Builder(mContext).setTitle("Sign-in error").setMessage(message).setNeutralButton("OK", (DialogInterface.OnClickListener) null).create();
    }

    public String getInvitationId() {
        return this.mInvitationId;
    }

    public void enableDebugLog(boolean enabled, String tag) {
        this.mDebugLog = enabled;
        this.mDebugTag = tag;
    }

    /* access modifiers changed from: package-private */
    public void debugLog(String message) {
        if (this.mDebugLog) {
            Log.d(this.mDebugTag, "GooglePlayServices: " + message);
        }
    }

    /* access modifiers changed from: package-private */
    public void signOut() {
        this.mConnectionResult = null;
        this.mAutoSignIn = false;
        this.mSignedIn = false;
        if (mPlusClient != null && mPlusClient.isConnected()) {
            mPlusClient.clearDefaultAccount();
        }
        if (this.mGamesClient != null && this.mGamesClient.isConnected()) {
            this.mConnectionProgressDialog.setMessage(SIGN_OUT_MESSAGE);
            this.mConnectionProgressDialog.show();
            this.mGamesClient.signOut(this);
        }
        killConnections(6);
    }

    public void onSignOutComplete() {
        if (this.mConnectionProgressDialog.isShowing()) {
            this.mConnectionProgressDialog.dismiss();
        }
        if (this.mGamesClient.isConnected()) {
            this.mGamesClient.disconnect();
        }
    }

    public void updateScore(String leaderboardId, long scoreValue, Object userData) {
        if (isSignedIn() && scoreValue >= 0) {
            getGamesClient().submitScore(leaderboardId, scoreValue);
        }
    }

    public void showLeaderboard(String leaderboardId) {
        if (isSignedIn()) {
            mActivity.startActivityForResult(getGamesClient().getLeaderboardIntent(leaderboardId), RC_UNUSED);
        } else {
            beginUserInitiatedSignIn();
        }
    }

    public void showLeaderboards() {
        if (isSignedIn()) {
            mActivity.startActivityForResult(getGamesClient().getAllLeaderboardsIntent(), RC_UNUSED);
        } else {
            beginUserInitiatedSignIn();
        }
    }

    public void updateAchievement(String achievementId, float progressValue, Object userData) {
        if (isSignedIn()) {
            getGamesClient().incrementAchievement(achievementId, (int) progressValue);
        }
    }

    public void unlockAchievement(String achievementId, Object userData) {
        if (isSignedIn()) {
            getGamesClient().unlockAchievement(achievementId);
        }
    }

    public void showAchievements() {
        if (isSignedIn()) {
            mActivity.startActivityForResult(getGamesClient().getAchievementsIntent(), RC_UNUSED);
        } else {
            beginUserInitiatedSignIn();
        }
    }

    public void share(String type, String text, String url) {
        debugLog("tagg sharing type " + type + " text " + text + " url " + url);
        mActivity.startActivityForResult(new PlusShare.Builder(mActivity).setType(type).setText(text).setContentUrl(Uri.parse(url)).getIntent(), 0);
    }

    public void onPeopleLoaded(ConnectionResult status, PersonBuffer personBuffer, String nextPageToken) {
        switch (status.getErrorCode()) {
            case 0:
                try {
                    int count = personBuffer.getCount();
                    Log.e("", "count : " + count);
                    for (int i = 0; i < count; i++) {
                        JSONObject person = new JSONObject();
                        person.put(Constants.APP_ID, personBuffer.get(i).getId());
                        person.put("name", personBuffer.get(i).getDisplayName());
                        person.put(PlusShare.KEY_CALL_TO_ACTION_URL, personBuffer.get(i).getImage().getUrl());
                        try {
                            people.put(String.valueOf(i), person);
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        debugLog("people are:" + personBuffer.get(i).getDisplayName() + " " + personBuffer.get(i).getId() + " isPlusUser : " + personBuffer.get(i).isPlusUser() + " isVerified : " + personBuffer.get(i).isVerified() + " hasCircledByCount : " + personBuffer.get(i).hasCircledByCount() + " getObjectType : " + personBuffer.get(i).getObjectType() + "Image : " + personBuffer.get(i).getImage().getUrl());
                    }
                    personBuffer.close();
                    cocojava.mGLView.queueEvent(new Runnable() {
                        public void run() {
                            C1793GooglePlayServices.MPeopleLoaded(C1793GooglePlayServices.people.toString(), C1793GooglePlayServices.mDelegate);
                        }
                    });
                    return;
                } catch (JSONException e2) {
                    e2.printStackTrace();
                } catch (Throwable th) {
                    personBuffer.close();
                    throw th;
                }
            case 4:
                mPlusClient.disconnect();
                debugLog("...........................3");
                mPlusClient.connect();
                return;
            default:
                debugLog("Error when listing people: " + status);
                return;
        }
    }

    public static String GPM_getToken() {
        return mToken;
    }

    public static void GPM_signIn(int delegate) {
        mDelegate = delegate;
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                C1793GooglePlayServices.gPlay.beginUserInitiatedSignIn();
            }
        });
    }

    public static void GPM_signOut(int delegate) {
        mDelegate = delegate;
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                C1793GooglePlayServices.gPlay.signOut();
            }
        });
    }

    public static void GPM_invite() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                C1793GooglePlayServices.gPlay.signOut();
            }
        });
    }

    public static void GPM_inviteAll() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                C1793GooglePlayServices.gPlay.signOut();
            }
        });
    }

    public static void GPM_gift() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                C1793GooglePlayServices.gPlay.signOut();
            }
        });
    }

    public static void GPM_giftAll() {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                C1793GooglePlayServices.gPlay.signOut();
            }
        });
    }

    public static void GPM_share(final String type, final String text, final String url) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                C1793GooglePlayServices.gPlay.share(type, text, url);
            }
        });
    }

    public static boolean GPM_isConnected() {
        return mPlusClient.isConnected();
    }

    public static String GPM_getVisiblePeople() {
        return people.toString();
    }

    public static String GPM_getCurrentPerson() {
        try {
            JSONObject person = new JSONObject();
            Person personData = mPlusClient.getCurrentPerson();
            person.put(Constants.APP_ID, personData.getId());
            person.put("name", personData.getDisplayName());
            person.put(PlusShare.KEY_CALL_TO_ACTION_URL, personData.getImage().getUrl());
            return person.toString();
        } catch (JSONException e) {
            e.printStackTrace();
            return "";
        }
    }
}
