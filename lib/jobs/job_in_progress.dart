import 'package:agricobots_workaround_android/jobs/job.dart';
import 'package:flutter/material.dart';

class JobInProgress extends StatefulWidget {
  final Job job;
  const JobInProgress({Key? key, required this.job}) : super(key: key);

  @override
  State<JobInProgress> createState() => _JobInProgressState();
}

class _JobInProgressState extends State<JobInProgress> {
  @override
  void initState() {
    widget.job.onStatusChanged.listen((event) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.job.isPending)
        ? const Center(
            child: Text("Lavoro non ancora iniziato"),
          )
        : Column(
            children: [
              const Text("Lavoro in corso"),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Text('Nome: ${widget.job.name}'),
              Text('Descrizione: ${widget.job.description}'),
              if (widget.job.jobStatus != JobStatus.completed)
                const CircularProgressIndicator.adaptive(),
              if (widget.job.jobStatus == JobStatus.completed)
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  FilledButton(
                      onPressed: () {
                        widget.job.jobStatus = JobStatus.paused;
                      },
                      child: const Text("Ferma")),
                  FilledButton(
                      onPressed: () {
                        widget.job.jobStatus = JobStatus.completed;
                      },
                      child: const Text("Completato")),
                ],
              )
            ],
          );
  }
}
