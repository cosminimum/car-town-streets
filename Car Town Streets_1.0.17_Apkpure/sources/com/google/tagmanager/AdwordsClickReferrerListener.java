package com.google.tagmanager;

import android.content.Context;
import android.net.Uri;
import com.google.android.gms.plus.PlusShare;
import com.google.tagmanager.DataLayer;
import java.util.Map;
/* loaded from: classes.dex */
class AdwordsClickReferrerListener implements DataLayer.Listener {
    private final Context context;

    public AdwordsClickReferrerListener(Context context) {
        this.context = context;
    }

    @Override // com.google.tagmanager.DataLayer.Listener
    public void changed(Map<Object, Object> update) {
        Object gtm;
        Object url = update.get("gtm.url");
        if (url == null && (gtm = update.get("gtm")) != null && (gtm instanceof Map)) {
            url = ((Map) gtm).get(PlusShare.KEY_CALL_TO_ACTION_URL);
        }
        if (url != null && (url instanceof String)) {
            Uri uri = Uri.parse((String) url);
            String referrer = uri.getQueryParameter("referrer");
            if (referrer != null) {
                InstallReferrerUtil.addClickReferrer(this.context, referrer);
            }
        }
    }
}
