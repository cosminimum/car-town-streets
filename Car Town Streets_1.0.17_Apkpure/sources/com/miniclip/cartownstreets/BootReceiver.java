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
/* loaded from: classes.dex */
public class BootReceiver extends BroadcastReceiver {
    private static String PreferenceId = "Preference.Id";
    private static String PreferenceTitle = "Notification.Title";
    private static String PreferenceText = "Notification.Text";
    private static String NotificationId = "Notification.Id";

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        try {
            Log.i("NOTIFICATION", "onreceive notification");
            int _nid = intent.getIntExtra(NotificationId, 0);
            SharedPreferences settings = context.getSharedPreferences(String.format("%d", Integer.valueOf(_nid)), 0);
            String _title = settings.getString(PreferenceTitle, "");
            String _text = settings.getString(PreferenceText, "");
            Intent gameIntent = new Intent(context, CarTownStreetsActivity.class);
            gameIntent.setAction("android.intent.action.MAIN");
            gameIntent.addCategory("android.intent.category.LAUNCHER");
            gameIntent.addFlags(603979776);
            int resourceId = context.getResources().getIdentifier("icon", "drawable", context.getPackageName());
            Notification notification = new Notification(resourceId, _title, System.currentTimeMillis());
            notification.defaults |= 4;
            notification.flags |= 16;
            notification.setLatestEventInfo(context, _title, _text, PendingIntent.getActivity(context, _nid, gameIntent, DriveFile.MODE_READ_ONLY));
            NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
            notificationManager.notify(_nid, notification);
        } catch (Exception e) {
            Log.d("BootReceiver", "An alarm was received but there was an error");
            e.printStackTrace();
        }
    }

    public static void setupAlarm(Context context, int nid, String title, String text, int seconds) {
        Log.i("NOTIFICATION", String.format("id: %d title: %s text:%s", Integer.valueOf(nid), title, text));
        Log.i("NOTIFICATION", String.format("current time: %d", Long.valueOf(System.currentTimeMillis())));
        Log.i("NOTIFICATION", String.format("seconds: %d", Integer.valueOf(seconds)));
        Log.i("NOTIFICATION", String.format("seconds*1000: %d", Integer.valueOf(seconds * 1000)));
        Log.i("NOTIFICATION", String.format("current time: %d", Long.valueOf(System.currentTimeMillis() + (seconds * 1000))));
        SharedPreferences settings = context.getSharedPreferences(String.format("%d", Integer.valueOf(nid)), 0);
        SharedPreferences.Editor edit = settings.edit();
        edit.putString(PreferenceTitle, title);
        edit.putString(PreferenceText, text);
        edit.commit();
        Intent intent = new Intent(context, BootReceiver.class);
        intent.putExtra(NotificationId, nid);
        AlarmManager am = (AlarmManager) context.getSystemService("alarm");
        am.set(0, System.currentTimeMillis() + (seconds * 1000), PendingIntent.getBroadcast(context, nid, intent, DriveFile.MODE_READ_ONLY));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static void removeAlarm(Context context, int nid) {
        Log.i("NOTIFICATION", String.format("cancel id: %d", Integer.valueOf(nid)));
        Intent intent = new Intent(context, BootReceiver.class);
        intent.putExtra(NotificationId, nid);
        AlarmManager am = (AlarmManager) context.getSystemService("alarm");
        am.cancel(PendingIntent.getBroadcast(context, 0, intent, DriveFile.MODE_READ_ONLY));
        NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
        notificationManager.cancel(nid);
    }
}
