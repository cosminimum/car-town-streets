package com.flurry.android;

import com.getjar.sdk.utilities.Utility;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class t implements Runnable {
    private /* synthetic */ Map a;
    private /* synthetic */ InstallReceiver b;

    /* JADX INFO: Access modifiers changed from: package-private */
    public t(InstallReceiver installReceiver, Map map) {
        this.b = installReceiver;
        this.a = map;
    }

    @Override // java.lang.Runnable
    public final void run() {
        File file;
        File file2;
        DataOutputStream dataOutputStream = null;
        dataOutputStream = null;
        Map.Entry entry = null;
        try {
            file = this.b.b;
            File parentFile = file.getParentFile();
            if (parentFile.mkdirs() || parentFile.exists()) {
                file2 = this.b.b;
                DataOutputStream dataOutputStream2 = new DataOutputStream(new FileOutputStream(file2));
                try {
                    boolean z = true;
                    for (Map.Entry entry2 : this.a.entrySet()) {
                        if (z) {
                            z = false;
                        } else {
                            dataOutputStream2.writeUTF(Utility.QUERY_APPENDIX);
                        }
                        dataOutputStream2.writeUTF((String) entry2.getKey());
                        dataOutputStream2.writeUTF("=");
                        dataOutputStream2.writeUTF((String) entry2.getValue());
                        entry = entry2;
                        z = z;
                    }
                    dataOutputStream2.writeShort(0);
                    r.a(dataOutputStream2);
                    dataOutputStream = entry;
                } catch (Throwable th) {
                    th = th;
                    dataOutputStream = dataOutputStream2;
                    try {
                        ah.b("InstallReceiver", "", th);
                    } finally {
                        r.a(dataOutputStream);
                    }
                }
            } else {
                ah.b("InstallReceiver", "Unable to create persistent dir: " + parentFile);
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }
}
