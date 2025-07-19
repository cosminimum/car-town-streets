package com.getjar.sdk.utilities;

public class ScreenData {
    private final Integer availableResX;
    private final Integer availableResY;
    private final int resolutionX;
    private final int resolutionY;
    private final double screenSizeX;
    private final double screenSizeY;
    private final double xDpi;
    private final double yDpi;

    protected ScreenData(double xDpi2, double yDpi2, int resolutionX2, int resolutionY2, double screenSizeX2, double screenSizeY2, Integer availableResX2, Integer availableResY2) {
        if (xDpi2 <= 0.0d) {
            throw new IllegalArgumentException("Invalid value provided for 'xDpi'");
        } else if (yDpi2 <= 0.0d) {
            throw new IllegalArgumentException("Invalid value provided for 'yDpi'");
        } else if (resolutionX2 <= 0) {
            throw new IllegalArgumentException("Invalid value provided for 'resolutionX'");
        } else if (resolutionY2 <= 0) {
            throw new IllegalArgumentException("Invalid value provided for 'resolutionY'");
        } else if (screenSizeX2 <= 0.0d) {
            throw new IllegalArgumentException("Invalid value provided for 'screenSizeX'");
        } else if (screenSizeY2 <= 0.0d) {
            throw new IllegalArgumentException("Invalid value provided for 'screenSizeY'");
        } else if (availableResX2 != null && availableResX2.intValue() <= 0) {
            throw new IllegalArgumentException("Invalid value provided for 'availableResX'");
        } else if (availableResY2 == null || availableResY2.intValue() > 0) {
            this.xDpi = xDpi2;
            this.yDpi = yDpi2;
            this.resolutionX = resolutionX2;
            this.resolutionY = resolutionY2;
            this.screenSizeX = screenSizeX2;
            this.screenSizeY = screenSizeY2;
            this.availableResX = availableResX2;
            this.availableResY = availableResY2;
        } else {
            throw new IllegalArgumentException("Invalid value provided for 'availableResY'");
        }
    }

    protected ScreenData(double xDpi2, double yDpi2, int resolutionX2, int resolutionY2, double screenSizeX2, double screenSizeY2) {
        this(xDpi2, yDpi2, resolutionX2, resolutionY2, screenSizeX2, screenSizeY2, (Integer) null, (Integer) null);
    }

    /* access modifiers changed from: protected */
    public int getResolutionX() {
        return this.resolutionX;
    }

    /* access modifiers changed from: protected */
    public int getResolutionY() {
        return this.resolutionY;
    }

    /* access modifiers changed from: protected */
    public double getXDpi() {
        return this.xDpi;
    }

    /* access modifiers changed from: protected */
    public double getYDpi() {
        return this.yDpi;
    }

    /* access modifiers changed from: protected */
    public double getScreenWidth() {
        return this.screenSizeX;
    }

    /* access modifiers changed from: protected */
    public double getScreenHeight() {
        return this.screenSizeY;
    }

    /* access modifiers changed from: protected */
    public Integer getAvailableResX() {
        return this.availableResX;
    }

    /* access modifiers changed from: protected */
    public Integer getAvailableResY() {
        return this.availableResY;
    }
}
