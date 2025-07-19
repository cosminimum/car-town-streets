package com.miniclip.nativeJNI;

import android.content.Context;
import android.media.AudioManager;
import android.media.SoundPool;
import android.os.Build;
import android.os.Handler;
import android.util.Log;
import java.io.IOException;
import java.util.HashMap;
import java.util.Vector;
/* loaded from: classes.dex */
public class cocosound {
    private static int MAX_SIMULTANEOUS_STREAMS_DEFAULT = 10;
    public static final int SOUND_LOOP_TIME = 0;
    private static final int SOUND_QUALITY = 5;
    public static final float SOUND_RATE = 1.0f;
    private static final String TAG = "Cocos2dxSound";
    private boolean GS2MODE;
    private Context mContext;
    public float mLeftVolume;
    private HashMap<String, Integer> mPathSoundIDMap;
    public float mRightVolume;
    private HashMap<Integer, Integer> mSoundIdStreamIdMap;
    private SoundPool mSoundPool;
    private Vector<Integer> mSounds2Play = new Vector<>();
    public final int SOUND_PRIORITY = 1;
    private final int INVALID_SOUND_ID = -1;
    private final int INVALID_STREAM_ID = -1;
    private Handler playHandler = new Handler();

    public cocosound(Context context) {
        this.mContext = context;
        this.GS2MODE = false;
        if (Build.MODEL.compareTo("GT-I9100") == 0 && Build.VERSION.SDK_INT < 14) {
            Log.i("cocosound", "phone is: " + Build.MODEL + " enabling single stream soundpool");
            MAX_SIMULTANEOUS_STREAMS_DEFAULT = 1;
            this.GS2MODE = true;
        }
        initData();
    }

    public int preloadEffect(String path) {
        if (this.mPathSoundIDMap.get(path) != null) {
            Log.i("cocosound", "preloadEffect: map: " + path);
            return this.mPathSoundIDMap.get(path).intValue();
        }
        Log.i("cocosound", "preloadEffect: load: " + path);
        int soundId = createSoundIdFromAsset(path);
        if (soundId != -1) {
            this.mSoundIdStreamIdMap.put(Integer.valueOf(soundId), -1);
            this.mPathSoundIDMap.put(path, Integer.valueOf(soundId));
            return soundId;
        }
        return soundId;
    }

    public void unloadEffect(String path) {
        Integer soundId = this.mPathSoundIDMap.remove(path);
        if (soundId != null) {
            Log.i("cocosound", "unloadEffect: " + path);
            this.mSoundPool.unload(soundId.intValue());
            this.mSoundIdStreamIdMap.remove(soundId);
        }
    }

    public void playEffect(int soundId) {
        playEffect(soundId, this.mLeftVolume, this.mRightVolume, 1, 0, 1.0f);
    }

    public void playEffect(int soundId, int loopTime, float pitch) {
        playEffect(soundId, this.mLeftVolume, this.mRightVolume, 1, loopTime, pitch);
    }

    public void playEffect(int soundId, int priority, int loopTime, float pitch) {
        playEffect(soundId, this.mLeftVolume, this.mRightVolume, priority, loopTime, pitch);
    }

    public void playEffect(int soundId, float leftGain, float rightGain, int loopTime, float pitch) {
        playEffect(soundId, leftGain, rightGain, 1, loopTime, pitch);
    }

    public void playEffect(final int soundId, final float leftGain, final float rightGain, final int priority, final int loopTime, float pitch) {
        if (pitch < 0.5f) {
            pitch = 0.5f;
        }
        if (pitch > 2.0f) {
            pitch = 2.0f;
        }
        if (this.GS2MODE) {
            stopEffect(soundId);
        }
        this.mSounds2Play.add(new Integer(soundId));
        final float npitch = pitch;
        this.playHandler.postDelayed(new Runnable() { // from class: com.miniclip.nativeJNI.cocosound.1
            @Override // java.lang.Runnable
            public void run() {
                if (mcs.mSounds2Play.contains(Integer.valueOf(soundId))) {
                    mcs.mSounds2Play.remove(new Integer(soundId));
                    mcs.stopEffect(soundId);
                    int streamId = mcs.mSoundPool.play(soundId, leftGain * mcs.mLeftVolume, rightGain * mcs.mRightVolume, priority, loopTime, npitch);
                    mcs.mSoundIdStreamIdMap.put(Integer.valueOf(soundId), Integer.valueOf(streamId));
                }
            }
        }, 200L);
    }

