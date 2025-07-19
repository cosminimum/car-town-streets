package com.mopub.mobileads;

import java.util.HashMap;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class MraidCommandRegistry {
    private static Map<String, MraidCommandFactory> commandMap = new HashMap();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public interface MraidCommandFactory {
        MraidCommand create(Map<String, String> map, MraidView mraidView);
    }

    MraidCommandRegistry() {
    }

    static {
        commandMap.put("close", new MraidCommandFactory() { // from class: com.mopub.mobileads.MraidCommandRegistry.1
            @Override // com.mopub.mobileads.MraidCommandRegistry.MraidCommandFactory
            public MraidCommand create(Map<String, String> params, MraidView view) {
                return new MraidCommandClose(params, view);
            }
        });
        commandMap.put("expand", new MraidCommandFactory() { // from class: com.mopub.mobileads.MraidCommandRegistry.2
            @Override // com.mopub.mobileads.MraidCommandRegistry.MraidCommandFactory
            public MraidCommand create(Map<String, String> params, MraidView view) {
                return new MraidCommandExpand(params, view);
            }
        });
        commandMap.put("usecustomclose", new MraidCommandFactory() { // from class: com.mopub.mobileads.MraidCommandRegistry.3
            @Override // com.mopub.mobileads.MraidCommandRegistry.MraidCommandFactory
            public MraidCommand create(Map<String, String> params, MraidView view) {
                return new MraidCommandUseCustomClose(params, view);
            }
        });
        commandMap.put("open", new MraidCommandFactory() { // from class: com.mopub.mobileads.MraidCommandRegistry.4
            @Override // com.mopub.mobileads.MraidCommandRegistry.MraidCommandFactory
            public MraidCommand create(Map<String, String> params, MraidView view) {
                return new MraidCommandOpen(params, view);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static MraidCommand createCommand(String string, Map<String, String> params, MraidView view) {
        MraidCommandFactory factory = commandMap.get(string);
        if (factory != null) {
            return factory.create(params, view);
        }
        return null;
    }
}
