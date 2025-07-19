package com.res.recartownstreets.core;

import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;

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
            gameIntent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP + Intent.FLAG_ACTIVITY_SINGLE_TOP);

            //@todo remove after it's work the new way of notification
            //@todo check what happens with this kind of PendingIntent
            //@todo possible source of bugs
//            Notification notification = new Notification(context.getResources().getIdentifier("icon", "drawable", context.getPackageName()), _title, System.currentTimeMillis());
            Notification notification = new Notification.Builder(context)
                    .setContentTitle(_title)
                    .setContentText(_title)
                    .setSmallIcon(context.getResources().getIdentifier("icon", "drawable", context.getPackageName()))
                    .setContentIntent(PendingIntent.getActivity(context, _nid, gameIntent, PendingIntent.FLAG_MUTABLE))
                    .build();

            notification.defaults |= 4;
            notification.flags |= 16;

            ((NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE)).notify(_nid, notification);
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

        //@todo don't know what is cause PendingIntent.FLAG_MUTABLE. TBD
        ((AlarmManager) context.getSystemService(Context.ALARM_SERVICE)).set(AlarmManager.RTC_WAKEUP, System.currentTimeMillis() + ((long) (seconds * 1000)), PendingIntent.getBroadcast(context, nid, intent, PendingIntent.FLAG_MUTABLE));
    }

    protected static void removeAlarm(Context context, int nid) {
        Log.i("NOTIFICATION", String.format("cancel id: %d", new Object[]{Integer.valueOf(nid)}));
        Intent intent = new Intent(context, BootReceiver.class);
        intent.putExtra(NotificationId, nid);

        //@todo don't know what is cause PendingIntent.FLAG_MUTABLE. TBD
        ((AlarmManager) context.getSystemService(Context.ALARM_SERVICE)).cancel(PendingIntent.getBroadcast(context, 0, intent, PendingIntent.FLAG_MUTABLE));
        ((NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE)).cancel(nid);
    }
}
