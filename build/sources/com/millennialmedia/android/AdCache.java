package com.millennialmedia.android;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Environment;
import com.millennialmedia.android.MMAdViewSDK;
import java.io.File;
import java.io.ObjectInputStream;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

final class AdCache {
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

    interface AdCacheTaskListener {
        void downloadCompleted(CachedAd cachedAd, boolean z);
    }

    private AdCache() {
    }

    static void startDownloadTask(Context context, String adName, CachedAd ad, AdCacheTaskListener listener) {
        AdCacheThreadPool.sharedThreadPool().startDownloadTask(context, adName, ad, listener);
    }

    static synchronized void cachedVideoWasAdded(Context context, String acid) {
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

    static synchronized void cachedVideoWasRemoved(Context context, String acid) {
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

    static synchronized String getCachedVideoList(final Context context) {
        String str;
        synchronized (AdCache.class) {
            if (cachedVideoList == null) {
                if (!cachedVideoListLoaded) {
                    final HashSet hashSet = new HashSet();
                    iterateCachedAds(context, 2, new Iterator() {
                        /* access modifiers changed from: package-private */
                        public boolean callback(CachedAd cachedAd) {
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
            for (String adType : MMAdView.getAdTypes()) {
                String result = settings.getString(CACHE_PREFIX + adType + '_' + apid, (String) null);
                if (result != null) {
                    nextCachedAdHashMap.put(adType + '_' + apid, result);
                }
            }
        }
        nextCachedAdHashMapLoaded = true;
    }

    private static void saveNextCachedAdHashMapValue(Context context, String adName) {
        if (adName != null) {
            SharedPreferences.Editor editor = context.getSharedPreferences("MillennialMediaSettings", 0).edit();
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

    static CachedAd loadNextCachedAd(Context context, String adName) {
        String nextAd = getNextCachedAd(context, adName);
        if (nextAd == null || nextAd.equals("")) {
            return null;
        }
        return load(context, nextAd);
    }

    static synchronized void setNextCachedAd(Context context, String adName, String id) {
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
            for (String adType : MMAdView.getAdTypes()) {
                String result = settings.getString(CACHE_INCOMPLETE_PREFIX + adType + '_' + apid, (String) null);
                if (result != null) {
                    incompleteDownloadHashMap.put(adType + '_' + apid, result);
                }
            }
        }
        incompleteDownloadHashMapLoaded = true;
    }

    private static void saveIncompleteDownloadHashMap(Context context, String adName) {
        if (adName != null) {
            SharedPreferences.Editor editor = context.getSharedPreferences("MillennialMediaSettings", 0).edit();
            saveApidListSet(editor, adName);
            editor.putString(CACHE_INCOMPLETE_PREFIX + adName, incompleteDownloadHashMap.get(adName));
            editor.commit();
        }
    }

    static synchronized String getIncompleteDownload(Context context, String adName) {
        String str;
        synchronized (AdCache.class) {
            if (!incompleteDownloadHashMapLoaded) {
                loadIncompleteDownloadHashMap(context);
            }
            str = adName == null ? null : incompleteDownloadHashMap.get(adName);
        }
        return str;
    }

    static CachedAd loadIncompleteDownload(Context context, String adName) {
        String nextIncompleteAd = getIncompleteDownload(context, adName);
        if (nextIncompleteAd == null) {
            return null;
        }
        return load(context, nextIncompleteAd);
    }

    static synchronized void setIncompleteDownload(Context context, String adName, String id) {
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
        String apids = settings.getString(CACHE_PREFIX_APID, (String) null);
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
                builder = new StringBuilder();
                for (String str : apidListSet) {
                    builder.append(str + MMAdViewSDK.COMMA);
                }
            }
            editor.putString(CACHE_PREFIX_APID, (builder == null ? "" : builder.toString()) + apid);
            apidListSet.add(apid);
        }
    }

    static class Iterator {
        Iterator() {
        }

        /* access modifiers changed from: package-private */
        public boolean callback(String id) {
            return false;
        }

        /* access modifiers changed from: package-private */
        public boolean callback(String id, int type, Date expiration, String acid, long deferredViewStart, ObjectInputStream objectInputStream) {
            return false;
        }

        /* access modifiers changed from: package-private */
        public boolean callback(CachedAd ad) {
            return false;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:71:0x00d9 A[SYNTHETIC, Splitter:B:71:0x00d9] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static void iterateCachedAds(android.content.Context r20, int r21, com.millennialmedia.android.AdCache.Iterator r22) {
        /*
            java.io.File r13 = getCacheDirectory(r20)
            r8 = 0
            r9 = 0
            if (r13 == 0) goto L_0x0049
            com.millennialmedia.android.AdCache$2 r1 = new com.millennialmedia.android.AdCache$2
            r1.<init>()
            java.io.File[] r11 = r13.listFiles(r1)
            r12 = r11
            int r0 = r12.length
            r16 = r0
            r15 = 0
            r17 = r8
        L_0x0018:
            r0 = r16
            if (r15 >= r0) goto L_0x00f4
            r10 = r12[r15]
            if (r10 == 0) goto L_0x0026
            boolean r1 = r10.exists()     // Catch:{ Exception -> 0x00b6, all -> 0x00d4 }
            if (r1 != 0) goto L_0x0035
        L_0x0026:
            if (r17 == 0) goto L_0x00f0
            r17.close()     // Catch:{ IOException -> 0x0031 }
            r8 = 0
        L_0x002c:
            int r15 = r15 + 1
            r17 = r8
            goto L_0x0018
        L_0x0031:
            r1 = move-exception
            r8 = r17
            goto L_0x002c
        L_0x0035:
            if (r21 != 0) goto L_0x0059
            java.lang.String r1 = r10.getName()     // Catch:{ Exception -> 0x00b6, all -> 0x00d4 }
            r0 = r22
            boolean r1 = r0.callback((java.lang.String) r1)     // Catch:{ Exception -> 0x00b6, all -> 0x00d4 }
            if (r1 != 0) goto L_0x004e
            if (r17 == 0) goto L_0x00f4
            r17.close()     // Catch:{ IOException -> 0x004a }
            r8 = 0
        L_0x0049:
            return
        L_0x004a:
            r1 = move-exception
            r8 = r17
            goto L_0x0049
        L_0x004e:
            if (r17 == 0) goto L_0x00f0
            r17.close()     // Catch:{ IOException -> 0x0055 }
            r8 = 0
            goto L_0x002c
        L_0x0055:
            r1 = move-exception
            r8 = r17
            goto L_0x002c
        L_0x0059:
            java.io.ObjectInputStream r8 = new java.io.ObjectInputStream     // Catch:{ Exception -> 0x00b6, all -> 0x00d4 }
            java.io.FileInputStream r1 = new java.io.FileInputStream     // Catch:{ Exception -> 0x00b6, all -> 0x00d4 }
            r1.<init>(r10)     // Catch:{ Exception -> 0x00b6, all -> 0x00d4 }
            r8.<init>(r1)     // Catch:{ Exception -> 0x00b6, all -> 0x00d4 }
            int r3 = r8.readInt()     // Catch:{ Exception -> 0x00ee }
            java.lang.Object r4 = r8.readObject()     // Catch:{ Exception -> 0x00ee }
            java.util.Date r4 = (java.util.Date) r4     // Catch:{ Exception -> 0x00ee }
            java.lang.Object r5 = r8.readObject()     // Catch:{ Exception -> 0x00ee }
            java.lang.String r5 = (java.lang.String) r5     // Catch:{ Exception -> 0x00ee }
            long r6 = r8.readLong()     // Catch:{ Exception -> 0x00ee }
            r1 = 1
            r0 = r21
            if (r0 != r1) goto L_0x0093
            java.lang.String r2 = r10.getName()     // Catch:{ Exception -> 0x00ee }
            r1 = r22
            boolean r1 = r1.callback(r2, r3, r4, r5, r6, r8)     // Catch:{ Exception -> 0x00ee }
            if (r1 != 0) goto L_0x00ae
            r8.close()     // Catch:{ Exception -> 0x00ee }
            r8 = 0
            if (r8 == 0) goto L_0x0049
            r8.close()     // Catch:{ IOException -> 0x00de }
            r8 = 0
            goto L_0x0049
        L_0x0093:
            java.lang.Object r1 = r8.readObject()     // Catch:{ Exception -> 0x00ee }
            r0 = r1
            com.millennialmedia.android.CachedAd r0 = (com.millennialmedia.android.CachedAd) r0     // Catch:{ Exception -> 0x00ee }
            r9 = r0
            r0 = r22
            boolean r1 = r0.callback((com.millennialmedia.android.CachedAd) r9)     // Catch:{ Exception -> 0x00ee }
            if (r1 != 0) goto L_0x00ae
            r8.close()     // Catch:{ Exception -> 0x00ee }
            r8 = 0
            if (r8 == 0) goto L_0x0049
            r8.close()     // Catch:{ IOException -> 0x00e1 }
            r8 = 0
            goto L_0x0049
        L_0x00ae:
            if (r8 == 0) goto L_0x002c
            r8.close()     // Catch:{ IOException -> 0x00e4 }
            r8 = 0
            goto L_0x002c
        L_0x00b6:
            r14 = move-exception
            r8 = r17
        L_0x00b9:
            java.lang.String r1 = "There was a problem reading the cached ad %s."
            r2 = 1
            java.lang.Object[] r2 = new java.lang.Object[r2]     // Catch:{ all -> 0x00ec }
            r18 = 0
            java.lang.String r19 = r10.getName()     // Catch:{ all -> 0x00ec }
            r2[r18] = r19     // Catch:{ all -> 0x00ec }
            com.millennialmedia.android.MMAdViewSDK.Log.m4417d(r1, r2)     // Catch:{ all -> 0x00ec }
            com.millennialmedia.android.MMAdViewSDK.Log.m4418d((java.lang.Throwable) r14)     // Catch:{ all -> 0x00ec }
            if (r8 == 0) goto L_0x002c
            r8.close()     // Catch:{ IOException -> 0x00e7 }
            r8 = 0
            goto L_0x002c
        L_0x00d4:
            r1 = move-exception
            r8 = r17
        L_0x00d7:
            if (r8 == 0) goto L_0x00dd
            r8.close()     // Catch:{ IOException -> 0x00ea }
            r8 = 0
        L_0x00dd:
            throw r1
        L_0x00de:
            r1 = move-exception
            goto L_0x0049
        L_0x00e1:
            r1 = move-exception
            goto L_0x0049
        L_0x00e4:
            r1 = move-exception
            goto L_0x002c
        L_0x00e7:
            r1 = move-exception
            goto L_0x002c
        L_0x00ea:
            r2 = move-exception
            goto L_0x00dd
        L_0x00ec:
            r1 = move-exception
            goto L_0x00d7
        L_0x00ee:
            r14 = move-exception
            goto L_0x00b9
        L_0x00f0:
            r8 = r17
            goto L_0x002c
        L_0x00f4:
            r8 = r17
            goto L_0x0049
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.AdCache.iterateCachedAds(android.content.Context, int, com.millennialmedia.android.AdCache$Iterator):void");
    }

    static void cleanUpExpiredAds(final Context context) {
        iterateCachedAds(context, 1, new Iterator() {
            /* access modifiers changed from: package-private */
            public boolean callback(String id, int type, Date expiration, String acid, long deferredViewStart, ObjectInputStream objectInputStream) {
                if (expiration != null && expiration.getTime() <= System.currentTimeMillis()) {
                    try {
                        CachedAd ad = (CachedAd) objectInputStream.readObject();
                        MMAdViewSDK.Log.m4417d("Deleting expired ad %s.", ad.f3958id);
                        ad.delete(context);
                    } catch (Exception e) {
                        MMAdViewSDK.Log.m4417d("There was a problem reading the cached ad %s.", id);
                        MMAdViewSDK.Log.m4418d((Throwable) e);
                    }
                }
                return true;
            }
        });
    }

    static void resetCache(final Context context) {
        iterateCachedAds(context, 2, new Iterator() {
            /* access modifiers changed from: package-private */
            public boolean callback(CachedAd ad) {
                MMAdViewSDK.Log.m4417d("Deleting ad %s.", ad.f3958id);
                ad.delete(context);
                return true;
            }
        });
        cachedVideoSet = null;
        cachedVideoList = null;
        cachedVideoListLoaded = false;
        if (nextCachedAdHashMap != null) {
            for (String key : nextCachedAdHashMap.keySet()) {
                setNextCachedAd(context, key, (String) null);
            }
        }
        if (incompleteDownloadHashMap != null) {
            for (String key2 : incompleteDownloadHashMap.keySet()) {
                setIncompleteDownload(context, key2, (String) null);
            }
        }
    }

    static File getCacheDirectory(Context context) {
        return getCacheDirectory(context, (boolean[]) null);
    }

    static File getCacheDirectory(Context context, boolean[] isExternal) {
        File millennialMediaDir;
        File millennialMediaDir2;
        File millennialMediaDir3 = null;
        try {
            if (Environment.getExternalStorageState().equals("mounted")) {
                millennialMediaDir = new File(Environment.getExternalStorageDirectory(), ".mmsyscache");
                try {
                    if (millennialMediaDir.exists() || millennialMediaDir.mkdirs()) {
                        millennialMediaDir3 = millennialMediaDir;
                    } else {
                        millennialMediaDir3 = null;
                    }
                    if (!(millennialMediaDir3 == null || isExternal == null)) {
                        isExternal[0] = true;
                    }
                } catch (Exception e) {
                    e = e;
                    File file = millennialMediaDir;
                    MMAdViewSDK.Log.m4421e((Throwable) e);
                    return null;
                }
            }
            millennialMediaDir = millennialMediaDir3;
            if (millennialMediaDir == null) {
                File dir = context.getCacheDir();
                if (dir != null) {
                    millennialMediaDir2 = new File(dir, ".mmsyscache");
                    if (!millennialMediaDir2.exists() && !millennialMediaDir2.mkdirs()) {
                        millennialMediaDir2 = null;
                    }
                    if (!(millennialMediaDir2 == null || isExternal == null)) {
                        isExternal[0] = false;
                    }
                    return millennialMediaDir2;
                }
            }
            millennialMediaDir2 = millennialMediaDir;
            return millennialMediaDir2;
        } catch (Exception e2) {
            e = e2;
            MMAdViewSDK.Log.m4421e((Throwable) e);
            return null;
        }
    }

    static File getCachedAdFile(Context context, String id) {
        return getCachedAdFile(context, id, (boolean[]) null);
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
                MMAdViewSDK.Log.m4421e((Throwable) e);
                return null;
            }
        }
        if ((adFile == null || !adFile.exists()) && ext[0] && (internalFile = context.getCacheDir()) != null) {
            File internalFile2 = new File(internalFile, ".mmsyscache" + File.separator + id + CACHED_AD_FILE);
            if (internalFile2.exists() && internalFile2.isFile()) {
                if (isExternal == null) {
                    return internalFile2;
                }
                isExternal[0] = false;
                return internalFile2;
            }
        }
        return adFile;
    }

    /* JADX WARNING: Removed duplicated region for block: B:62:0x012c  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x0162 A[SYNTHETIC, Splitter:B:80:0x0162] */
    /* JADX WARNING: Removed duplicated region for block: B:83:0x0167 A[Catch:{ IOException -> 0x01a7 }] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static boolean downloadComponent(java.lang.String r19, java.lang.String r20, java.io.File r21) {
        /*
            java.io.File r9 = new java.io.File
            r0 = r21
            r1 = r20
            r9.<init>(r0, r1)
            java.lang.String r15 = "Downloading Component: %s from %s"
            r16 = 2
            r0 = r16
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r16 = r0
            r17 = 0
            r16[r17] = r20
            r17 = 1
            r16[r17] = r19
            com.millennialmedia.android.MMAdViewSDK.Log.m4429v(r15, r16)
            boolean r15 = r9.exists()
            if (r15 == 0) goto L_0x0048
            long r15 = r9.length()
            r17 = 0
            int r15 = (r15 > r17 ? 1 : (r15 == r17 ? 0 : -1))
            if (r15 <= 0) goto L_0x0048
            java.lang.StringBuilder r15 = new java.lang.StringBuilder
            r15.<init>()
            r0 = r20
            java.lang.StringBuilder r15 = r15.append(r0)
            java.lang.String r16 = " already exists, skipping..."
            java.lang.StringBuilder r15 = r15.append(r16)
            java.lang.String r15 = r15.toString()
            com.millennialmedia.android.MMAdViewSDK.Log.m4428v((java.lang.String) r15)
            r15 = 1
        L_0x0047:
            return r15
        L_0x0048:
            r13 = 0
            r11 = 0
            r5 = -1
            java.net.URL r4 = new java.net.URL     // Catch:{ Exception -> 0x01c7 }
            r0 = r19
            r4.<init>(r0)     // Catch:{ Exception -> 0x01c7 }
            r15 = 1
            java.net.HttpURLConnection.setFollowRedirects(r15)     // Catch:{ Exception -> 0x01c7 }
            java.net.URLConnection r3 = r4.openConnection()     // Catch:{ Exception -> 0x01c7 }
            java.net.HttpURLConnection r3 = (java.net.HttpURLConnection) r3     // Catch:{ Exception -> 0x01c7 }
            r15 = 30000(0x7530, float:4.2039E-41)
            r3.setConnectTimeout(r15)     // Catch:{ Exception -> 0x01c7 }
            java.lang.String r15 = "GET"
            r3.setRequestMethod(r15)     // Catch:{ Exception -> 0x01c7 }
            r3.connect()     // Catch:{ Exception -> 0x01c7 }
            java.io.InputStream r13 = r3.getInputStream()     // Catch:{ Exception -> 0x01c7 }
            java.lang.String r15 = "Content-Length"
            java.lang.String r14 = r3.getHeaderField(r15)     // Catch:{ Exception -> 0x01c7 }
            if (r14 == 0) goto L_0x007a
            long r5 = java.lang.Long.parseLong(r14)     // Catch:{ Exception -> 0x01c7 }
        L_0x007a:
            if (r13 != 0) goto L_0x00b6
            java.lang.String r15 = "Connection stream is null downloading %s."
            r16 = 1
            r0 = r16
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x01c7 }
            r16 = r0
            r17 = 0
            r16[r17] = r20     // Catch:{ Exception -> 0x01c7 }
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r15, r16)     // Catch:{ Exception -> 0x01c7 }
            r15 = 0
            if (r13 == 0) goto L_0x0093
            r13.close()     // Catch:{ IOException -> 0x0099 }
        L_0x0093:
            if (r11 == 0) goto L_0x0047
            r11.close()     // Catch:{ IOException -> 0x0099 }
            goto L_0x0047
        L_0x0099:
            r8 = move-exception
            java.lang.String r15 = "Content caching error: %s"
            r16 = 1
            r0 = r16
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r16 = r0
            r17 = 0
            java.lang.String r18 = r8.getMessage()
            r16[r17] = r18
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r15, r16)
            if (r9 == 0) goto L_0x00b4
            r9.delete()
        L_0x00b4:
            r15 = 0
            goto L_0x0047
        L_0x00b6:
            java.io.FileOutputStream r12 = new java.io.FileOutputStream     // Catch:{ Exception -> 0x01c7 }
            r12.<init>(r9)     // Catch:{ Exception -> 0x01c7 }
            r15 = 1024(0x400, float:1.435E-42)
            byte[] r2 = new byte[r15]     // Catch:{ Exception -> 0x0105, all -> 0x015e }
        L_0x00bf:
            int r10 = r13.read(r2)     // Catch:{ Exception -> 0x0105, all -> 0x015e }
            if (r10 > 0) goto L_0x0100
            if (r9 == 0) goto L_0x0137
            long r15 = r9.length()     // Catch:{ SecurityException -> 0x0143 }
            int r15 = (r15 > r5 ? 1 : (r15 == r5 ? 0 : -1))
            if (r15 == 0) goto L_0x00d5
            r15 = -1
            int r15 = (r5 > r15 ? 1 : (r5 == r15 ? 0 : -1))
            if (r15 != 0) goto L_0x0132
        L_0x00d5:
            r15 = 1
            if (r13 == 0) goto L_0x00db
            r13.close()     // Catch:{ IOException -> 0x00e2 }
        L_0x00db:
            if (r12 == 0) goto L_0x0047
            r12.close()     // Catch:{ IOException -> 0x00e2 }
            goto L_0x0047
        L_0x00e2:
            r8 = move-exception
            java.lang.String r15 = "Content caching error: %s"
            r16 = 1
            r0 = r16
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r16 = r0
            r17 = 0
            java.lang.String r18 = r8.getMessage()
            r16[r17] = r18
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r15, r16)
            if (r9 == 0) goto L_0x00fd
            r9.delete()
        L_0x00fd:
            r15 = 0
            goto L_0x0047
        L_0x0100:
            r15 = 0
            r12.write(r2, r15, r10)     // Catch:{ Exception -> 0x0105, all -> 0x015e }
            goto L_0x00bf
        L_0x0105:
            r7 = move-exception
            r11 = r12
        L_0x0107:
            java.lang.String r15 = "Exception downloading component %s: %s"
            r16 = 2
            r0 = r16
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ all -> 0x01c5 }
            r16 = r0
            r17 = 0
            r16[r17] = r20     // Catch:{ all -> 0x01c5 }
            r17 = 1
            java.lang.String r18 = r7.getMessage()     // Catch:{ all -> 0x01c5 }
            r16[r17] = r18     // Catch:{ all -> 0x01c5 }
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r15, r16)     // Catch:{ all -> 0x01c5 }
            if (r13 == 0) goto L_0x0125
            r13.close()     // Catch:{ IOException -> 0x0189 }
        L_0x0125:
            if (r11 == 0) goto L_0x012a
            r11.close()     // Catch:{ IOException -> 0x0189 }
        L_0x012a:
            if (r9 == 0) goto L_0x012f
            r9.delete()
        L_0x012f:
            r15 = 0
            goto L_0x0047
        L_0x0132:
            java.lang.String r15 = "Content-Length does not match actual length."
            com.millennialmedia.android.MMAdViewSDK.Log.m4419e((java.lang.String) r15)     // Catch:{ SecurityException -> 0x0143 }
        L_0x0137:
            if (r13 == 0) goto L_0x013c
            r13.close()     // Catch:{ IOException -> 0x016b }
        L_0x013c:
            if (r12 == 0) goto L_0x0141
            r12.close()     // Catch:{ IOException -> 0x016b }
        L_0x0141:
            r11 = r12
            goto L_0x012a
        L_0x0143:
            r7 = move-exception
            java.lang.String r15 = "Exception downloading component %s: %s"
            r16 = 2
            r0 = r16
            java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0105, all -> 0x015e }
            r16 = r0
            r17 = 0
            r16[r17] = r20     // Catch:{ Exception -> 0x0105, all -> 0x015e }
            r17 = 1
            java.lang.String r18 = r7.getMessage()     // Catch:{ Exception -> 0x0105, all -> 0x015e }
            r16[r17] = r18     // Catch:{ Exception -> 0x0105, all -> 0x015e }
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r15, r16)     // Catch:{ Exception -> 0x0105, all -> 0x015e }
            goto L_0x0137
        L_0x015e:
            r15 = move-exception
            r11 = r12
        L_0x0160:
            if (r13 == 0) goto L_0x0165
            r13.close()     // Catch:{ IOException -> 0x01a7 }
        L_0x0165:
            if (r11 == 0) goto L_0x016a
            r11.close()     // Catch:{ IOException -> 0x01a7 }
        L_0x016a:
            throw r15
        L_0x016b:
            r8 = move-exception
            java.lang.String r15 = "Content caching error: %s"
            r16 = 1
            r0 = r16
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r16 = r0
            r17 = 0
            java.lang.String r18 = r8.getMessage()
            r16[r17] = r18
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r15, r16)
            if (r9 == 0) goto L_0x0186
            r9.delete()
        L_0x0186:
            r15 = 0
            goto L_0x0047
        L_0x0189:
            r8 = move-exception
            java.lang.String r15 = "Content caching error: %s"
            r16 = 1
            r0 = r16
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r16 = r0
            r17 = 0
            java.lang.String r18 = r8.getMessage()
            r16[r17] = r18
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r15, r16)
            if (r9 == 0) goto L_0x01a4
            r9.delete()
        L_0x01a4:
            r15 = 0
            goto L_0x0047
        L_0x01a7:
            r8 = move-exception
            java.lang.String r15 = "Content caching error: %s"
            r16 = 1
            r0 = r16
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r16 = r0
            r17 = 0
            java.lang.String r18 = r8.getMessage()
            r16[r17] = r18
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r15, r16)
            if (r9 == 0) goto L_0x01c2
            r9.delete()
        L_0x01c2:
            r15 = 0
            goto L_0x0047
        L_0x01c5:
            r15 = move-exception
            goto L_0x0160
        L_0x01c7:
            r7 = move-exception
            goto L_0x0107
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.AdCache.downloadComponent(java.lang.String, java.lang.String, java.io.File):boolean");
    }

    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r11v10, resolved type: java.lang.Object} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v0, resolved type: com.millennialmedia.android.CachedAd} */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Removed duplicated region for block: B:21:0x0052 A[SYNTHETIC, Splitter:B:21:0x0052] */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0070 A[SYNTHETIC, Splitter:B:29:0x0070] */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x0079 A[SYNTHETIC, Splitter:B:34:0x0079] */
    /* JADX WARNING: Removed duplicated region for block: B:48:? A[RETURN, SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:49:? A[RETURN, SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static com.millennialmedia.android.CachedAd load(android.content.Context r14, java.lang.String r15) {
        /*
            r11 = 0
            r12 = 1
            if (r15 != 0) goto L_0x0006
            r1 = r11
        L_0x0005:
            return r1
        L_0x0006:
            r2 = 0
            r9 = 0
            r1 = 0
            boolean[] r8 = new boolean[r12]
            java.io.File r2 = getCachedAdFile(r14, r15, r8)
            if (r2 != 0) goto L_0x0013
            r1 = r11
            goto L_0x0005
        L_0x0013:
            java.io.ObjectInputStream r10 = new java.io.ObjectInputStream     // Catch:{ FileNotFoundException -> 0x0044, Exception -> 0x0058 }
            java.io.FileInputStream r11 = new java.io.FileInputStream     // Catch:{ FileNotFoundException -> 0x0044, Exception -> 0x0058 }
            r11.<init>(r2)     // Catch:{ FileNotFoundException -> 0x0044, Exception -> 0x0058 }
            r10.<init>(r11)     // Catch:{ FileNotFoundException -> 0x0044, Exception -> 0x0058 }
            r10.readInt()     // Catch:{ FileNotFoundException -> 0x0085, Exception -> 0x0082, all -> 0x007f }
            java.lang.Object r6 = r10.readObject()     // Catch:{ FileNotFoundException -> 0x0085, Exception -> 0x0082, all -> 0x007f }
            java.util.Date r6 = (java.util.Date) r6     // Catch:{ FileNotFoundException -> 0x0085, Exception -> 0x0082, all -> 0x007f }
            r10.readObject()     // Catch:{ FileNotFoundException -> 0x0085, Exception -> 0x0082, all -> 0x007f }
            long r3 = r10.readLong()     // Catch:{ FileNotFoundException -> 0x0085, Exception -> 0x0082, all -> 0x007f }
            java.lang.Object r11 = r10.readObject()     // Catch:{ FileNotFoundException -> 0x0085, Exception -> 0x0082, all -> 0x007f }
            r0 = r11
            com.millennialmedia.android.CachedAd r0 = (com.millennialmedia.android.CachedAd) r0     // Catch:{ FileNotFoundException -> 0x0085, Exception -> 0x0082, all -> 0x007f }
            r1 = r0
            r11 = 0
            boolean r11 = r8[r11]     // Catch:{ FileNotFoundException -> 0x0085, Exception -> 0x0082, all -> 0x007f }
            r1.storedOnSdCard = r11     // Catch:{ FileNotFoundException -> 0x0085, Exception -> 0x0082, all -> 0x007f }
            if (r10 == 0) goto L_0x003f
            r10.close()     // Catch:{ IOException -> 0x0041 }
        L_0x003f:
            r9 = r10
            goto L_0x0005
        L_0x0041:
            r11 = move-exception
            r9 = r10
            goto L_0x0005
        L_0x0044:
            r7 = move-exception
        L_0x0045:
            java.lang.String r11 = "There was a problem loading up the cached ad %s. Ad is not on disk."
            r12 = 1
            java.lang.Object[] r12 = new java.lang.Object[r12]     // Catch:{ all -> 0x0076 }
            r13 = 0
            r12[r13] = r15     // Catch:{ all -> 0x0076 }
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r11, r12)     // Catch:{ all -> 0x0076 }
            if (r9 == 0) goto L_0x0005
            r9.close()     // Catch:{ IOException -> 0x0056 }
            goto L_0x0005
        L_0x0056:
            r11 = move-exception
            goto L_0x0005
        L_0x0058:
            r5 = move-exception
        L_0x0059:
            java.lang.String r11 = "There was a problem loading up the cached ad %s."
            r12 = 1
            java.lang.Object[] r12 = new java.lang.Object[r12]     // Catch:{ all -> 0x0076 }
            r13 = 0
            r12[r13] = r15     // Catch:{ all -> 0x0076 }
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r11, r12)     // Catch:{ all -> 0x0076 }
            java.lang.String r11 = r5.getMessage()     // Catch:{ all -> 0x0076 }
            com.millennialmedia.android.MMAdViewSDK.Log.m4416d((java.lang.String) r11)     // Catch:{ all -> 0x0076 }
            com.millennialmedia.android.MMAdViewSDK.Log.m4418d((java.lang.Throwable) r5)     // Catch:{ all -> 0x0076 }
            if (r9 == 0) goto L_0x0005
            r9.close()     // Catch:{ IOException -> 0x0074 }
            goto L_0x0005
        L_0x0074:
            r11 = move-exception
            goto L_0x0005
        L_0x0076:
            r11 = move-exception
        L_0x0077:
            if (r9 == 0) goto L_0x007c
            r9.close()     // Catch:{ IOException -> 0x007d }
        L_0x007c:
            throw r11
        L_0x007d:
            r12 = move-exception
            goto L_0x007c
        L_0x007f:
            r11 = move-exception
            r9 = r10
            goto L_0x0077
        L_0x0082:
            r5 = move-exception
            r9 = r10
            goto L_0x0059
        L_0x0085:
            r7 = move-exception
            r9 = r10
            goto L_0x0045
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.AdCache.load(android.content.Context, java.lang.String):com.millennialmedia.android.CachedAd");
    }

    /* JADX WARNING: Removed duplicated region for block: B:34:0x00b5 A[Catch:{ IOException -> 0x00ba }] */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00c3 A[Catch:{ IOException -> 0x00cc }] */
    /* JADX WARNING: Removed duplicated region for block: B:58:? A[RETURN, SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static boolean save(android.content.Context r12, com.millennialmedia.android.CachedAd r13) {
        /*
            r8 = 1
            r7 = 0
            r0 = 0
            r3 = 0
            r5 = 0
            boolean[] r2 = new boolean[r8]
            if (r13 != 0) goto L_0x000a
        L_0x0009:
            return r7
        L_0x000a:
            java.lang.String r9 = r13.f3958id
            java.io.File r0 = getCachedAdFile(r12, r9, r2)
            if (r0 == 0) goto L_0x0009
            java.lang.String r9 = "Saving CachedAd %s to %s"
            r10 = 2
            java.lang.Object[] r10 = new java.lang.Object[r10]
            java.lang.String r11 = r13.f3958id
            r10[r7] = r11
            r10[r8] = r0
            com.millennialmedia.android.MMAdViewSDK.Log.m4429v(r9, r10)
            java.io.File r4 = new java.io.File     // Catch:{ Exception -> 0x0098 }
            java.lang.String r9 = r0.getParent()     // Catch:{ Exception -> 0x0098 }
            java.lang.StringBuilder r10 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x0098 }
            r10.<init>()     // Catch:{ Exception -> 0x0098 }
            java.lang.String r11 = r13.f3958id     // Catch:{ Exception -> 0x0098 }
            java.lang.StringBuilder r10 = r10.append(r11)     // Catch:{ Exception -> 0x0098 }
            java.lang.String r11 = "ad.lock"
            java.lang.StringBuilder r10 = r10.append(r11)     // Catch:{ Exception -> 0x0098 }
            java.lang.String r10 = r10.toString()     // Catch:{ Exception -> 0x0098 }
            r4.<init>(r9, r10)     // Catch:{ Exception -> 0x0098 }
            boolean r9 = r4.createNewFile()     // Catch:{ Exception -> 0x00d5, all -> 0x00ce }
            if (r9 != 0) goto L_0x005b
            java.lang.String r8 = "Could not save the cached ad %s. Ad was locked."
            r9 = 1
            java.lang.Object[] r9 = new java.lang.Object[r9]     // Catch:{ Exception -> 0x00d5, all -> 0x00ce }
            r10 = 0
            java.lang.String r11 = r13.f3958id     // Catch:{ Exception -> 0x00d5, all -> 0x00ce }
            r9[r10] = r11     // Catch:{ Exception -> 0x00d5, all -> 0x00ce }
            com.millennialmedia.android.MMAdViewSDK.Log.m4429v(r8, r9)     // Catch:{ Exception -> 0x00d5, all -> 0x00ce }
            r4.delete()     // Catch:{ IOException -> 0x00de }
            if (r5 == 0) goto L_0x0059
            r5.close()     // Catch:{ IOException -> 0x00de }
        L_0x0059:
            r3 = r4
            goto L_0x0009
        L_0x005b:
            java.io.ObjectOutputStream r6 = new java.io.ObjectOutputStream     // Catch:{ Exception -> 0x00d5, all -> 0x00ce }
            java.io.FileOutputStream r9 = new java.io.FileOutputStream     // Catch:{ Exception -> 0x00d5, all -> 0x00ce }
            r9.<init>(r0)     // Catch:{ Exception -> 0x00d5, all -> 0x00ce }
            r6.<init>(r9)     // Catch:{ Exception -> 0x00d5, all -> 0x00ce }
            int r9 = r13.getType()     // Catch:{ Exception -> 0x00d8, all -> 0x00d1 }
            r6.writeInt(r9)     // Catch:{ Exception -> 0x00d8, all -> 0x00d1 }
            java.util.Date r9 = r13.expiration     // Catch:{ Exception -> 0x00d8, all -> 0x00d1 }
            r6.writeObject(r9)     // Catch:{ Exception -> 0x00d8, all -> 0x00d1 }
            java.lang.String r9 = r13.acid     // Catch:{ Exception -> 0x00d8, all -> 0x00d1 }
            r6.writeObject(r9)     // Catch:{ Exception -> 0x00d8, all -> 0x00d1 }
            long r9 = r13.deferredViewStart     // Catch:{ Exception -> 0x00d8, all -> 0x00d1 }
            r6.writeLong(r9)     // Catch:{ Exception -> 0x00d8, all -> 0x00d1 }
            r6.writeObject(r13)     // Catch:{ Exception -> 0x00d8, all -> 0x00d1 }
            r9 = 0
            boolean r9 = r2[r9]     // Catch:{ Exception -> 0x00d8, all -> 0x00d1 }
            r13.storedOnSdCard = r9     // Catch:{ Exception -> 0x00d8, all -> 0x00d1 }
            r4.delete()     // Catch:{ IOException -> 0x00dc }
            if (r6 == 0) goto L_0x008b
            r6.close()     // Catch:{ IOException -> 0x00dc }
        L_0x008b:
            boolean r9 = r13.saveAssets(r12)
            if (r9 != 0) goto L_0x00c7
            r13.delete(r12)
            r5 = r6
            r3 = r4
            goto L_0x0009
        L_0x0098:
            r1 = move-exception
        L_0x0099:
            java.lang.String r8 = "There was a problem saving the cached ad %s."
            r9 = 1
            java.lang.Object[] r9 = new java.lang.Object[r9]     // Catch:{ all -> 0x00bd }
            r10 = 0
            java.lang.String r11 = r13.f3958id     // Catch:{ all -> 0x00bd }
            r9[r10] = r11     // Catch:{ all -> 0x00bd }
            com.millennialmedia.android.MMAdViewSDK.Log.m4420e(r8, r9)     // Catch:{ all -> 0x00bd }
            java.lang.String r8 = r1.getMessage()     // Catch:{ all -> 0x00bd }
            com.millennialmedia.android.MMAdViewSDK.Log.m4416d((java.lang.String) r8)     // Catch:{ all -> 0x00bd }
            com.millennialmedia.android.MMAdViewSDK.Log.m4418d((java.lang.Throwable) r1)     // Catch:{ all -> 0x00bd }
            r3.delete()     // Catch:{ IOException -> 0x00ba }
            if (r5 == 0) goto L_0x0009
            r5.close()     // Catch:{ IOException -> 0x00ba }
            goto L_0x0009
        L_0x00ba:
            r8 = move-exception
            goto L_0x0009
        L_0x00bd:
            r7 = move-exception
        L_0x00be:
            r3.delete()     // Catch:{ IOException -> 0x00cc }
            if (r5 == 0) goto L_0x00c6
            r5.close()     // Catch:{ IOException -> 0x00cc }
        L_0x00c6:
            throw r7
        L_0x00c7:
            r5 = r6
            r3 = r4
            r7 = r8
            goto L_0x0009
        L_0x00cc:
            r8 = move-exception
            goto L_0x00c6
        L_0x00ce:
            r7 = move-exception
            r3 = r4
            goto L_0x00be
        L_0x00d1:
            r7 = move-exception
            r5 = r6
            r3 = r4
            goto L_0x00be
        L_0x00d5:
            r1 = move-exception
            r3 = r4
            goto L_0x0099
        L_0x00d8:
            r1 = move-exception
            r5 = r6
            r3 = r4
            goto L_0x0099
        L_0x00dc:
            r9 = move-exception
            goto L_0x008b
        L_0x00de:
            r8 = move-exception
            goto L_0x0059
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.AdCache.save(android.content.Context, com.millennialmedia.android.CachedAd):boolean");
    }
}
