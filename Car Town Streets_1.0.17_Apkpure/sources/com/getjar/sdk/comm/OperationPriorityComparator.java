package com.getjar.sdk.comm;

import java.util.Comparator;
/* loaded from: classes.dex */
public class OperationPriorityComparator implements Comparator<Operation> {
    private static volatile OperationPriorityComparator _Instance = null;

    private OperationPriorityComparator() {
    }

    private static synchronized void makeTheInstance() {
        synchronized (OperationPriorityComparator.class) {
            if (_Instance == null) {
                _Instance = new OperationPriorityComparator();
            }
        }
    }

    public static OperationPriorityComparator getInstance() {
        if (_Instance == null) {
            makeTheInstance();
        }
        return _Instance;
    }

    @Override // java.util.Comparator
    public int compare(Operation lhs, Operation rhs) {
        if (lhs == null) {
            throw new IllegalArgumentException("'lhs' can not be NULL");
        }
        if (rhs == null) {
            throw new IllegalArgumentException("'rhs' can not be NULL");
        }
        int result = 0;
        if (lhs.getPriority() < rhs.getPriority()) {
            result = -1;
        } else if (lhs.getPriority() > rhs.getPriority()) {
            result = 1;
        }
        if (result == 0) {
            if (lhs.getCreatedTimestamp() > rhs.getCreatedTimestamp()) {
                return -1;
            }
            if (lhs.getCreatedTimestamp() >= rhs.getCreatedTimestamp()) {
                return result;
            }
            return 1;
        }
        return result;
    }
}
