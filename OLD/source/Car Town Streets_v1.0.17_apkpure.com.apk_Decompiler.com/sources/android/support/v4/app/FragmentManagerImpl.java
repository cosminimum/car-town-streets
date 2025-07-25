package android.support.v4.app;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.util.DebugUtils;
import android.support.v4.util.LogWriter;
import android.util.Log;
import android.util.SparseArray;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

/* compiled from: FragmentManager */
final class FragmentManagerImpl extends FragmentManager {
    static final Interpolator ACCELERATE_CUBIC = new AccelerateInterpolator(1.5f);
    static final Interpolator ACCELERATE_QUINT = new AccelerateInterpolator(2.5f);
    static final int ANIM_DUR = 220;
    public static final int ANIM_STYLE_CLOSE_ENTER = 3;
    public static final int ANIM_STYLE_CLOSE_EXIT = 4;
    public static final int ANIM_STYLE_FADE_ENTER = 5;
    public static final int ANIM_STYLE_FADE_EXIT = 6;
    public static final int ANIM_STYLE_OPEN_ENTER = 1;
    public static final int ANIM_STYLE_OPEN_EXIT = 2;
    static boolean DEBUG = false;
    static final Interpolator DECELERATE_CUBIC = new DecelerateInterpolator(1.5f);
    static final Interpolator DECELERATE_QUINT = new DecelerateInterpolator(2.5f);
    static final boolean HONEYCOMB;
    static final String TAG = "FragmentManager";
    static final String TARGET_REQUEST_CODE_STATE_TAG = "android:target_req_state";
    static final String TARGET_STATE_TAG = "android:target_state";
    static final String USER_VISIBLE_HINT_TAG = "android:user_visible_hint";
    static final String VIEW_STATE_TAG = "android:view_state";
    ArrayList<Fragment> mActive;
    FragmentActivity mActivity;
    ArrayList<Fragment> mAdded;
    ArrayList<Integer> mAvailBackStackIndices;
    ArrayList<Integer> mAvailIndices;
    ArrayList<BackStackRecord> mBackStack;
    ArrayList<FragmentManager.OnBackStackChangedListener> mBackStackChangeListeners;
    ArrayList<BackStackRecord> mBackStackIndices;
    ArrayList<Fragment> mCreatedMenus;
    int mCurState = 0;
    boolean mDestroyed;
    Runnable mExecCommit = new Runnable() {
        public void run() {
            FragmentManagerImpl.this.execPendingActions();
        }
    };
    boolean mExecutingActions;
    boolean mHavePendingDeferredStart;
    boolean mNeedMenuInvalidate;
    String mNoTransactionsBecause;
    ArrayList<Runnable> mPendingActions;
    SparseArray<Parcelable> mStateArray = null;
    Bundle mStateBundle = null;
    boolean mStateSaved;
    Runnable[] mTmpActions;

    FragmentManagerImpl() {
    }

    static {
        boolean z = false;
        if (Build.VERSION.SDK_INT >= 11) {
            z = true;
        }
        HONEYCOMB = z;
    }

    public FragmentTransaction beginTransaction() {
        return new BackStackRecord(this);
    }

    public boolean executePendingTransactions() {
        return execPendingActions();
    }

