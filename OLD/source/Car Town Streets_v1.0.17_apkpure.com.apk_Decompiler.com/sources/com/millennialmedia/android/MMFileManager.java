package com.millennialmedia.android;

import android.content.Context;
import android.os.StatFs;
import android.webkit.MimeTypeMap;
import java.io.File;
import java.util.HashMap;
import org.json.JSONArray;

class MMFileManager extends MMJSObject {
    static final String CREATIVE_CACHE_DIR = "creativecache";
    private boolean isInitialized;
    private File root;

    MMFileManager() {
    }

    static File getCreativeCacheDirectory(Context context) {
        if (context != null) {
            try {
                File cacheDir = AdCache.getCacheDirectory(context);
                if (cacheDir != null) {
                    File creativeCacheDir = new File(cacheDir, CREATIVE_CACHE_DIR + File.separator);
                    if (!creativeCacheDir.exists()) {
                        if (creativeCacheDir.mkdirs()) {
                            return creativeCacheDir;
                        }
                    } else if (!creativeCacheDir.isDirectory()) {
                        return null;
                    } else {
                        return creativeCacheDir;
                    }
                }
            } catch (Exception e) {
            }
        }
        return null;
    }

    private boolean initialize() {
        Context context;
        if (!this.isInitialized && (context = (Context) this.contextRef.get()) != null) {
            File creativeCacheDirectory = getCreativeCacheDirectory(context);
            this.root = creativeCacheDirectory;
            if (creativeCacheDirectory != null) {
                this.isInitialized = true;
            }
        }
        return this.isInitialized;
    }

    public MMJSResponse getFreeDiskSpace(HashMap<String, String> hashMap) {
        if (!initialize()) {
            return null;
        }
        MMJSResponse response = new MMJSResponse();
        response.result = 1;
        StatFs stat = new StatFs(this.root.getAbsolutePath());
        response.response = new Long(((long) stat.getAvailableBlocks()) * ((long) stat.getBlockSize()));
        return response;
    }

    public MMJSResponse getDirectoryContents(HashMap<String, String> arguments) {
        File dir;
        if (!initialize()) {
            return null;
        }
        if (arguments.containsKey("path")) {
            dir = new File(this.root, arguments.get("path"));
        } else {
            dir = this.root;
        }
        JSONArray jsonArray = new JSONArray();
        for (String file : dir.list()) {
            jsonArray.put(file);
        }
        MMJSResponse response = new MMJSResponse();
        response.result = 1;
        response.response = jsonArray;
        return response;
    }

