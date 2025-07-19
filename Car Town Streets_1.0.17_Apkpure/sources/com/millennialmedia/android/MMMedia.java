package com.millennialmedia.android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.MediaScannerConnection;
import android.media.SoundPool;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import com.facebook.internal.ServerProtocol;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.plus.PlusShare;
import com.millennialmedia.android.MMAdViewSDK;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.ref.WeakReference;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import org.json.JSONArray;
/* loaded from: classes.dex */
class MMMedia extends MMJSObject {
    private static final String PATH = "path";
    private static final String PICTURES = "Pictures";
    private static Object pickerActivityObject;
    MediaScannerConnection mediaScanner;

    MMMedia() {
    }

    private boolean isCameraAvailable() {
        Context context = this.contextRef.get();
        if (context == null || context.getPackageManager().checkPermission("android.permission.CAMERA", context.getPackageName()) != 0) {
            return false;
        }
        Intent intent = new Intent("android.media.action.IMAGE_CAPTURE");
        List<ResolveInfo> list = context.getPackageManager().queryIntentActivities(intent, 65536);
        return list.size() > 0;
    }

    private boolean isPictureChooserAvailable() {
        Context context = this.contextRef.get();
        if (context != null) {
            Intent intent = new Intent();
            intent.setType("image/*");
            intent.setAction("android.intent.action.GET_CONTENT");
            List<ResolveInfo> list = context.getPackageManager().queryIntentActivities(intent, 65536);
            return list.size() > 0;
        }
        return false;
    }

    public MMJSResponse isSourceTypeAvailable(HashMap<String, String> arguments) {
        String type = arguments.get("sourceType");
        if (type != null) {
            if (type.equalsIgnoreCase("Camera") && isCameraAvailable()) {
                return MMJSResponse.responseWithSuccess();
            }
            if (type.equalsIgnoreCase("Photo Library") && isPictureChooserAvailable()) {
                return MMJSResponse.responseWithSuccess();
            }
        }
        return null;
    }

    public MMJSResponse availableSourceTypes(HashMap<String, String> arguments) {
        JSONArray jsonArray = new JSONArray();
        if (isCameraAvailable()) {
            jsonArray.put("Camera");
        }
        if (isPictureChooserAvailable()) {
            jsonArray.put("Photo Library");
        }
        MMJSResponse response = new MMJSResponse();
        response.result = 1;
        response.response = jsonArray;
        return response;
    }

    /* loaded from: classes.dex */
    static class PickerActivity extends MMBaseActivity {
        private Uri fileUri;

        PickerActivity() {
        }

