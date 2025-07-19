package com.miniclip.newsfeed;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.miniclip.nativeJNI.cocojava;
/* loaded from: classes.dex */
public class NewsfeedScreen extends RelativeLayout implements View.OnClickListener {
    protected Context mContext;
    private Handler mDisplayHandler = new Handler();
    private ImageView mNewsButton;
    public Newsfeed mNewsfeed;

    public NewsfeedScreen(Context context, String deviceID) {
        super(context);
        this.mContext = context;
        this.mNewsfeed = new Newsfeed(this.mContext, deviceID);
    }

    public void update() {
        removeAllViews();
        if (!((cocojava) this.mContext).isOnline()) {
            Log.i("Newsfeed", "Not online");
        } else if (this.mNewsfeed.update() < 1) {
            Log.i("Newsfeed", "0 messages");
        } else {
            displayButton();
        }
    }

    public void displayButton() {
        if (this.mNewsfeed.messagesNum < 1) {
            Log.i("Newsfeed", "0 messages");
            return;
        }
        int height = ((Activity) this.mContext).getResources().getDisplayMetrics().heightPixels;
        float scaleF = height / 480.0f;
        RelativeLayout.LayoutParams paramsnb = new RelativeLayout.LayoutParams((int) (200.0f * scaleF), (int) (50.0f * scaleF));
        paramsnb.addRule(12);
        this.mNewsButton = new ImageView(this.mContext);
        if (!cocojava.mBlockNewsButton) {
            int resourceId = this.mContext.getResources().getIdentifier("news1", "drawable", this.mContext.getPackageName());
            this.mNewsButton.setImageDrawable(this.mContext.getResources().getDrawable(resourceId));
            this.mNewsButton.setOnClickListener(this);
            this.mNewsButton.setLayoutParams(paramsnb);
            addView(this.mNewsButton);
        } else {
            this.mNewsButton.setVisibility(0);
        }
        if (checkNotified() == 1 || this.mNewsfeed.urgentItem != -1) {
        }
    }

    public void displayInSeconds(int seconds) {
        Runnable display = new Runnable() { // from class: com.miniclip.newsfeed.NewsfeedScreen.1
            @Override // java.lang.Runnable
            public void run() {
                Log.i("NewsfeedScreen", "displayInSeconds");
                cocojava.layout.addView(new NewsfeedDialog(NewsfeedScreen.this.mContext, NewsfeedScreen.this.mNewsfeed, false));
            }
        };
        this.mDisplayHandler.removeCallbacks(display);
        this.mDisplayHandler.postDelayed(display, seconds * 1000);
    }

    private int checkNotified() {
        SharedPreferences settings = this.mContext.getSharedPreferences(Newsfeed.PREFS_NAME_NOTIFIED, 0);
        String notified = settings.getString("notified", "false");
        settings.getInt("notified_id", 0);
        if (notified.equals("true")) {
            Context context = this.mContext;
            Context context2 = this.mContext;
            NotificationManager notifManager = (NotificationManager) context.getSystemService("notification");
            notifManager.cancel(Newsfeed.NOTIF_ID);
            SharedPreferences.Editor editor = this.mContext.getSharedPreferences(Newsfeed.PREFS_NAME_NOTIFIED, 0).edit();
            editor.putString("notified", "false");
            editor.putInt("notified_id", 0);
            editor.commit();
            return 1;
        }
        return 0;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (v == this.mNewsButton) {
            this.mNewsButton.setAlpha(100);
            removeAllViews();
            addView(new NewsfeedDialog(this.mContext, this.mNewsfeed, false));
        }
    }
}
