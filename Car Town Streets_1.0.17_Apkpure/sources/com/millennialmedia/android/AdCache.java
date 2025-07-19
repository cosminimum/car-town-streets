package com.millennialmedia.android;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Environment;
import com.millennialmedia.android.MMAdViewSDK;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AdCache {
    private static final String CACHED_AD_FILE = "ad.dat";
    private static final String CACHE_INCOMPLETE_PREFIX = "incompleteDownload_";
    private static final String CACHE_PREFIX = "nextCachedAd_";
    private static final String CACHE_PREFIX_APID = "nextCachedAd_apids";
    static final int ITERATE_ID = 0;
    static final int ITERATE_INFO = 1;
    static final int ITERATE_OBJECT = 2;
    private static final String LOCK_FILE = "ad.lock";
    static final int PRIORITY_FETCH = 3;
    static final int PRIORITY_PRECACHE = 1;
    static final int PRIORITY_REFRESH = 2;
    private static Set<String> apidListSet;
    private static String cachedVideoList;
    private static boolean cachedVideoListLoaded;
    private static HashSet cachedVideoSet;
    private static Map<String, String> incompleteDownloadHashMap;
    private static boolean incompleteDownloadHashMapLoaded;
    private static Map<String, String> nextCachedAdHashMap;
    private static boolean nextCachedAdHashMapLoaded;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public interface AdCacheTaskListener {
        void downloadCompleted(CachedAd cachedAd, boolean z);
    }

    private AdCache() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void startDownloadTask(Context context, String adName, CachedAd ad, AdCacheTaskListener listener) {
        AdCacheThreadPool.sharedThreadPool().startDownloadTask(context, adName, ad, listener);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized void cachedVideoWasAdded(Context context, String acid) {
        synchronized (AdCache.class) {
            if (acid != null) {
                if (!cachedVideoListLoaded) {
                    getCachedVideoList(context);
                }
                if (cachedVideoSet == null) {
                    cachedVideoSet = new HashSet();
                }
                cachedVideoSet.add(acid);
                cachedVideoList = null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized void cachedVideoWasRemoved(Context context, String acid) {
        synchronized (AdCache.class) {
            if (acid != null) {
                if (!cachedVideoListLoaded) {
                    getCachedVideoList(context);
                }
                if (cachedVideoSet != null) {
                    cachedVideoSet.remove(acid);
                    cachedVideoList = null;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized String getCachedVideoList(final Context context) {
        String str;
        synchronized (AdCache.class) {
            if (cachedVideoList == null) {
                if (!cachedVideoListLoaded) {
                    final HashSet hashSet = new HashSet();
                    iterateCachedAds(context, 2, new Iterator() { // from class: com.millennialmedia.android.AdCache.1
                        @Override // com.millennialmedia.android.AdCache.Iterator
                        boolean callback(CachedAd cachedAd) {
                            if (cachedAd.acid != null && cachedAd.getType() == 1 && cachedAd.isOnDisk(context)) {
                                hashSet.add(cachedAd.acid);
                            }
                            return true;
                        }
                    });
                    cachedVideoSet = hashSet;
                    cachedVideoListLoaded = true;
                }
                if (cachedVideoSet != null && cachedVideoSet.size() > 0) {
                    StringBuilder stringBuilder = new StringBuilder();
                    java.util.Iterator i$ = cachedVideoSet.iterator();
                    while (i$.hasNext()) {
                        Object acid = i$.next();
                        if (stringBuilder.length() > 0) {
                            stringBuilder.append("," + ((String) acid));
                        } else {
                            stringBuilder.append((String) acid);
                        }
                    }
                    cachedVideoList = stringBuilder.toString();
                }
            }
            str = cachedVideoList;
        }
        return str;
    }

    private static void loadNextCachedAdHashMap(Context context) {
        SharedPreferences settings = context.getSharedPreferences("MillennialMediaSettings", 0);
        nextCachedAdHashMap = new ConcurrentHashMap();
        if (apidListSet == null) {
            loadApidListSet(settings);
        }
        for (String apid : apidListSet) {
            String[] arr$ = MMAdView.getAdTypes();
            for (String adType : arr$) {
                String result = settings.getString(CACHE_PREFIX + adType + '_' + apid, null);
                if (result != null) {
                    nextCachedAdHashMap.put(adType + '_' + apid, result);
                }
            }
        }
        nextCachedAdHashMapLoaded = true;
    }

    private static void saveNextCachedAdHashMapValue(Context context, String adName) {
        if (adName != null) {
            SharedPreferences settings = context.getSharedPreferences("MillennialMediaSettings", 0);
            SharedPreferences.Editor editor = settings.edit();
            saveApidListSet(editor, adName);
            editor.putString(CACHE_PREFIX + adName, nextCachedAdHashMap.get(adName));
            editor.commit();
        }
    }

    static synchronized String getNextCachedAd(Context context, String adName) {
        String str;
        synchronized (AdCache.class) {
            if (!nextCachedAdHashMapLoaded) {
                loadNextCachedAdHashMap(context);
            }
            str = adName == null ? null : nextCachedAdHashMap.get(adName);
        }
        return str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static CachedAd loadNextCachedAd(Context context, String adName) {
        String nextAd = getNextCachedAd(context, adName);
        if (nextAd == null || nextAd.equals("")) {
            return null;
        }
        return load(context, nextAd);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized void setNextCachedAd(Context context, String adName, String id) {
        synchronized (AdCache.class) {
            if (!nextCachedAdHashMapLoaded) {
                loadNextCachedAdHashMap(context);
            }
            if (adName != null) {
                Map<String, String> map = nextCachedAdHashMap;
                if (id == null) {
                    id = "";
                }
                map.put(adName, id);
                saveNextCachedAdHashMapValue(context, adName);
            }
        }
    }

    private static void loadIncompleteDownloadHashMap(Context context) {
        SharedPreferences settings = context.getSharedPreferences("MillennialMediaSettings", 0);
        incompleteDownloadHashMap = new ConcurrentHashMap();
        if (apidListSet == null) {
            loadApidListSet(settings);
        }
        for (String apid : apidListSet) {
            String[] arr$ = MMAdView.getAdTypes();
            for (String adType : arr$) {
                String result = settings.getString(CACHE_INCOMPLETE_PREFIX + adType + '_' + apid, null);
                if (result != null) {
                    incompleteDownloadHashMap.put(adType + '_' + apid, result);
                }
            }
        }
        incompleteDownloadHashMapLoaded = true;
    }

    private static void saveIncompleteDownloadHashMap(Context context, String adName) {
        if (adName != null) {
            SharedPreferences settings = context.getSharedPreferences("MillennialMediaSettings", 0);
            SharedPreferences.Editor editor = settings.edit();
            saveApidListSet(editor, adName);
            editor.putString(CACHE_INCOMPLETE_PREFIX + adName, incompleteDownloadHashMap.get(adName));
            editor.commit();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized String getIncompleteDownload(Context context, String adName) {
        String str;
        synchronized (AdCache.class) {
            if (!incompleteDownloadHashMapLoaded) {
                loadIncompleteDownloadHashMap(context);
            }
            str = adName == null ? null : incompleteDownloadHashMap.get(adName);
        }
        return str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static CachedAd loadIncompleteDownload(Context context, String adName) {
        String nextIncompleteAd = getIncompleteDownload(context, adName);
        if (nextIncompleteAd == null) {
            return null;
        }
        return load(context, nextIncompleteAd);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized void setIncompleteDownload(Context context, String adName, String id) {
        synchronized (AdCache.class) {
            if (!incompleteDownloadHashMapLoaded) {
                loadIncompleteDownloadHashMap(context);
            }
            if (adName != null) {
                Map<String, String> map = incompleteDownloadHashMap;
                if (id == null) {
                    id = "";
                }
                map.put(adName, id);
                saveIncompleteDownloadHashMap(context, adName);
            }
        }
    }

    private static void loadApidListSet(SharedPreferences settings) {
        String[] apidArray;
        apidListSet = new HashSet();
        String apids = settings.getString(CACHE_PREFIX_APID, null);
        if (apids != null && (apidArray = apids.split(MMAdViewSDK.COMMA)) != null && apidArray.length > 0) {
            for (String apid : apidArray) {
                apidListSet.add(apid);
            }
        }
    }

    private static void saveApidListSet(SharedPreferences.Editor editor, String adName) {
        String apid;
        int start = adName.indexOf(95);
        if (start >= 0 && start < adName.length() && (apid = adName.substring(start + 1)) != null && !apidListSet.contains(apid)) {
            StringBuilder builder = null;
            if (!apidListSet.isEmpty()) {
                java.util.Iterator<String> apidIter = apidListSet.iterator();
                builder = new StringBuilder();
                while (apidIter.hasNext()) {
                    builder.append(apidIter.next() + MMAdViewSDK.COMMA);
                }
            }
            editor.putString(CACHE_PREFIX_APID, (builder == null ? "" : builder.toString()) + apid);
            apidListSet.add(apid);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class Iterator {
        boolean callback(String id) {
            return false;
        }

        boolean callback(String id, int type, Date expiration, String acid, long deferredViewStart, ObjectInputStream objectInputStream) {
            return false;
        }

        boolean callback(CachedAd ad) {
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Code restructure failed: missing block: B:38:?, code lost:
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void iterateCachedAds(android.content.Context r20, int r21, com.millennialmedia.android.AdCache.Iterator r22) {
        /*
            Method dump skipped, instructions count: 248
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.AdCache.iterateCachedAds(android.content.Context, int, com.millennialmedia.android.AdCache$Iterator):void");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void cleanUpExpiredAds(final Context context) {
        iterateCachedAds(context, 1, new Iterator() { // from class: com.millennialmedia.android.AdCache.3
            @Override // com.millennialmedia.android.AdCache.Iterator
            boolean callback(String id, int type, Date expiration, String acid, long deferredViewStart, ObjectInputStream objectInputStream) {
                if (expiration != null && expiration.getTime() <= System.currentTimeMillis()) {
                    try {
                        CachedAd ad = (CachedAd) objectInputStream.readObject();
                        MMAdViewSDK.Log.d("Deleting expired ad %s.", ad.id);
                        ad.delete(context);
                    } catch (Exception e) {
                        MMAdViewSDK.Log.d("There was a problem reading the cached ad %s.", id);
                        MMAdViewSDK.Log.d(e);
                    }
                }
                return true;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void resetCache(final Context context) {
        iterateCachedAds(context, 2, new Iterator() { // from class: com.millennialmedia.android.AdCache.4
            @Override // com.millennialmedia.android.AdCache.Iterator
            boolean callback(CachedAd ad) {
                MMAdViewSDK.Log.d("Deleting ad %s.", ad.id);
                ad.delete(context);
                return true;
            }
        });
        cachedVideoSet = null;
        cachedVideoList = null;
        cachedVideoListLoaded = false;
        if (nextCachedAdHashMap != null) {
            for (String key : nextCachedAdHashMap.keySet()) {
                setNextCachedAd(context, key, null);
            }
        }
        if (incompleteDownloadHashMap != null) {
            for (String key2 : incompleteDownloadHashMap.keySet()) {
                setIncompleteDownload(context, key2, null);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static File getCacheDirectory(Context context) {
        return getCacheDirectory(context, null);
    }

    static File getCacheDirectory(Context context, boolean[] isExternal) {
        File millennialMediaDir;
        File millennialMediaDir2;
        File dir;
        File millennialMediaDir3 = null;
        try {
            if (Environment.getExternalStorageState().equals("mounted")) {
                millennialMediaDir = new File(Environment.getExternalStorageDirectory(), ".mmsyscache");
                try {
                    millennialMediaDir3 = (millennialMediaDir.exists() || millennialMediaDir.mkdirs()) ? millennialMediaDir : null;
                    if (millennialMediaDir3 != null && isExternal != null) {
                        isExternal[0] = true;
                    }
                } catch (Exception e) {
                    e = e;
                    MMAdViewSDK.Log.e(e);
                    return null;
                }
            }
            millennialMediaDir = millennialMediaDir3;
            if (millennialMediaDir != null || (dir = context.getCacheDir()) == null) {
                millennialMediaDir2 = millennialMediaDir;
            } else {
                millennialMediaDir2 = new File(dir, ".mmsyscache");
                if (!millennialMediaDir2.exists() && !millennialMediaDir2.mkdirs()) {
                    millennialMediaDir2 = null;
                }
                if (millennialMediaDir2 != null && isExternal != null) {
                    isExternal[0] = false;
                }
            }
            return millennialMediaDir2;
        } catch (Exception e2) {
            e = e2;
        }
    }

    static File getCachedAdFile(Context context, String id) {
        return getCachedAdFile(context, id, null);
    }

    static File getCachedAdFile(Context context, String id, boolean[] isExternal) {
        File internalFile;
        boolean[] ext = new boolean[1];
        File cacheDir = getCacheDirectory(context, ext);
        File adFile = null;
        if (isExternal != null) {
            isExternal[0] = ext[0];
        }
        if (cacheDir != null) {
            try {
                if (cacheDir.isDirectory()) {
                    adFile = new File(cacheDir, id + CACHED_AD_FILE);
                }
            } catch (Exception e) {
                MMAdViewSDK.Log.e(e);
                return null;
            }
        }
        if ((adFile == null || !adFile.exists()) && ext[0] && (internalFile = context.getCacheDir()) != null) {
            File internalFile2 = new File(internalFile, ".mmsyscache" + File.separator + id + CACHED_AD_FILE);
            if (internalFile2.exists() && internalFile2.isFile()) {
                if (isExternal != null) {
                    isExternal[0] = false;
                    return internalFile2;
                }
                return internalFile2;
            }
        }
        return adFile;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:50:0x012c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean downloadComponent(java.lang.String r19, java.lang.String r20, java.io.File r21) {
        /*
            Method dump skipped, instructions count: 458
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.AdCache.downloadComponent(java.lang.String, java.lang.String, java.io.File):boolean");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static CachedAd load(Context context, String id) {
        ObjectInputStream objectInputStream;
        if (id == null) {
            return null;
        }
        ObjectInputStream objectInputStream2 = null;
        CachedAd ad = null;
        boolean[] isExternal = new boolean[1];
        File cachedAdFile = getCachedAdFile(context, id, isExternal);
        try {
            if (cachedAdFile == null) {
                return null;
            }
            try {
                objectInputStream = new ObjectInputStream(new FileInputStream(cachedAdFile));
            } catch (FileNotFoundException e) {
            } catch (Exception e2) {
                e = e2;
            }
            try {
                objectInputStream.readInt();
                Date date = (Date) objectInputStream.readObject();
                objectInputStream.readObject();
                objectInputStream.readLong();
                ad = (CachedAd) objectInputStream.readObject();
                ad.storedOnSdCard = isExternal[0];
                if (objectInputStream != null) {
                    try {
                        objectInputStream.close();
                    } catch (IOException e3) {
                        objectInputStream2 = objectInputStream;
                    }
                }
                objectInputStream2 = objectInputStream;
            } catch (FileNotFoundException e4) {
                objectInputStream2 = objectInputStream;
                MMAdViewSDK.Log.e("There was a problem loading up the cached ad %s. Ad is not on disk.", id);
                if (objectInputStream2 != null) {
                    try {
                        objectInputStream2.close();
                    } catch (IOException e5) {
                    }
                }
                return ad;
            } catch (Exception e6) {
                e = e6;
                objectInputStream2 = objectInputStream;
                MMAdViewSDK.Log.e("There was a problem loading up the cached ad %s.", id);
                MMAdViewSDK.Log.d(e.getMessage());
                MMAdViewSDK.Log.d(e);
                if (objectInputStream2 != null) {
                    try {
                        objectInputStream2.close();
                    } catch (IOException e7) {
                    }
                }
                return ad;
            } catch (Throwable th) {
                th = th;
                objectInputStream2 = objectInputStream;
                if (objectInputStream2 != null) {
                    try {
                        objectInputStream2.close();
                    } catch (IOException e8) {
                    }
                }
                throw th;
            }
            return ad;
        } catch (Throwable th2) {
            th = th2;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean save(Context context, CachedAd ad) {
        File cachedAdFile;
        boolean z = false;
        File lockFile = null;
        ObjectOutputStream objectOutputStream = null;
        boolean[] isExternal = new boolean[1];
        if (ad != null && (cachedAdFile = getCachedAdFile(context, ad.id, isExternal)) != null) {
            MMAdViewSDK.Log.v("Saving CachedAd %s to %s", ad.id, cachedAdFile);
            try {
                try {
                    File lockFile2 = new File(cachedAdFile.getParent(), ad.id + LOCK_FILE);
                    try {
                        if (!lockFile2.createNewFile()) {
                            MMAdViewSDK.Log.v("Could not save the cached ad %s. Ad was locked.", ad.id);
                            try {
                                lockFile2.delete();
                                if (0 != 0) {
                                    objectOutputStream.close();
                                }
                            } catch (IOException e) {
                            }
                        } else {
                            ObjectOutputStream objectOutputStream2 = new ObjectOutputStream(new FileOutputStream(cachedAdFile));
                            try {
                                objectOutputStream2.writeInt(ad.getType());
                                objectOutputStream2.writeObject(ad.expiration);
                                objectOutputStream2.writeObject(ad.acid);
                                objectOutputStream2.writeLong(ad.deferredViewStart);
                                objectOutputStream2.writeObject(ad);
                                ad.storedOnSdCard = isExternal[0];
                                try {
                                    lockFile2.delete();
                                    if (objectOutputStream2 != null) {
                                        objectOutputStream2.close();
                                    }
                                } catch (IOException e2) {
                                }
                                if (!ad.saveAssets(context)) {
                                    ad.delete(context);
                                    objectOutputStream = objectOutputStream2;
                                } else {
                                    objectOutputStream = objectOutputStream2;
                                    z = true;
                                }
                            } catch (Exception e3) {
                                e = e3;
                                objectOutputStream = objectOutputStream2;
                                lockFile = lockFile2;
                                MMAdViewSDK.Log.e("There was a problem saving the cached ad %s.", ad.id);
                                MMAdViewSDK.Log.d(e.getMessage());
                                MMAdViewSDK.Log.d(e);
                                try {
                                    lockFile.delete();
                                    if (objectOutputStream != null) {
                                        objectOutputStream.close();
                                    }
                                } catch (IOException e4) {
                                }
                                return z;
                            } catch (Throwable th) {
                                th = th;
                                objectOutputStream = objectOutputStream2;
                                lockFile = lockFile2;
                                try {
                                    lockFile.delete();
                                    if (objectOutputStream != null) {
                                        objectOutputStream.close();
                                    }
                                } catch (IOException e5) {
                                }
                                throw th;
                            }
                        }
                    } catch (Exception e6) {
                        e = e6;
                        lockFile = lockFile2;
                    } catch (Throwable th2) {
                        th = th2;
                        lockFile = lockFile2;
                    }
                } catch (Exception e7) {
                    e = e7;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
        return z;
    }
}
