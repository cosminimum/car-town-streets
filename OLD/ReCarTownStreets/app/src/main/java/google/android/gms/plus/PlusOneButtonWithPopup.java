package google.android.gms.plus;

import android.app.PendingIntent;
import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import com.google.android.gms.internal.eg;
import com.google.android.gms.internal.hq;
import com.google.android.gms.internal.ht;

public final class PlusOneButtonWithPopup extends ViewGroup {
    private View DB;
    private int DC;
    private OnClickListener DH;
    private String iH;
    private String jG;
    private int mSize;

    public PlusOneButtonWithPopup(Context context) {
        this(context, (AttributeSet) null);
    }

    public PlusOneButtonWithPopup(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mSize = PlusOneButton.getSize(context, attrs);
        this.DC = PlusOneButton.getAnnotation(context, attrs);
        this.DB = new PlusOneDummyView(context, this.mSize);
        addView(this.DB);
    }

    private int c(int i, int i2) {
        int mode = MeasureSpec.getMode(i);
        switch (mode) {
            case Integer.MIN_VALUE:
            case 1073741824:
                return MeasureSpec.makeMeasureSpec(MeasureSpec.getSize(i) - i2, mode);
            default:
                return i;
        }
    }

    private void eL() {
        if (this.DB != null) {
            removeView(this.DB);
        }
        this.DB = ht.a(getContext(), this.mSize, this.DC, this.iH, this.jG);
        if (this.DH != null) {
            setOnClickListener(this.DH);
        }
        addView(this.DB);
    }

    private hq eM() throws RemoteException {
        hq aw = hq.a.aw((IBinder) this.DB.getTag());
        if (aw != null) {
            return aw;
        }
        if (Log.isLoggable("PlusOneButtonWithPopup", 5)) {
            Log.w("PlusOneButtonWithPopup", "Failed to get PlusOneDelegate");
        }
        throw new RemoteException();
    }

    public void cancelClick() {
        if (this.DB != null) {
            try {
                eM().cancelClick();
            } catch (RemoteException e) {
            }
        }
    }

    public PendingIntent getResolution() {
        if (this.DB != null) {
            try {
                return eM().getResolution();
            } catch (RemoteException e) {
            }
        }
        return null;
    }

    public void initialize(String url, String accountName) {
        eg.b(url, (Object) "Url must not be null");
        this.iH = url;
        this.jG = accountName;
        eL();
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        this.DB.layout(getPaddingLeft(), getPaddingTop(), (right - left) - getPaddingRight(), (bottom - top) - getPaddingBottom());
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int paddingLeft = getPaddingLeft() + getPaddingRight();
        int paddingTop = getPaddingTop() + getPaddingBottom();
        this.DB.measure(c(widthMeasureSpec, paddingLeft), c(heightMeasureSpec, paddingTop));
        setMeasuredDimension(paddingLeft + this.DB.getMeasuredWidth(), paddingTop + this.DB.getMeasuredHeight());
    }

    public void reinitialize() {
        if (this.DB != null) {
            try {
                eM().reinitialize();
            } catch (RemoteException e) {
            }
        }
    }

    public void setAnnotation(int annotation) {
        this.DC = annotation;
        eL();
    }

    public void setOnClickListener(OnClickListener onClickListener) {
        this.DH = onClickListener;
        this.DB.setOnClickListener(onClickListener);
    }

    public void setSize(int size) {
        this.mSize = size;
        eL();
    }
}
