package com.google.android.gms.drive.query;

import com.google.android.gms.drive.metadata.CollectionMetadataField;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.OrderedMetadataField;
import com.google.android.gms.drive.query.internal.ComparisonFilter;
import com.google.android.gms.drive.query.internal.FieldOnlyFilter;
import com.google.android.gms.drive.query.internal.InFilter;
import com.google.android.gms.drive.query.internal.LogicalFilter;
import com.google.android.gms.drive.query.internal.NotFilter;
import com.google.android.gms.drive.query.internal.Operator;
import java.util.List;

public class Filters {
    public static Filter and(Filter filter, Filter... additionalFilters) {
        return new LogicalFilter(Operator.f1598si, filter, additionalFilters);
    }

    public static Filter and(List<Filter> filters) {
        return new LogicalFilter(Operator.f1598si, filters);
    }

    public static Filter contains(MetadataField<String> field, String value) {
        return new ComparisonFilter(Operator.f1601sl, field, value);
    }

    /* renamed from: eq */
    public static <T> Filter m1649eq(MetadataField<T> field, T value) {
        return new ComparisonFilter(Operator.f1593sd, field, value);
    }

    public static <T extends Comparable<T>> Filter greaterThan(OrderedMetadataField<T> field, T value) {
        return new ComparisonFilter(Operator.f1596sg, field, value);
    }

    public static <T extends Comparable<T>> Filter greaterThanEquals(OrderedMetadataField<T> field, T value) {
        return new ComparisonFilter(Operator.f1597sh, field, value);
    }

    /* renamed from: in */
    public static <T> Filter m1650in(CollectionMetadataField<T> field, T value) {
        return new InFilter(field, value);
    }

    public static <T extends Comparable<T>> Filter lessThan(OrderedMetadataField<T> field, T value) {
        return new ComparisonFilter(Operator.f1594se, field, value);
    }

    public static <T extends Comparable<T>> Filter lessThanEquals(OrderedMetadataField<T> field, T value) {
        return new ComparisonFilter(Operator.f1595sf, field, value);
    }

    public static Filter not(Filter toNegate) {
        return new NotFilter(toNegate);
    }

    /* renamed from: or */
    public static Filter m1651or(Filter filter, Filter... additionalFilters) {
        return new LogicalFilter(Operator.f1599sj, filter, additionalFilters);
    }

    /* renamed from: or */
    public static Filter m1652or(List<Filter> filters) {
        return new LogicalFilter(Operator.f1599sj, filters);
    }

    public static Filter sharedWithMe() {
        return new FieldOnlyFilter(SearchableField.f1569rM);
    }
}
