import 'package:flutter/material.dart';

class PipScreenMode extends StatefulWidget {
  const PipScreenMode({Key? key}) : super(key: key);

  @override
  State<PipScreenMode> createState() => _PipScreenModeState();
}

class _PipScreenModeState extends State<PipScreenMode> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('PiP is enabled.'),
      ),
    );
  }
}
