package com.google.android.gms.cast;

import android.os.Bundle;
import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.internal.C1059dp;
import com.google.android.gms.plus.PlusShare;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

public class MediaMetadata {
    public static final String KEY_ALBUM_ARTIST = "com.google.android.gms.cast.metadata.ALBUM_ARTIST";
    public static final String KEY_ALBUM_TITLE = "com.google.android.gms.cast.metadata.ALBUM_TITLE";
    public static final String KEY_ARTIST = "com.google.android.gms.cast.metadata.ARTIST";
    public static final String KEY_BROADCAST_DATE = "com.google.android.gms.cast.metadata.BROADCAST_DATE";
    public static final String KEY_COMPOSER = "com.google.android.gms.cast.metadata.COMPOSER";
    public static final String KEY_CREATION_DATE = "com.google.android.gms.cast.metadata.CREATION_DATE";
    public static final String KEY_DISC_NUMBER = "com.google.android.gms.cast.metadata.DISC_NUMBER";
    public static final String KEY_EPISODE_NUMBER = "com.google.android.gms.cast.metadata.EPISODE_NUMBER";
    public static final String KEY_HEIGHT = "com.google.android.gms.cast.metadata.HEIGHT";
    public static final String KEY_LOCATION_LATITUDE = "com.google.android.gms.cast.metadata.LOCATION_LATITUDE";
    public static final String KEY_LOCATION_LONGITUDE = "com.google.android.gms.cast.metadata.LOCATION_LONGITUDE";
    public static final String KEY_LOCATION_NAME = "com.google.android.gms.cast.metadata.LOCATION_NAME";
    public static final String KEY_RELEASE_DATE = "com.google.android.gms.cast.metadata.RELEASE_DATE";
    public static final String KEY_SEASON_NUMBER = "com.google.android.gms.cast.metadata.SEASON_NUMBER";
    public static final String KEY_SERIES_TITLE = "com.google.android.gms.cast.metadata.SERIES_TITLE";
    public static final String KEY_STUDIO = "com.google.android.gms.cast.metadata.STUDIO";
    public static final String KEY_SUBTITLE = "com.google.android.gms.cast.metadata.SUBTITLE";
    public static final String KEY_TITLE = "com.google.android.gms.cast.metadata.TITLE";
    public static final String KEY_TRACK_NUMBER = "com.google.android.gms.cast.metadata.TRACK_NUMBER";
    public static final String KEY_WIDTH = "com.google.android.gms.cast.metadata.WIDTH";
    public static final int MEDIA_TYPE_GENERIC = 0;
    public static final int MEDIA_TYPE_MOVIE = 1;
    public static final int MEDIA_TYPE_MUSIC_TRACK = 3;
    public static final int MEDIA_TYPE_PHOTO = 4;
    public static final int MEDIA_TYPE_TV_SHOW = 2;
    public static final int MEDIA_TYPE_USER = 100;

    /* renamed from: kO */
    private static final String[] f1244kO = {null, "String", "int", "double", "ISO-8601 date String"};

    /* renamed from: kP */
    private static final C0630a f1245kP = new C0630a().mo5777a(KEY_CREATION_DATE, "creationDateTime", 4).mo5777a(KEY_RELEASE_DATE, "releaseDate", 4).mo5777a(KEY_BROADCAST_DATE, "originalAirdate", 4).mo5777a(KEY_TITLE, PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_TITLE, 1).mo5777a(KEY_SUBTITLE, "subtitle", 1).mo5777a(KEY_ARTIST, "artist", 1).mo5777a(KEY_ALBUM_ARTIST, "albumArtist", 1).mo5777a(KEY_ALBUM_TITLE, "albumName", 1).mo5777a(KEY_COMPOSER, "composer", 1).mo5777a(KEY_DISC_NUMBER, "discNumber", 2).mo5777a(KEY_TRACK_NUMBER, "trackNumber", 2).mo5777a(KEY_SEASON_NUMBER, "season", 2).mo5777a(KEY_EPISODE_NUMBER, "episode", 2).mo5777a(KEY_SERIES_TITLE, "seriesTitle", 1).mo5777a(KEY_STUDIO, "studio", 1).mo5777a(KEY_WIDTH, "width", 2).mo5777a(KEY_HEIGHT, "height", 2).mo5777a(KEY_LOCATION_NAME, "location", 1).mo5777a(KEY_LOCATION_LATITUDE, "latitude", 3).mo5777a(KEY_LOCATION_LONGITUDE, "longitude", 3);

