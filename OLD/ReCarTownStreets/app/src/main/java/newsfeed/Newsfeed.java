package newsfeed;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.util.Log;

import com.res.recartownstreets.core.ServerProtocol;

import google.android.gcm.GCMRegistrar;
import nativeJNI.CocoJNI;
import nativeJNI.cocojava;
import tapjoy.TapjoyConstants;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import nativeJNI.cocojava;

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
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public Handler mDisplayHandler = new Handler();
    Runnable mDisplayRunnable = new Runnable() {
        public void run() {
            cocojava.mGLView.queueEvent(new Runnable() {
                public void run() {
                    if (CocoJNI.NFcallShouldShowUrgentMessage() == 0 || Newsfeed.this.mIsVisible) {
                        Newsfeed.this.mDisplayHandler.postDelayed(Newsfeed.this.mDisplayRunnable, 20000);
                        Log.i("Newsfeed", "Blocked showing");
                        return;
                    }
                    cocojava.NF_showUrgentBoard();
                    Log.i("Newsfeed", "Allowed showing");
                }
            });
        }
    };
    public boolean mIsVisible;
    private String mPackageName;
    /* access modifiers changed from: private */
    public int mStatus = 0;
    private ArrayList<JSONObject> messages;
    public int messagesNum;
    public int messagesNumUnread;
    public int messagesNumUrgent;
    private ArrayList<JSONObject> messagesUrgent;
    private boolean sandBoxMode;
    public int urgentDelay = 75;
    public int urgentItem = -1;

    public Newsfeed(Context context, String deviceID2) {
        this.mContext = context;
        this.deviceID = deviceID2;
        this.messagesNum = 0;
        this.messagesNumUnread = 0;
        this.messagesNumUrgent = 0;
        this.sandBoxMode = false;
        this.mIsVisible = false;
        this.mPackageName = "android." + this.mContext.getPackageName();
        this.messages = new ArrayList<>();
        this.messagesUrgent = new ArrayList<>();
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
        this.deviceType = String.format("android-%d-%d", new Object[]{Integer.valueOf(this.mContext.getResources().getDisplayMetrics().widthPixels), Integer.valueOf(this.mContext.getResources().getDisplayMetrics().heightPixels)});
    }

    public int update() {
        if (((cocojava) this.mContext).isOnline() && this.mStatus == 0) {
            this.mStatus = 1;
            this.mDisplayHandler.removeCallbacks(this.mDisplayRunnable);
            new Thread() {
                public void run() {
                    Newsfeed.this.checkServer();
                    ((Activity) Newsfeed.this.mContext).runOnUiThread(new Runnable() {
                        public void run() {
                            cocojava.NF_dismissBoard();
                            cocojava.mGLView.queueEvent(new Runnable() {
                                public void run() {
                                    CocoJNI.NFcallNrOfUnreadMessagesChanged(Newsfeed.this.messagesNumUnread);
                                }
                            });
                            if (Newsfeed.this.messagesNumUrgent > 0 && Newsfeed.this.urgentItem != -1) {
                                Newsfeed.this.mDisplayHandler.postDelayed(Newsfeed.this.mDisplayRunnable, (long) (Newsfeed.this.urgentDelay * 1000));
                                Log.i("Newsfeed", String.format("Show Urgent in %d milliseconds", new Object[]{Integer.valueOf(Newsfeed.this.urgentDelay * 1000)}));
                            }
                            if (Newsfeed.this.messagesNum > 0) {
                                cocojava.mGLView.queueEvent(new Runnable() {
                                    public void run() {
                                        CocoJNI.NFcallAvailabilityChanged(1);
                                    }
                                });
                            } else {
                                cocojava.mGLView.queueEvent(new Runnable() {
                                    public void run() {
                                        CocoJNI.NFcallAvailabilityChanged(0);
                                    }
                                });
                            }
                        }
                    });
                    int unused = Newsfeed.this.mStatus = 0;
                }
            }.start();
        }
        return 0;
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
            PackageInfo pi = this.mContext.getPackageManager().getPackageInfo(this.mContext.getPackageName(), 0);
            if (pi != null) {
                app_version_name = pi.versionName;
            }
        } catch (PackageManager.NameNotFoundException e) {
        }
        try {
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
            Iterator itC = settingsC.getAll().entrySet().iterator();
            while (itC.hasNext()) {
                Map.Entry pairs = (Map.Entry) itC.next();
                JSONObject statsItemJSONclicked = new JSONObject().put(ServerProtocol.DIALOG_PARAM_TYPE, 1);
                statsItemJSONclicked.put("message_id", pairs.getKey());
                statsItemJSONclicked.put("campaign_id", pairs.getValue());
                statsJSON.put(statsItemJSONclicked);
                itC.remove();
            }
            SharedPreferences settingsS = this.mContext.getSharedPreferences(PREFS_NAME_SEND_SEEN, 0);
            Iterator itS = settingsS.getAll().entrySet().iterator();
            while (itS.hasNext()) {
                Map.Entry pairs2 = (Map.Entry) itS.next();
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
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuffer lines = new StringBuffer();
                while (true) {
                    String line = bufferedReader.readLine();
                    if (line == null) {
                        break;
                    }
                    lines.append(line);
                }
                wr.close();
                bufferedReader.close();
                String returnString = lines.toString();
                Log.i("Newsfeed", returnString);
                this.dataJSON = new JSONObject(returnString);
                Log.i("Newsfeed", this.dataJSON.toString(2));
                if (this.dataJSON.has("error_code") && this.dataJSON.getInt("error_code") != 0) {
                    return 0;
                }
                if (!this.dataJSON.has("data")) {
                    return 0;
                }
                this.messagesNum = this.dataJSON.getJSONObject("data").getJSONArray("messages").length();
                Log.i("Newsfeed", String.format("messagesNumAll: %d", new Object[]{Integer.valueOf(this.messagesNum)}));
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
                    if (!this.mContext.getSharedPreferences(PREFS_NAME_SEEN, 0).getAll().containsKey(this.dataJSON.getJSONObject("data").getJSONArray("messages").getJSONObject(i).getString("id"))) {
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
                Log.i("Newsfeed", String.format("messagesNum: %d", new Object[]{Integer.valueOf(this.messagesNum)}));
                Log.i("Newsfeed", String.format("messagesNumUrgent: %d", new Object[]{Integer.valueOf(this.messagesNumUrgent)}));
                int messagesNumF = this.messagesNum;
                final int i2 = this.messagesNumUnread;
                final int i3 = messagesNumF;
                cocojava.mGLView.queueEvent(new Runnable() {
                    public void run() {
                        CocoJNI.NFcallNrOfUnreadMessagesChanged(i2);
                        CocoJNI.NFcallNrOfMessagesChanged(i3);
                    }
                });
                return this.messagesNum;
            } catch (IOException e2) {
                e2.printStackTrace();
                return 0;
            }
        } catch (JSONException e3) {
            e3.printStackTrace();
        }

        return 1;
    }

    public String getHTML(int i, boolean urgent) throws JSONException {
        JSONObject message;
        String htmlContent;
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
        String id = message.getString("id");
        SharedPreferences settings = this.mContext.getSharedPreferences(PREFS_NAME_SEEN, 0);
        if (urgent) {
            this.messagesNumUrgent--;
        } else if (!settings.getAll().containsKey(id)) {
            this.messagesNumUnread--;
            final int messagesNumUnreadF = this.messagesNumUnread;
            final int messagesNumF = this.messagesNum;
            cocojava.mGLView.queueEvent(new Runnable() {
                public void run() {
                    CocoJNI.NFcallNrOfUnreadMessagesChanged(messagesNumUnreadF);
                    CocoJNI.NFcallNrOfMessagesChanged(messagesNumF);
                }
            });
        }
        SharedPreferences.Editor editor = settings.edit();
        editor.putString(id, "true");
        editor.commit();
        String campaign = message.getString("campaign");
        SharedPreferences.Editor editorS = this.mContext.getSharedPreferences(PREFS_NAME_SEND_SEEN, 0).edit();
        editorS.putString(id, campaign);
        editorS.commit();
        return htmlContent;
    }

    public String getLink(int i, boolean urgent) throws JSONException {
        JSONObject message;
        if (!urgent && i >= this.messagesNum) {
            return "";
        }
        if (urgent && i > this.messagesUrgent.size()) {
            return "";
        }
        if (urgent) {
            message = this.messagesUrgent.get(i);
        } else {
            message = this.messages.get(i);
        }
        String data = message.getString("upsell_link");
        Log.i("Newsfeed", data);
        return data;
    }

    public void setClicked(int i, boolean urgent) throws JSONException {
        JSONObject message;
        if (urgent) {
            message = this.messagesUrgent.get(i);
        } else {
            message = this.messages.get(i);
        }
        String id = message.getString("id");
        String campaign = message.getString("campaign");
        SharedPreferences.Editor editorS = this.mContext.getSharedPreferences(PREFS_NAME_SEND_CLICKED, 0).edit();
        editorS.putString(id, campaign);
        editorS.commit();
        Log.i("Newsfeed", "Added Stats");
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
