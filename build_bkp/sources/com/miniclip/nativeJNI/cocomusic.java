package com.miniclip.nativeJNI;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import android.util.Log;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import java.io.File;
import java.io.FileInputStream;

public class cocomusic {
    private static final String TAG = "Cocos2dxMusic";
    private MediaPlayer mBackgroundMediaPlayer;
    private Context mContext;
    private String mCurrentPath;
    private boolean mIsPaused;
    private float mLeftVolume;
    private float mRightVolume;

    public cocomusic(Context context) {
        this.mContext = context;
        initData();
    }

    public void playBackgroundMusic(String path, boolean isLoop) {
        if (this.mCurrentPath == null) {
            this.mBackgroundMediaPlayer = createMediaplayerFromAssets(path);
            this.mCurrentPath = path;
        } else if (!this.mCurrentPath.equals(path)) {
            if (this.mBackgroundMediaPlayer != null) {
                this.mBackgroundMediaPlayer.release();
            }
            this.mBackgroundMediaPlayer = createMediaplayerFromAssets(path);
            this.mCurrentPath = path;
            Log.e(TAG, "playBackgroundMusic: new music");
        }
        if (this.mBackgroundMediaPlayer == null) {
            Log.e(TAG, "playBackgroundMusic: background media player is null");
            return;
        }
        this.mBackgroundMediaPlayer.stop();
        this.mBackgroundMediaPlayer.setLooping(isLoop);
        try {
            this.mBackgroundMediaPlayer.prepare();
            this.mBackgroundMediaPlayer.seekTo(0);
            this.mBackgroundMediaPlayer.start();
            this.mIsPaused = false;
        } catch (Exception e) {
            Log.e(TAG, "playBackgroundMusic: error state");
        }
    }

    public void stopBackgroundMusic() {
        if (this.mBackgroundMediaPlayer != null) {
            this.mBackgroundMediaPlayer.stop();
            this.mIsPaused = false;
        }
    }

    public void pauseBackgroundMusic() {
        if (this.mBackgroundMediaPlayer != null && this.mBackgroundMediaPlayer.isPlaying()) {
            this.mBackgroundMediaPlayer.pause();
            this.mIsPaused = true;
        }
    }

    public void resumeBackgroundMusic() {
        if (this.mBackgroundMediaPlayer != null && this.mIsPaused) {
            this.mBackgroundMediaPlayer.start();
            this.mIsPaused = false;
        }
    }

    public void rewindBackgroundMusic() {
        if (this.mBackgroundMediaPlayer != null) {
            this.mBackgroundMediaPlayer.stop();
            try {
                this.mBackgroundMediaPlayer.prepare();
                this.mBackgroundMediaPlayer.seekTo(0);
                this.mBackgroundMediaPlayer.start();
                this.mIsPaused = false;
            } catch (Exception e) {
                Log.e(TAG, "rewindBackgroundMusic: error state");
            }
        }
    }

    public boolean isBackgroundMusicPlaying() {
        if (this.mBackgroundMediaPlayer == null) {
            return false;
        }
        return this.mBackgroundMediaPlayer.isPlaying();
    }

    public void end() {
        if (this.mBackgroundMediaPlayer != null) {
            this.mBackgroundMediaPlayer.release();
        }
        initData();
    }

    public float getBackgroundVolume() {
        if (this.mBackgroundMediaPlayer != null) {
            return (this.mLeftVolume + this.mRightVolume) / 2.0f;
        }
        return BitmapDescriptorFactory.HUE_RED;
    }

    public void setBackgroundVolume(float volume) {
        this.mRightVolume = volume;
        this.mLeftVolume = volume;
        if (this.mBackgroundMediaPlayer != null) {
            this.mBackgroundMediaPlayer.setVolume(this.mLeftVolume, this.mRightVolume);
        }
    }

    private void initData() {
        this.mLeftVolume = 0.5f;
        this.mRightVolume = 0.5f;
        this.mBackgroundMediaPlayer = null;
        this.mIsPaused = false;
        this.mCurrentPath = null;
    }

    private MediaPlayer createMediaplayerFromAssets(String path) {
        MediaPlayer mediaPlayer = new MediaPlayer();
        try {
            AssetFileDescriptor assetFileDescritor = this.mContext.getAssets().openFd(path);
            mediaPlayer.setDataSource(assetFileDescritor.getFileDescriptor(), assetFileDescritor.getStartOffset(), assetFileDescritor.getLength());
            mediaPlayer.prepare();
            mediaPlayer.setVolume(this.mLeftVolume, this.mRightVolume);
            return mediaPlayer;
        } catch (Exception e) {
            try {
                AssetFileDescriptor assetFileDescritor2 = this.mContext.getAssets().openFd(new File(path).getName());
                mediaPlayer.setDataSource(assetFileDescritor2.getFileDescriptor(), assetFileDescritor2.getStartOffset(), assetFileDescritor2.getLength());
                mediaPlayer.prepare();
                mediaPlayer.setVolume(this.mLeftVolume, this.mRightVolume);
                return mediaPlayer;
            } catch (Exception e2) {
                try {
                    FileInputStream fis = new FileInputStream(new File(path));
                    mediaPlayer.reset();
                    mediaPlayer.setDataSource(fis.getFD());
                    mediaPlayer.prepare();
                    mediaPlayer.setVolume(this.mLeftVolume, this.mRightVolume);
                    return mediaPlayer;
                } catch (Exception e3) {
                    Log.e(TAG, "error: " + e3.getMessage(), e3);
                    return null;
                }
            }
        }
    }

    public int getDurationForSound(String path) {
        MediaPlayer mp = createMediaplayerFromAssets(path);
        if (mp == null) {
            return -1;
        }
        return mp.getDuration();
    }
}
