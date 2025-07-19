package com.millennialmedia.android;

import android.content.Context;
import android.os.StatFs;
import android.webkit.MimeTypeMap;
import java.io.File;
import java.util.HashMap;
import org.json.JSONArray;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class MMFileManager extends MMJSObject {
    static final String CREATIVE_CACHE_DIR = "creativecache";
    private boolean isInitialized;
    private File root;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:6:0x0037 -> B:2:0x0035). Please submit an issue!!! */
    public static File getCreativeCacheDirectory(Context context) {
        if (context != null) {
            try {
                File cacheDir = AdCache.getCacheDirectory(context);
                if (cacheDir != null) {
                    File creativeCacheDir = new File(cacheDir, CREATIVE_CACHE_DIR + File.separator);
                    if (!creativeCacheDir.exists()) {
                        if (creativeCacheDir.mkdirs()) {
                            return creativeCacheDir;
                        }
                    } else if (creativeCacheDir.isDirectory()) {
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
        if (!this.isInitialized && (context = this.contextRef.get()) != null) {
            File creativeCacheDirectory = getCreativeCacheDirectory(context);
            this.root = creativeCacheDirectory;
            if (creativeCacheDirectory != null) {
                this.isInitialized = true;
            }
        }
        return this.isInitialized;
    }

    public MMJSResponse getFreeDiskSpace(HashMap<String, String> arguments) {
        if (initialize()) {
            MMJSResponse response = new MMJSResponse();
            response.result = 1;
            StatFs stat = new StatFs(this.root.getAbsolutePath());
            response.response = new Long(stat.getAvailableBlocks() * stat.getBlockSize());
            return response;
        }
        return null;
    }

    public MMJSResponse getDirectoryContents(HashMap<String, String> arguments) {
        File dir;
        if (initialize()) {
            if (arguments.containsKey("path")) {
                dir = new File(this.root, arguments.get("path"));
            } else {
                dir = this.root;
            }
            JSONArray jsonArray = new JSONArray();
            String[] files = dir.list();
            for (String file : files) {
                jsonArray.put(file);
            }
            MMJSResponse response = new MMJSResponse();
            response.result = 1;
            response.response = jsonArray;
            return response;
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0036  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.millennialmedia.android.MMJSResponse getFileContents(java.util.HashMap<java.lang.String, java.lang.String> r9) {
        /*
            r8 = this;
            boolean r6 = r8.initialize()
            if (r6 == 0) goto L55
            r3 = 0
            r0 = 0
            java.lang.String r6 = "path"
            boolean r6 = r9.containsKey(r6)
            if (r6 == 0) goto L55
            java.io.File r2 = new java.io.File     // Catch: java.lang.Exception -> L44 java.lang.Throwable -> L4e
            java.io.File r7 = r8.root     // Catch: java.lang.Exception -> L44 java.lang.Throwable -> L4e
            java.lang.String r6 = "path"
            java.lang.Object r6 = r9.get(r6)     // Catch: java.lang.Exception -> L44 java.lang.Throwable -> L4e
            java.lang.String r6 = (java.lang.String) r6     // Catch: java.lang.Exception -> L44 java.lang.Throwable -> L4e
            r2.<init>(r7, r6)     // Catch: java.lang.Exception -> L44 java.lang.Throwable -> L4e
            java.io.FileInputStream r4 = new java.io.FileInputStream     // Catch: java.lang.Exception -> L44 java.lang.Throwable -> L4e
            r4.<init>(r2)     // Catch: java.lang.Exception -> L44 java.lang.Throwable -> L4e
            long r6 = r2.length()     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5c
            int r6 = (int) r6     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5c
            byte[] r0 = new byte[r6]     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5c
            r4.read(r0)     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5c
            if (r4 == 0) goto L33
            r4.close()     // Catch: java.lang.Exception -> L41
        L33:
            r3 = r4
        L34:
            if (r0 == 0) goto L55
            com.millennialmedia.android.MMJSResponse r5 = new com.millennialmedia.android.MMJSResponse
            r5.<init>()
            r6 = 1
            r5.result = r6
            r5.dataResponse = r0
        L40:
            return r5
        L41:
            r6 = move-exception
            r3 = r4
            goto L34
        L44:
            r1 = move-exception
        L45:
            r0 = 0
            if (r3 == 0) goto L34
            r3.close()     // Catch: java.lang.Exception -> L4c
            goto L34
        L4c:
            r6 = move-exception
            goto L34
        L4e:
            r6 = move-exception
        L4f:
            if (r3 == 0) goto L54
            r3.close()     // Catch: java.lang.Exception -> L57
        L54:
            throw r6
        L55:
            r5 = 0
            goto L40
        L57:
            r7 = move-exception
            goto L54
        L59:
            r6 = move-exception
            r3 = r4
            goto L4f
        L5c:
            r1 = move-exception
            r3 = r4
            goto L45
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMFileManager.getFileContents(java.util.HashMap):com.millennialmedia.android.MMJSResponse");
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0045  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.millennialmedia.android.MMJSResponse writeData(java.util.HashMap<java.lang.String, java.lang.String> r8) {
        /*
            r7 = this;
            boolean r5 = r7.initialize()
            if (r5 == 0) goto L5d
            r2 = 0
            r0 = 0
            r4 = 0
            java.lang.String r5 = "path"
            boolean r5 = r8.containsKey(r5)
            if (r5 == 0) goto L5d
            java.lang.String r5 = "data"
            boolean r5 = r8.containsKey(r5)
            if (r5 == 0) goto L5d
            java.io.File r1 = new java.io.File     // Catch: java.lang.Exception -> L4d java.lang.Throwable -> L56
            java.io.File r6 = r7.root     // Catch: java.lang.Exception -> L4d java.lang.Throwable -> L56
            java.lang.String r5 = "path"
            java.lang.Object r5 = r8.get(r5)     // Catch: java.lang.Exception -> L4d java.lang.Throwable -> L56
            java.lang.String r5 = (java.lang.String) r5     // Catch: java.lang.Exception -> L4d java.lang.Throwable -> L56
            r1.<init>(r6, r5)     // Catch: java.lang.Exception -> L4d java.lang.Throwable -> L56
            java.lang.String r5 = "data"
            java.lang.Object r5 = r8.get(r5)     // Catch: java.lang.Exception -> L4d java.lang.Throwable -> L56
            java.lang.String r5 = (java.lang.String) r5     // Catch: java.lang.Exception -> L4d java.lang.Throwable -> L56
            byte[] r0 = com.millennialmedia.android.Base64.decode(r5)     // Catch: java.lang.Exception -> L4d java.lang.Throwable -> L56
            java.io.FileOutputStream r3 = new java.io.FileOutputStream     // Catch: java.lang.Exception -> L4d java.lang.Throwable -> L56
            r3.<init>(r1)     // Catch: java.lang.Exception -> L4d java.lang.Throwable -> L56
            r3.write(r0)     // Catch: java.lang.Throwable -> L61 java.lang.Exception -> L64
            r4 = 1
            if (r3 == 0) goto L42
            r3.close()     // Catch: java.lang.Exception -> L4a
        L42:
            r2 = r3
        L43:
            if (r4 == 0) goto L5d
            com.millennialmedia.android.MMJSResponse r5 = com.millennialmedia.android.MMJSResponse.responseWithSuccess()
        L49:
            return r5
        L4a:
            r5 = move-exception
            r2 = r3
            goto L43
        L4d:
            r5 = move-exception
        L4e:
            if (r2 == 0) goto L43
            r2.close()     // Catch: java.lang.Exception -> L54
            goto L43
        L54:
            r5 = move-exception
            goto L43
        L56:
            r5 = move-exception
        L57:
            if (r2 == 0) goto L5c
            r2.close()     // Catch: java.lang.Exception -> L5f
        L5c:
            throw r5
        L5d:
            r5 = 0
            goto L49
        L5f:
            r6 = move-exception
            goto L5c
        L61:
            r5 = move-exception
            r2 = r3
            goto L57
        L64:
            r5 = move-exception
            r2 = r3
            goto L4e
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMFileManager.writeData(java.util.HashMap):com.millennialmedia.android.MMJSResponse");
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x006f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.millennialmedia.android.MMJSResponse downloadFile(java.util.HashMap<java.lang.String, java.lang.String> r14) {
        /*
            r13 = this;
            boolean r11 = r13.initialize()
            if (r11 == 0) goto Lab
            r5 = 0
            r3 = 0
            r1 = 0
            r8 = 0
            r10 = 0
            java.lang.String r11 = "url"
            boolean r11 = r14.containsKey(r11)
            if (r11 == 0) goto Lab
            java.net.URL r9 = new java.net.URL     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            java.lang.String r11 = "url"
            java.lang.Object r11 = r14.get(r11)     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            java.lang.String r11 = (java.lang.String) r11     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            r9.<init>(r11)     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            java.net.URLConnection r11 = r9.openConnection()     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            r0 = r11
            java.net.HttpURLConnection r0 = (java.net.HttpURLConnection) r0     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            r10 = r0
            r11 = 30000(0x7530, float:4.2039E-41)
            r10.setConnectTimeout(r11)     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            java.io.InputStream r5 = r10.getInputStream()     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            r11 = 4096(0x1000, float:5.74E-42)
            byte[] r1 = new byte[r11]     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            java.lang.String r11 = "path"
            boolean r11 = r14.containsKey(r11)     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            if (r11 == 0) goto L74
            java.lang.String r11 = "path"
            java.lang.Object r6 = r14.get(r11)     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            java.lang.String r6 = (java.lang.String) r6     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
        L45:
            java.io.File r2 = new java.io.File     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            java.io.File r11 = r13.root     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            r2.<init>(r11, r6)     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            java.io.FileOutputStream r4 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            r4.<init>(r2)     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
        L51:
            int r7 = r5.read(r1)     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> Laf
            if (r7 <= 0) goto L85
            r11 = 0
            r4.write(r1, r11, r7)     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> Laf
            goto L51
        L5c:
            r11 = move-exception
            r3 = r4
        L5e:
            if (r10 == 0) goto L63
            r10.disconnect()
        L63:
            if (r5 == 0) goto L68
            r5.close()     // Catch: java.lang.Exception -> Lb2
        L68:
            if (r3 == 0) goto L6d
            r3.close()     // Catch: java.lang.Exception -> Lb2
        L6d:
            if (r8 == 0) goto Lab
            com.millennialmedia.android.MMJSResponse r11 = com.millennialmedia.android.MMJSResponse.responseWithSuccess()
        L73:
            return r11
        L74:
            java.lang.String r11 = "url"
            java.lang.Object r11 = r14.get(r11)     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            java.lang.String r11 = (java.lang.String) r11     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            android.net.Uri r11 = android.net.Uri.parse(r11)     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            java.lang.String r6 = r11.getLastPathSegment()     // Catch: java.lang.Throwable -> L9a java.lang.Exception -> Lb4
            goto L45
        L85:
            r8 = 1
            if (r10 == 0) goto L8b
            r10.disconnect()
        L8b:
            if (r5 == 0) goto L90
            r5.close()     // Catch: java.lang.Exception -> L97
        L90:
            if (r4 == 0) goto L95
            r4.close()     // Catch: java.lang.Exception -> L97
        L95:
            r3 = r4
            goto L6d
        L97:
            r11 = move-exception
            r3 = r4
            goto L6d
        L9a:
            r11 = move-exception
        L9b:
            if (r10 == 0) goto La0
            r10.disconnect()
        La0:
            if (r5 == 0) goto La5
            r5.close()     // Catch: java.lang.Exception -> Lad
        La5:
            if (r3 == 0) goto Laa
            r3.close()     // Catch: java.lang.Exception -> Lad
        Laa:
            throw r11
        Lab:
            r11 = 0
            goto L73
        Lad:
            r12 = move-exception
            goto Laa
        Laf:
            r11 = move-exception
            r3 = r4
            goto L9b
        Lb2:
            r11 = move-exception
            goto L6d
        Lb4:
            r11 = move-exception
            goto L5e
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMFileManager.downloadFile(java.util.HashMap):com.millennialmedia.android.MMJSResponse");
    }

    public MMJSResponse moveFile(HashMap<String, String> arguments) {
        if (initialize()) {
            try {
                String fromPath = arguments.get("fromPath");
                String toPath = arguments.get("toPath");
                if (fromPath != null && toPath != null) {
                    File fromFile = new File(this.root, fromPath);
                    File toFile = new File(this.root, toPath);
                    if (fromFile.renameTo(toFile)) {
                        return MMJSResponse.responseWithSuccess();
                    }
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
                if (path != null) {
                    File file = new File(this.root, path);
                    if (file.delete()) {
                        return MMJSResponse.responseWithSuccess();
                    }
                }
            } catch (Exception e) {
            }
        }
        return null;
    }

    public MMJSResponse getMimeType(HashMap<String, String> arguments) {
        if (initialize()) {
            String path = arguments.get("path");
            String[] components = path.split("\\.");
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
        if (initialize()) {
            if (arguments.containsKey("clear")) {
                clear = Boolean.parseBoolean(arguments.get("clear"));
            }
            if (clear) {
                timeout = 0;
            } else {
                Context context = this.contextRef.get();
                if (context != null) {
                    HandShake handShake = HandShake.sharedHandShake(context);
                    timeout = handShake.creativeCacheTimeout;
                }
            }
            try {
                cleanupDirectory(this.root, timeout);
                return null;
            } catch (SecurityException e) {
                return null;
            }
        }
        return null;
    }

    private static void cleanupDirectory(File file, long timeout) throws SecurityException {
        File[] entries = file.listFiles();
        for (File entry : entries) {
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

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void cleanupCache(Context context, boolean clear) {
        long timeout;
        try {
            File cacheDir = AdCache.getCacheDirectory(context);
            if (cacheDir != null) {
                File root = new File(cacheDir, CREATIVE_CACHE_DIR);
                if (root.exists() && root.isDirectory()) {
                    if (clear) {
                        timeout = 0;
                    } else {
                        try {
                            HandShake handShake = HandShake.sharedHandShake(context);
                            timeout = handShake.creativeCacheTimeout;
                        } catch (SecurityException e) {
                            return;
                        }
                    }
                    cleanupDirectory(root, timeout);
                }
            }
        } catch (Exception e2) {
        }
    }
}
