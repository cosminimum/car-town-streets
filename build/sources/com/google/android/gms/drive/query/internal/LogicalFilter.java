package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.query.Filter;
import java.util.ArrayList;
import java.util.List;

public class LogicalFilter implements SafeParcelable, Filter {
    public static final Parcelable.Creator<LogicalFilter> CREATOR = new C0761f();

    /* renamed from: kg */
    final int f1587kg;

    /* renamed from: rQ */
    private List<Filter> f1588rQ;

    /* renamed from: rR */
    final Operator f1589rR;

    /* renamed from: sb */
    final List<FilterHolder> f1590sb;

    LogicalFilter(int versionCode, Operator operator, List<FilterHolder> filterHolders) {
        this.f1587kg = versionCode;
        this.f1589rR = operator;
        this.f1590sb = filterHolders;
    }

    public LogicalFilter(Operator operator, Filter filter, Filter... additionalFilters) {
        this.f1587kg = 1;
        this.f1589rR = operator;
        this.f1590sb = new ArrayList(additionalFilters.length + 1);
        this.f1590sb.add(new FilterHolder(filter));
        this.f1588rQ = new ArrayList(additionalFilters.length + 1);
        this.f1588rQ.add(filter);
        for (Filter filter2 : additionalFilters) {
            this.f1590sb.add(new FilterHolder(filter2));
            this.f1588rQ.add(filter2);
        }
    }

    public LogicalFilter(Operator operator, List<Filter> filters) {
        this.f1587kg = 1;
        this.f1589rR = operator;
        this.f1588rQ = filters;
        this.f1590sb = new ArrayList(filters.size());
        for (Filter filterHolder : filters) {
            this.f1590sb.add(new FilterHolder(filterHolder));
        }
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0761f.m1669a(this, out, flags);
    }
}
