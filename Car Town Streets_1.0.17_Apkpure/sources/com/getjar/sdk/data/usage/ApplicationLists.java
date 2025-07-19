package com.getjar.sdk.data.usage;

import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public class ApplicationLists {
    private final List<ApplicationSessionEvent> _newNonDisposedStart;
    private final List<ApplicationSessionEvent> _oldNonDisposedStart;

    public ApplicationLists(List<ApplicationSessionEvent> newNonDisposedStart, List<ApplicationSessionEvent> oldNonDisposedStart) {
        if (newNonDisposedStart == null) {
            throw new IllegalArgumentException("'newNonDisposedStart' cannot be NULL");
        }
        if (oldNonDisposedStart == null) {
            throw new IllegalArgumentException("'oldNonDisposedStart' cannot be NULL");
        }
        this._newNonDisposedStart = Collections.unmodifiableList(newNonDisposedStart);
        this._oldNonDisposedStart = Collections.unmodifiableList(oldNonDisposedStart);
    }

    public List<ApplicationSessionEvent> getNewNonDisposedStart() {
        return this._newNonDisposedStart;
    }

    public List<ApplicationSessionEvent> getOldNonDisposedStart() {
        return this._oldNonDisposedStart;
    }
}