    public void popBackStack() {
        enqueueAction(new Runnable() {
            public void run() {
                FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mActivity.mHandler, (String) null, -1, 0);
            }
        }, false);
    }

    public boolean popBackStackImmediate() {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(this.mActivity.mHandler, (String) null, -1, 0);
    }

    public void popBackStack(final String name, final int flags) {
        enqueueAction(new Runnable() {
            public void run() {
                FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mActivity.mHandler, name, -1, flags);
            }
        }, false);
    }

    public boolean popBackStackImmediate(String name, int flags) {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(this.mActivity.mHandler, name, -1, flags);
    }

    public void popBackStack(final int id, final int flags) {
        if (id < 0) {
            throw new IllegalArgumentException("Bad id: " + id);
        }
        enqueueAction(new Runnable() {
            public void run() {
                FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mActivity.mHandler, (String) null, id, flags);
            }
        }, false);
    }

    public boolean popBackStackImmediate(int id, int flags) {
        checkStateLoss();
        executePendingTransactions();
        if (id >= 0) {
            return popBackStackState(this.mActivity.mHandler, (String) null, id, flags);
        }
        throw new IllegalArgumentException("Bad id: " + id);
    }

    public int getBackStackEntryCount() {
        if (this.mBackStack != null) {
            return this.mBackStack.size();
        }
        return 0;
    }

    public FragmentManager.BackStackEntry getBackStackEntryAt(int index) {
        return this.mBackStack.get(index);
    }

    public void addOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener listener) {
        if (this.mBackStackChangeListeners == null) {
            this.mBackStackChangeListeners = new ArrayList<>();
        }
        this.mBackStackChangeListeners.add(listener);
    }

    public void removeOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener listener) {
        if (this.mBackStackChangeListeners != null) {
            this.mBackStackChangeListeners.remove(listener);
        }
    }

    public void putFragment(Bundle bundle, String key, Fragment fragment) {
        if (fragment.mIndex < 0) {
            throw new IllegalStateException("Fragment " + fragment + " is not currently in the FragmentManager");
        }
        bundle.putInt(key, fragment.mIndex);
    }

    public Fragment getFragment(Bundle bundle, String key) {
        int index = bundle.getInt(key, -1);
        if (index == -1) {
            return null;
        }
        if (index >= this.mActive.size()) {
            throw new IllegalStateException("Fragement no longer exists for key " + key + ": index " + index);
        }
        Fragment f = this.mActive.get(index);
        if (f != null) {
            return f;
        }
        throw new IllegalStateException("Fragement no longer exists for key " + key + ": index " + index);
    }

    public Fragment.SavedState saveFragmentInstanceState(Fragment fragment) {
        Bundle result;
        if (fragment.mIndex < 0) {
            throw new IllegalStateException("Fragment " + fragment + " is not currently in the FragmentManager");
        } else if (fragment.mState <= 0 || (result = saveFragmentBasicState(fragment)) == null) {
            return null;
        } else {
            return new Fragment.SavedState(result);
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("FragmentManager{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" in ");
        DebugUtils.buildShortClassTag(this.mActivity, sb);
        sb.append("}}");
        return sb.toString();
    }

    public void dump(String prefix, FileDescriptor fd, PrintWriter writer, String[] args) {
        int N;
        int N2;
        int N3;
        int N4;
        int N5;
        int N6;
        String innerPrefix = prefix + "    ";
        if (this.mActive != null && (N6 = this.mActive.size()) > 0) {
            writer.print(prefix);
            writer.print("Active Fragments in ");
            writer.print(Integer.toHexString(System.identityHashCode(this)));
            writer.println(":");
            for (int i = 0; i < N6; i++) {
                Fragment f = this.mActive.get(i);
                writer.print(prefix);
                writer.print("  #");
                writer.print(i);
                writer.print(": ");
                writer.println(f);
                if (f != null) {
                    f.dump(innerPrefix, fd, writer, args);
                }
            }
        }
        if (this.mAdded != null && (N5 = this.mAdded.size()) > 0) {
            writer.print(prefix);
            writer.println("Added Fragments:");
            for (int i2 = 0; i2 < N5; i2++) {
                writer.print(prefix);
                writer.print("  #");
                writer.print(i2);
                writer.print(": ");
                writer.println(this.mAdded.get(i2).toString());
            }
        }
        if (this.mCreatedMenus != null && (N4 = this.mCreatedMenus.size()) > 0) {
            writer.print(prefix);
            writer.println("Fragments Created Menus:");
            for (int i3 = 0; i3 < N4; i3++) {
                writer.print(prefix);
                writer.print("  #");
                writer.print(i3);
                writer.print(": ");
                writer.println(this.mCreatedMenus.get(i3).toString());
            }
        }
        if (this.mBackStack != null && (N3 = this.mBackStack.size()) > 0) {
            writer.print(prefix);
            writer.println("Back Stack:");
            for (int i4 = 0; i4 < N3; i4++) {
                BackStackRecord bs = this.mBackStack.get(i4);
                writer.print(prefix);
                writer.print("  #");
                writer.print(i4);
                writer.print(": ");
                writer.println(bs.toString());
                bs.dump(innerPrefix, fd, writer, args);
            }
        }
        synchronized (this) {
            if (this.mBackStackIndices != null && (N2 = this.mBackStackIndices.size()) > 0) {
                writer.print(prefix);
                writer.println("Back Stack Indices:");
                for (int i5 = 0; i5 < N2; i5++) {
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i5);
                    writer.print(": ");
                    writer.println(this.mBackStackIndices.get(i5));
                }
            }
            if (this.mAvailBackStackIndices != null && this.mAvailBackStackIndices.size() > 0) {
                writer.print(prefix);
                writer.print("mAvailBackStackIndices: ");
                writer.println(Arrays.toString(this.mAvailBackStackIndices.toArray()));
            }
        }
        if (this.mPendingActions != null && (N = this.mPendingActions.size()) > 0) {
            writer.print(prefix);
            writer.println("Pending Actions:");
            for (int i6 = 0; i6 < N; i6++) {
                writer.print(prefix);
                writer.print("  #");
                writer.print(i6);
                writer.print(": ");
                writer.println(this.mPendingActions.get(i6));
            }
        }
        writer.print(prefix);
        writer.println("FragmentManager misc state:");
        writer.print(prefix);
        writer.print("  mCurState=");
        writer.print(this.mCurState);
        writer.print(" mStateSaved=");
        writer.print(this.mStateSaved);
        writer.print(" mDestroyed=");
        writer.println(this.mDestroyed);
        if (this.mNeedMenuInvalidate) {
            writer.print(prefix);
            writer.print("  mNeedMenuInvalidate=");
            writer.println(this.mNeedMenuInvalidate);
        }
        if (this.mNoTransactionsBecause != null) {
            writer.print(prefix);
            writer.print("  mNoTransactionsBecause=");
            writer.println(this.mNoTransactionsBecause);
        }
        if (this.mAvailIndices != null && this.mAvailIndices.size() > 0) {
            writer.print(prefix);
            writer.print("  mAvailIndices: ");
            writer.println(Arrays.toString(this.mAvailIndices.toArray()));
        }
    }

    static Animation makeOpenCloseAnimation(Context context, float startScale, float endScale, float startAlpha, float endAlpha) {
        AnimationSet set = new AnimationSet(false);
        ScaleAnimation scale = new ScaleAnimation(startScale, endScale, startScale, endScale, 1, 0.5f, 1, 0.5f);
        scale.setInterpolator(DECELERATE_QUINT);
        scale.setDuration(220);
        set.addAnimation(scale);
        AlphaAnimation alpha = new AlphaAnimation(startAlpha, endAlpha);
        alpha.setInterpolator(DECELERATE_CUBIC);
        alpha.setDuration(220);
        set.addAnimation(alpha);
        return set;
    }

    static Animation makeFadeAnimation(Context context, float start, float end) {
        AlphaAnimation anim = new AlphaAnimation(start, end);
        anim.setInterpolator(DECELERATE_CUBIC);
        anim.setDuration(220);
        return anim;
    }

    /* access modifiers changed from: package-private */
    public Animation loadAnimation(Fragment fragment, int transit, boolean enter, int transitionStyle) {
        Animation anim;
        Animation animObj = fragment.onCreateAnimation(transit, enter, fragment.mNextAnim);
        if (animObj != null) {
            return animObj;
        }
        if (fragment.mNextAnim != 0 && (anim = AnimationUtils.loadAnimation(this.mActivity, fragment.mNextAnim)) != null) {
            return anim;
        }
        if (transit == 0) {
            return null;
        }
        int styleIndex = transitToStyleIndex(transit, enter);
        if (styleIndex < 0) {
            return null;
        }
        switch (styleIndex) {
            case 1:
                return makeOpenCloseAnimation(this.mActivity, 1.125f, 1.0f, BitmapDescriptorFactory.HUE_RED, 1.0f);
            case 2:
                return makeOpenCloseAnimation(this.mActivity, 1.0f, 0.975f, 1.0f, BitmapDescriptorFactory.HUE_RED);
            case 3:
                return makeOpenCloseAnimation(this.mActivity, 0.975f, 1.0f, BitmapDescriptorFactory.HUE_RED, 1.0f);
            case 4:
                return makeOpenCloseAnimation(this.mActivity, 1.0f, 1.075f, 1.0f, BitmapDescriptorFactory.HUE_RED);
            case 5:
                return makeFadeAnimation(this.mActivity, BitmapDescriptorFactory.HUE_RED, 1.0f);
            case 6:
                return makeFadeAnimation(this.mActivity, 1.0f, BitmapDescriptorFactory.HUE_RED);
            default:
                if (transitionStyle == 0 && this.mActivity.getWindow() != null) {
                    transitionStyle = this.mActivity.getWindow().getAttributes().windowAnimations;
                }
                if (transitionStyle == 0) {
                    return null;
                }
                return null;
        }
    }

    public void performPendingDeferredStart(Fragment f) {
        if (!f.mDeferStart) {
            return;
        }
        if (this.mExecutingActions) {
            this.mHavePendingDeferredStart = true;
            return;
        }
        f.mDeferStart = false;
        moveToState(f, this.mCurState, 0, 0, false);
    }

    /* access modifiers changed from: package-private */
    /* JADX WARNING: Code restructure failed: missing block: B:100:0x0227, code lost:
        if (DEBUG == false) goto L_0x0241;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:101:0x0229, code lost:
        android.util.Log.v(TAG, "moveto STARTED: " + r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:102:0x0241, code lost:
        r11.mCalled = false;
        r11.performStart();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:103:0x0249, code lost:
        if (r11.mCalled != false) goto L_0x026a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:105:0x0269, code lost:
        throw new android.support.v4.app.SuperNotCalledException("Fragment " + r11 + " did not call through to super.onStart()");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:107:0x026b, code lost:
        if (r12 <= 4) goto L_0x0042;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:109:0x026f, code lost:
        if (DEBUG == false) goto L_0x0289;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:110:0x0271, code lost:
        android.util.Log.v(TAG, "moveto RESUMED: " + r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:111:0x0289, code lost:
        r11.mCalled = false;
        r11.mResumed = true;
        r11.onResume();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:112:0x0294, code lost:
        if (r11.mCalled != false) goto L_0x02b5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:114:0x02b4, code lost:
        throw new android.support.v4.app.SuperNotCalledException("Fragment " + r11 + " did not call through to super.onResume()");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:115:0x02b5, code lost:
        r11.mSavedFragmentState = null;
        r11.mSavedViewState = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:121:0x02c9, code lost:
        if (r12 >= 1) goto L_0x0042;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:123:0x02cd, code lost:
        if (r10.mDestroyed == false) goto L_0x02db;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:125:0x02d1, code lost:
        if (r11.mAnimatingAway == null) goto L_0x02db;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:126:0x02d3, code lost:
        r9 = r11.mAnimatingAway;
        r11.mAnimatingAway = null;
        r9.clearAnimation();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:128:0x02dd, code lost:
        if (r11.mAnimatingAway == null) goto L_0x0432;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:129:0x02df, code lost:
        r11.mStateAfterAnimating = r12;
        r12 = 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:141:0x0330, code lost:
        if (r12 >= 4) goto L_0x0377;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:143:0x0334, code lost:
        if (DEBUG == false) goto L_0x034e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:144:0x0336, code lost:
        android.util.Log.v(TAG, "movefrom STARTED: " + r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:145:0x034e, code lost:
        r11.mCalled = false;
        r11.performStop();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:146:0x0356, code lost:
        if (r11.mCalled != false) goto L_0x0377;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:148:0x0376, code lost:
        throw new android.support.v4.app.SuperNotCalledException("Fragment " + r11 + " did not call through to super.onStop()");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:150:0x0378, code lost:
        if (r12 >= 3) goto L_0x0399;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:152:0x037c, code lost:
        if (DEBUG == false) goto L_0x0396;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:153:0x037e, code lost:
        android.util.Log.v(TAG, "movefrom STOPPED: " + r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:154:0x0396, code lost:
        r11.performReallyStop();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:156:0x039a, code lost:
        if (r12 >= 2) goto L_0x02c8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:158:0x039e, code lost:
        if (DEBUG == false) goto L_0x03b8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:159:0x03a0, code lost:
        android.util.Log.v(TAG, "movefrom ACTIVITY_CREATED: " + r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:161:0x03ba, code lost:
        if (r11.mView == null) goto L_0x03cb;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:163:0x03c2, code lost:
        if (r10.mActivity.isFinishing() != false) goto L_0x03cb;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:165:0x03c6, code lost:
        if (r11.mSavedViewState != null) goto L_0x03cb;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:166:0x03c8, code lost:
        saveFragmentViewState(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:167:0x03cb, code lost:
        r11.mCalled = false;
        r11.performDestroyView();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:168:0x03d3, code lost:
        if (r11.mCalled != false) goto L_0x03f4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:170:0x03f3, code lost:
        throw new android.support.v4.app.SuperNotCalledException("Fragment " + r11 + " did not call through to super.onDestroyView()");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:172:0x03f6, code lost:
        if (r11.mView == null) goto L_0x0427;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:174:0x03fa, code lost:
        if (r11.mContainer == null) goto L_0x0427;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:175:0x03fc, code lost:
        r6 = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:176:0x03ff, code lost:
        if (r10.mCurState <= 0) goto L_0x040a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:178:0x0403, code lost:
        if (r10.mDestroyed != false) goto L_0x040a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:179:0x0405, code lost:
        r6 = loadAnimation(r11, r13, false, r14);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:180:0x040a, code lost:
        if (r6 == null) goto L_0x0420;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:181:0x040c, code lost:
        r8 = r11;
        r11.mAnimatingAway = r11.mView;
        r11.mStateAfterAnimating = r12;
        r6.setAnimationListener(new android.support.v4.app.FragmentManagerImpl.AnonymousClass5(r10));
        r11.mView.startAnimation(r6);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:182:0x0420, code lost:
        r11.mContainer.removeView(r11.mView);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:183:0x0427, code lost:
        r11.mContainer = null;
        r11.mView = null;
        r11.mInnerView = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:185:0x0434, code lost:
        if (DEBUG == false) goto L_0x044e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:186:0x0436, code lost:
        android.util.Log.v(TAG, "movefrom CREATED: " + r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:188:0x0450, code lost:
        if (r11.mRetaining != false) goto L_0x047b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:189:0x0452, code lost:
        r11.mCalled = false;
        r11.onDestroy();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:190:0x045a, code lost:
        if (r11.mCalled != false) goto L_0x047b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:192:0x047a, code lost:
        throw new android.support.v4.app.SuperNotCalledException("Fragment " + r11 + " did not call through to super.onDestroy()");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:193:0x047b, code lost:
        r11.mCalled = false;
        r11.onDetach();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:194:0x0483, code lost:
        if (r11.mCalled != false) goto L_0x04a4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:196:0x04a3, code lost:
        throw new android.support.v4.app.SuperNotCalledException("Fragment " + r11 + " did not call through to super.onDetach()");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:197:0x04a4, code lost:
        if (r15 != false) goto L_0x0042;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:199:0x04a8, code lost:
        if (r11.mRetaining != false) goto L_0x04af;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:200:0x04aa, code lost:
        makeInactive(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:201:0x04af, code lost:
        r11.mActivity = null;
        r11.mFragmentManager = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x0140, code lost:
        if (r12 <= 1) goto L_0x0222;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:63:0x0144, code lost:
        if (DEBUG == false) goto L_0x015e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x0146, code lost:
        android.util.Log.v(TAG, "moveto ACTIVITY_CREATED: " + r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x0160, code lost:
        if (r11.mFromLayout != false) goto L_0x01e9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x0162, code lost:
        r7 = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:68:0x0165, code lost:
        if (r11.mContainerId == 0) goto L_0x01a4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:69:0x0167, code lost:
        r7 = (android.view.ViewGroup) r10.mActivity.findViewById(r11.mContainerId);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x0171, code lost:
        if (r7 != null) goto L_0x01a4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x0175, code lost:
        if (r11.mRestored != false) goto L_0x01a4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:74:0x019f, code lost:
        throw new java.lang.IllegalArgumentException("No view found for id 0x" + java.lang.Integer.toHexString(r11.mContainerId) + " for fragment " + r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:76:0x01a4, code lost:
        r11.mContainer = r7;
        r11.mView = r11.onCreateView(r11.getLayoutInflater(r11.mSavedFragmentState), r7, r11.mSavedFragmentState);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:77:0x01b6, code lost:
        if (r11.mView == null) goto L_0x0214;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:78:0x01b8, code lost:
        r11.mInnerView = r11.mView;
        r11.mView = android.support.v4.app.NoSaveStateFrameLayout.wrap(r11.mView);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:79:0x01c4, code lost:
        if (r7 == null) goto L_0x01d7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:80:0x01c6, code lost:
        r6 = loadAnimation(r11, r13, true, r14);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:81:0x01cb, code lost:
        if (r6 == null) goto L_0x01d2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:82:0x01cd, code lost:
        r11.mView.startAnimation(r6);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:83:0x01d2, code lost:
        r7.addView(r11.mView);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:85:0x01d9, code lost:
        if (r11.mHidden == false) goto L_0x01e2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:86:0x01db, code lost:
        r11.mView.setVisibility(8);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:87:0x01e2, code lost:
        r11.onViewCreated(r11.mView, r11.mSavedFragmentState);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:88:0x01e9, code lost:
        r11.mCalled = false;
        r11.onActivityCreated(r11.mSavedFragmentState);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:89:0x01f3, code lost:
        if (r11.mCalled != false) goto L_0x0218;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:91:0x0213, code lost:
        throw new android.support.v4.app.SuperNotCalledException("Fragment " + r11 + " did not call through to super.onActivityCreated()");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:92:0x0214, code lost:
        r11.mInnerView = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:94:0x021a, code lost:
        if (r11.mView == null) goto L_0x021f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:95:0x021c, code lost:
        r11.restoreViewState();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:96:0x021f, code lost:
        r11.mSavedFragmentState = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:98:0x0223, code lost:
        if (r12 <= 3) goto L_0x026a;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void moveToState(android.support.v4.app.Fragment r11, int r12, int r13, int r14, boolean r15) {
        /*
            r10 = this;
            boolean r0 = r11.mAdded
            if (r0 != 0) goto L_0x0008
            r0 = 1
            if (r12 <= r0) goto L_0x0008
            r12 = 1
        L_0x0008:
            boolean r0 = r11.mRemoving
            if (r0 == 0) goto L_0x0012
            int r0 = r11.mState
            if (r12 <= r0) goto L_0x0012
            int r12 = r11.mState
        L_0x0012:
            boolean r0 = r11.mDeferStart
            if (r0 == 0) goto L_0x001f
            int r0 = r11.mState
            r1 = 4
            if (r0 >= r1) goto L_0x001f
            r0 = 3
            if (r12 <= r0) goto L_0x001f
            r12 = 3
        L_0x001f:
            int r0 = r11.mState
            if (r0 >= r12) goto L_0x02bd
            boolean r0 = r11.mFromLayout
            if (r0 == 0) goto L_0x002c
            boolean r0 = r11.mInLayout
            if (r0 != 0) goto L_0x002c
        L_0x002b:
            return
        L_0x002c:
            android.view.View r0 = r11.mAnimatingAway
            if (r0 == 0) goto L_0x003d
            r0 = 0
            r11.mAnimatingAway = r0
            int r2 = r11.mStateAfterAnimating
            r3 = 0
            r4 = 0
            r5 = 1
            r0 = r10
            r1 = r11
            r0.moveToState(r1, r2, r3, r4, r5)
        L_0x003d:
            int r0 = r11.mState
            switch(r0) {
                case 0: goto L_0x0045;
                case 1: goto L_0x013f;
                case 2: goto L_0x0222;
                case 3: goto L_0x0222;
                case 4: goto L_0x026a;
                default: goto L_0x0042;
            }
        L_0x0042:
            r11.mState = r12
            goto L_0x002b
        L_0x0045:
            boolean r0 = DEBUG
            if (r0 == 0) goto L_0x0061
            java.lang.String r0 = "FragmentManager"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "moveto CREATED: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r1 = r1.toString()
            android.util.Log.v(r0, r1)
        L_0x0061:
            android.os.Bundle r0 = r11.mSavedFragmentState
            if (r0 == 0) goto L_0x009e
            android.os.Bundle r0 = r11.mSavedFragmentState
            java.lang.String r1 = "android:view_state"
            android.util.SparseArray r0 = r0.getSparseParcelableArray(r1)
            r11.mSavedViewState = r0
            android.os.Bundle r0 = r11.mSavedFragmentState
            java.lang.String r1 = "android:target_state"
            android.support.v4.app.Fragment r0 = r10.getFragment(r0, r1)
            r11.mTarget = r0
            android.support.v4.app.Fragment r0 = r11.mTarget
            if (r0 == 0) goto L_0x0088
            android.os.Bundle r0 = r11.mSavedFragmentState
            java.lang.String r1 = "android:target_req_state"
            r2 = 0
            int r0 = r0.getInt(r1, r2)
            r11.mTargetRequestCode = r0
        L_0x0088:
            android.os.Bundle r0 = r11.mSavedFragmentState
            java.lang.String r1 = "android:user_visible_hint"
            r2 = 1
            boolean r0 = r0.getBoolean(r1, r2)
            r11.mUserVisibleHint = r0
            boolean r0 = r11.mUserVisibleHint
            if (r0 != 0) goto L_0x009e
            r0 = 1
            r11.mDeferStart = r0
            r0 = 3
            if (r12 <= r0) goto L_0x009e
            r12 = 3
        L_0x009e:
            android.support.v4.app.FragmentActivity r0 = r10.mActivity
            r11.mActivity = r0
            android.support.v4.app.FragmentActivity r0 = r10.mActivity
            android.support.v4.app.FragmentManagerImpl r0 = r0.mFragments
            r11.mFragmentManager = r0
            r0 = 0
            r11.mCalled = r0
            android.support.v4.app.FragmentActivity r0 = r10.mActivity
            r11.onAttach(r0)
            boolean r0 = r11.mCalled
            if (r0 != 0) goto L_0x00d3
            android.support.v4.app.SuperNotCalledException r0 = new android.support.v4.app.SuperNotCalledException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Fragment "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r2 = " did not call through to super.onAttach()"
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x00d3:
            android.support.v4.app.FragmentActivity r0 = r10.mActivity
            r0.onAttachFragment(r11)
            boolean r0 = r11.mRetaining
            if (r0 != 0) goto L_0x0107
            r0 = 0
            r11.mCalled = r0
            android.os.Bundle r0 = r11.mSavedFragmentState
            r11.onCreate(r0)
            boolean r0 = r11.mCalled
            if (r0 != 0) goto L_0x0107
            android.support.v4.app.SuperNotCalledException r0 = new android.support.v4.app.SuperNotCalledException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Fragment "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r2 = " did not call through to super.onCreate()"
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x0107:
            r0 = 0
            r11.mRetaining = r0
            boolean r0 = r11.mFromLayout
            if (r0 == 0) goto L_0x013f
            android.os.Bundle r0 = r11.mSavedFragmentState
            android.view.LayoutInflater r0 = r11.getLayoutInflater(r0)
            r1 = 0
            android.os.Bundle r2 = r11.mSavedFragmentState
            android.view.View r0 = r11.onCreateView(r0, r1, r2)
            r11.mView = r0
            android.view.View r0 = r11.mView
            if (r0 == 0) goto L_0x01a0
            android.view.View r0 = r11.mView
            r11.mInnerView = r0
            android.view.View r0 = r11.mView
            android.view.ViewGroup r0 = android.support.v4.app.NoSaveStateFrameLayout.wrap(r0)
            r11.mView = r0
            boolean r0 = r11.mHidden
            if (r0 == 0) goto L_0x0138
            android.view.View r0 = r11.mView
            r1 = 8
            r0.setVisibility(r1)
        L_0x0138:
            android.view.View r0 = r11.mView
            android.os.Bundle r1 = r11.mSavedFragmentState
            r11.onViewCreated(r0, r1)
        L_0x013f:
            r0 = 1
            if (r12 <= r0) goto L_0x0222
            boolean r0 = DEBUG
            if (r0 == 0) goto L_0x015e
            java.lang.String r0 = "FragmentManager"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "moveto ACTIVITY_CREATED: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r1 = r1.toString()
            android.util.Log.v(r0, r1)
        L_0x015e:
            boolean r0 = r11.mFromLayout
            if (r0 != 0) goto L_0x01e9
            r7 = 0
            int r0 = r11.mContainerId
            if (r0 == 0) goto L_0x01a4
            android.support.v4.app.FragmentActivity r0 = r10.mActivity
            int r1 = r11.mContainerId
            android.view.View r7 = r0.findViewById(r1)
            android.view.ViewGroup r7 = (android.view.ViewGroup) r7
            if (r7 != 0) goto L_0x01a4
            boolean r0 = r11.mRestored
            if (r0 != 0) goto L_0x01a4
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "No view found for id 0x"
            java.lang.StringBuilder r1 = r1.append(r2)
            int r2 = r11.mContainerId
            java.lang.String r2 = java.lang.Integer.toHexString(r2)
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r2 = " for fragment "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x01a0:
            r0 = 0
            r11.mInnerView = r0
            goto L_0x013f
        L_0x01a4:
            r11.mContainer = r7
            android.os.Bundle r0 = r11.mSavedFragmentState
            android.view.LayoutInflater r0 = r11.getLayoutInflater(r0)
            android.os.Bundle r1 = r11.mSavedFragmentState
            android.view.View r0 = r11.onCreateView(r0, r7, r1)
            r11.mView = r0
            android.view.View r0 = r11.mView
            if (r0 == 0) goto L_0x0214
            android.view.View r0 = r11.mView
            r11.mInnerView = r0
            android.view.View r0 = r11.mView
            android.view.ViewGroup r0 = android.support.v4.app.NoSaveStateFrameLayout.wrap(r0)
            r11.mView = r0
            if (r7 == 0) goto L_0x01d7
            r0 = 1
            android.view.animation.Animation r6 = r10.loadAnimation(r11, r13, r0, r14)
            if (r6 == 0) goto L_0x01d2
            android.view.View r0 = r11.mView
            r0.startAnimation(r6)
        L_0x01d2:
            android.view.View r0 = r11.mView
            r7.addView(r0)
        L_0x01d7:
            boolean r0 = r11.mHidden
            if (r0 == 0) goto L_0x01e2
            android.view.View r0 = r11.mView
            r1 = 8
            r0.setVisibility(r1)
        L_0x01e2:
            android.view.View r0 = r11.mView
            android.os.Bundle r1 = r11.mSavedFragmentState
            r11.onViewCreated(r0, r1)
        L_0x01e9:
            r0 = 0
            r11.mCalled = r0
            android.os.Bundle r0 = r11.mSavedFragmentState
            r11.onActivityCreated(r0)
            boolean r0 = r11.mCalled
            if (r0 != 0) goto L_0x0218
            android.support.v4.app.SuperNotCalledException r0 = new android.support.v4.app.SuperNotCalledException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Fragment "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r2 = " did not call through to super.onActivityCreated()"
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x0214:
            r0 = 0
            r11.mInnerView = r0
            goto L_0x01e9
        L_0x0218:
            android.view.View r0 = r11.mView
            if (r0 == 0) goto L_0x021f
            r11.restoreViewState()
        L_0x021f:
            r0 = 0
            r11.mSavedFragmentState = r0
        L_0x0222:
            r0 = 3
            if (r12 <= r0) goto L_0x026a
            boolean r0 = DEBUG
            if (r0 == 0) goto L_0x0241
            java.lang.String r0 = "FragmentManager"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "moveto STARTED: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r1 = r1.toString()
            android.util.Log.v(r0, r1)
        L_0x0241:
            r0 = 0
            r11.mCalled = r0
            r11.performStart()
            boolean r0 = r11.mCalled
            if (r0 != 0) goto L_0x026a
            android.support.v4.app.SuperNotCalledException r0 = new android.support.v4.app.SuperNotCalledException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Fragment "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r2 = " did not call through to super.onStart()"
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x026a:
            r0 = 4
            if (r12 <= r0) goto L_0x0042
            boolean r0 = DEBUG
            if (r0 == 0) goto L_0x0289
            java.lang.String r0 = "FragmentManager"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "moveto RESUMED: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r1 = r1.toString()
            android.util.Log.v(r0, r1)
        L_0x0289:
            r0 = 0
            r11.mCalled = r0
            r0 = 1
            r11.mResumed = r0
            r11.onResume()
            boolean r0 = r11.mCalled
            if (r0 != 0) goto L_0x02b5
            android.support.v4.app.SuperNotCalledException r0 = new android.support.v4.app.SuperNotCalledException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Fragment "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r2 = " did not call through to super.onResume()"
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x02b5:
            r0 = 0
            r11.mSavedFragmentState = r0
            r0 = 0
            r11.mSavedViewState = r0
            goto L_0x0042
        L_0x02bd:
            int r0 = r11.mState
            if (r0 <= r12) goto L_0x0042
            int r0 = r11.mState
            switch(r0) {
                case 1: goto L_0x02c8;
                case 2: goto L_0x0399;
                case 3: goto L_0x0377;
                case 4: goto L_0x032f;
                case 5: goto L_0x02e4;
                default: goto L_0x02c6;
            }
        L_0x02c6:
            goto L_0x0042
        L_0x02c8:
            r0 = 1
            if (r12 >= r0) goto L_0x0042
            boolean r0 = r10.mDestroyed
            if (r0 == 0) goto L_0x02db
            android.view.View r0 = r11.mAnimatingAway
            if (r0 == 0) goto L_0x02db
            android.view.View r9 = r11.mAnimatingAway
            r0 = 0
            r11.mAnimatingAway = r0
            r9.clearAnimation()
        L_0x02db:
            android.view.View r0 = r11.mAnimatingAway
            if (r0 == 0) goto L_0x0432
            r11.mStateAfterAnimating = r12
            r12 = 1
            goto L_0x0042
        L_0x02e4:
            r0 = 5
            if (r12 >= r0) goto L_0x032f
            boolean r0 = DEBUG
            if (r0 == 0) goto L_0x0303
            java.lang.String r0 = "FragmentManager"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "movefrom RESUMED: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r1 = r1.toString()
            android.util.Log.v(r0, r1)
        L_0x0303:
            r0 = 0
            r11.mCalled = r0
            r11.onPause()
            boolean r0 = r11.mCalled
            if (r0 != 0) goto L_0x032c
            android.support.v4.app.SuperNotCalledException r0 = new android.support.v4.app.SuperNotCalledException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Fragment "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r2 = " did not call through to super.onPause()"
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x032c:
            r0 = 0
            r11.mResumed = r0
        L_0x032f:
            r0 = 4
            if (r12 >= r0) goto L_0x0377
            boolean r0 = DEBUG
            if (r0 == 0) goto L_0x034e
            java.lang.String r0 = "FragmentManager"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "movefrom STARTED: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r1 = r1.toString()
            android.util.Log.v(r0, r1)
        L_0x034e:
            r0 = 0
            r11.mCalled = r0
            r11.performStop()
            boolean r0 = r11.mCalled
            if (r0 != 0) goto L_0x0377
            android.support.v4.app.SuperNotCalledException r0 = new android.support.v4.app.SuperNotCalledException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Fragment "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r2 = " did not call through to super.onStop()"
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x0377:
            r0 = 3
            if (r12 >= r0) goto L_0x0399
            boolean r0 = DEBUG
            if (r0 == 0) goto L_0x0396
            java.lang.String r0 = "FragmentManager"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "movefrom STOPPED: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r1 = r1.toString()
            android.util.Log.v(r0, r1)
        L_0x0396:
            r11.performReallyStop()
        L_0x0399:
            r0 = 2
            if (r12 >= r0) goto L_0x02c8
            boolean r0 = DEBUG
            if (r0 == 0) goto L_0x03b8
            java.lang.String r0 = "FragmentManager"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "movefrom ACTIVITY_CREATED: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r1 = r1.toString()
            android.util.Log.v(r0, r1)
        L_0x03b8:
            android.view.View r0 = r11.mView
            if (r0 == 0) goto L_0x03cb
            android.support.v4.app.FragmentActivity r0 = r10.mActivity
            boolean r0 = r0.isFinishing()
            if (r0 != 0) goto L_0x03cb
            android.util.SparseArray<android.os.Parcelable> r0 = r11.mSavedViewState
            if (r0 != 0) goto L_0x03cb
            r10.saveFragmentViewState(r11)
        L_0x03cb:
            r0 = 0
            r11.mCalled = r0
            r11.performDestroyView()
            boolean r0 = r11.mCalled
            if (r0 != 0) goto L_0x03f4
            android.support.v4.app.SuperNotCalledException r0 = new android.support.v4.app.SuperNotCalledException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Fragment "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r2 = " did not call through to super.onDestroyView()"
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x03f4:
            android.view.View r0 = r11.mView
            if (r0 == 0) goto L_0x0427
            android.view.ViewGroup r0 = r11.mContainer
            if (r0 == 0) goto L_0x0427
            r6 = 0
            int r0 = r10.mCurState
            if (r0 <= 0) goto L_0x040a
            boolean r0 = r10.mDestroyed
            if (r0 != 0) goto L_0x040a
            r0 = 0
            android.view.animation.Animation r6 = r10.loadAnimation(r11, r13, r0, r14)
        L_0x040a:
            if (r6 == 0) goto L_0x0420
            r8 = r11
            android.view.View r0 = r11.mView
            r11.mAnimatingAway = r0
            r11.mStateAfterAnimating = r12
            android.support.v4.app.FragmentManagerImpl$5 r0 = new android.support.v4.app.FragmentManagerImpl$5
            r0.<init>(r8)
            r6.setAnimationListener(r0)
            android.view.View r0 = r11.mView
            r0.startAnimation(r6)
        L_0x0420:
            android.view.ViewGroup r0 = r11.mContainer
            android.view.View r1 = r11.mView
            r0.removeView(r1)
        L_0x0427:
            r0 = 0
            r11.mContainer = r0
            r0 = 0
            r11.mView = r0
            r0 = 0
            r11.mInnerView = r0
            goto L_0x02c8
        L_0x0432:
            boolean r0 = DEBUG
            if (r0 == 0) goto L_0x044e
            java.lang.String r0 = "FragmentManager"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "movefrom CREATED: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r1 = r1.toString()
            android.util.Log.v(r0, r1)
        L_0x044e:
            boolean r0 = r11.mRetaining
            if (r0 != 0) goto L_0x047b
            r0 = 0
            r11.mCalled = r0
            r11.onDestroy()
            boolean r0 = r11.mCalled
            if (r0 != 0) goto L_0x047b
            android.support.v4.app.SuperNotCalledException r0 = new android.support.v4.app.SuperNotCalledException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Fragment "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r2 = " did not call through to super.onDestroy()"
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x047b:
            r0 = 0
            r11.mCalled = r0
            r11.onDetach()
            boolean r0 = r11.mCalled
            if (r0 != 0) goto L_0x04a4
            android.support.v4.app.SuperNotCalledException r0 = new android.support.v4.app.SuperNotCalledException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Fragment "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r11)
            java.lang.String r2 = " did not call through to super.onDetach()"
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        L_0x04a4:
            if (r15 != 0) goto L_0x0042
            boolean r0 = r11.mRetaining
            if (r0 != 0) goto L_0x04af
            r10.makeInactive(r11)
            goto L_0x0042
        L_0x04af:
            r0 = 0
            r11.mActivity = r0
            r0 = 0
            r11.mFragmentManager = r0
            goto L_0x0042
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.app.FragmentManagerImpl.moveToState(android.support.v4.app.Fragment, int, int, int, boolean):void");
    }

    /* access modifiers changed from: package-private */
    public void moveToState(Fragment f) {
        moveToState(f, this.mCurState, 0, 0, false);
    }

    /* access modifiers changed from: package-private */
    public void moveToState(int newState, boolean always) {
        moveToState(newState, 0, 0, always);
    }

    /* access modifiers changed from: package-private */
    public void moveToState(int newState, int transit, int transitStyle, boolean always) {
        if (this.mActivity == null && newState != 0) {
            throw new IllegalStateException("No activity");
        } else if (always || this.mCurState != newState) {
            this.mCurState = newState;
            if (this.mActive != null) {
                boolean loadersRunning = false;
                for (int i = 0; i < this.mActive.size(); i++) {
                    Fragment f = this.mActive.get(i);
                    if (f != null) {
                        moveToState(f, newState, transit, transitStyle, false);
                        if (f.mLoaderManager != null) {
                            loadersRunning |= f.mLoaderManager.hasRunningLoaders();
                        }
                    }
                }
                if (!loadersRunning) {
                    startPendingDeferredFragments();
                }
                if (this.mNeedMenuInvalidate && this.mActivity != null && this.mCurState == 5) {
                    this.mActivity.supportInvalidateOptionsMenu();
                    this.mNeedMenuInvalidate = false;
                }
            }
        }
    }

    /* access modifiers changed from: package-private */
    public void startPendingDeferredFragments() {
        if (this.mActive != null) {
            for (int i = 0; i < this.mActive.size(); i++) {
                Fragment f = this.mActive.get(i);
                if (f != null) {
                    performPendingDeferredStart(f);
                }
            }
        }
    }

    /* access modifiers changed from: package-private */
    public void makeActive(Fragment f) {
        if (f.mIndex < 0) {
            if (this.mAvailIndices == null || this.mAvailIndices.size() <= 0) {
                if (this.mActive == null) {
                    this.mActive = new ArrayList<>();
                }
                f.setIndex(this.mActive.size());
                this.mActive.add(f);
            } else {
                f.setIndex(this.mAvailIndices.remove(this.mAvailIndices.size() - 1).intValue());
                this.mActive.set(f.mIndex, f);
            }
            if (DEBUG) {
                Log.v(TAG, "Allocated fragment index " + f);
            }
        }
    }

    /* access modifiers changed from: package-private */
    public void makeInactive(Fragment f) {
        if (f.mIndex >= 0) {
            if (DEBUG) {
                Log.v(TAG, "Freeing fragment index " + f);
            }
            this.mActive.set(f.mIndex, (Object) null);
            if (this.mAvailIndices == null) {
                this.mAvailIndices = new ArrayList<>();
            }
            this.mAvailIndices.add(Integer.valueOf(f.mIndex));
            this.mActivity.invalidateSupportFragmentIndex(f.mIndex);
            f.initState();
        }
    }

    public void addFragment(Fragment fragment, boolean moveToStateNow) {
        if (this.mAdded == null) {
            this.mAdded = new ArrayList<>();
        }
        if (DEBUG) {
            Log.v(TAG, "add: " + fragment);
        }
        makeActive(fragment);
        if (!fragment.mDetached) {
            this.mAdded.add(fragment);
            fragment.mAdded = true;
            fragment.mRemoving = false;
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            if (moveToStateNow) {
                moveToState(fragment);
            }
        }
    }

    public void removeFragment(Fragment fragment, int transition, int transitionStyle) {
        boolean inactive;
        int i;
        if (DEBUG) {
            Log.v(TAG, "remove: " + fragment + " nesting=" + fragment.mBackStackNesting);
        }
        if (!fragment.isInBackStack()) {
            inactive = true;
        } else {
            inactive = false;
        }
        if (!fragment.mDetached || inactive) {
            if (this.mAdded != null) {
                this.mAdded.remove(fragment);
            }
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.mAdded = false;
            fragment.mRemoving = true;
            if (inactive) {
                i = 0;
            } else {
                i = 1;
            }
            moveToState(fragment, i, transition, transitionStyle, false);
        }
    }

    public void hideFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            Log.v(TAG, "hide: " + fragment);
        }
        if (!fragment.mHidden) {
            fragment.mHidden = true;
            if (fragment.mView != null) {
                Animation anim = loadAnimation(fragment, transition, true, transitionStyle);
                if (anim != null) {
                    fragment.mView.startAnimation(anim);
                }
                fragment.mView.setVisibility(8);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.onHiddenChanged(true);
        }
    }

    public void showFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            Log.v(TAG, "show: " + fragment);
        }
        if (fragment.mHidden) {
            fragment.mHidden = false;
            if (fragment.mView != null) {
                Animation anim = loadAnimation(fragment, transition, true, transitionStyle);
                if (anim != null) {
                    fragment.mView.startAnimation(anim);
                }
                fragment.mView.setVisibility(0);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.onHiddenChanged(false);
        }
    }

    public void detachFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            Log.v(TAG, "detach: " + fragment);
        }
        if (!fragment.mDetached) {
            fragment.mDetached = true;
            if (fragment.mAdded) {
                if (this.mAdded != null) {
                    this.mAdded.remove(fragment);
                }
                if (fragment.mHasMenu && fragment.mMenuVisible) {
                    this.mNeedMenuInvalidate = true;
                }
                fragment.mAdded = false;
                moveToState(fragment, 1, transition, transitionStyle, false);
            }
        }
    }

    public void attachFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            Log.v(TAG, "attach: " + fragment);
        }
        if (fragment.mDetached) {
            fragment.mDetached = false;
            if (!fragment.mAdded) {
                if (this.mAdded == null) {
                    this.mAdded = new ArrayList<>();
                }
                this.mAdded.add(fragment);
                fragment.mAdded = true;
                if (fragment.mHasMenu && fragment.mMenuVisible) {
                    this.mNeedMenuInvalidate = true;
                }
                moveToState(fragment, this.mCurState, transition, transitionStyle, false);
            }
        }
    }

    public Fragment findFragmentById(int id) {
        if (this.mAdded != null) {
            for (int i = this.mAdded.size() - 1; i >= 0; i--) {
                Fragment f = this.mAdded.get(i);
                if (f != null && f.mFragmentId == id) {
                    return f;
                }
            }
        }
        if (this.mActive != null) {
            for (int i2 = this.mActive.size() - 1; i2 >= 0; i2--) {
                Fragment f2 = this.mActive.get(i2);
                if (f2 != null && f2.mFragmentId == id) {
                    return f2;
                }
            }
        }
        return null;
    }

    public Fragment findFragmentByTag(String tag) {
        if (!(this.mAdded == null || tag == null)) {
            for (int i = this.mAdded.size() - 1; i >= 0; i--) {
                Fragment f = this.mAdded.get(i);
                if (f != null && tag.equals(f.mTag)) {
                    return f;
                }
            }
        }
        if (!(this.mActive == null || tag == null)) {
            for (int i2 = this.mActive.size() - 1; i2 >= 0; i2--) {
                Fragment f2 = this.mActive.get(i2);
                if (f2 != null && tag.equals(f2.mTag)) {
                    return f2;
                }
            }
        }
        return null;
    }

    public Fragment findFragmentByWho(String who) {
        if (!(this.mActive == null || who == null)) {
            for (int i = this.mActive.size() - 1; i >= 0; i--) {
                Fragment f = this.mActive.get(i);
                if (f != null && who.equals(f.mWho)) {
                    return f;
                }
            }
        }
        return null;
    }

    private void checkStateLoss() {
        if (this.mStateSaved) {
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        } else if (this.mNoTransactionsBecause != null) {
            throw new IllegalStateException("Can not perform this action inside of " + this.mNoTransactionsBecause);
        }
    }

    public void enqueueAction(Runnable action, boolean allowStateLoss) {
        if (!allowStateLoss) {
            checkStateLoss();
        }
        synchronized (this) {
            if (this.mActivity == null) {
                throw new IllegalStateException("Activity has been destroyed");
            }
            if (this.mPendingActions == null) {
                this.mPendingActions = new ArrayList<>();
            }
            this.mPendingActions.add(action);
            if (this.mPendingActions.size() == 1) {
                this.mActivity.mHandler.removeCallbacks(this.mExecCommit);
                this.mActivity.mHandler.post(this.mExecCommit);
            }
        }
    }

    public int allocBackStackIndex(BackStackRecord bse) {
        synchronized (this) {
            if (this.mAvailBackStackIndices == null || this.mAvailBackStackIndices.size() <= 0) {
                if (this.mBackStackIndices == null) {
                    this.mBackStackIndices = new ArrayList<>();
                }
                int index = this.mBackStackIndices.size();
                if (DEBUG) {
                    Log.v(TAG, "Setting back stack index " + index + " to " + bse);
                }
                this.mBackStackIndices.add(bse);
                return index;
            }
            int index2 = this.mAvailBackStackIndices.remove(this.mAvailBackStackIndices.size() - 1).intValue();
            if (DEBUG) {
                Log.v(TAG, "Adding back stack index " + index2 + " with " + bse);
            }
            this.mBackStackIndices.set(index2, bse);
            return index2;
        }
    }

    public void setBackStackIndex(int index, BackStackRecord bse) {
        synchronized (this) {
            if (this.mBackStackIndices == null) {
                this.mBackStackIndices = new ArrayList<>();
            }
            int N = this.mBackStackIndices.size();
            if (index < N) {
                if (DEBUG) {
                    Log.v(TAG, "Setting back stack index " + index + " to " + bse);
                }
                this.mBackStackIndices.set(index, bse);
            } else {
                while (N < index) {
                    this.mBackStackIndices.add((Object) null);
                    if (this.mAvailBackStackIndices == null) {
                        this.mAvailBackStackIndices = new ArrayList<>();
                    }
                    if (DEBUG) {
                        Log.v(TAG, "Adding available back stack index " + N);
                    }
                    this.mAvailBackStackIndices.add(Integer.valueOf(N));
                    N++;
                }
                if (DEBUG) {
                    Log.v(TAG, "Adding back stack index " + index + " with " + bse);
                }
                this.mBackStackIndices.add(bse);
            }
        }
    }

    public void freeBackStackIndex(int index) {
        synchronized (this) {
            this.mBackStackIndices.set(index, (Object) null);
            if (this.mAvailBackStackIndices == null) {
                this.mAvailBackStackIndices = new ArrayList<>();
            }
            if (DEBUG) {
                Log.v(TAG, "Freeing back stack index " + index);
            }
            this.mAvailBackStackIndices.add(Integer.valueOf(index));
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:35:0x0081, code lost:
        r8.mExecutingActions = true;
        r2 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:0x0085, code lost:
        if (r2 >= r4) goto L_0x0099;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x0087, code lost:
        r8.mTmpActions[r2].run();
        r8.mTmpActions[r2] = null;
        r2 = r2 + 1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean execPendingActions() {
        /*
            r8 = this;
            r7 = 0
            boolean r5 = r8.mExecutingActions
            if (r5 == 0) goto L_0x000d
            java.lang.IllegalStateException r5 = new java.lang.IllegalStateException
            java.lang.String r6 = "Recursive entry to executePendingTransactions"
            r5.<init>(r6)
            throw r5
        L_0x000d:
            android.os.Looper r5 = android.os.Looper.myLooper()
            android.support.v4.app.FragmentActivity r6 = r8.mActivity
            android.os.Handler r6 = r6.mHandler
            android.os.Looper r6 = r6.getLooper()
            if (r5 == r6) goto L_0x0023
            java.lang.IllegalStateException r5 = new java.lang.IllegalStateException
            java.lang.String r6 = "Must be called from main thread of process"
            r5.<init>(r6)
            throw r5
        L_0x0023:
            r0 = 0
        L_0x0024:
            monitor-enter(r8)
            java.util.ArrayList<java.lang.Runnable> r5 = r8.mPendingActions     // Catch:{ all -> 0x0096 }
            if (r5 == 0) goto L_0x0031
            java.util.ArrayList<java.lang.Runnable> r5 = r8.mPendingActions     // Catch:{ all -> 0x0096 }
            int r5 = r5.size()     // Catch:{ all -> 0x0096 }
            if (r5 != 0) goto L_0x0058
        L_0x0031:
            monitor-exit(r8)     // Catch:{ all -> 0x0096 }
            boolean r5 = r8.mHavePendingDeferredStart
            if (r5 == 0) goto L_0x00a4
            r3 = 0
            r2 = 0
        L_0x0038:
            java.util.ArrayList<android.support.v4.app.Fragment> r5 = r8.mActive
            int r5 = r5.size()
            if (r2 >= r5) goto L_0x009d
            java.util.ArrayList<android.support.v4.app.Fragment> r5 = r8.mActive
            java.lang.Object r1 = r5.get(r2)
            android.support.v4.app.Fragment r1 = (android.support.v4.app.Fragment) r1
            if (r1 == 0) goto L_0x0055
            android.support.v4.app.LoaderManagerImpl r5 = r1.mLoaderManager
            if (r5 == 0) goto L_0x0055
            android.support.v4.app.LoaderManagerImpl r5 = r1.mLoaderManager
            boolean r5 = r5.hasRunningLoaders()
            r3 = r3 | r5
        L_0x0055:
            int r2 = r2 + 1
            goto L_0x0038
        L_0x0058:
            java.util.ArrayList<java.lang.Runnable> r5 = r8.mPendingActions     // Catch:{ all -> 0x0096 }
            int r4 = r5.size()     // Catch:{ all -> 0x0096 }
            java.lang.Runnable[] r5 = r8.mTmpActions     // Catch:{ all -> 0x0096 }
            if (r5 == 0) goto L_0x0067
            java.lang.Runnable[] r5 = r8.mTmpActions     // Catch:{ all -> 0x0096 }
            int r5 = r5.length     // Catch:{ all -> 0x0096 }
            if (r5 >= r4) goto L_0x006b
        L_0x0067:
            java.lang.Runnable[] r5 = new java.lang.Runnable[r4]     // Catch:{ all -> 0x0096 }
            r8.mTmpActions = r5     // Catch:{ all -> 0x0096 }
        L_0x006b:
            java.util.ArrayList<java.lang.Runnable> r5 = r8.mPendingActions     // Catch:{ all -> 0x0096 }
            java.lang.Runnable[] r6 = r8.mTmpActions     // Catch:{ all -> 0x0096 }
            r5.toArray(r6)     // Catch:{ all -> 0x0096 }
            java.util.ArrayList<java.lang.Runnable> r5 = r8.mPendingActions     // Catch:{ all -> 0x0096 }
            r5.clear()     // Catch:{ all -> 0x0096 }
            android.support.v4.app.FragmentActivity r5 = r8.mActivity     // Catch:{ all -> 0x0096 }
            android.os.Handler r5 = r5.mHandler     // Catch:{ all -> 0x0096 }
            java.lang.Runnable r6 = r8.mExecCommit     // Catch:{ all -> 0x0096 }
            r5.removeCallbacks(r6)     // Catch:{ all -> 0x0096 }
            monitor-exit(r8)     // Catch:{ all -> 0x0096 }
            r5 = 1
            r8.mExecutingActions = r5
            r2 = 0
        L_0x0085:
            if (r2 >= r4) goto L_0x0099
            java.lang.Runnable[] r5 = r8.mTmpActions
            r5 = r5[r2]
            r5.run()
            java.lang.Runnable[] r5 = r8.mTmpActions
            r6 = 0
            r5[r2] = r6
            int r2 = r2 + 1
            goto L_0x0085
        L_0x0096:
            r5 = move-exception
            monitor-exit(r8)     // Catch:{ all -> 0x0096 }
            throw r5
        L_0x0099:
            r8.mExecutingActions = r7
            r0 = 1
            goto L_0x0024
        L_0x009d:
            if (r3 != 0) goto L_0x00a4
            r8.mHavePendingDeferredStart = r7
            r8.startPendingDeferredFragments()
        L_0x00a4:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.app.FragmentManagerImpl.execPendingActions():boolean");
    }

    /* access modifiers changed from: package-private */
    public void reportBackStackChanged() {
        if (this.mBackStackChangeListeners != null) {
            for (int i = 0; i < this.mBackStackChangeListeners.size(); i++) {
                this.mBackStackChangeListeners.get(i).onBackStackChanged();
            }
        }
    }

    /* access modifiers changed from: package-private */
    public void addBackStackState(BackStackRecord state) {
        if (this.mBackStack == null) {
            this.mBackStack = new ArrayList<>();
        }
        this.mBackStack.add(state);
        reportBackStackChanged();
    }

    /* access modifiers changed from: package-private */
    public boolean popBackStackState(Handler handler, String name, int id, int flags) {
        boolean z;
        if (this.mBackStack == null) {
            return false;
        }
        if (name == null && id < 0 && (flags & 1) == 0) {
            int last = this.mBackStack.size() - 1;
            if (last < 0) {
                return false;
            }
            this.mBackStack.remove(last).popFromBackStack(true);
            reportBackStackChanged();
        } else {
            int index = -1;
            if (name != null || id >= 0) {
                int index2 = this.mBackStack.size() - 1;
                while (index >= 0) {
                    BackStackRecord bss = this.mBackStack.get(index);
                    if ((name != null && name.equals(bss.getName())) || (id >= 0 && id == bss.mIndex)) {
                        break;
                    }
                    index2 = index - 1;
                }
                if (index < 0) {
                    return false;
                }
                if ((flags & 1) != 0) {
                    index--;
                    while (index >= 0) {
                        BackStackRecord bss2 = this.mBackStack.get(index);
                        if ((name == null || !name.equals(bss2.getName())) && (id < 0 || id != bss2.mIndex)) {
                            break;
                        }
                        index--;
                    }
                }
            }
            if (index == this.mBackStack.size() - 1) {
                return false;
            }
            ArrayList<BackStackRecord> states = new ArrayList<>();
            for (int i = this.mBackStack.size() - 1; i > index; i--) {
                states.add(this.mBackStack.remove(i));
            }
            int LAST = states.size() - 1;
            for (int i2 = 0; i2 <= LAST; i2++) {
                if (DEBUG) {
                    Log.v(TAG, "Popping back stack state: " + states.get(i2));
                }
                BackStackRecord backStackRecord = states.get(i2);
                if (i2 == LAST) {
                    z = true;
                } else {
                    z = false;
                }
                backStackRecord.popFromBackStack(z);
            }
            reportBackStackChanged();
        }
        return true;
    }

    /* access modifiers changed from: package-private */
    public ArrayList<Fragment> retainNonConfig() {
        ArrayList<Fragment> fragments = null;
        if (this.mActive != null) {
            for (int i = 0; i < this.mActive.size(); i++) {
                Fragment f = this.mActive.get(i);
                if (f != null && f.mRetainInstance) {
                    if (fragments == null) {
                        fragments = new ArrayList<>();
                    }
                    fragments.add(f);
                    f.mRetaining = true;
                    f.mTargetIndex = f.mTarget != null ? f.mTarget.mIndex : -1;
                    if (DEBUG) {
                        Log.v(TAG, "retainNonConfig: keeping retained " + f);
                    }
                }
            }
        }
        return fragments;
    }

    /* access modifiers changed from: package-private */
    public void saveFragmentViewState(Fragment f) {
        if (f.mInnerView != null) {
            if (this.mStateArray == null) {
                this.mStateArray = new SparseArray<>();
            } else {
                this.mStateArray.clear();
            }
            f.mInnerView.saveHierarchyState(this.mStateArray);
            if (this.mStateArray.size() > 0) {
                f.mSavedViewState = this.mStateArray;
                this.mStateArray = null;
            }
        }
    }

    /* access modifiers changed from: package-private */
    public Bundle saveFragmentBasicState(Fragment f) {
        Bundle result = null;
        if (this.mStateBundle == null) {
            this.mStateBundle = new Bundle();
        }
        f.onSaveInstanceState(this.mStateBundle);
        if (!this.mStateBundle.isEmpty()) {
            result = this.mStateBundle;
            this.mStateBundle = null;
        }
        if (f.mView != null) {
            saveFragmentViewState(f);
        }
        if (f.mSavedViewState != null) {
            if (result == null) {
                result = new Bundle();
            }
            result.putSparseParcelableArray(VIEW_STATE_TAG, f.mSavedViewState);
        }
        if (!f.mUserVisibleHint) {
            if (result == null) {
                result = new Bundle();
            }
            result.putBoolean(USER_VISIBLE_HINT_TAG, f.mUserVisibleHint);
        }
        return result;
    }

    /* access modifiers changed from: package-private */
    public Parcelable saveAllState() {
        int N;
        int N2;
        execPendingActions();
        if (HONEYCOMB) {
            this.mStateSaved = true;
        }
        if (this.mActive == null || this.mActive.size() <= 0) {
            return null;
        }
        int N3 = this.mActive.size();
        FragmentState[] active = new FragmentState[N3];
        boolean haveFragments = false;
        for (int i = 0; i < N3; i++) {
            Fragment f = this.mActive.get(i);
            if (f != null) {
                if (f.mIndex < 0) {
                    String msg = "Failure saving state: active " + f + " has cleared index: " + f.mIndex;
                    Log.e(TAG, msg);
                    dump("  ", (FileDescriptor) null, new PrintWriter(new LogWriter(TAG)), new String[0]);
                    throw new IllegalStateException(msg);
                }
                haveFragments = true;
                FragmentState fs = new FragmentState(f);
                active[i] = fs;
                if (f.mState <= 0 || fs.mSavedFragmentState != null) {
                    fs.mSavedFragmentState = f.mSavedFragmentState;
                } else {
                    fs.mSavedFragmentState = saveFragmentBasicState(f);
                    if (f.mTarget != null) {
                        if (f.mTarget.mIndex < 0) {
                            String msg2 = "Failure saving state: " + f + " has target not in fragment manager: " + f.mTarget;
                            Log.e(TAG, msg2);
                            dump("  ", (FileDescriptor) null, new PrintWriter(new LogWriter(TAG)), new String[0]);
                            throw new IllegalStateException(msg2);
                        }
                        if (fs.mSavedFragmentState == null) {
                            fs.mSavedFragmentState = new Bundle();
                        }
                        putFragment(fs.mSavedFragmentState, TARGET_STATE_TAG, f.mTarget);
                        if (f.mTargetRequestCode != 0) {
                            fs.mSavedFragmentState.putInt(TARGET_REQUEST_CODE_STATE_TAG, f.mTargetRequestCode);
                        }
                    }
                }
                if (DEBUG) {
                    Log.v(TAG, "Saved state of " + f + ": " + fs.mSavedFragmentState);
                }
            }
        }
        if (haveFragments) {
            int[] added = null;
            BackStackState[] backStack = null;
            if (this.mAdded != null && (N2 = this.mAdded.size()) > 0) {
                added = new int[N2];
                for (int i2 = 0; i2 < N2; i2++) {
                    added[i2] = this.mAdded.get(i2).mIndex;
                    if (added[i2] < 0) {
                        String msg3 = "Failure saving state: active " + this.mAdded.get(i2) + " has cleared index: " + added[i2];
                        Log.e(TAG, msg3);
                        dump("  ", (FileDescriptor) null, new PrintWriter(new LogWriter(TAG)), new String[0]);
                        throw new IllegalStateException(msg3);
                    }
                    if (DEBUG) {
                        Log.v(TAG, "saveAllState: adding fragment #" + i2 + ": " + this.mAdded.get(i2));
                    }
                }
            }
            if (this.mBackStack != null && (N = this.mBackStack.size()) > 0) {
                backStack = new BackStackState[N];
                for (int i3 = 0; i3 < N; i3++) {
                    backStack[i3] = new BackStackState(this, this.mBackStack.get(i3));
                    if (DEBUG) {
                        Log.v(TAG, "saveAllState: adding back stack #" + i3 + ": " + this.mBackStack.get(i3));
                    }
                }
            }
            FragmentManagerState fms = new FragmentManagerState();
            fms.mActive = active;
            fms.mAdded = added;
            fms.mBackStack = backStack;
            return fms;
        } else if (!DEBUG) {
            return null;
        } else {
            Log.v(TAG, "saveAllState: no fragments!");
            return null;
        }
    }

    /* access modifiers changed from: package-private */
    public void restoreAllState(Parcelable state, ArrayList<Fragment> nonConfig) {
        if (state != null) {
            FragmentManagerState fms = (FragmentManagerState) state;
            if (fms.mActive != null) {
                if (nonConfig != null) {
                    for (int i = 0; i < nonConfig.size(); i++) {
                        Fragment f = nonConfig.get(i);
                        if (DEBUG) {
                            Log.v(TAG, "restoreAllState: re-attaching retained " + f);
                        }
                        FragmentState fs = fms.mActive[f.mIndex];
                        fs.mInstance = f;
                        f.mSavedViewState = null;
                        f.mBackStackNesting = 0;
                        f.mInLayout = false;
                        f.mAdded = false;
                        f.mTarget = null;
                        if (fs.mSavedFragmentState != null) {
                            fs.mSavedFragmentState.setClassLoader(this.mActivity.getClassLoader());
                            f.mSavedViewState = fs.mSavedFragmentState.getSparseParcelableArray(VIEW_STATE_TAG);
                        }
                    }
                }
                this.mActive = new ArrayList<>(fms.mActive.length);
                if (this.mAvailIndices != null) {
                    this.mAvailIndices.clear();
                }
                for (int i2 = 0; i2 < fms.mActive.length; i2++) {
                    FragmentState fs2 = fms.mActive[i2];
                    if (fs2 != null) {
                        Fragment f2 = fs2.instantiate(this.mActivity);
                        if (DEBUG) {
                            Log.v(TAG, "restoreAllState: adding #" + i2 + ": " + f2);
                        }
                        this.mActive.add(f2);
                        fs2.mInstance = null;
                    } else {
                        if (DEBUG) {
                            Log.v(TAG, "restoreAllState: adding #" + i2 + ": (null)");
                        }
                        this.mActive.add((Object) null);
                        if (this.mAvailIndices == null) {
                            this.mAvailIndices = new ArrayList<>();
                        }
                        if (DEBUG) {
                            Log.v(TAG, "restoreAllState: adding avail #" + i2);
                        }
                        this.mAvailIndices.add(Integer.valueOf(i2));
                    }
                }
                if (nonConfig != null) {
                    for (int i3 = 0; i3 < nonConfig.size(); i3++) {
                        Fragment f3 = nonConfig.get(i3);
                        if (f3.mTargetIndex >= 0) {
                            if (f3.mTargetIndex < this.mActive.size()) {
                                f3.mTarget = this.mActive.get(f3.mTargetIndex);
                            } else {
                                Log.w(TAG, "Re-attaching retained fragment " + f3 + " target no longer exists: " + f3.mTargetIndex);
                                f3.mTarget = null;
                            }
                        }
                    }
                }
                if (fms.mAdded != null) {
                    this.mAdded = new ArrayList<>(fms.mAdded.length);
                    for (int i4 = 0; i4 < fms.mAdded.length; i4++) {
                        Fragment f4 = this.mActive.get(fms.mAdded[i4]);
                        if (f4 == null) {
                            throw new IllegalStateException("No instantiated fragment for index #" + fms.mAdded[i4]);
                        }
                        f4.mAdded = true;
                        if (DEBUG) {
                            Log.v(TAG, "restoreAllState: making added #" + i4 + ": " + f4);
                        }
                        this.mAdded.add(f4);
                    }
                } else {
                    this.mAdded = null;
                }
                if (fms.mBackStack != null) {
                    this.mBackStack = new ArrayList<>(fms.mBackStack.length);
                    for (int i5 = 0; i5 < fms.mBackStack.length; i5++) {
                        BackStackRecord bse = fms.mBackStack[i5].instantiate(this);
                        if (DEBUG) {
                            Log.v(TAG, "restoreAllState: adding bse #" + i5 + " (index " + bse.mIndex + "): " + bse);
                        }
                        this.mBackStack.add(bse);
                        if (bse.mIndex >= 0) {
                            setBackStackIndex(bse.mIndex, bse);
                        }
                    }
                    return;
                }
                this.mBackStack = null;
            }
        }
    }

    public void attachActivity(FragmentActivity activity) {
        if (this.mActivity != null) {
            throw new IllegalStateException();
        }
        this.mActivity = activity;
    }

    public void noteStateNotSaved() {
        this.mStateSaved = false;
    }

    public void dispatchCreate() {
        this.mStateSaved = false;
        moveToState(1, false);
    }

    public void dispatchActivityCreated() {
        this.mStateSaved = false;
        moveToState(2, false);
    }

    public void dispatchStart() {
        this.mStateSaved = false;
        moveToState(4, false);
    }

    public void dispatchResume() {
        this.mStateSaved = false;
        moveToState(5, false);
    }

    public void dispatchPause() {
        moveToState(4, false);
    }

    public void dispatchStop() {
        this.mStateSaved = true;
        moveToState(3, false);
    }

    public void dispatchReallyStop() {
        moveToState(2, false);
    }

    public void dispatchDestroy() {
        this.mDestroyed = true;
        execPendingActions();
        moveToState(0, false);
        this.mActivity = null;
    }

    public void dispatchConfigurationChanged(Configuration newConfig) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = this.mAdded.get(i);
                if (f != null) {
                    f.onConfigurationChanged(newConfig);
                }
            }
        }
    }

    public void dispatchLowMemory() {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = this.mAdded.get(i);
                if (f != null) {
                    f.onLowMemory();
                }
            }
        }
    }

    public boolean dispatchCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        boolean show = false;
        ArrayList<Fragment> newMenus = null;
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = this.mAdded.get(i);
                if (f != null && !f.mHidden && f.mHasMenu && f.mMenuVisible) {
                    show = true;
                    f.onCreateOptionsMenu(menu, inflater);
                    if (newMenus == null) {
                        newMenus = new ArrayList<>();
                    }
                    newMenus.add(f);
                }
            }
        }
        if (this.mCreatedMenus != null) {
            for (int i2 = 0; i2 < this.mCreatedMenus.size(); i2++) {
                Fragment f2 = this.mCreatedMenus.get(i2);
                if (newMenus == null || !newMenus.contains(f2)) {
                    f2.onDestroyOptionsMenu();
                }
            }
        }
        this.mCreatedMenus = newMenus;
        return show;
    }

    public boolean dispatchPrepareOptionsMenu(Menu menu) {
        boolean show = false;
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = this.mAdded.get(i);
                if (f != null && !f.mHidden && f.mHasMenu && f.mMenuVisible) {
                    show = true;
                    f.onPrepareOptionsMenu(menu);
                }
            }
        }
        return show;
    }

    public boolean dispatchOptionsItemSelected(MenuItem item) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = this.mAdded.get(i);
                if (f != null && !f.mHidden && f.mHasMenu && f.mMenuVisible && f.onOptionsItemSelected(item)) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean dispatchContextItemSelected(MenuItem item) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = this.mAdded.get(i);
                if (f != null && !f.mHidden && f.mUserVisibleHint && f.onContextItemSelected(item)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void dispatchOptionsMenuClosed(Menu menu) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = this.mAdded.get(i);
                if (f != null && !f.mHidden && f.mHasMenu && f.mMenuVisible) {
                    f.onOptionsMenuClosed(menu);
                }
            }
        }
    }

    public static int reverseTransit(int transit) {
        switch (transit) {
            case FragmentTransaction.TRANSIT_FRAGMENT_OPEN:
                return FragmentTransaction.TRANSIT_FRAGMENT_CLOSE;
            case FragmentTransaction.TRANSIT_FRAGMENT_FADE:
                return FragmentTransaction.TRANSIT_FRAGMENT_FADE;
            case FragmentTransaction.TRANSIT_FRAGMENT_CLOSE:
                return FragmentTransaction.TRANSIT_FRAGMENT_OPEN;
            default:
                return 0;
        }
    }

    public static int transitToStyleIndex(int transit, boolean enter) {
        switch (transit) {
            case FragmentTransaction.TRANSIT_FRAGMENT_OPEN:
                return enter ? 1 : 2;
            case FragmentTransaction.TRANSIT_FRAGMENT_FADE:
                return enter ? 5 : 6;
            case FragmentTransaction.TRANSIT_FRAGMENT_CLOSE:
                return enter ? 3 : 4;
            default:
                return -1;
        }
    }
}
