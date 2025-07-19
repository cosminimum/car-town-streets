package com.google.tagmanager;

import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;
/* loaded from: classes.dex */
class EqualsPredicate extends StringPredicate {
    private static final String ID = FunctionType.EQUALS.toString();

    public static String getFunctionId() {
        return ID;
    }

    public EqualsPredicate() {
        super(ID);
    }

    @Override // com.google.tagmanager.StringPredicate
    protected boolean evaluateString(String arg0, String arg1, Map<String, TypeSystem.Value> parameters) {
        return arg0.equals(arg1);
    }
}
