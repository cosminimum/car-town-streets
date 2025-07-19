package com.flurry.android;

import com.getjar.sdk.utilities.Utility;
import java.io.Closeable;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

final class t implements Runnable {
    private /* synthetic */ Map a;
    private /* synthetic */ InstallReceiver b;

    t(InstallReceiver installReceiver, Map map) {
        this.b = installReceiver;
        this.a = map;
    }

    public final void run() {
        DataOutputStream dataOutputStream = null;
        try {
            File parentFile = this.b.b.getParentFile();
            if (parentFile.mkdirs() || parentFile.exists()) {
                DataOutputStream dataOutputStream2 = new DataOutputStream(new FileOutputStream(this.b.b));
                try {
                    boolean z = true;
                    for (Map.Entry entry : this.a.entrySet()) {
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
                    r.a((Closeable) dataOutputStream2);
                } catch (Throwable th) {
                    th = th;
                    dataOutputStream = dataOutputStream2;
                    r.a((Closeable) dataOutputStream);
                    throw th;
                }
            } else {
                ah.b("InstallReceiver", "Unable to create persistent dir: " + parentFile);
                r.a((Closeable) null);
            }
        } catch (Throwable th2) {
            th = th2;
            try {
                ah.b("InstallReceiver", "", th);
                r.a((Closeable) dataOutputStream);
            } catch (Throwable th3) {
                th = th3;
                r.a((Closeable) dataOutputStream);
                throw th;
            }
        }
    }
}