    /* renamed from: kQ */
    private final Bundle f1246kQ;

    /* renamed from: kR */
    private int f1247kR;

    /* renamed from: ki */
    private final List<WebImage> f1248ki;

    /* renamed from: com.google.android.gms.cast.MediaMetadata$a */
    private static class C0630a {

        /* renamed from: kS */
        private final Map<String, String> f1249kS = new HashMap();

        /* renamed from: kT */
        private final Map<String, String> f1250kT = new HashMap();

        /* renamed from: kU */
        private final Map<String, Integer> f1251kU = new HashMap();

        /* renamed from: A */
        public int mo5776A(String str) {
            Integer num = this.f1251kU.get(str);
            if (num != null) {
                return num.intValue();
            }
            return 0;
        }

        /* renamed from: a */
        public C0630a mo5777a(String str, String str2, int i) {
            this.f1249kS.put(str, str2);
            this.f1250kT.put(str2, str);
            this.f1251kU.put(str, Integer.valueOf(i));
            return this;
        }

        /* renamed from: y */
        public String mo5778y(String str) {
            return this.f1249kS.get(str);
        }

        /* renamed from: z */
        public String mo5779z(String str) {
            return this.f1250kT.get(str);
        }
    }

    public MediaMetadata() {
        this(0);
    }

    public MediaMetadata(int mediaType) {
        this.f1248ki = new ArrayList();
        this.f1246kQ = new Bundle();
        this.f1247kR = mediaType;
    }

    /* renamed from: a */
    private void m1182a(String str, int i) throws IllegalArgumentException {
        int A = f1245kP.mo5776A(str);
        if (A != i && A != 0) {
            throw new IllegalArgumentException("Value for " + str + " must be a " + f1244kO[i]);
        }
    }

    /* renamed from: a */
    private void m1183a(JSONObject jSONObject, String... strArr) {
        try {
            for (String str : strArr) {
                if (this.f1246kQ.containsKey(str)) {
                    switch (f1245kP.mo5776A(str)) {
                        case 1:
                        case 4:
                            jSONObject.put(f1245kP.mo5778y(str), this.f1246kQ.getString(str));
                            break;
                        case 2:
                            jSONObject.put(f1245kP.mo5778y(str), this.f1246kQ.getInt(str));
                            break;
                        case 3:
                            jSONObject.put(f1245kP.mo5778y(str), this.f1246kQ.getDouble(str));
                            break;
                    }
                }
            }
            for (String str2 : this.f1246kQ.keySet()) {
                if (!str2.startsWith("com.google.")) {
                    Object obj = this.f1246kQ.get(str2);
                    if (obj instanceof String) {
                        jSONObject.put(str2, obj);
                    } else if (obj instanceof Integer) {
                        jSONObject.put(str2, obj);
                    } else if (obj instanceof Double) {
                        jSONObject.put(str2, obj);
                    }
                }
            }
        } catch (JSONException e) {
        }
    }

    /* renamed from: a */
    private boolean m1184a(Bundle bundle, Bundle bundle2) {
        if (bundle.size() != bundle2.size()) {
            return false;
        }
        for (String str : bundle.keySet()) {
            Object obj = bundle.get(str);
            Object obj2 = bundle2.get(str);
            if ((obj instanceof Bundle) && (obj2 instanceof Bundle) && !m1184a((Bundle) obj, (Bundle) obj2)) {
                return false;
            }
            if (obj == null) {
                if (obj2 != null || !bundle2.containsKey(str)) {
                    return false;
                }
            } else if (!obj.equals(obj2)) {
                return false;
            }
        }
        return true;
    }

