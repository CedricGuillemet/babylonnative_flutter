package com.babylon.babylonnative;

import android.content.Context;
import android.graphics.Color;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.platform.PlatformView;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.graphics.Canvas;
import android.widget.FrameLayout;
import java.util.Map;

class NativeView extends FrameLayout implements PlatformView, SurfaceHolder.Callback2, View.OnTouchListener{
    private static final FrameLayout.LayoutParams childViewLayoutParams = new FrameLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT);
    private final SurfaceView primarySurfaceView;
    private final Context context;
    private final float pixelDensityScale = getResources().getDisplayMetrics().density;
    private boolean mViewReady = false;

    NativeView(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {
        super(context);
        this.primarySurfaceView = new SurfaceView(context);
        this.primarySurfaceView.setLayoutParams(NativeView.childViewLayoutParams);
        this.context = context;

        SurfaceHolder holder = this.primarySurfaceView.getHolder();
        holder.addCallback(this);
        setOnTouchListener(this);

        this.addView(this.primarySurfaceView);

        setWillNotDraw(false);

        Wrapper.initEngine();
    }

    @NonNull
    @Override
    public View getView() {
        return this;
    }

    @Override
    public void dispose() {}

    /**
     * This method is part of the SurfaceHolder.Callback interface, and is
     * not normally called or subclassed by clients of BabylonView.
     */
    public void surfaceCreated(SurfaceHolder holder) {
        Wrapper.surfaceCreated(holder.getSurface(), this.context);
        //BabylonNative.Wrapper.setCurrentActivity(this.mCurrentActivity);
        if (!this.mViewReady) {
            //this.mViewDelegate.onViewReady();
            //Wrapper.loadScript("app:///Scripts/experience.js");
            Wrapper.loadScript("app:///Scripts/marble.js");
            Wrapper.loadScript("app:///Scripts/playground_runner.js");
            this.mViewReady = true;
        }
    }

    /**
     * This method is part of the SurfaceHolder.Callback interface, and is
     * not normally called or subclassed by clients of BabylonView.
     */
    public void surfaceDestroyed(SurfaceHolder holder) {
    }

    /**
     * This method is part of the SurfaceHolder.Callback interface, and is
     * not normally called or subclassed by clients of BabylonView.
     */
    public void surfaceChanged(SurfaceHolder holder, int format, int w, int h) {
        Wrapper.surfaceChanged((int)(w / this.pixelDensityScale), (int)(h / this.pixelDensityScale), holder.getSurface());
    }

    @Override
    protected void finalize() throws Throwable {
        Wrapper.finishEngine();
    }

    /**
     * This method is part of the SurfaceHolder.Callback2 interface, and is
     * not normally called or subclassed by clients of BabylonView.
     */
    @Deprecated
    @Override
    public void surfaceRedrawNeeded(SurfaceHolder holder) {
        // Redraw happens in the bgfx thread. No need to handle it here.
    }

    @Override
    protected void onDraw(Canvas canvas) {
        /*if (Wrapper.isXRActive()) {
            this.xrSurfaceView.setVisibility(View.VISIBLE);
        } else {
            this.xrSurfaceView.setVisibility(View.INVISIBLE);
        }*/

        Wrapper.renderFrame();
        invalidate();
    }

    @Override
    public boolean onTouch(View v, MotionEvent event) {
        int pointerId = event.getPointerId(event.getActionIndex());
        float mX = event.getX(event.getActionIndex()) / this.pixelDensityScale;
        float mY = event.getY(event.getActionIndex()) / this.pixelDensityScale;

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
            case MotionEvent.ACTION_POINTER_DOWN:
                Wrapper.setTouchInfo(pointerId, mX, mY, true, 1);
                break;
            case MotionEvent.ACTION_MOVE:
                Wrapper.setTouchInfo(pointerId, mX, mY, false, 0);
                break;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_POINTER_UP:
                Wrapper.setTouchInfo(pointerId, mX, mY, true, 0);
                break;
        }
        return true;
    }
}
