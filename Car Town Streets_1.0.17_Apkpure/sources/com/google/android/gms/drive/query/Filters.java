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
/* loaded from: classes.dex */
public class Filters {
    public static Filter and(Filter filter, Filter... additionalFilters) {
        return new LogicalFilter(Operator.si, filter, additionalFilters);
    }

    public static Filter and(List<Filter> filters) {
        return new LogicalFilter(Operator.si, filters);
    }

    public static Filter contains(MetadataField<String> field, String value) {
        return new ComparisonFilter(Operator.sl, field, value);
    }

    public static <T> Filter eq(MetadataField<T> field, T value) {
        return new ComparisonFilter(Operator.sd, field, value);
    }

    public static <T extends Comparable<T>> Filter greaterThan(OrderedMetadataField<T> field, T value) {
        return new ComparisonFilter(Operator.sg, field, value);
    }

    public static <T extends Comparable<T>> Filter greaterThanEquals(OrderedMetadataField<T> field, T value) {
        return new ComparisonFilter(Operator.sh, field, value);
    }

    public static <T> Filter in(CollectionMetadataField<T> field, T value) {
        return new InFilter(field, value);
    }

    public static <T extends Comparable<T>> Filter lessThan(OrderedMetadataField<T> field, T value) {
        return new ComparisonFilter(Operator.se, field, value);
    }

    public static <T extends Comparable<T>> Filter lessThanEquals(OrderedMetadataField<T> field, T value) {
        return new ComparisonFilter(Operator.sf, field, value);
    }

    public static Filter not(Filter toNegate) {
        return new NotFilter(toNegate);
    }

    public static Filter or(Filter filter, Filter... additionalFilters) {
        return new LogicalFilter(Operator.sj, filter, additionalFilters);
    }

    public static Filter or(List<Filter> filters) {
        return new LogicalFilter(Operator.sj, filters);
    }

    public static Filter sharedWithMe() {
        return new FieldOnlyFilter(SearchableField.rM);
    }
}
