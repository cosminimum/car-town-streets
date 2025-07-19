package tapjoy;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.view.View;
import android.view.ViewGroup;

import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.drive.DriveFile;

import org.w3c.dom.Document;

import java.io.ByteArrayInputStream;
import java.util.Timer;
import java.util.TimerTask;

import javax.xml.parsers.DocumentBuilderFactory;

public class TapjoyDisplayAd {
    private static final byte[] DECODE_TABLE = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, 62, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, PAD, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, 63, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51};
    private static final int MASK_8BITS = 255;
    private static final byte PAD = 61;
    /* access modifiers changed from: private */
    public static String adClickURL;
    private static Bitmap bitmapImage;
    /* access modifiers changed from: private */
    public static TapjoyDisplayAdNotifier displayAdNotifier;
    private static String displayAdSize;
    public static String displayAdURLParams;
    /* access modifiers changed from: private */
    public static TapjoyURLConnection tapjoyURLConnection = null;
    final String TAPJOY_DISPLAY_AD = "Banner Ad";
    View adView;
    private boolean autoRefresh;
    private byte[] buffer;
    /* access modifiers changed from: private */
    public Context context;
    long elapsed_time;
    private boolean eof;
    private int modulus;
    private int pos;
    Timer resumeTimer;
    Timer timer;
    private int x;

    public TapjoyDisplayAd(Context ctx) {
        displayAdSize = TapjoyDisplayAdSize.TJC_AD_BANNERSIZE_640X100;
        this.context = ctx;
        tapjoyURLConnection = new TapjoyURLConnection();
    }

    public void setBannerAdSize(String dimensions) {
        displayAdSize = dimensions;
    }

    public String getBannerAdSize() {
        return displayAdSize;
    }

    public void enableAutoRefresh(boolean shouldAutoRefresh) {
        this.autoRefresh = shouldAutoRefresh;
    }

    public void getDisplayAd(TapjoyDisplayAdNotifier notifier) {
        TapjoyLog.i("Banner Ad", "Get Banner Ad");
        getDisplayAd((String) null, notifier);
    }

    public void getDisplayAd(String currencyID, TapjoyDisplayAdNotifier notifier) {
        TapjoyLog.i("Banner Ad", "Get Banner Ad, currencyID: " + currencyID);
        displayAdNotifier = notifier;
        displayAdURLParams = TapjoyConnectCore.getURLParams();
        displayAdURLParams += "&publisher_user_id=" + TapjoyConnectCore.getUserID();
        displayAdURLParams += "&size=" + displayAdSize;
        if (currencyID != null) {
            displayAdURLParams += "&currency_id=" + currencyID;
        }
        new Thread(new Runnable() {
            public void run() {
                String response = TapjoyDisplayAd.tapjoyURLConnection.connectToURL("https://ws.tapjoyads.com/display_ad?", TapjoyDisplayAd.displayAdURLParams);
                if (response == null || response.length() == 0) {
                    TapjoyDisplayAd.displayAdNotifier.getDisplayAdResponseFailed("Network error.");
                } else if (!TapjoyDisplayAd.this.buildResponse(response)) {
                    TapjoyDisplayAd.displayAdNotifier.getDisplayAdResponseFailed("No ad to display.");
                }
            }
        }).start();
    }

    /* access modifiers changed from: private */
    public boolean buildResponse(String response) {
        boolean retValue = false;
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try {
            Document document = factory.newDocumentBuilder().parse(new ByteArrayInputStream(response.getBytes("UTF-8")));
            adClickURL = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("ClickURL"));
            String image_data = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("Image"));
            TapjoyLog.i("Banner Ad", "decoding...");
            decodeBase64(image_data.getBytes(), 0, image_data.getBytes().length);
            TapjoyLog.i("Banner Ad", "pos: " + this.pos);
            TapjoyLog.i("Banner Ad", "buffer_size: " + this.buffer.length);
            bitmapImage = BitmapFactory.decodeByteArray(this.buffer, 0, this.pos);
            TapjoyLog.i("Banner Ad", "image: " + bitmapImage.getWidth() + Constants.X + bitmapImage.getHeight());
            this.adView = new View(this.context);
            this.adView.setLayoutParams(new ViewGroup.LayoutParams(bitmapImage.getWidth(), bitmapImage.getHeight()));
            this.adView.setBackgroundDrawable(new BitmapDrawable(bitmapImage));
            this.adView.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    TapjoyLog.i("Banner Ad", "Opening URL in new browser = [" + TapjoyDisplayAd.adClickURL + "]");
                    Intent intent = new Intent(TapjoyDisplayAd.this.context, TJCOffersWebView.class);
                    intent.putExtra(TapjoyConstants.EXTRA_DISPLAY_AD_URL, TapjoyDisplayAd.adClickURL);
                    intent.setFlags(DriveFile.MODE_READ_ONLY);
                    TapjoyDisplayAd.this.context.startActivity(intent);
                    if (TapjoyDisplayAd.this.resumeTimer != null) {
                        TapjoyDisplayAd.this.resumeTimer.cancel();
                    }
                    TapjoyDisplayAd.this.elapsed_time = 0;
                    TapjoyDisplayAd.this.resumeTimer = new Timer();
                    TapjoyDisplayAd.this.resumeTimer.schedule(new CheckForResumeTimer(), 10000, 10000);
                }
            });
            TapjoyLog.i("Banner Ad", "notify displayAdNotifier");
            displayAdNotifier.getDisplayAdResponse(this.adView);
            retValue = true;
        } catch (Exception e) {
            TapjoyLog.e("Banner Ad", "Error parsing XML: " + e.toString());
        }
        if (this.timer != null) {
            this.timer.cancel();
            this.timer = null;
        }
        if (this.autoRefresh && this.timer == null) {
            TapjoyLog.i("Banner Ad", "will refresh banner ad in 15s...");
            this.timer = new Timer();
            this.timer.schedule(new RefreshTimer(), 15000);
        }
        TapjoyLog.i("Banner Ad", "return: " + retValue);
        return retValue;
    }

    private class RefreshTimer extends TimerTask {
        private RefreshTimer() {
        }

        public void run() {
            TapjoyLog.i("Banner Ad", "refreshing banner ad...");
            TapjoyDisplayAd.this.getDisplayAd(TapjoyDisplayAd.displayAdNotifier);
            if (TapjoyDisplayAd.this.timer != null) {
                TapjoyDisplayAd.this.timer.cancel();
                TapjoyDisplayAd.this.timer = null;
            }
        }
    }

    private class CheckForResumeTimer extends TimerTask {
        private CheckForResumeTimer() {
        }

        public void run() {
            TapjoyDisplayAd.this.elapsed_time += 10000;
            TapjoyLog.i("Banner Ad", "banner elapsed_time: " + TapjoyDisplayAd.this.elapsed_time + " (" + ((TapjoyDisplayAd.this.elapsed_time / 1000) / 60) + "m " + ((TapjoyDisplayAd.this.elapsed_time / 1000) % 60) + "s)");
            if (TapjoyDisplayAd.this.adView == null) {
                cancel();
                return;
            }
            TapjoyLog.i("Banner Ad", "adView.isShown: " + TapjoyDisplayAd.this.adView.isShown());
            if (TapjoyDisplayAd.this.adView.isShown() && TapjoyConnectCore.getInstance() != null) {
                TapjoyLog.i("Banner Ad", "call connect");
                TapjoyConnectCore.getInstance().callConnect();
                cancel();
            }
            if (TapjoyDisplayAd.this.elapsed_time >= TapjoyConstants.RESUME_TOTAL_TIME) {
                cancel();
            }
        }
    }

    public static Bitmap getBitmapImage() {
        return bitmapImage;
    }

    public static String getLinkURL() {
        return adClickURL;
    }

    /* access modifiers changed from: package-private */
    public void decodeBase64(byte[] in, int inPos, int inAvail) {
        byte result;
        this.buffer = new byte[in.length];
        this.pos = 0;
        this.eof = false;
        this.modulus = 0;
        if (inAvail < 0) {
            this.eof = true;
        }
        int i = 0;
        int inPos2 = inPos;
        while (true) {
            if (i >= inAvail) {
                break;
            }
            int inPos3 = inPos2 + 1;
            byte b = in[inPos2];
            if (b == 61) {
                this.eof = true;
                break;
            }
            if (b >= 0 && b < DECODE_TABLE.length && (result = DECODE_TABLE[b]) >= 0) {
                int i2 = this.modulus + 1;
                this.modulus = i2;
                this.modulus = i2 % 4;
                this.x = (this.x << 6) + result;
                if (this.modulus == 0) {
                    byte[] bArr = this.buffer;
                    int i3 = this.pos;
                    this.pos = i3 + 1;
                    bArr[i3] = (byte) ((this.x >> 16) & 255);
                    byte[] bArr2 = this.buffer;
                    int i4 = this.pos;
                    this.pos = i4 + 1;
                    bArr2[i4] = (byte) ((this.x >> 8) & 255);
                    byte[] bArr3 = this.buffer;
                    int i5 = this.pos;
                    this.pos = i5 + 1;
                    bArr3[i5] = (byte) (this.x & 255);
                }
            }
            i++;
            inPos2 = inPos3;
        }
        if (this.eof && this.modulus != 0) {
            this.x <<= 6;
            switch (this.modulus) {
                case 2:
                    this.x <<= 6;
                    byte[] bArr4 = this.buffer;
                    int i6 = this.pos;
                    this.pos = i6 + 1;
                    bArr4[i6] = (byte) ((this.x >> 16) & 255);
                    return;
                case 3:
                    byte[] bArr5 = this.buffer;
                    int i7 = this.pos;
                    this.pos = i7 + 1;
                    bArr5[i7] = (byte) ((this.x >> 16) & 255);
                    byte[] bArr6 = this.buffer;
                    int i8 = this.pos;
                    this.pos = i8 + 1;
                    bArr6[i8] = (byte) ((this.x >> 8) & 255);
                    return;
                default:
                    return;
            }
        }
    }
}
