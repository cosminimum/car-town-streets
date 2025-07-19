package com.miniclip.nativeJNI;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
/* loaded from: classes.dex */
public class cocotexture {
    private Context mContext;

    public cocotexture(Context context) {
        this.mContext = context;
    }

    private Bitmap createBitmapFromAsset(String path) {
        Log.i("cocotexture", path);
        AssetManager assetManager = this.mContext.getAssets();
        try {
            InputStream istr = assetManager.open(path);
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inTempStorage = new byte[16384];
            return BitmapFactory.decodeStream(istr, null, options);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    private static byte[] getPixels(Bitmap bitmap) {
        if (bitmap != null) {
            byte[] pixels = new byte[bitmap.getWidth() * bitmap.getHeight() * 4];
            ByteBuffer buf = ByteBuffer.wrap(pixels);
            buf.order(ByteOrder.nativeOrder());
            bitmap.copyPixelsToBuffer(buf);
            return pixels;
        }
        return null;
    }

    private static void initNativeObject(Bitmap bitmap) {
        if (bitmap == null) {
            CocoJNI.MnativeInitBitmap(0, 0, new byte[4]);
            return;
        }
        byte[] pixels = getPixels(bitmap);
        if (pixels == null) {
            CocoJNI.MnativeInitBitmap(0, 0, new byte[4]);
        } else {
            CocoJNI.MnativeInitBitmap(bitmap.getWidth(), bitmap.getHeight(), pixels);
        }
    }

    public void readBitmap(String path) {
        Bitmap bitmap = createBitmapFromAsset(path);
        initNativeObject(bitmap);
    }
}
