package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.internal.C1402ib;
import com.google.android.gms.internal.C1404id;
import java.util.HashSet;
import java.util.Set;

public interface Moment extends Freezable<Moment> {

    public static class Builder {

        /* renamed from: AI */
        private String f3806AI;

        /* renamed from: Eq */
        private final Set<Integer> f3807Eq = new HashSet();

        /* renamed from: Fe */
        private String f3808Fe;

        /* renamed from: Fm */
        private C1402ib f3809Fm;

        /* renamed from: Fn */
        private C1402ib f3810Fn;

        /* renamed from: uS */
        private String f3811uS;

        public Moment build() {
            return new C1404id(this.f3807Eq, this.f3811uS, this.f3809Fm, this.f3808Fe, this.f3810Fn, this.f3806AI);
        }

        public Builder setId(String id) {
            this.f3811uS = id;
            this.f3807Eq.add(2);
            return this;
        }

        public Builder setResult(ItemScope result) {
            this.f3809Fm = (C1402ib) result;
            this.f3807Eq.add(4);
            return this;
        }

        public Builder setStartDate(String startDate) {
            this.f3808Fe = startDate;
            this.f3807Eq.add(5);
            return this;
        }

        public Builder setTarget(ItemScope target) {
            this.f3810Fn = (C1402ib) target;
            this.f3807Eq.add(6);
            return this;
        }

        public Builder setType(String type) {
            this.f3806AI = type;
            this.f3807Eq.add(7);
            return this;
        }
    }

    String getId();

    ItemScope getResult();

    String getStartDate();

    ItemScope getTarget();

    String getType();

    boolean hasId();

    boolean hasResult();

    boolean hasStartDate();

    boolean hasTarget();

    boolean hasType();
}
