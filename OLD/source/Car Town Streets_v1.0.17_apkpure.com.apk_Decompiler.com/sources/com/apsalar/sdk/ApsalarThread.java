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

/* compiled from: ApThread */
class ApsalarThread extends Thread {
    private static final int BUFFER_SIZE_MAX = 1000;
    private static final int HEARTBEAT_INTERVAL_BACKOFF = 2;
    private static final int HEARTBEAT_INTERVAL_MAX = 21600000;
    protected static final int HEARTBEAT_INTERVAL_MIN = 300000;
    protected static final int QUEUE_SIZE_MAX = 10000;
    private static final int RETRY_INTERVAL_BACKOFF = 2;
    private static final int RETRY_INTERVAL_MAX = 300000;
    private static final int RETRY_INTERVAL_MIN = 15000;
    private static String apiKey = null;
    private static SQLiteDatabase buffer = null;
    private static int bufferSize = 0;
    private static final String countEventsSQL = "SELECT count(serial) FROM backlog";
    private static Context ctx = null;
    private static SQLiteOpenHelper dbOpener = null;
    private static int heartbeatInterval = 300000;
    private static long lastEventTime = 0;
    private static int retryInterval = RETRY_INTERVAL_MIN;
    private static String secret = null;
    private static final String selectEventsSQL = "SELECT serial, session_json, event_json FROM backlog ORDER BY serial";
    private static ApsalarThread singleton = null;
    private static final String tableBacklogSQL = "CREATE TABLE IF NOT EXISTS backlog (serial INTEGER PRIMARY KEY,session_json TEXT,event_json TEXT)";
    private static final boolean useBuffering = true;
    protected ArrayBlockingQueue<ApsalarAPI> events = new ArrayBlockingQueue<>(QUEUE_SIZE_MAX);
    protected ApsalarSessionInfo lastSessionInfo = null;

    /* compiled from: ApThread */
    private static class State {
        static final int BUFFERING = 3;
        static final int NOMINAL = 2;
        static final int RECOVERY = 1;

        private State() {
        }
    }

    protected static ApsalarThread getInstance() {
        if (singleton == null) {
            return null;
        }
        return singleton;
    }

