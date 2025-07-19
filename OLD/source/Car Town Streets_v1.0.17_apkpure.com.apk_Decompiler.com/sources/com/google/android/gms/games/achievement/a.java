package com.google.android.gms.games.achievement;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.b;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.d;
import com.google.android.gms.internal.ds;
import com.google.android.gms.internal.ee;
import com.google.android.gms.plus.PlusShare;

public final class a extends b implements Achievement {
    a(DataHolder dataHolder, int i) {
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
        ds.p(z);
        return getInteger("current_steps");
    }

    public String getDescription() {
        return getString(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION);
    }

    public void getDescription(CharArrayBuffer dataOut) {
        a(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION, dataOut);
    }

    public String getFormattedCurrentSteps() {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        ds.p(z);
        return getString("formatted_current_steps");
    }

    public void getFormattedCurrentSteps(CharArrayBuffer dataOut) {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        ds.p(z);
        a("formatted_current_steps", dataOut);
    }

    public String getFormattedTotalSteps() {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        ds.p(z);
        return getString("formatted_total_steps");
    }

    public void getFormattedTotalSteps(CharArrayBuffer dataOut) {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        ds.p(z);
        a("formatted_total_steps", dataOut);
    }

    public long getLastUpdatedTimestamp() {
        return getLong("last_updated_timestamp");
    }

    public String getName() {
        return getString("name");
    }

    public void getName(CharArrayBuffer dataOut) {
        a("name", dataOut);
    }

    public Player getPlayer() {
        return new d(this.nE, this.nG);
    }

    public Uri getRevealedImageUri() {
        return L("revealed_icon_image_uri");
    }

    public int getState() {
        return getInteger("state");
    }

    public int getTotalSteps() {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        ds.p(z);
        return getInteger("total_steps");
    }

    public int getType() {
        return getInteger(ServerProtocol.DIALOG_PARAM_TYPE);
    }

    public Uri getUnlockedImageUri() {
        return L("unlocked_icon_image_uri");
    }

    public String toString() {
        ee.a a = ee.e(this).a(Constants.APP_ID, getAchievementId()).a("name", getName()).a("state", Integer.valueOf(getState())).a(ServerProtocol.DIALOG_PARAM_TYPE, Integer.valueOf(getType()));
        if (getType() == 1) {
            a.a("steps", getCurrentSteps() + "/" + getTotalSteps());
        }
        return a.toString();
    }
}
