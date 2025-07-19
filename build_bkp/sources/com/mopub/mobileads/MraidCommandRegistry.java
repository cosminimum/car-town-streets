package com.mopub.mobileads;

import java.util.HashMap;
import java.util.Map;

class MraidCommandRegistry {
    private static Map<String, MraidCommandFactory> commandMap = new HashMap();

    private interface MraidCommandFactory {
        MraidCommand create(Map<String, String> map, MraidView mraidView);
    }

    MraidCommandRegistry() {
    }

    static {
        commandMap.put("close", new MraidCommandFactory() {
            public MraidCommand create(Map<String, String> params, MraidView view) {
                return new MraidCommandClose(params, view);
            }
        });
        commandMap.put("expand", new MraidCommandFactory() {
            public MraidCommand create(Map<String, String> params, MraidView view) {
                return new MraidCommandExpand(params, view);
            }
        });
        commandMap.put("usecustomclose", new MraidCommandFactory() {
            public MraidCommand create(Map<String, String> params, MraidView view) {
                return new MraidCommandUseCustomClose(params, view);
            }
        });
        commandMap.put("open", new MraidCommandFactory() {
            public MraidCommand create(Map<String, String> params, MraidView view) {
                return new MraidCommandOpen(params, view);
            }
        });
    }

    static MraidCommand createCommand(String string, Map<String, String> params, MraidView view) {
        MraidCommandFactory factory = commandMap.get(string);
        if (factory != null) {
            return factory.create(params, view);
        }
        return null;
    }
}
