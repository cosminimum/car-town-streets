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
/* loaded from: classes.dex */
public final class a extends b implements Achievement {
    /* JADX INFO: Access modifiers changed from: package-private */
    public a(DataHolder dataHolder, int i) {
        super(dataHolder, i);
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public String getAchievementId() {
        return getString("external_achievement_id");
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public int getCurrentSteps() {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        ds.p(z);
        return getInteger("current_steps");
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public String getDescription() {
        return getString(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION);
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public void getDescription(CharArrayBuffer dataOut) {
        a(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION, dataOut);
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public String getFormattedCurrentSteps() {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        ds.p(z);
        return getString("formatted_current_steps");
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public void getFormattedCurrentSteps(CharArrayBuffer dataOut) {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        ds.p(z);
        a("formatted_current_steps", dataOut);
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public String getFormattedTotalSteps() {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        ds.p(z);
        return getString("formatted_total_steps");
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public void getFormattedTotalSteps(CharArrayBuffer dataOut) {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        ds.p(z);
        a("formatted_total_steps", dataOut);
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public long getLastUpdatedTimestamp() {
        return getLong("last_updated_timestamp");
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public String getName() {
        return getString("name");
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public void getName(CharArrayBuffer dataOut) {
        a("name", dataOut);
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public Player getPlayer() {
        return new d(this.nE, this.nG);
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public Uri getRevealedImageUri() {
        return L("revealed_icon_image_uri");
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public int getState() {
        return getInteger("state");
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public int getTotalSteps() {
        boolean z = true;
        if (getType() != 1) {
            z = false;
        }
        ds.p(z);
        return getInteger("total_steps");
    }

    @Override // com.google.android.gms.games.achievement.Achievement
    public int getType() {
        return getInteger(ServerProtocol.DIALOG_PARAM_TYPE);
    }

    @Override // com.google.android.gms.games.achievement.Achievement
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
