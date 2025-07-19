package com.google.ads.mediation;

import android.content.Context;
import android.location.Location;
import com.google.ads.AdRequest;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Set;

public class MediationAdRequest {

    /* renamed from: a */
    private AdRequest f994a;

    /* renamed from: b */
    private boolean f995b;

    /* renamed from: c */
    private boolean f996c;

    public MediationAdRequest(AdRequest request, Context context, boolean shareLocation) {
        this.f994a = request;
        this.f996c = shareLocation;
        if (context == null) {
            this.f995b = true;
        } else {
            this.f995b = request.isTestDevice(context);
        }
    }

    public AdRequest.Gender getGender() {
        return this.f994a.getGender();
    }

    public Date getBirthday() {
        return this.f994a.getBirthday();
    }

    public Integer getAgeInYears() {
        if (this.f994a.getBirthday() == null) {
            return null;
        }
        Calendar instance = Calendar.getInstance();
        Calendar instance2 = Calendar.getInstance();
        instance.setTime(this.f994a.getBirthday());
        Integer valueOf = Integer.valueOf(instance2.get(1) - instance.get(1));
        if (instance2.get(6) < instance.get(6)) {
            return Integer.valueOf(valueOf.intValue() - 1);
        }
        return valueOf;
    }

    public Set<String> getKeywords() {
        if (this.f994a.getKeywords() == null) {
            return null;
        }
        return Collections.unmodifiableSet(this.f994a.getKeywords());
    }

    public Location getLocation() {
        if (this.f994a.getLocation() == null || !this.f996c) {
            return null;
        }
        return new Location(this.f994a.getLocation());
    }

    public boolean isTesting() {
        return this.f995b;
    }
}
