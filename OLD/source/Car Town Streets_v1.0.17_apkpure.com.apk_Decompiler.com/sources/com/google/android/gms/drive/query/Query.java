package com.google.android.gms.drive.query;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.query.internal.LogicalFilter;
import com.google.android.gms.drive.query.internal.Operator;
import java.util.ArrayList;
import java.util.List;

public class Query implements SafeParcelable {
    public static final Parcelable.Creator<Query> CREATOR = new a();
    final int kg;
    LogicalFilter rO;
    String rP;

    public static class Builder {
        private String rP;
        private final List<Filter> rQ = new ArrayList();

        public Builder addFilter(Filter filter) {
            this.rQ.add(filter);
            return this;
        }

        public Query build() {
            return new Query(new LogicalFilter(Operator.si, this.rQ), this.rP);
        }

        public Builder setPageToken(String token) {
            this.rP = token;
            return this;
        }
    }

    Query(int versionCode, LogicalFilter clause, String pageToken) {
        this.kg = versionCode;
        this.rO = clause;
        this.rP = pageToken;
    }

    Query(LogicalFilter clause, String pageToken) {
        this(1, clause, pageToken);
    }

    public int describeContents() {
        return 0;
    }

    public Filter getFilter() {
        return this.rO;
    }

    public String getPageToken() {
        return this.rP;
    }

    public void writeToParcel(Parcel out, int flags) {
        a.a(this, out, flags);
    }
}
