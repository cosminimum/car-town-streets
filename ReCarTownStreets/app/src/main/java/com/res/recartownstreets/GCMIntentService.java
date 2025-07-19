package com.res.recartownstreets;

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

public class GCMIntentService {
    /* access modifiers changed from: protected */
    public String[] getSenderIds(Context context) {
        return new String[]{"1040273365599"};
    }

    public void showNotification(Context context, String title, String message) {
        Notification note = new Notification(context.getResources().getIdentifier("icon", "drawable", context.getPackageName()), title, System.currentTimeMillis());
        note.defaults |= 4;
        note.flags |= 16;
    }

    /* access modifiers changed from: protected */
    public void onError(Context context, String errorId) {
        Log.i("GCMIntentService", "onError: " + errorId);
    }

    /* access modifiers changed from: protected */
    public void onMessage(Context context, Intent intent) {
        Log.i("GCMIntentService", "onMessage: " + intent.getExtras());
        if (intent.getExtras().containsKey("miniclip")) {
            try {
                JSONObject miniclip_object = new JSONObject(intent.getExtras().getString("miniclip"));
                String message_type = miniclip_object.getString("mc_message_type");
                Log.i("GCMIntentService", "MessageType: " + message_type);
                if (message_type.contentEquals("game_message")) {
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

    /* access modifiers changed from: protected */
    public void onRegistered(Context context, String regId) {
        Log.i("GCMIntentService", "onRegistered: " + regId);
    }

    /* access modifiers changed from: protected */
    public void onUnregistered(Context context, String regId) {
        Log.i("GCMIntentService", "onUnregistered: " + regId);
    }

    public void SharedPreferences_setInt(String key, int value) {
        SharedPreferences.Editor editor = getSharedPreferences("GAME_INFO", 0).edit();
        editor.putInt(key, value);
        editor.commit();
    }

    public void SharedPreferences_setString(String key, String value) {
        SharedPreferences.Editor editor = getSharedPreferences("GAME_INFO", 0).edit();
        editor.putString(key, value);
        editor.commit();
    }
}
