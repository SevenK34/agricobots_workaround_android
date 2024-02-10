// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_foreground_task/flutter_foreground_task.dart';

// Future<void> _requestPermissionForAndroid() async {
//   if (!Platform.isAndroid) {
//     return;
//   }

//   // "android.permission.SYSTEM_ALERT_WINDOW" permission must be granted for
//   // onNotificationPressed function to be called.
//   //
//   // When the notification is pressed while permission is denied,
//   // the onNotificationPressed function is not called and the app opens.
//   //
//   // If you do not use the onNotificationPressed or launchApp function,
//   // you do not need to write this code.
//   if (!await FlutterForegroundTask.canDrawOverlays) {
//     // This function requires `android.permission.SYSTEM_ALERT_WINDOW` permission.
//     await FlutterForegroundTask.openSystemAlertWindowSettings();
//   }

//   // Android 12 or higher, there are restrictions on starting a foreground service.
//   //
//   // To restart the service on device reboot or unexpected problem, you need to allow below permission.
//   if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
//     // This function requires `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` permission.
//     await FlutterForegroundTask.requestIgnoreBatteryOptimization();
//   }

//   // Android 13 and higher, you need to allow notification permission to expose foreground service notification.
//   final NotificationPermission notificationPermissionStatus =
//       await FlutterForegroundTask.checkNotificationPermission();
//   if (notificationPermissionStatus != NotificationPermission.granted) {
//     await FlutterForegroundTask.requestNotificationPermission();
//   }
// }

// void _onData(dynamic data) {
//   if (data is int) {
//     print('eventCount: $data');
//   } else if (data is String) {
//     if (data == 'onNotificationPressed') {
//       Navigator.of(context).pushNamed('/resume-route');
//     }
//   } else if (data is DateTime) {
//     print('timestamp: ${data.toString()}');
//   }
// }

// @override
// void initState() {
//   super.initState();
//   _requestPermissionForAndroid();
// }

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     // A widget that can start the foreground service when the app is minimized or closed.
//     // This widget must be declared above the [Scaffold] widget.
//     home: WillStartForegroundTask(
//       onWillStart: () async {
//         // Return whether to start the foreground service.
//         return true;
//       },
//       androidNotificationOptions: AndroidNotificationOptions(
//         channelId: 'foreground_service',
//         channelName: 'Foreground Service Notification',
//         channelDescription:
//             'This notification appears when the foreground service is running.',
//         channelImportance: NotificationChannelImportance.LOW,
//         priority: NotificationPriority.LOW,
//         isSticky: false, // important
//         iconData: const NotificationIconData(
//           resType: ResourceType.mipmap,
//           resPrefix: ResourcePrefix.ic,
//           name: 'launcher',
//         ),
//         buttons: [
//           const NotificationButton(id: 'sendButton', text: 'Send'),
//           const NotificationButton(id: 'testButton', text: 'Test'),
//         ],
//       ),
//       iosNotificationOptions: const IOSNotificationOptions(
//         showNotification: true,
//         playSound: false,
//       ),
//       foregroundTaskOptions: const ForegroundTaskOptions(
//         interval: 5000,
//         isOnceEvent: false,
//         allowWakeLock: false,
//         allowWifiLock: false,
//       ),
//       notificationTitle: 'Foreground Service is running',
//       notificationText: 'Tap to return to the app',
//       callback: startCallback,
//       onData: _onData,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter Foreground Task'),
//           centerTitle: true,
//         ),
//         body: buildContentView(),
//       ),
//     ),
//   );
// }
