package com.tapjoy;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Environment;
import android.util.Log;
import com.google.android.gms.drive.DriveFile;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.net.URL;
import java.net.URLConnection;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Map;
import java.util.Vector;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class TapjoyVideo {
    public static final String TAPJOY_VIDEO = "TapjoyVideo";
    private static TapjoyVideo tapjoyVideo = null;
    private static TapjoyVideoNotifier tapjoyVideoNotifier = null;
    /* access modifiers changed from: private */
    public static Bitmap watermarkImage = null;
    private static final String watermarkURL = "https://s3.amazonaws.com/tapjoy/videos/assets/watermark.png";
    /* access modifiers changed from: private */
    public boolean cache3g = false;
    /* access modifiers changed from: private */
    public boolean cacheAuto = false;
    /* access modifiers changed from: private */
    public boolean cacheWifi = false;
    /* access modifiers changed from: private */
    public Hashtable<String, TapjoyVideoObject> cachedVideos;
    Context context;
    private String imageCacheDir = null;
    /* access modifiers changed from: private */
    public boolean initialized = false;
    /* access modifiers changed from: private */
    public Hashtable<String, TapjoyVideoObject> uncachedVideos;
    private String videoCacheDir = null;
    /* access modifiers changed from: private */
    public int videoCacheLimit = 5;
    /* access modifiers changed from: private */
    public Vector<String> videoQueue;
    private TapjoyVideoObject videoToPlay;

    public TapjoyVideo(Context applicationContext) {
        this.context = applicationContext;
        tapjoyVideo = this;
        this.videoCacheDir = Environment.getExternalStorageDirectory().toString() + "/tjcache/data/";
        this.imageCacheDir = Environment.getExternalStorageDirectory().toString() + "/tjcache/tmp/";
        TapjoyUtil.deleteFileOrDirectory(new File(Environment.getExternalStorageDirectory().toString() + "/tapjoy/"));
        TapjoyUtil.deleteFileOrDirectory(new File(this.imageCacheDir));
        this.videoQueue = new Vector<>();
        this.uncachedVideos = new Hashtable<>();
        this.cachedVideos = new Hashtable<>();
        init();
    }

    public static TapjoyVideo getInstance() {
        return tapjoyVideo;
    }

    public void setVideoCacheCount(int count) {
        this.videoCacheLimit = count;
    }

    public void enableVideoCache(boolean enable) {
    }

    public void initVideoAd(TapjoyVideoNotifier notifier) {
        initVideoAd(notifier, false);
    }

    public void initVideoAd(TapjoyVideoNotifier notifier, boolean skipCaching) {
        tapjoyVideoNotifier = notifier;
        if (notifier == null) {
            Log.e(TAPJOY_VIDEO, "Error during initVideoAd -- TapjoyVideoNotifier is null");
            return;
        }
        if (this.initialized) {
            videoNotifierReady();
        }
        cacheAllVideos();
    }

    public void init() {
        TapjoyLog.m4436i(TAPJOY_VIDEO, "initVideoAd");
        if (TapjoyConnectCore.getFlagValue(TapjoyConnectFlag.DISABLE_VIDEO_OFFERS) == null || !TapjoyConnectCore.getFlagValue(TapjoyConnectFlag.DISABLE_VIDEO_OFFERS).equals("true")) {
            setVideoIDs();
            new Thread(new Runnable() {
                public void run() {
                    boolean returnValue = false;
                    String result = new TapjoyURLConnection().connectToURL("https://ws.tapjoyads.com/videos?", TapjoyConnectCore.getURLParams() + "&publisher_user_id=" + TapjoyConnectCore.getUserID());
                    if (result != null && result.length() > 0) {
                        returnValue = TapjoyVideo.this.handleGetVideosResponse(result);
                    }
                    if (returnValue) {
                        boolean unused = TapjoyVideo.this.validateCachedVideos();
                        if (TapjoyVideo.watermarkURL != 0 && TapjoyVideo.watermarkURL.length() > 0) {
                            try {
                                URL fileURL = new URL(TapjoyVideo.watermarkURL);
                                URLConnection connection = fileURL.openConnection();
                                connection.setConnectTimeout(15000);
                                connection.setReadTimeout(25000);
                                connection.connect();
                                Bitmap unused2 = TapjoyVideo.watermarkImage = BitmapFactory.decodeStream(fileURL.openConnection().getInputStream());
                            } catch (Exception e) {
                                TapjoyLog.m4435e(TapjoyVideo.TAPJOY_VIDEO, "e: " + e.toString());
                            }
                        }
                        TapjoyVideo.this.setVideoIDs();
                        boolean unused3 = TapjoyVideo.this.initialized = true;
                        TapjoyVideo.videoNotifierReady();
                        if (TapjoyVideo.this.cacheAuto) {
                            TapjoyLog.m4436i(TapjoyVideo.TAPJOY_VIDEO, "trying to cache because of cache_auto flag...");
                            TapjoyVideo.this.cacheAllVideos();
                        }
                        TapjoyLog.m4436i(TapjoyVideo.TAPJOY_VIDEO, "------------------------------");
                        TapjoyLog.m4436i(TapjoyVideo.TAPJOY_VIDEO, "------------------------------");
                        TapjoyLog.m4436i(TapjoyVideo.TAPJOY_VIDEO, "INIT DONE!");
                        TapjoyLog.m4436i(TapjoyVideo.TAPJOY_VIDEO, "------------------------------");
                        return;
                    }
                    TapjoyVideo.videoNotifierError(2);
                }
            }).start();
            TapjoyConnectCore.setVideoEnabled(true);
            return;
        }
        TapjoyLog.m4436i(TAPJOY_VIDEO, "disable_video_offers: " + TapjoyConnectCore.getFlagValue(TapjoyConnectFlag.DISABLE_VIDEO_OFFERS) + ". Aborting video initializing... ");
        TapjoyConnectCore.setVideoEnabled(false);
    }

    /* access modifiers changed from: private */
    public boolean handleGetVideosResponse(String response) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        TapjoyLog.m4436i(TAPJOY_VIDEO, "========================================");
        try {
            Document document = factory.newDocumentBuilder().parse(new ByteArrayInputStream(response.getBytes("UTF-8")));
            document.getDocumentElement().normalize();
            NodeList nodelistParent = document.getElementsByTagName("TapjoyVideos");
            NodeList nodelist = nodelistParent.item(0).getChildNodes();
            NamedNodeMap nodeMap = nodelistParent.item(0).getAttributes();
            if (!(nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_AUTO) == null || nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_AUTO).getNodeValue() == null)) {
                this.cacheAuto = Boolean.valueOf(nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_AUTO).getNodeValue()).booleanValue();
            }
            if (!(nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_WIFI) == null || nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_WIFI).getNodeValue() == null)) {
                this.cacheWifi = Boolean.valueOf(nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_WIFI).getNodeValue()).booleanValue();
            }
            if (!(nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_MOBILE) == null || nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_MOBILE).getNodeValue() == null)) {
                this.cache3g = Boolean.valueOf(nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_MOBILE).getNodeValue()).booleanValue();
            }
            TapjoyLog.m4436i(TAPJOY_VIDEO, "cacheAuto: " + this.cacheAuto);
            TapjoyLog.m4436i(TAPJOY_VIDEO, "cacheWifi: " + this.cacheWifi);
            TapjoyLog.m4436i(TAPJOY_VIDEO, "cache3g: " + this.cache3g);
            TapjoyLog.m4436i(TAPJOY_VIDEO, "nodelistParent length: " + nodelistParent.getLength());
            TapjoyLog.m4436i(TAPJOY_VIDEO, "nodelist length: " + nodelist.getLength());
            for (int i = 0; i < nodelist.getLength(); i++) {
                Node node = nodelist.item(i);
                TapjoyVideoObject videoObject = new TapjoyVideoObject();
                if (node != null && node.getNodeType() == 1) {
                    Element element = (Element) node;
                    String value = TapjoyUtil.getNodeTrimValue(element.getElementsByTagName("ClickURL"));
                    if (value != null && !value.equals("")) {
                        videoObject.clickURL = value;
                    }
                    String value2 = TapjoyUtil.getNodeTrimValue(element.getElementsByTagName("OfferID"));
                    if (value2 != null && !value2.equals("")) {
                        videoObject.offerID = value2;
                    }
                    String value3 = TapjoyUtil.getNodeTrimValue(element.getElementsByTagName("Name"));
                    if (value3 != null && !value3.equals("")) {
                        videoObject.videoAdName = value3;
                    }
                    String value4 = TapjoyUtil.getNodeTrimValue(element.getElementsByTagName("Amount"));
                    if (value4 != null && !value4.equals("")) {
                        videoObject.currencyAmount = value4;
                    }
                    String value5 = TapjoyUtil.getNodeTrimValue(element.getElementsByTagName("CurrencyName"));
                    if (value5 != null && !value5.equals("")) {
                        videoObject.currencyName = value5;
                    }
                    String value6 = TapjoyUtil.getNodeTrimValue(element.getElementsByTagName("VideoURL"));
                    if (value6 != null && !value6.equals("")) {
                        videoObject.videoURL = value6;
                    }
                    String value7 = TapjoyUtil.getNodeTrimValue(element.getElementsByTagName("IconURL"));
                    if (value7 != null && !value7.equals("")) {
                        videoObject.iconURL = value7;
                    }
                    TapjoyLog.m4436i(TAPJOY_VIDEO, "-----");
                    TapjoyLog.m4436i(TAPJOY_VIDEO, "videoObject.offerID: " + videoObject.offerID);
                    TapjoyLog.m4436i(TAPJOY_VIDEO, "videoObject.videoAdName: " + videoObject.videoAdName);
                    TapjoyLog.m4436i(TAPJOY_VIDEO, "videoObject.videoURL: " + videoObject.videoURL);
                    NodeList itemNodeList = element.getElementsByTagName("Buttons").item(0).getChildNodes();
                    for (int j = 0; j < itemNodeList.getLength(); j++) {
                        NodeList child = itemNodeList.item(j).getChildNodes();
                        if (child.getLength() != 0) {
                            String name = "";
                            String url = "";
                            for (int k = 0; k < child.getLength(); k++) {
                                if (((Element) child.item(k)) != null) {
                                    String tagName = ((Element) child.item(k)).getTagName();
                                    if (tagName.equals("Name") && child.item(k).getFirstChild() != null) {
                                        name = child.item(k).getFirstChild().getNodeValue();
                                    } else if (tagName.equals("URL") && child.item(k).getFirstChild() != null) {
                                        url = child.item(k).getFirstChild().getNodeValue();
                                    }
                                }
                            }
                            TapjoyLog.m4436i(TAPJOY_VIDEO, "name: " + name + ", url: " + url);
                            videoObject.addButton(name, url);
                        }
                    }
                    this.videoQueue.addElement(videoObject.offerID);
                    this.uncachedVideos.put(videoObject.offerID, videoObject);
                }
            }
            TapjoyLog.m4436i(TAPJOY_VIDEO, "========================================");
            return true;
        } catch (Exception e) {
            TapjoyLog.m4435e(TAPJOY_VIDEO, "Error parsing XML: " + e.toString());
            return false;
        }
    }

    public TapjoyVideoObject getCurrentVideoData() {
        return this.videoToPlay;
    }

    public boolean startVideo(String videoID, String currencyName, String currencyAmount, String clickURL, String webviewURL, String videoURL) {
        File video;
        boolean cachedVideo = true;
        TapjoyLog.m4436i(TAPJOY_VIDEO, "Starting video activity with video: " + videoID);
        if (videoID == null || clickURL == null || webviewURL == null || videoID.length() == 0 || clickURL.length() == 0 || webviewURL.length() == 0) {
            TapjoyLog.m4436i(TAPJOY_VIDEO, "aborting video playback... invalid or missing parameter");
            return false;
        }
        this.videoToPlay = this.cachedVideos.get(videoID);
        if (!"mounted".equals(Environment.getExternalStorageState())) {
            TapjoyLog.m4435e(TAPJOY_VIDEO, "Cannot access external storage");
            videoNotifierError(1);
            return false;
        }
        if (this.videoToPlay == null) {
            TapjoyLog.m4436i(TAPJOY_VIDEO, "video not cached... checking uncached videos");
            this.videoToPlay = this.uncachedVideos.get(videoID);
            if (this.videoToPlay == null) {
                if (videoURL == null || videoURL.length() <= 0) {
                    TapjoyLog.m4435e(TAPJOY_VIDEO, "no video data and no video url - aborting playback...");
                    return false;
                }
                TapjoyVideoObject newVideo = new TapjoyVideoObject();
                newVideo.offerID = videoID;
                newVideo.currencyName = currencyName;
                newVideo.currencyAmount = currencyAmount;
                newVideo.clickURL = clickURL;
                newVideo.webviewURL = webviewURL;
                newVideo.videoURL = videoURL;
                this.uncachedVideos.put(videoID, newVideo);
                this.videoToPlay = this.uncachedVideos.get(videoID);
            }
            cachedVideo = false;
        }
        this.videoToPlay.currencyName = currencyName;
        this.videoToPlay.currencyAmount = currencyAmount;
        this.videoToPlay.clickURL = clickURL;
        this.videoToPlay.webviewURL = webviewURL;
        this.videoToPlay.videoURL = videoURL;
        TapjoyLog.m4436i(TAPJOY_VIDEO, "videoToPlay: " + this.videoToPlay.offerID);
        TapjoyLog.m4436i(TAPJOY_VIDEO, "amount: " + this.videoToPlay.currencyAmount);
        TapjoyLog.m4436i(TAPJOY_VIDEO, "currency: " + this.videoToPlay.currencyName);
        TapjoyLog.m4436i(TAPJOY_VIDEO, "clickURL: " + this.videoToPlay.clickURL);
        TapjoyLog.m4436i(TAPJOY_VIDEO, "location: " + this.videoToPlay.dataLocation);
        TapjoyLog.m4436i(TAPJOY_VIDEO, "webviewURL: " + this.videoToPlay.webviewURL);
        TapjoyLog.m4436i(TAPJOY_VIDEO, "videoURL: " + this.videoToPlay.videoURL);
        if (!cachedVideo || this.videoToPlay.dataLocation == null || ((video = new File(this.videoToPlay.dataLocation)) != null && video.exists())) {
            Intent videoIntent = new Intent(this.context, TapjoyVideoView.class);
            videoIntent.setFlags(DriveFile.MODE_READ_ONLY);
            videoIntent.putExtra(TapjoyConstants.EXTRA_VIDEO_PATH, videoID);
            this.context.startActivity(videoIntent);
            return true;
        }
        TapjoyLog.m4435e(TAPJOY_VIDEO, "video file does not exist.");
        return false;
    }

    /* access modifiers changed from: private */
    public void cacheAllVideos() {
        new Thread(new Runnable() {
            public void run() {
                TapjoyLog.m4436i(TapjoyVideo.TAPJOY_VIDEO, "--- cacheAllVideos called ---");
                int elapsed = 0;
                while (!TapjoyVideo.this.initialized) {
                    try {
                        Thread.sleep(500);
                        elapsed = (int) (((long) elapsed) + 500);
                        if (((long) elapsed) > 10000) {
                            TapjoyLog.m4435e(TapjoyVideo.TAPJOY_VIDEO, "Error during cacheVideos.  Timeout while waiting for initVideos to finish.");
                            return;
                        }
                    } catch (Exception e) {
                        TapjoyLog.m4435e(TapjoyVideo.TAPJOY_VIDEO, "Exception in cacheAllVideos: " + e.toString());
                    }
                }
                TapjoyLog.m4436i(TapjoyVideo.TAPJOY_VIDEO, "cacheVideos connection_type: " + TapjoyConnectCore.getConnectionType());
                TapjoyLog.m4436i(TapjoyVideo.TAPJOY_VIDEO, "cache3g: " + TapjoyVideo.this.cache3g);
                TapjoyLog.m4436i(TapjoyVideo.TAPJOY_VIDEO, "cacheWifi: " + TapjoyVideo.this.cacheWifi);
                if ((!TapjoyVideo.this.cache3g || !TapjoyConnectCore.getConnectionType().equals(TapjoyConstants.TJC_CONNECTION_TYPE_MOBILE)) && (!TapjoyVideo.this.cacheWifi || !TapjoyConnectCore.getConnectionType().equals(TapjoyConstants.TJC_CONNECTION_TYPE_WIFI))) {
                    TapjoyLog.m4436i(TapjoyVideo.TAPJOY_VIDEO, " * Skipping caching videos because of video flags and connection_type...");
                } else if (!"mounted".equals(Environment.getExternalStorageState())) {
                    TapjoyLog.m4436i(TapjoyVideo.TAPJOY_VIDEO, "Media storage unavailable.  Aborting caching videos.");
                    TapjoyVideo.videoNotifierError(1);
                    return;
                } else {
                    while (TapjoyVideo.this.cachedVideos.size() < TapjoyVideo.this.videoCacheLimit && TapjoyVideo.this.videoQueue.size() > 0) {
                        TapjoyVideo.this.cacheVideo(((TapjoyVideoObject) TapjoyVideo.this.uncachedVideos.get(TapjoyVideo.this.videoQueue.elementAt(0))).videoURL);
                    }
                }
                TapjoyVideo.this.printCachedVideos();
            }
        }).start();
    }

    /* access modifiers changed from: private */
    public void printCachedVideos() {
        TapjoyLog.m4436i(TAPJOY_VIDEO, "cachedVideos size: " + this.cachedVideos.size());
        for (Map.Entry<String, TapjoyVideoObject> item : this.cachedVideos.entrySet()) {
            TapjoyLog.m4436i(TAPJOY_VIDEO, "key: " + item.getKey() + ", name: " + item.getValue().videoAdName);
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:21:0x0186  */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x0195 A[ADDED_TO_REGION] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void cacheVideo(java.lang.String r28) {
        /*
            r27 = this;
            java.lang.String r23 = "TapjoyVideo"
            java.lang.StringBuilder r24 = new java.lang.StringBuilder
            r24.<init>()
            java.lang.String r25 = "download and cache video from: "
            java.lang.StringBuilder r24 = r24.append(r25)
            r0 = r24
            r1 = r28
            java.lang.StringBuilder r24 = r0.append(r1)
            java.lang.String r24 = r24.toString()
            com.tapjoy.TapjoyLog.m4436i(r23, r24)
            long r21 = java.lang.System.currentTimeMillis()
            r14 = 0
            r5 = 0
            r10 = 0
            r16 = 0
            r8 = 0
            r18 = 0
            r19 = 0
            java.net.URL r9 = new java.net.URL     // Catch:{ SocketTimeoutException -> 0x028e, Exception -> 0x0238 }
            r0 = r28
            r9.<init>(r0)     // Catch:{ SocketTimeoutException -> 0x028e, Exception -> 0x0238 }
            java.net.URLConnection r4 = r9.openConnection()     // Catch:{ SocketTimeoutException -> 0x028e, Exception -> 0x0238 }
            r23 = 15000(0x3a98, float:2.102E-41)
            r0 = r23
            r4.setConnectTimeout(r0)     // Catch:{ SocketTimeoutException -> 0x028e, Exception -> 0x0238 }
            r23 = 30000(0x7530, float:4.2039E-41)
            r0 = r23
            r4.setReadTimeout(r0)     // Catch:{ SocketTimeoutException -> 0x028e, Exception -> 0x0238 }
            r4.connect()     // Catch:{ SocketTimeoutException -> 0x028e, Exception -> 0x0238 }
            java.io.BufferedInputStream r11 = new java.io.BufferedInputStream     // Catch:{ SocketTimeoutException -> 0x028e, Exception -> 0x0238 }
            java.io.InputStream r23 = r4.getInputStream()     // Catch:{ SocketTimeoutException -> 0x028e, Exception -> 0x0238 }
            r0 = r23
            r11.<init>(r0)     // Catch:{ SocketTimeoutException -> 0x028e, Exception -> 0x0238 }
            java.io.File r7 = new java.io.File     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r0 = r27
            java.lang.String r0 = r0.videoCacheDir     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r23 = r0
            r0 = r23
            r7.<init>(r0)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r23 = 0
            java.lang.String r24 = "/"
            r0 = r28
            r1 = r24
            int r24 = r0.lastIndexOf(r1)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            int r24 = r24 + 1
            r0 = r28
            r1 = r23
            r2 = r24
            java.lang.String r18 = r0.substring(r1, r2)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r23 = "/"
            r0 = r28
            r1 = r23
            int r23 = r0.lastIndexOf(r1)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            int r23 = r23 + 1
            r0 = r28
            r1 = r23
            java.lang.String r8 = r0.substring(r1)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r23 = 0
            r24 = 46
            r0 = r24
            int r24 = r8.indexOf(r0)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r0 = r23
            r1 = r24
            java.lang.String r8 = r8.substring(r0, r1)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r23 = "TapjoyVideo"
            java.lang.StringBuilder r24 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r24.<init>()     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r25 = "fileDir: "
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r0 = r24
            java.lang.StringBuilder r24 = r0.append(r7)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r24 = r24.toString()     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            com.tapjoy.TapjoyLog.m4436i(r23, r24)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r23 = "TapjoyVideo"
            java.lang.StringBuilder r24 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r24.<init>()     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r25 = "path: "
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r0 = r24
            r1 = r18
            java.lang.StringBuilder r24 = r0.append(r1)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r24 = r24.toString()     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            com.tapjoy.TapjoyLog.m4436i(r23, r24)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r23 = "TapjoyVideo"
            java.lang.StringBuilder r24 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r24.<init>()     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r25 = "file name: "
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r0 = r24
            java.lang.StringBuilder r24 = r0.append(r8)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r24 = r24.toString()     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            com.tapjoy.TapjoyLog.m4436i(r23, r24)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            boolean r23 = r7.mkdirs()     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            if (r23 == 0) goto L_0x010e
            java.lang.String r23 = "TapjoyVideo"
            java.lang.StringBuilder r24 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r24.<init>()     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r25 = "created directory at: "
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r25 = r7.getPath()     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.lang.String r24 = r24.toString()     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            com.tapjoy.TapjoyLog.m4436i(r23, r24)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
        L_0x010e:
            java.io.File r20 = new java.io.File     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r0 = r27
            java.lang.String r0 = r0.videoCacheDir     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            r23 = r0
            r0 = r20
            r1 = r23
            r0.<init>(r1, r8)     // Catch:{ SocketTimeoutException -> 0x0291, Exception -> 0x027f }
            java.io.FileOutputStream r17 = new java.io.FileOutputStream     // Catch:{ SocketTimeoutException -> 0x0295, Exception -> 0x0282 }
            r0 = r17
            r1 = r20
            r0.<init>(r1)     // Catch:{ SocketTimeoutException -> 0x0295, Exception -> 0x0282 }
            java.lang.String r23 = "TapjoyVideo"
            java.lang.StringBuilder r24 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            r24.<init>()     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            java.lang.String r25 = "downloading video file to: "
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            java.lang.String r25 = r20.toString()     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            java.lang.String r24 = r24.toString()     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            com.tapjoy.TapjoyLog.m4436i(r23, r24)     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            r23 = 1024(0x400, float:1.435E-42)
            r0 = r23
            byte[] r3 = new byte[r0]     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
        L_0x0148:
            int r13 = r11.read(r3)     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            r23 = -1
            r0 = r23
            if (r13 == r0) goto L_0x0204
            r23 = 0
            r0 = r17
            r1 = r23
            r0.write(r3, r1, r13)     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            goto L_0x0148
        L_0x015c:
            r6 = move-exception
            r19 = r20
            r16 = r17
            r10 = r11
        L_0x0162:
            java.lang.String r23 = "TapjoyVideo"
            java.lang.StringBuilder r24 = new java.lang.StringBuilder
            r24.<init>()
            java.lang.String r25 = "Network timeout: "
            java.lang.StringBuilder r24 = r24.append(r25)
            java.lang.String r25 = r6.toString()
            java.lang.StringBuilder r24 = r24.append(r25)
            java.lang.String r24 = r24.toString()
            com.tapjoy.TapjoyLog.m4435e(r23, r24)
            r14 = 1
            r5 = 1
        L_0x0180:
            r23 = 1
            r0 = r23
            if (r14 != r0) goto L_0x0193
            java.lang.String r23 = "TapjoyVideo"
            java.lang.String r24 = "Network timeout"
            com.tapjoy.TapjoyLog.m4436i(r23, r24)
            r10.close()     // Catch:{ Exception -> 0x027c }
            r16.close()     // Catch:{ Exception -> 0x027c }
        L_0x0193:
            if (r14 != 0) goto L_0x0276
            if (r5 != 0) goto L_0x0276
            r0 = r27
            java.util.Vector<java.lang.String> r0 = r0.videoQueue     // Catch:{ Exception -> 0x0258 }
            r23 = r0
            r24 = 0
            java.lang.Object r12 = r23.elementAt(r24)     // Catch:{ Exception -> 0x0258 }
            java.lang.String r12 = (java.lang.String) r12     // Catch:{ Exception -> 0x0258 }
            r0 = r27
            java.util.Hashtable<java.lang.String, com.tapjoy.TapjoyVideoObject> r0 = r0.uncachedVideos     // Catch:{ Exception -> 0x0258 }
            r23 = r0
            r0 = r23
            java.lang.Object r15 = r0.get(r12)     // Catch:{ Exception -> 0x0258 }
            com.tapjoy.TapjoyVideoObject r15 = (com.tapjoy.TapjoyVideoObject) r15     // Catch:{ Exception -> 0x0258 }
            java.lang.String r23 = r19.getAbsolutePath()     // Catch:{ Exception -> 0x0258 }
            r0 = r23
            r15.dataLocation = r0     // Catch:{ Exception -> 0x0258 }
            r0 = r27
            java.util.Hashtable<java.lang.String, com.tapjoy.TapjoyVideoObject> r0 = r0.cachedVideos     // Catch:{ Exception -> 0x0258 }
            r23 = r0
            r0 = r23
            r0.put(r12, r15)     // Catch:{ Exception -> 0x0258 }
            r0 = r27
            java.util.Hashtable<java.lang.String, com.tapjoy.TapjoyVideoObject> r0 = r0.uncachedVideos     // Catch:{ Exception -> 0x0258 }
            r23 = r0
            r0 = r23
            r0.remove(r12)     // Catch:{ Exception -> 0x0258 }
            r0 = r27
            java.util.Vector<java.lang.String> r0 = r0.videoQueue     // Catch:{ Exception -> 0x0258 }
            r23 = r0
            r24 = 0
            r23.removeElementAt(r24)     // Catch:{ Exception -> 0x0258 }
            r27.setVideoIDs()     // Catch:{ Exception -> 0x0258 }
            java.lang.String r23 = "TapjoyVideo"
            java.lang.StringBuilder r24 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x0258 }
            r24.<init>()     // Catch:{ Exception -> 0x0258 }
            java.lang.String r25 = "video cached in: "
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ Exception -> 0x0258 }
            long r25 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x0258 }
            long r25 = r25 - r21
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ Exception -> 0x0258 }
            java.lang.String r25 = "ms"
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ Exception -> 0x0258 }
            java.lang.String r24 = r24.toString()     // Catch:{ Exception -> 0x0258 }
            com.tapjoy.TapjoyLog.m4436i(r23, r24)     // Catch:{ Exception -> 0x0258 }
        L_0x0203:
            return
        L_0x0204:
            r17.close()     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            r11.close()     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            java.lang.String r23 = "TapjoyVideo"
            java.lang.StringBuilder r24 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            r24.<init>()     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            java.lang.String r25 = "FILE SIZE: "
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            long r25 = r20.length()     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            java.lang.StringBuilder r24 = r24.append(r25)     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            java.lang.String r24 = r24.toString()     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            com.tapjoy.TapjoyLog.m4436i(r23, r24)     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            long r23 = r20.length()     // Catch:{ SocketTimeoutException -> 0x015c, Exception -> 0x0287 }
            r25 = 0
            int r23 = (r23 > r25 ? 1 : (r23 == r25 ? 0 : -1))
            if (r23 != 0) goto L_0x0231
            r14 = 1
        L_0x0231:
            r19 = r20
            r16 = r17
            r10 = r11
            goto L_0x0180
        L_0x0238:
            r6 = move-exception
        L_0x0239:
            java.lang.String r23 = "TapjoyVideo"
            java.lang.StringBuilder r24 = new java.lang.StringBuilder
            r24.<init>()
            java.lang.String r25 = "Error caching video file: "
            java.lang.StringBuilder r24 = r24.append(r25)
            java.lang.String r25 = r6.toString()
            java.lang.StringBuilder r24 = r24.append(r25)
            java.lang.String r24 = r24.toString()
            com.tapjoy.TapjoyLog.m4435e(r23, r24)
            r5 = 1
            goto L_0x0180
        L_0x0258:
            r6 = move-exception
            java.lang.String r23 = "TapjoyVideo"
            java.lang.StringBuilder r24 = new java.lang.StringBuilder
            r24.<init>()
            java.lang.String r25 = "error caching video ???: "
            java.lang.StringBuilder r24 = r24.append(r25)
            java.lang.String r25 = r6.toString()
            java.lang.StringBuilder r24 = r24.append(r25)
            java.lang.String r24 = r24.toString()
            com.tapjoy.TapjoyLog.m4435e(r23, r24)
            goto L_0x0203
        L_0x0276:
            r23 = 2
            videoNotifierError(r23)
            goto L_0x0203
        L_0x027c:
            r23 = move-exception
            goto L_0x0193
        L_0x027f:
            r6 = move-exception
            r10 = r11
            goto L_0x0239
        L_0x0282:
            r6 = move-exception
            r19 = r20
            r10 = r11
            goto L_0x0239
        L_0x0287:
            r6 = move-exception
            r19 = r20
            r16 = r17
            r10 = r11
            goto L_0x0239
        L_0x028e:
            r6 = move-exception
            goto L_0x0162
        L_0x0291:
            r6 = move-exception
            r10 = r11
            goto L_0x0162
        L_0x0295:
            r6 = move-exception
            r19 = r20
            r10 = r11
            goto L_0x0162
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tapjoy.TapjoyVideo.cacheVideo(java.lang.String):void");
    }

    /* access modifiers changed from: private */
    public void setVideoIDs() {
        String videoIDs = "";
        if (this.cachedVideos != null && this.cachedVideos.size() > 0) {
            Enumeration<String> keys = this.cachedVideos.keys();
            while (keys.hasMoreElements()) {
                videoIDs = videoIDs + keys.nextElement();
                if (keys.hasMoreElements()) {
                    videoIDs = videoIDs + ",";
                }
            }
            TapjoyLog.m4436i(TAPJOY_VIDEO, "cachedVideos size: " + this.cachedVideos.size());
        }
        TapjoyLog.m4436i(TAPJOY_VIDEO, "videoIDs: [" + videoIDs + "]");
        TapjoyConnectCore.setVideoIDs(videoIDs);
    }

    /* access modifiers changed from: private */
    public boolean validateCachedVideos() {
        boolean proceed = true;
        File[] cachedFilesOnDisk = new File(this.videoCacheDir).listFiles();
        if (this.uncachedVideos == null) {
            TapjoyLog.m4435e(TAPJOY_VIDEO, "Error: uncachedVideos is null");
            proceed = false;
        }
        if (this.cachedVideos == null) {
            TapjoyLog.m4435e(TAPJOY_VIDEO, "Error: cachedVideos is null");
            proceed = false;
        }
        if (this.videoQueue == null) {
            TapjoyLog.m4435e(TAPJOY_VIDEO, "Error: videoQueue is null");
            proceed = false;
        }
        if (!proceed || cachedFilesOnDisk == null) {
            return false;
        }
        for (int i = 0; i < cachedFilesOnDisk.length; i++) {
            String key = cachedFilesOnDisk[i].getName();
            TapjoyLog.m4436i(TAPJOY_VIDEO, "-----");
            TapjoyLog.m4436i(TAPJOY_VIDEO, "Examining cached file[" + i + "]: " + cachedFilesOnDisk[i].getAbsolutePath() + " --- " + cachedFilesOnDisk[i].getName());
            if (this.uncachedVideos.containsKey(key)) {
                TapjoyLog.m4436i(TAPJOY_VIDEO, "Local file found");
                TapjoyVideoObject videoObject = this.uncachedVideos.get(key);
                if (videoObject != null) {
                    String contentLength = new TapjoyURLConnection().getContentLength(videoObject.videoURL);
                    TapjoyLog.m4436i(TAPJOY_VIDEO, "local file size: " + cachedFilesOnDisk[i].length() + " vs. target: " + contentLength);
                    if (contentLength == null || ((long) Integer.parseInt(contentLength)) != cachedFilesOnDisk[i].length()) {
                        TapjoyLog.m4436i(TAPJOY_VIDEO, "file size mismatch --- deleting video: " + cachedFilesOnDisk[i].getAbsolutePath());
                        TapjoyUtil.deleteFileOrDirectory(cachedFilesOnDisk[i]);
                    } else {
                        videoObject.dataLocation = cachedFilesOnDisk[i].getAbsolutePath();
                        this.cachedVideos.put(key, videoObject);
                        this.uncachedVideos.remove(key);
                        this.videoQueue.remove(key);
                        TapjoyLog.m4436i(TAPJOY_VIDEO, "VIDEO PREVIOUSLY CACHED -- " + key + ", location: " + videoObject.dataLocation);
                    }
                }
            } else {
                TapjoyLog.m4436i(TAPJOY_VIDEO, "VIDEO EXPIRED? removing video from cache: " + key + " --- " + cachedFilesOnDisk[i].getAbsolutePath());
                TapjoyUtil.deleteFileOrDirectory(cachedFilesOnDisk[i]);
            }
        }
        return true;
    }

    public static void videoNotifierError(int error) {
        if (tapjoyVideoNotifier != null) {
            tapjoyVideoNotifier.videoError(error);
        }
    }

    public static void videoNotifierReady() {
        if (tapjoyVideoNotifier != null) {
            tapjoyVideoNotifier.videoReady();
        }
    }

    public static void videoNotifierComplete() {
        if (tapjoyVideoNotifier != null) {
            tapjoyVideoNotifier.videoComplete();
        }
    }

    public static Bitmap getWatermarkImage() {
        return watermarkImage;
    }
}
