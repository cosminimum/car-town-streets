package com.miniclip.nativeJNI;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.Display;
import android.view.View;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.miniclip.newsfeed.MCDialog;
/* loaded from: classes.dex */
public class MiniclipUpsellView extends MCDialog implements View.OnClickListener {
    private ImageView mGameImage = new ImageView(this.mContext);
    private ImageView mGotoButton = new ImageView(this.mContext);

    public MiniclipUpsellView(Context context) {
        super(context);
        Display display = ((Activity) this.mContext).getWindowManager().getDefaultDisplay();
        int width = display.getWidth();
        int height = display.getHeight();
        float scaleF = width / 854.0f;
        float scaleH = width / height;
        float f = (scaleH - 1.33f) * 2.2f;
        int resourceId = this.mContext.getResources().getIdentifier(((cocojava) this.mContext).getFullVersionGameImageId(), "drawable", this.mContext.getPackageName());
        this.mGameImage.setImageDrawable(this.mContext.getResources().getDrawable(resourceId));
        this.mGameImage.setLayoutParams(new Gallery.LayoutParams(-1, -1));
        this.mContentView.addView(this.mGameImage);
        RelativeLayout.LayoutParams paramsCenter1 = new RelativeLayout.LayoutParams((int) (302.0f * scaleF), (int) (73.0f * scaleF));
        paramsCenter1.addRule(14);
        paramsCenter1.addRule(12);
        int resourceId2 = this.mContext.getResources().getIdentifier("get_it_now_button", "drawable", this.mContext.getPackageName());
        this.mGotoButton.setImageDrawable(this.mContext.getResources().getDrawable(resourceId2));
        this.mGotoButton.setLayoutParams(paramsCenter1);
        this.mContentView.addView(this.mGotoButton);
        this.mGotoButton.setOnClickListener(this);
    }

    @Override // com.miniclip.newsfeed.MCDialog, android.view.View.OnClickListener
    public void onClick(View v) {
        super.onClick(v);
        if (v == this.mGotoButton) {
            removeAllViews();
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(((cocojava) this.mContext).getFullAppURI()));
            this.mContext.startActivity(intent);
        } else if (v == this.mCloseButton) {
            removeAllViews();
        }
    }
}
