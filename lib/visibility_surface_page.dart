import 'package:flutter/material.dart';
import 'package:offstagedebug/surface_widget.dart';

class VisibilitySurfacePage extends StatefulWidget {
  const VisibilitySurfacePage({super.key});

  @override
  State<VisibilitySurfacePage> createState() => _VisibilitySurfacePageState();
}

class _VisibilitySurfacePageState extends State<VisibilitySurfacePage> {
  bool _visibleVirtual = true;
  bool _visibleHybrid = true;

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
                      _visibleVirtual = true;
                      _visibleHybrid = true;
                    },
                  );
                },
                child: const Text('show'),
              ),
              const SizedBox(height: 20),
              const Text('Virtual display'),
              const SizedBox(height: 8),
              Visibility(
                visible: _visibleVirtual,
                child: Container(
                  height: 120,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 100,
                        height: 100,
                        child: SurfaceWidget(virtualDisplay: true),
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
                              _visibleVirtual = false;
                            },
                          );
                        },
                        child: const Text('Hide'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Hybrid composition'),
              const SizedBox(height: 8),
              Visibility(
                visible: _visibleHybrid,
                child: Container(
                  height: 120,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 100,
                        height: 100,
                        child: SurfaceWidget(virtualDisplay: false),
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
                              _visibleHybrid = false;
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
