package com.miniclip.cartownstreets;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import com.facebook.internal.ServerProtocol;
import com.google.android.gcm.GCMBaseIntentService;
import com.google.android.gms.plus.PlusShare;
import com.miniclip.newsfeed.Newsfeed;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class GCMIntentService extends GCMBaseIntentService {
    @Override // com.google.android.gcm.GCMBaseIntentService
    protected String[] getSenderIds(Context context) {
        String[] senderIds = {"1040273365599"};
        return senderIds;
    }

    public void showNotification(Context context, String title, String message) {
        NotificationManager notifManager = (NotificationManager) getSystemService("notification");
        int resourceId = context.getResources().getIdentifier("icon", "drawable", context.getPackageName());
        Notification note = new Notification(resourceId, title, System.currentTimeMillis());
        Intent intent = new Intent(this, CarTownStreetsActivity.class);
        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, intent, 0);
        note.setLatestEventInfo(this, title, message, pendingIntent);
        note.defaults |= 4;
        note.flags |= 16;
        notifManager.notify(Newsfeed.NOTIF_ID, note);
    }

    @Override // com.google.android.gcm.GCMBaseIntentService
    protected void onError(Context context, String errorId) {
        Log.i("GCMIntentService", "onError: " + errorId);
    }

    @Override // com.google.android.gcm.GCMBaseIntentService
    protected void onMessage(Context context, Intent intent) {
        Log.i("GCMIntentService", "onMessage: " + intent.getExtras());
        if (intent.getExtras().containsKey("miniclip")) {
            try {
                JSONObject miniclip_object = new JSONObject(intent.getExtras().getString("miniclip"));
                String message_type = miniclip_object.getString("mc_message_type");
                Log.i("GCMIntentService", "MessageType: " + message_type);
                if (message_type.contentEquals("game_message")) {
                    String title = miniclip_object.getString(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_TITLE);
                    String message = miniclip_object.getString("message");
                    Log.i("GCMIntentService", "Title: " + title);
                    Log.i("GCMIntentService", "Message: " + message);
                    showNotification(context, title, message);
                    if (miniclip_object.has("user_dict")) {
                        JSONObject user_dict = miniclip_object.getJSONObject("user_dict");
                        Log.i("GCMIntentService", "UserDict: " + user_dict.toString(2));
                        if (user_dict.has(ServerProtocol.DIALOG_PARAM_TYPE) && user_dict.getString(ServerProtocol.DIALOG_PARAM_TYPE).contentEquals("request_match_t")) {
                            SharedPreferences_setInt("GameRequestNotification_status", 1);
                            SharedPreferences_setString("GameRequestNotification_opponent", user_dict.getJSONObject("match_request_data").getString("opponent"));
                            SharedPreferences_setString("GameRequestNotification_opponentName", user_dict.getJSONObject("match_request_data").getString("opponent_name"));
                            SharedPreferences_setString("GameRequestNotification_tier", user_dict.getJSONObject("match_request_data").getString("tier"));
                        }
                    }
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.google.android.gcm.GCMBaseIntentService
    protected void onRegistered(Context context, String regId) {
        Log.i("GCMIntentService", "onRegistered: " + regId);
    }

    @Override // com.google.android.gcm.GCMBaseIntentService
    protected void onUnregistered(Context context, String regId) {
        Log.i("GCMIntentService", "onUnregistered: " + regId);
    }

    public void SharedPreferences_setInt(String key, int value) {
        SharedPreferences settings = getSharedPreferences("GAME_INFO", 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putInt(key, value);
        editor.commit();
    }

    public void SharedPreferences_setString(String key, String value) {
        SharedPreferences settings = getSharedPreferences("GAME_INFO", 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString(key, value);
        editor.commit();
    }
}