    /* renamed from: b */
    private void m1185b(JSONObject jSONObject, String... strArr) {
        HashSet hashSet = new HashSet(Arrays.asList(strArr));
        try {
            Iterator<String> keys = jSONObject.keys();
            while (keys.hasNext()) {
                String next = keys.next();
                String z = f1245kP.mo5779z(next);
                if (z == null) {
                    Object obj = jSONObject.get(next);
                    if (obj instanceof String) {
                        this.f1246kQ.putString(z, (String) obj);
                    } else if (obj instanceof Integer) {
                        this.f1246kQ.putInt(z, ((Integer) obj).intValue());
                    } else if (obj instanceof Double) {
                        this.f1246kQ.putDouble(z, ((Double) obj).doubleValue());
                    }
                } else if (hashSet.contains(z)) {
                    try {
                        Object obj2 = jSONObject.get(next);
                        if (obj2 != null) {
                            switch (f1245kP.mo5776A(z)) {
                                case 1:
                                    if (!(obj2 instanceof String)) {
                                        break;
                                    } else {
                                        this.f1246kQ.putString(z, (String) obj2);
                                        break;
                                    }
                                case 2:
                                    if (!(obj2 instanceof Integer)) {
                                        break;
                                    } else {
                                        this.f1246kQ.putInt(z, ((Integer) obj2).intValue());
                                        break;
                                    }
                                case 3:
                                    if (!(obj2 instanceof Double)) {
                                        break;
                                    } else {
                                        this.f1246kQ.putDouble(z, ((Double) obj2).doubleValue());
                                        break;
                                    }
                                case 4:
                                    if ((obj2 instanceof String) && C1059dp.m2443G((String) obj2) != null) {
                                        this.f1246kQ.putString(z, (String) obj2);
                                        break;
                                    }
                            }
                        }
                    } catch (JSONException e) {
                    }
                }
            }
        } catch (JSONException e2) {
        }
    }

