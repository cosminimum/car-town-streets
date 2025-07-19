package com.chartboost.sdk.impl;

import com.miniclip.nativeJNI.PurchaseDatabase;
import java.lang.reflect.Array;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Pattern;

/* renamed from: com.chartboost.sdk.impl.al */
public class C0111al implements C0108ai {

    /* renamed from: a */
    protected C0115ap f162a;

    /* renamed from: a */
    public byte[] mo1281a(C0109aj ajVar) {
        C0114ao aoVar = new C0114ao();
        mo1265a((C0115ap) aoVar);
        mo1282b(ajVar);
        mo1263a();
        return aoVar.mo1304c();
    }

    /* renamed from: a */
    public void mo1265a(C0115ap apVar) {
        if (this.f162a != null) {
            throw new IllegalStateException("in the middle of something");
        }
        this.f162a = apVar;
    }

    /* renamed from: a */
    public void mo1263a() {
        this.f162a = null;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public boolean mo1279a(String str, C0109aj ajVar) {
        return false;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public boolean mo1280a(String str, Object obj) {
        return false;
    }

    /* renamed from: b */
    public int mo1282b(C0109aj ajVar) {
        return mo1283b((String) null, ajVar);
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public int mo1283b(String str, C0109aj ajVar) {
        byte b;
        if (ajVar == null) {
            throw new NullPointerException("can't save a null object");
        }
        int a = this.f162a.mo1292a();
        if (ajVar instanceof List) {
            b = 4;
        } else {
            b = 3;
        }
        if (mo1279a(str, ajVar)) {
            return this.f162a.mo1292a() - a;
        }
        if (str != null) {
            mo1264a(b, str);
        }
        int a2 = this.f162a.mo1292a();
        this.f162a.mo1303c(0);
        List list = null;
        boolean z = b == 3 && str == null;
        if (b == 3) {
            if (z && ajVar.mo1261b(PurchaseDatabase.PURCHASED_PRODUCT_ID_COL)) {
                mo1285b(PurchaseDatabase.PURCHASED_PRODUCT_ID_COL, ajVar.mo1259a(PurchaseDatabase.PURCHASED_PRODUCT_ID_COL));
            }
            Object a3 = ajVar.mo1259a("_transientFields");
            if (a3 instanceof List) {
                list = (List) a3;
            }
        }
        if (ajVar instanceof Map) {
            for (Map.Entry entry : ((Map) ajVar).entrySet()) {
                if ((!z || !((String) entry.getKey()).equals(PurchaseDatabase.PURCHASED_PRODUCT_ID_COL)) && (list == null || !list.contains(entry.getKey()))) {
                    mo1285b((String) entry.getKey(), entry.getValue());
                }
            }
        } else {
            for (String next : ajVar.keySet()) {
                if ((!z || !next.equals(PurchaseDatabase.PURCHASED_PRODUCT_ID_COL)) && (list == null || !list.contains(next))) {
                    mo1285b(next, ajVar.mo1259a(next));
                }
            }
        }
        this.f162a.write(0);
        this.f162a.mo1301a(a2, this.f162a.mo1292a() - a2);
        return this.f162a.mo1292a() - a;
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public void mo1285b(String str, Object obj) {
        if (!str.equals("_transientFields")) {
            if (!str.equals("$where") || !(obj instanceof String)) {
                Object a = C0103ag.m173a(obj);
                if (a == null) {
                    mo1266a(str);
                } else if (a instanceof Date) {
                    mo1276a(str, (Date) a);
                } else if (a instanceof Number) {
                    mo1274a(str, (Number) a);
                } else if (a instanceof Character) {
                    mo1275a(str, a.toString());
                } else if (a instanceof String) {
                    mo1275a(str, a.toString());
                } else if (a instanceof C0126ay) {
                    mo1271a(str, (C0126ay) a);
                } else if (a instanceof C0109aj) {
                    mo1283b(str, (C0109aj) a);
                } else if (a instanceof Boolean) {
                    mo1273a(str, (Boolean) a);
                } else if (a instanceof Pattern) {
                    m186a(str, (Pattern) a);
                } else if (a instanceof Map) {
                    m185a(str, (Map) a);
                } else if (a instanceof Iterable) {
                    m183a(str, (Iterable) a);
                } else if (a instanceof byte[]) {
                    mo1278a(str, (byte[]) a);
                } else if (a instanceof C0121at) {
                    mo1268a(str, (C0121at) a);
                } else if (a instanceof UUID) {
                    mo1277a(str, (UUID) a);
                } else if (a.getClass().isArray()) {
                    m187c(str, a);
                } else if (a instanceof C0127az) {
                    mo1272a(str, (C0127az) a);
                } else if (a instanceof C0120as) {
                    mo1267a(str, (C0120as) a);
                } else if (a instanceof C0123av) {
                    mo1270a(str, (C0123av) a);
                } else if (a instanceof C0122au) {
                    mo1269a(str, (C0122au) a);
                } else if (a instanceof C0218z) {
                    C0112am amVar = new C0112am();
                    amVar.mo1260a("$ref", ((C0218z) a).mo1519b());
                    amVar.mo1260a("$id", ((C0218z) a).mo1518a());
                    mo1283b(str, (C0109aj) amVar);
                } else if (a instanceof C0125ax) {
                    m188d(str);
                } else if (a instanceof C0124aw) {
                    m189e(str);
                } else if (!mo1280a(str, a)) {
                    throw new IllegalArgumentException("can't serialize " + a.getClass());
                }
            } else {
                mo1264a((byte) 13, str);
                mo1284b(obj.toString());
            }
        }
    }

    /* renamed from: c */
    private void m187c(String str, Object obj) {
        mo1264a((byte) 4, str);
        int a = this.f162a.mo1292a();
        this.f162a.mo1303c(0);
        int length = Array.getLength(obj);
        for (int i = 0; i < length; i++) {
            mo1285b(String.valueOf(i), Array.get(obj, i));
        }
        this.f162a.write(0);
        this.f162a.mo1301a(a, this.f162a.mo1292a() - a);
    }

    /* renamed from: a */
    private void m183a(String str, Iterable iterable) {
        mo1264a((byte) 4, str);
        int a = this.f162a.mo1292a();
        this.f162a.mo1303c(0);
        int i = 0;
        for (Object b : iterable) {
            mo1285b(String.valueOf(i), b);
            i++;
        }
        this.f162a.write(0);
        this.f162a.mo1301a(a, this.f162a.mo1292a() - a);
    }

    /* renamed from: a */
    private void m185a(String str, Map map) {
        mo1264a((byte) 3, str);
        int a = this.f162a.mo1292a();
        this.f162a.mo1303c(0);
        for (Map.Entry entry : map.entrySet()) {
            mo1285b(entry.getKey().toString(), entry.getValue());
        }
        this.f162a.write(0);
        this.f162a.mo1301a(a, this.f162a.mo1292a() - a);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1266a(String str) {
        mo1264a((byte) 10, str);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1267a(String str, C0120as asVar) {
        mo1264a((byte) 17, str);
        this.f162a.mo1303c(asVar.mo1325b());
        this.f162a.mo1303c(asVar.mo1323a());
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1270a(String str, C0123av avVar) {
        mo1264a((byte) 15, str);
        int a = this.f162a.mo1292a();
        this.f162a.mo1303c(0);
        mo1284b(avVar.mo1332a());
        mo1282b(avVar.mo1336b());
        this.f162a.mo1301a(a, this.f162a.mo1292a() - a);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1269a(String str, C0122au auVar) {
        mo1264a((byte) 13, str);
        this.f162a.mo1292a();
        mo1284b(auVar.mo1332a());
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1273a(String str, Boolean bool) {
        mo1264a((byte) 8, str);
        this.f162a.write(bool.booleanValue() ? 1 : 0);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1276a(String str, Date date) {
        mo1264a((byte) 9, str);
        this.f162a.mo1302a(date.getTime());
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1274a(String str, Number number) {
        if ((number instanceof Integer) || (number instanceof Short) || (number instanceof Byte) || (number instanceof AtomicInteger)) {
            mo1264a((byte) 16, str);
            this.f162a.mo1303c(number.intValue());
        } else if ((number instanceof Long) || (number instanceof AtomicLong)) {
            mo1264a((byte) 18, str);
            this.f162a.mo1302a(number.longValue());
        } else if ((number instanceof Float) || (number instanceof Double)) {
            mo1264a((byte) 1, str);
            this.f162a.mo1300a(number.doubleValue());
        } else {
            throw new IllegalArgumentException("can't serialize " + number.getClass());
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1278a(String str, byte[] bArr) {
        m182a(str, 0, bArr);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1268a(String str, C0121at atVar) {
        m182a(str, (int) atVar.mo1330a(), atVar.mo1331b());
    }

    /* renamed from: a */
    private void m182a(String str, int i, byte[] bArr) {
        mo1264a((byte) 5, str);
        int length = bArr.length;
        if (i == 2) {
            length += 4;
        }
        this.f162a.mo1303c(length);
        this.f162a.write(i);
        if (i == 2) {
            this.f162a.mo1303c(length - 4);
        }
        int a = this.f162a.mo1292a();
        this.f162a.write(bArr);
        C0100ae.m171a(this.f162a.mo1292a() - a, bArr.length);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1277a(String str, UUID uuid) {
        mo1264a((byte) 5, str);
        this.f162a.mo1303c(16);
        this.f162a.write(3);
        this.f162a.mo1302a(uuid.getMostSignificantBits());
        this.f162a.mo1302a(uuid.getLeastSignificantBits());
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1272a(String str, C0127az azVar) {
        m184a(str, azVar.mo1354a(), (byte) 14);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1275a(String str, String str2) {
        m184a(str, str2, (byte) 2);
    }

    /* renamed from: a */
    private void m184a(String str, String str2, byte b) {
        mo1264a(b, str);
        mo1284b(str2);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1271a(String str, C0126ay ayVar) {
        mo1264a((byte) 7, str);
        this.f162a.mo1305d(ayVar.mo1347c());
        this.f162a.mo1305d(ayVar.mo1349d());
        this.f162a.mo1305d(ayVar.mo1350e());
    }

    /* renamed from: a */
    private void m186a(String str, Pattern pattern) {
        mo1264a((byte) 11, str);
        mo1286c(pattern.pattern());
        mo1286c(C0103ag.m174a(pattern.flags()));
    }

    /* renamed from: d */
    private void m188d(String str) {
        mo1264a((byte) -1, str);
    }

    /* renamed from: e */
    private void m189e(String str) {
        mo1264a(Byte.MAX_VALUE, str);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1264a(byte b, String str) {
        this.f162a.write((int) b);
        mo1286c(str);
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public void mo1284b(String str) {
        int a = this.f162a.mo1292a();
        this.f162a.mo1303c(0);
        this.f162a.mo1301a(a, mo1286c(str));
    }

    /* access modifiers changed from: protected */
    /* renamed from: c */
    public int mo1286c(String str) {
        int length = str.length();
        int i = 0;
        int i2 = 0;
        while (i < length) {
            int codePointAt = Character.codePointAt(str, i);
            if (codePointAt < 128) {
                this.f162a.write((int) (byte) codePointAt);
                i2++;
            } else if (codePointAt < 2048) {
                this.f162a.write((int) (byte) ((codePointAt >> 6) + 192));
                this.f162a.write((int) (byte) ((codePointAt & 63) + 128));
                i2 += 2;
            } else if (codePointAt < 65536) {
                this.f162a.write((int) (byte) ((codePointAt >> 12) + 224));
                this.f162a.write((int) (byte) (((codePointAt >> 6) & 63) + 128));
                this.f162a.write((int) (byte) ((codePointAt & 63) + 128));
                i2 += 3;
            } else {
                this.f162a.write((int) (byte) ((codePointAt >> 18) + 240));
                this.f162a.write((int) (byte) (((codePointAt >> 12) & 63) + 128));
                this.f162a.write((int) (byte) (((codePointAt >> 6) & 63) + 128));
                this.f162a.write((int) (byte) ((codePointAt & 63) + 128));
                i2 += 4;
            }
            i += Character.charCount(codePointAt);
        }
        this.f162a.write(0);
        return i2 + 1;
    }
}
