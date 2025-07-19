package com.mopub.mobileads;

import android.app.Activity;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.RelativeLayout;

public abstract class BaseActivity extends Activity {
    private static final float CLOSE_BUTTON_PADDING_DP = 8.0f;
    private static final float CLOSE_BUTTON_SIZE_DP = 50.0f;
    private ImageView mCloseButton;
    private RelativeLayout mLayout;

    public abstract View getAdView();

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        getWindow().addFlags(1024);
        this.mLayout = new RelativeLayout(this);
        RelativeLayout.LayoutParams adViewLayout = new RelativeLayout.LayoutParams(-1, -2);
        adViewLayout.addRule(13);
        this.mLayout.addView(getAdView(), adViewLayout);
        setContentView(this.mLayout);
        showInterstitialCloseButton();
    }

    /* access modifiers changed from: protected */
    public void showInterstitialCloseButton() {
        if (this.mCloseButton == null) {
            StateListDrawable states = new StateListDrawable();
            states.addState(new int[]{-16842919}, getResources().getDrawable(R.drawable.close_button_normal));
            states.addState(new int[]{16842919}, getResources().getDrawable(R.drawable.close_button_pressed));
            this.mCloseButton = new ImageButton(this);
            this.mCloseButton.setImageDrawable(states);
            this.mCloseButton.setBackgroundDrawable((Drawable) null);
            this.mCloseButton.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    BaseActivity.this.finish();
                }
            });
        }
        float scale = getResources().getDisplayMetrics().density;
        int buttonSize = (int) ((CLOSE_BUTTON_SIZE_DP * scale) + 0.5f);
        int buttonPadding = (int) ((CLOSE_BUTTON_PADDING_DP * scale) + 0.5f);
        RelativeLayout.LayoutParams buttonLayout = new RelativeLayout.LayoutParams(buttonSize, buttonSize);
        buttonLayout.addRule(11);
        buttonLayout.setMargins(buttonPadding, 0, buttonPadding, 0);
        this.mLayout.removeView(this.mCloseButton);
        this.mLayout.addView(this.mCloseButton, buttonLayout);
    }

    /* access modifiers changed from: protected */
    public void hideInterstitialCloseButton() {
        this.mLayout.removeView(this.mCloseButton);
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        this.mLayout.removeAllViews();
        super.onDestroy();
    }
}
