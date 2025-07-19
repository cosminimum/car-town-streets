package com.mopub.mobileads;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Handler;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.URLUtil;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.mopub.mobileads.MraidView;
import java.util.ArrayList;

class MraidDisplayController extends MraidAbstractController {
    private static final int CLOSE_BUTTON_SIZE_DP = 50;
    private static final String LOGTAG = "MraidDisplayController";
    private static final long VIEWABILITY_TIMER_MILLIS = 3000;
    private boolean mAdWantsCustomCloseButton;
    private Runnable mCheckViewabilityTask = new Runnable() {
        public void run() {
            boolean currentViewable = MraidDisplayController.this.checkViewable();
            if (MraidDisplayController.this.mIsViewable != currentViewable) {
                boolean unused = MraidDisplayController.this.mIsViewable = currentViewable;
                MraidDisplayController.this.getView().fireChangeEventForProperty(MraidViewableProperty.createWithViewable(MraidDisplayController.this.mIsViewable));
            }
            MraidDisplayController.this.mHandler.postDelayed(this, MraidDisplayController.VIEWABILITY_TIMER_MILLIS);
        }
    };
    private ImageView mCloseButton;
    protected float mDensity;
    private final MraidView.ExpansionStyle mExpansionStyle;
    /* access modifiers changed from: private */
    public Handler mHandler = new Handler();
    /* access modifiers changed from: private */
    public boolean mIsViewable;
    private final MraidView.NativeCloseButtonStyle mNativeCloseButtonStyle;
    private BroadcastReceiver mOrientationBroadcastReceiver = new BroadcastReceiver() {
        private int mLastRotation;

        public void onReceive(Context context, Intent intent) {
            int orientation;
            if (intent.getAction().equals("android.intent.action.CONFIGURATION_CHANGED") && (orientation = MraidDisplayController.this.getDisplayRotation()) != this.mLastRotation) {
                this.mLastRotation = orientation;
                MraidDisplayController.this.onOrientationChanged(this.mLastRotation);
            }
        }
    };
    private final int mOriginalRequestedOrientation;
    FrameLayout mPlaceholderView;
    private FrameLayout mRootView;
    protected int mScreenHeight = -1;
    protected int mScreenWidth = -1;
    private MraidView mTwoPartExpansionView;
    private int mViewIndexInParent;
    private MraidView.ViewState mViewState = MraidView.ViewState.HIDDEN;

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    MraidDisplayController(MraidView view, MraidView.ExpansionStyle expStyle, MraidView.NativeCloseButtonStyle buttonStyle) {
        super(view);
        int i = -1;
        this.mExpansionStyle = expStyle;
        this.mNativeCloseButtonStyle = buttonStyle;
        Context context = getView().getContext();
        this.mOriginalRequestedOrientation = context instanceof Activity ? ((Activity) context).getRequestedOrientation() : i;
        initialize();
    }

    private void initialize() {
        this.mViewState = MraidView.ViewState.LOADING;
        initializeScreenMetrics();
        initializeViewabilityTimer();
        getView().getContext().registerReceiver(this.mOrientationBroadcastReceiver, new IntentFilter("android.intent.action.CONFIGURATION_CHANGED"));
    }

    private void initializeScreenMetrics() {
        Context context = getView().getContext();
        DisplayMetrics metrics = new DisplayMetrics();
        ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getMetrics(metrics);
        this.mDensity = metrics.density;
        int statusBarHeight = 0;
        int titleBarHeight = 0;
        if (context instanceof Activity) {
            Window window = ((Activity) context).getWindow();
            Rect rect = new Rect();
            window.getDecorView().getWindowVisibleDisplayFrame(rect);
            statusBarHeight = rect.top;
            titleBarHeight = window.findViewById(16908290).getTop() - statusBarHeight;
        }
        int widthPixels = metrics.widthPixels;
        int heightPixels = (metrics.heightPixels - statusBarHeight) - titleBarHeight;
        this.mScreenWidth = (int) (((double) widthPixels) * (160.0d / ((double) metrics.densityDpi)));
        this.mScreenHeight = (int) (((double) heightPixels) * (160.0d / ((double) metrics.densityDpi)));
    }

    private void initializeViewabilityTimer() {
        this.mHandler.removeCallbacks(this.mCheckViewabilityTask);
        this.mHandler.post(this.mCheckViewabilityTask);
    }

    /* access modifiers changed from: private */
    public int getDisplayRotation() {
        return ((WindowManager) getView().getContext().getSystemService("window")).getDefaultDisplay().getOrientation();
    }

