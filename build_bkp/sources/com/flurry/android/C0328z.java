package com.flurry.android;

import android.content.Context;
import java.io.Closeable;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* renamed from: com.flurry.android.z */
final class C0328z {

    /* renamed from: a */
    private Context f662a;

    /* renamed from: b */
    private C0323u f663b;

    /* renamed from: c */
    private C0291a f664c;

    /* renamed from: d */
    private volatile long f665d;

    /* renamed from: e */
    private C0297af f666e = new C0297af(50);

    /* renamed from: f */
    private C0297af f667f = new C0297af(50);

    /* renamed from: g */
    private Map f668g = new HashMap();

    /* renamed from: h */
    private Map f669h = new HashMap();

    /* renamed from: i */
    private Map f670i = new HashMap();

    /* renamed from: j */
    private Map f671j = new HashMap();

    /* renamed from: k */
    private volatile boolean f672k;

    C0328z() {
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2471a(Context context, C0323u uVar, C0291a aVar) {
        this.f662a = context;
        this.f663b = uVar;
        this.f664c = aVar;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized C0324v[] mo2473a(String str) {
        C0324v[] vVarArr;
        vVarArr = (C0324v[]) this.f668g.get(str);
        if (vVarArr == null) {
            vVarArr = (C0324v[]) this.f668g.get("");
        }
        return vVarArr;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized C0303al mo2469a(long j) {
        return (C0303al) this.f667f.mo2391a((Object) Long.valueOf(j));
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized Set mo2470a() {
        return this.f666e.mo2394c();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public final synchronized AdImage mo2474b(long j) {
        return (AdImage) this.f666e.mo2391a((Object) Long.valueOf(j));
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized AdImage mo2468a(short s) {
        Long l;
        l = (Long) this.f671j.get((short) 1);
        return l == null ? null : mo2474b(l.longValue());
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public final synchronized C0307e mo2475b(String str) {
        C0307e eVar;
        eVar = (C0307e) this.f669h.get(str);
        if (eVar == null) {
            eVar = (C0307e) this.f669h.get("");
        }
        return eVar;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public final boolean mo2476b() {
        return this.f672k;
    }

    /* renamed from: a */
    private synchronized C0305c m621a(byte b) {
        return (C0305c) this.f670i.get(Byte.valueOf(b));
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final synchronized void mo2472a(Map map, Map map2, Map map3, Map map4, Map map5, Map map6) {
        this.f665d = System.currentTimeMillis();
        for (Map.Entry entry : map4.entrySet()) {
            if (entry.getValue() != null) {
                this.f666e.mo2392a(entry.getKey(), entry.getValue());
            }
        }
        for (Map.Entry entry2 : map5.entrySet()) {
            if (entry2.getValue() != null) {
                this.f667f.mo2392a(entry2.getKey(), entry2.getValue());
            }
        }
        if (map2 != null && !map2.isEmpty()) {
            this.f669h = map2;
        }
        if (map3 != null && !map3.isEmpty()) {
            this.f670i = map3;
        }
        if (map6 != null && !map6.isEmpty()) {
            this.f671j = map6;
        }
        this.f668g = new HashMap();
        for (Map.Entry entry3 : map2.entrySet()) {
            C0307e eVar = (C0307e) entry3.getValue();
            C0324v[] vVarArr = (C0324v[]) map.get(Byte.valueOf(eVar.f585b));
            if (vVarArr != null) {
                this.f668g.put(entry3.getKey(), vVarArr);
            }
            C0305c cVar = (C0305c) map3.get(Byte.valueOf(eVar.f586c));
            if (cVar != null) {
                eVar.f587d = cVar;
            }
        }
        m626f();
        m622a((int) CallbackEvent.ADS_UPDATED);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: c */
    public final long mo2477c() {
        return this.f665d;
    }

    /* access modifiers changed from: package-private */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:28:0x004a=Splitter:B:28:0x004a, B:11:0x002d=Splitter:B:11:0x002d} */
    /* renamed from: d */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final synchronized void mo2478d() {
        /*
            r5 = this;
            monitor-enter(r5)
            android.content.Context r0 = r5.f662a     // Catch:{ all -> 0x0045 }
            java.lang.String r1 = r5.m627g()     // Catch:{ all -> 0x0045 }
            java.io.File r3 = r0.getFileStreamPath(r1)     // Catch:{ all -> 0x0045 }
            boolean r0 = r3.exists()     // Catch:{ all -> 0x0045 }
            if (r0 == 0) goto L_0x004e
            r2 = 0
            java.io.FileInputStream r0 = new java.io.FileInputStream     // Catch:{ Throwable -> 0x006d, all -> 0x0048 }
            r0.<init>(r3)     // Catch:{ Throwable -> 0x006d, all -> 0x0048 }
            java.io.DataInputStream r1 = new java.io.DataInputStream     // Catch:{ Throwable -> 0x006d, all -> 0x0048 }
            r1.<init>(r0)     // Catch:{ Throwable -> 0x006d, all -> 0x0048 }
            int r0 = r1.readUnsignedShort()     // Catch:{ Throwable -> 0x0036 }
            r2 = 46587(0xb5fb, float:6.5282E-41)
            if (r0 != r2) goto L_0x0032
            r5.m623a((java.io.DataInputStream) r1)     // Catch:{ Throwable -> 0x0036 }
            r0 = 201(0xc9, float:2.82E-43)
            r5.m622a((int) r0)     // Catch:{ Throwable -> 0x0036 }
        L_0x002d:
            com.flurry.android.C0320r.m561a((java.io.Closeable) r1)     // Catch:{ all -> 0x0045 }
        L_0x0030:
            monitor-exit(r5)
            return
        L_0x0032:
            m625a((java.io.File) r3)     // Catch:{ Throwable -> 0x0036 }
            goto L_0x002d
        L_0x0036:
            r0 = move-exception
        L_0x0037:
            java.lang.String r2 = "FlurryAgent"
            java.lang.String r4 = "Discarding cache"
            com.flurry.android.C0299ah.m533a(r2, r4, r0)     // Catch:{ all -> 0x006b }
            m625a((java.io.File) r3)     // Catch:{ all -> 0x006b }
            com.flurry.android.C0320r.m561a((java.io.Closeable) r1)     // Catch:{ all -> 0x0045 }
            goto L_0x0030
        L_0x0045:
            r0 = move-exception
            monitor-exit(r5)
            throw r0
        L_0x0048:
            r0 = move-exception
            r1 = r2
        L_0x004a:
            com.flurry.android.C0320r.m561a((java.io.Closeable) r1)     // Catch:{ all -> 0x0045 }
            throw r0     // Catch:{ all -> 0x0045 }
        L_0x004e:
            java.lang.String r0 = "FlurryAgent"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ all -> 0x0045 }
            r1.<init>()     // Catch:{ all -> 0x0045 }
            java.lang.String r2 = "cache file does not exist, path="
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x0045 }
            java.lang.String r2 = r3.getAbsolutePath()     // Catch:{ all -> 0x0045 }
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x0045 }
            java.lang.String r1 = r1.toString()     // Catch:{ all -> 0x0045 }
            com.flurry.android.C0299ah.m540c(r0, r1)     // Catch:{ all -> 0x0045 }
            goto L_0x0030
        L_0x006b:
            r0 = move-exception
            goto L_0x004a
        L_0x006d:
            r0 = move-exception
            r1 = r2
            goto L_0x0037
        */
        throw new UnsupportedOperationException("Method not decompiled: com.flurry.android.C0328z.mo2478d():void");
    }

    /* renamed from: a */
    private static void m625a(File file) {
        if (!file.delete()) {
            C0299ah.m537b("FlurryAgent", "Cannot delete cached ads");
        }
    }

    /* renamed from: f */
    private void m626f() {
        Iterator it = this.f670i.values().iterator();
        while (it.hasNext()) {
            it.next();
        }
        for (C0324v[] vVarArr : this.f668g.values()) {
            if (vVarArr != null) {
                for (C0324v vVar : vVarArr) {
                    vVar.f650h = mo2474b(vVar.f648f.longValue());
                    if (vVar.f650h == null) {
                        C0299ah.m537b("FlurryAgent", "Ad " + vVar.f646d + " has no image");
                    }
                    if (mo2469a(vVar.f643a) == null) {
                        C0299ah.m537b("FlurryAgent", "Ad " + vVar.f646d + " has no pricing");
                    }
                }
            }
        }
        for (C0307e eVar : this.f669h.values()) {
            eVar.f587d = m621a(eVar.f586c);
            if (eVar.f587d == null) {
                C0299ah.m542d("FlurryAgent", "No ad theme found for " + eVar.f586c);
            }
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: e */
    public final synchronized void mo2479e() {
        DataOutputStream dataOutputStream = null;
        synchronized (this) {
            try {
                File fileStreamPath = this.f662a.getFileStreamPath(m627g());
                File parentFile = fileStreamPath.getParentFile();
                if (parentFile.mkdirs() || parentFile.exists()) {
                    DataOutputStream dataOutputStream2 = new DataOutputStream(new FileOutputStream(fileStreamPath));
                    try {
                        dataOutputStream2.writeShort(46587);
                        m624a(dataOutputStream2);
                        C0320r.m561a((Closeable) dataOutputStream2);
                    } catch (Throwable th) {
                        th = th;
                        dataOutputStream = dataOutputStream2;
                        C0320r.m561a((Closeable) dataOutputStream);
                        throw th;
                    }
                } else {
                    C0299ah.m537b("FlurryAgent", "Unable to create persistent dir: " + parentFile);
                    C0320r.m561a((Closeable) null);
                }
            } catch (Throwable th2) {
                th = th2;
                C0299ah.m538b("FlurryAgent", "", th);
                C0320r.m561a((Closeable) dataOutputStream);
            }
        }
    }

    /* renamed from: a */
    private void m623a(DataInputStream dataInputStream) {
        C0299ah.m532a("FlurryAgent", "Reading cache");
        if (dataInputStream.readUnsignedShort() == 2) {
            this.f665d = dataInputStream.readLong();
            int readUnsignedShort = dataInputStream.readUnsignedShort();
            this.f666e = new C0297af(50);
            for (int i = 0; i < readUnsignedShort; i++) {
                long readLong = dataInputStream.readLong();
                AdImage adImage = new AdImage();
                adImage.mo2337a(dataInputStream);
                this.f666e.mo2392a(Long.valueOf(readLong), adImage);
            }
            int readUnsignedShort2 = dataInputStream.readUnsignedShort();
            this.f667f = new C0297af(50);
            for (int i2 = 0; i2 < readUnsignedShort2; i2++) {
                long readLong2 = dataInputStream.readLong();
                C0303al alVar = new C0303al();
                if (dataInputStream.readBoolean()) {
                    alVar.f516a = dataInputStream.readUTF();
                }
                if (dataInputStream.readBoolean()) {
                    alVar.f517b = dataInputStream.readUTF();
                }
                alVar.f518c = dataInputStream.readInt();
                this.f667f.mo2392a(Long.valueOf(readLong2), alVar);
            }
            int readUnsignedShort3 = dataInputStream.readUnsignedShort();
            this.f669h = new HashMap(readUnsignedShort3);
            for (int i3 = 0; i3 < readUnsignedShort3; i3++) {
                this.f669h.put(dataInputStream.readUTF(), new C0307e(dataInputStream));
            }
            int readUnsignedShort4 = dataInputStream.readUnsignedShort();
            this.f668g = new HashMap(readUnsignedShort4);
            for (int i4 = 0; i4 < readUnsignedShort4; i4++) {
                String readUTF = dataInputStream.readUTF();
                int readUnsignedShort5 = dataInputStream.readUnsignedShort();
                C0324v[] vVarArr = new C0324v[readUnsignedShort5];
                for (int i5 = 0; i5 < readUnsignedShort5; i5++) {
                    C0324v vVar = new C0324v();
                    vVar.mo2459a((DataInput) dataInputStream);
                    vVarArr[i5] = vVar;
                }
                this.f668g.put(readUTF, vVarArr);
            }
            int readUnsignedShort6 = dataInputStream.readUnsignedShort();
            this.f670i = new HashMap();
            for (int i6 = 0; i6 < readUnsignedShort6; i6++) {
                byte readByte = dataInputStream.readByte();
                C0305c cVar = new C0305c();
                cVar.mo2402b(dataInputStream);
                this.f670i.put(Byte.valueOf(readByte), cVar);
            }
            int readUnsignedShort7 = dataInputStream.readUnsignedShort();
            this.f671j = new HashMap(readUnsignedShort7);
            for (int i7 = 0; i7 < readUnsignedShort7; i7++) {
                this.f671j.put(Short.valueOf(dataInputStream.readShort()), Long.valueOf(dataInputStream.readLong()));
            }
            m626f();
            C0299ah.m532a("FlurryAgent", "Cache read, num images: " + this.f666e.mo2390a());
        }
    }

    /* renamed from: a */
    private void m624a(DataOutputStream dataOutputStream) {
        dataOutputStream.writeShort(2);
        dataOutputStream.writeLong(this.f665d);
        List<Map.Entry> b = this.f666e.mo2393b();
        dataOutputStream.writeShort(b.size());
        for (Map.Entry entry : b) {
            dataOutputStream.writeLong(((Long) entry.getKey()).longValue());
            AdImage adImage = (AdImage) entry.getValue();
            dataOutputStream.writeLong(adImage.f404a);
            dataOutputStream.writeInt(adImage.f405b);
            dataOutputStream.writeInt(adImage.f406c);
            dataOutputStream.writeUTF(adImage.f407d);
            dataOutputStream.writeInt(adImage.f408e.length);
            dataOutputStream.write(adImage.f408e);
        }
        List<Map.Entry> b2 = this.f667f.mo2393b();
        dataOutputStream.writeShort(b2.size());
        for (Map.Entry entry2 : b2) {
            dataOutputStream.writeLong(((Long) entry2.getKey()).longValue());
            C0303al alVar = (C0303al) entry2.getValue();
            boolean z = alVar.f516a != null;
            dataOutputStream.writeBoolean(z);
            if (z) {
                dataOutputStream.writeUTF(alVar.f516a);
            }
            boolean z2 = alVar.f517b != null;
            dataOutputStream.writeBoolean(z2);
            if (z2) {
                dataOutputStream.writeUTF(alVar.f517b);
            }
            dataOutputStream.writeInt(alVar.f518c);
        }
        dataOutputStream.writeShort(this.f669h.size());
        for (Map.Entry entry3 : this.f669h.entrySet()) {
            dataOutputStream.writeUTF((String) entry3.getKey());
            C0307e eVar = (C0307e) entry3.getValue();
            dataOutputStream.writeUTF(eVar.f584a);
            dataOutputStream.writeByte(eVar.f585b);
            dataOutputStream.writeByte(eVar.f586c);
        }
        dataOutputStream.writeShort(this.f668g.size());
        for (Map.Entry entry4 : this.f668g.entrySet()) {
            dataOutputStream.writeUTF((String) entry4.getKey());
            C0324v[] vVarArr = (C0324v[]) entry4.getValue();
            int length = vVarArr == null ? 0 : vVarArr.length;
            dataOutputStream.writeShort(length);
            for (int i = 0; i < length; i++) {
                C0324v vVar = vVarArr[i];
                dataOutputStream.writeLong(vVar.f643a);
                dataOutputStream.writeLong(vVar.f644b);
                dataOutputStream.writeUTF(vVar.f646d);
                dataOutputStream.writeUTF(vVar.f645c);
                dataOutputStream.writeLong(vVar.f647e);
                dataOutputStream.writeLong(vVar.f648f.longValue());
                dataOutputStream.writeByte(vVar.f649g.length);
                dataOutputStream.write(vVar.f649g);
            }
        }
        dataOutputStream.writeShort(this.f670i.size());
        for (Map.Entry entry5 : this.f670i.entrySet()) {
            dataOutputStream.writeByte(((Byte) entry5.getKey()).byteValue());
            ((C0305c) entry5.getValue()).mo2401a((DataOutput) dataOutputStream);
        }
        dataOutputStream.writeShort(this.f671j.size());
        for (Map.Entry entry6 : this.f671j.entrySet()) {
            dataOutputStream.writeShort(((Short) entry6.getKey()).shortValue());
            dataOutputStream.writeLong(((Long) entry6.getValue()).longValue());
        }
    }

    /* renamed from: g */
    private String m627g() {
        return ".flurryappcircle." + Integer.toString(this.f664c.f483a.hashCode(), 16);
    }

    /* renamed from: a */
    private void m622a(int i) {
        this.f672k = !this.f668g.isEmpty();
        if (this.f672k) {
            this.f663b.mo2430a(i);
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("{");
        sb.append("adImages (" + this.f666e.mo2393b().size() + "),\n");
        sb.append("adBlock (" + this.f668g.size() + "):").append(",\n");
        for (Map.Entry entry : this.f668g.entrySet()) {
            sb.append("\t" + ((String) entry.getKey()) + ": " + Arrays.toString((Object[]) entry.getValue()));
        }
        sb.append("adHooks (" + this.f669h.size() + "):" + this.f669h).append(",\n");
        sb.append("adThemes (" + this.f670i.size() + "):" + this.f670i).append(",\n");
        sb.append("auxMap (" + this.f671j.size() + "):" + this.f671j).append(",\n");
        sb.append("}");
        return sb.toString();
    }
}
