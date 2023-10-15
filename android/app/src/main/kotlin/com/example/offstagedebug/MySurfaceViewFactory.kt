package com.example.offstagedebug

import android.content.Context
import com.example.offstagedebug.MySurfaceView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class MySurfaceViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return MySurfaceView(context, viewId, creationParams)
    }
}
