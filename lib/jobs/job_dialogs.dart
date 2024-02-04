import 'package:agricobots_workaround_android/jobs/job.dart';
import 'package:flutter/material.dart';

abstract class JobDialogs {

static Future<void> showNewJobDialog(BuildContext context, Job job) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Attenzione'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.warning_amber),
                Text('Nuovo lavoro arrivato'),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            Text('Nome: ${job.name}'),
            Text('Descrizione: ${job.description}'),
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
}