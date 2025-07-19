package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.internal.ib;
import com.google.android.gms.internal.id;
import java.util.HashSet;
import java.util.Set;

public interface Moment extends Freezable<Moment> {

    public static class Builder {
        private String AI;
        private final Set<Integer> Eq = new HashSet();
        private String Fe;
        private ib Fm;
        private ib Fn;
        private String uS;

        public Moment build() {
            return new id(this.Eq, this.uS, this.Fm, this.Fe, this.Fn, this.AI);
        }

        public Builder setId(String id) {
            this.uS = id;
            this.Eq.add(2);
            return this;
        }

        public Builder setResult(ItemScope result) {
            this.Fm = (ib) result;
            this.Eq.add(4);
            return this;
        }

        public Builder setStartDate(String startDate) {
            this.Fe = startDate;
            this.Eq.add(5);
            return this;
        }

        public Builder setTarget(ItemScope target) {
            this.Fn = (ib) target;
            this.Eq.add(6);
            return this;
        }

        public Builder setType(String type) {
            this.AI = type;
            this.Eq.add(7);
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