    /* renamed from: aP */
    public JSONObject mo5755aP() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("metadataType", this.f1247kR);
        } catch (JSONException e) {
        }
        C1059dp.m2449a(jSONObject, this.f1248ki);
        switch (this.f1247kR) {
            case 0:
                m1183a(jSONObject, KEY_TITLE, KEY_ARTIST, KEY_SUBTITLE, KEY_RELEASE_DATE);
                break;
            case 1:
                m1183a(jSONObject, KEY_TITLE, KEY_STUDIO, KEY_SUBTITLE, KEY_RELEASE_DATE);
                break;
            case 2:
                m1183a(jSONObject, KEY_TITLE, KEY_SERIES_TITLE, KEY_SEASON_NUMBER, KEY_EPISODE_NUMBER, KEY_BROADCAST_DATE);
                break;
            case 3:
                m1183a(jSONObject, KEY_TITLE, KEY_ARTIST, KEY_ALBUM_TITLE, KEY_ALBUM_ARTIST, KEY_COMPOSER, KEY_TRACK_NUMBER, KEY_DISC_NUMBER, KEY_RELEASE_DATE);
                break;
            case 4:
                m1183a(jSONObject, KEY_TITLE, KEY_ARTIST, KEY_LOCATION_NAME, KEY_LOCATION_LATITUDE, KEY_LOCATION_LONGITUDE, KEY_WIDTH, KEY_HEIGHT, KEY_CREATION_DATE);
                break;
        }
        m1183a(jSONObject, new String[0]);
        return jSONObject;
    }

    public void addImage(WebImage image) {
        this.f1248ki.add(image);
    }

    /* renamed from: b */
    public void mo5757b(JSONObject jSONObject) {
        clear();
        this.f1247kR = 0;
        try {
            this.f1247kR = jSONObject.getInt("metadataType");
        } catch (JSONException e) {
        }
        C1059dp.m2448a(this.f1248ki, jSONObject);
        switch (this.f1247kR) {
            case 0:
                m1185b(jSONObject, KEY_TITLE, KEY_ARTIST, KEY_SUBTITLE, KEY_RELEASE_DATE);
                return;
            case 1:
                m1185b(jSONObject, KEY_TITLE, KEY_STUDIO, KEY_SUBTITLE, KEY_RELEASE_DATE);
                return;
            case 2:
                m1185b(jSONObject, KEY_TITLE, KEY_SERIES_TITLE, KEY_SEASON_NUMBER, KEY_EPISODE_NUMBER, KEY_BROADCAST_DATE);
                return;
            case 3:
                m1185b(jSONObject, KEY_TITLE, KEY_ALBUM_TITLE, KEY_ARTIST, KEY_ALBUM_ARTIST, KEY_COMPOSER, KEY_TRACK_NUMBER, KEY_DISC_NUMBER, KEY_RELEASE_DATE);
                return;
            case 4:
                m1185b(jSONObject, KEY_TITLE, KEY_ARTIST, KEY_LOCATION_NAME, KEY_LOCATION_LATITUDE, KEY_LOCATION_LONGITUDE, KEY_WIDTH, KEY_HEIGHT, KEY_CREATION_DATE);
                break;
        }
        m1185b(jSONObject, new String[0]);
    }

    public void clear() {
        this.f1246kQ.clear();
        this.f1248ki.clear();
    }

    public void clearImages() {
        this.f1248ki.clear();
    }

    public boolean containsKey(String key) {
        return this.f1246kQ.containsKey(key);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MediaMetadata)) {
            return false;
        }
        MediaMetadata mediaMetadata = (MediaMetadata) other;
        return m1184a(this.f1246kQ, mediaMetadata.f1246kQ) && this.f1248ki.equals(mediaMetadata.f1248ki);
    }

    public Calendar getDate(String key) {
        m1182a(key, 4);
        String string = this.f1246kQ.getString(key);
        if (string != null) {
            return C1059dp.m2443G(string);
        }
        return null;
    }

    public String getDateAsString(String key) {
        m1182a(key, 4);
        return this.f1246kQ.getString(key);
    }

    public double getDouble(String key) {
        m1182a(key, 3);
        return this.f1246kQ.getDouble(key);
    }

    public List<WebImage> getImages() {
        return this.f1248ki;
    }

    public int getInt(String key) {
        m1182a(key, 2);
        return this.f1246kQ.getInt(key);
    }

    public int getMediaType() {
        return this.f1247kR;
    }

    public String getString(String key) {
        m1182a(key, 1);
        return this.f1246kQ.getString(key);
    }

    public boolean hasImages() {
        return this.f1248ki != null && !this.f1248ki.isEmpty();
    }

    public int hashCode() {
        int i = 17;
        Iterator it = this.f1246kQ.keySet().iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return (i2 * 31) + this.f1248ki.hashCode();
            }
            i = this.f1246kQ.get((String) it.next()).hashCode() + (i2 * 31);
        }
    }

    public Set<String> keySet() {
        return this.f1246kQ.keySet();
    }

    public void putDate(String key, Calendar value) {
        m1182a(key, 4);
        this.f1246kQ.putString(key, C1059dp.m2447a(value));
    }

    public void putDouble(String key, double value) {
        m1182a(key, 3);
        this.f1246kQ.putDouble(key, value);
    }

    public void putInt(String key, int value) {
        m1182a(key, 2);
        this.f1246kQ.putInt(key, value);
    }

    public void putString(String key, String value) {
        m1182a(key, 1);
        this.f1246kQ.putString(key, value);
    }
}
