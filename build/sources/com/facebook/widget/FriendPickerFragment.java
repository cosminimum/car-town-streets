package com.facebook.widget;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.AttributeSet;
import com.facebook.FacebookException;
import com.facebook.Request;
import com.facebook.Session;
import com.facebook.android.C0253R;
import com.facebook.model.GraphUser;
import com.facebook.widget.PickerFragment;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class FriendPickerFragment extends PickerFragment<GraphUser> {

    /* renamed from: ID */
    private static final String f399ID = "id";
    public static final String MULTI_SELECT_BUNDLE_KEY = "com.facebook.widget.FriendPickerFragment.MultiSelect";
    private static final String NAME = "name";
    public static final String USER_ID_BUNDLE_KEY = "com.facebook.widget.FriendPickerFragment.UserId";
    private boolean multiSelect;
    private String userId;

    public FriendPickerFragment() {
        this((Bundle) null);
    }

    @SuppressLint({"ValidFragment"})
    public FriendPickerFragment(Bundle args) {
        super(GraphUser.class, C0253R.layout.com_facebook_friendpickerfragment, args);
        this.multiSelect = true;
        setFriendPickerSettingsFromBundle(args);
    }

    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId2) {
        this.userId = userId2;
    }

    public boolean getMultiSelect() {
        return this.multiSelect;
    }

    public void setMultiSelect(boolean multiSelect2) {
        if (this.multiSelect != multiSelect2) {
            this.multiSelect = multiSelect2;
            setSelectionStrategy(createSelectionStrategy());
        }
    }

    public List<GraphUser> getSelection() {
        return getSelectedGraphObjects();
    }

    public void onInflate(Activity activity, AttributeSet attrs, Bundle savedInstanceState) {
        super.onInflate(activity, attrs, savedInstanceState);
        TypedArray a = activity.obtainStyledAttributes(attrs, C0253R.styleable.com_facebook_friend_picker_fragment);
        setMultiSelect(a.getBoolean(0, this.multiSelect));
        a.recycle();
    }

    public void setSettingsFromBundle(Bundle inState) {
        super.setSettingsFromBundle(inState);
        setFriendPickerSettingsFromBundle(inState);
    }

    /* access modifiers changed from: package-private */
    public void saveSettingsToBundle(Bundle outState) {
        super.saveSettingsToBundle(outState);
        outState.putString(USER_ID_BUNDLE_KEY, this.userId);
        outState.putBoolean(MULTI_SELECT_BUNDLE_KEY, this.multiSelect);
    }

    /* access modifiers changed from: package-private */
    public PickerFragment<GraphUser>.PickerFragmentAdapter<GraphUser> createAdapter() {
        PickerFragment<GraphUser>.PickerFragmentAdapter<GraphUser> adapter = new PickerFragment<GraphUser>.PickerFragmentAdapter<GraphUser>(getActivity()) {
            /* access modifiers changed from: protected */
            public int getGraphObjectRowLayoutId(GraphUser graphObject) {
                return C0253R.layout.com_facebook_picker_list_row;
            }

            /* access modifiers changed from: protected */
            public int getDefaultPicture() {
                return C0253R.drawable.com_facebook_profile_default_icon;
            }
        };
        adapter.setShowCheckbox(true);
        adapter.setShowPicture(getShowPictures());
        adapter.setSortFields(Arrays.asList(new String[]{"name"}));
        adapter.setGroupByField("name");
        return adapter;
    }

    /* access modifiers changed from: package-private */
    public PickerFragment<GraphUser>.LoadingStrategy createLoadingStrategy() {
        return new ImmediateLoadingStrategy();
    }

    /* access modifiers changed from: package-private */
    public PickerFragment<GraphUser>.SelectionStrategy createSelectionStrategy() {
        return this.multiSelect ? new PickerFragment.MultiSelectionStrategy() : new PickerFragment.SingleSelectionStrategy();
    }

    /* access modifiers changed from: package-private */
    public Request getRequestForLoadData(Session session) {
        if (this.adapter == null) {
            throw new FacebookException("Can't issue requests until Fragment has been created.");
        }
        return createRequest(this.userId != null ? this.userId : "me", this.extraFields, session);
    }

    /* access modifiers changed from: package-private */
    public String getDefaultTitleText() {
        return getString(C0253R.string.com_facebook_choose_friends);
    }

    private Request createRequest(String userID, Set<String> extraFields, Session session) {
        Request request = Request.newGraphPathRequest(session, userID + "/friends", (Request.Callback) null);
        Set<String> fields = new HashSet<>(extraFields);
        fields.addAll(Arrays.asList(new String[]{"id", "name"}));
        String pictureField = this.adapter.getPictureFieldSpecifier();
        if (pictureField != null) {
            fields.add(pictureField);
        }
        Bundle parameters = request.getParameters();
        parameters.putString("fields", TextUtils.join(",", fields));
        request.setParameters(parameters);
        return request;
    }

    private void setFriendPickerSettingsFromBundle(Bundle inState) {
        if (inState != null) {
            if (inState.containsKey(USER_ID_BUNDLE_KEY)) {
                setUserId(inState.getString(USER_ID_BUNDLE_KEY));
            }
            setMultiSelect(inState.getBoolean(MULTI_SELECT_BUNDLE_KEY, this.multiSelect));
        }
    }

    private class ImmediateLoadingStrategy extends PickerFragment.LoadingStrategy {
        private ImmediateLoadingStrategy() {
            super();
        }

        /* access modifiers changed from: protected */
        public void onLoadFinished(GraphObjectPagingLoader<GraphUser> loader, SimpleGraphObjectCursor<GraphUser> data) {
            super.onLoadFinished(loader, data);
            if (data != null && !loader.isLoading()) {
                if (data.areMoreObjectsAvailable()) {
                    followNextLink();
                    return;
                }
                FriendPickerFragment.this.hideActivityCircle();
                if (data.isFromCache()) {
                    loader.refreshOriginalRequest(data.getCount() == 0 ? 2000 : 0);
                }
            }
        }

        private void followNextLink() {
            FriendPickerFragment.this.displayActivityCircle();
            this.loader.followNextLink();
        }
    }
}
