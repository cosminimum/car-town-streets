package android.v4.app;

import android.os.Parcel;
import android.os.Parcelable;

/* compiled from: FragmentManager */
final class FragmentManagerState implements Parcelable {
    public static final Creator<FragmentManagerState> CREATOR = new Creator<FragmentManagerState>() {
        public FragmentManagerState createFromParcel(Parcel in) {
            return new FragmentManagerState(in);
        }

        public FragmentManagerState[] newArray(int size) {
            return new FragmentManagerState[size];
        }
    };
    FragmentState[] mActive;
    int[] mAdded;
    BackStackState[] mBackStack;

    public FragmentManagerState() {
    }

    public FragmentManagerState(Parcel in) {
        this.mActive = (FragmentState[]) in.createTypedArray(FragmentState.CREATOR);
        this.mAdded = in.createIntArray();
        this.mBackStack = (BackStackState[]) in.createTypedArray(BackStackState.CREATOR);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeTypedArray(this.mActive, flags);
        dest.writeIntArray(this.mAdded);
        dest.writeTypedArray(this.mBackStack, flags);
    }
}
