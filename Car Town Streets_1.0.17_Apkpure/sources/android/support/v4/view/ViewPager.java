package android.support.v4.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.support.v4.os.ParcelableCompat;
import android.support.v4.os.ParcelableCompatCreatorCallbacks;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.widget.EdgeEffectCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Interpolator;
import android.widget.Scroller;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.millennialmedia.android.MMError;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
/* loaded from: classes.dex */
public class ViewPager extends ViewGroup {
    private static final int CLOSE_ENOUGH = 2;
    private static final boolean DEBUG = false;
    private static final int DEFAULT_GUTTER_SIZE = 16;
    private static final int DEFAULT_OFFSCREEN_PAGES = 1;
    private static final int INVALID_POINTER = -1;
    private static final int MAX_SETTLE_DURATION = 600;
    private static final int MIN_DISTANCE_FOR_FLING = 25;
    public static final int SCROLL_STATE_DRAGGING = 1;
    public static final int SCROLL_STATE_IDLE = 0;
    public static final int SCROLL_STATE_SETTLING = 2;
    private static final String TAG = "ViewPager";
    private static final boolean USE_CACHE = false;
    private PagerAdapter mAdapter;
    private OnAdapterChangeListener mAdapterChangeListener;
    private int mBottomPageBounds;
    private boolean mCalledSuper;
    private int mChildHeightMeasureSpec;
    private int mChildWidthMeasureSpec;
    private int mCloseEnough;
    private int mCurItem;
    private int mDecorChildCount;
    private int mDefaultGutterSize;
    private long mFakeDragBeginTime;
    private boolean mFakeDragging;
    private int mFlingDistance;
    private int mGutterSize;
    private boolean mIgnoreGutter;
    private boolean mInLayout;
    private float mInitialMotionX;
    private OnPageChangeListener mInternalPageChangeListener;
    private boolean mIsBeingDragged;
    private boolean mIsUnableToDrag;
    private float mLastMotionX;
    private float mLastMotionY;
    private EdgeEffectCompat mLeftEdge;
    private Drawable mMarginDrawable;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    private PagerObserver mObserver;
    private OnPageChangeListener mOnPageChangeListener;
    private int mPageMargin;
    private boolean mPopulatePending;
    private EdgeEffectCompat mRightEdge;
    private Scroller mScroller;
    private boolean mScrollingCacheEnabled;
    private int mTopPageBounds;
    private int mTouchSlop;
    private VelocityTracker mVelocityTracker;
    private static final int[] LAYOUT_ATTRS = {16842931};
    private static final Comparator<ItemInfo> COMPARATOR = new Comparator<ItemInfo>() { // from class: android.support.v4.view.ViewPager.1
        @Override // java.util.Comparator
        public int compare(ItemInfo lhs, ItemInfo rhs) {
            return lhs.position - rhs.position;
        }
    };
    private static final Interpolator sInterpolator = new Interpolator() { // from class: android.support.v4.view.ViewPager.2
        @Override // android.animation.TimeInterpolator
        public float getInterpolation(float t) {
            float t2 = t - 1.0f;
            return (t2 * t2 * t2 * t2 * t2) + 1.0f;
        }
    };
    private final ArrayList<ItemInfo> mItems = new ArrayList<>();
    private final ItemInfo mTempItem = new ItemInfo();
    private final Rect mTempRect = new Rect();
    private int mRestoredCurItem = -1;
    private Parcelable mRestoredAdapterState = null;
    private ClassLoader mRestoredClassLoader = null;
    private float mFirstOffset = -3.4028235E38f;
    private float mLastOffset = Float.MAX_VALUE;
    private int mOffscreenPageLimit = 1;
    private int mActivePointerId = -1;
    private boolean mFirstLayout = true;
    private boolean mNeedCalculatePageOffsets = false;
    private int mScrollState = 0;

    /* loaded from: classes.dex */
    interface Decor {
    }

    /* loaded from: classes.dex */
    interface OnAdapterChangeListener {
        void onAdapterChanged(PagerAdapter pagerAdapter, PagerAdapter pagerAdapter2);
    }

    /* loaded from: classes.dex */
    public interface OnPageChangeListener {
        void onPageScrollStateChanged(int i);

        void onPageScrolled(int i, float f, int i2);

        void onPageSelected(int i);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class ItemInfo {
        Object object;
        float offset;
        int position;
        boolean scrolling;
        float widthFactor;

        ItemInfo() {
        }
    }

    /* loaded from: classes.dex */
    public static class SimpleOnPageChangeListener implements OnPageChangeListener {
        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageSelected(int position) {
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageScrollStateChanged(int state) {
        }
    }

    public ViewPager(Context context) {
        super(context);
        initViewPager();
    }

    public ViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
        initViewPager();
    }

    void initViewPager() {
        setWillNotDraw(false);
        setDescendantFocusability(262144);
        setFocusable(true);
        Context context = getContext();
        this.mScroller = new Scroller(context, sInterpolator);
        ViewConfiguration configuration = ViewConfiguration.get(context);
        this.mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(configuration);
        this.mMinimumVelocity = configuration.getScaledMinimumFlingVelocity();
        this.mMaximumVelocity = configuration.getScaledMaximumFlingVelocity();
        this.mLeftEdge = new EdgeEffectCompat(context);
        this.mRightEdge = new EdgeEffectCompat(context);
        float density = context.getResources().getDisplayMetrics().density;
        this.mFlingDistance = (int) (25.0f * density);
        this.mCloseEnough = (int) (2.0f * density);
        this.mDefaultGutterSize = (int) (16.0f * density);
        ViewCompat.setAccessibilityDelegate(this, new MyAccessibilityDelegate());
        if (ViewCompat.getImportantForAccessibility(this) == 0) {
            ViewCompat.setImportantForAccessibility(this, 1);
        }
    }

    private void setScrollState(int newState) {
        if (this.mScrollState != newState) {
            this.mScrollState = newState;
            if (this.mOnPageChangeListener != null) {
                this.mOnPageChangeListener.onPageScrollStateChanged(newState);
            }
        }
    }

    public void setAdapter(PagerAdapter adapter) {
        if (this.mAdapter != null) {
            this.mAdapter.unregisterDataSetObserver(this.mObserver);
            this.mAdapter.startUpdate((ViewGroup) this);
            for (int i = 0; i < this.mItems.size(); i++) {
                ItemInfo ii = this.mItems.get(i);
                this.mAdapter.destroyItem((ViewGroup) this, ii.position, ii.object);
            }
            this.mAdapter.finishUpdate((ViewGroup) this);
            this.mItems.clear();
            removeNonDecorViews();
            this.mCurItem = 0;
            scrollTo(0, 0);
        }
        PagerAdapter oldAdapter = this.mAdapter;
        this.mAdapter = adapter;
        if (this.mAdapter != null) {
            if (this.mObserver == null) {
                this.mObserver = new PagerObserver();
            }
            this.mAdapter.registerDataSetObserver(this.mObserver);
            this.mPopulatePending = false;
            this.mFirstLayout = true;
            if (this.mRestoredCurItem >= 0) {
                this.mAdapter.restoreState(this.mRestoredAdapterState, this.mRestoredClassLoader);
                setCurrentItemInternal(this.mRestoredCurItem, false, true);
                this.mRestoredCurItem = -1;
                this.mRestoredAdapterState = null;
                this.mRestoredClassLoader = null;
            } else {
                populate();
            }
        }
        if (this.mAdapterChangeListener != null && oldAdapter != adapter) {
            this.mAdapterChangeListener.onAdapterChanged(oldAdapter, adapter);
        }
    }

    private void removeNonDecorViews() {
        int i = 0;
        while (i < getChildCount()) {
            View child = getChildAt(i);
            LayoutParams lp = (LayoutParams) child.getLayoutParams();
            if (!lp.isDecor) {
                removeViewAt(i);
                i--;
            }
            i++;
        }
    }

