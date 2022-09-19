package com.babylon.babylonnative;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.platform.PlatformView;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.graphics.Canvas;
import java.util.Map;

class NativeView implements PlatformView, SurfaceHolder.Callback2, View.OnTouchListener{
   //@NonNull private final TextView textView;
   private final SurfaceView primarySurfaceView;
   private final Context context;

    NativeView(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {
        /*textView = new TextView(context);
        textView.setTextSize(72);
        textView.setBackgroundColor(Color.rgb(255, 255, 255));
        textView.setText("Rendered on a native Android view (id: " + id + ")");
*/

        this.primarySurfaceView = new SurfaceView(context);
        //this.primarySurfaceView.setLayoutParams(BabylonView.childViewLayoutParams);
        this.primarySurfaceView.getHolder().addCallback(this);

        this.context = context;
        //this.addView(this.primarySurfaceView);


        Wrapper.initEngine();
    }

    @NonNull
    @Override
    public View getView() {
        return primarySurfaceView;
    }

    @Override
    public void dispose() {}

    /**
     * This method is part of the SurfaceHolder.Callback interface, and is
     * not normally called or subclassed by clients of BabylonView.
     */
    public void surfaceCreated(SurfaceHolder holder) {
        Wrapper.surfaceCreated(holder.getSurface(), this.context);
        /*BabylonNative.Wrapper.setCurrentActivity(this.mCurrentActivity);
        if (!this.mViewReady) {
            this.mViewDelegate.onViewReady();
            this.mViewReady = true;
        }*/
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
        Wrapper.surfaceChanged((int)(w / 1), (int)(h / 1), holder.getSurface());
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

    //@Override
    protected void onDraw(Canvas canvas) {
        /*if (Wrapper.isXRActive()) {
            this.xrSurfaceView.setVisibility(View.VISIBLE);
        } else {
            this.xrSurfaceView.setVisibility(View.INVISIBLE);
        }*/

        Wrapper.renderFrame();
        //invalidate();
    }

    public boolean onTouch(View v, MotionEvent event) {
        int pointerId = event.getPointerId(event.getActionIndex());
        float mX = event.getX(event.getActionIndex()) / 1;//this.pixelDensityScale;
        float mY = event.getY(event.getActionIndex()) / 1;//this.pixelDensityScale;

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
