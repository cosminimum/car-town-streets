package com.flurry.android;

import com.getjar.sdk.utilities.Utility;
import java.io.Closeable;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

/* renamed from: com.flurry.android.t */
final class C0322t implements Runnable {

    /* renamed from: a */
    private /* synthetic */ Map f615a;

    /* renamed from: b */
    private /* synthetic */ InstallReceiver f616b;

    C0322t(InstallReceiver installReceiver, Map map) {
        this.f616b = installReceiver;
        this.f615a = map;
    }

    public final void run() {
        DataOutputStream dataOutputStream = null;
        try {
            File parentFile = this.f616b.f471b.getParentFile();
            if (parentFile.mkdirs() || parentFile.exists()) {
                DataOutputStream dataOutputStream2 = new DataOutputStream(new FileOutputStream(this.f616b.f471b));
                try {
                    boolean z = true;
                    for (Map.Entry entry : this.f615a.entrySet()) {
                        if (z) {
                            z = false;
                        } else {
                            dataOutputStream2.writeUTF(Utility.QUERY_APPENDIX);
                        }
                        dataOutputStream2.writeUTF((String) entry.getKey());
                        dataOutputStream2.writeUTF("=");
                        dataOutputStream2.writeUTF((String) entry.getValue());
                    }
                    dataOutputStream2.writeShort(0);
                    C0320r.m561a((Closeable) dataOutputStream2);
                } catch (Throwable th) {
                    th = th;
                    dataOutputStream = dataOutputStream2;
                    C0320r.m561a((Closeable) dataOutputStream);
                    throw th;
                }
            } else {
                C0299ah.m537b("InstallReceiver", "Unable to create persistent dir: " + parentFile);
                C0320r.m561a((Closeable) null);
            }
        } catch (Throwable th2) {
            th = th2;
            try {
                C0299ah.m538b("InstallReceiver", "", th);
                C0320r.m561a((Closeable) dataOutputStream);
            } catch (Throwable th3) {
                th = th3;
                C0320r.m561a((Closeable) dataOutputStream);
                throw th;
            }
        }
    }
}
