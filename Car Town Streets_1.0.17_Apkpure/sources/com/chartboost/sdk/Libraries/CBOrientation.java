package com.chartboost.sdk.Libraries;
/* loaded from: classes.dex */
public enum CBOrientation {
    UNSPECIFIED,
    PORTRAIT,
    LANDSCAPE,
    PORTRAIT_REVERSE,
    LANDSCAPE_REVERSE;
    
    private static /* synthetic */ int[] a;
    public static final CBOrientation PORTRAIT_LEFT = PORTRAIT_REVERSE;
    public static final CBOrientation PORTRAIT_RIGHT = PORTRAIT;
    public static final CBOrientation LANDSCAPE_LEFT = LANDSCAPE;
    public static final CBOrientation LANDSCAPE_RIGHT = LANDSCAPE_REVERSE;

    /* renamed from: values  reason: to resolve conflict with enum method */
    public static CBOrientation[] valuesCustom() {
        CBOrientation[] valuesCustom = values();
        int length = valuesCustom.length;
        CBOrientation[] cBOrientationArr = new CBOrientation[length];
        System.arraycopy(valuesCustom, 0, cBOrientationArr, 0, length);
        return cBOrientationArr;
    }

    static /* synthetic */ int[] a() {
        int[] iArr = a;
        if (iArr == null) {
            iArr = new int[valuesCustom().length];
            try {
                iArr[LANDSCAPE.ordinal()] = 3;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[LANDSCAPE_REVERSE.ordinal()] = 5;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[PORTRAIT.ordinal()] = 2;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[PORTRAIT_REVERSE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                iArr[UNSPECIFIED.ordinal()] = 1;
            } catch (NoSuchFieldError e5) {
            }
            a = iArr;
        }
        return iArr;
    }

    public CBOrientation rotate90() {
        switch (a()[ordinal()]) {
            case 2:
                return LANDSCAPE_LEFT;
            case 3:
                return PORTRAIT_LEFT;
            case 4:
                return LANDSCAPE_RIGHT;
            case 5:
                return PORTRAIT_RIGHT;
            default:
                return UNSPECIFIED;
        }
    }

    public CBOrientation rotate180() {
        return rotate90().rotate90();
    }

    public CBOrientation rotate270() {
        return rotate90().rotate90().rotate90();
    }

    public boolean isPortrait() {
        return this == PORTRAIT || this == PORTRAIT_REVERSE;
    }

    public boolean isLandscape() {
        return this == LANDSCAPE || this == LANDSCAPE_REVERSE;
    }

    /* loaded from: classes.dex */
    public enum Difference {
        ANGLE_0,
        ANGLE_90,
        ANGLE_180,
        ANGLE_270;
        
        private static /* synthetic */ int[] a;

        /* renamed from: values  reason: to resolve conflict with enum method */
        public static Difference[] valuesCustom() {
            Difference[] valuesCustom = values();
            int length = valuesCustom.length;
            Difference[] differenceArr = new Difference[length];
            System.arraycopy(valuesCustom, 0, differenceArr, 0, length);
            return differenceArr;
        }

        static /* synthetic */ int[] a() {
            int[] iArr = a;
            if (iArr == null) {
                iArr = new int[valuesCustom().length];
                try {
                    iArr[ANGLE_0.ordinal()] = 1;
                } catch (NoSuchFieldError e) {
                }
                try {
                    iArr[ANGLE_180.ordinal()] = 3;
                } catch (NoSuchFieldError e2) {
                }
                try {
                    iArr[ANGLE_270.ordinal()] = 4;
                } catch (NoSuchFieldError e3) {
                }
                try {
                    iArr[ANGLE_90.ordinal()] = 2;
                } catch (NoSuchFieldError e4) {
                }
                a = iArr;
            }
            return iArr;
        }

        public int getAsInt() {
            switch (a()[ordinal()]) {
                case 2:
                    return 90;
                case 3:
                    return 180;
                case 4:
                    return 270;
                default:
                    return 0;
            }
        }

        public boolean isOdd() {
            return this == ANGLE_90 || this == ANGLE_270;
        }

        public boolean isReverse() {
            return this == ANGLE_180 || this == ANGLE_270;
        }
    }
}
