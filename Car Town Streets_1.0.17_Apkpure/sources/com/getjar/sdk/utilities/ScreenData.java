package com.getjar.sdk.utilities;
/* loaded from: classes.dex */
public class ScreenData {
    private final Integer availableResX;
    private final Integer availableResY;
    private final int resolutionX;
    private final int resolutionY;
    private final double screenSizeX;
    private final double screenSizeY;
    private final double xDpi;
    private final double yDpi;

    /* JADX INFO: Access modifiers changed from: protected */
    public ScreenData(double xDpi, double yDpi, int resolutionX, int resolutionY, double screenSizeX, double screenSizeY, Integer availableResX, Integer availableResY) {
        if (xDpi <= 0.0d) {
            throw new IllegalArgumentException("Invalid value provided for 'xDpi'");
        }
        if (yDpi <= 0.0d) {
            throw new IllegalArgumentException("Invalid value provided for 'yDpi'");
        }
        if (resolutionX <= 0) {
            throw new IllegalArgumentException("Invalid value provided for 'resolutionX'");
        }
        if (resolutionY <= 0) {
            throw new IllegalArgumentException("Invalid value provided for 'resolutionY'");
        }
        if (screenSizeX <= 0.0d) {
            throw new IllegalArgumentException("Invalid value provided for 'screenSizeX'");
        }
        if (screenSizeY <= 0.0d) {
            throw new IllegalArgumentException("Invalid value provided for 'screenSizeY'");
        }
        if (availableResX != null && availableResX.intValue() <= 0) {
            throw new IllegalArgumentException("Invalid value provided for 'availableResX'");
        }
        if (availableResY != null && availableResY.intValue() <= 0) {
            throw new IllegalArgumentException("Invalid value provided for 'availableResY'");
        }
        this.xDpi = xDpi;
        this.yDpi = yDpi;
        this.resolutionX = resolutionX;
        this.resolutionY = resolutionY;
        this.screenSizeX = screenSizeX;
        this.screenSizeY = screenSizeY;
        this.availableResX = availableResX;
        this.availableResY = availableResY;
    }

    protected ScreenData(double xDpi, double yDpi, int resolutionX, int resolutionY, double screenSizeX, double screenSizeY) {
        this(xDpi, yDpi, resolutionX, resolutionY, screenSizeX, screenSizeY, null, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getResolutionX() {
        return this.resolutionX;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getResolutionY() {
        return this.resolutionY;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public double getXDpi() {
        return this.xDpi;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public double getYDpi() {
        return this.yDpi;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public double getScreenWidth() {
        return this.screenSizeX;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public double getScreenHeight() {
        return this.screenSizeY;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Integer getAvailableResX() {
        return this.availableResX;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Integer getAvailableResY() {
        return this.availableResY;
    }
}
