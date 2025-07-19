package com.miniclip.cartownstreets;

import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import com.google.android.gms.drive.DriveFile;

public class BootReceiver extends BroadcastReceiver {
    private static String NotificationId = "Notification.Id";
    private static String PreferenceId = "Preference.Id";
    private static String PreferenceText = "Notification.Text";
    private static String PreferenceTitle = "Notification.Title";

    public void onReceive(Context context, Intent intent) {
        try {
            Log.i("NOTIFICATION", "onreceive notification");
            int _nid = intent.getIntExtra(NotificationId, 0);
            SharedPreferences settings = context.getSharedPreferences(String.format("%d", new Object[]{Integer.valueOf(_nid)}), 0);
            String _title = settings.getString(PreferenceTitle, "");
            String _text = settings.getString(PreferenceText, "");
            Intent gameIntent = new Intent(context, CarTownStreetsActivity.class);
            gameIntent.setAction("android.intent.action.MAIN");
            gameIntent.addCategory("android.intent.category.LAUNCHER");
            gameIntent.addFlags(603979776);
            Notification notification = new Notification(context.getResources().getIdentifier("icon", "drawable", context.getPackageName()), _title, System.currentTimeMillis());
            notification.defaults |= 4;
            notification.flags |= 16;
            notification.setLatestEventInfo(context, _title, _text, PendingIntent.getActivity(context, _nid, gameIntent, DriveFile.MODE_READ_ONLY));
            ((NotificationManager) context.getSystemService("notification")).notify(_nid, notification);
        } catch (Exception e) {
            Log.d("BootReceiver", "An alarm was received but there was an error");
            e.printStackTrace();
        }
    }

    public static void setupAlarm(Context context, int nid, String title, String text, int seconds) {
        Log.i("NOTIFICATION", String.format("id: %d title: %s text:%s", new Object[]{Integer.valueOf(nid), title, text}));
        Log.i("NOTIFICATION", String.format("current time: %d", new Object[]{Long.valueOf(System.currentTimeMillis())}));
        Log.i("NOTIFICATION", String.format("seconds: %d", new Object[]{Integer.valueOf(seconds)}));
        Log.i("NOTIFICATION", String.format("seconds*1000: %d", new Object[]{Integer.valueOf(seconds * 1000)}));
        Log.i("NOTIFICATION", String.format("current time: %d", new Object[]{Long.valueOf(System.currentTimeMillis() + ((long) (seconds * 1000)))}));
        SharedPreferences.Editor edit = context.getSharedPreferences(String.format("%d", new Object[]{Integer.valueOf(nid)}), 0).edit();
        edit.putString(PreferenceTitle, title);
        edit.putString(PreferenceText, text);
        edit.commit();
        Intent intent = new Intent(context, BootReceiver.class);
        intent.putExtra(NotificationId, nid);
        ((AlarmManager) context.getSystemService("alarm")).set(0, System.currentTimeMillis() + ((long) (seconds * 1000)), PendingIntent.getBroadcast(context, nid, intent, DriveFile.MODE_READ_ONLY));
    }

    protected static void removeAlarm(Context context, int nid) {
        Log.i("NOTIFICATION", String.format("cancel id: %d", new Object[]{Integer.valueOf(nid)}));
        Intent intent = new Intent(context, BootReceiver.class);
        intent.putExtra(NotificationId, nid);
        ((AlarmManager) context.getSystemService("alarm")).cancel(PendingIntent.getBroadcast(context, 0, intent, DriveFile.MODE_READ_ONLY));
        ((NotificationManager) context.getSystemService("notification")).cancel(nid);
    }
}
