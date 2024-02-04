import 'dart:math';
import 'package:floating/floating.dart';
import 'package:flutter/material.dart';

class FullscreenMode extends StatefulWidget {
  const FullscreenMode({Key? key}) : super(key: key);

  @override
  State<FullscreenMode> createState() => _FullscreenModeState();
}

class _FullscreenModeState extends State<FullscreenMode>  with WidgetsBindingObserver {
  final floating = Floating();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    floating.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      floating.enable(aspectRatio: const Rational.square());
    }
  }

  Future<void> enablePip(BuildContext context) async {
    const rational = Rational.landscape();
    final screenSize =
        MediaQuery.of(context).size * MediaQuery.of(context).devicePixelRatio;
    final height = screenSize.width ~/ rational.aspectRatio;

    await floating.enable(
      aspectRatio: rational,
      sourceRectHint: Rectangle<int>(
        0,
        (screenSize.height ~/ 2) - (height ~/ 2),
        screenSize.width.toInt(),
        height,
      ),
    );
    
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const Center(
        child: Text('PiP is disabled.'),
      ),
      floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FutureBuilder<bool>(
              future: floating.isPipAvailable,
              initialData: false,
              builder: (context, snapshot) => snapshot.data ?? false
                  ? FloatingActionButton.extended(
                      onPressed: () => enablePip(context),
                      label: const Text('Enable PiP'),
                      icon: const Icon(Icons.picture_in_picture),
                    )
                  : const Card(
                      child: Text('PiP unavailable'),
                    ),
            ),
    );
  }
}