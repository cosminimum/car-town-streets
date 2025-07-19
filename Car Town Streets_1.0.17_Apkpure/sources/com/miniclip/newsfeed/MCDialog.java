package com.miniclip.newsfeed;

import android.app.Activity;
import android.content.Context;
import android.view.Display;
import android.view.View;
import android.widget.Button;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.RelativeLayout;
/* loaded from: classes.dex */
public class MCDialog extends RelativeLayout implements View.OnClickListener {
    protected ImageView mCloseButton;
    protected RelativeLayout mContentView;
    protected Context mContext;
    private RelativeLayout mDialogView;
    protected RelativeLayout mFullView;
    protected RelativeLayout mWindowView;

    public MCDialog(Context context) {
        super(context);
        this.mContext = context;
        RelativeLayout.LayoutParams paramsFull1 = new RelativeLayout.LayoutParams(-1, -1);
        this.mFullView = new RelativeLayout(this.mContext);
        this.mFullView.setLayoutParams(paramsFull1);
        this.mFullView.setOnClickListener(this);
        addView(this.mFullView);
        RelativeLayout.LayoutParams paramsFull2 = new RelativeLayout.LayoutParams(-1, -1);
        this.mDialogView = new RelativeLayout(this.mContext);
        this.mDialogView.setLayoutParams(paramsFull2);
        this.mFullView.addView(this.mDialogView);
        RelativeLayout.LayoutParams paramsFull3 = new RelativeLayout.LayoutParams(-1, -1);
        this.mWindowView = new RelativeLayout(this.mContext);
        this.mWindowView.setLayoutParams(paramsFull3);
        this.mWindowView.setPadding(25, 25, 25, 10);
        this.mDialogView.addView(this.mWindowView);
        Button i = new Button(this.mContext);
        int resourceId = this.mContext.getResources().getIdentifier("full_dialog1", "drawable", this.mContext.getPackageName());
        i.setBackgroundResource(resourceId);
        i.setLayoutParams(new Gallery.LayoutParams(-1, -1));
        this.mWindowView.addView(i);
        Display display = ((Activity) this.mContext).getWindowManager().getDefaultDisplay();
        int width = display.getWidth();
        int height = display.getHeight();
        RelativeLayout.LayoutParams paramsContent1 = new RelativeLayout.LayoutParams(width - 100, height - 50);
        paramsContent1.addRule(13);
        this.mContentView = new RelativeLayout(this.mContext);
        this.mContentView.setLayoutParams(paramsContent1);
        this.mFullView.addView(this.mContentView);
        RelativeLayout.LayoutParams paramsRight1 = new RelativeLayout.LayoutParams(-2, -2);
        paramsRight1.addRule(11);
        this.mCloseButton = new ImageView(this.mContext);
        int resourceId2 = this.mContext.getResources().getIdentifier("close_button", "drawable", this.mContext.getPackageName());
        this.mCloseButton.setImageDrawable(this.mContext.getResources().getDrawable(resourceId2));
        this.mCloseButton.setLayoutParams(paramsRight1);
        this.mFullView.addView(this.mCloseButton);
        this.mCloseButton.setOnClickListener(this);
    }

    public void onClick(View v) {
        if (v == this.mCloseButton) {
            removeAllViews();
        }
    }
}
