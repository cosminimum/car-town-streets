package com.google.ads.mediation;

import android.content.Context;
import android.location.Location;
import com.google.ads.AdRequest;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Set;
/* loaded from: classes.dex */
public class MediationAdRequest {
    private AdRequest a;
    private boolean b;
    private boolean c;

    public MediationAdRequest(AdRequest request, Context context, boolean shareLocation) {
        this.a = request;
        this.c = shareLocation;
        if (context == null) {
            this.b = true;
        } else {
            this.b = request.isTestDevice(context);
        }
    }

    public AdRequest.Gender getGender() {
        return this.a.getGender();
    }

    public Date getBirthday() {
        return this.a.getBirthday();
    }

    public Integer getAgeInYears() {
        if (this.a.getBirthday() != null) {
            Calendar calendar = Calendar.getInstance();
            Calendar calendar2 = Calendar.getInstance();
            calendar.setTime(this.a.getBirthday());
            Integer valueOf = Integer.valueOf(calendar2.get(1) - calendar.get(1));
            if (calendar2.get(6) < calendar.get(6)) {
                return Integer.valueOf(valueOf.intValue() - 1);
            }
            return valueOf;
        }
        return null;
    }

    public Set<String> getKeywords() {
        if (this.a.getKeywords() == null) {
            return null;
        }
        return Collections.unmodifiableSet(this.a.getKeywords());
    }

    public Location getLocation() {
        if (this.a.getLocation() == null || !this.c) {
            return null;
        }
        return new Location(this.a.getLocation());
    }

    public boolean isTesting() {
        return this.b;
    }
}