    public void setEffectPitch(int soundId, float pitch) {
        if (pitch < 0.5f) {
            pitch = 0.5f;
        }
        if (pitch > 2.0f) {
            pitch = 2.0f;
        }
        Integer streamId = this.mSoundIdStreamIdMap.get(Integer.valueOf(soundId));
        if (streamId != null && streamId.intValue() != -1) {
            this.mSoundPool.setRate(streamId.intValue(), pitch);
        }
    }

    public void pauseEffect(int soundId) {
        Integer streamId = this.mSoundIdStreamIdMap.get(Integer.valueOf(soundId));
        if (streamId != null && streamId.intValue() != -1) {
            this.mSoundPool.pause(streamId.intValue());
        }
    }

    public void stopEffect(int soundId) {
        Integer streamId = this.mSoundIdStreamIdMap.get(Integer.valueOf(soundId));
        if (this.mSounds2Play.contains(Integer.valueOf(soundId))) {
            this.mSounds2Play.remove(new Integer(soundId));
        }
        if (streamId != null && streamId.intValue() != -1) {
            this.mSoundPool.stop(streamId.intValue());
        } else {
            Log.i("cocosound", "stopEffect error: " + soundId);
        }
    }

    public void setEffectLooping(int soundId, boolean loop) {
        Integer streamId = this.mSoundIdStreamIdMap.get(Integer.valueOf(soundId));
        if (streamId != null && streamId.intValue() != -1) {
            if (loop) {
                this.mSoundPool.setLoop(streamId.intValue(), -1);
            } else {
                this.mSoundPool.setLoop(streamId.intValue(), 0);
            }
        }
    }

    public void setEffectGain(int soundId, float gain) {
        Integer streamId = this.mSoundIdStreamIdMap.get(Integer.valueOf(soundId));
        if (streamId != null && streamId.intValue() != -1) {
            this.mSoundPool.setVolume(streamId.intValue(), gain, gain);
        }
    }

    public float getEffectsVolume() {
        AudioManager audioManager = (AudioManager) this.mContext.getSystemService("audio");
        return audioManager.getStreamVolume(3);
    }

    public void setEffectsVolume(float volume) {
        this.mRightVolume = volume;
        this.mLeftVolume = volume;
    }

    public void end() {
        this.mSoundPool.release();
        this.mPathSoundIDMap.clear();
        this.mSoundIdStreamIdMap.clear();
        initData();
    }

    public void pauseAllSounds() {
        try {
            this.mSoundPool.autoPause();
        } catch (NoSuchMethodError e) {
            e.printStackTrace();
        }
    }

    public void resumeAllSounds() {
        try {
            this.mSoundPool.autoResume();
        } catch (NoSuchMethodError e) {
            e.printStackTrace();
        }
    }

    public int createSoundIdFromAsset(String path) {
        try {
            int soundId = this.mSoundPool.load(this.mContext.getAssets().openFd(path), 0);
            return soundId;
        } catch (Exception e) {
            String newPath = path.substring(0, path.length() - 3);
            try {
                int soundId2 = this.mSoundPool.load(this.mContext.getAssets().openFd(newPath.concat("wav")), 0);
                return soundId2;
            } catch (IOException e2) {
                try {
                    int soundId3 = this.mSoundPool.load(this.mContext.getAssets().openFd(newPath.concat("mp3")), 0);
                    return soundId3;
                } catch (IOException e3) {
                    try {
                        int soundId4 = this.mSoundPool.load(path, 0);
                        return soundId4;
                    } catch (Exception e4) {
                        return -1;
                    }
                }
            }
        }
    }

    private void initData() {
        this.mSoundIdStreamIdMap = new HashMap<>();
        this.mSoundPool = new SoundPool(MAX_SIMULTANEOUS_STREAMS_DEFAULT, 3, 5);
        this.mPathSoundIDMap = new HashMap<>();
        this.mLeftVolume = 0.5f;
        this.mRightVolume = 0.5f;
    }
}
