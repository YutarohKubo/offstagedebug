package com.example.offstagedebug

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.util.Log
import android.view.SurfaceHolder
import android.view.SurfaceView
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

class MySurfaceView(
    context: Context,
    private val id: Int,
    creationParams: Map<String?, Any?>?
) : PlatformView, SurfaceHolder.Callback {

    private var mSurfaceView: SurfaceView
    private var mPlayerLayout: FrameLayout

    init {
        mPlayerLayout = FrameLayout(context)
        val lp: ViewGroup.LayoutParams = FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT
        )
        mPlayerLayout.layoutParams = lp

        mSurfaceView = SurfaceView(context)
        mSurfaceView.holder.addCallback(this)
        val textView = TextView(context).apply {
            text = "Hello World"
            setTextColor(Color.YELLOW)
        }
        mPlayerLayout.addView(mSurfaceView)
        mPlayerLayout.addView(textView)
    }

    override fun getView(): View {
        return mPlayerLayout
    }

    override fun dispose() {
        Log.d(TAG, "dispose")
    }

    override fun surfaceCreated(holder: SurfaceHolder) {
        Log.d(TAG, "surfaceCreated")
        val canvas: Canvas = holder.lockCanvas()
        val canvasWidth: Int = canvas.width
        val canvasHeight: Int = canvas.height
        val paint = Paint()
        paint.color = Color.BLACK
        canvas.drawRect(0.0f, 0.0f, canvasWidth.toFloat(), canvasHeight.toFloat(), paint)

        holder.unlockCanvasAndPost(canvas)
    }

    override fun surfaceChanged(holder: SurfaceHolder, format: Int, width: Int, height: Int) {
        Log.d(TAG, "surfaceChanged")
    }

    override fun surfaceDestroyed(holder: SurfaceHolder) {
        Log.d(TAG, "surfaceDestroyed")
    }

    companion object {
        private const val TAG = "MySurfaceView"
    }

}