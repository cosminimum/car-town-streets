package com.google.android.gms.drive.query;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.query.internal.LogicalFilter;
import com.google.android.gms.drive.query.internal.Operator;
import java.util.ArrayList;
import java.util.List;

public class Query implements SafeParcelable {
    public static final Parcelable.Creator<Query> CREATOR = new C0755a();

    /* renamed from: kg */
    final int f1564kg;

    /* renamed from: rO */
    LogicalFilter f1565rO;

    /* renamed from: rP */
    String f1566rP;

    public static class Builder {

        /* renamed from: rP */
        private String f1567rP;

        /* renamed from: rQ */
        private final List<Filter> f1568rQ = new ArrayList();

        public Builder addFilter(Filter filter) {
            this.f1568rQ.add(filter);
            return this;
        }

        public Query build() {
            return new Query(new LogicalFilter(Operator.f1598si, this.f1568rQ), this.f1567rP);
        }

        public Builder setPageToken(String token) {
            this.f1567rP = token;
            return this;
        }
    }

    Query(int versionCode, LogicalFilter clause, String pageToken) {
        this.f1564kg = versionCode;
        this.f1565rO = clause;
        this.f1566rP = pageToken;
    }

    Query(LogicalFilter clause, String pageToken) {
        this(1, clause, pageToken);
    }

    public int describeContents() {
        return 0;
    }

    public Filter getFilter() {
        return this.f1565rO;
    }

    public String getPageToken() {
        return this.f1566rP;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0755a.m1653a(this, out, flags);
    }
}