        @Override // com.millennialmedia.android.MMBaseActivity
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            if (getIntent().getStringExtra(ServerProtocol.DIALOG_PARAM_TYPE).equalsIgnoreCase("Camera")) {
                Intent intent = new Intent("android.media.action.IMAGE_CAPTURE");
                this.fileUri = getIntent().getData();
                intent.putExtra("output", this.fileUri);
                intent.putExtra("return-data", true);
                startActivityForResult(intent, 0);
                return;
            }
            Intent intent2 = new Intent();
            intent2.setType("image/*");
            intent2.setAction("android.intent.action.GET_CONTENT");
            startActivityForResult(intent2, 0);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Removed duplicated region for block: B:58:0x0083 A[EXC_TOP_SPLITTER, SYNTHETIC] */
        @Override // com.millennialmedia.android.MMBaseActivity
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void onActivityResult(int r17, int r18, android.content.Intent r19) {
            /*
                r16 = this;
                if (r19 == 0) goto L7e
                android.content.Intent r0 = r16.getIntent()
                java.lang.String r3 = "type"
                java.lang.String r0 = r0.getStringExtra(r3)
                java.lang.String r3 = "Photo Library"
                boolean r0 = r0.equalsIgnoreCase(r3)
                if (r0 == 0) goto L7e
                r10 = 0
                r14 = 0
                android.net.Uri r1 = r19.getData()
                r0 = 1
                java.lang.String[] r2 = new java.lang.String[r0]
                r0 = 0
                java.lang.String r3 = "_data"
                r2[r0] = r3
                android.content.ContentResolver r0 = r16.getContentResolver()
                r3 = 0
                r4 = 0
                r5 = 0
                android.database.Cursor r8 = r0.query(r1, r2, r3, r4, r5)
                if (r8 == 0) goto L7e
                java.lang.String r0 = "_data"
                int r12 = r8.getColumnIndex(r0)
                r0 = -1
                if (r12 == r0) goto L7e
                r8.moveToFirst()
                java.io.File r7 = new java.io.File
                java.lang.String r0 = r8.getString(r12)
                r7.<init>(r0)
                r8.close()
                java.io.File r9 = new java.io.File     // Catch: java.lang.Throwable -> L9c java.lang.Exception -> Lb6
                android.content.Intent r0 = r16.getIntent()     // Catch: java.lang.Throwable -> L9c java.lang.Exception -> Lb6
                android.net.Uri r0 = r0.getData()     // Catch: java.lang.Throwable -> L9c java.lang.Exception -> Lb6
                java.lang.String r0 = r0.getPath()     // Catch: java.lang.Throwable -> L9c java.lang.Exception -> Lb6
                r9.<init>(r0)     // Catch: java.lang.Throwable -> L9c java.lang.Exception -> Lb6
                java.io.FileInputStream r11 = new java.io.FileInputStream     // Catch: java.lang.Throwable -> L9c java.lang.Exception -> Lb6
                r11.<init>(r7)     // Catch: java.lang.Throwable -> L9c java.lang.Exception -> Lb6
                java.io.FileOutputStream r15 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> Lad java.lang.Exception -> Lb8
                r15.<init>(r9)     // Catch: java.lang.Throwable -> Lad java.lang.Exception -> Lb8
                r0 = 1024(0x400, float:1.435E-42)
                byte[] r6 = new byte[r0]     // Catch: java.lang.Exception -> L71 java.lang.Throwable -> Lb0
            L66:
                int r13 = r11.read(r6)     // Catch: java.lang.Exception -> L71 java.lang.Throwable -> Lb0
                if (r13 <= 0) goto L8f
                r0 = 0
                r15.write(r6, r0, r13)     // Catch: java.lang.Exception -> L71 java.lang.Throwable -> Lb0
                goto L66
            L71:
                r0 = move-exception
                r14 = r15
                r10 = r11
            L74:
                if (r10 == 0) goto L79
                r10.close()     // Catch: java.lang.Exception -> Lb4
            L79:
                if (r14 == 0) goto L7e
                r14.close()     // Catch: java.lang.Exception -> Lb4
            L7e:
                java.lang.Object r3 = com.millennialmedia.android.MMMedia.access$000()
                monitor-enter(r3)
                java.lang.Object r0 = com.millennialmedia.android.MMMedia.access$000()     // Catch: java.lang.Throwable -> La8
                r0.notify()     // Catch: java.lang.Throwable -> La8
                monitor-exit(r3)     // Catch: java.lang.Throwable -> La8
                r16.finish()
                return
            L8f:
                if (r11 == 0) goto L94
                r11.close()     // Catch: java.lang.Exception -> L9a
            L94:
                if (r15 == 0) goto L7e
                r15.close()     // Catch: java.lang.Exception -> L9a
                goto L7e
            L9a:
                r0 = move-exception
                goto L7e
            L9c:
                r0 = move-exception
            L9d:
                if (r10 == 0) goto La2
                r10.close()     // Catch: java.lang.Exception -> Lab
            La2:
                if (r14 == 0) goto La7
                r14.close()     // Catch: java.lang.Exception -> Lab
            La7:
                throw r0
            La8:
                r0 = move-exception
                monitor-exit(r3)     // Catch: java.lang.Throwable -> La8
                throw r0
            Lab:
                r3 = move-exception
                goto La7
            Lad:
                r0 = move-exception
                r10 = r11
                goto L9d
            Lb0:
                r0 = move-exception
                r14 = r15
                r10 = r11
                goto L9d
            Lb4:
                r0 = move-exception
                goto L7e
            Lb6:
                r0 = move-exception
                goto L74
            Lb8:
                r0 = move-exception
                r10 = r11
                goto L74
            */
            throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMMedia.PickerActivity.onActivityResult(int, int, android.content.Intent):void");
        }
    }

