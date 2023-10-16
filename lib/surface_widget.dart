import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class SurfaceWidget extends StatelessWidget {
  const SurfaceWidget({
    super.key,
    this.virtualDisplay = false,
  });

  final bool virtualDisplay;

  @override
  Widget build(BuildContext context) {
    const viewType = 'my_surface_view';
    if (defaultTargetPlatform == TargetPlatform.android) {
      if (virtualDisplay) {
        return AndroidView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.transparent,
          creationParamsCodec: const StandardMessageCodec(),
          onPlatformViewCreated: (id) {
            print('Created PlatformView. (Virtual display) (id = $id)');
          },
        );
      } else {
        return PlatformViewLink(
          viewType: viewType,
          surfaceFactory: (context, controller) {
            return AndroidViewSurface(
              controller: controller as AndroidViewController,
              gestureRecognizers: const <
                  Factory<OneSequenceGestureRecognizer>>{},
              // タッチ範囲設定
              hitTestBehavior: PlatformViewHitTestBehavior.transparent,
            );
          },
          onCreatePlatformView: (PlatformViewCreationParams params) {
            // initAndroidView, initSurfaceAndroidViewでは動画が表示されない
            return PlatformViewsService.initExpensiveAndroidView(
              id: params.id,
              viewType: viewType,
              layoutDirection: TextDirection.ltr,
              creationParamsCodec: const StandardMessageCodec(),
              onFocus: () {
                params.onFocusChanged(true);
              },
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..addOnPlatformViewCreatedListener(
                (id) {
                  print(
                      'Created PlatformView. (Hybrid composition) (id = $id)');
                },
              )
              ..create();
          },
        );
      }
    } else {
      return Container();
    }
  }
}
