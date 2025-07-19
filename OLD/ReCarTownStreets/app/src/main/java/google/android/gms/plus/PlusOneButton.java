package google.android.gms.plus;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;

import com.google.android.gms.internal.eg;
import com.google.android.gms.internal.ej;
import com.google.android.gms.internal.ht;
import com.tapjoy.TapjoyConstants;

public final class PlusOneButton extends FrameLayout {
    public static final int ANNOTATION_BUBBLE = 1;
    public static final int ANNOTATION_INLINE = 2;
    public static final int ANNOTATION_NONE = 0;
    public static final int DEFAULT_ACTIVITY_REQUEST_CODE = -1;
    public static final int SIZE_MEDIUM = 1;
    public static final int SIZE_SMALL = 0;
    public static final int SIZE_STANDARD = 3;
    public static final int SIZE_TALL = 2;
    /* access modifiers changed from: private */
    public View DB;
    private int DC;
    /* access modifiers changed from: private */
    public int DD;
    private OnPlusOneClickListener DE;
    private String iH;
    private int mSize;

    protected class DefaultOnPlusOneClickListener implements OnClickListener, OnPlusOneClickListener {
        private final OnPlusOneClickListener DF;

        public DefaultOnPlusOneClickListener(OnPlusOneClickListener proxy) {
            this.DF = proxy;
        }

        public void onClick(View view) {
            Intent intent = (Intent) PlusOneButton.this.DB.getTag();
            if (this.DF != null) {
                this.DF.onPlusOneClick(intent);
            } else {
                onPlusOneClick(intent);
            }
        }

        public void onPlusOneClick(Intent intent) {
            Context context = PlusOneButton.this.getContext();
            if ((context instanceof Activity) && intent != null) {
                ((Activity) context).startActivityForResult(intent, PlusOneButton.this.DD);
            }
        }
    }

    public interface OnPlusOneClickListener {
        void onPlusOneClick(Intent intent);
    }

    public PlusOneButton(Context context) {
        this(context, (AttributeSet) null);
    }

    public PlusOneButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mSize = getSize(context, attrs);
        this.DC = getAnnotation(context, attrs);
        this.DD = -1;
        p(getContext());
        if (isInEditMode()) {
        }
    }

    protected static int getAnnotation(Context context, AttributeSet attrs) {
        String a = ej.a("http://schemas.android.com/apk/lib/com.google.android.gms.plus", "annotation", context, attrs, true, false, "PlusOneButton");
        if ("INLINE".equalsIgnoreCase(a)) {
            return 2;
        }
        return !"NONE".equalsIgnoreCase(a) ? 1 : 0;
    }

    protected static int getSize(Context context, AttributeSet attrs) {
        String a = ej.a("http://schemas.android.com/apk/lib/com.google.android.gms.plus", TapjoyConstants.TJC_DISPLAY_AD_SIZE, context, attrs, true, false, "PlusOneButton");
        if ("SMALL".equalsIgnoreCase(a)) {
            return 0;
        }
        if ("MEDIUM".equalsIgnoreCase(a)) {
            return 1;
        }
        return "TALL".equalsIgnoreCase(a) ? 2 : 3;
    }

    private void p(Context context) {
        if (this.DB != null) {
            removeView(this.DB);
        }
        this.DB = ht.a(context, this.mSize, this.DC, this.iH, this.DD);
        setOnPlusOneClickListener(this.DE);
        addView(this.DB);
    }

    public void initialize(String url, int activityRequestCode) {
        eg.a(getContext() instanceof Activity, "To use this method, the PlusOneButton must be placed in an Activity. Use initialize(PlusClient, String, OnPlusOneClickListener).");
        this.iH = url;
        this.DD = activityRequestCode;
        p(getContext());
    }

    public void initialize(String url, OnPlusOneClickListener plusOneClickListener) {
        this.iH = url;
        this.DD = 0;
        p(getContext());
        setOnPlusOneClickListener(plusOneClickListener);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        this.DB.layout(0, 0, right - left, bottom - top);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        View view = this.DB;
        measureChild(view, widthMeasureSpec, heightMeasureSpec);
        setMeasuredDimension(view.getMeasuredWidth(), view.getMeasuredHeight());
    }

    public void setAnnotation(int annotation) {
        this.DC = annotation;
        p(getContext());
    }

    public void setOnPlusOneClickListener(OnPlusOneClickListener listener) {
        this.DE = listener;
        this.DB.setOnClickListener(new DefaultOnPlusOneClickListener(listener));
    }

    public void setSize(int size) {
        this.mSize = size;
        p(getContext());
    }
}
