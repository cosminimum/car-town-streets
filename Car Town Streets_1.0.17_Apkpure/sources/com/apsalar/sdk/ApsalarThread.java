package com.apsalar.sdk;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;
import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: ApThread.java */
/* loaded from: classes.dex */
public class ApsalarThread extends Thread {
    private static final int BUFFER_SIZE_MAX = 1000;
    private static final int HEARTBEAT_INTERVAL_BACKOFF = 2;
    private static final int HEARTBEAT_INTERVAL_MAX = 21600000;
    protected static final int HEARTBEAT_INTERVAL_MIN = 300000;
    protected static final int QUEUE_SIZE_MAX = 10000;
    private static final int RETRY_INTERVAL_BACKOFF = 2;
    private static final int RETRY_INTERVAL_MAX = 300000;
    private static String apiKey = null;
    private static final String countEventsSQL = "SELECT count(serial) FROM backlog";
    private static Context ctx = null;
    private static String secret = null;
    private static final String selectEventsSQL = "SELECT serial, session_json, event_json FROM backlog ORDER BY serial";
    private static final String tableBacklogSQL = "CREATE TABLE IF NOT EXISTS backlog (serial INTEGER PRIMARY KEY,session_json TEXT,event_json TEXT)";
    private static final boolean useBuffering = true;
    private static ApsalarThread singleton = null;
    private static int bufferSize = 0;
    private static long lastEventTime = 0;
    private static int heartbeatInterval = 300000;
    private static final int RETRY_INTERVAL_MIN = 15000;
    private static int retryInterval = RETRY_INTERVAL_MIN;
    private static SQLiteDatabase buffer = null;
    private static SQLiteOpenHelper dbOpener = null;
    protected ApsalarSessionInfo lastSessionInfo = null;
    protected ArrayBlockingQueue<ApsalarAPI> events = new ArrayBlockingQueue<>(QUEUE_SIZE_MAX);

    /* compiled from: ApThread.java */
    /* loaded from: classes.dex */
    private static class State {
        static final int BUFFERING = 3;
        static final int NOMINAL = 2;
        static final int RECOVERY = 1;

