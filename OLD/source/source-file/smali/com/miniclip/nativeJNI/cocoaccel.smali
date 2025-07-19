.class public Lcom/miniclip/nativeJNI/cocoaccel;
.super Ljava/lang/Object;
.source "cocoaccel.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# instance fields
.field private mAccelerometer:Landroid/hardware/Sensor;

.field private mContext:Landroid/content/Context;

.field private mRotation:I

.field private mSensorManager:Landroid/hardware/SensorManager;

.field t:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x1

    const/4 v2, 0x0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput v2, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mRotation:I

    .line 43
    iput v2, p0, Lcom/miniclip/nativeJNI/cocoaccel;->t:I

    .line 20
    iput-object p1, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mContext:Landroid/content/Context;

    .line 23
    iput v4, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mRotation:I

    .line 24
    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mContext:Landroid/content/Context;

    const-string v3, "sensor"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/SensorManager;

    iput-object v2, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mSensorManager:Landroid/hardware/SensorManager;

    .line 25
    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v2, v4}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v2

    iput-object v2, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mAccelerometer:Landroid/hardware/Sensor;

    .line 26
    iget-object v2, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mContext:Landroid/content/Context;

    const-string v3, "window"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    .line 28
    .local v1, "windowManager":Landroid/view/WindowManager;
    :try_start_0
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Display;->getRotation()I

    move-result v2

    iput v2, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mRotation:I
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    :goto_0
    return-void

    .line 30
    :catch_0
    move-exception v0

    .line 31
    .local v0, "e":Ljava/lang/NoSuchMethodError;
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodError;->printStackTrace()V

    goto :goto_0
.end method

.method private static native onSensorChanged(FFFJ)V
.end method


# virtual methods
.method public disable()V
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 41
    return-void
.end method

.method public enable()V
    .locals 3

    .prologue
    .line 36
    iget-object v0, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mAccelerometer:Landroid/hardware/Sensor;

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 37
    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 69
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 5
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 46
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    if-eq v0, v2, :cond_1

    .line 66
    :cond_0
    :goto_0
    return-void

    .line 58
    :cond_1
    iget v0, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mRotation:I

    if-nez v0, :cond_2

    .line 59
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v4

    neg-float v0, v0

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v1, v2

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v3

    iget-wide v3, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-static {v0, v1, v2, v3, v4}, Lcom/miniclip/nativeJNI/CocoJNI;->Maccel(FFFJ)V

    goto :goto_0

    .line 60
    :cond_2
    iget v0, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mRotation:I

    if-ne v0, v3, :cond_3

    .line 61
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v4

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v1, v2

    neg-float v1, v1

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v3

    iget-wide v3, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-static {v0, v1, v2, v3, v4}, Lcom/miniclip/nativeJNI/CocoJNI;->Maccel(FFFJ)V

    goto :goto_0

    .line 62
    :cond_3
    iget v0, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mRotation:I

    if-ne v0, v2, :cond_4

    .line 63
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v2

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v1, v4

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v3

    iget-wide v3, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-static {v0, v1, v2, v3, v4}, Lcom/miniclip/nativeJNI/CocoJNI;->Maccel(FFFJ)V

    goto :goto_0

    .line 64
    :cond_4
    iget v0, p0, Lcom/miniclip/nativeJNI/cocoaccel;->mRotation:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 65
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v2

    neg-float v0, v0

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v1, v4

    neg-float v1, v1

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v3

    iget-wide v3, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-static {v0, v1, v2, v3, v4}, Lcom/miniclip/nativeJNI/CocoJNI;->Maccel(FFFJ)V

    goto :goto_0
.end method