    /* JADX WARNING: Removed duplicated region for block: B:13:0x0036  */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x0048 A[SYNTHETIC, Splitter:B:19:0x0048] */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0051 A[SYNTHETIC, Splitter:B:24:0x0051] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.millennialmedia.android.MMJSResponse getFileContents(java.util.HashMap<java.lang.String, java.lang.String> r9) {
        /*
            r8 = this;
            boolean r6 = r8.initialize()
            if (r6 == 0) goto L_0x0055
            r3 = 0
            r0 = 0
            java.lang.String r6 = "path"
            boolean r6 = r9.containsKey(r6)
            if (r6 == 0) goto L_0x0055
            java.io.File r2 = new java.io.File     // Catch:{ Exception -> 0x0044, all -> 0x004e }
            java.io.File r7 = r8.root     // Catch:{ Exception -> 0x0044, all -> 0x004e }
            java.lang.String r6 = "path"
            java.lang.Object r6 = r9.get(r6)     // Catch:{ Exception -> 0x0044, all -> 0x004e }
            java.lang.String r6 = (java.lang.String) r6     // Catch:{ Exception -> 0x0044, all -> 0x004e }
            r2.<init>(r7, r6)     // Catch:{ Exception -> 0x0044, all -> 0x004e }
            java.io.FileInputStream r4 = new java.io.FileInputStream     // Catch:{ Exception -> 0x0044, all -> 0x004e }
            r4.<init>(r2)     // Catch:{ Exception -> 0x0044, all -> 0x004e }
            long r6 = r2.length()     // Catch:{ Exception -> 0x005c, all -> 0x0059 }
            int r6 = (int) r6     // Catch:{ Exception -> 0x005c, all -> 0x0059 }
            byte[] r0 = new byte[r6]     // Catch:{ Exception -> 0x005c, all -> 0x0059 }
            r4.read(r0)     // Catch:{ Exception -> 0x005c, all -> 0x0059 }
            if (r4 == 0) goto L_0x0033
            r4.close()     // Catch:{ Exception -> 0x0041 }
        L_0x0033:
            r3 = r4
        L_0x0034:
            if (r0 == 0) goto L_0x0055
            com.millennialmedia.android.MMJSResponse r5 = new com.millennialmedia.android.MMJSResponse
            r5.<init>()
            r6 = 1
            r5.result = r6
            r5.dataResponse = r0
        L_0x0040:
            return r5
        L_0x0041:
            r6 = move-exception
            r3 = r4
            goto L_0x0034
        L_0x0044:
            r1 = move-exception
        L_0x0045:
            r0 = 0
            if (r3 == 0) goto L_0x0034
            r3.close()     // Catch:{ Exception -> 0x004c }
            goto L_0x0034
        L_0x004c:
            r6 = move-exception
            goto L_0x0034
        L_0x004e:
            r6 = move-exception
        L_0x004f:
            if (r3 == 0) goto L_0x0054
            r3.close()     // Catch:{ Exception -> 0x0057 }
        L_0x0054:
            throw r6
        L_0x0055:
            r5 = 0
            goto L_0x0040
        L_0x0057:
            r7 = move-exception
            goto L_0x0054
        L_0x0059:
            r6 = move-exception
            r3 = r4
            goto L_0x004f
        L_0x005c:
            r1 = move-exception
            r3 = r4
            goto L_0x0045
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMFileManager.getFileContents(java.util.HashMap):com.millennialmedia.android.MMJSResponse");
    }

    /* JADX WARNING: Removed duplicated region for block: B:16:0x0045  */
    /* JADX WARNING: Removed duplicated region for block: B:21:0x0050 A[SYNTHETIC, Splitter:B:21:0x0050] */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0059 A[SYNTHETIC, Splitter:B:26:0x0059] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.millennialmedia.android.MMJSResponse writeData(java.util.HashMap<java.lang.String, java.lang.String> r8) {
        /*
            r7 = this;
            boolean r5 = r7.initialize()
            if (r5 == 0) goto L_0x005d
            r2 = 0
            r0 = 0
            r4 = 0
            java.lang.String r5 = "path"
            boolean r5 = r8.containsKey(r5)
            if (r5 == 0) goto L_0x005d
            java.lang.String r5 = "data"
            boolean r5 = r8.containsKey(r5)
            if (r5 == 0) goto L_0x005d
            java.io.File r1 = new java.io.File     // Catch:{ Exception -> 0x004d, all -> 0x0056 }
            java.io.File r6 = r7.root     // Catch:{ Exception -> 0x004d, all -> 0x0056 }
            java.lang.String r5 = "path"
            java.lang.Object r5 = r8.get(r5)     // Catch:{ Exception -> 0x004d, all -> 0x0056 }
            java.lang.String r5 = (java.lang.String) r5     // Catch:{ Exception -> 0x004d, all -> 0x0056 }
            r1.<init>(r6, r5)     // Catch:{ Exception -> 0x004d, all -> 0x0056 }
            java.lang.String r5 = "data"
            java.lang.Object r5 = r8.get(r5)     // Catch:{ Exception -> 0x004d, all -> 0x0056 }
            java.lang.String r5 = (java.lang.String) r5     // Catch:{ Exception -> 0x004d, all -> 0x0056 }
            byte[] r0 = com.millennialmedia.android.Base64.decode((java.lang.String) r5)     // Catch:{ Exception -> 0x004d, all -> 0x0056 }
            java.io.FileOutputStream r3 = new java.io.FileOutputStream     // Catch:{ Exception -> 0x004d, all -> 0x0056 }
            r3.<init>(r1)     // Catch:{ Exception -> 0x004d, all -> 0x0056 }
            r3.write(r0)     // Catch:{ Exception -> 0x0064, all -> 0x0061 }
            r4 = 1
            if (r3 == 0) goto L_0x0042
            r3.close()     // Catch:{ Exception -> 0x004a }
        L_0x0042:
            r2 = r3
        L_0x0043:
            if (r4 == 0) goto L_0x005d
            com.millennialmedia.android.MMJSResponse r5 = com.millennialmedia.android.MMJSResponse.responseWithSuccess()
        L_0x0049:
            return r5
        L_0x004a:
            r5 = move-exception
            r2 = r3
            goto L_0x0043
        L_0x004d:
            r5 = move-exception
        L_0x004e:
            if (r2 == 0) goto L_0x0043
            r2.close()     // Catch:{ Exception -> 0x0054 }
            goto L_0x0043
        L_0x0054:
            r5 = move-exception
            goto L_0x0043
        L_0x0056:
            r5 = move-exception
        L_0x0057:
            if (r2 == 0) goto L_0x005c
            r2.close()     // Catch:{ Exception -> 0x005f }
        L_0x005c:
            throw r5
        L_0x005d:
            r5 = 0
            goto L_0x0049
        L_0x005f:
            r6 = move-exception
            goto L_0x005c
        L_0x0061:
            r5 = move-exception
            r2 = r3
            goto L_0x0057
        L_0x0064:
            r5 = move-exception
            r2 = r3
            goto L_0x004e
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMFileManager.writeData(java.util.HashMap):com.millennialmedia.android.MMJSResponse");
    }

    /* JADX WARNING: type inference failed for: r11v12, types: [java.net.URLConnection] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x006f  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x009d  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x00a2 A[SYNTHETIC, Splitter:B:42:0x00a2] */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x00a7 A[Catch:{ Exception -> 0x00ad }] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.millennialmedia.android.MMJSResponse downloadFile(java.util.HashMap<java.lang.String, java.lang.String> r14) {
        /*
            r13 = this;
            boolean r11 = r13.initialize()
            if (r11 == 0) goto L_0x00ab
            r5 = 0
            r3 = 0
            r1 = 0
            r8 = 0
            r10 = 0
            java.lang.String r11 = "url"
            boolean r11 = r14.containsKey(r11)
            if (r11 == 0) goto L_0x00ab
            java.net.URL r9 = new java.net.URL     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            java.lang.String r11 = "url"
            java.lang.Object r11 = r14.get(r11)     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            java.lang.String r11 = (java.lang.String) r11     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            r9.<init>(r11)     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            java.net.URLConnection r11 = r9.openConnection()     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            r0 = r11
            java.net.HttpURLConnection r0 = (java.net.HttpURLConnection) r0     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            r10 = r0
            r11 = 30000(0x7530, float:4.2039E-41)
            r10.setConnectTimeout(r11)     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            java.io.InputStream r5 = r10.getInputStream()     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            r11 = 4096(0x1000, float:5.74E-42)
            byte[] r1 = new byte[r11]     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            java.lang.String r11 = "path"
            boolean r11 = r14.containsKey(r11)     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            if (r11 == 0) goto L_0x0074
            java.lang.String r11 = "path"
            java.lang.Object r6 = r14.get(r11)     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            java.lang.String r6 = (java.lang.String) r6     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
        L_0x0045:
            java.io.File r2 = new java.io.File     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            java.io.File r11 = r13.root     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            r2.<init>(r11, r6)     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            java.io.FileOutputStream r4 = new java.io.FileOutputStream     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            r4.<init>(r2)     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
        L_0x0051:
            int r7 = r5.read(r1)     // Catch:{ Exception -> 0x005c, all -> 0x00af }
            if (r7 <= 0) goto L_0x0085
            r11 = 0
            r4.write(r1, r11, r7)     // Catch:{ Exception -> 0x005c, all -> 0x00af }
            goto L_0x0051
        L_0x005c:
            r11 = move-exception
            r3 = r4
        L_0x005e:
            if (r10 == 0) goto L_0x0063
            r10.disconnect()
        L_0x0063:
            if (r5 == 0) goto L_0x0068
            r5.close()     // Catch:{ Exception -> 0x00b2 }
        L_0x0068:
            if (r3 == 0) goto L_0x006d
            r3.close()     // Catch:{ Exception -> 0x00b2 }
        L_0x006d:
            if (r8 == 0) goto L_0x00ab
            com.millennialmedia.android.MMJSResponse r11 = com.millennialmedia.android.MMJSResponse.responseWithSuccess()
        L_0x0073:
            return r11
        L_0x0074:
            java.lang.String r11 = "url"
            java.lang.Object r11 = r14.get(r11)     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            java.lang.String r11 = (java.lang.String) r11     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            android.net.Uri r11 = android.net.Uri.parse(r11)     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            java.lang.String r6 = r11.getLastPathSegment()     // Catch:{ Exception -> 0x00b4, all -> 0x009a }
            goto L_0x0045
        L_0x0085:
            r8 = 1
            if (r10 == 0) goto L_0x008b
            r10.disconnect()
        L_0x008b:
            if (r5 == 0) goto L_0x0090
            r5.close()     // Catch:{ Exception -> 0x0097 }
        L_0x0090:
            if (r4 == 0) goto L_0x0095
            r4.close()     // Catch:{ Exception -> 0x0097 }
        L_0x0095:
            r3 = r4
            goto L_0x006d
        L_0x0097:
            r11 = move-exception
            r3 = r4
            goto L_0x006d
        L_0x009a:
            r11 = move-exception
        L_0x009b:
            if (r10 == 0) goto L_0x00a0
            r10.disconnect()
        L_0x00a0:
            if (r5 == 0) goto L_0x00a5
            r5.close()     // Catch:{ Exception -> 0x00ad }
        L_0x00a5:
            if (r3 == 0) goto L_0x00aa
            r3.close()     // Catch:{ Exception -> 0x00ad }
        L_0x00aa:
            throw r11
        L_0x00ab:
            r11 = 0
            goto L_0x0073
        L_0x00ad:
            r12 = move-exception
            goto L_0x00aa
        L_0x00af:
            r11 = move-exception
            r3 = r4
            goto L_0x009b
        L_0x00b2:
            r11 = move-exception
            goto L_0x006d
        L_0x00b4:
            r11 = move-exception
            goto L_0x005e
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMFileManager.downloadFile(java.util.HashMap):com.millennialmedia.android.MMJSResponse");
    }

    public MMJSResponse moveFile(HashMap<String, String> arguments) {
        if (initialize()) {
            try {
                String fromPath = arguments.get("fromPath");
                String toPath = arguments.get("toPath");
                if (!(fromPath == null || toPath == null || !new File(this.root, fromPath).renameTo(new File(this.root, toPath)))) {
                    return MMJSResponse.responseWithSuccess();
                }
            } catch (Exception e) {
            }
        }
        return null;
    }

    public MMJSResponse removeAtPath(HashMap<String, String> arguments) {
        if (initialize()) {
            try {
                String path = arguments.get("path");
                if (path != null && new File(this.root, path).delete()) {
                    return MMJSResponse.responseWithSuccess();
                }
            } catch (Exception e) {
            }
        }
        return null;
    }

    public MMJSResponse getMimeType(HashMap<String, String> arguments) {
        if (initialize()) {
            String[] components = arguments.get("path").split("\\.");
            String mime = MimeTypeMap.getSingleton().getMimeTypeFromExtension(components[components.length - 1]);
            if (mime != null) {
                MMJSResponse response = new MMJSResponse();
                response.result = 1;
                response.response = mime;
                return response;
            }
        }
        return null;
    }

    public MMJSResponse cleanupCache(HashMap<String, String> arguments) {
        boolean clear = false;
        long timeout = 259200000;
        if (!initialize()) {
            return null;
        }
        if (arguments.containsKey("clear")) {
            clear = Boolean.parseBoolean(arguments.get("clear"));
        }
        if (clear) {
            timeout = 0;
        } else {
            Context context = (Context) this.contextRef.get();
            if (context != null) {
                timeout = HandShake.sharedHandShake(context).creativeCacheTimeout;
            }
        }
        try {
            cleanupDirectory(this.root, timeout);
            return null;
        } catch (SecurityException e) {
            return null;
        }
    }

    private static void cleanupDirectory(File file, long timeout) throws SecurityException {
        for (File entry : file.listFiles()) {
            if (entry.isFile()) {
                if (System.currentTimeMillis() - entry.lastModified() > timeout) {
                    entry.delete();
                }
            } else if (entry.isDirectory()) {
                try {
                    cleanupDirectory(entry, timeout);
                    if (entry.list().length == 0) {
                        entry.delete();
                    }
                } catch (SecurityException e) {
                }
            }
        }
    }

    static void cleanupCache(Context context, boolean clear) {
        long timeout;
        try {
            File cacheDir = AdCache.getCacheDirectory(context);
            if (cacheDir != null) {
                File root2 = new File(cacheDir, CREATIVE_CACHE_DIR);
                if (root2.exists() && root2.isDirectory()) {
                    if (clear) {
                        timeout = 0;
                    } else {
                        timeout = HandShake.sharedHandShake(context).creativeCacheTimeout;
                    }
                    try {
                        cleanupDirectory(root2, timeout);
                    } catch (SecurityException e) {
                    }
                }
            }
        } catch (Exception e2) {
        }
    }
}
