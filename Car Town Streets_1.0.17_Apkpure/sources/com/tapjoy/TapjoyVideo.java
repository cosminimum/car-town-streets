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
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
/* loaded from: classes.dex */
public class TapjoyVideo {
    public static final String TAPJOY_VIDEO = "TapjoyVideo";
    private static TapjoyVideo tapjoyVideo = null;
    private static TapjoyVideoNotifier tapjoyVideoNotifier = null;
    private static Bitmap watermarkImage = null;
    private static final String watermarkURL = "https://s3.amazonaws.com/tapjoy/videos/assets/watermark.png";
    Context context;
    private String imageCacheDir;
    private String videoCacheDir;
    private TapjoyVideoObject videoToPlay;
    private int videoCacheLimit = 5;
    private boolean cacheAuto = false;
    private boolean initialized = false;
    private boolean cacheWifi = false;
    private boolean cache3g = false;
    private Vector<String> videoQueue = new Vector<>();
    private Hashtable<String, TapjoyVideoObject> uncachedVideos = new Hashtable<>();
    private Hashtable<String, TapjoyVideoObject> cachedVideos = new Hashtable<>();

    public TapjoyVideo(Context applicationContext) {
        this.videoCacheDir = null;
        this.imageCacheDir = null;
        this.context = applicationContext;
        tapjoyVideo = this;
        this.videoCacheDir = Environment.getExternalStorageDirectory().toString() + "/tjcache/data/";
        this.imageCacheDir = Environment.getExternalStorageDirectory().toString() + "/tjcache/tmp/";
        TapjoyUtil.deleteFileOrDirectory(new File(Environment.getExternalStorageDirectory().toString() + "/tapjoy/"));
        TapjoyUtil.deleteFileOrDirectory(new File(this.imageCacheDir));
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
        TapjoyLog.i(TAPJOY_VIDEO, "initVideoAd");
        if (TapjoyConnectCore.getFlagValue(TapjoyConnectFlag.DISABLE_VIDEO_OFFERS) != null && TapjoyConnectCore.getFlagValue(TapjoyConnectFlag.DISABLE_VIDEO_OFFERS).equals("true")) {
            TapjoyLog.i(TAPJOY_VIDEO, "disable_video_offers: " + TapjoyConnectCore.getFlagValue(TapjoyConnectFlag.DISABLE_VIDEO_OFFERS) + ". Aborting video initializing... ");
            TapjoyConnectCore.setVideoEnabled(false);
            return;
        }
        setVideoIDs();
        new Thread(new Runnable() { // from class: com.tapjoy.TapjoyVideo.1
            @Override // java.lang.Runnable
            public void run() {
                boolean returnValue = false;
                String urlParams = TapjoyConnectCore.getURLParams();
                String result = new TapjoyURLConnection().connectToURL("https://ws.tapjoyads.com/videos?", urlParams + "&publisher_user_id=" + TapjoyConnectCore.getUserID());
                if (result != null && result.length() > 0) {
                    returnValue = TapjoyVideo.this.handleGetVideosResponse(result);
                }
                if (returnValue) {
                    TapjoyVideo.this.validateCachedVideos();
                    if (TapjoyVideo.watermarkURL != 0 && TapjoyVideo.watermarkURL.length() > 0) {
                        try {
                            URL fileURL = new URL(TapjoyVideo.watermarkURL);
                            URLConnection connection = fileURL.openConnection();
                            connection.setConnectTimeout(15000);
                            connection.setReadTimeout(25000);
                            connection.connect();
                            Bitmap unused = TapjoyVideo.watermarkImage = BitmapFactory.decodeStream(fileURL.openConnection().getInputStream());
                        } catch (Exception e) {
                            TapjoyLog.e(TapjoyVideo.TAPJOY_VIDEO, "e: " + e.toString());
                        }
                    }
                    TapjoyVideo.this.setVideoIDs();
                    TapjoyVideo.this.initialized = true;
                    TapjoyVideo.videoNotifierReady();
                    if (TapjoyVideo.this.cacheAuto) {
                        TapjoyLog.i(TapjoyVideo.TAPJOY_VIDEO, "trying to cache because of cache_auto flag...");
                        TapjoyVideo.this.cacheAllVideos();
                    }
                    TapjoyLog.i(TapjoyVideo.TAPJOY_VIDEO, "------------------------------");
                    TapjoyLog.i(TapjoyVideo.TAPJOY_VIDEO, "------------------------------");
                    TapjoyLog.i(TapjoyVideo.TAPJOY_VIDEO, "INIT DONE!");
                    TapjoyLog.i(TapjoyVideo.TAPJOY_VIDEO, "------------------------------");
                    return;
                }
                TapjoyVideo.videoNotifierError(2);
            }
        }).start();
        TapjoyConnectCore.setVideoEnabled(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean handleGetVideosResponse(String response) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        TapjoyLog.i(TAPJOY_VIDEO, "========================================");
        try {
            InputStream is = new ByteArrayInputStream(response.getBytes("UTF-8"));
            DocumentBuilder documentBuilder = factory.newDocumentBuilder();
            Document document = documentBuilder.parse(is);
            document.getDocumentElement().normalize();
            NodeList nodelistParent = document.getElementsByTagName("TapjoyVideos");
            NodeList nodelist = nodelistParent.item(0).getChildNodes();
            NamedNodeMap nodeMap = nodelistParent.item(0).getAttributes();
            if (nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_AUTO) != null && nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_AUTO).getNodeValue() != null) {
                this.cacheAuto = Boolean.valueOf(nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_AUTO).getNodeValue()).booleanValue();
            }
            if (nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_WIFI) != null && nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_WIFI).getNodeValue() != null) {
                this.cacheWifi = Boolean.valueOf(nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_WIFI).getNodeValue()).booleanValue();
            }
            if (nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_MOBILE) != null && nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_MOBILE).getNodeValue() != null) {
                this.cache3g = Boolean.valueOf(nodeMap.getNamedItem(TapjoyConstants.VIDEO_ATTRIBUTE_CACHE_MOBILE).getNodeValue()).booleanValue();
            }
            TapjoyLog.i(TAPJOY_VIDEO, "cacheAuto: " + this.cacheAuto);
            TapjoyLog.i(TAPJOY_VIDEO, "cacheWifi: " + this.cacheWifi);
            TapjoyLog.i(TAPJOY_VIDEO, "cache3g: " + this.cache3g);
            TapjoyLog.i(TAPJOY_VIDEO, "nodelistParent length: " + nodelistParent.getLength());
            TapjoyLog.i(TAPJOY_VIDEO, "nodelist length: " + nodelist.getLength());
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
                    TapjoyLog.i(TAPJOY_VIDEO, "-----");
                    TapjoyLog.i(TAPJOY_VIDEO, "videoObject.offerID: " + videoObject.offerID);
                    TapjoyLog.i(TAPJOY_VIDEO, "videoObject.videoAdName: " + videoObject.videoAdName);
                    TapjoyLog.i(TAPJOY_VIDEO, "videoObject.videoURL: " + videoObject.videoURL);
                    NodeList buttonData = element.getElementsByTagName("Buttons");
                    NodeList itemNodeList = buttonData.item(0).getChildNodes();
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
                            TapjoyLog.i(TAPJOY_VIDEO, "name: " + name + ", url: " + url);
                            videoObject.addButton(name, url);
                        }
                    }
                    this.videoQueue.addElement(videoObject.offerID);
                    this.uncachedVideos.put(videoObject.offerID, videoObject);
                }
            }
            TapjoyLog.i(TAPJOY_VIDEO, "========================================");
            return true;
        } catch (Exception e) {
            TapjoyLog.e(TAPJOY_VIDEO, "Error parsing XML: " + e.toString());
            return false;
        }
    }

    public TapjoyVideoObject getCurrentVideoData() {
        return this.videoToPlay;
    }

    public boolean startVideo(String videoID, String currencyName, String currencyAmount, String clickURL, String webviewURL, String videoURL) {
        File video;
        boolean cachedVideo = true;
        TapjoyLog.i(TAPJOY_VIDEO, "Starting video activity with video: " + videoID);
        if (videoID == null || clickURL == null || webviewURL == null || videoID.length() == 0 || clickURL.length() == 0 || webviewURL.length() == 0) {
            TapjoyLog.i(TAPJOY_VIDEO, "aborting video playback... invalid or missing parameter");
            return false;
        }
        this.videoToPlay = this.cachedVideos.get(videoID);
        String state = Environment.getExternalStorageState();
        if (!"mounted".equals(state)) {
            TapjoyLog.e(TAPJOY_VIDEO, "Cannot access external storage");
            videoNotifierError(1);
            return false;
        }
        if (this.videoToPlay == null) {
            TapjoyLog.i(TAPJOY_VIDEO, "video not cached... checking uncached videos");
            this.videoToPlay = this.uncachedVideos.get(videoID);
            if (this.videoToPlay == null) {
                if (videoURL != null && videoURL.length() > 0) {
                    TapjoyVideoObject newVideo = new TapjoyVideoObject();
                    newVideo.offerID = videoID;
                    newVideo.currencyName = currencyName;
                    newVideo.currencyAmount = currencyAmount;
                    newVideo.clickURL = clickURL;
                    newVideo.webviewURL = webviewURL;
                    newVideo.videoURL = videoURL;
                    this.uncachedVideos.put(videoID, newVideo);
                    this.videoToPlay = this.uncachedVideos.get(videoID);
                } else {
                    TapjoyLog.e(TAPJOY_VIDEO, "no video data and no video url - aborting playback...");
                    return false;
                }
            }
            cachedVideo = false;
        }
        this.videoToPlay.currencyName = currencyName;
        this.videoToPlay.currencyAmount = currencyAmount;
        this.videoToPlay.clickURL = clickURL;
        this.videoToPlay.webviewURL = webviewURL;
        this.videoToPlay.videoURL = videoURL;
        TapjoyLog.i(TAPJOY_VIDEO, "videoToPlay: " + this.videoToPlay.offerID);
        TapjoyLog.i(TAPJOY_VIDEO, "amount: " + this.videoToPlay.currencyAmount);
        TapjoyLog.i(TAPJOY_VIDEO, "currency: " + this.videoToPlay.currencyName);
        TapjoyLog.i(TAPJOY_VIDEO, "clickURL: " + this.videoToPlay.clickURL);
        TapjoyLog.i(TAPJOY_VIDEO, "location: " + this.videoToPlay.dataLocation);
        TapjoyLog.i(TAPJOY_VIDEO, "webviewURL: " + this.videoToPlay.webviewURL);
        TapjoyLog.i(TAPJOY_VIDEO, "videoURL: " + this.videoToPlay.videoURL);
        if (cachedVideo && this.videoToPlay.dataLocation != null && ((video = new File(this.videoToPlay.dataLocation)) == null || !video.exists())) {
            TapjoyLog.e(TAPJOY_VIDEO, "video file does not exist.");
            return false;
        }
        Intent videoIntent = new Intent(this.context, TapjoyVideoView.class);
        videoIntent.setFlags(DriveFile.MODE_READ_ONLY);
        videoIntent.putExtra(TapjoyConstants.EXTRA_VIDEO_PATH, videoID);
        this.context.startActivity(videoIntent);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cacheAllVideos() {
        new Thread(new Runnable() { // from class: com.tapjoy.TapjoyVideo.2
            @Override // java.lang.Runnable
            public void run() {
                TapjoyLog.i(TapjoyVideo.TAPJOY_VIDEO, "--- cacheAllVideos called ---");
                int elapsed = 0;
                while (!TapjoyVideo.this.initialized) {
                    try {
                        Thread.sleep(500L);
                        elapsed = (int) (elapsed + 500);
                    } catch (Exception e) {
                        TapjoyLog.e(TapjoyVideo.TAPJOY_VIDEO, "Exception in cacheAllVideos: " + e.toString());
                    }
                    if (elapsed > 10000) {
                        TapjoyLog.e(TapjoyVideo.TAPJOY_VIDEO, "Error during cacheVideos.  Timeout while waiting for initVideos to finish.");
                        return;
                    }
                    continue;
                }
                TapjoyLog.i(TapjoyVideo.TAPJOY_VIDEO, "cacheVideos connection_type: " + TapjoyConnectCore.getConnectionType());
                TapjoyLog.i(TapjoyVideo.TAPJOY_VIDEO, "cache3g: " + TapjoyVideo.this.cache3g);
                TapjoyLog.i(TapjoyVideo.TAPJOY_VIDEO, "cacheWifi: " + TapjoyVideo.this.cacheWifi);
                if ((TapjoyVideo.this.cache3g && TapjoyConnectCore.getConnectionType().equals(TapjoyConstants.TJC_CONNECTION_TYPE_MOBILE)) || (TapjoyVideo.this.cacheWifi && TapjoyConnectCore.getConnectionType().equals(TapjoyConstants.TJC_CONNECTION_TYPE_WIFI))) {
                    String state = Environment.getExternalStorageState();
                    if ("mounted".equals(state)) {
                        while (TapjoyVideo.this.cachedVideos.size() < TapjoyVideo.this.videoCacheLimit && TapjoyVideo.this.videoQueue.size() > 0) {
                            String url = ((TapjoyVideoObject) TapjoyVideo.this.uncachedVideos.get(TapjoyVideo.this.videoQueue.elementAt(0))).videoURL;
                            TapjoyVideo.this.cacheVideo(url);
                        }
                    } else {
                        TapjoyLog.i(TapjoyVideo.TAPJOY_VIDEO, "Media storage unavailable.  Aborting caching videos.");
                        TapjoyVideo.videoNotifierError(1);
                        return;
                    }
                } else {
                    TapjoyLog.i(TapjoyVideo.TAPJOY_VIDEO, " * Skipping caching videos because of video flags and connection_type...");
                }
                TapjoyVideo.this.printCachedVideos();
            }
        }).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void printCachedVideos() {
        TapjoyLog.i(TAPJOY_VIDEO, "cachedVideos size: " + this.cachedVideos.size());
        Set<Map.Entry<String, TapjoyVideoObject>> entries = this.cachedVideos.entrySet();
        for (Map.Entry<String, TapjoyVideoObject> item : entries) {
            TapjoyLog.i(TAPJOY_VIDEO, "key: " + item.getKey() + ", name: " + item.getValue().videoAdName);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0186  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0195 A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void cacheVideo(java.lang.String r28) {
        /*
            Method dump skipped, instructions count: 667
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tapjoy.TapjoyVideo.cacheVideo(java.lang.String):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setVideoIDs() {
        String videoIDs = "";
        if (this.cachedVideos != null && this.cachedVideos.size() > 0) {
            Enumeration<String> keys = this.cachedVideos.keys();
            while (keys.hasMoreElements()) {
                String key = keys.nextElement();
                videoIDs = videoIDs + key;
                if (keys.hasMoreElements()) {
                    videoIDs = videoIDs + ",";
                }
            }
            TapjoyLog.i(TAPJOY_VIDEO, "cachedVideos size: " + this.cachedVideos.size());
        }
        TapjoyLog.i(TAPJOY_VIDEO, "videoIDs: [" + videoIDs + "]");
        TapjoyConnectCore.setVideoIDs(videoIDs);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean validateCachedVideos() {
        boolean proceed = true;
        File[] cachedFilesOnDisk = new File(this.videoCacheDir).listFiles();
        if (this.uncachedVideos == null) {
            TapjoyLog.e(TAPJOY_VIDEO, "Error: uncachedVideos is null");
            proceed = false;
        }
        if (this.cachedVideos == null) {
            TapjoyLog.e(TAPJOY_VIDEO, "Error: cachedVideos is null");
            proceed = false;
        }
        if (this.videoQueue == null) {
            TapjoyLog.e(TAPJOY_VIDEO, "Error: videoQueue is null");
            proceed = false;
        }
        if (!proceed || cachedFilesOnDisk == null) {
            return false;
        }
        for (int i = 0; i < cachedFilesOnDisk.length; i++) {
            String key = cachedFilesOnDisk[i].getName();
            TapjoyLog.i(TAPJOY_VIDEO, "-----");
            TapjoyLog.i(TAPJOY_VIDEO, "Examining cached file[" + i + "]: " + cachedFilesOnDisk[i].getAbsolutePath() + " --- " + cachedFilesOnDisk[i].getName());
            if (this.uncachedVideos.containsKey(key)) {
                TapjoyLog.i(TAPJOY_VIDEO, "Local file found");
                TapjoyVideoObject videoObject = this.uncachedVideos.get(key);
                if (videoObject != null) {
                    String contentLength = new TapjoyURLConnection().getContentLength(videoObject.videoURL);
                    TapjoyLog.i(TAPJOY_VIDEO, "local file size: " + cachedFilesOnDisk[i].length() + " vs. target: " + contentLength);
                    if (contentLength != null && Integer.parseInt(contentLength) == cachedFilesOnDisk[i].length()) {
                        videoObject.dataLocation = cachedFilesOnDisk[i].getAbsolutePath();
                        this.cachedVideos.put(key, videoObject);
                        this.uncachedVideos.remove(key);
                        this.videoQueue.remove(key);
                        TapjoyLog.i(TAPJOY_VIDEO, "VIDEO PREVIOUSLY CACHED -- " + key + ", location: " + videoObject.dataLocation);
                    } else {
                        TapjoyLog.i(TAPJOY_VIDEO, "file size mismatch --- deleting video: " + cachedFilesOnDisk[i].getAbsolutePath());
                        TapjoyUtil.deleteFileOrDirectory(cachedFilesOnDisk[i]);
                    }
                }
            } else {
                TapjoyLog.i(TAPJOY_VIDEO, "VIDEO EXPIRED? removing video from cache: " + key + " --- " + cachedFilesOnDisk[i].getAbsolutePath());
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
