package com.flurry.android;

import android.content.Context;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class z {
    private Context a;
    private u b;
    private a c;
    private volatile long d;
    private af e = new af(50);
    private af f = new af(50);
    private Map g = new HashMap();
    private Map h = new HashMap();
    private Map i = new HashMap();
    private Map j = new HashMap();
    private volatile boolean k;

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(Context context, u uVar, a aVar) {
        this.a = context;
        this.b = uVar;
        this.c = aVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized v[] a(String str) {
        v[] vVarArr;
        vVarArr = (v[]) this.g.get(str);
        if (vVarArr == null) {
            vVarArr = (v[]) this.g.get("");
        }
        return vVarArr;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized al a(long j) {
        return (al) this.f.a(Long.valueOf(j));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized Set a() {
        return this.e.c();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized AdImage b(long j) {
        return (AdImage) this.e.a(Long.valueOf(j));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized AdImage a(short s) {
        Long l;
        l = (Long) this.j.get((short) 1);
        return l == null ? null : b(l.longValue());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized e b(String str) {
        e eVar;
        eVar = (e) this.h.get(str);
        if (eVar == null) {
            eVar = (e) this.h.get("");
        }
        return eVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final boolean b() {
        return this.k;
    }

    private synchronized c a(byte b) {
        return (c) this.i.get(Byte.valueOf(b));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void a(Map map, Map map2, Map map3, Map map4, Map map5, Map map6) {
        this.d = System.currentTimeMillis();
        for (Map.Entry entry : map4.entrySet()) {
            if (entry.getValue() != null) {
                this.e.a(entry.getKey(), entry.getValue());
            }
        }
        for (Map.Entry entry2 : map5.entrySet()) {
            if (entry2.getValue() != null) {
                this.f.a(entry2.getKey(), entry2.getValue());
            }
        }
        if (map2 != null && !map2.isEmpty()) {
            this.h = map2;
        }
        if (map3 != null && !map3.isEmpty()) {
            this.i = map3;
        }
        if (map6 != null && !map6.isEmpty()) {
            this.j = map6;
        }
        this.g = new HashMap();
        for (Map.Entry entry3 : map2.entrySet()) {
            e eVar = (e) entry3.getValue();
            v[] vVarArr = (v[]) map.get(Byte.valueOf(eVar.b));
            if (vVarArr != null) {
                this.g.put(entry3.getKey(), vVarArr);
            }
            c cVar = (c) map3.get(Byte.valueOf(eVar.c));
            if (cVar != null) {
                eVar.d = cVar;
            }
        }
        f();
        a(CallbackEvent.ADS_UPDATED);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final long c() {
        return this.d;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void d() {
        DataInputStream dataInputStream;
        File fileStreamPath = this.a.getFileStreamPath(g());
        if (fileStreamPath.exists()) {
            try {
                dataInputStream = new DataInputStream(new FileInputStream(fileStreamPath));
                try {
                    if (dataInputStream.readUnsignedShort() == 46587) {
                        a(dataInputStream);
                        a(CallbackEvent.ADS_LOADED_FROM_CACHE);
                    } else {
                        a(fileStreamPath);
                    }
                    r.a(dataInputStream);
                } catch (Throwable th) {
                    th = th;
                    ah.a("FlurryAgent", "Discarding cache", th);
                    a(fileStreamPath);
                    r.a(dataInputStream);
                }
            } catch (Throwable th2) {
                th = th2;
                dataInputStream = null;
            }
        } else {
            ah.c("FlurryAgent", "cache file does not exist, path=" + fileStreamPath.getAbsolutePath());
        }
    }

    private static void a(File file) {
        if (!file.delete()) {
            ah.b("FlurryAgent", "Cannot delete cached ads");
        }
    }

    private void f() {
        Iterator it = this.i.values().iterator();
        while (it.hasNext()) {
            it.next();
        }
        for (v[] vVarArr : this.g.values()) {
            if (vVarArr != null) {
                for (v vVar : vVarArr) {
                    vVar.h = b(vVar.f.longValue());
                    if (vVar.h == null) {
                        ah.b("FlurryAgent", "Ad " + vVar.d + " has no image");
                    }
                    if (a(vVar.a) == null) {
                        ah.b("FlurryAgent", "Ad " + vVar.d + " has no pricing");
                    }
                }
            }
        }
        for (e eVar : this.h.values()) {
            eVar.d = a(eVar.c);
            if (eVar.d == null) {
                ah.d("FlurryAgent", "No ad theme found for " + ((int) eVar.c));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void e() {
        DataOutputStream dataOutputStream = null;
        synchronized (this) {
            try {
                File fileStreamPath = this.a.getFileStreamPath(g());
                File parentFile = fileStreamPath.getParentFile();
                if (!parentFile.mkdirs() && !parentFile.exists()) {
                    ah.b("FlurryAgent", "Unable to create persistent dir: " + parentFile);
                    r.a((Closeable) null);
                } else {
                    DataOutputStream dataOutputStream2 = new DataOutputStream(new FileOutputStream(fileStreamPath));
                    try {
                        dataOutputStream2.writeShort(46587);
                        a(dataOutputStream2);
                        r.a(dataOutputStream2);
                    } catch (Throwable th) {
                        th = th;
                        dataOutputStream = dataOutputStream2;
                        ah.b("FlurryAgent", "", th);
                        r.a(dataOutputStream);
                    }
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }

    private void a(DataInputStream dataInputStream) {
        ah.a("FlurryAgent", "Reading cache");
        if (dataInputStream.readUnsignedShort() == 2) {
            this.d = dataInputStream.readLong();
            int readUnsignedShort = dataInputStream.readUnsignedShort();
            this.e = new af(50);
            for (int i = 0; i < readUnsignedShort; i++) {
                long readLong = dataInputStream.readLong();
                AdImage adImage = new AdImage();
                adImage.a(dataInputStream);
                this.e.a(Long.valueOf(readLong), adImage);
            }
            int readUnsignedShort2 = dataInputStream.readUnsignedShort();
            this.f = new af(50);
            for (int i2 = 0; i2 < readUnsignedShort2; i2++) {
                long readLong2 = dataInputStream.readLong();
                al alVar = new al();
                if (dataInputStream.readBoolean()) {
                    alVar.a = dataInputStream.readUTF();
                }
                if (dataInputStream.readBoolean()) {
                    alVar.b = dataInputStream.readUTF();
                }
                alVar.c = dataInputStream.readInt();
                this.f.a(Long.valueOf(readLong2), alVar);
            }
            int readUnsignedShort3 = dataInputStream.readUnsignedShort();
            this.h = new HashMap(readUnsignedShort3);
            for (int i3 = 0; i3 < readUnsignedShort3; i3++) {
                this.h.put(dataInputStream.readUTF(), new e(dataInputStream));
            }
            int readUnsignedShort4 = dataInputStream.readUnsignedShort();
            this.g = new HashMap(readUnsignedShort4);
            for (int i4 = 0; i4 < readUnsignedShort4; i4++) {
                String readUTF = dataInputStream.readUTF();
                int readUnsignedShort5 = dataInputStream.readUnsignedShort();
                v[] vVarArr = new v[readUnsignedShort5];
                for (int i5 = 0; i5 < readUnsignedShort5; i5++) {
                    v vVar = new v();
                    vVar.a(dataInputStream);
                    vVarArr[i5] = vVar;
                }
                this.g.put(readUTF, vVarArr);
            }
            int readUnsignedShort6 = dataInputStream.readUnsignedShort();
            this.i = new HashMap();
            for (int i6 = 0; i6 < readUnsignedShort6; i6++) {
                byte readByte = dataInputStream.readByte();
                c cVar = new c();
                cVar.b(dataInputStream);
                this.i.put(Byte.valueOf(readByte), cVar);
            }
            int readUnsignedShort7 = dataInputStream.readUnsignedShort();
            this.j = new HashMap(readUnsignedShort7);
            for (int i7 = 0; i7 < readUnsignedShort7; i7++) {
                this.j.put(Short.valueOf(dataInputStream.readShort()), Long.valueOf(dataInputStream.readLong()));
            }
            f();
            ah.a("FlurryAgent", "Cache read, num images: " + this.e.a());
        }
    }

    private void a(DataOutputStream dataOutputStream) {
        dataOutputStream.writeShort(2);
        dataOutputStream.writeLong(this.d);
        List<Map.Entry> b = this.e.b();
        dataOutputStream.writeShort(b.size());
        for (Map.Entry entry : b) {
            dataOutputStream.writeLong(((Long) entry.getKey()).longValue());
            AdImage adImage = (AdImage) entry.getValue();
            dataOutputStream.writeLong(adImage.a);
            dataOutputStream.writeInt(adImage.b);
            dataOutputStream.writeInt(adImage.c);
            dataOutputStream.writeUTF(adImage.d);
            dataOutputStream.writeInt(adImage.e.length);
            dataOutputStream.write(adImage.e);
        }
        List<Map.Entry> b2 = this.f.b();
        dataOutputStream.writeShort(b2.size());
        for (Map.Entry entry2 : b2) {
            dataOutputStream.writeLong(((Long) entry2.getKey()).longValue());
            al alVar = (al) entry2.getValue();
            boolean z = alVar.a != null;
            dataOutputStream.writeBoolean(z);
            if (z) {
                dataOutputStream.writeUTF(alVar.a);
            }
            boolean z2 = alVar.b != null;
            dataOutputStream.writeBoolean(z2);
            if (z2) {
                dataOutputStream.writeUTF(alVar.b);
            }
            dataOutputStream.writeInt(alVar.c);
        }
        dataOutputStream.writeShort(this.h.size());
        for (Map.Entry entry3 : this.h.entrySet()) {
            dataOutputStream.writeUTF((String) entry3.getKey());
            e eVar = (e) entry3.getValue();
            dataOutputStream.writeUTF(eVar.a);
            dataOutputStream.writeByte(eVar.b);
            dataOutputStream.writeByte(eVar.c);
        }
        dataOutputStream.writeShort(this.g.size());
        for (Map.Entry entry4 : this.g.entrySet()) {
            dataOutputStream.writeUTF((String) entry4.getKey());
            v[] vVarArr = (v[]) entry4.getValue();
            int length = vVarArr == null ? 0 : vVarArr.length;
            dataOutputStream.writeShort(length);
            for (int i = 0; i < length; i++) {
                v vVar = vVarArr[i];
                dataOutputStream.writeLong(vVar.a);
                dataOutputStream.writeLong(vVar.b);
                dataOutputStream.writeUTF(vVar.d);
                dataOutputStream.writeUTF(vVar.c);
                dataOutputStream.writeLong(vVar.e);
                dataOutputStream.writeLong(vVar.f.longValue());
                dataOutputStream.writeByte(vVar.g.length);
                dataOutputStream.write(vVar.g);
            }
        }
        dataOutputStream.writeShort(this.i.size());
        for (Map.Entry entry5 : this.i.entrySet()) {
            dataOutputStream.writeByte(((Byte) entry5.getKey()).byteValue());
            ((c) entry5.getValue()).a(dataOutputStream);
        }
        dataOutputStream.writeShort(this.j.size());
        for (Map.Entry entry6 : this.j.entrySet()) {
            dataOutputStream.writeShort(((Short) entry6.getKey()).shortValue());
            dataOutputStream.writeLong(((Long) entry6.getValue()).longValue());
        }
    }

    private String g() {
        return ".flurryappcircle." + Integer.toString(this.c.a.hashCode(), 16);
    }

    private void a(int i) {
        this.k = !this.g.isEmpty();
        if (this.k) {
            this.b.a(i);
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("{");
        sb.append("adImages (" + this.e.b().size() + "),\n");
        sb.append("adBlock (" + this.g.size() + "):").append(",\n");
        for (Map.Entry entry : this.g.entrySet()) {
            sb.append("\t" + ((String) entry.getKey()) + ": " + Arrays.toString((Object[]) entry.getValue()));
        }
        sb.append("adHooks (" + this.h.size() + "):" + this.h).append(",\n");
        sb.append("adThemes (" + this.i.size() + "):" + this.i).append(",\n");
        sb.append("auxMap (" + this.j.size() + "):" + this.j).append(",\n");
        sb.append("}");
        return sb.toString();
    }
}
