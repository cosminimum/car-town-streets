package com.google.android.gms.internal;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.ig;
import com.google.android.gms.plus.PlusShare;
import com.google.android.gms.plus.model.people.Person;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class ir extends com.google.android.gms.common.data.b implements Person {
    public ir(DataHolder dataHolder, int i) {
        super(dataHolder, i);
    }

    @Override // com.google.android.gms.plus.model.people.Person
    /* renamed from: fP */
    public ArrayList<Person.Organizations> getOrganizations() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    /* renamed from: fQ */
    public ArrayList<Person.PlacesLived> getPlacesLived() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    /* renamed from: fR */
    public ArrayList<Person.Urls> getUrls() {
        return null;
    }

    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: fS */
    public Person mo358freeze() {
        return new ig(getDisplayName(), getId(), (ig.c) getImage(), getObjectType(), getUrl());
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public String getAboutMe() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public Person.AgeRange getAgeRange() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public String getBirthday() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public String getBraggingRights() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public int getCircledByCount() {
        return 0;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public Person.Cover getCover() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public String getCurrentLocation() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public String getDisplayName() {
        return getString("displayName");
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public int getGender() {
        return 0;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public String getId() {
        return getString("personId");
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public Person.Image getImage() {
        return new ig.c(getString("image"));
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public String getLanguage() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public Person.Name getName() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public String getNickname() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public int getObjectType() {
        return ig.e.aB(getString("objectType"));
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public int getPlusOneCount() {
        return 0;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public int getRelationshipStatus() {
        return 0;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public String getTagline() {
        return null;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public String getUrl() {
        return getString(PlusShare.KEY_CALL_TO_ACTION_URL);
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasAboutMe() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasAgeRange() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasBirthday() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasBraggingRights() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasCircledByCount() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasCover() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasCurrentLocation() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasDisplayName() {
        return true;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasGender() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasId() {
        return true;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasImage() {
        return true;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasIsPlusUser() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasLanguage() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasName() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasNickname() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasObjectType() {
        return true;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasOrganizations() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasPlacesLived() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasPlusOneCount() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasRelationshipStatus() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasTagline() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasUrl() {
        return true;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasUrls() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean hasVerified() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean isPlusUser() {
        return false;
    }

    @Override // com.google.android.gms.plus.model.people.Person
    public boolean isVerified() {
        return false;
    }
}
