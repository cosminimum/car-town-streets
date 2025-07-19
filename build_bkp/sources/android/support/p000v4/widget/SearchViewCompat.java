package android.support.p000v4.widget;

import android.content.Context;
import android.os.Build;
import android.support.p000v4.widget.SearchViewCompatHoneycomb;
import android.view.View;

/* renamed from: android.support.v4.widget.SearchViewCompat */
public class SearchViewCompat {
    /* access modifiers changed from: private */
    public static final SearchViewCompatImpl IMPL;

    /* renamed from: android.support.v4.widget.SearchViewCompat$SearchViewCompatImpl */
    interface SearchViewCompatImpl {
        Object newOnQueryTextListener(OnQueryTextListenerCompat onQueryTextListenerCompat);

        View newSearchView(Context context);

        void setOnQueryTextListener(Object obj, Object obj2);
    }

    /* renamed from: android.support.v4.widget.SearchViewCompat$SearchViewCompatStubImpl */
    static class SearchViewCompatStubImpl implements SearchViewCompatImpl {
        SearchViewCompatStubImpl() {
        }

        public View newSearchView(Context context) {
            return null;
        }

        public Object newOnQueryTextListener(OnQueryTextListenerCompat listener) {
            return null;
        }

        public void setOnQueryTextListener(Object searchView, Object listener) {
        }
    }

    /* renamed from: android.support.v4.widget.SearchViewCompat$SearchViewCompatHoneycombImpl */
    static class SearchViewCompatHoneycombImpl extends SearchViewCompatStubImpl {
        SearchViewCompatHoneycombImpl() {
        }

        public View newSearchView(Context context) {
            return SearchViewCompatHoneycomb.newSearchView(context);
        }

        public Object newOnQueryTextListener(final OnQueryTextListenerCompat listener) {
            return SearchViewCompatHoneycomb.newOnQueryTextListener(new SearchViewCompatHoneycomb.OnQueryTextListenerCompatBridge() {
                public boolean onQueryTextSubmit(String query) {
                    return listener.onQueryTextSubmit(query);
                }

                public boolean onQueryTextChange(String newText) {
                    return listener.onQueryTextChange(newText);
                }
            });
        }

        public void setOnQueryTextListener(Object searchView, Object listener) {
            SearchViewCompatHoneycomb.setOnQueryTextListener(searchView, listener);
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 11) {
            IMPL = new SearchViewCompatHoneycombImpl();
        } else {
            IMPL = new SearchViewCompatStubImpl();
        }
    }

    private SearchViewCompat(Context context) {
    }

    public static View newSearchView(Context context) {
        return IMPL.newSearchView(context);
    }

    public static void setOnQueryTextListener(View searchView, OnQueryTextListenerCompat listener) {
        IMPL.setOnQueryTextListener(searchView, listener.mListener);
    }

    /* renamed from: android.support.v4.widget.SearchViewCompat$OnQueryTextListenerCompat */
    public static abstract class OnQueryTextListenerCompat {
        final Object mListener = SearchViewCompat.IMPL.newOnQueryTextListener(this);

        public boolean onQueryTextSubmit(String query) {
            return false;
        }

        public boolean onQueryTextChange(String newText) {
            return false;
        }
    }
}
