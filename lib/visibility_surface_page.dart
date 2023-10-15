import 'package:flutter/material.dart';
import 'package:offstagedebug/surface_widget.dart';

class VisibilitySurfacePage extends StatefulWidget {
  const VisibilitySurfacePage({super.key});

  @override
  State<VisibilitySurfacePage> createState() => _VisibilitySurfacePageState();
}

class _VisibilitySurfacePageState extends State<VisibilitySurfacePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('VisibilitySurfacePage'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      _visible = true;
                    },
                  );
                },
                child: const Text('show'),
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: _visible,
                child: Container(
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 100,
                        height: 100,
                        child: SurfaceWidget(),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text('Surface!!'),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              _visible = false;
                            },
                          );
                        },
                        child: const Text('Hide'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
