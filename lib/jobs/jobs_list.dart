import 'package:flutter/material.dart';
import 'package:agricobots_workaround_android/jobs/job.dart';

class JobsList extends StatelessWidget {
  final List<Job> jobs;
  const JobsList({Key? key, required this.jobs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs.elementAt(index);
        return ListTile(
          title: Text(job.name),
          subtitle: Text(job.description),
          trailing: _JobTileOptions(job: job),
        );
      },
    );
  }
}

class _JobTileOptions extends StatelessWidget {
  final Job job;
  const _JobTileOptions({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            child: ListTile(
              title:  Text('Letto'),
              leading:  Icon(Icons.mark_chat_read),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title:  Text('Inizia'),
              leading:  Icon(Icons.pending_actions),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title:  Text('Completato'),
              leading:  Icon(Icons.check),
            ),
          ),
        ];
      },
    );
  }
}