    /* access modifiers changed from: private */
    public void onOrientationChanged(int currentRotation) {
        initializeScreenMetrics();
        getView().fireChangeEventForProperty(MraidScreenSizeProperty.createWithSize(this.mScreenWidth, this.mScreenHeight));
    }

    public void destroy() {
        this.mHandler.removeCallbacks(this.mCheckViewabilityTask);
        try {
            getView().getContext().unregisterReceiver(this.mOrientationBroadcastReceiver);
        } catch (IllegalArgumentException e) {
            if (!e.getMessage().contains("Receiver not registered")) {
                throw e;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void initializeJavaScriptState() {
        ArrayList<MraidProperty> properties = new ArrayList<>();
        properties.add(MraidScreenSizeProperty.createWithSize(this.mScreenWidth, this.mScreenHeight));
        properties.add(MraidViewableProperty.createWithViewable(this.mIsViewable));
        getView().fireChangeEventForProperties(properties);
        this.mViewState = MraidView.ViewState.DEFAULT;
        getView().fireChangeEventForProperty(MraidStateProperty.createWithViewState(this.mViewState));
    }

    /* access modifiers changed from: protected */
    public boolean isExpanded() {
        return this.mViewState == MraidView.ViewState.EXPANDED;
    }

    /* access modifiers changed from: protected */
    public void close() {
        if (this.mViewState == MraidView.ViewState.EXPANDED) {
            resetViewToDefaultState();
            setOrientationLockEnabled(false);
            this.mViewState = MraidView.ViewState.DEFAULT;
            getView().fireChangeEventForProperty(MraidStateProperty.createWithViewState(this.mViewState));
        } else if (this.mViewState == MraidView.ViewState.DEFAULT) {
            getView().setVisibility(4);
            this.mViewState = MraidView.ViewState.HIDDEN;
            getView().fireChangeEventForProperty(MraidStateProperty.createWithViewState(this.mViewState));
        }
        if (getView().getOnCloseListener() != null) {
            getView().getOnCloseListener().onClose(getView(), this.mViewState);
        }
    }

    private void resetViewToDefaultState() {
        setNativeCloseButtonEnabled(false);
        ((FrameLayout) this.mRootView.findViewById(102)).removeAllViewsInLayout();
        this.mRootView.removeView((RelativeLayout) this.mRootView.findViewById(101));
        getView().requestLayout();
        ViewGroup parent = (ViewGroup) this.mPlaceholderView.getParent();
        parent.addView(getView(), this.mViewIndexInParent);
        parent.removeView(this.mPlaceholderView);
        parent.invalidate();
    }

    /* access modifiers changed from: protected */
    public void expand(String url, int width, int height, boolean shouldUseCustomClose, boolean shouldLockOrientation) {
        if (this.mExpansionStyle != MraidView.ExpansionStyle.DISABLED) {
            if (url == null || URLUtil.isValidUrl(url)) {
                this.mRootView = (FrameLayout) getView().getRootView().findViewById(16908290);
                useCustomClose(shouldUseCustomClose);
                setOrientationLockEnabled(shouldLockOrientation);
                swapViewWithPlaceholderView();
                View expansionContentView = getView();
                if (url != null) {
                    this.mTwoPartExpansionView = new MraidView(getView().getContext(), MraidView.ExpansionStyle.DISABLED, MraidView.NativeCloseButtonStyle.AD_CONTROLLED, MraidView.PlacementType.INLINE);
                    this.mTwoPartExpansionView.setOnCloseListener(new MraidView.OnCloseListener() {
                        public void onClose(MraidView view, MraidView.ViewState newViewState) {
                            MraidDisplayController.this.close();
                        }
                    });
                    this.mTwoPartExpansionView.loadUrl(url);
                    expansionContentView = this.mTwoPartExpansionView;
                }
                this.mRootView.addView(createExpansionViewContainer(expansionContentView, (int) (((float) width) * this.mDensity), (int) (((float) height) * this.mDensity)), new RelativeLayout.LayoutParams(-1, -1));
                if (this.mNativeCloseButtonStyle == MraidView.NativeCloseButtonStyle.ALWAYS_VISIBLE || (!this.mAdWantsCustomCloseButton && this.mNativeCloseButtonStyle != MraidView.NativeCloseButtonStyle.ALWAYS_HIDDEN)) {
                    setNativeCloseButtonEnabled(true);
                }
                this.mViewState = MraidView.ViewState.EXPANDED;
                getView().fireChangeEventForProperty(MraidStateProperty.createWithViewState(this.mViewState));
                if (getView().getOnExpandListener() != null) {
                    getView().getOnExpandListener().onExpand(getView());
                    return;
                }
                return;
            }
            getView().fireErrorEvent("expand", "URL passed to expand() was invalid.");
        }
    }

    private void swapViewWithPlaceholderView() {
        ViewGroup parent = (ViewGroup) getView().getParent();
        if (parent != null) {
            this.mPlaceholderView = new FrameLayout(getView().getContext());
            int count = parent.getChildCount();
            int index = 0;
            while (index < count && parent.getChildAt(index) != getView()) {
                index++;
            }
            this.mViewIndexInParent = index;
            parent.addView(this.mPlaceholderView, index, new ViewGroup.LayoutParams(getView().getWidth(), getView().getHeight()));
            parent.removeView(getView());
        }
    }

    private ViewGroup createExpansionViewContainer(View expansionContentView, int expandWidth, int expandHeight) {
        int closeButtonSize = (int) ((50.0f * this.mDensity) + 0.5f);
        if (expandWidth < closeButtonSize) {
            expandWidth = closeButtonSize;
        }
        if (expandHeight < closeButtonSize) {
            expandHeight = closeButtonSize;
        }
        RelativeLayout expansionLayout = new RelativeLayout(getView().getContext());
        expansionLayout.setId(101);
        View dimmingView = new View(getView().getContext());
        dimmingView.setBackgroundColor(0);
        dimmingView.setOnTouchListener(new View.OnTouchListener() {
            public boolean onTouch(View v, MotionEvent event) {
                return true;
            }
        });
        expansionLayout.addView(dimmingView, new RelativeLayout.LayoutParams(-1, -1));
        FrameLayout adContainerLayout = new FrameLayout(getView().getContext());
        adContainerLayout.setId(102);
        adContainerLayout.addView(expansionContentView, new RelativeLayout.LayoutParams(-1, -1));
        RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(expandWidth, expandHeight);
        lp.addRule(13);
        expansionLayout.addView(adContainerLayout, lp);
        return expansionLayout;
    }

    private void setOrientationLockEnabled(boolean enabled) {
        try {
            Activity activity = (Activity) getView().getContext();
            activity.setRequestedOrientation(enabled ? activity.getResources().getConfiguration().orientation : this.mOriginalRequestedOrientation);
        } catch (ClassCastException e) {
            Log.d(LOGTAG, "Unable to modify device orientation.");
        }
    }

    /* access modifiers changed from: protected */
    public void setNativeCloseButtonEnabled(boolean enabled) {
        if (this.mRootView != null) {
            FrameLayout adContainerLayout = (FrameLayout) this.mRootView.findViewById(102);
            if (enabled) {
                if (this.mCloseButton == null) {
                    StateListDrawable states = new StateListDrawable();
                    states.addState(new int[]{-16842919}, getView().getResources().getDrawable(R.drawable.close_button_normal));
                    states.addState(new int[]{16842919}, getView().getResources().getDrawable(R.drawable.close_button_pressed));
                    this.mCloseButton = new ImageButton(getView().getContext());
                    this.mCloseButton.setImageDrawable(states);
                    this.mCloseButton.setBackgroundDrawable((Drawable) null);
                    this.mCloseButton.setOnClickListener(new View.OnClickListener() {
                        public void onClick(View v) {
                            MraidDisplayController.this.close();
                        }
                    });
                }
                int buttonSize = (int) ((50.0f * this.mDensity) + 0.5f);
                adContainerLayout.addView(this.mCloseButton, new FrameLayout.LayoutParams(buttonSize, buttonSize, 5));
            } else {
                adContainerLayout.removeView(this.mCloseButton);
            }
            MraidView view = getView();
            if (view.getOnCloseButtonStateChangeListener() != null) {
                view.getOnCloseButtonStateChangeListener().onCloseButtonStateChange(view, enabled);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void useCustomClose(boolean shouldUseCustomCloseButton) {
        this.mAdWantsCustomCloseButton = shouldUseCustomCloseButton;
        MraidView view = getView();
        boolean enabled = !shouldUseCustomCloseButton;
        if (view.getOnCloseButtonStateChangeListener() != null) {
            view.getOnCloseButtonStateChangeListener().onCloseButtonStateChange(view, enabled);
        }
    }

    /* access modifiers changed from: protected */
    public boolean checkViewable() {
        return true;
    }
}
