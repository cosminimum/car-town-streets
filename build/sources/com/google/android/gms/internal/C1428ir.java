package com.google.android.gms.internal;

import com.google.android.gms.common.data.C0663b;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.C1407ig;
import com.google.android.gms.plus.PlusShare;
import com.google.android.gms.plus.model.people.Person;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.ir */
public final class C1428ir extends C0663b implements Person {
    public C1428ir(DataHolder dataHolder, int i) {
        super(dataHolder, i);
    }

    /* renamed from: fP */
    public ArrayList<Person.Organizations> getOrganizations() {
        return null;
    }

    /* renamed from: fQ */
    public ArrayList<Person.PlacesLived> getPlacesLived() {
        return null;
    }

    /* renamed from: fR */
    public ArrayList<Person.Urls> getUrls() {
        return null;
    }

    /* renamed from: fS */
    public Person freeze() {
        return new C1407ig(getDisplayName(), getId(), (C1407ig.C1412c) getImage(), getObjectType(), getUrl());
    }

    public String getAboutMe() {
        return null;
    }

    public Person.AgeRange getAgeRange() {
        return null;
    }

    public String getBirthday() {
        return null;
    }

    public String getBraggingRights() {
        return null;
    }

    public int getCircledByCount() {
        return 0;
    }

    public Person.Cover getCover() {
        return null;
    }

    public String getCurrentLocation() {
        return null;
    }

    public String getDisplayName() {
        return getString("displayName");
    }

    public int getGender() {
        return 0;
    }

    public String getId() {
        return getString("personId");
    }

    public Person.Image getImage() {
        return new C1407ig.C1412c(getString("image"));
    }

    public String getLanguage() {
        return null;
    }

    public Person.Name getName() {
        return null;
    }

    public String getNickname() {
        return null;
    }

    public int getObjectType() {
        return C1407ig.C1414e.m3846aB(getString("objectType"));
    }

    public int getPlusOneCount() {
        return 0;
    }

    public int getRelationshipStatus() {
        return 0;
    }

    public String getTagline() {
        return null;
    }

    public String getUrl() {
        return getString(PlusShare.KEY_CALL_TO_ACTION_URL);
    }

    public boolean hasAboutMe() {
        return false;
    }

    public boolean hasAgeRange() {
        return false;
    }

    public boolean hasBirthday() {
        return false;
    }

    public boolean hasBraggingRights() {
        return false;
    }

    public boolean hasCircledByCount() {
        return false;
    }

    public boolean hasCover() {
        return false;
    }

    public boolean hasCurrentLocation() {
        return false;
    }

    public boolean hasDisplayName() {
        return true;
    }

    public boolean hasGender() {
        return false;
    }

    public boolean hasId() {
        return true;
    }

    public boolean hasImage() {
        return true;
    }

    public boolean hasIsPlusUser() {
        return false;
    }

    public boolean hasLanguage() {
        return false;
    }

    public boolean hasName() {
        return false;
    }

    public boolean hasNickname() {
        return false;
    }

    public boolean hasObjectType() {
        return true;
    }

    public boolean hasOrganizations() {
        return false;
    }

    public boolean hasPlacesLived() {
        return false;
    }

    public boolean hasPlusOneCount() {
        return false;
    }

    public boolean hasRelationshipStatus() {
        return false;
    }

    public boolean hasTagline() {
        return false;
    }

    public boolean hasUrl() {
        return true;
    }

    public boolean hasUrls() {
        return false;
    }

    public boolean hasVerified() {
        return false;
    }

    public boolean isPlusUser() {
        return false;
    }

    public boolean isVerified() {
        return false;
    }
}
