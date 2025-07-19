package com.google.tagmanager;

import com.google.analytics.containertag.proto.Serving;
import com.google.tagmanager.protobuf.ExtensionRegistryLite;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class ProtoExtensionRegistry {
    private static ExtensionRegistryLite registry;

    ProtoExtensionRegistry() {
    }

    public static synchronized ExtensionRegistryLite getRegistry() {
        ExtensionRegistryLite extensionRegistryLite;
        synchronized (ProtoExtensionRegistry.class) {
            if (registry == null) {
                registry = ExtensionRegistryLite.newInstance();
                Serving.registerAllExtensions(registry);
            }
            extensionRegistryLite = registry;
        }
        return extensionRegistryLite;
    }
}
