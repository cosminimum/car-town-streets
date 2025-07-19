package com.millennialmedia.android;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.os.Vibrator;
import android.support.v4.view.MotionEventCompat;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.TouchDelegate;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.ScaleAnimation;
import android.view.animation.TranslateAnimation;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.millennialmedia.android.MMAdViewSDK;

class AdViewOverlayView extends FrameLayout {
    private static final int TITLE_MARGIN_X = 8;
    private static final int TITLE_MARGIN_Y = 9;
    private RelativeLayout content;
    /* access modifiers changed from: private */
    public Button mraidCloseButton;
    /* access modifiers changed from: private */
    public RelativeLayout navBar;
    private Button navCloseButton;
    private String overlayUrl;
    private ProgressBar progressBar;
    private boolean progressDone;
    /* access modifiers changed from: private */
    public OverlaySettings settings;
    /* access modifiers changed from: private */
    public TextView title;
    Handler viewHandler = new Handler() {
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 2:
                    AdViewOverlayView.this.dismiss(true);
                    return;
                default:
                    return;
            }
        }
    };
    protected WebView webView;

    private static final class NonConfigurationInstance {
        boolean bottomBarEnabled;
        boolean bottomBarVisible;
        boolean progressDone;
        WebView webView;

        private NonConfigurationInstance() {
        }
    }

    AdViewOverlayView(Activity activity, OverlaySettings settings2) {
        super(activity);
        setId(15062);
        if (activity != null) {
            this.settings = settings2;
            this.settings.isBannerAd = false;
            NonConfigurationInstance nonConfigurationInstance = (NonConfigurationInstance) activity.getLastNonConfigurationInstance();
            if (nonConfigurationInstance != null) {
                this.settings.shouldShowBottomBar = nonConfigurationInstance.bottomBarVisible;
                this.settings.shouldEnableBottomBar = nonConfigurationInstance.bottomBarEnabled;
                this.progressDone = nonConfigurationInstance.progressDone;
                this.webView = nonConfigurationInstance.webView;
            }
            setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
            float scale = activity.getResources().getDisplayMetrics().density;
            Integer scaledPadding = Integer.valueOf((int) (0.0625f * scale * ((float) this.settings.shouldResizeOverlay)));
            setPadding(scaledPadding.intValue(), scaledPadding.intValue(), scaledPadding.intValue(), scaledPadding.intValue());
            this.content = new RelativeLayout(activity);
            this.content.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
            addView(this.content);
            RelativeLayout titleBar = null;
            if (this.settings.shouldShowCustomClose && this.settings.shouldShowTitlebar) {
                titleBar = new RelativeLayout(activity);
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
                layoutParams.addRule(10);
                titleBar.setLayoutParams(layoutParams);
                titleBar.setBackgroundColor(-16777216);
                titleBar.setId(100);
                this.title = new TextView(activity);
                this.title.setText(this.settings.overlayTitle);
                this.title.setTextColor(-1);
                this.title.setBackgroundColor(-16777216);
                this.title.setTypeface(Typeface.DEFAULT_BOLD);
                this.title.setPadding(8, 9, 8, 9);
                this.title.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
                titleBar.addView(this.title);
                Button closeButton = new Button(activity);
                closeButton.setBackgroundColor(-16777216);
                closeButton.setText("Close");
                closeButton.setTextColor(-1);
                closeButton.setOnTouchListener(new View.OnTouchListener() {
                    public boolean onTouch(View view, MotionEvent event) {
                        switch (event.getAction()) {
                            case 0:
                                return true;
                            case 1:
                                AdViewOverlayView.this.title.setBackgroundColor(-7829368);
                                AdViewOverlayView.this.dismiss(true);
                                return true;
                            default:
                                return false;
                        }
                    }
                });
                RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(-2, -2);
                lp.addRule(11);
                titleBar.addView(closeButton, lp);
                this.content.addView(titleBar);
            }
            if (settings2.shouldShowCustomClose) {
                this.navBar = new RelativeLayout(activity);
                RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
                layoutParams2.addRule(12);
                this.navBar.setLayoutParams(layoutParams2);
                this.navBar.setBackgroundDrawable(new BottomBarDrawable());
                this.navBar.setId(300);
                this.navCloseButton = new Button(activity);
                this.navCloseButton.setBackgroundColor(-16777216);
                setCloseButtonListener(this.settings.shouldEnableBottomBar);
                int closeHeight = (int) ((25.0f * scale) + 0.5f);
                RelativeLayout.LayoutParams closeLP = new RelativeLayout.LayoutParams(closeHeight, closeHeight);
                int i = (int) ((12.0f * scale) + 0.5f);
                closeLP.rightMargin = i;
                closeLP.bottomMargin = i;
                closeLP.topMargin = (int) ((15.0f * scale) + 0.5f);
                closeLP.addRule(11);
                closeLP.addRule(15);
                this.navBar.addView(this.navCloseButton, closeLP);
                RelativeLayout relativeLayout = this.navBar;
                relativeLayout.post(new SetCloseButtonTouchDelegateRunnable(this.navCloseButton, closeLP.topMargin, closeLP.leftMargin, closeLP.bottomMargin, closeLP.rightMargin));
                this.content.addView(this.navBar);
                if (this.settings.shouldShowBottomBar) {
                    this.navBar.setVisibility(0);
                } else {
                    this.navBar.setVisibility(8);
                }
            } else {
                this.mraidCloseButton = new Button(activity);
                this.mraidCloseButton.setId(301);
                this.mraidCloseButton.setBackgroundDrawable(new CloseTopDrawable(true, scale));
                this.mraidCloseButton.setOnClickListener(new View.OnClickListener() {
                    public void onClick(View view) {
                        MMAdViewSDK.Log.v("Close button clicked.");
                        AdViewOverlayView.this.dismiss(true);
                    }
                });
                int closeHeight2 = (int) ((50.0f * scale) + 0.5f);
                RelativeLayout.LayoutParams closeButParams = new RelativeLayout.LayoutParams(closeHeight2, closeHeight2);
                closeButParams.addRule(11);
                closeButParams.addRule(10);
                this.mraidCloseButton.setLayoutParams(closeButParams);
                Button button = this.mraidCloseButton;
                button.post(new SetCloseButtonTouchDelegateRunnable(this.mraidCloseButton, closeButParams.topMargin, closeButParams.leftMargin, closeButParams.bottomMargin, closeButParams.rightMargin));
            }
            if (this.webView == null) {
                this.webView = new WebView(activity);
            }
            this.webView.setId(200);
            RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-1, -1);
            if (titleBar != null) {
                layoutParams3.addRule(3, titleBar.getId());
            } else {
                layoutParams3.addRule(10);
            }
            if (this.navBar != null) {
                layoutParams3.addRule(2, this.navBar.getId());
            } else {
                layoutParams3.addRule(12);
            }
            this.webView.setLayoutParams(layoutParams3);
            this.webView.setWebViewClient(new OverlayWebViewClient(settings2));
            this.webView.addJavascriptInterface(new OverlayJSInterface(), "interface");
            WebSettings webSettings = this.webView.getSettings();
            webSettings.setJavaScriptEnabled(true);
            webSettings.setDefaultTextEncodingName("UTF-8");
            try {
                webSettings.getClass().getMethod("setLoadWithOverviewMode", new Class[]{Boolean.TYPE}).invoke(webSettings, new Object[]{true});
            } catch (Exception e) {
            }
            try {
                webSettings.getClass().getMethod("setGeolocationEnabled", new Class[]{Boolean.TYPE}).invoke(webSettings, new Object[]{true});
            } catch (Exception e2) {
            }
            final Activity activity2 = activity;
            final GestureDetector gestDetector = new GestureDetector(activity, new GestureDetector.SimpleOnGestureListener() {
                public boolean onSingleTapConfirmed(MotionEvent e) {
                    MMAdViewSDK.Event.overlayTap(activity2);
                    return false;
                }
            });
            this.webView.setOnTouchListener(new View.OnTouchListener() {
                public boolean onTouch(View v, MotionEvent event) {
                    gestDetector.onTouchEvent(event);
                    return false;
                }
            });
            if (this.settings.shouldMakeOverlayTransparent) {
                this.webView.setBackgroundColor(0);
                Class<WebView> cls = WebView.class;
                try {
                    cls.getMethod("setLayerType", new Class[]{Integer.TYPE, Paint.class}).invoke(this.webView, new Object[]{1, null});
                } catch (Exception e3) {
                }
                this.content.setBackgroundColor(0);
            } else {
                this.webView.setBackgroundColor(-1);
                this.content.setBackgroundColor(-1);
            }
            this.content.addView(this.webView);
            if (this.mraidCloseButton != null) {
                this.content.addView(this.mraidCloseButton);
            }
            if (!this.progressDone) {
                this.progressBar = new ProgressBar(activity);
                this.progressBar.setIndeterminate(true);
                this.progressBar.setVisibility(0);
                RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-2, -2);
                layoutParams4.addRule(13);
                this.content.addView(this.progressBar, layoutParams4);
            }
            if (nonConfigurationInstance == null) {
                animateView();
            }
            if (settings2.delayShowBottombar > 0) {
                this.viewHandler.postDelayed(new Runnable() {
                    public void run() {
                        AdViewOverlayView.this.settings.shouldShowBottomBar = true;
                        if (AdViewOverlayView.this.navBar != null) {
                            AdViewOverlayView.this.navBar.setVisibility(0);
                        }
                    }
                }, settings2.delayShowBottombar);
            }
            if (settings2.delayEnableBottombar > 0) {
                this.viewHandler.postDelayed(new Runnable() {
                    public void run() {
                        AdViewOverlayView.this.settings.shouldEnableBottomBar = true;
                        AdViewOverlayView.this.setCloseButtonListener(true);
                    }
                }, settings2.delayEnableBottombar);
            }
        }
    }

    /* access modifiers changed from: package-private */
    public void stopProgress() {
        if (!this.progressDone) {
            this.progressDone = true;
            this.progressBar.setVisibility(8);
            this.content.removeView(this.progressBar);
            this.progressBar = null;
        }
    }

    private class SetCloseButtonTouchDelegateRunnable implements Runnable {
        int bottom;
        private final Button closeButton;
        int left;
        int right;
        int top;

        SetCloseButtonTouchDelegateRunnable(Button closeButton2, int topMargin, int leftMargin, int bottomMargin, int rightMargin) {
            this.closeButton = closeButton2;
            this.top = topMargin;
            this.left = leftMargin;
            this.bottom = bottomMargin;
            this.right = rightMargin;
        }

        public void run() {
            Rect delegateArea = new Rect();
            this.closeButton.getHitRect(delegateArea);
            delegateArea.top += this.top;
            delegateArea.right += this.right;
            delegateArea.bottom += this.bottom;
            delegateArea.left += this.left;
            TouchDelegate expandedArea = new TouchDelegate(delegateArea, this.closeButton);
            if (View.class.isInstance(this.closeButton.getParent())) {
                ((View) this.closeButton.getParent()).setTouchDelegate(expandedArea);
            }
        }
    }

    private class BottomBarDrawable extends Drawable {
        protected final Paint paint = new Paint();

        public BottomBarDrawable() {
            this.paint.setStrokeWidth(1.0f);
            this.paint.setStyle(Paint.Style.STROKE);
        }

        public void draw(Canvas canvas) {
            Rect bounds = copyBounds();
            int startEndColor = Color.argb(MotionEventCompat.ACTION_MASK, 8, 8, 8);
            int middleColor = Color.argb(MotionEventCompat.ACTION_MASK, 50, 50, 50);
            int borderColor = Color.argb(MotionEventCompat.ACTION_MASK, 120, 120, 120);
            GradientDrawable gradient = new GradientDrawable(GradientDrawable.Orientation.BOTTOM_TOP, new int[]{middleColor, startEndColor});
            gradient.setBounds(bounds);
            gradient.draw(canvas);
            this.paint.setARGB(MotionEventCompat.ACTION_MASK, 0, 0, 0);
            canvas.drawLine((float) bounds.left, BitmapDescriptorFactory.HUE_RED, (float) bounds.right, BitmapDescriptorFactory.HUE_RED, this.paint);
            this.paint.setColor(borderColor);
            canvas.drawLine((float) bounds.left, 1.0f, (float) bounds.right, 1.0f, this.paint);
        }

        public int getOpacity() {
            return -3;
        }

        public void setAlpha(int alpha) {
        }

        public void setColorFilter(ColorFilter cf) {
        }
    }

    private class CloseDrawable extends Drawable {
        protected boolean enabled = true;
        protected final Paint paint;

        CloseDrawable(boolean enabled2) {
            this.enabled = enabled2;
            this.paint = new Paint();
            this.paint.setAntiAlias(true);
            this.paint.setStyle(Paint.Style.STROKE);
        }

        public void draw(Canvas canvas) {
            Rect bounds = copyBounds();
            int width = bounds.right - bounds.left;
            int height = bounds.bottom - bounds.top;
            float strokeWidth = ((float) width) / 6.0f;
            this.paint.setStrokeWidth(strokeWidth);
            int grayScale = this.enabled ? 255 : 80;
            this.paint.setARGB(MotionEventCompat.ACTION_MASK, grayScale, grayScale, grayScale);
            canvas.drawLine(strokeWidth / 2.0f, strokeWidth / 2.0f, ((float) width) - (strokeWidth / 2.0f), ((float) height) - (strokeWidth / 2.0f), this.paint);
            canvas.drawLine(((float) width) - (strokeWidth / 2.0f), strokeWidth / 2.0f, strokeWidth / 2.0f, ((float) height) - (strokeWidth / 2.0f), this.paint);
        }

        public int getOpacity() {
            return -3;
        }

        public void setAlpha(int alpha) {
        }

        public void setColorFilter(ColorFilter cf) {
        }
    }

    private class CloseTopDrawable extends CloseDrawable {
        final float dist;
        final float scale;

        CloseTopDrawable(boolean enabled, float scale2) {
            super(enabled);
            this.scale = scale2;
            this.dist = 4.0f * scale2;
            this.paint.setColor(-16777216);
        }

        public void draw(Canvas canvas) {
            Rect bounds = copyBounds();
            float strokeWidth = ((float) (bounds.right - bounds.left)) / 10.0f;
            float cx = ((float) bounds.right) - (this.scale * 20.0f);
            float cy = ((float) bounds.top) + (this.scale * 20.0f);
            this.paint.setStrokeWidth(strokeWidth);
            this.paint.setColor(-16777216);
            this.paint.setStyle(Paint.Style.STROKE);
            canvas.drawCircle(cx, cy, 12.0f * this.scale, this.paint);
            this.paint.setColor(-1);
            this.paint.setStyle(Paint.Style.FILL_AND_STROKE);
            canvas.drawCircle(cx, cy, this.scale * 10.0f, this.paint);
            this.paint.setColor(-16777216);
            canvas.drawCircle(cx, cy, 7.0f * this.scale, this.paint);
            this.paint.setColor(-1);
            this.paint.setStrokeWidth(strokeWidth / 2.0f);
            this.paint.setStyle(Paint.Style.STROKE);
            canvas.drawLine(cx - this.dist, cy - this.dist, cx + this.dist, cy + this.dist, this.paint);
            canvas.drawLine(cx + this.dist, cy - this.dist, cx - this.dist, cy + this.dist, this.paint);
        }
    }

    private void animateView() {
        if (this.settings.overlayTransition.equals("toptobottom")) {
            TranslateAnimation translateDown = new TranslateAnimation(1, BitmapDescriptorFactory.HUE_RED, 1, BitmapDescriptorFactory.HUE_RED, 1, -1.0f, 1, BitmapDescriptorFactory.HUE_RED);
            translateDown.setDuration(this.settings.transitionTime);
            translateDown.setAnimationListener(new Animation.AnimationListener() {
                public void onAnimationEnd(Animation arg0) {
                }

                public void onAnimationRepeat(Animation arg0) {
                }

                public void onAnimationStart(Animation arg0) {
                }
            });
            MMAdViewSDK.Log.v("Translate down");
            startAnimation(translateDown);
        } else if (this.settings.overlayTransition.equals("explode")) {
            ScaleAnimation scale = new ScaleAnimation(1.1f, 0.9f, 0.1f, 0.9f, 1, 0.5f, 1, 0.5f);
            scale.setDuration(this.settings.transitionTime);
            scale.setAnimationListener(new Animation.AnimationListener() {
                public void onAnimationEnd(Animation arg0) {
                }

                public void onAnimationRepeat(Animation arg0) {
                }

                public void onAnimationStart(Animation arg0) {
                }
            });
            MMAdViewSDK.Log.v("Explode");
            startAnimation(scale);
        } else if (!this.settings.overlayTransition.equals("none")) {
            TranslateAnimation translateUp = new TranslateAnimation(1, BitmapDescriptorFactory.HUE_RED, 1, BitmapDescriptorFactory.HUE_RED, 1, 1.0f, 1, BitmapDescriptorFactory.HUE_RED);
            translateUp.setDuration(this.settings.transitionTime);
            translateUp.setAnimationListener(new Animation.AnimationListener() {
                public void onAnimationEnd(Animation arg0) {
                }

                public void onAnimationRepeat(Animation arg0) {
                }

                public void onAnimationStart(Animation arg0) {
                }
            });
            MMAdViewSDK.Log.v("Translate up");
            startAnimation(translateUp);
        }
    }

    /* access modifiers changed from: package-private */
    public boolean goBack() {
        if (!this.webView.canGoBack()) {
            return false;
        }
        this.webView.goBack();
        return true;
    }

    /* access modifiers changed from: package-private */
    public void loadWebContent(String url) {
        this.overlayUrl = url;
        if (MMAdViewSDK.isConnected(getContext())) {
            this.webView.loadUrl(this.overlayUrl);
        } else {
            MMAdViewSDK.Log.e("No network available, can't load overlay.");
        }
    }

    /* access modifiers changed from: package-private */
    public void injectJS(String jsString) {
        this.webView.loadUrl(jsString);
    }

    /* access modifiers changed from: package-private */
    public Object getNonConfigurationInstance() {
        NonConfigurationInstance nonConfigurationInstance = new NonConfigurationInstance();
        this.webView.setWebViewClient((WebViewClient) null);
        ((ViewGroup) this.webView.getParent()).removeView(this.webView);
        if (this.navBar != null) {
            nonConfigurationInstance.bottomBarVisible = this.navBar.getVisibility() == 0;
            nonConfigurationInstance.bottomBarEnabled = this.navBar.isEnabled();
        }
        nonConfigurationInstance.progressDone = this.progressDone;
        nonConfigurationInstance.webView = this.webView;
        return nonConfigurationInstance;
    }

    /* access modifiers changed from: protected */
    public void setCloseButtonListener(boolean enabled) {
        if (this.navCloseButton == null) {
            return;
        }
        if (enabled) {
            this.navCloseButton.setBackgroundDrawable(new CloseDrawable(true));
            this.navCloseButton.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    MMAdViewSDK.Log.v("Close button clicked.");
                    AdViewOverlayView.this.dismiss(true);
                }
            });
            this.navCloseButton.setEnabled(true);
            return;
        }
        this.navCloseButton.setBackgroundDrawable(new CloseDrawable(false));
        this.navCloseButton.setEnabled(false);
    }

    /* access modifiers changed from: package-private */
    public void dismiss(boolean animated) {
        MMAdViewSDK.Log.d("Ad overlay closed");
        Activity activity = (Activity) getContext();
        if (activity != null) {
            if (animated) {
                AlphaAnimation animation = new AlphaAnimation(1.0f, BitmapDescriptorFactory.HUE_RED);
                animation.setAnimationListener(new Animation.AnimationListener() {
                    public void onAnimationStart(Animation animation) {
                        if (AdViewOverlayView.this.mraidCloseButton != null) {
                            AdViewOverlayView.this.mraidCloseButton.setVisibility(8);
                        }
                    }

                    public void onAnimationEnd(Animation animation) {
                        ((Activity) AdViewOverlayView.this.getContext()).finish();
                    }

                    public void onAnimationRepeat(Animation animation) {
                    }
                });
                animation.setFillEnabled(true);
                animation.setFillBefore(true);
                animation.setFillAfter(true);
                animation.setDuration(400);
                startAnimation(animation);
                return;
            }
            activity.finish();
        }
    }

    class OverlayJSInterface {
        OverlayJSInterface() {
        }

        public void shouldCloseOverlay() {
            AdViewOverlayView.this.viewHandler.sendEmptyMessage(2);
        }

        public void shouldVibrate(long milliseconds) {
            if (AdViewOverlayView.this.getContext().checkCallingOrSelfPermission("android.permission.VIBRATE") == 0) {
                ((Vibrator) AdViewOverlayView.this.getContext().getSystemService("vibrator")).vibrate(milliseconds);
            }
        }

        public void shouldEnableBottomBar(final boolean enabled) {
            if (AdViewOverlayView.this.settings.shouldEnableBottomBar) {
                MMAdViewSDK.Log.d("Should Enable Bottom Bar: %b", Boolean.valueOf(enabled));
                AdViewOverlayView.this.viewHandler.post(new Runnable() {
                    public void run() {
                        AdViewOverlayView.this.setCloseButtonListener(enabled);
                    }
                });
            }
        }

        public void shouldShowBottomBar(final boolean show) {
            if (AdViewOverlayView.this.settings.shouldShowBottomBar) {
                MMAdViewSDK.Log.d("Should show Bottom Bar: %b", Boolean.valueOf(show));
                AdViewOverlayView.this.viewHandler.post(new Runnable() {
                    public void run() {
                        if (AdViewOverlayView.this.navBar == null) {
                            return;
                        }
                        if (show) {
                            AdViewOverlayView.this.navBar.setVisibility(0);
                        } else {
                            AdViewOverlayView.this.navBar.setVisibility(8);
                        }
                    }
                });
            }
        }
    }

    final class OverlayWebViewClient extends MMWebViewClient {
        OverlayWebViewClient(OverlaySettings settings) {
            super(settings);
        }

        public void onPageStarted(WebView view, String urlString, Bitmap favicon) {
            VideoAd ad;
            MMAdViewSDK.Log.d("onPageStarted: %s", urlString);
            if (urlString != null) {
                Activity activity = (Activity) AdViewOverlayView.this.getContext();
                if (activity == null) {
                    MMAdViewSDK.Log.d("Activity is null. Returning from click");
                    return;
                }
                Uri destinationUri = Uri.parse(urlString);
                if (destinationUri != null && destinationUri.getScheme() != null && destinationUri.getScheme().equalsIgnoreCase("mmvideo")) {
                    String id = destinationUri.getHost();
                    if (!(id == null || (ad = (VideoAd) AdCache.load(activity, id)) == null || !ad.canShow(activity, (MMAdView) null, false))) {
                        ad.show(activity, (MMAdView) null);
                    }
                    AdViewOverlayView.this.webView.goBack();
                } else if (destinationUri.getScheme() == null || !destinationUri.getScheme().equalsIgnoreCase("http")) {
                    try {
                        Intent intent = HttpRedirection.getIntentFromUri(activity, destinationUri, (OverlaySettings) null);
                        if (intent != null) {
                            activity.startActivity(intent);
                            AdViewOverlayView.this.webView.stopLoading();
                            AdViewOverlayView.this.webView.goBack();
                            return;
                        }
                        MMAdViewSDK.Log.d("Uncertain about content. Stay in the overlay");
                        shouldShowAndEnableBottomBar();
                    } catch (ActivityNotFoundException e) {
                        MMAdViewSDK.Log.e(e.getMessage());
                    }
                } else if (destinationUri.getLastPathSegment() == null || (!destinationUri.getLastPathSegment().endsWith(".mp4") && !destinationUri.getLastPathSegment().endsWith(".3gp"))) {
                    shouldShowAndEnableBottomBar();
                } else {
                    MMAdViewSDK.Log.v("Creating video player intent.");
                    Intent intent2 = new Intent(activity, MMActivity.class);
                    intent2.setData(destinationUri);
                    intent2.putExtra("class", "com.millennialmedia.android.VideoPlayerActivity");
                    activity.startActivity(intent2);
                    MMAdViewSDK.Event.intentStarted(AdViewOverlayView.this.getContext(), (MMAdView) null, MMAdViewSDK.Event.INTENT_STREAMING_VIDEO);
                }
            }
        }

        public boolean shouldOverrideUrlLoading(WebView view, String urlString) {
            MMAdViewSDK.Log.d("shouldOverrideUrlLoading: %s", urlString);
            if (super.shouldOverrideUrlLoading(view, urlString)) {
                return true;
            }
            return false;
        }

        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            MMAdViewSDK.Log.e("Error: %s %s %s", Integer.valueOf(errorCode), description, failingUrl);
        }

        public void shouldShowAndEnableBottomBar() {
            if (this.settings.shouldShowBottomBar) {
                MMAdViewSDK.Log.v("Showing bottom bar");
                if (AdViewOverlayView.this.navBar != null) {
                    AdViewOverlayView.this.navBar.setVisibility(0);
                    if (this.settings.shouldEnableBottomBar) {
                        MMAdViewSDK.Log.v("Enabling bottom bar");
                        AdViewOverlayView.this.setCloseButtonListener(true);
                    }
                }
            }
        }

        public void onPageFinished(WebView view, String url) {
            if (!this.hasDoneMraidCalls) {
                this.hasDoneMraidCalls = true;
                AdViewOverlayView.this.webView.loadUrl("javascript:MMSDK.mraid.setPlacementType('interstitial');");
                if (AdViewOverlayView.this.hasWindowFocus()) {
                    AdViewOverlayView.this.webView.loadUrl("javascript:MMSDK.mraid.stateChange('expanded');");
                    AdViewOverlayView.this.webView.loadUrl("javascript:MMSDK.mraid.viewableChange(true)");
                } else {
                    AdViewOverlayView.this.webView.loadUrl("javascript:MMSDK.mraid.stateChange('hidden');");
                    AdViewOverlayView.this.webView.loadUrl("javascript:MMSDK.mraid.viewableChange(false)");
                }
                AdViewOverlayView.this.webView.loadUrl("javascript:MMSDK.mraid.ready();");
            }
            AdViewOverlayView.this.stopProgress();
            super.onPageFinished(view, url);
        }
    }

    public void onWindowFocusChanged(boolean windowInFocus) {
        super.onWindowFocusChanged(windowInFocus);
        if (windowInFocus) {
            this.webView.loadUrl("javascript:MMSDK.mraid.stateChange('expanded');");
            this.webView.loadUrl("javascript:MMSDK.mraid.viewableChange(true)");
            return;
        }
        this.webView.loadUrl("javascript:MMSDK.mraid.stateChange('hidden');");
        this.webView.loadUrl("javascript:MMSDK.mraid.viewableChange(false)");
    }
}