    protected static ApsalarThread getInstance(Context context, String str, String str2) {
        ctx = context;
        apiKey = str;
        secret = str2;
        String packageName = ctx.getPackageName();
        String str3 = "";
        try {
            MessageDigest instance = MessageDigest.getInstance("SHA-1");
            instance.update(secret.getBytes("UTF-8"));
            instance.update(packageName.getBytes("UTF-8"));
            str3 = Apsalar.hexDigest(instance.digest());
        } catch (UnsupportedEncodingException | IndexOutOfBoundsException | NoSuchAlgorithmException e) {
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
        } catch (SQLiteException e2) {
            buffer = null;
        } catch (IllegalStateException e3) {
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

    public void run() {
        int i = 1;
        while (true) {
            switch (i) {
                case 1:
                    i = recovery();
                    break;
                case 2:
                    i = nominal();
                    break;
                case 3:
                    i = buffering();
                    break;
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x004d  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0051 A[SYNTHETIC, Splitter:B:24:0x0051] */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x0087  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x00b8  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x00cf  */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00e9 A[SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private int recovery() {
        /*
            r13 = this;
            r4 = 0
            r5 = 2
            r3 = 0
            android.database.sqlite.SQLiteOpenHelper r0 = dbOpener
            if (r0 == 0) goto L_0x000b
            android.database.sqlite.SQLiteDatabase r0 = buffer
            if (r0 != 0) goto L_0x000d
        L_0x000b:
            r0 = r5
        L_0x000c:
            return r0
        L_0x000d:
            android.database.sqlite.SQLiteOpenHelper r0 = dbOpener     // Catch:{ IllegalStateException -> 0x006f, SQLiteException -> 0x0072 }
            android.database.sqlite.SQLiteDatabase r0 = r0.getWritableDatabase()     // Catch:{ IllegalStateException -> 0x006f, SQLiteException -> 0x0072 }
            buffer = r0     // Catch:{ IllegalStateException -> 0x006f, SQLiteException -> 0x0072 }
            android.database.sqlite.SQLiteDatabase r0 = buffer     // Catch:{ IllegalStateException -> 0x006f, SQLiteException -> 0x0072 }
            java.lang.String r1 = "SELECT serial, session_json, event_json FROM backlog ORDER BY serial"
            r2 = 0
            android.database.Cursor r8 = r0.rawQuery(r1, r2)     // Catch:{ IllegalStateException -> 0x006f, SQLiteException -> 0x0072 }
            r2 = r4
            r0 = r4
        L_0x0020:
            boolean r1 = r8.moveToNext()
            if (r1 == 0) goto L_0x00f4
            r1 = 0
            int r6 = r8.getInt(r1)     // Catch:{ SQLiteException -> 0x00fa }
            r1 = 1
            java.lang.String r7 = r8.getString(r1)     // Catch:{ SQLiteException -> 0x00fa }
            r1 = 2
            java.lang.String r9 = r8.getString(r1)     // Catch:{ SQLiteException -> 0x00fa }
            org.json.JSONObject r1 = new org.json.JSONObject     // Catch:{ JSONException -> 0x00ff }
            r1.<init>(r7)     // Catch:{ JSONException -> 0x00ff }
            org.json.JSONObject r0 = new org.json.JSONObject     // Catch:{ JSONException -> 0x0104, SQLiteException -> 0x00fc }
            r0.<init>(r9)     // Catch:{ JSONException -> 0x0104, SQLiteException -> 0x00fc }
            java.lang.String r2 = "eventType"
            int r2 = r0.getInt(r2)     // Catch:{ JSONException -> 0x007c, SQLiteException -> 0x007f }
        L_0x0045:
            r7 = r6
            r12 = r1
            r1 = r0
            r0 = r2
            r2 = r12
        L_0x004a:
            switch(r0) {
                case 1: goto L_0x0087;
                case 2: goto L_0x004d;
                case 3: goto L_0x00b8;
                case 4: goto L_0x00cf;
                default: goto L_0x004d;
            }
        L_0x004d:
            r0 = -1
        L_0x004e:
            switch(r0) {
                case 0: goto L_0x00e9;
                default: goto L_0x0051;
            }
        L_0x0051:
            android.database.sqlite.SQLiteOpenHelper r0 = dbOpener     // Catch:{ IllegalStateException -> 0x00ef }
            android.database.sqlite.SQLiteDatabase r0 = r0.getWritableDatabase()     // Catch:{ IllegalStateException -> 0x00ef }
            buffer = r0     // Catch:{ IllegalStateException -> 0x00ef }
            android.database.sqlite.SQLiteDatabase r0 = buffer     // Catch:{ IllegalStateException -> 0x00ef }
            java.lang.String r6 = "backlog"
            java.lang.String r9 = "serial = ?"
            r10 = 1
            java.lang.String[] r10 = new java.lang.String[r10]     // Catch:{ IllegalStateException -> 0x00ef }
            r11 = 0
            java.lang.String r7 = java.lang.String.valueOf(r7)     // Catch:{ IllegalStateException -> 0x00ef }
            r10[r11] = r7     // Catch:{ IllegalStateException -> 0x00ef }
            r0.delete(r6, r9, r10)     // Catch:{ IllegalStateException -> 0x00ef }
            r0 = r2
            r2 = r1
            goto L_0x0020
        L_0x006f:
            r0 = move-exception
            r0 = r5
            goto L_0x000c
        L_0x0072:
            r0 = move-exception
            java.lang.String r0 = "Apsalar SDK/Thread"
            java.lang.String r1 = "database SQLiteException"
            android.util.Log.e(r0, r1)
            r0 = r5
            goto L_0x000c
        L_0x007c:
            r2 = move-exception
        L_0x007d:
            r2 = r3
            goto L_0x0045
        L_0x007f:
            r2 = move-exception
            r2 = r0
            r0 = r1
        L_0x0082:
            r1 = r2
            r7 = r3
            r2 = r0
            r0 = r3
            goto L_0x004a
        L_0x0087:
            com.apsalar.sdk.ApsalarSessionInfo r0 = new com.apsalar.sdk.ApsalarSessionInfo
            java.lang.String r6 = apiKey
            java.lang.String r9 = secret
            r0.<init>((org.json.JSONObject) r2, (java.lang.String) r6, (java.lang.String) r9)
            r13.lastSessionInfo = r0
            r0 = 300000(0x493e0, float:4.2039E-40)
            heartbeatInterval = r0
            com.apsalar.sdk.ApsalarSession r0 = new com.apsalar.sdk.ApsalarSession
            com.apsalar.sdk.ApsalarSessionInfo r6 = r13.lastSessionInfo
            r0.<init>(r6, r1)
            int r6 = r0.REST()
            com.apsalar.sdk.ApsalarEvent r0 = (com.apsalar.sdk.ApsalarEvent) r0
            org.json.JSONObject r0 = r0.returnDataJSON
            if (r0 == 0) goto L_0x010b
            java.lang.String r9 = "first_time"
            boolean r0 = r0.has(r9)
        L_0x00ae:
            if (r0 == 0) goto L_0x0108
            com.apsalar.sdk.Apsalar.sendFBInstall()
            com.apsalar.sdk.Apsalar.sendReferrerInstall()
            r0 = r6
            goto L_0x004e
        L_0x00b8:
            com.apsalar.sdk.ApsalarSessionInfo r0 = new com.apsalar.sdk.ApsalarSessionInfo
            java.lang.String r6 = apiKey
            java.lang.String r9 = secret
            r0.<init>((org.json.JSONObject) r2, (java.lang.String) r6, (java.lang.String) r9)
            r13.lastSessionInfo = r0
            com.apsalar.sdk.ApsalarEvent r0 = new com.apsalar.sdk.ApsalarEvent
            com.apsalar.sdk.ApsalarSessionInfo r6 = r13.lastSessionInfo
            r0.<init>((com.apsalar.sdk.ApsalarSessionInfo) r6, (org.json.JSONObject) r1)
            int r0 = r0.REST()
            goto L_0x004e
        L_0x00cf:
            com.apsalar.sdk.ApsalarSessionInfo r0 = new com.apsalar.sdk.ApsalarSessionInfo
            java.lang.String r6 = apiKey
            java.lang.String r9 = secret
            r0.<init>((org.json.JSONObject) r2, (java.lang.String) r6, (java.lang.String) r9)
            r13.lastSessionInfo = r0
            com.apsalar.sdk.ApsalarEndSession r0 = new com.apsalar.sdk.ApsalarEndSession
            com.apsalar.sdk.ApsalarSessionInfo r6 = r13.lastSessionInfo
            r0.<init>(r6, r1)
            int r0 = r0.REST()
            r13.lastSessionInfo = r4
            goto L_0x004e
        L_0x00e9:
            r8.close()
            r0 = 3
            goto L_0x000c
        L_0x00ef:
            r0 = move-exception
            r0 = r2
            r2 = r1
            goto L_0x0020
        L_0x00f4:
            r8.close()
            r0 = r5
            goto L_0x000c
        L_0x00fa:
            r1 = move-exception
            goto L_0x0082
        L_0x00fc:
            r0 = move-exception
            r0 = r1
            goto L_0x0082
        L_0x00ff:
            r1 = move-exception
            r1 = r0
            r0 = r2
            goto L_0x007d
        L_0x0104:
            r0 = move-exception
            r0 = r2
            goto L_0x007d
        L_0x0108:
            r0 = r6
            goto L_0x004e
        L_0x010b:
            r0 = r3
            goto L_0x00ae
        */
        throw new UnsupportedOperationException("Method not decompiled: com.apsalar.sdk.ApsalarThread.recovery():int");
    }

    private int nominal() {
        long currentTimeMillis;
        ApsalarHeartbeat apsalarHeartbeat;
        int i;
        lastEventTime = System.currentTimeMillis();
        while (true) {
            try {
                ArrayBlockingQueue<ApsalarAPI> arrayBlockingQueue = this.events;
                if (this.lastSessionInfo == null) {
                    currentTimeMillis = Long.MAX_VALUE;
                } else {
                    currentTimeMillis = ((long) heartbeatInterval) - (System.currentTimeMillis() - lastEventTime);
                }
                ApsalarAPI poll = arrayBlockingQueue.poll(currentTimeMillis, TimeUnit.MILLISECONDS);
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
                switch (i) {
                    case 0:
                        if (apsalarHeartbeat instanceof ApsalarJSON) {
                            if (buffer == null) {
                                ArrayBlockingQueue<ApsalarAPI> arrayBlockingQueue2 = new ArrayBlockingQueue<>(QUEUE_SIZE_MAX);
                                arrayBlockingQueue2.offer(apsalarHeartbeat);
                                this.events.drainTo(arrayBlockingQueue2);
                                this.events = arrayBlockingQueue2;
                                break;
                            } else {
                                bufferEvent(apsalarHeartbeat);
                                return 3;
                            }
                        } else {
                            continue;
                        }
                }
            } catch (InterruptedException e) {
            }
        }
    }

    private int buffering() {
        if (dbOpener == null || buffer == null) {
            return 2;
        }
        try {
            buffer = dbOpener.getWritableDatabase();
            Cursor rawQuery = buffer.rawQuery(countEventsSQL, (String[]) null);
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
                    ApsalarAPI poll = this.events.poll(((long) retryInterval) - (System.currentTimeMillis() - lastEventTime), TimeUnit.MILLISECONDS);
                    lastEventTime = System.currentTimeMillis();
                    if (poll == null) {
                        retryInterval = (int) ((1.0d + Math.random()) * ((double) retryInterval) * 2.0d);
                        if (retryInterval > 300000) {
                            retryInterval = 300000;
                        }
                        ApsalarRetryThread.getInstance().events.offer(new ApsalarRetry());
                    } else if (poll instanceof ApsalarRetry) {
                        return 1;
                    } else {
                        if ((poll instanceof ApsalarJSON) && !bufferEvent(poll)) {
                        }
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
        if (buffer == null) {
            return false;
        }
        if (bufferSize >= 1000) {
            return false;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("session_json", ((ApsalarEvent) apsalarAPI).getInfo().toJSON().toString());
        contentValues.put("event_json", ((ApsalarJSON) apsalarAPI).toJSON().toString());
        try {
            buffer = dbOpener.getWritableDatabase();
            buffer.insert("backlog", (String) null, contentValues);
            bufferSize++;
            return true;
        } catch (IllegalStateException e) {
            buffer = null;
            return false;
        }
    }
}
