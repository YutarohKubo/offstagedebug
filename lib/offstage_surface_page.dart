import 'package:flutter/material.dart';
import 'package:offstagedebug/surface_widget.dart';

class OffstageSurfacePage extends StatefulWidget {
  const OffstageSurfacePage({super.key});

  @override
  State<OffstageSurfacePage> createState() => _OffstageSurfacePageState();
}

class _OffstageSurfacePageState extends State<OffstageSurfacePage> {
  bool _offstage = false;

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
                      _offstage = false;
                    },
                  );
                },
                child: const Text('show'),
              ),
              const SizedBox(height: 20),
              Offstage(
                offstage: _offstage,
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
                              _offstage = true;
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
