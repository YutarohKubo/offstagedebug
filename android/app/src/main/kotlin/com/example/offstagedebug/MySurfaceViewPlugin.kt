package com.example.offstagedebug

import io.flutter.embedding.engine.plugins.FlutterPlugin

class MySurfaceViewPlugin : FlutterPlugin {
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        binding.platformViewRegistry.registerViewFactory("my_surface_view", MySurfaceViewFactory())
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    }

}
