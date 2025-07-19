.class Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;
.super Ljava/lang/Thread;
.source "GLSurfaceViewProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GLThread"
.end annotation


# instance fields
.field private mEglHelper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;

.field private mEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mExited:Z

.field private mHasSurface:Z

.field private mHaveEglContext:Z

.field private mHaveEglSurface:Z

.field private mHeight:I

.field private mPaused:Z

.field private mRenderComplete:Z

.field private mRenderMode:I

.field private mRenderer:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;

.field private mRequestPaused:Z

.field private mRequestRender:Z

.field private mShouldExit:Z

.field private mShouldReleaseEglContext:Z

.field private mWaitingForSurface:Z

.field private mWidth:I

.field final synthetic this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;)V
    .locals 3
    .param p2, "renderer"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1129
    iput-object p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    .line 1130
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1599
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 1131
    iput v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mWidth:I

    .line 1132
    iput v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHeight:I

    .line 1133
    iput-boolean v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRequestRender:Z

    .line 1134
    iput v2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderMode:I

    .line 1135
    iput-object p2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderer:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;

    .line 1136
    return-void
.end method

.method static synthetic access$1102(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;
    .param p1, "x1"    # Z

    .prologue
    .line 1128
    iput-boolean p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mExited:Z

    return p1
.end method

.method private guardedRun()V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v15, 0x0

    .line 1177
    new-instance v13, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-direct {v13, v14}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;-><init>(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEglHelper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;

    .line 1178
    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglContext:Z

    .line 1179
    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglSurface:Z

    .line 1181
    const/4 v6, 0x0

    .line 1182
    .local v6, "gl":Ljavax/microedition/khronos/opengles/GL10;
    const/4 v2, 0x0

    .line 1183
    .local v2, "createEglContext":Z
    const/4 v3, 0x0

    .line 1184
    .local v3, "createEglSurface":Z
    const/4 v8, 0x0

    .line 1185
    .local v8, "lostEglContext":Z
    const/4 v9, 0x0

    .line 1186
    .local v9, "sizeChanged":Z
    const/4 v12, 0x0

    .line 1187
    .local v12, "wantRenderNotification":Z
    const/4 v4, 0x0

    .line 1188
    .local v4, "doRenderNotification":Z
    const/4 v1, 0x0

    .line 1189
    .local v1, "askedToReleaseEglContext":Z
    const/4 v11, 0x0

    .line 1190
    .local v11, "w":I
    const/4 v7, 0x0

    .line 1191
    .local v7, "h":I
    const/4 v5, 0x0

    .line 1194
    .local v5, "event":Ljava/lang/Runnable;
    :cond_0
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v14

    monitor-enter v14
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 1196
    :goto_1
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mShouldExit:Z

    if-eqz v13, :cond_1

    .line 1197
    monitor-exit v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1408
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v14

    monitor-enter v14

    .line 1409
    :try_start_2
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglSurfaceLocked()V

    .line 1410
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglContextLocked()V

    .line 1411
    monitor-exit v14

    .line 1413
    :goto_2
    return-void

    .line 1411
    :catchall_0
    move-exception v13

    monitor-exit v14
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v13

    .line 1200
    :cond_1
    :try_start_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_2

    .line 1201
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEventQueue:Ljava/util/ArrayList;

    const/4 v15, 0x0

    invoke-virtual {v13, v15}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v13

    move-object v0, v13

    check-cast v0, Ljava/lang/Runnable;

    move-object v5, v0

    .line 1351
    :goto_3
    monitor-exit v14
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1353
    if-eqz v5, :cond_12

    .line 1354
    :try_start_4
    invoke-interface {v5}, Ljava/lang/Runnable;->run()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1355
    const/4 v5, 0x0

    .line 1356
    goto :goto_0

    .line 1206
    :cond_2
    :try_start_5
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mPaused:Z

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRequestPaused:Z

    if-eq v13, v15, :cond_3

    .line 1207
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRequestPaused:Z

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mPaused:Z

    .line 1208
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->notifyAll()V

    .line 1215
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mShouldReleaseEglContext:Z

    if-eqz v13, :cond_4

    .line 1219
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglSurfaceLocked()V

    .line 1220
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglContextLocked()V

    .line 1221
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mShouldReleaseEglContext:Z

    .line 1222
    const/4 v1, 0x1

    .line 1226
    :cond_4
    if-eqz v8, :cond_5

    .line 1227
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglSurfaceLocked()V

    .line 1228
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglContextLocked()V

    .line 1229
    const/4 v8, 0x0

    .line 1233
    :cond_5
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglSurface:Z

    if-eqz v13, :cond_8

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mPaused:Z

    if-eqz v13, :cond_8

    .line 1237
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglSurfaceLocked()V

    .line 1238
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v13}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$800(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    invoke-virtual {v13}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->shouldReleaseEGLContextWhenPausing()Z

    move-result v13

    if-eqz v13, :cond_7

    .line 1239
    :cond_6
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglContextLocked()V

    .line 1244
    :cond_7
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    invoke-virtual {v13}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->shouldTerminateEGLWhenPausing()Z

    move-result v13

    if-eqz v13, :cond_8

    .line 1245
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEglHelper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;

    invoke-virtual {v13}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->finish()V

    .line 1253
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHasSurface:Z

    if-nez v13, :cond_a

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mWaitingForSurface:Z

    if-nez v13, :cond_a

    .line 1257
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglSurface:Z

    if-eqz v13, :cond_9

    .line 1258
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglSurfaceLocked()V

    .line 1260
    :cond_9
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mWaitingForSurface:Z

    .line 1261
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->notifyAll()V

    .line 1265
    :cond_a
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHasSurface:Z

    if-eqz v13, :cond_b

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mWaitingForSurface:Z

    if-eqz v13, :cond_b

    .line 1269
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mWaitingForSurface:Z

    .line 1270
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->notifyAll()V

    .line 1273
    :cond_b
    if-eqz v4, :cond_c

    .line 1277
    const/4 v12, 0x0

    .line 1278
    const/4 v4, 0x0

    .line 1279
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderComplete:Z

    .line 1280
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->notifyAll()V

    .line 1284
    :cond_c
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->readyToDraw()Z

    move-result v13

    if-eqz v13, :cond_11

    .line 1287
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglContext:Z

    if-nez v13, :cond_d

    .line 1288
    if-eqz v1, :cond_f

    .line 1289
    const/4 v1, 0x0

    .line 1304
    :cond_d
    :goto_4
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglContext:Z

    if-eqz v13, :cond_e

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglSurface:Z

    if-nez v13, :cond_e

    .line 1305
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglSurface:Z

    .line 1306
    const/4 v3, 0x1

    .line 1307
    const/4 v9, 0x1

    .line 1310
    :cond_e
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglSurface:Z

    if-eqz v13, :cond_11

    .line 1311
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v13}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$900(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Z

    move-result v13

    if-eqz v13, :cond_10

    .line 1312
    const/4 v9, 0x1

    .line 1313
    move-object/from16 v0, p0

    iget v11, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mWidth:I

    .line 1314
    move-object/from16 v0, p0

    iget v7, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHeight:I

    .line 1315
    const/4 v12, 0x1

    .line 1327
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    const/4 v15, 0x0

    invoke-static {v13, v15}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$902(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;Z)Z

    .line 1331
    :goto_5
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->notifyAll()V

    goto/16 :goto_3

    .line 1351
    :catchall_1
    move-exception v13

    monitor-exit v14
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    throw v13
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 1408
    :catchall_2
    move-exception v13

    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v14

    monitor-enter v14

    .line 1409
    :try_start_7
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglSurfaceLocked()V

    .line 1410
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglContextLocked()V

    .line 1411
    monitor-exit v14
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    throw v13

    .line 1290
    :cond_f
    :try_start_8
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->tryAcquireEglContextLocked(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;)Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    move-result v13

    if-eqz v13, :cond_d

    .line 1292
    :try_start_9
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEglHelper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;

    invoke-virtual {v13}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->start()V
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 1297
    const/4 v13, 0x1

    :try_start_a
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglContext:Z

    .line 1298
    const/4 v2, 0x1

    .line 1300
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->notifyAll()V

    goto :goto_4

    .line 1293
    :catch_0
    move-exception v10

    .line 1294
    .local v10, "t":Ljava/lang/RuntimeException;
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->releaseEglContextLocked(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;)V

    .line 1295
    throw v10

    .line 1329
    .end local v10    # "t":Ljava/lang/RuntimeException;
    :cond_10
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRequestRender:Z

    goto :goto_5

    .line 1349
    :cond_11
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->wait()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    goto/16 :goto_1

    .line 1359
    :cond_12
    if-eqz v3, :cond_14

    .line 1363
    :try_start_b
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEglHelper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-virtual {v14}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->createSurface(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v13

    move-object v0, v13

    check-cast v0, Ljavax/microedition/khronos/opengles/GL10;

    move-object v6, v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 1364
    if-nez v6, :cond_13

    .line 1408
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v14

    monitor-enter v14

    .line 1409
    :try_start_c
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglSurfaceLocked()V

    .line 1410
    invoke-direct/range {p0 .. p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->stopEglContextLocked()V

    .line 1411
    monitor-exit v14

    goto/16 :goto_2

    :catchall_3
    move-exception v13

    monitor-exit v14
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    throw v13

    .line 1368
    :cond_13
    :try_start_d
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v13

    invoke-virtual {v13, v6}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1369
    const/4 v3, 0x0

    .line 1372
    :cond_14
    if-eqz v2, :cond_15

    .line 1376
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderer:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEglHelper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;

    iget-object v14, v14, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v13, v6, v14}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 1377
    const/4 v2, 0x0

    .line 1380
    :cond_15
    if-eqz v9, :cond_16

    .line 1384
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderer:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;

    invoke-interface {v13, v6, v11, v7}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 1385
    const/4 v9, 0x0

    .line 1391
    :cond_16
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderer:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;

    invoke-interface {v13, v6}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1392
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEglHelper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;

    invoke-virtual {v13}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->swap()Z
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    move-result v13

    if-nez v13, :cond_17

    .line 1396
    const/4 v8, 0x1

    .line 1399
    :cond_17
    if-eqz v12, :cond_0

    .line 1400
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 1411
    :catchall_4
    move-exception v13

    :try_start_e
    monitor-exit v14
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    throw v13
.end method

.method private readyToDraw()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 1420
    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mPaused:Z

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHasSurface:Z

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mWidth:I

    if-lez v1, :cond_1

    iget v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHeight:I

    if-lez v1, :cond_1

    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRequestRender:Z

    if-nez v1, :cond_0

    iget v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderMode:I

    if-ne v1, v0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private stopEglContextLocked()V
    .locals 1

    .prologue
    .line 1170
    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglContext:Z

    if-eqz v0, :cond_0

    .line 1171
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEglHelper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->finish()V

    .line 1172
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglContext:Z

    .line 1173
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->releaseEglContextLocked(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;)V

    .line 1175
    :cond_0
    return-void
.end method

.method private stopEglSurfaceLocked()V
    .locals 1

    .prologue
    .line 1159
    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_0

    .line 1160
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglSurface:Z

    .line 1161
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEglHelper:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;

    invoke-virtual {v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$EglHelper;->destroySurface()V

    .line 1163
    :cond_0
    return-void
.end method


# virtual methods
.method public ableToDraw()Z
    .locals 1

    .prologue
    .line 1416
    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglContext:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->readyToDraw()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRenderMode()I
    .locals 2

    .prologue
    .line 1436
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1437
    :try_start_0
    iget v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderMode:I

    monitor-exit v1

    return v0

    .line 1438
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 1483
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1487
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRequestPaused:Z

    .line 1488
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1489
    :goto_0
    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1494
    :try_start_1
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1495
    :catch_0
    move-exception v0

    .line 1496
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1499
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1500
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 1503
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1507
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRequestPaused:Z

    .line 1508
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRequestRender:Z

    .line 1509
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderComplete:Z

    .line 1510
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1511
    :goto_0
    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mPaused:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1516
    :try_start_1
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1517
    :catch_0
    move-exception v0

    .line 1518
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1521
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1522
    return-void
.end method

.method public onWindowResize(II)V
    .locals 4
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 1525
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1526
    :try_start_0
    iput p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mWidth:I

    .line 1527
    iput p2, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHeight:I

    .line 1528
    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    const/4 v3, 0x1

    invoke-static {v1, v3}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$902(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;Z)Z

    .line 1529
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRequestRender:Z

    .line 1530
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderComplete:Z

    .line 1531
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1535
    :goto_0
    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mPaused:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderComplete:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$1000(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->this$0:Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;

    invoke-static {v1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$1000(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;)Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->ableToDraw()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    .line 1540
    :try_start_1
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1541
    :catch_0
    move-exception v0

    .line 1542
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1545
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1546
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 1574
    if-nez p1, :cond_0

    .line 1575
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "r must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1577
    :cond_0
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1578
    :try_start_0
    iget-object v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1579
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1580
    monitor-exit v1

    .line 1581
    return-void

    .line 1580
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public requestExitAndWait()V
    .locals 3

    .prologue
    .line 1551
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1552
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mShouldExit:Z

    .line 1553
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1554
    :goto_0
    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1556
    :try_start_1
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1557
    :catch_0
    move-exception v0

    .line 1558
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1561
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1562
    return-void
.end method

.method public requestReleaseEglContextLocked()V
    .locals 1

    .prologue
    .line 1565
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mShouldReleaseEglContext:Z

    .line 1566
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1567
    return-void
.end method

.method public requestRender()V
    .locals 2

    .prologue
    .line 1442
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1443
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRequestRender:Z

    .line 1444
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1445
    monitor-exit v1

    .line 1446
    return-void

    .line 1445
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 3

    .prologue
    .line 1140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GLThread "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->setName(Ljava/lang/String;)V

    .line 1146
    :try_start_0
    invoke-direct {p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->guardedRun()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1150
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->threadExiting(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;)V

    .line 1152
    :goto_0
    return-void

    .line 1147
    :catch_0
    move-exception v0

    .line 1150
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->threadExiting(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;->threadExiting(Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;)V

    throw v0
.end method

.method public setRenderMode(I)V
    .locals 2
    .param p1, "renderMode"    # I

    .prologue
    .line 1426
    if-ltz p1, :cond_0

    const/4 v0, 0x1

    if-le p1, v0, :cond_1

    .line 1427
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "renderMode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1429
    :cond_1
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1430
    :try_start_0
    iput p1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mRenderMode:I

    .line 1431
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1432
    monitor-exit v1

    .line 1433
    return-void

    .line 1432
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public surfaceCreated()V
    .locals 3

    .prologue
    .line 1449
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1453
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHasSurface:Z

    .line 1454
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1455
    :goto_0
    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mWaitingForSurface:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1457
    :try_start_1
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1458
    :catch_0
    move-exception v0

    .line 1459
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1462
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1463
    return-void
.end method

.method public surfaceDestroyed()V
    .locals 3

    .prologue
    .line 1466
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1470
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mHasSurface:Z

    .line 1471
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1472
    :goto_0
    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mWaitingForSurface:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1474
    :try_start_1
    invoke-static {}, Lcom/miniclip/nativeJNI/GLSurfaceViewProfile;->access$700()Lcom/miniclip/nativeJNI/GLSurfaceViewProfile$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1475
    :catch_0
    move-exception v0

    .line 1476
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1479
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1480
    return-void
.end method
