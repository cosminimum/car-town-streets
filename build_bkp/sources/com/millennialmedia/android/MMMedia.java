package com.millennialmedia.android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
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
import java.util.Timer;
import java.util.TimerTask;
import org.json.JSONArray;

class MMMedia extends MMJSObject {
    private static final String PATH = "path";
    private static final String PICTURES = "Pictures";
    /* access modifiers changed from: private */
    public static Object pickerActivityObject;
    MediaScannerConnection mediaScanner;

    MMMedia() {
    }

    private boolean isCameraAvailable() {
        Context context = (Context) this.contextRef.get();
        if (context == null || context.getPackageManager().checkPermission("android.permission.CAMERA", context.getPackageName()) != 0) {
            return false;
        }
        if (context.getPackageManager().queryIntentActivities(new Intent("android.media.action.IMAGE_CAPTURE"), 65536).size() > 0) {
            return true;
        }
        return false;
    }

    private boolean isPictureChooserAvailable() {
        Context context = (Context) this.contextRef.get();
        if (context == null) {
            return false;
        }
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction("android.intent.action.GET_CONTENT");
        if (context.getPackageManager().queryIntentActivities(intent, 65536).size() > 0) {
            return true;
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

    public MMJSResponse availableSourceTypes(HashMap<String, String> hashMap) {
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

    static class PickerActivity extends MMBaseActivity {
        private Uri fileUri;

        PickerActivity() {
        }

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

        /*  JADX ERROR: IndexOutOfBoundsException in pass: RegionMakerVisitor
            java.lang.IndexOutOfBoundsException: Index 0 out of bounds for length 0
            	at java.base/jdk.internal.util.Preconditions.outOfBounds(Preconditions.java:64)
            	at java.base/jdk.internal.util.Preconditions.outOfBoundsCheckIndex(Preconditions.java:70)
            	at java.base/jdk.internal.util.Preconditions.checkIndex(Preconditions.java:248)
            	at java.base/java.util.Objects.checkIndex(Objects.java:372)
            	at java.base/java.util.ArrayList.get(ArrayList.java:458)
            	at jadx.core.dex.nodes.InsnNode.getArg(InsnNode.java:101)
            	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:611)
            	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
            	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
            	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
            	at jadx.core.dex.visitors.regions.RegionMaker.processMonitorEnter(RegionMaker.java:561)
            	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:133)
            	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
            	at jadx.core.dex.visitors.regions.RegionMaker.processExcHandler(RegionMaker.java:1043)
            	at jadx.core.dex.visitors.regions.RegionMaker.processTryCatchBlocks(RegionMaker.java:975)
            	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:52)
            */
        protected void onActivityResult(int r17, int r18, android.content.Intent r19) {
            /*
                r16 = this;
                if (r19 == 0) goto L_0x007e
                android.content.Intent r0 = r16.getIntent()
                java.lang.String r3 = "type"
                java.lang.String r0 = r0.getStringExtra(r3)
                java.lang.String r3 = "Photo Library"
                boolean r0 = r0.equalsIgnoreCase(r3)
                if (r0 == 0) goto L_0x007e
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
                if (r8 == 0) goto L_0x007e
                java.lang.String r0 = "_data"
                int r12 = r8.getColumnIndex(r0)
                r0 = -1
                if (r12 == r0) goto L_0x007e
                r8.moveToFirst()
                java.io.File r7 = new java.io.File
                java.lang.String r0 = r8.getString(r12)
                r7.<init>(r0)
                r8.close()
                java.io.File r9 = new java.io.File     // Catch:{ Exception -> 0x00b6, all -> 0x009c }
                android.content.Intent r0 = r16.getIntent()     // Catch:{ Exception -> 0x00b6, all -> 0x009c }
                android.net.Uri r0 = r0.getData()     // Catch:{ Exception -> 0x00b6, all -> 0x009c }
                java.lang.String r0 = r0.getPath()     // Catch:{ Exception -> 0x00b6, all -> 0x009c }
                r9.<init>(r0)     // Catch:{ Exception -> 0x00b6, all -> 0x009c }
                java.io.FileInputStream r11 = new java.io.FileInputStream     // Catch:{ Exception -> 0x00b6, all -> 0x009c }
                r11.<init>(r7)     // Catch:{ Exception -> 0x00b6, all -> 0x009c }
                java.io.FileOutputStream r15 = new java.io.FileOutputStream     // Catch:{ Exception -> 0x00b8, all -> 0x00ad }
                r15.<init>(r9)     // Catch:{ Exception -> 0x00b8, all -> 0x00ad }
                r0 = 1024(0x400, float:1.435E-42)
                byte[] r6 = new byte[r0]     // Catch:{ Exception -> 0x0071, all -> 0x00b0 }
            L_0x0066:
                int r13 = r11.read(r6)     // Catch:{ Exception -> 0x0071, all -> 0x00b0 }
                if (r13 <= 0) goto L_0x008f
                r0 = 0
                r15.write(r6, r0, r13)     // Catch:{ Exception -> 0x0071, all -> 0x00b0 }
                goto L_0x0066
            L_0x0071:
                r0 = move-exception
                r14 = r15
                r10 = r11
            L_0x0074:
                if (r10 == 0) goto L_0x0079
                r10.close()     // Catch:{ Exception -> 0x00b4 }
            L_0x0079:
                if (r14 == 0) goto L_0x007e
                r14.close()     // Catch:{ Exception -> 0x00b4 }
            L_0x007e:
                java.lang.Object r3 = com.millennialmedia.android.MMMedia.pickerActivityObject
                monitor-enter(r3)
                java.lang.Object r0 = com.millennialmedia.android.MMMedia.pickerActivityObject     // Catch:{ all -> 0x00a8 }
                r0.notify()     // Catch:{ all -> 0x00a8 }
                monitor-exit(r3)     // Catch:{ all -> 0x00a8 }
                r16.finish()
                return
            L_0x008f:
                if (r11 == 0) goto L_0x0094
                r11.close()     // Catch:{ Exception -> 0x009a }
            L_0x0094:
                if (r15 == 0) goto L_0x007e
                r15.close()     // Catch:{ Exception -> 0x009a }
                goto L_0x007e
            L_0x009a:
                r0 = move-exception
                goto L_0x007e
            L_0x009c:
                r0 = move-exception
            L_0x009d:
                if (r10 == 0) goto L_0x00a2
                r10.close()     // Catch:{ Exception -> 0x00ab }
            L_0x00a2:
                if (r14 == 0) goto L_0x00a7
                r14.close()     // Catch:{ Exception -> 0x00ab }
            L_0x00a7:
                throw r0
            L_0x00a8:
                r0 = move-exception
                monitor-exit(r3)     // Catch:{ all -> 0x00a8 }
                throw r0
            L_0x00ab:
                r3 = move-exception
                goto L_0x00a7
            L_0x00ad:
                r0 = move-exception
                r10 = r11
                goto L_0x009d
            L_0x00b0:
                r0 = move-exception
                r14 = r15
                r10 = r11
                goto L_0x009d
            L_0x00b4:
                r0 = move-exception
                goto L_0x007e
            L_0x00b6:
                r0 = move-exception
                goto L_0x0074
            L_0x00b8:
                r0 = move-exception
                r10 = r11
                goto L_0x0074
            */
            throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMMedia.PickerActivity.onActivityResult(int, int, android.content.Intent):void");
        }
    }

    static Bitmap resizeImage(Bitmap image, String contentMode, int toW, int toH, int quality) {
        float horizontalRatio = ((float) toW) / ((float) image.getWidth());
        float verticalRatio = ((float) toH) / ((float) image.getHeight());
        if (contentMode.equals("Center")) {
            return centerOfImage(image, toW, toH);
        }
        if (contentMode.equals("ScaleToAspectFit")) {
            float ratio = Math.min(horizontalRatio, verticalRatio);
            return resizeImage(image, (int) (((float) image.getWidth()) * ratio), (int) (((float) image.getHeight()) * ratio), quality);
        } else if (!contentMode.equals("ScaleToAspectFill")) {
            return resizeImage(image, toW, toH, quality);
        } else {
            float ratio2 = Math.max(horizontalRatio, verticalRatio);
            return cropImage(resizeImage(image, (int) (((float) image.getWidth()) * ratio2), (int) (((float) image.getHeight()) * ratio2), quality), 0, 0, toW, toH);
        }
    }

    private static Bitmap resizeImage(Bitmap image, int newW, int newH, int quality) {
        return Bitmap.createScaledBitmap(image, newW, newH, true);
    }

    private static Bitmap centerOfImage(Bitmap image, int width, int height) {
        return cropImage(image, (int) ((float) ((image.getWidth() - width) / 2)), (int) ((float) ((image.getHeight() - height) / 2)), width, height);
    }

    private static Bitmap cropImage(Bitmap bitmap, int left, int top, int width, int height) {
        return Bitmap.createBitmap(bitmap, left, top, width, height);
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x0074  */
    /* JADX WARNING: Removed duplicated region for block: B:54:0x00dd A[SYNTHETIC, Splitter:B:54:0x00dd] */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00e2 A[Catch:{ IOException -> 0x012d }] */
    /* JADX WARNING: Removed duplicated region for block: B:79:0x0115 A[SYNTHETIC, Splitter:B:79:0x0115] */
    /* JADX WARNING: Removed duplicated region for block: B:82:0x011a A[Catch:{ Exception -> 0x0123 }] */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x011f A[Catch:{ Exception -> 0x0123 }] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static final byte[] scaleBitmapToBytes(java.io.File r21, int r22, int r23, java.lang.String r24) {
        /*
            r10 = 0
            r12 = 0
            r17 = 0
            java.io.FileInputStream r11 = new java.io.FileInputStream     // Catch:{ FileNotFoundException -> 0x00cc, all -> 0x00da }
            r0 = r21
            r11.<init>(r0)     // Catch:{ FileNotFoundException -> 0x00cc, all -> 0x00da }
            android.graphics.BitmapFactory$Options r16 = new android.graphics.BitmapFactory$Options     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
            r16.<init>()     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
            r19 = 1
            r0 = r19
            r1 = r16
            r1.inJustDecodeBounds = r0     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
            r19 = 0
            r0 = r19
            r1 = r16
            android.graphics.BitmapFactory.decodeStream(r11, r0, r1)     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
            r0 = r16
            int r14 = r0.outHeight     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
            r0 = r16
            int r0 = r0.outWidth     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
            r18 = r0
            r15 = 1
            r0 = r23
            if (r14 > r0) goto L_0x0036
            r0 = r18
            r1 = r22
            if (r0 <= r1) goto L_0x0048
        L_0x0036:
            r0 = r18
            if (r0 <= r14) goto L_0x00b7
            float r0 = (float) r14     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
            r19 = r0
            r0 = r23
            float r0 = (float) r0     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
            r20 = r0
            float r19 = r19 / r20
            int r15 = java.lang.Math.round(r19)     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
        L_0x0048:
            java.io.FileInputStream r13 = new java.io.FileInputStream     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
            r0 = r21
            r13.<init>(r0)     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
            r19 = 0
            r0 = r19
            r1 = r16
            r1.inJustDecodeBounds = r0     // Catch:{ FileNotFoundException -> 0x0139, all -> 0x0132 }
            r0 = r16
            r0.inSampleSize = r15     // Catch:{ FileNotFoundException -> 0x0139, all -> 0x0132 }
            r19 = 0
            r0 = r19
            r1 = r16
            android.graphics.Bitmap r17 = android.graphics.BitmapFactory.decodeStream(r13, r0, r1)     // Catch:{ FileNotFoundException -> 0x0139, all -> 0x0132 }
            if (r11 == 0) goto L_0x006a
            r11.close()     // Catch:{ IOException -> 0x00c8 }
        L_0x006a:
            if (r13 == 0) goto L_0x006f
            r13.close()     // Catch:{ IOException -> 0x00c8 }
        L_0x006f:
            r12 = r13
            r10 = r11
        L_0x0071:
            r7 = 0
            if (r17 == 0) goto L_0x00b6
            r19 = 1
            r0 = r17
            r1 = r24
            r2 = r22
            r3 = r23
            r4 = r19
            android.graphics.Bitmap r9 = resizeImage(r0, r1, r2, r3, r4)
            r5 = 0
            java.io.ByteArrayOutputStream r6 = new java.io.ByteArrayOutputStream     // Catch:{ Exception -> 0x012b }
            r6.<init>()     // Catch:{ Exception -> 0x012b }
            java.lang.String r19 = ""
            r0 = r24
            r1 = r19
            boolean r19 = r0.equals(r1)     // Catch:{ Exception -> 0x00f2, all -> 0x0128 }
            if (r19 == 0) goto L_0x00e6
            android.graphics.Bitmap$CompressFormat r19 = android.graphics.Bitmap.CompressFormat.JPEG     // Catch:{ Exception -> 0x00f2, all -> 0x0128 }
            r20 = 100
            r0 = r17
            r1 = r19
            r2 = r20
            r0.compress(r1, r2, r6)     // Catch:{ Exception -> 0x00f2, all -> 0x0128 }
        L_0x00a3:
            byte[] r7 = r6.toByteArray()     // Catch:{ Exception -> 0x00f2, all -> 0x0128 }
            if (r17 == 0) goto L_0x00ac
            r17.recycle()     // Catch:{ Exception -> 0x010d }
        L_0x00ac:
            if (r9 == 0) goto L_0x00b1
            r9.recycle()     // Catch:{ Exception -> 0x010d }
        L_0x00b1:
            if (r6 == 0) goto L_0x00b6
            r6.close()     // Catch:{ Exception -> 0x010d }
        L_0x00b6:
            return r7
        L_0x00b7:
            r0 = r18
            float r0 = (float) r0
            r19 = r0
            r0 = r22
            float r0 = (float) r0
            r20 = r0
            float r19 = r19 / r20
            int r15 = java.lang.Math.round(r19)     // Catch:{ FileNotFoundException -> 0x0136, all -> 0x012f }
            goto L_0x0048
        L_0x00c8:
            r19 = move-exception
            r12 = r13
            r10 = r11
            goto L_0x0071
        L_0x00cc:
            r19 = move-exception
        L_0x00cd:
            if (r10 == 0) goto L_0x00d2
            r10.close()     // Catch:{ IOException -> 0x00d8 }
        L_0x00d2:
            if (r12 == 0) goto L_0x0071
            r12.close()     // Catch:{ IOException -> 0x00d8 }
            goto L_0x0071
        L_0x00d8:
            r19 = move-exception
            goto L_0x0071
        L_0x00da:
            r19 = move-exception
        L_0x00db:
            if (r10 == 0) goto L_0x00e0
            r10.close()     // Catch:{ IOException -> 0x012d }
        L_0x00e0:
            if (r12 == 0) goto L_0x00e5
            r12.close()     // Catch:{ IOException -> 0x012d }
        L_0x00e5:
            throw r19
        L_0x00e6:
            android.graphics.Bitmap$CompressFormat r19 = android.graphics.Bitmap.CompressFormat.JPEG     // Catch:{ Exception -> 0x00f2, all -> 0x0128 }
            r20 = 100
            r0 = r19
            r1 = r20
            r9.compress(r0, r1, r6)     // Catch:{ Exception -> 0x00f2, all -> 0x0128 }
            goto L_0x00a3
        L_0x00f2:
            r8 = move-exception
            r5 = r6
        L_0x00f4:
            r7 = 0
            r8.printStackTrace()     // Catch:{ all -> 0x0112 }
            if (r17 == 0) goto L_0x00fd
            r17.recycle()     // Catch:{ Exception -> 0x0108 }
        L_0x00fd:
            if (r9 == 0) goto L_0x0102
            r9.recycle()     // Catch:{ Exception -> 0x0108 }
        L_0x0102:
            if (r5 == 0) goto L_0x00b6
            r5.close()     // Catch:{ Exception -> 0x0108 }
            goto L_0x00b6
        L_0x0108:
            r8 = move-exception
            r8.printStackTrace()
            goto L_0x00b6
        L_0x010d:
            r8 = move-exception
            r8.printStackTrace()
            goto L_0x00b6
        L_0x0112:
            r19 = move-exception
        L_0x0113:
            if (r17 == 0) goto L_0x0118
            r17.recycle()     // Catch:{ Exception -> 0x0123 }
        L_0x0118:
            if (r9 == 0) goto L_0x011d
            r9.recycle()     // Catch:{ Exception -> 0x0123 }
        L_0x011d:
            if (r5 == 0) goto L_0x0122
            r5.close()     // Catch:{ Exception -> 0x0123 }
        L_0x0122:
            throw r19
        L_0x0123:
            r8 = move-exception
            r8.printStackTrace()
            goto L_0x0122
        L_0x0128:
            r19 = move-exception
            r5 = r6
            goto L_0x0113
        L_0x012b:
            r8 = move-exception
            goto L_0x00f4
        L_0x012d:
            r20 = move-exception
            goto L_0x00e5
        L_0x012f:
            r19 = move-exception
            r10 = r11
            goto L_0x00db
        L_0x0132:
            r19 = move-exception
            r12 = r13
            r10 = r11
            goto L_0x00db
        L_0x0136:
            r19 = move-exception
            r10 = r11
            goto L_0x00cd
        L_0x0139:
            r19 = move-exception
            r12 = r13
            r10 = r11
            goto L_0x00cd
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMMedia.scaleBitmapToBytes(java.io.File, int, int, java.lang.String):byte[]");
    }

    /*  JADX ERROR: IndexOutOfBoundsException in pass: RegionMakerVisitor
        java.lang.IndexOutOfBoundsException: Index 0 out of bounds for length 0
        	at java.base/jdk.internal.util.Preconditions.outOfBounds(Preconditions.java:64)
        	at java.base/jdk.internal.util.Preconditions.outOfBoundsCheckIndex(Preconditions.java:70)
        	at java.base/jdk.internal.util.Preconditions.checkIndex(Preconditions.java:248)
        	at java.base/java.util.Objects.checkIndex(Objects.java:372)
        	at java.base/java.util.ArrayList.get(ArrayList.java:458)
        	at jadx.core.dex.nodes.InsnNode.getArg(InsnNode.java:101)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:611)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.processMonitorEnter(RegionMaker.java:561)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:133)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processIf(RegionMaker.java:693)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:123)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processIf(RegionMaker.java:693)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:123)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processIf(RegionMaker.java:698)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:123)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processIf(RegionMaker.java:698)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:123)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processMonitorEnter(RegionMaker.java:598)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:133)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:49)
        */
    public synchronized com.millennialmedia.android.MMJSResponse getPicture(java.util.HashMap<java.lang.String, java.lang.String> r18) {
        /*
            r17 = this;
            monitor-enter(r17)
            r0 = r17
            java.lang.ref.WeakReference r13 = r0.contextRef     // Catch:{ all -> 0x0103 }
            java.lang.Object r3 = r13.get()     // Catch:{ all -> 0x0103 }
            android.content.Context r3 = (android.content.Context) r3     // Catch:{ all -> 0x0103 }
            java.lang.String r13 = "sourceType"
            r0 = r18
            java.lang.Object r10 = r0.get(r13)     // Catch:{ all -> 0x0103 }
            java.lang.String r10 = (java.lang.String) r10     // Catch:{ all -> 0x0103 }
            java.lang.String r13 = "constrainHeight"
            r0 = r18
            java.lang.Object r7 = r0.get(r13)     // Catch:{ all -> 0x0103 }
            java.lang.String r7 = (java.lang.String) r7     // Catch:{ all -> 0x0103 }
            java.lang.String r13 = "constrainWidth"
            r0 = r18
            java.lang.Object r12 = r0.get(r13)     // Catch:{ all -> 0x0103 }
            java.lang.String r12 = (java.lang.String) r12     // Catch:{ all -> 0x0103 }
            java.lang.String r13 = "contentMode"
            r0 = r18
            java.lang.Object r1 = r0.get(r13)     // Catch:{ all -> 0x0103 }
            java.lang.String r1 = (java.lang.String) r1     // Catch:{ all -> 0x0103 }
            if (r1 != 0) goto L_0x0037
            java.lang.String r1 = ""
        L_0x0037:
            if (r7 == 0) goto L_0x003b
            if (r12 != 0) goto L_0x0043
        L_0x003b:
            java.lang.String r13 = "Missing constrainHeight and/or constrainWidth"
            com.millennialmedia.android.MMJSResponse r9 = com.millennialmedia.android.MMJSResponse.responseWithError(r13)     // Catch:{ all -> 0x0103 }
        L_0x0041:
            monitor-exit(r17)
            return r9
        L_0x0043:
            int r6 = java.lang.Integer.parseInt(r7)     // Catch:{ all -> 0x0103 }
            int r11 = java.lang.Integer.parseInt(r12)     // Catch:{ all -> 0x0103 }
            int r13 = r6 * r11
            r14 = 360000(0x57e40, float:5.04467E-40)
            if (r13 <= r14) goto L_0x0059
            java.lang.String r13 = "constrainHeight * constrainWidth > 360000"
            com.millennialmedia.android.MMJSResponse r9 = com.millennialmedia.android.MMJSResponse.responseWithError(r13)     // Catch:{ all -> 0x0103 }
            goto L_0x0041
        L_0x0059:
            if (r3 == 0) goto L_0x0116
            if (r10 == 0) goto L_0x0116
            java.io.File r5 = new java.io.File     // Catch:{ all -> 0x0103 }
            java.io.File r13 = android.os.Environment.getExternalStorageDirectory()     // Catch:{ all -> 0x0103 }
            java.lang.StringBuilder r14 = new java.lang.StringBuilder     // Catch:{ all -> 0x0103 }
            r14.<init>()     // Catch:{ all -> 0x0103 }
            java.lang.String r15 = "tmp_mm_"
            java.lang.StringBuilder r14 = r14.append(r15)     // Catch:{ all -> 0x0103 }
            long r15 = java.lang.System.currentTimeMillis()     // Catch:{ all -> 0x0103 }
            java.lang.String r15 = java.lang.String.valueOf(r15)     // Catch:{ all -> 0x0103 }
            java.lang.StringBuilder r14 = r14.append(r15)     // Catch:{ all -> 0x0103 }
            java.lang.String r15 = ".jpg"
            java.lang.StringBuilder r14 = r14.append(r15)     // Catch:{ all -> 0x0103 }
            java.lang.String r14 = r14.toString()     // Catch:{ all -> 0x0103 }
            r5.<init>(r13, r14)     // Catch:{ all -> 0x0103 }
            java.lang.String r13 = "Camera"
            boolean r13 = r10.equalsIgnoreCase(r13)     // Catch:{ all -> 0x0103 }
            if (r13 == 0) goto L_0x0095
            boolean r13 = r17.isCameraAvailable()     // Catch:{ all -> 0x0103 }
            if (r13 != 0) goto L_0x00a3
        L_0x0095:
            java.lang.String r13 = "Photo Library"
            boolean r13 = r10.equalsIgnoreCase(r13)     // Catch:{ all -> 0x0103 }
            if (r13 == 0) goto L_0x0116
            boolean r13 = r17.isPictureChooserAvailable()     // Catch:{ all -> 0x0103 }
            if (r13 == 0) goto L_0x0116
        L_0x00a3:
            java.lang.Object r13 = new java.lang.Object     // Catch:{ Exception -> 0x0109 }
            r13.<init>()     // Catch:{ Exception -> 0x0109 }
            pickerActivityObject = r13     // Catch:{ Exception -> 0x0109 }
            android.content.Intent r8 = new android.content.Intent     // Catch:{ Exception -> 0x0109 }
            java.lang.Class<com.millennialmedia.android.MMActivity> r13 = com.millennialmedia.android.MMActivity.class
            r8.<init>(r3, r13)     // Catch:{ Exception -> 0x0109 }
            android.net.Uri r13 = android.net.Uri.fromFile(r5)     // Catch:{ Exception -> 0x0109 }
            r8.setData(r13)     // Catch:{ Exception -> 0x0109 }
            java.lang.String r13 = "type"
            r8.putExtra(r13, r10)     // Catch:{ Exception -> 0x0109 }
            java.lang.String r13 = "class"
            java.lang.String r14 = "com.millennialmedia.android.MMMedia$PickerActivity"
            r8.putExtra(r13, r14)     // Catch:{ Exception -> 0x0109 }
            boolean r13 = r3 instanceof android.app.Activity     // Catch:{ Exception -> 0x0109 }
            if (r13 != 0) goto L_0x00cd
            r13 = 268435456(0x10000000, float:2.5243549E-29)
            r8.addFlags(r13)     // Catch:{ Exception -> 0x0109 }
        L_0x00cd:
            java.lang.Object r14 = pickerActivityObject     // Catch:{ Exception -> 0x0109 }
            monitor-enter(r14)     // Catch:{ Exception -> 0x0109 }
            r3.startActivity(r8)     // Catch:{ all -> 0x0106 }
            java.lang.Object r13 = pickerActivityObject     // Catch:{ all -> 0x0106 }
            r13.wait()     // Catch:{ all -> 0x0106 }
            monitor-exit(r14)     // Catch:{ all -> 0x0106 }
            r13 = 0
            pickerActivityObject = r13     // Catch:{ all -> 0x0103 }
        L_0x00dc:
            if (r5 == 0) goto L_0x0116
            boolean r13 = r5.exists()     // Catch:{ all -> 0x0103 }
            if (r13 == 0) goto L_0x0116
            long r13 = r5.length()     // Catch:{ all -> 0x0103 }
            r15 = 0
            int r13 = (r13 > r15 ? 1 : (r13 == r15 ? 0 : -1))
            if (r13 <= 0) goto L_0x0116
            byte[] r2 = scaleBitmapToBytes(r5, r11, r6, r1)     // Catch:{ all -> 0x0103 }
            r5.delete()     // Catch:{ all -> 0x0103 }
            if (r2 == 0) goto L_0x0116
            com.millennialmedia.android.MMJSResponse r9 = new com.millennialmedia.android.MMJSResponse     // Catch:{ all -> 0x0103 }
            r9.<init>()     // Catch:{ all -> 0x0103 }
            r13 = 1
            r9.result = r13     // Catch:{ all -> 0x0103 }
            r9.dataResponse = r2     // Catch:{ all -> 0x0103 }
            goto L_0x0041
        L_0x0103:
            r13 = move-exception
            monitor-exit(r17)
            throw r13
        L_0x0106:
            r13 = move-exception
            monitor-exit(r14)     // Catch:{ all -> 0x0106 }
            throw r13     // Catch:{ Exception -> 0x0109 }
        L_0x0109:
            r4 = move-exception
            r4.printStackTrace()     // Catch:{ all -> 0x0111 }
            r13 = 0
            pickerActivityObject = r13     // Catch:{ all -> 0x0103 }
            goto L_0x00dc
        L_0x0111:
            r13 = move-exception
            r14 = 0
            pickerActivityObject = r14     // Catch:{ all -> 0x0103 }
            throw r13     // Catch:{ all -> 0x0103 }
        L_0x0116:
            r9 = 0
            goto L_0x0041
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.MMMedia.getPicture(java.util.HashMap):com.millennialmedia.android.MMJSResponse");
    }

    public synchronized MMJSResponse writeToPhotoLibrary(HashMap<String, String> arguments) {
        String absolutePath;
        MMJSResponse responseWithError;
        Context context = (Context) this.contextRef.get();
        Uri path = Uri.parse(arguments.get(PATH));
        File dest = new File(Environment.getExternalStorageDirectory().getAbsolutePath() + File.separator + PICTURES + File.separator + path.getLastPathSegment());
        String scheme = path.getScheme();
        if (scheme == null || !scheme.equals("http")) {
            File source = new File(MMFileManager.getCreativeCacheDirectory(context), File.separator + path.getLastPathSegment());
            if (!source.exists()) {
                responseWithError = MMJSResponse.responseWithError("No file at " + source.getAbsolutePath());
            } else {
                if (moveFile(source, dest)) {
                    absolutePath = dest.getAbsolutePath();
                } else {
                    absolutePath = source.getAbsolutePath();
                }
                scanMedia(absolutePath);
                responseWithError = MMJSResponse.responseWithSuccess();
            }
        } else {
            arguments.put(PlusShare.KEY_CALL_TO_ACTION_URL, path.toString());
            arguments.put(PATH, path.getLastPathSegment());
            MMFileManager fileManager = new MMFileManager();
            fileManager.setContext(context);
            if (fileManager.downloadFile(arguments) == null) {
                responseWithError = MMJSResponse.responseWithError("Failed to download");
            } else {
                File source2 = new File(MMFileManager.getCreativeCacheDirectory(context), File.separator + path.getLastPathSegment());
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
            inChannel.transferTo(0, inChannel.size(), new FileOutputStream(dest).getChannel());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private void scanMedia(final String path) {
        Context context = (Context) this.contextRef.get();
        if (context != null) {
            this.mediaScanner = new MediaScannerConnection(context.getApplicationContext(), new MediaScannerConnection.MediaScannerConnectionClient() {
                public void onScanCompleted(String path, Uri uri) {
                    if (uri == null) {
                        MMAdViewSDK.Log.m4416d("Failed to scan " + path);
                    }
                }

                public void onMediaScannerConnected() {
                    if (MMMedia.this.mediaScanner != null) {
                        MMMedia.this.mediaScanner.scanFile(path, (String) null);
                    }
                }
            });
            if (this.mediaScanner != null) {
                this.mediaScanner.connect();
            }
        }
    }

    public MMJSResponse playVideo(HashMap<String, String> arguments) {
        Context context = (Context) this.contextRef.get();
        String path = arguments.get(PATH);
        if (!(context == null || path == null)) {
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
        Context context = (Context) this.contextRef.get();
        String path = arguments.get(PATH);
        if (!(context == null || path == null)) {
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
        Context context = (Context) this.contextRef.get();
        String path = arguments.get(PATH);
        if (!(context == null || path == null || (cacheDir = MMFileManager.getCreativeCacheDirectory(context)) == null)) {
            File file = new File(cacheDir, path);
            if (file.exists()) {
                return Audio.sharedAudio((Context) this.contextRef.get()).playSound(file);
            }
        }
        return null;
    }

    public MMJSResponse stopAudio(HashMap<String, String> hashMap) {
        return Audio.sharedAudio((Context) this.contextRef.get()).stop();
    }

    static class Audio {
        private static final int MAX_SOUNDS = 4;
        private static Audio sharedInstance;
        private OnLoadCompleteListener completionListener;
        /* access modifiers changed from: private */
        public WeakReference<Context> contextRef;
        /* access modifiers changed from: private */
        public MediaPlayer mediaPlayer;
        private SoundPool soundPool;

        private Audio() {
        }

        private Audio(Context context) {
            this.contextRef = new WeakReference<>(context.getApplicationContext());
        }

        static synchronized Audio sharedAudio(Context context) {
            Audio audio;
            synchronized (Audio.class) {
                if (sharedInstance == null) {
                    sharedInstance = new Audio(context);
                }
                audio = sharedInstance;
            }
            return audio;
        }

        /* access modifiers changed from: package-private */
        public synchronized boolean isPlaying() {
            return this.mediaPlayer != null && this.mediaPlayer.isPlaying();
        }

        /* access modifiers changed from: package-private */
        public synchronized MMJSResponse playAudio(Uri uri, boolean loop) {
            try {
                if (this.mediaPlayer != null) {
                    this.mediaPlayer.release();
                    this.mediaPlayer = null;
                }
                this.mediaPlayer = MediaPlayer.create((Context) this.contextRef.get(), uri);
                this.mediaPlayer.setLooping(loop);
                this.mediaPlayer.start();
                this.mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
                    public synchronized void onCompletion(MediaPlayer mp) {
                        if (Audio.this.mediaPlayer != null) {
                            Audio.this.mediaPlayer.release();
                            MediaPlayer unused = Audio.this.mediaPlayer = null;
                        }
                    }
                });
            } catch (Exception e) {
                MMAdViewSDK.Log.m4421e(e.getCause());
            }
            return MMJSResponse.responseWithSuccess();
        }

        /* access modifiers changed from: package-private */
        public synchronized MMJSResponse playSound(File file) {
            try {
                if (this.soundPool == null) {
                    this.soundPool = new SoundPool(4, 3, 0);
                    this.completionListener = new OnLoadCompleteListener(this.soundPool) {
                        public synchronized void onLoadComplete(SoundPool soundPool, int sampleId, int status) {
                            if (soundPool != null) {
                                AudioManager audioManager = (AudioManager) ((Context) Audio.this.contextRef.get()).getSystemService("audio");
                                float streamVolume = (((float) audioManager.getStreamVolume(3)) + BitmapDescriptorFactory.HUE_RED) / ((float) audioManager.getStreamMaxVolume(3));
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

        /* access modifiers changed from: package-private */
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

        private abstract class OnLoadCompleteListener {
            private static final int TEST_PERIOD_MS = 100;
            /* access modifiers changed from: private */
            public ArrayList<Integer> sampleIds = new ArrayList<>();
            /* access modifiers changed from: private */
            public SoundPool soundPool;
            /* access modifiers changed from: private */
            public Timer timer;

            /* access modifiers changed from: package-private */
            public abstract void onLoadComplete(SoundPool soundPool2, int i, int i2);

            public OnLoadCompleteListener(SoundPool soundPool2) {
                this.soundPool = soundPool2;
            }

            /* access modifiers changed from: package-private */
            public synchronized void testSample(int sampleId) {
                this.sampleIds.add(Integer.valueOf(sampleId));
                if (this.sampleIds.size() == 1) {
                    this.timer = new Timer();
                    this.timer.scheduleAtFixedRate(new TimerTask() {
                        public void run() {
                            ArrayList<Integer> completedOnes = new ArrayList<>();
                            Iterator i$ = OnLoadCompleteListener.this.sampleIds.iterator();
                            while (i$.hasNext()) {
                                Integer sampleId = (Integer) i$.next();
                                int streamId = OnLoadCompleteListener.this.soundPool.play(sampleId.intValue(), BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, 0, 0, 1.0f);
                                if (streamId != 0) {
                                    OnLoadCompleteListener.this.soundPool.stop(streamId);
                                    OnLoadCompleteListener.this.onLoadComplete(OnLoadCompleteListener.this.soundPool, sampleId.intValue(), 0);
                                    completedOnes.add(sampleId);
                                }
                            }
                            OnLoadCompleteListener.this.sampleIds.removeAll(completedOnes);
                            if (OnLoadCompleteListener.this.sampleIds.size() == 0) {
                                OnLoadCompleteListener.this.timer.cancel();
                                OnLoadCompleteListener.this.timer.purge();
                            }
                        }
                    }, 0, 100);
                }
            }

            /* access modifiers changed from: package-private */
            public synchronized void release() {
                if (this.timer != null) {
                    this.timer.cancel();
                    this.timer.purge();
                }
            }
        }
    }
}
