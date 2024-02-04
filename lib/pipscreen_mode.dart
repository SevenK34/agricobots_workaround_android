import 'package:agricobots_workaround_android/communication/communication.dart';
import 'package:agricobots_workaround_android/jobs/job.dart';
import 'package:agricobots_workaround_android/jobs/job_dialogs.dart';
import 'package:flutter/material.dart';

class PipScreenMode extends StatefulWidget {
  const PipScreenMode({Key? key}) : super(key: key);

  @override
  State<PipScreenMode> createState() => _PipScreenModeState();
}

class _PipScreenModeState extends State<PipScreenMode> {
  List<Job> jobs = [];
  @override
  void initState() {
    Communication.onMessageReceived.listen((message) {
      setState(() {
        if (Job.isMapValid(message)) {
          jobs.insert(0, Job.fromMap(message));
        }
      });
      JobDialogs.showNewJobDialog(context, Job.fromMap(message));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: FilledButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("Conferma lettura")),
            ),
          ],
        )
      ],
    ));
  }
}