        private State() {
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static ApsalarThread getInstance() {
        if (singleton == null) {
            return null;
        }
        return singleton;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static ApsalarThread getInstance(Context context, String str, String str2) {
        ctx = context;
        apiKey = str;
        secret = str2;
        String packageName = ctx.getPackageName();
        String str3 = "";
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
            messageDigest.update(secret.getBytes("UTF-8"));
            messageDigest.update(packageName.getBytes("UTF-8"));
            str3 = Apsalar.hexDigest(messageDigest.digest());
        } catch (UnsupportedEncodingException e) {
        } catch (IndexOutOfBoundsException e2) {
        } catch (NoSuchAlgorithmException e3) {
        }
        try {
            if (buffer != null) {
                buffer.close();
            }
            if (dbOpener == null) {
                dbOpener = new ApsalarSQLiteOpenHelper(ctx, "Apsalar.sqlite_" + str3);
            }
            buffer = dbOpener.getWritableDatabase();
            buffer.execSQL(tableBacklogSQL);
        } catch (SQLiteException e4) {
            buffer = null;
        } catch (IllegalStateException e5) {
            buffer = null;
        }
        if (singleton == null) {
            singleton = new ApsalarThread();
            singleton.setDaemon(true);
            singleton.setName("ApsalarThread");
        }
        if (!singleton.isAlive()) {
            singleton.start();
        }
        return singleton;
    }

    private ApsalarThread() {
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        int i = 1;
        while (true) {
            switch (i) {
                case 1:
                    i = recovery();
                case 2:
                    i = nominal();
                case 3:
                    i = buffering();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0051 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00e9 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00cf  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int recovery() {
        /*
            Method dump skipped, instructions count: 288
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.apsalar.sdk.ApsalarThread.recovery():int");
    }

    private int nominal() {
        ApsalarHeartbeat apsalarHeartbeat;
        int i;
        lastEventTime = System.currentTimeMillis();
        while (true) {
            try {
                ApsalarAPI poll = this.events.poll(this.lastSessionInfo == null ? Long.MAX_VALUE : heartbeatInterval - (System.currentTimeMillis() - lastEventTime), TimeUnit.MILLISECONDS);
                if (poll != null || this.lastSessionInfo == null) {
                    apsalarHeartbeat = poll;
                } else {
                    ApsalarHeartbeat apsalarHeartbeat2 = new ApsalarHeartbeat(this.lastSessionInfo);
                    heartbeatInterval *= 2;
                    if (heartbeatInterval > HEARTBEAT_INTERVAL_MAX) {
                        heartbeatInterval = HEARTBEAT_INTERVAL_MAX;
                    }
                    lastEventTime = System.currentTimeMillis();
                    apsalarHeartbeat = apsalarHeartbeat2;
                }
                if (apsalarHeartbeat != null) {
                    if (apsalarHeartbeat instanceof ApsalarSession) {
                        this.lastSessionInfo = ((ApsalarEvent) apsalarHeartbeat).info;
                        heartbeatInterval = 300000;
                        lastEventTime = System.currentTimeMillis();
                    }
                    int REST = apsalarHeartbeat.REST();
                    JSONObject jSONObject = ((ApsalarEvent) apsalarHeartbeat).returnDataJSON;
                    boolean z = false;
                    if (jSONObject != null) {
                        z = jSONObject.has("first_time");
                    }
                    if (z) {
                        Apsalar.sendFBInstall();
                        Apsalar.sendReferrerInstall();
                    }
                    i = REST;
                } else {
                    i = -1;
                }
            } catch (InterruptedException e) {
            }
            switch (i) {
                case 0:
                    if (!(apsalarHeartbeat instanceof ApsalarJSON)) {
                        continue;
                    } else if (buffer != null) {
                        bufferEvent(apsalarHeartbeat);
                        return 3;
                    } else {
                        ArrayBlockingQueue<ApsalarAPI> arrayBlockingQueue = new ArrayBlockingQueue<>(QUEUE_SIZE_MAX);
                        arrayBlockingQueue.offer(apsalarHeartbeat);
                        this.events.drainTo(arrayBlockingQueue);
                        this.events = arrayBlockingQueue;
                    }
                default:
                    continue;
            }
        }
    }

    private int buffering() {
        if (dbOpener == null || buffer == null) {
            return 2;
        }
        try {
            buffer = dbOpener.getWritableDatabase();
            Cursor rawQuery = buffer.rawQuery(countEventsSQL, null);
            try {
                rawQuery.moveToNext();
                bufferSize = rawQuery.getInt(0);
            } catch (SQLiteException e) {
                bufferSize = 0;
            }
            rawQuery.close();
            lastEventTime = System.currentTimeMillis();
            while (true) {
                try {
                    ApsalarAPI poll = this.events.poll(retryInterval - (System.currentTimeMillis() - lastEventTime), TimeUnit.MILLISECONDS);
                    lastEventTime = System.currentTimeMillis();
                    if (poll != null) {
                        if (poll instanceof ApsalarRetry) {
                            return 1;
                        }
                        if ((poll instanceof ApsalarJSON) && bufferEvent(poll)) {
                        }
                    } else {
                        retryInterval = (int) ((1.0d + Math.random()) * retryInterval * 2.0d);
                        if (retryInterval > 300000) {
                            retryInterval = 300000;
                        }
                        ApsalarRetryThread.getInstance().events.offer(new ApsalarRetry());
                    }
                } catch (InterruptedException e2) {
                }
            }
        } catch (IllegalStateException e3) {
            buffer = null;
            return 2;
        }
    }

    protected static boolean bufferEvent(ApsalarAPI apsalarAPI) {
        if (buffer != null && bufferSize < 1000) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("session_json", ((ApsalarEvent) apsalarAPI).getInfo().toJSON().toString());
            contentValues.put("event_json", ((ApsalarJSON) apsalarAPI).toJSON().toString());
            try {
                buffer = dbOpener.getWritableDatabase();
                buffer.insert("backlog", null, contentValues);
                bufferSize++;
                return true;
            } catch (IllegalStateException e) {
                buffer = null;
                return false;
            }
        }
        return false;
    }
}
