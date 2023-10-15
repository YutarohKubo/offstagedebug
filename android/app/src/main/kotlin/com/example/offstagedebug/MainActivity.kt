package com.example.offstagedebug

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    private var initialized = false

    override fun onPostResume() {
        Log.d(TAG, "onPostResume");
        if (!initialized) {
            initialized = setup(flutterEngine)
        }
        super.onPostResume()
    }

    private fun setup(engine: FlutterEngine?): Boolean {
        if (engine == null) {
            return false
        }

        // add PlatformView plugin
        engine.plugins.add(MySurfaceViewPlugin())
        return true
    }

    companion object {
        private const val TAG = "MainAct"
    }
}
