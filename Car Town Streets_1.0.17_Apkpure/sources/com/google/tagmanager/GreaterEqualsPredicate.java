package com.google.tagmanager;

import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;
/* loaded from: classes.dex */
class GreaterEqualsPredicate extends NumberPredicate {
    private static final String ID = FunctionType.GREATER_EQUALS.toString();

    public static String getFunctionId() {
        return ID;
    }

    public GreaterEqualsPredicate() {
        super(ID);
    }

    @Override // com.google.tagmanager.NumberPredicate
    protected boolean evaluateNumber(TypedNumber arg0, TypedNumber arg1, Map<String, TypeSystem.Value> parameters) {
        return arg0.compareTo(arg1) >= 0;
    }
}
