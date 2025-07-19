package com.google.android.gms.drive;

import android.content.Context;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.drive.internal.C0692h;
import com.google.android.gms.drive.internal.C0710j;
import com.google.android.gms.internal.C1067dt;
import java.util.List;

public final class Drive {
    public static final Api API = new Api(f1438jO, new Scope[0]);
    public static final DriveApi DriveApi = new C0692h();
    public static final Scope SCOPE_FILE = new Scope(Scopes.DRIVE_FILE);

    /* renamed from: jO */
    public static final Api.C0647b<C0710j> f1438jO = new Api.C0647b<C0710j>() {
        /* renamed from: d */
        public C0710j mo5621b(Context context, C1067dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            List<String> bH = dtVar.mo7435bH();
            return new C0710j(context, dtVar, connectionCallbacks, onConnectionFailedListener, (String[]) bH.toArray(new String[bH.size()]));
        }

        public int getPriority() {
            return Integer.MAX_VALUE;
        }
    };

    private Drive() {
    }
}