    static Bitmap resizeImage(Bitmap image, String contentMode, int toW, int toH, int quality) {
        float horizontalRatio = toW / image.getWidth();
        float verticalRatio = toH / image.getHeight();
        if (contentMode.equals("Center")) {
            return centerOfImage(image, toW, toH);
        }
        if (contentMode.equals("ScaleToAspectFit")) {
            float ratio = Math.min(horizontalRatio, verticalRatio);
            int newW = (int) (image.getWidth() * ratio);
            int newH = (int) (image.getHeight() * ratio);
            return resizeImage(image, newW, newH, quality);
        } else if (contentMode.equals("ScaleToAspectFill")) {
            float ratio2 = Math.max(horizontalRatio, verticalRatio);
            int newW2 = (int) (image.getWidth() * ratio2);
            int newH2 = (int) (image.getHeight() * ratio2);
            return cropImage(resizeImage(image, newW2, newH2, quality), 0, 0, toW, toH);
        } else {
            return resizeImage(image, toW, toH, quality);
        }
    }

    private static Bitmap resizeImage(Bitmap image, int newW, int newH, int quality) {
        return Bitmap.createScaledBitmap(image, newW, newH, true);
    }

    private static Bitmap centerOfImage(Bitmap image, int width, int height) {
        float x = (image.getWidth() - width) / 2;
        float y = (image.getHeight() - height) / 2;
        return cropImage(image, (int) x, (int) y, width, height);
    }

