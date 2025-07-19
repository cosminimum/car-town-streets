package com.mopub.mobileads;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Rect;
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
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class MraidDisplayController extends MraidAbstractController {
    private static final int CLOSE_BUTTON_SIZE_DP = 50;
    private static final String LOGTAG = "MraidDisplayController";
    private static final long VIEWABILITY_TIMER_MILLIS = 3000;
    private boolean mAdWantsCustomCloseButton;
    private ImageView mCloseButton;
    protected float mDensity;
    private final MraidView.ExpansionStyle mExpansionStyle;
    private boolean mIsViewable;
    private final MraidView.NativeCloseButtonStyle mNativeCloseButtonStyle;
    private final int mOriginalRequestedOrientation;
    FrameLayout mPlaceholderView;
    private FrameLayout mRootView;
    private MraidView mTwoPartExpansionView;
    private int mViewIndexInParent;
    private MraidView.ViewState mViewState = MraidView.ViewState.HIDDEN;
    private Runnable mCheckViewabilityTask = new Runnable() { // from class: com.mopub.mobileads.MraidDisplayController.1
        @Override // java.lang.Runnable
        public void run() {
            boolean currentViewable = MraidDisplayController.this.checkViewable();
            if (MraidDisplayController.this.mIsViewable != currentViewable) {
                MraidDisplayController.this.mIsViewable = currentViewable;
                MraidDisplayController.this.getView().fireChangeEventForProperty(MraidViewableProperty.createWithViewable(MraidDisplayController.this.mIsViewable));
            }
            MraidDisplayController.this.mHandler.postDelayed(this, MraidDisplayController.VIEWABILITY_TIMER_MILLIS);
        }
    };
    private Handler mHandler = new Handler();
    private BroadcastReceiver mOrientationBroadcastReceiver = new BroadcastReceiver() { // from class: com.mopub.mobileads.MraidDisplayController.2
        private int mLastRotation;

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            int orientation;
            String action = intent.getAction();
            if (action.equals("android.intent.action.CONFIGURATION_CHANGED") && (orientation = MraidDisplayController.this.getDisplayRotation()) != this.mLastRotation) {
                this.mLastRotation = orientation;
                MraidDisplayController.this.onOrientationChanged(this.mLastRotation);
            }
        }
    };
    protected int mScreenWidth = -1;
    protected int mScreenHeight = -1;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MraidDisplayController(MraidView view, MraidView.ExpansionStyle expStyle, MraidView.NativeCloseButtonStyle buttonStyle) {
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
        WindowManager wm = (WindowManager) context.getSystemService("window");
        wm.getDefaultDisplay().getMetrics(metrics);
        this.mDensity = metrics.density;
        int statusBarHeight = 0;
        int titleBarHeight = 0;
        if (context instanceof Activity) {
            Activity activity = (Activity) context;
            Window window = activity.getWindow();
            Rect rect = new Rect();
            window.getDecorView().getWindowVisibleDisplayFrame(rect);
            statusBarHeight = rect.top;
            int contentViewTop = window.findViewById(16908290).getTop();
            titleBarHeight = contentViewTop - statusBarHeight;
        }
        int widthPixels = metrics.widthPixels;
        int heightPixels = (metrics.heightPixels - statusBarHeight) - titleBarHeight;
        this.mScreenWidth = (int) (widthPixels * (160.0d / metrics.densityDpi));
        this.mScreenHeight = (int) (heightPixels * (160.0d / metrics.densityDpi));
    }

    private void initializeViewabilityTimer() {
        this.mHandler.removeCallbacks(this.mCheckViewabilityTask);
        this.mHandler.post(this.mCheckViewabilityTask);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getDisplayRotation() {
        WindowManager wm = (WindowManager) getView().getContext().getSystemService("window");
        return wm.getDefaultDisplay().getOrientation();
    }

    /* JADX INFO: Access modifiers changed from: private */
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

    /* JADX INFO: Access modifiers changed from: protected */
    public void initializeJavaScriptState() {
        ArrayList<MraidProperty> properties = new ArrayList<>();
        properties.add(MraidScreenSizeProperty.createWithSize(this.mScreenWidth, this.mScreenHeight));
        properties.add(MraidViewableProperty.createWithViewable(this.mIsViewable));
        getView().fireChangeEventForProperties(properties);
        this.mViewState = MraidView.ViewState.DEFAULT;
        getView().fireChangeEventForProperty(MraidStateProperty.createWithViewState(this.mViewState));
    }

    protected boolean isExpanded() {
        return this.mViewState == MraidView.ViewState.EXPANDED;
    }

    /* JADX INFO: Access modifiers changed from: protected */
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
        FrameLayout adContainerLayout = (FrameLayout) this.mRootView.findViewById(102);
        RelativeLayout expansionLayout = (RelativeLayout) this.mRootView.findViewById(101);
        setNativeCloseButtonEnabled(false);
        adContainerLayout.removeAllViewsInLayout();
        this.mRootView.removeView(expansionLayout);
        getView().requestLayout();
        ViewGroup parent = (ViewGroup) this.mPlaceholderView.getParent();
        parent.addView(getView(), this.mViewIndexInParent);
        parent.removeView(this.mPlaceholderView);
        parent.invalidate();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void expand(String url, int width, int height, boolean shouldUseCustomClose, boolean shouldLockOrientation) {
        if (this.mExpansionStyle != MraidView.ExpansionStyle.DISABLED) {
            if (url != null && !URLUtil.isValidUrl(url)) {
                getView().fireErrorEvent("expand", "URL passed to expand() was invalid.");
                return;
            }
            this.mRootView = (FrameLayout) getView().getRootView().findViewById(16908290);
            useCustomClose(shouldUseCustomClose);
            setOrientationLockEnabled(shouldLockOrientation);
            swapViewWithPlaceholderView();
            View expansionContentView = getView();
            if (url != null) {
                this.mTwoPartExpansionView = new MraidView(getView().getContext(), MraidView.ExpansionStyle.DISABLED, MraidView.NativeCloseButtonStyle.AD_CONTROLLED, MraidView.PlacementType.INLINE);
                this.mTwoPartExpansionView.setOnCloseListener(new MraidView.OnCloseListener() { // from class: com.mopub.mobileads.MraidDisplayController.3
                    @Override // com.mopub.mobileads.MraidView.OnCloseListener
                    public void onClose(MraidView view, MraidView.ViewState newViewState) {
                        MraidDisplayController.this.close();
                    }
                });
                this.mTwoPartExpansionView.loadUrl(url);
                expansionContentView = this.mTwoPartExpansionView;
            }
            ViewGroup expansionViewContainer = createExpansionViewContainer(expansionContentView, (int) (width * this.mDensity), (int) (height * this.mDensity));
            this.mRootView.addView(expansionViewContainer, new RelativeLayout.LayoutParams(-1, -1));
            if (this.mNativeCloseButtonStyle == MraidView.NativeCloseButtonStyle.ALWAYS_VISIBLE || (!this.mAdWantsCustomCloseButton && this.mNativeCloseButtonStyle != MraidView.NativeCloseButtonStyle.ALWAYS_HIDDEN)) {
                setNativeCloseButtonEnabled(true);
            }
            this.mViewState = MraidView.ViewState.EXPANDED;
            getView().fireChangeEventForProperty(MraidStateProperty.createWithViewState(this.mViewState));
            if (getView().getOnExpandListener() != null) {
                getView().getOnExpandListener().onExpand(getView());
            }
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
        dimmingView.setOnTouchListener(new View.OnTouchListener() { // from class: com.mopub.mobileads.MraidDisplayController.4
            @Override // android.view.View.OnTouchListener
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
        Context context = getView().getContext();
        try {
            Activity activity = (Activity) context;
            int requestedOrientation = enabled ? activity.getResources().getConfiguration().orientation : this.mOriginalRequestedOrientation;
            activity.setRequestedOrientation(requestedOrientation);
        } catch (ClassCastException e) {
            Log.d(LOGTAG, "Unable to modify device orientation.");
        }
    }

    protected void setNativeCloseButtonEnabled(boolean enabled) {
        if (this.mRootView != null) {
            FrameLayout adContainerLayout = (FrameLayout) this.mRootView.findViewById(102);
            if (enabled) {
                if (this.mCloseButton == null) {
                    StateListDrawable states = new StateListDrawable();
                    states.addState(new int[]{-16842919}, getView().getResources().getDrawable(R.drawable.close_button_normal));
                    states.addState(new int[]{16842919}, getView().getResources().getDrawable(R.drawable.close_button_pressed));
                    this.mCloseButton = new ImageButton(getView().getContext());
                    this.mCloseButton.setImageDrawable(states);
                    this.mCloseButton.setBackgroundDrawable(null);
                    this.mCloseButton.setOnClickListener(new View.OnClickListener() { // from class: com.mopub.mobileads.MraidDisplayController.5
                        @Override // android.view.View.OnClickListener
                        public void onClick(View v) {
                            MraidDisplayController.this.close();
                        }
                    });
                }
                int buttonSize = (int) ((50.0f * this.mDensity) + 0.5f);
                FrameLayout.LayoutParams buttonLayout = new FrameLayout.LayoutParams(buttonSize, buttonSize, 5);
                adContainerLayout.addView(this.mCloseButton, buttonLayout);
            } else {
                adContainerLayout.removeView(this.mCloseButton);
            }
            MraidView view = getView();
            if (view.getOnCloseButtonStateChangeListener() != null) {
                view.getOnCloseButtonStateChangeListener().onCloseButtonStateChange(view, enabled);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void useCustomClose(boolean shouldUseCustomCloseButton) {
        this.mAdWantsCustomCloseButton = shouldUseCustomCloseButton;
        MraidView view = getView();
        boolean enabled = !shouldUseCustomCloseButton;
        if (view.getOnCloseButtonStateChangeListener() != null) {
            view.getOnCloseButtonStateChangeListener().onCloseButtonStateChange(view, enabled);
        }
    }

    protected boolean checkViewable() {
        return true;
    }
}
