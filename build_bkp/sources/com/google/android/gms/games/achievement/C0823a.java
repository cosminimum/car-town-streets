package com.google.android.gms.games.achievement;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.common.data.C0663b;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.C0826d;
import com.google.android.gms.games.Player;
import com.google.android.gms.internal.C1066ds;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.plus.PlusShare;

/* renamed from: com.google.android.gms.games.achievement.a */
public final class C0823a extends C0663b implements Achievement {
    C0823a(DataHolder dataHolder, int i) {
        super(dataHolder, i);
    }

    public String getAchievementId() {
        return getString("external_achievement_id");
    }

    public int getCurrentSteps() {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        C1066ds.m2459p(z);
        return getInteger("current_steps");
    }

    public String getDescription() {
        return getString(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION);
    }

    public void getDescription(CharArrayBuffer dataOut) {
        mo5976a(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION, dataOut);
    }

    public String getFormattedCurrentSteps() {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        C1066ds.m2459p(z);
        return getString("formatted_current_steps");
    }

    public void getFormattedCurrentSteps(CharArrayBuffer dataOut) {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        C1066ds.m2459p(z);
        mo5976a("formatted_current_steps", dataOut);
    }

    public String getFormattedTotalSteps() {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        C1066ds.m2459p(z);
        return getString("formatted_total_steps");
    }

    public void getFormattedTotalSteps(CharArrayBuffer dataOut) {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        C1066ds.m2459p(z);
        mo5976a("formatted_total_steps", dataOut);
    }

    public long getLastUpdatedTimestamp() {
        return getLong("last_updated_timestamp");
    }

    public String getName() {
        return getString("name");
    }

    public void getName(CharArrayBuffer dataOut) {
        mo5976a("name", dataOut);
    }

    public Player getPlayer() {
        return new C0826d(this.f1386nE, this.f1387nG);
    }

    public Uri getRevealedImageUri() {
        return mo5974L("revealed_icon_image_uri");
    }

    public int getState() {
        return getInteger("state");
    }

    public int getTotalSteps() {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        C1066ds.m2459p(z);
        return getInteger("total_steps");
    }

    public int getType() {
        return getInteger(ServerProtocol.DIALOG_PARAM_TYPE);
    }

    public Uri getUnlockedImageUri() {
        return mo5974L("unlocked_icon_image_uri");
    }

    public String toString() {
        C1098ee.C1100a a = C1098ee.m2604e(this).mo7535a(Constants.APP_ID, getAchievementId()).mo7535a("name", getName()).mo7535a("state", Integer.valueOf(getState())).mo7535a(ServerProtocol.DIALOG_PARAM_TYPE, Integer.valueOf(getType()));
        if (getType() == 1) {
            a.mo7535a("steps", getCurrentSteps() + "/" + getTotalSteps());
        }
        return a.toString();
    }
}