    private static Bitmap cropImage(Bitmap bitmap, int left, int top, int width, int height) {
        return Bitmap.createBitmap(bitmap, left, top, width, height);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0074  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static final byte[] scaleBitmapToBytes(java.io.File r21, int r22, int r23, java.lang.String r24) {
        /*
            Method dump skipped, instructions count: 317
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMMedia.scaleBitmapToBytes(java.io.File, int, int, java.lang.String):byte[]");
    }

    public synchronized MMJSResponse getPicture(HashMap<String, String> arguments) {
        MMJSResponse response;
        Context context = this.contextRef.get();
        String type = arguments.get("sourceType");
        String height = arguments.get("constrainHeight");
        String width = arguments.get("constrainWidth");
        String contentMode = arguments.get("contentMode");
        if (contentMode == null) {
            contentMode = "";
        }
        if (height == null || width == null) {
            response = MMJSResponse.responseWithError("Missing constrainHeight and/or constrainWidth");
        } else {
            int h = Integer.parseInt(height);
            int w = Integer.parseInt(width);
            if (h * w > 360000) {
                response = MMJSResponse.responseWithError("constrainHeight * constrainWidth > 360000");
            } else {
                if (context != null && type != null) {
                    File file = new File(Environment.getExternalStorageDirectory(), "tmp_mm_" + String.valueOf(System.currentTimeMillis()) + ".jpg");
                    if ((type.equalsIgnoreCase("Camera") && isCameraAvailable()) || (type.equalsIgnoreCase("Photo Library") && isPictureChooserAvailable())) {
                        try {
                            pickerActivityObject = new Object();
                            Intent intent = new Intent(context, MMActivity.class);
                            intent.setData(Uri.fromFile(file));
                            intent.putExtra(ServerProtocol.DIALOG_PARAM_TYPE, type);
                            intent.putExtra("class", "com.millennialmedia.android.MMMedia$PickerActivity");
                            if (!(context instanceof Activity)) {
                                intent.addFlags(DriveFile.MODE_READ_ONLY);
                            }
                            synchronized (pickerActivityObject) {
                                context.startActivity(intent);
                                pickerActivityObject.wait();
                            }
                            pickerActivityObject = null;
                        } catch (Exception e) {
                            e.printStackTrace();
                            pickerActivityObject = null;
                        }
                        if (file != null && file.exists() && file.length() > 0) {
                            byte[] contents = scaleBitmapToBytes(file, w, h, contentMode);
                            file.delete();
                            if (contents != null) {
                                response = new MMJSResponse();
                                response.result = 1;
                                response.dataResponse = contents;
                            }
                        }
                    }
                }
                response = null;
            }
        }
        return response;
    }

    public synchronized MMJSResponse writeToPhotoLibrary(HashMap<String, String> arguments) {
        MMJSResponse responseWithError;
        Context context = this.contextRef.get();
        Uri path = Uri.parse(arguments.get(PATH));
        File dest = new File(Environment.getExternalStorageDirectory().getAbsolutePath() + File.separator + PICTURES + File.separator + path.getLastPathSegment());
        String scheme = path.getScheme();
        if (scheme != null && scheme.equals("http")) {
            arguments.put(PlusShare.KEY_CALL_TO_ACTION_URL, path.toString());
            arguments.put(PATH, path.getLastPathSegment());
            MMFileManager fileManager = new MMFileManager();
            fileManager.setContext(context);
            if (fileManager.downloadFile(arguments) == null) {
                responseWithError = MMJSResponse.responseWithError("Failed to download");
            } else {
                File source = new File(MMFileManager.getCreativeCacheDirectory(context), File.separator + path.getLastPathSegment());
                scanMedia(moveFile(source, dest) ? dest.getAbsolutePath() : source.getAbsolutePath());
                responseWithError = MMJSResponse.responseWithSuccess();
            }
        } else {
            File source2 = new File(MMFileManager.getCreativeCacheDirectory(context), File.separator + path.getLastPathSegment());
            if (!source2.exists()) {
                responseWithError = MMJSResponse.responseWithError("No file at " + source2.getAbsolutePath());
            } else {
                scanMedia(moveFile(source2, dest) ? dest.getAbsolutePath() : source2.getAbsolutePath());
                responseWithError = MMJSResponse.responseWithSuccess();
            }
        }
        return responseWithError;
    }

    private boolean moveFile(File source, File dest) {
        if (!Environment.getExternalStorageState().equals("mounted")) {
            return false;
        }
        try {
            FileChannel inChannel = new FileInputStream(source).getChannel();
            dest.createNewFile();
            FileChannel outChannel = new FileOutputStream(dest).getChannel();
            inChannel.transferTo(0L, inChannel.size(), outChannel);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private void scanMedia(final String path) {
        Context context = this.contextRef.get();
        if (context != null) {
            this.mediaScanner = new MediaScannerConnection(context.getApplicationContext(), new MediaScannerConnection.MediaScannerConnectionClient() { // from class: com.millennialmedia.android.MMMedia.1
                @Override // android.media.MediaScannerConnection.OnScanCompletedListener
                public void onScanCompleted(String path2, Uri uri) {
                    if (uri == null) {
                        MMAdViewSDK.Log.d("Failed to scan " + path2);
                    }
                }

                @Override // android.media.MediaScannerConnection.MediaScannerConnectionClient
                public void onMediaScannerConnected() {
                    if (MMMedia.this.mediaScanner != null) {
                        MMMedia.this.mediaScanner.scanFile(path, null);
                    }
                }
            });
            if (this.mediaScanner != null) {
                this.mediaScanner.connect();
            }
        }
    }

    public MMJSResponse playVideo(HashMap<String, String> arguments) {
        Context context = this.contextRef.get();
        String path = arguments.get(PATH);
        if (context != null && path != null) {
            if (path.startsWith("http")) {
                Intent intent = new Intent(context, MMActivity.class);
                intent.setData(Uri.parse(path));
                intent.putExtra("class", "com.millennialmedia.android.VideoPlayerActivity");
                if (!(context instanceof Activity)) {
                    intent.addFlags(DriveFile.MODE_READ_ONLY);
                }
                context.startActivity(intent);
                return MMJSResponse.responseWithSuccess();
            }
            File cacheDir = MMFileManager.getCreativeCacheDirectory(context);
            if (cacheDir != null) {
                File file = new File(cacheDir, path);
                if (file.exists()) {
                    Intent intent2 = new Intent(context, VideoPlayer.class);
                    intent2.setData(Uri.fromFile(file));
                    intent2.putExtra("class", "com.millennialmedia.android.VideoPlayerActivity");
                    if (!(context instanceof Activity)) {
                        intent2.addFlags(DriveFile.MODE_READ_ONLY);
                    }
                    context.startActivity(intent2);
                    return MMJSResponse.responseWithSuccess();
                }
            }
        }
        return null;
    }

    public MMJSResponse playAudio(HashMap<String, String> arguments) {
        Context context = this.contextRef.get();
        String path = arguments.get(PATH);
        if (context != null && path != null) {
            if (Audio.sharedAudio(context).isPlaying()) {
                return MMJSResponse.responseWithError("Audio already playing.");
            }
            if (path.startsWith("http")) {
                return Audio.sharedAudio(context).playAudio(Uri.parse(path), Boolean.parseBoolean(arguments.get("repeat")));
            }
            File cacheDir = MMFileManager.getCreativeCacheDirectory(context);
            if (cacheDir != null) {
                File file = new File(cacheDir, path);
                if (file.exists()) {
                    return Audio.sharedAudio(context).playAudio(Uri.fromFile(file), Boolean.parseBoolean(arguments.get("repeat")));
                }
            }
        }
        return null;
    }

    public MMJSResponse playSound(HashMap<String, String> arguments) {
        File cacheDir;
        Context context = this.contextRef.get();
        String path = arguments.get(PATH);
        if (context != null && path != null && (cacheDir = MMFileManager.getCreativeCacheDirectory(context)) != null) {
            File file = new File(cacheDir, path);
            if (file.exists()) {
                return Audio.sharedAudio(this.contextRef.get()).playSound(file);
            }
        }
        return null;
    }

    public MMJSResponse stopAudio(HashMap<String, String> arguments) {
        return Audio.sharedAudio(this.contextRef.get()).stop();
    }

    /* loaded from: classes.dex */
    static class Audio {
        private static final int MAX_SOUNDS = 4;
        private static Audio sharedInstance;
        private OnLoadCompleteListener completionListener;
        private WeakReference<Context> contextRef;
        private MediaPlayer mediaPlayer;
        private SoundPool soundPool;

        private Audio() {
        }

        private Audio(Context context) {
            this.contextRef = new WeakReference<>(context.getApplicationContext());
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static synchronized Audio sharedAudio(Context context) {
            Audio audio;
            synchronized (Audio.class) {
                if (sharedInstance == null) {
                    sharedInstance = new Audio(context);
                }
                audio = sharedInstance;
            }
            return audio;
        }

        synchronized boolean isPlaying() {
            boolean z;
            if (this.mediaPlayer != null) {
                if (this.mediaPlayer.isPlaying()) {
                    z = true;
                }
            }
            z = false;
            return z;
        }

        synchronized MMJSResponse playAudio(Uri uri, boolean loop) {
            try {
                if (this.mediaPlayer != null) {
                    this.mediaPlayer.release();
                    this.mediaPlayer = null;
                }
                this.mediaPlayer = MediaPlayer.create(this.contextRef.get(), uri);
                this.mediaPlayer.setLooping(loop);
                this.mediaPlayer.start();
                this.mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() { // from class: com.millennialmedia.android.MMMedia.Audio.1
                    @Override // android.media.MediaPlayer.OnCompletionListener
                    public synchronized void onCompletion(MediaPlayer mp) {
                        if (Audio.this.mediaPlayer != null) {
                            Audio.this.mediaPlayer.release();
                            Audio.this.mediaPlayer = null;
                        }
                    }
                });
            } catch (Exception e) {
                MMAdViewSDK.Log.e(e.getCause());
            }
            return MMJSResponse.responseWithSuccess();
        }

        synchronized MMJSResponse playSound(File file) {
            try {
                if (this.soundPool == null) {
                    this.soundPool = new SoundPool(4, 3, 0);
                    this.completionListener = new OnLoadCompleteListener(this.soundPool) { // from class: com.millennialmedia.android.MMMedia.Audio.2
                        @Override // com.millennialmedia.android.MMMedia.Audio.OnLoadCompleteListener
                        public synchronized void onLoadComplete(SoundPool soundPool, int sampleId, int status) {
                            if (soundPool != null) {
                                AudioManager audioManager = (AudioManager) ((Context) Audio.this.contextRef.get()).getSystemService("audio");
                                float streamVolume = (audioManager.getStreamVolume(3) + BitmapDescriptorFactory.HUE_RED) / audioManager.getStreamMaxVolume(3);
                                soundPool.play(sampleId, streamVolume, streamVolume, 1, 0, 1.0f);
                            }
                        }
                    };
                }
                this.completionListener.testSample(this.soundPool.load(file.getAbsolutePath(), 1));
            } catch (Exception e) {
            }
            return MMJSResponse.responseWithSuccess();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public synchronized MMJSResponse stop() {
            if (this.mediaPlayer != null) {
                this.mediaPlayer.release();
                this.mediaPlayer = null;
            }
            if (this.soundPool != null) {
                this.soundPool.release();
                this.soundPool = null;
            }
            if (this.completionListener != null) {
                this.completionListener.release();
                this.completionListener = null;
            }
            return MMJSResponse.responseWithSuccess();
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes.dex */
        public abstract class OnLoadCompleteListener {
            private static final int TEST_PERIOD_MS = 100;
            private ArrayList<Integer> sampleIds = new ArrayList<>();
            private SoundPool soundPool;
            private Timer timer;

            abstract void onLoadComplete(SoundPool soundPool, int i, int i2);

            public OnLoadCompleteListener(SoundPool soundPool) {
                this.soundPool = soundPool;
            }

            synchronized void testSample(int sampleId) {
                this.sampleIds.add(Integer.valueOf(sampleId));
                if (this.sampleIds.size() == 1) {
                    this.timer = new Timer();
                    this.timer.scheduleAtFixedRate(new TimerTask() { // from class: com.millennialmedia.android.MMMedia.Audio.OnLoadCompleteListener.1
                        @Override // java.util.TimerTask, java.lang.Runnable
                        public void run() {
                            ArrayList<Integer> completedOnes = new ArrayList<>();
                            Iterator i$ = OnLoadCompleteListener.this.sampleIds.iterator();
                            while (i$.hasNext()) {
                                Integer sampleId2 = (Integer) i$.next();
                                int streamId = OnLoadCompleteListener.this.soundPool.play(sampleId2.intValue(), BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, 0, 0, 1.0f);
                                if (streamId != 0) {
                                    OnLoadCompleteListener.this.soundPool.stop(streamId);
                                    OnLoadCompleteListener.this.onLoadComplete(OnLoadCompleteListener.this.soundPool, sampleId2.intValue(), 0);
                                    completedOnes.add(sampleId2);
                                }
                            }
                            OnLoadCompleteListener.this.sampleIds.removeAll(completedOnes);
                            if (OnLoadCompleteListener.this.sampleIds.size() == 0) {
                                OnLoadCompleteListener.this.timer.cancel();
                                OnLoadCompleteListener.this.timer.purge();
                            }
                        }
                    }, 0L, 100L);
                }
            }

            synchronized void release() {
                if (this.timer != null) {
                    this.timer.cancel();
                    this.timer.purge();
                }
            }
        }
    }
}
