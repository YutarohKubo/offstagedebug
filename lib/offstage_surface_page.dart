import 'package:flutter/material.dart';
import 'package:offstagedebug/surface_widget.dart';

class OffstageSurfacePage extends StatefulWidget {
  const OffstageSurfacePage({super.key});

  @override
  State<OffstageSurfacePage> createState() => _OffstageSurfacePageState();
}

class _OffstageSurfacePageState extends State<OffstageSurfacePage> {
  bool _offstageVirtual = false;
  bool _offstageHybrid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('OffstageSurfacePage'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      _offstageVirtual = false;
                      _offstageHybrid = false;
                    },
                  );
                },
                child: const Text('show'),
              ),
              const SizedBox(height: 20),
              const Text('Virtual display'),
              const SizedBox(height: 8),
              Offstage(
                offstage: _offstageVirtual,
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
                              _offstageVirtual = true;
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
              Offstage(
                offstage: _offstageHybrid,
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
                              _offstageHybrid = true;
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
