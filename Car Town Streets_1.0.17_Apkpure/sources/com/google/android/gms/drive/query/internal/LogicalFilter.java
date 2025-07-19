package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.query.Filter;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class LogicalFilter implements SafeParcelable, Filter {
    public static final Parcelable.Creator<LogicalFilter> CREATOR = new f();
    final int kg;
    private List<Filter> rQ;
    final Operator rR;
    final List<FilterHolder> sb;

    /* JADX INFO: Access modifiers changed from: package-private */
    public LogicalFilter(int versionCode, Operator operator, List<FilterHolder> filterHolders) {
        this.kg = versionCode;
        this.rR = operator;
        this.sb = filterHolders;
    }

    public LogicalFilter(Operator operator, Filter filter, Filter... additionalFilters) {
        this.kg = 1;
        this.rR = operator;
        this.sb = new ArrayList(additionalFilters.length + 1);
        this.sb.add(new FilterHolder(filter));
        this.rQ = new ArrayList(additionalFilters.length + 1);
        this.rQ.add(filter);
        for (Filter filter2 : additionalFilters) {
            this.sb.add(new FilterHolder(filter2));
            this.rQ.add(filter2);
        }
    }

    public LogicalFilter(Operator operator, List<Filter> filters) {
        this.kg = 1;
        this.rR = operator;
        this.rQ = filters;
        this.sb = new ArrayList(filters.size());
        for (Filter filter : filters) {
            this.sb.add(new FilterHolder(filter));
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        f.a(this, out, flags);
    }
}
