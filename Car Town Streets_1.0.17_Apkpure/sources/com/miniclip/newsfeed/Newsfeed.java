package com.miniclip.newsfeed;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.util.Log;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gcm.GCMRegistrar;
import com.miniclip.nativeJNI.CocoJNI;
import com.miniclip.nativeJNI.cocojava;
import com.tapjoy.TapjoyConstants;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class Newsfeed {
    public static final int NOTIF_ID = 37820;
    public static final String PREFS_NAME_C2DM = "NewsfeedPrefsC2DM";
    public static final String PREFS_NAME_NOTIFIED = "NewsfeedPrefsNotified";
    public static final String PREFS_NAME_SEEN = "NewsfeedPrefsSeen";
    public static final String PREFS_NAME_SEND_CLICKED = "NewsfeedPrefsSendClicked";
    public static final String PREFS_NAME_SEND_SEEN = "NewsfeedPrefsSendSeen";
    private String c2dmID;
    private JSONObject dataJSON;
    private String deviceID;
    private String deviceType;
    private Context mContext;
    private String mPackageName;
    public int urgentDelay = 75;
    private Handler mDisplayHandler = new Handler();
    Runnable mDisplayRunnable = new Runnable() { // from class: com.miniclip.newsfeed.Newsfeed.1
        @Override // java.lang.Runnable
        public void run() {
            cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.newsfeed.Newsfeed.1.1
                @Override // java.lang.Runnable
                public void run() {
                    int display = CocoJNI.NFcallShouldShowUrgentMessage();
                    if (display == 0 || Newsfeed.this.mIsVisible) {
                        Newsfeed.this.mDisplayHandler.postDelayed(Newsfeed.this.mDisplayRunnable, 20000L);
                        Log.i("Newsfeed", "Blocked showing");
                        return;
                    }
                    cocojava.NF_showUrgentBoard();
                    Log.i("Newsfeed", "Allowed showing");
                }
            });
        }
    };
    private int mStatus = 0;
    public int urgentItem = -1;
    public int messagesNum = 0;
    public int messagesNumUnread = 0;
    public int messagesNumUrgent = 0;
    private boolean sandBoxMode = false;
    public boolean mIsVisible = false;
    private ArrayList<JSONObject> messages = new ArrayList<>();
    private ArrayList<JSONObject> messagesUrgent = new ArrayList<>();

    public Newsfeed(Context context, String deviceID) {
        this.mContext = context;
        this.deviceID = deviceID;
        this.mPackageName = "android." + this.mContext.getPackageName();
        if (cocojava.mUSE_C2DM) {
            try {
                GCMRegistrar.checkDevice(context);
                GCMRegistrar.checkManifest(context);
                this.c2dmID = GCMRegistrar.getRegistrationId(context);
                if (this.c2dmID.equals("")) {
                    GCMRegistrar.register(context, "1040273365599");
                } else {
                    Log.i("Newsfeed", "Already registered");
                }
                cocojava.SharedPreferences_setString("PushNotification_token", this.c2dmID);
            } catch (Exception e) {
                Log.i("Newsfeed", "GCM Exception");
            }
        }
        int width = this.mContext.getResources().getDisplayMetrics().widthPixels;
        int height = this.mContext.getResources().getDisplayMetrics().heightPixels;
        this.deviceType = String.format("android-%d-%d", Integer.valueOf(width), Integer.valueOf(height));
    }

    public int update() {
        if (((cocojava) this.mContext).isOnline() && this.mStatus == 0) {
            this.mStatus = 1;
            this.mDisplayHandler.removeCallbacks(this.mDisplayRunnable);
            Thread thread = new AnonymousClass2();
            thread.start();
        }
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.miniclip.newsfeed.Newsfeed$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass2 extends Thread {
        AnonymousClass2() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            Newsfeed.this.checkServer();
            ((Activity) Newsfeed.this.mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.newsfeed.Newsfeed.2.1
                @Override // java.lang.Runnable
                public void run() {
                    cocojava.NF_dismissBoard();
                    cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.newsfeed.Newsfeed.2.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            CocoJNI.NFcallNrOfUnreadMessagesChanged(Newsfeed.this.messagesNumUnread);
                        }
                    });
                    if (Newsfeed.this.messagesNumUrgent > 0 && Newsfeed.this.urgentItem != -1) {
                        Newsfeed.this.mDisplayHandler.postDelayed(Newsfeed.this.mDisplayRunnable, Newsfeed.this.urgentDelay * 1000);
                        Log.i("Newsfeed", String.format("Show Urgent in %d milliseconds", Integer.valueOf(Newsfeed.this.urgentDelay * 1000)));
                    }
                    if (Newsfeed.this.messagesNum > 0) {
                        cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.newsfeed.Newsfeed.2.1.2
                            @Override // java.lang.Runnable
                            public void run() {
                                CocoJNI.NFcallAvailabilityChanged(1);
                            }
                        });
                    } else {
                        cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.newsfeed.Newsfeed.2.1.3
                            @Override // java.lang.Runnable
                            public void run() {
                                CocoJNI.NFcallAvailabilityChanged(0);
                            }
                        });
                    }
                }
            });
            Newsfeed.this.mStatus = 0;
        }
    }

    public int checkServer() {
        this.urgentItem = -1;
        this.messagesNum = 0;
        this.messagesNumUnread = 0;
        this.messagesNumUrgent = 0;
        this.messages = new ArrayList<>();
        this.messagesUrgent = new ArrayList<>();
        String app_version_name = "";
        try {
            try {
                PackageInfo pi = this.mContext.getPackageManager().getPackageInfo(this.mContext.getPackageName(), 0);
                if (pi != null) {
                    app_version_name = pi.versionName;
                }
            } catch (PackageManager.NameNotFoundException e) {
            }
            JSONObject sendJSON = new JSONObject();
            sendJSON.put("device", this.deviceType);
            sendJSON.put(TapjoyConstants.TJC_APP_ID_NAME, this.mPackageName);
            if (cocojava.mUSE_C2DM) {
                sendJSON.put("apn_token", this.c2dmID);
            }
            sendJSON.put(TapjoyConstants.TJC_APP_VERSION_NAME, app_version_name);
            sendJSON.put("did", this.deviceID);
            sendJSON.put("operation", "get_news");
            sendJSON.put("newsfeed_version", "2");
            JSONArray statsJSON = new JSONArray();
            SharedPreferences settingsC = this.mContext.getSharedPreferences(PREFS_NAME_SEND_CLICKED, 0);
            Map<String, ?> shownIDsC = settingsC.getAll();
            Iterator itC = shownIDsC.entrySet().iterator();
            while (itC.hasNext()) {
                Map.Entry<String, ?> pairs = itC.next();
                JSONObject statsItemJSONclicked = new JSONObject().put(ServerProtocol.DIALOG_PARAM_TYPE, 1);
                statsItemJSONclicked.put("message_id", pairs.getKey());
                statsItemJSONclicked.put("campaign_id", pairs.getValue());
                statsJSON.put(statsItemJSONclicked);
                itC.remove();
            }
            SharedPreferences settingsS = this.mContext.getSharedPreferences(PREFS_NAME_SEND_SEEN, 0);
            Map<String, ?> shownIDsS = settingsS.getAll();
            Iterator itS = shownIDsS.entrySet().iterator();
            while (itS.hasNext()) {
                Map.Entry<String, ?> pairs2 = itS.next();
                JSONObject statsItemJSONseen = new JSONObject().put(ServerProtocol.DIALOG_PARAM_TYPE, 0);
                statsItemJSONseen.put("message_id", pairs2.getKey());
                statsItemJSONseen.put("campaign_id", pairs2.getValue());
                statsJSON.put(statsItemJSONseen);
                itS.remove();
            }
            try {
                String data = sendJSON.toString();
                Log.i("Newsfeed", sendJSON.toString(2));
                URL url = new URL("http://services.miniclippt.com/newsfeed/newsfeed.php");
                if (this.sandBoxMode) {
                    url = new URL("http://services.dev.miniclippt.com/newsfeed/newsfeed.php");
                }
                URLConnection conn = url.openConnection();
                conn.setConnectTimeout(2000);
                conn.setDoOutput(true);
                OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
                wr.write(data);
                wr.flush();
                BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuffer lines = new StringBuffer();
                while (true) {
                    String line = rd.readLine();
                    if (line == null) {
                        break;
                    }
                    lines.append(line);
                }
                wr.close();
                rd.close();
                String returnString = lines.toString();
                Log.i("Newsfeed", returnString);
                this.dataJSON = new JSONObject(returnString);
                Log.i("Newsfeed", this.dataJSON.toString(2));
                if ((!this.dataJSON.has("error_code") || this.dataJSON.getInt("error_code") == 0) && this.dataJSON.has("data")) {
                    this.messagesNum = this.dataJSON.getJSONObject("data").getJSONArray("messages").length();
                    Log.i("Newsfeed", String.format("messagesNumAll: %d", Integer.valueOf(this.messagesNum)));
                    if (this.dataJSON.getJSONObject("data").has("config") && this.dataJSON.getJSONObject("data").getJSONObject("config").has("urgent_message_delay")) {
                        this.urgentDelay = this.dataJSON.getJSONObject("data").getJSONObject("config").getInt("urgent_message_delay");
                    }
                    SharedPreferences.Editor editorC = settingsC.edit();
                    editorC.clear();
                    editorC.commit();
                    SharedPreferences.Editor editorS = settingsS.edit();
                    editorS.clear();
                    editorS.commit();
                    for (int i = 0; i < this.messagesNum; i++) {
                        boolean isUrgent = false;
                        if (this.dataJSON.getJSONObject("data").getJSONArray("messages").getJSONObject(i).getString("urgent").contentEquals("1")) {
                            isUrgent = true;
                        }
                        String id = this.dataJSON.getJSONObject("data").getJSONArray("messages").getJSONObject(i).getString(Constants.APP_ID);
                        SharedPreferences settings = this.mContext.getSharedPreferences(PREFS_NAME_SEEN, 0);
                        Map<String, ?> shownIDs = settings.getAll();
                        if (!shownIDs.containsKey(id)) {
                            if (isUrgent) {
                                this.urgentItem = 1;
                                this.messagesUrgent.add(this.dataJSON.getJSONObject("data").getJSONArray("messages").getJSONObject(i));
                            } else {
                                this.messagesNumUnread++;
                            }
                        }
                        if (!isUrgent) {
                            this.messages.add(this.dataJSON.getJSONObject("data").getJSONArray("messages").getJSONObject(i));
                        }
                    }
                    this.messagesNum = this.messages.size();
                    this.messagesNumUrgent = this.messagesUrgent.size();
                    Log.i("Newsfeed", String.format("messagesNum: %d", Integer.valueOf(this.messagesNum)));
                    Log.i("Newsfeed", String.format("messagesNumUrgent: %d", Integer.valueOf(this.messagesNumUrgent)));
                    final int messagesNumF = this.messagesNum;
                    final int messagesNumUnreadF = this.messagesNumUnread;
                    cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.newsfeed.Newsfeed.3
                        @Override // java.lang.Runnable
                        public void run() {
                            CocoJNI.NFcallNrOfUnreadMessagesChanged(messagesNumUnreadF);
                            CocoJNI.NFcallNrOfMessagesChanged(messagesNumF);
                        }
                    });
                    return this.messagesNum;
                }
                return 0;
            } catch (IOException e2) {
                e2.printStackTrace();
                return 0;
            }
        } catch (JSONException e3) {
            e3.printStackTrace();
            return 0;
        }
    }

    public String getHTML(int i, boolean urgent) {
        JSONObject message;
        String htmlContent;
        try {
            if (urgent) {
                message = this.messagesUrgent.get(i);
            } else {
                message = this.messages.get(i);
            }
            if (cocojava.mINGAME_LANDSCAPE) {
                htmlContent = message.getString("landscape_content");
            } else {
                htmlContent = message.getString("portrait_content");
            }
            Log.i("Newsfeed", htmlContent);
            String id = message.getString(Constants.APP_ID);
            SharedPreferences settings = this.mContext.getSharedPreferences(PREFS_NAME_SEEN, 0);
            if (urgent) {
                this.messagesNumUrgent--;
            } else {
                Map<String, ?> shownIDs = settings.getAll();
                if (!shownIDs.containsKey(id)) {
                    this.messagesNumUnread--;
                    final int messagesNumUnreadF = this.messagesNumUnread;
                    final int messagesNumF = this.messagesNum;
                    cocojava.mGLView.queueEvent(new Runnable() { // from class: com.miniclip.newsfeed.Newsfeed.4
                        @Override // java.lang.Runnable
                        public void run() {
                            CocoJNI.NFcallNrOfUnreadMessagesChanged(messagesNumUnreadF);
                            CocoJNI.NFcallNrOfMessagesChanged(messagesNumF);
                        }
                    });
                }
            }
            SharedPreferences.Editor editor = settings.edit();
            editor.putString(id, "true");
            editor.commit();
            String campaign = message.getString("campaign");
            SharedPreferences settingsS = this.mContext.getSharedPreferences(PREFS_NAME_SEND_SEEN, 0);
            SharedPreferences.Editor editorS = settingsS.edit();
            editorS.putString(id, campaign);
            editorS.commit();
            return htmlContent;
        } catch (JSONException e) {
            e.printStackTrace();
            return "";
        }
    }

    public String getLink(int i, boolean urgent) {
        JSONObject message;
        if (!urgent && i >= this.messagesNum) {
            return "";
        }
        if (urgent && i > this.messagesUrgent.size()) {
            return "";
        }
        try {
            if (urgent) {
                message = this.messagesUrgent.get(i);
            } else {
                message = this.messages.get(i);
            }
            String data = message.getString("upsell_link");
            Log.i("Newsfeed", data);
            return data;
        } catch (JSONException e) {
            e.printStackTrace();
            return "";
        }
    }

    public void setClicked(int i, boolean urgent) {
        JSONObject message;
        try {
            if (urgent) {
                message = this.messagesUrgent.get(i);
            } else {
                message = this.messages.get(i);
            }
            String id = message.getString(Constants.APP_ID);
            String campaign = message.getString("campaign");
            SharedPreferences settingsS = this.mContext.getSharedPreferences(PREFS_NAME_SEND_CLICKED, 0);
            SharedPreferences.Editor editorS = settingsS.edit();
            editorS.putString(id, campaign);
            editorS.commit();
            Log.i("Newsfeed", "Added Stats");
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void setSandBoxMode(boolean sandBox) {
        if (this.sandBoxMode != sandBox) {
            this.sandBoxMode = sandBox;
            update();
            return;
        }
        this.sandBoxMode = sandBox;
    }

    public void removeUrgentTimer() {
        this.mDisplayHandler.removeCallbacks(this.mDisplayRunnable);
    }

    public void setPackageName(String name) {
        this.mPackageName = name;
    }
}