    public PagerAdapter getAdapter() {
        return this.mAdapter;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setOnAdapterChangeListener(OnAdapterChangeListener listener) {
        this.mAdapterChangeListener = listener;
    }

    public void setCurrentItem(int item) {
        this.mPopulatePending = false;
        setCurrentItemInternal(item, !this.mFirstLayout, false);
    }

    public void setCurrentItem(int item, boolean smoothScroll) {
        this.mPopulatePending = false;
        setCurrentItemInternal(item, smoothScroll, false);
    }

    public int getCurrentItem() {
        return this.mCurItem;
    }

    void setCurrentItemInternal(int item, boolean smoothScroll, boolean always) {
        setCurrentItemInternal(item, smoothScroll, always, 0);
    }

    void setCurrentItemInternal(int item, boolean smoothScroll, boolean always, int velocity) {
        boolean dispatchSelected = true;
        if (this.mAdapter == null || this.mAdapter.getCount() <= 0) {
            setScrollingCacheEnabled(false);
        } else if (!always && this.mCurItem == item && this.mItems.size() != 0) {
            setScrollingCacheEnabled(false);
        } else {
            if (item < 0) {
                item = 0;
            } else if (item >= this.mAdapter.getCount()) {
                item = this.mAdapter.getCount() - 1;
            }
            int pageLimit = this.mOffscreenPageLimit;
            if (item > this.mCurItem + pageLimit || item < this.mCurItem - pageLimit) {
                for (int i = 0; i < this.mItems.size(); i++) {
                    this.mItems.get(i).scrolling = true;
                }
            }
            if (this.mCurItem == item) {
                dispatchSelected = false;
            }
            populate(item);
            ItemInfo curInfo = infoForPosition(item);
            int destX = 0;
            if (curInfo != null) {
                int width = getWidth();
                destX = (int) (width * Math.max(this.mFirstOffset, Math.min(curInfo.offset, this.mLastOffset)));
            }
            if (smoothScroll) {
                smoothScrollTo(destX, 0, velocity);
                if (dispatchSelected && this.mOnPageChangeListener != null) {
                    this.mOnPageChangeListener.onPageSelected(item);
                }
                if (dispatchSelected && this.mInternalPageChangeListener != null) {
                    this.mInternalPageChangeListener.onPageSelected(item);
                    return;
                }
                return;
            }
            if (dispatchSelected && this.mOnPageChangeListener != null) {
                this.mOnPageChangeListener.onPageSelected(item);
            }
            if (dispatchSelected && this.mInternalPageChangeListener != null) {
                this.mInternalPageChangeListener.onPageSelected(item);
            }
            completeScroll();
            scrollTo(destX, 0);
        }
    }

    public void setOnPageChangeListener(OnPageChangeListener listener) {
        this.mOnPageChangeListener = listener;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public OnPageChangeListener setInternalPageChangeListener(OnPageChangeListener listener) {
        OnPageChangeListener oldListener = this.mInternalPageChangeListener;
        this.mInternalPageChangeListener = listener;
        return oldListener;
    }

    public int getOffscreenPageLimit() {
        return this.mOffscreenPageLimit;
    }

    public void setOffscreenPageLimit(int limit) {
        if (limit < 1) {
            Log.w(TAG, "Requested offscreen page limit " + limit + " too small; defaulting to 1");
            limit = 1;
        }
        if (limit != this.mOffscreenPageLimit) {
            this.mOffscreenPageLimit = limit;
            populate();
        }
    }

    public void setPageMargin(int marginPixels) {
        int oldMargin = this.mPageMargin;
        this.mPageMargin = marginPixels;
        int width = getWidth();
        recomputeScrollPosition(width, width, marginPixels, oldMargin);
        requestLayout();
    }

    public int getPageMargin() {
        return this.mPageMargin;
    }

    public void setPageMarginDrawable(Drawable d) {
        this.mMarginDrawable = d;
        if (d != null) {
            refreshDrawableState();
        }
        setWillNotDraw(d == null);
        invalidate();
    }

    public void setPageMarginDrawable(int resId) {
        setPageMarginDrawable(getContext().getResources().getDrawable(resId));
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable who) {
        return super.verifyDrawable(who) || who == this.mMarginDrawable;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable d = this.mMarginDrawable;
        if (d != null && d.isStateful()) {
            d.setState(getDrawableState());
        }
    }

    float distanceInfluenceForSnapDuration(float f) {
        return (float) Math.sin((float) ((f - 0.5f) * 0.4712389167638204d));
    }

    void smoothScrollTo(int x, int y) {
        smoothScrollTo(x, y, 0);
    }

    void smoothScrollTo(int x, int y, int velocity) {
        int duration;
        if (getChildCount() == 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        int sx = getScrollX();
        int sy = getScrollY();
        int dx = x - sx;
        int dy = y - sy;
        if (dx == 0 && dy == 0) {
            completeScroll();
            populate();
            setScrollState(0);
            return;
        }
        setScrollingCacheEnabled(true);
        setScrollState(2);
        int width = getWidth();
        int halfWidth = width / 2;
        float distanceRatio = Math.min(1.0f, (1.0f * Math.abs(dx)) / width);
        float distance = halfWidth + (halfWidth * distanceInfluenceForSnapDuration(distanceRatio));
        int velocity2 = Math.abs(velocity);
        if (velocity2 > 0) {
            duration = Math.round(1000.0f * Math.abs(distance / velocity2)) * 4;
        } else {
            float pageWidth = width * this.mAdapter.getPageWidth(this.mCurItem);
            float pageDelta = Math.abs(dx) / (this.mPageMargin + pageWidth);
            duration = (int) ((1.0f + pageDelta) * 100.0f);
        }
        this.mScroller.startScroll(sx, sy, dx, dy, Math.min(duration, (int) MAX_SETTLE_DURATION));
        ViewCompat.postInvalidateOnAnimation(this);
    }

    ItemInfo addNewItem(int position, int index) {
        ItemInfo ii = new ItemInfo();
        ii.position = position;
        ii.object = this.mAdapter.instantiateItem((ViewGroup) this, position);
        ii.widthFactor = this.mAdapter.getPageWidth(position);
        if (index < 0 || index >= this.mItems.size()) {
            this.mItems.add(ii);
        } else {
            this.mItems.add(index, ii);
        }
        return ii;
    }

    void dataSetChanged() {
        boolean needPopulate = this.mItems.size() < (this.mOffscreenPageLimit * 2) + 1 && this.mItems.size() < this.mAdapter.getCount();
        int newCurrItem = this.mCurItem;
        boolean isUpdating = false;
        int i = 0;
        while (i < this.mItems.size()) {
            ItemInfo ii = this.mItems.get(i);
            int newPos = this.mAdapter.getItemPosition(ii.object);
            if (newPos != -1) {
                if (newPos == -2) {
                    this.mItems.remove(i);
                    i--;
                    if (!isUpdating) {
                        this.mAdapter.startUpdate((ViewGroup) this);
                        isUpdating = true;
                    }
                    this.mAdapter.destroyItem((ViewGroup) this, ii.position, ii.object);
                    needPopulate = true;
                    if (this.mCurItem == ii.position) {
                        newCurrItem = Math.max(0, Math.min(this.mCurItem, this.mAdapter.getCount() - 1));
                        needPopulate = true;
                    }
                } else if (ii.position != newPos) {
                    if (ii.position == this.mCurItem) {
                        newCurrItem = newPos;
                    }
                    ii.position = newPos;
                    needPopulate = true;
                }
            }
            i++;
        }
        if (isUpdating) {
            this.mAdapter.finishUpdate((ViewGroup) this);
        }
        Collections.sort(this.mItems, COMPARATOR);
        if (needPopulate) {
            int childCount = getChildCount();
            for (int i2 = 0; i2 < childCount; i2++) {
                View child = getChildAt(i2);
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                if (!lp.isDecor) {
                    lp.widthFactor = BitmapDescriptorFactory.HUE_RED;
                }
            }
            setCurrentItemInternal(newCurrItem, false, true);
            requestLayout();
        }
    }

    void populate() {
        populate(this.mCurItem);
    }

    void populate(int newCurrentItem) {
        ItemInfo ii;
        ItemInfo oldCurInfo = null;
        if (this.mCurItem != newCurrentItem) {
            oldCurInfo = infoForPosition(this.mCurItem);
            this.mCurItem = newCurrentItem;
        }
        if (this.mAdapter != null && !this.mPopulatePending && getWindowToken() != null) {
            this.mAdapter.startUpdate((ViewGroup) this);
            int pageLimit = this.mOffscreenPageLimit;
            int startPos = Math.max(0, this.mCurItem - pageLimit);
            int N = this.mAdapter.getCount();
            int endPos = Math.min(N - 1, this.mCurItem + pageLimit);
            ItemInfo curItem = null;
            int curIndex = 0;
            while (true) {
                if (curIndex >= this.mItems.size()) {
                    break;
                }
                ItemInfo ii2 = this.mItems.get(curIndex);
                if (ii2.position < this.mCurItem) {
                    curIndex++;
                } else if (ii2.position == this.mCurItem) {
                    curItem = ii2;
                }
            }
            if (curItem == null && N > 0) {
                curItem = addNewItem(this.mCurItem, curIndex);
            }
            if (curItem != null) {
                float extraWidthLeft = BitmapDescriptorFactory.HUE_RED;
                int itemIndex = curIndex - 1;
                ItemInfo ii3 = itemIndex >= 0 ? this.mItems.get(itemIndex) : null;
                float leftWidthNeeded = 2.0f - curItem.widthFactor;
                for (int pos = this.mCurItem - 1; pos >= 0; pos--) {
                    if (extraWidthLeft >= leftWidthNeeded && pos < startPos) {
                        if (ii3 == null) {
                            break;
                        } else if (pos == ii3.position && !ii3.scrolling) {
                            this.mItems.remove(itemIndex);
                            this.mAdapter.destroyItem((ViewGroup) this, pos, ii3.object);
                            itemIndex--;
                            curIndex--;
                            ii3 = itemIndex >= 0 ? this.mItems.get(itemIndex) : null;
                        }
                    } else if (ii3 != null && pos == ii3.position) {
                        extraWidthLeft += ii3.widthFactor;
                        itemIndex--;
                        ii3 = itemIndex >= 0 ? this.mItems.get(itemIndex) : null;
                    } else {
                        extraWidthLeft += addNewItem(pos, itemIndex + 1).widthFactor;
                        curIndex++;
                        ii3 = itemIndex >= 0 ? this.mItems.get(itemIndex) : null;
                    }
                }
                float extraWidthRight = curItem.widthFactor;
                int itemIndex2 = curIndex + 1;
                if (extraWidthRight < 2.0f) {
                    ItemInfo ii4 = itemIndex2 < this.mItems.size() ? this.mItems.get(itemIndex2) : null;
                    for (int pos2 = this.mCurItem + 1; pos2 < N; pos2++) {
                        if (extraWidthRight >= 2.0f && pos2 > endPos) {
                            if (ii4 == null) {
                                break;
                            } else if (pos2 == ii4.position && !ii4.scrolling) {
                                this.mItems.remove(itemIndex2);
                                this.mAdapter.destroyItem((ViewGroup) this, pos2, ii4.object);
                                ii4 = itemIndex2 < this.mItems.size() ? this.mItems.get(itemIndex2) : null;
                            }
                        } else if (ii4 != null && pos2 == ii4.position) {
                            extraWidthRight += ii4.widthFactor;
                            itemIndex2++;
                            ii4 = itemIndex2 < this.mItems.size() ? this.mItems.get(itemIndex2) : null;
                        } else {
                            ItemInfo ii5 = addNewItem(pos2, itemIndex2);
                            itemIndex2++;
                            extraWidthRight += ii5.widthFactor;
                            ii4 = itemIndex2 < this.mItems.size() ? this.mItems.get(itemIndex2) : null;
                        }
                    }
                }
                calculatePageOffsets(curItem, curIndex, oldCurInfo);
            }
            this.mAdapter.setPrimaryItem((ViewGroup) this, this.mCurItem, curItem != null ? curItem.object : null);
            this.mAdapter.finishUpdate((ViewGroup) this);
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                View child = getChildAt(i);
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                if (!lp.isDecor && lp.widthFactor == BitmapDescriptorFactory.HUE_RED && (ii = infoForChild(child)) != null) {
                    lp.widthFactor = ii.widthFactor;
                }
            }
            if (hasFocus()) {
                View currentFocused = findFocus();
                ItemInfo ii6 = currentFocused != null ? infoForAnyChild(currentFocused) : null;
                if (ii6 == null || ii6.position != this.mCurItem) {
                    for (int i2 = 0; i2 < getChildCount(); i2++) {
                        View child2 = getChildAt(i2);
                        ItemInfo ii7 = infoForChild(child2);
                        if (ii7 != null && ii7.position == this.mCurItem && child2.requestFocus(2)) {
                            return;
                        }
                    }
                }
            }
        }
    }

    private void calculatePageOffsets(ItemInfo curItem, int curIndex, ItemInfo oldCurInfo) {
        ItemInfo ii;
        ItemInfo ii2;
        int N = this.mAdapter.getCount();
        int width = getWidth();
        float marginOffset = width > 0 ? this.mPageMargin / width : BitmapDescriptorFactory.HUE_RED;
        if (oldCurInfo != null) {
            int oldCurPosition = oldCurInfo.position;
            if (oldCurPosition < curItem.position) {
                int itemIndex = 0;
                float offset = oldCurInfo.offset + oldCurInfo.widthFactor + marginOffset;
                int pos = oldCurPosition + 1;
                while (pos <= curItem.position && itemIndex < this.mItems.size()) {
                    ItemInfo ii3 = this.mItems.get(itemIndex);
                    while (true) {
                        ii2 = ii3;
                        if (pos <= ii2.position || itemIndex >= this.mItems.size() - 1) {
                            break;
                        }
                        itemIndex++;
                        ii3 = this.mItems.get(itemIndex);
                    }
                    while (pos < ii2.position) {
                        offset += this.mAdapter.getPageWidth(pos) + marginOffset;
                        pos++;
                    }
                    ii2.offset = offset;
                    offset += ii2.widthFactor + marginOffset;
                    pos++;
                }
            } else if (oldCurPosition > curItem.position) {
                int itemIndex2 = this.mItems.size() - 1;
                float offset2 = oldCurInfo.offset;
                int pos2 = oldCurPosition - 1;
                while (pos2 >= curItem.position && itemIndex2 >= 0) {
                    ItemInfo ii4 = this.mItems.get(itemIndex2);
                    while (true) {
                        ii = ii4;
                        if (pos2 >= ii.position || itemIndex2 <= 0) {
                            break;
                        }
                        itemIndex2--;
                        ii4 = this.mItems.get(itemIndex2);
                    }
                    while (pos2 > ii.position) {
                        offset2 -= this.mAdapter.getPageWidth(pos2) + marginOffset;
                        pos2--;
                    }
                    offset2 -= ii.widthFactor + marginOffset;
                    ii.offset = offset2;
                    pos2--;
                }
            }
        }
        int itemCount = this.mItems.size();
        float offset3 = curItem.offset;
        int pos3 = curItem.position - 1;
        this.mFirstOffset = curItem.position == 0 ? curItem.offset : -3.4028235E38f;
        this.mLastOffset = curItem.position == N + (-1) ? (curItem.offset + curItem.widthFactor) - 1.0f : Float.MAX_VALUE;
        int i = curIndex - 1;
        while (i >= 0) {
            ItemInfo ii5 = this.mItems.get(i);
            while (pos3 > ii5.position) {
                offset3 -= this.mAdapter.getPageWidth(pos3) + marginOffset;
                pos3--;
            }
            offset3 -= ii5.widthFactor + marginOffset;
            ii5.offset = offset3;
            if (ii5.position == 0) {
                this.mFirstOffset = offset3;
            }
            i--;
            pos3--;
        }
        float offset4 = curItem.offset + curItem.widthFactor + marginOffset;
        int pos4 = curItem.position + 1;
        int i2 = curIndex + 1;
        while (i2 < itemCount) {
            ItemInfo ii6 = this.mItems.get(i2);
            while (pos4 < ii6.position) {
                offset4 += this.mAdapter.getPageWidth(pos4) + marginOffset;
                pos4++;
            }
            if (ii6.position == N - 1) {
                this.mLastOffset = (ii6.widthFactor + offset4) - 1.0f;
            }
            ii6.offset = offset4;
            offset4 += ii6.widthFactor + marginOffset;
            i2++;
            pos4++;
        }
        this.mNeedCalculatePageOffsets = false;
    }

    /* loaded from: classes.dex */
    public static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = ParcelableCompat.newCreator(new ParcelableCompatCreatorCallbacks<SavedState>() { // from class: android.support.v4.view.ViewPager.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.support.v4.os.ParcelableCompatCreatorCallbacks
            /* renamed from: createFromParcel */
            public SavedState mo11createFromParcel(Parcel in, ClassLoader loader) {
                return new SavedState(in, loader);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.support.v4.os.ParcelableCompatCreatorCallbacks
            /* renamed from: newArray */
            public SavedState[] mo12newArray(int size) {
                return new SavedState[size];
            }
        });
        Parcelable adapterState;
        ClassLoader loader;
        int position;

        public SavedState(Parcelable superState) {
            super(superState);
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(this.position);
            out.writeParcelable(this.adapterState, flags);
        }

        public String toString() {
            return "FragmentPager.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " position=" + this.position + "}";
        }

        SavedState(Parcel in, ClassLoader loader) {
            super(in);
            loader = loader == null ? getClass().getClassLoader() : loader;
            this.position = in.readInt();
            this.adapterState = in.readParcelable(loader);
            this.loader = loader;
        }
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        ss.position = this.mCurItem;
        if (this.mAdapter != null) {
            ss.adapterState = this.mAdapter.saveState();
        }
        return ss;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        if (!(state instanceof SavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        if (this.mAdapter != null) {
            this.mAdapter.restoreState(ss.adapterState, ss.loader);
            setCurrentItemInternal(ss.position, false, true);
            return;
        }
        this.mRestoredCurItem = ss.position;
        this.mRestoredAdapterState = ss.adapterState;
        this.mRestoredClassLoader = ss.loader;
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index, ViewGroup.LayoutParams params) {
        if (!checkLayoutParams(params)) {
            params = generateLayoutParams(params);
        }
        LayoutParams lp = (LayoutParams) params;
        lp.isDecor |= child instanceof Decor;
        if (this.mInLayout) {
            if (lp != null && lp.isDecor) {
                throw new IllegalStateException("Cannot add pager decor view during layout");
            }
            lp.needsMeasure = true;
            addViewInLayout(child, index, params);
            return;
        }
        super.addView(child, index, params);
    }

    ItemInfo infoForChild(View child) {
        for (int i = 0; i < this.mItems.size(); i++) {
            ItemInfo ii = this.mItems.get(i);
            if (this.mAdapter.isViewFromObject(child, ii.object)) {
                return ii;
            }
        }
        return null;
    }

    ItemInfo infoForAnyChild(View child) {
        while (true) {
            ViewParent parent = child.getParent();
            if (parent != this) {
                if (parent == null || !(parent instanceof View)) {
                    break;
                }
                child = (View) parent;
            } else {
                return infoForChild(child);
            }
        }
        return null;
    }

    ItemInfo infoForPosition(int position) {
        for (int i = 0; i < this.mItems.size(); i++) {
            ItemInfo ii = this.mItems.get(i);
            if (ii.position == position) {
                return ii;
            }
        }
        return null;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mFirstLayout = true;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        LayoutParams lp;
        LayoutParams lp2;
        setMeasuredDimension(getDefaultSize(0, widthMeasureSpec), getDefaultSize(0, heightMeasureSpec));
        int measuredWidth = getMeasuredWidth();
        int maxGutterSize = measuredWidth / 10;
        this.mGutterSize = Math.min(maxGutterSize, this.mDefaultGutterSize);
        int childWidthSize = (measuredWidth - getPaddingLeft()) - getPaddingRight();
        int childHeightSize = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        int size = getChildCount();
        for (int i = 0; i < size; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8 && (lp2 = (LayoutParams) child.getLayoutParams()) != null && lp2.isDecor) {
                int hgrav = lp2.gravity & 7;
                int vgrav = lp2.gravity & 112;
                int widthMode = Integer.MIN_VALUE;
                int heightMode = Integer.MIN_VALUE;
                boolean consumeVertical = vgrav == 48 || vgrav == 80;
                boolean consumeHorizontal = hgrav == 3 || hgrav == 5;
                if (consumeVertical) {
                    widthMode = 1073741824;
                } else if (consumeHorizontal) {
                    heightMode = 1073741824;
                }
                int widthSize = childWidthSize;
                int heightSize = childHeightSize;
                if (lp2.width != -2) {
                    widthMode = 1073741824;
                    if (lp2.width != -1) {
                        widthSize = lp2.width;
                    }
                }
                if (lp2.height != -2) {
                    heightMode = 1073741824;
                    if (lp2.height != -1) {
                        heightSize = lp2.height;
                    }
                }
                int widthSpec = View.MeasureSpec.makeMeasureSpec(widthSize, widthMode);
                int heightSpec = View.MeasureSpec.makeMeasureSpec(heightSize, heightMode);
                child.measure(widthSpec, heightSpec);
                if (consumeVertical) {
                    childHeightSize -= child.getMeasuredHeight();
                } else if (consumeHorizontal) {
                    childWidthSize -= child.getMeasuredWidth();
                }
            }
        }
        this.mChildWidthMeasureSpec = View.MeasureSpec.makeMeasureSpec(childWidthSize, 1073741824);
        this.mChildHeightMeasureSpec = View.MeasureSpec.makeMeasureSpec(childHeightSize, 1073741824);
        this.mInLayout = true;
        populate();
        this.mInLayout = false;
        int size2 = getChildCount();
        for (int i2 = 0; i2 < size2; i2++) {
            View child2 = getChildAt(i2);
            if (child2.getVisibility() != 8 && ((lp = (LayoutParams) child2.getLayoutParams()) == null || !lp.isDecor)) {
                int widthSpec2 = View.MeasureSpec.makeMeasureSpec((int) (childWidthSize * lp.widthFactor), 1073741824);
                child2.measure(widthSpec2, this.mChildHeightMeasureSpec);
            }
        }
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (w != oldw) {
            recomputeScrollPosition(w, oldw, this.mPageMargin, this.mPageMargin);
        }
    }

    private void recomputeScrollPosition(int width, int oldWidth, int margin, int oldMargin) {
        if (oldWidth > 0 && !this.mItems.isEmpty()) {
            int widthWithMargin = width + margin;
            int oldWidthWithMargin = oldWidth + oldMargin;
            int xpos = getScrollX();
            float pageOffset = xpos / oldWidthWithMargin;
            int newOffsetPixels = (int) (widthWithMargin * pageOffset);
            scrollTo(newOffsetPixels, getScrollY());
            if (!this.mScroller.isFinished()) {
                int newDuration = this.mScroller.getDuration() - this.mScroller.timePassed();
                ItemInfo targetInfo = infoForPosition(this.mCurItem);
                this.mScroller.startScroll(newOffsetPixels, 0, (int) (targetInfo.offset * width), 0, newDuration);
                return;
            }
            return;
        }
        ItemInfo ii = infoForPosition(this.mCurItem);
        float scrollOffset = ii != null ? Math.min(ii.offset, this.mLastOffset) : BitmapDescriptorFactory.HUE_RED;
        int scrollPos = (int) (width * scrollOffset);
        if (scrollPos != getScrollX()) {
            completeScroll();
            scrollTo(scrollPos, getScrollY());
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        ItemInfo ii;
        int childLeft;
        int childTop;
        this.mInLayout = true;
        populate();
        this.mInLayout = false;
        int count = getChildCount();
        int width = r - l;
        int height = b - t;
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        int scrollX = getScrollX();
        int decorCount = 0;
        for (int i = 0; i < count; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                if (lp.isDecor) {
                    int hgrav = lp.gravity & 7;
                    int vgrav = lp.gravity & 112;
                    switch (hgrav) {
                        case 1:
                            childLeft = Math.max((width - child.getMeasuredWidth()) / 2, paddingLeft);
                            break;
                        case 2:
                        case 4:
                        default:
                            childLeft = paddingLeft;
                            break;
                        case 3:
                            childLeft = paddingLeft;
                            paddingLeft += child.getMeasuredWidth();
                            break;
                        case 5:
                            childLeft = (width - paddingRight) - child.getMeasuredWidth();
                            paddingRight += child.getMeasuredWidth();
                            break;
                    }
                    switch (vgrav) {
                        case 16:
                            childTop = Math.max((height - child.getMeasuredHeight()) / 2, paddingTop);
                            break;
                        case 48:
                            childTop = paddingTop;
                            paddingTop += child.getMeasuredHeight();
                            break;
                        case 80:
                            childTop = (height - paddingBottom) - child.getMeasuredHeight();
                            paddingBottom += child.getMeasuredHeight();
                            break;
                        default:
                            childTop = paddingTop;
                            break;
                    }
                    int childLeft2 = childLeft + scrollX;
                    child.layout(childLeft2, childTop, child.getMeasuredWidth() + childLeft2, child.getMeasuredHeight() + childTop);
                    decorCount++;
                }
            }
        }
        for (int i2 = 0; i2 < count; i2++) {
            View child2 = getChildAt(i2);
            if (child2.getVisibility() != 8) {
                LayoutParams lp2 = (LayoutParams) child2.getLayoutParams();
                if (!lp2.isDecor && (ii = infoForChild(child2)) != null) {
                    int loff = (int) (width * ii.offset);
                    int childLeft3 = paddingLeft + loff;
                    int childTop2 = paddingTop;
                    if (lp2.needsMeasure) {
                        lp2.needsMeasure = false;
                        int widthSpec = View.MeasureSpec.makeMeasureSpec((int) (((width - paddingLeft) - paddingRight) * lp2.widthFactor), 1073741824);
                        int heightSpec = View.MeasureSpec.makeMeasureSpec((height - paddingTop) - paddingBottom, 1073741824);
                        child2.measure(widthSpec, heightSpec);
                    }
                    child2.layout(childLeft3, childTop2, child2.getMeasuredWidth() + childLeft3, child2.getMeasuredHeight() + childTop2);
                }
            }
        }
        this.mTopPageBounds = paddingTop;
        this.mBottomPageBounds = height - paddingBottom;
        this.mDecorChildCount = decorCount;
        this.mFirstLayout = false;
    }

    @Override // android.view.View
    public void computeScroll() {
        if (!this.mScroller.isFinished() && this.mScroller.computeScrollOffset()) {
            int oldX = getScrollX();
            int oldY = getScrollY();
            int x = this.mScroller.getCurrX();
            int y = this.mScroller.getCurrY();
            if (oldX != x || oldY != y) {
                scrollTo(x, y);
                if (!pageScrolled(x)) {
                    this.mScroller.abortAnimation();
                    scrollTo(0, y);
                }
            }
            ViewCompat.postInvalidateOnAnimation(this);
            return;
        }
        completeScroll();
    }

    private boolean pageScrolled(int xpos) {
        if (this.mItems.size() == 0) {
            this.mCalledSuper = false;
            onPageScrolled(0, BitmapDescriptorFactory.HUE_RED, 0);
            if (this.mCalledSuper) {
                return false;
            }
            throw new IllegalStateException("onPageScrolled did not call superclass implementation");
        }
        ItemInfo ii = infoForCurrentScrollPosition();
        int width = getWidth();
        int widthWithMargin = width + this.mPageMargin;
        float marginOffset = this.mPageMargin / width;
        int currentPage = ii.position;
        float pageOffset = ((xpos / width) - ii.offset) / (ii.widthFactor + marginOffset);
        int offsetPixels = (int) (widthWithMargin * pageOffset);
        this.mCalledSuper = false;
        onPageScrolled(currentPage, pageOffset, offsetPixels);
        if (!this.mCalledSuper) {
            throw new IllegalStateException("onPageScrolled did not call superclass implementation");
        }
        return true;
    }

    protected void onPageScrolled(int position, float offset, int offsetPixels) {
        int childLeft;
        if (this.mDecorChildCount > 0) {
            int scrollX = getScrollX();
            int paddingLeft = getPaddingLeft();
            int paddingRight = getPaddingRight();
            int width = getWidth();
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                View child = getChildAt(i);
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                if (lp.isDecor) {
                    int hgrav = lp.gravity & 7;
                    switch (hgrav) {
                        case 1:
                            childLeft = Math.max((width - child.getMeasuredWidth()) / 2, paddingLeft);
                            break;
                        case 2:
                        case 4:
                        default:
                            childLeft = paddingLeft;
                            break;
                        case 3:
                            childLeft = paddingLeft;
                            paddingLeft += child.getWidth();
                            break;
                        case 5:
                            childLeft = (width - paddingRight) - child.getMeasuredWidth();
                            paddingRight += child.getMeasuredWidth();
                            break;
                    }
                    int childOffset = (childLeft + scrollX) - child.getLeft();
                    if (childOffset != 0) {
                        child.offsetLeftAndRight(childOffset);
                    }
                }
            }
        }
        if (this.mOnPageChangeListener != null) {
            this.mOnPageChangeListener.onPageScrolled(position, offset, offsetPixels);
        }
        if (this.mInternalPageChangeListener != null) {
            this.mInternalPageChangeListener.onPageScrolled(position, offset, offsetPixels);
        }
        this.mCalledSuper = true;
    }

    private void completeScroll() {
        boolean needPopulate = this.mScrollState == 2;
        if (needPopulate) {
            setScrollingCacheEnabled(false);
            this.mScroller.abortAnimation();
            int oldX = getScrollX();
            int oldY = getScrollY();
            int x = this.mScroller.getCurrX();
            int y = this.mScroller.getCurrY();
            if (oldX != x || oldY != y) {
                scrollTo(x, y);
            }
            setScrollState(0);
        }
        this.mPopulatePending = false;
        for (int i = 0; i < this.mItems.size(); i++) {
            ItemInfo ii = this.mItems.get(i);
            if (ii.scrolling) {
                needPopulate = true;
                ii.scrolling = false;
            }
        }
        if (needPopulate) {
            populate();
        }
    }

    private boolean isGutterDrag(float x, float dx) {
        return (x < ((float) this.mGutterSize) && dx > BitmapDescriptorFactory.HUE_RED) || (x > ((float) (getWidth() - this.mGutterSize)) && dx < BitmapDescriptorFactory.HUE_RED);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        int action = ev.getAction() & MotionEventCompat.ACTION_MASK;
        if (action == 3 || action == 1) {
            this.mIsBeingDragged = false;
            this.mIsUnableToDrag = false;
            this.mActivePointerId = -1;
            if (this.mVelocityTracker != null) {
                this.mVelocityTracker.recycle();
                this.mVelocityTracker = null;
            }
            return false;
        }
        if (action != 0) {
            if (this.mIsBeingDragged) {
                return true;
            }
            if (this.mIsUnableToDrag) {
                return false;
            }
        }
        switch (action) {
            case 0:
                float x = ev.getX();
                this.mInitialMotionX = x;
                this.mLastMotionX = x;
                this.mLastMotionY = ev.getY();
                this.mActivePointerId = MotionEventCompat.getPointerId(ev, 0);
                this.mIsUnableToDrag = false;
                this.mScroller.computeScrollOffset();
                if (this.mScrollState == 2 && Math.abs(this.mScroller.getFinalX() - this.mScroller.getCurrX()) > this.mCloseEnough) {
                    this.mScroller.abortAnimation();
                    this.mPopulatePending = false;
                    populate();
                    this.mIsBeingDragged = true;
                    setScrollState(1);
                    break;
                } else {
                    completeScroll();
                    this.mIsBeingDragged = false;
                    break;
                }
            case 2:
                int activePointerId = this.mActivePointerId;
                if (activePointerId != -1) {
                    int pointerIndex = MotionEventCompat.findPointerIndex(ev, activePointerId);
                    float x2 = MotionEventCompat.getX(ev, pointerIndex);
                    float dx = x2 - this.mLastMotionX;
                    float xDiff = Math.abs(dx);
                    float y = MotionEventCompat.getY(ev, pointerIndex);
                    float yDiff = Math.abs(y - this.mLastMotionY);
                    if (dx != BitmapDescriptorFactory.HUE_RED && !isGutterDrag(this.mLastMotionX, dx) && canScroll(this, false, (int) dx, (int) x2, (int) y)) {
                        this.mLastMotionX = x2;
                        this.mInitialMotionX = x2;
                        this.mLastMotionY = y;
                        this.mIsUnableToDrag = true;
                        return false;
                    }
                    if (xDiff > this.mTouchSlop && xDiff > yDiff) {
                        this.mIsBeingDragged = true;
                        setScrollState(1);
                        this.mLastMotionX = dx > BitmapDescriptorFactory.HUE_RED ? this.mInitialMotionX + this.mTouchSlop : this.mInitialMotionX - this.mTouchSlop;
                        setScrollingCacheEnabled(true);
                    } else if (yDiff > this.mTouchSlop) {
                        this.mIsUnableToDrag = true;
                    }
                    if (this.mIsBeingDragged && performDrag(x2)) {
                        ViewCompat.postInvalidateOnAnimation(this);
                        break;
                    }
                }
                break;
            case 6:
                onSecondaryPointerUp(ev);
                break;
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(ev);
        return this.mIsBeingDragged;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (this.mFakeDragging) {
            return true;
        }
        if ((ev.getAction() == 0 && ev.getEdgeFlags() != 0) || this.mAdapter == null || this.mAdapter.getCount() == 0) {
            return false;
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(ev);
        int action = ev.getAction();
        boolean needsInvalidate = false;
        switch (action & MotionEventCompat.ACTION_MASK) {
            case 0:
                this.mScroller.abortAnimation();
                this.mPopulatePending = false;
                populate();
                this.mIsBeingDragged = true;
                setScrollState(1);
                float x = ev.getX();
                this.mInitialMotionX = x;
                this.mLastMotionX = x;
                this.mActivePointerId = MotionEventCompat.getPointerId(ev, 0);
                break;
            case 1:
                if (this.mIsBeingDragged) {
                    VelocityTracker velocityTracker = this.mVelocityTracker;
                    velocityTracker.computeCurrentVelocity(1000, this.mMaximumVelocity);
                    int initialVelocity = (int) VelocityTrackerCompat.getXVelocity(velocityTracker, this.mActivePointerId);
                    this.mPopulatePending = true;
                    int width = getWidth();
                    int scrollX = getScrollX();
                    ItemInfo ii = infoForCurrentScrollPosition();
                    int currentPage = ii.position;
                    float pageOffset = ((scrollX / width) - ii.offset) / ii.widthFactor;
                    int activePointerIndex = MotionEventCompat.findPointerIndex(ev, this.mActivePointerId);
                    float x2 = MotionEventCompat.getX(ev, activePointerIndex);
                    int totalDelta = (int) (x2 - this.mInitialMotionX);
                    int nextPage = determineTargetPage(currentPage, pageOffset, initialVelocity, totalDelta);
                    setCurrentItemInternal(nextPage, true, true, initialVelocity);
                    this.mActivePointerId = -1;
                    endDrag();
                    needsInvalidate = this.mLeftEdge.onRelease() | this.mRightEdge.onRelease();
                    break;
                }
                break;
            case 2:
                if (!this.mIsBeingDragged) {
                    int pointerIndex = MotionEventCompat.findPointerIndex(ev, this.mActivePointerId);
                    float x3 = MotionEventCompat.getX(ev, pointerIndex);
                    float xDiff = Math.abs(x3 - this.mLastMotionX);
                    float y = MotionEventCompat.getY(ev, pointerIndex);
                    float yDiff = Math.abs(y - this.mLastMotionY);
                    if (xDiff > this.mTouchSlop && xDiff > yDiff) {
                        this.mIsBeingDragged = true;
                        this.mLastMotionX = x3 - this.mInitialMotionX > BitmapDescriptorFactory.HUE_RED ? this.mInitialMotionX + this.mTouchSlop : this.mInitialMotionX - this.mTouchSlop;
                        setScrollState(1);
                        setScrollingCacheEnabled(true);
                    }
                }
                if (this.mIsBeingDragged) {
                    int activePointerIndex2 = MotionEventCompat.findPointerIndex(ev, this.mActivePointerId);
                    float x4 = MotionEventCompat.getX(ev, activePointerIndex2);
                    needsInvalidate = false | performDrag(x4);
                    break;
                }
                break;
            case 3:
                if (this.mIsBeingDragged) {
                    setCurrentItemInternal(this.mCurItem, true, true);
                    this.mActivePointerId = -1;
                    endDrag();
                    needsInvalidate = this.mLeftEdge.onRelease() | this.mRightEdge.onRelease();
                    break;
                }
                break;
            case 5:
                int index = MotionEventCompat.getActionIndex(ev);
                float x5 = MotionEventCompat.getX(ev, index);
                this.mLastMotionX = x5;
                this.mActivePointerId = MotionEventCompat.getPointerId(ev, index);
                break;
            case 6:
                onSecondaryPointerUp(ev);
                this.mLastMotionX = MotionEventCompat.getX(ev, MotionEventCompat.findPointerIndex(ev, this.mActivePointerId));
                break;
        }
        if (needsInvalidate) {
            ViewCompat.postInvalidateOnAnimation(this);
        }
        return true;
    }

    private boolean performDrag(float x) {
        boolean needsInvalidate = false;
        float deltaX = this.mLastMotionX - x;
        this.mLastMotionX = x;
        float oldScrollX = getScrollX();
        float scrollX = oldScrollX + deltaX;
        int width = getWidth();
        float leftBound = width * this.mFirstOffset;
        float rightBound = width * this.mLastOffset;
        boolean leftAbsolute = true;
        boolean rightAbsolute = true;
        ItemInfo firstItem = this.mItems.get(0);
        ItemInfo lastItem = this.mItems.get(this.mItems.size() - 1);
        if (firstItem.position != 0) {
            leftAbsolute = false;
            leftBound = firstItem.offset * width;
        }
        if (lastItem.position != this.mAdapter.getCount() - 1) {
            rightAbsolute = false;
            rightBound = lastItem.offset * width;
        }
        if (scrollX < leftBound) {
            if (leftAbsolute) {
                float over = leftBound - scrollX;
                needsInvalidate = this.mLeftEdge.onPull(Math.abs(over) / width);
            }
            scrollX = leftBound;
        } else if (scrollX > rightBound) {
            if (rightAbsolute) {
                float over2 = scrollX - rightBound;
                needsInvalidate = this.mRightEdge.onPull(Math.abs(over2) / width);
            }
            scrollX = rightBound;
        }
        this.mLastMotionX += scrollX - ((int) scrollX);
        scrollTo((int) scrollX, getScrollY());
        pageScrolled((int) scrollX);
        return needsInvalidate;
    }

    private ItemInfo infoForCurrentScrollPosition() {
        float marginOffset = BitmapDescriptorFactory.HUE_RED;
        int width = getWidth();
        float scrollOffset = width > 0 ? getScrollX() / width : 0.0f;
        if (width > 0) {
            marginOffset = this.mPageMargin / width;
        }
        int lastPos = -1;
        float lastOffset = BitmapDescriptorFactory.HUE_RED;
        float lastWidth = BitmapDescriptorFactory.HUE_RED;
        boolean first = true;
        ItemInfo lastItem = null;
        int i = 0;
        while (i < this.mItems.size()) {
            ItemInfo ii = this.mItems.get(i);
            if (!first && ii.position != lastPos + 1) {
                ii = this.mTempItem;
                ii.offset = lastOffset + lastWidth + marginOffset;
                ii.position = lastPos + 1;
                ii.widthFactor = this.mAdapter.getPageWidth(ii.position);
                i--;
            }
            float offset = ii.offset;
            float rightBound = ii.widthFactor + offset + marginOffset;
            if (first || scrollOffset >= offset) {
                if (scrollOffset >= rightBound && i != this.mItems.size() - 1) {
                    first = false;
                    lastPos = ii.position;
                    lastOffset = offset;
                    lastWidth = ii.widthFactor;
                    lastItem = ii;
                    i++;
                } else {
                    ItemInfo lastItem2 = ii;
                    return lastItem2;
                }
            } else {
                return lastItem;
            }
        }
        return lastItem;
    }

    private int determineTargetPage(int currentPage, float pageOffset, int velocity, int deltaX) {
        int targetPage;
        if (Math.abs(deltaX) > this.mFlingDistance && Math.abs(velocity) > this.mMinimumVelocity) {
            targetPage = velocity > 0 ? currentPage : currentPage + 1;
        } else {
            targetPage = (int) (currentPage + pageOffset + 0.5f);
        }
        if (this.mItems.size() > 0) {
            ItemInfo firstItem = this.mItems.get(0);
            ItemInfo lastItem = this.mItems.get(this.mItems.size() - 1);
            return Math.max(firstItem.position, Math.min(targetPage, lastItem.position));
        }
        return targetPage;
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        super.draw(canvas);
        boolean needsInvalidate = false;
        int overScrollMode = ViewCompat.getOverScrollMode(this);
        if (overScrollMode == 0 || (overScrollMode == 1 && this.mAdapter != null && this.mAdapter.getCount() > 1)) {
            if (!this.mLeftEdge.isFinished()) {
                int restoreCount = canvas.save();
                int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
                int width = getWidth();
                canvas.rotate(270.0f);
                canvas.translate((-height) + getPaddingTop(), this.mFirstOffset * width);
                this.mLeftEdge.setSize(height, width);
                needsInvalidate = false | this.mLeftEdge.draw(canvas);
                canvas.restoreToCount(restoreCount);
            }
            if (!this.mRightEdge.isFinished()) {
                int restoreCount2 = canvas.save();
                int width2 = getWidth();
                int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
                canvas.rotate(90.0f);
                canvas.translate(-getPaddingTop(), (-(this.mLastOffset + 1.0f)) * width2);
                this.mRightEdge.setSize(height2, width2);
                needsInvalidate |= this.mRightEdge.draw(canvas);
                canvas.restoreToCount(restoreCount2);
            }
        } else {
            this.mLeftEdge.finish();
            this.mRightEdge.finish();
        }
        if (needsInvalidate) {
            ViewCompat.postInvalidateOnAnimation(this);
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        float drawAt;
        super.onDraw(canvas);
        if (this.mPageMargin > 0 && this.mMarginDrawable != null && this.mItems.size() > 0 && this.mAdapter != null) {
            int scrollX = getScrollX();
            int width = getWidth();
            float marginOffset = this.mPageMargin / width;
            int itemIndex = 0;
            ItemInfo ii = this.mItems.get(0);
            float offset = ii.offset;
            int itemCount = this.mItems.size();
            int firstPos = ii.position;
            int lastPos = this.mItems.get(itemCount - 1).position;
            for (int pos = firstPos; pos < lastPos; pos++) {
                while (pos > ii.position && itemIndex < itemCount) {
                    itemIndex++;
                    ii = this.mItems.get(itemIndex);
                }
                if (pos == ii.position) {
                    drawAt = (ii.offset + ii.widthFactor) * width;
                    offset = ii.offset + ii.widthFactor + marginOffset;
                } else {
                    float widthFactor = this.mAdapter.getPageWidth(pos);
                    drawAt = (offset + widthFactor) * width;
                    offset += widthFactor + marginOffset;
                }
                if (this.mPageMargin + drawAt > scrollX) {
                    this.mMarginDrawable.setBounds((int) drawAt, this.mTopPageBounds, (int) (this.mPageMargin + drawAt + 0.5f), this.mBottomPageBounds);
                    this.mMarginDrawable.draw(canvas);
                }
                if (drawAt > scrollX + width) {
                    return;
                }
            }
        }
    }

    public boolean beginFakeDrag() {
        if (this.mIsBeingDragged) {
            return false;
        }
        this.mFakeDragging = true;
        setScrollState(1);
        this.mLastMotionX = BitmapDescriptorFactory.HUE_RED;
        this.mInitialMotionX = BitmapDescriptorFactory.HUE_RED;
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        } else {
            this.mVelocityTracker.clear();
        }
        long time = SystemClock.uptimeMillis();
        MotionEvent ev = MotionEvent.obtain(time, time, 0, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, 0);
        this.mVelocityTracker.addMovement(ev);
        ev.recycle();
        this.mFakeDragBeginTime = time;
        return true;
    }

    public void endFakeDrag() {
        if (!this.mFakeDragging) {
            throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
        }
        VelocityTracker velocityTracker = this.mVelocityTracker;
        velocityTracker.computeCurrentVelocity(1000, this.mMaximumVelocity);
        int initialVelocity = (int) VelocityTrackerCompat.getXVelocity(velocityTracker, this.mActivePointerId);
        this.mPopulatePending = true;
        int width = getWidth();
        int scrollX = getScrollX();
        ItemInfo ii = infoForCurrentScrollPosition();
        int currentPage = ii.position;
        float pageOffset = ((scrollX / width) - ii.offset) / ii.widthFactor;
        int totalDelta = (int) (this.mLastMotionX - this.mInitialMotionX);
        int nextPage = determineTargetPage(currentPage, pageOffset, initialVelocity, totalDelta);
        setCurrentItemInternal(nextPage, true, true, initialVelocity);
        endDrag();
        this.mFakeDragging = false;
    }

    public void fakeDragBy(float xOffset) {
        if (!this.mFakeDragging) {
            throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
        }
        this.mLastMotionX += xOffset;
        float oldScrollX = getScrollX();
        float scrollX = oldScrollX - xOffset;
        int width = getWidth();
        float leftBound = width * this.mFirstOffset;
        float rightBound = width * this.mLastOffset;
        ItemInfo firstItem = this.mItems.get(0);
        ItemInfo lastItem = this.mItems.get(this.mItems.size() - 1);
        if (firstItem.position != 0) {
            leftBound = firstItem.offset * width;
        }
        if (lastItem.position != this.mAdapter.getCount() - 1) {
            rightBound = lastItem.offset * width;
        }
        if (scrollX < leftBound) {
            scrollX = leftBound;
        } else if (scrollX > rightBound) {
            scrollX = rightBound;
        }
        this.mLastMotionX += scrollX - ((int) scrollX);
        scrollTo((int) scrollX, getScrollY());
        pageScrolled((int) scrollX);
        long time = SystemClock.uptimeMillis();
        MotionEvent ev = MotionEvent.obtain(this.mFakeDragBeginTime, time, 2, this.mLastMotionX, BitmapDescriptorFactory.HUE_RED, 0);
        this.mVelocityTracker.addMovement(ev);
        ev.recycle();
    }

    public boolean isFakeDragging() {
        return this.mFakeDragging;
    }

    private void onSecondaryPointerUp(MotionEvent ev) {
        int pointerIndex = MotionEventCompat.getActionIndex(ev);
        int pointerId = MotionEventCompat.getPointerId(ev, pointerIndex);
        if (pointerId == this.mActivePointerId) {
            int newPointerIndex = pointerIndex == 0 ? 1 : 0;
            this.mLastMotionX = MotionEventCompat.getX(ev, newPointerIndex);
            this.mActivePointerId = MotionEventCompat.getPointerId(ev, newPointerIndex);
            if (this.mVelocityTracker != null) {
                this.mVelocityTracker.clear();
            }
        }
    }

    private void endDrag() {
        this.mIsBeingDragged = false;
        this.mIsUnableToDrag = false;
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    private void setScrollingCacheEnabled(boolean enabled) {
        if (this.mScrollingCacheEnabled != enabled) {
            this.mScrollingCacheEnabled = enabled;
        }
    }

    protected boolean canScroll(View v, boolean checkV, int dx, int x, int y) {
        if (v instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) v;
            int scrollX = v.getScrollX();
            int scrollY = v.getScrollY();
            int count = group.getChildCount();
            for (int i = count - 1; i >= 0; i--) {
                View child = group.getChildAt(i);
                if (x + scrollX >= child.getLeft() && x + scrollX < child.getRight() && y + scrollY >= child.getTop() && y + scrollY < child.getBottom() && canScroll(child, true, dx, (x + scrollX) - child.getLeft(), (y + scrollY) - child.getTop())) {
                    return true;
                }
            }
        }
        return checkV && ViewCompat.canScrollHorizontally(v, -dx);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent event) {
        return super.dispatchKeyEvent(event) || executeKeyEvent(event);
    }

    public boolean executeKeyEvent(KeyEvent event) {
        if (event.getAction() != 0) {
            return false;
        }
        switch (event.getKeyCode()) {
            case MMError.DISPLAY_AD_EXPIRED /* 21 */:
                boolean handled = arrowScroll(17);
                return handled;
            case MMError.DISPLAY_AD_NOT_FOUND /* 22 */:
                boolean handled2 = arrowScroll(66);
                return handled2;
            case 61:
                if (Build.VERSION.SDK_INT < 11) {
                    return false;
                }
                if (KeyEventCompat.hasNoModifiers(event)) {
                    boolean handled3 = arrowScroll(2);
                    return handled3;
                } else if (!KeyEventCompat.hasModifiers(event, 1)) {
                    return false;
                } else {
                    boolean handled4 = arrowScroll(1);
                    return handled4;
                }
            default:
                return false;
        }
    }

    public boolean arrowScroll(int direction) {
        View currentFocused = findFocus();
        if (currentFocused == this) {
            currentFocused = null;
        }
        boolean handled = false;
        View nextFocused = FocusFinder.getInstance().findNextFocus(this, currentFocused, direction);
        if (nextFocused != null && nextFocused != currentFocused) {
            if (direction == 17) {
                int nextLeft = getChildRectInPagerCoordinates(this.mTempRect, nextFocused).left;
                int currLeft = getChildRectInPagerCoordinates(this.mTempRect, currentFocused).left;
                handled = (currentFocused == null || nextLeft < currLeft) ? nextFocused.requestFocus() : pageLeft();
            } else if (direction == 66) {
                int nextLeft2 = getChildRectInPagerCoordinates(this.mTempRect, nextFocused).left;
                int currLeft2 = getChildRectInPagerCoordinates(this.mTempRect, currentFocused).left;
                handled = (currentFocused == null || nextLeft2 > currLeft2) ? nextFocused.requestFocus() : pageRight();
            }
        } else if (direction == 17 || direction == 1) {
            handled = pageLeft();
        } else if (direction == 66 || direction == 2) {
            handled = pageRight();
        }
        if (handled) {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(direction));
        }
        return handled;
    }

    private Rect getChildRectInPagerCoordinates(Rect outRect, View child) {
        if (outRect == null) {
            outRect = new Rect();
        }
        if (child == null) {
            outRect.set(0, 0, 0, 0);
        } else {
            outRect.left = child.getLeft();
            outRect.right = child.getRight();
            outRect.top = child.getTop();
            outRect.bottom = child.getBottom();
            ViewParent parent = child.getParent();
            while ((parent instanceof ViewGroup) && parent != this) {
                ViewGroup group = (ViewGroup) parent;
                outRect.left += group.getLeft();
                outRect.right += group.getRight();
                outRect.top += group.getTop();
                outRect.bottom += group.getBottom();
                parent = group.getParent();
            }
        }
        return outRect;
    }

    boolean pageLeft() {
        if (this.mCurItem > 0) {
            setCurrentItem(this.mCurItem - 1, true);
            return true;
        }
        return false;
    }

    boolean pageRight() {
        if (this.mAdapter == null || this.mCurItem >= this.mAdapter.getCount() - 1) {
            return false;
        }
        setCurrentItem(this.mCurItem + 1, true);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addFocusables(ArrayList<View> views, int direction, int focusableMode) {
        ItemInfo ii;
        int focusableCount = views.size();
        int descendantFocusability = getDescendantFocusability();
        if (descendantFocusability != 393216) {
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                if (child.getVisibility() == 0 && (ii = infoForChild(child)) != null && ii.position == this.mCurItem) {
                    child.addFocusables(views, direction, focusableMode);
                }
            }
        }
        if ((descendantFocusability != 262144 || focusableCount == views.size()) && isFocusable()) {
            if (((focusableMode & 1) != 1 || !isInTouchMode() || isFocusableInTouchMode()) && views != null) {
                views.add(this);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addTouchables(ArrayList<View> views) {
        ItemInfo ii;
        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            if (child.getVisibility() == 0 && (ii = infoForChild(child)) != null && ii.position == this.mCurItem) {
                child.addTouchables(views);
            }
        }
    }

    @Override // android.view.ViewGroup
    protected boolean onRequestFocusInDescendants(int direction, Rect previouslyFocusedRect) {
        int index;
        int increment;
        int end;
        ItemInfo ii;
        int count = getChildCount();
        if ((direction & 2) != 0) {
            index = 0;
            increment = 1;
            end = count;
        } else {
            index = count - 1;
            increment = -1;
            end = -1;
        }
        for (int i = index; i != end; i += increment) {
            View child = getChildAt(i);
            if (child.getVisibility() == 0 && (ii = infoForChild(child)) != null && ii.position == this.mCurItem && child.requestFocus(direction, previouslyFocusedRect)) {
                return true;
            }
        }
        return false;
    }

    @Override // android.view.View
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
        ItemInfo ii;
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() == 0 && (ii = infoForChild(child)) != null && ii.position == this.mCurItem && child.dispatchPopulateAccessibilityEvent(event)) {
                return true;
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return generateDefaultLayoutParams();
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return (p instanceof LayoutParams) && super.checkLayoutParams(p);
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class MyAccessibilityDelegate extends AccessibilityDelegateCompat {
        MyAccessibilityDelegate() {
        }

        @Override // android.support.v4.view.AccessibilityDelegateCompat
        public void onInitializeAccessibilityEvent(View host, AccessibilityEvent event) {
            super.onInitializeAccessibilityEvent(host, event);
            event.setClassName(ViewPager.class.getName());
        }

        @Override // android.support.v4.view.AccessibilityDelegateCompat
        public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfoCompat info) {
            boolean z = true;
            super.onInitializeAccessibilityNodeInfo(host, info);
            info.setClassName(ViewPager.class.getName());
            if (ViewPager.this.mAdapter == null || ViewPager.this.mAdapter.getCount() <= 1) {
                z = false;
            }
            info.setScrollable(z);
            if (ViewPager.this.mAdapter != null && ViewPager.this.mCurItem >= 0 && ViewPager.this.mCurItem < ViewPager.this.mAdapter.getCount() - 1) {
                info.addAction(4096);
            }
            if (ViewPager.this.mAdapter != null && ViewPager.this.mCurItem > 0 && ViewPager.this.mCurItem < ViewPager.this.mAdapter.getCount()) {
                info.addAction(8192);
            }
        }

        @Override // android.support.v4.view.AccessibilityDelegateCompat
        public boolean performAccessibilityAction(View host, int action, Bundle args) {
            if (super.performAccessibilityAction(host, action, args)) {
                return true;
            }
            switch (action) {
                case 4096:
                    if (ViewPager.this.mAdapter == null || ViewPager.this.mCurItem < 0 || ViewPager.this.mCurItem >= ViewPager.this.mAdapter.getCount() - 1) {
                        return false;
                    }
                    ViewPager.this.setCurrentItem(ViewPager.this.mCurItem + 1);
                    return true;
                case 8192:
                    if (ViewPager.this.mAdapter == null || ViewPager.this.mCurItem <= 0 || ViewPager.this.mCurItem >= ViewPager.this.mAdapter.getCount()) {
                        return false;
                    }
                    ViewPager.this.setCurrentItem(ViewPager.this.mCurItem - 1);
                    return true;
                default:
                    return false;
            }
        }
    }

    /* loaded from: classes.dex */
    private class PagerObserver extends DataSetObserver {
        private PagerObserver() {
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            ViewPager.this.dataSetChanged();
        }

        @Override // android.database.DataSetObserver
        public void onInvalidated() {
            ViewPager.this.dataSetChanged();
        }
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends ViewGroup.LayoutParams {
        public int gravity;
        public boolean isDecor;
        public boolean needsMeasure;
        public float widthFactor = BitmapDescriptorFactory.HUE_RED;

        public LayoutParams() {
            super(-1, -1);
        }

        public LayoutParams(Context context, AttributeSet attrs) {
            super(context, attrs);
            TypedArray a = context.obtainStyledAttributes(attrs, ViewPager.LAYOUT_ATTRS);
            this.gravity = a.getInteger(0, 48);
            a.recycle();
        }
    }
}
