import 'dart:async';

enum JobStatus { pending, acknowledge, inProgress, paused, completed }

/// Class that describes a received job.
///
/// It contains useful data about the job, such as the name and the description.
/// It also contains the status of the job, which describes if the operator has
/// read ('acknowledge') the job, if the job is in progress or if the job has been
/// completed.
class Job {
  JobStatus _jobStatus;
  /// When the job was activated
  DateTime activationTimestamp;
  /// When the job was completed
  DateTime completionTimestamp;
  /// Unique ID of the job, given by the server
  final int _jobId;
  /// Description of the job and what the machine has to do
  final String _jobDescription;
  // TODO: decide between macAddress and IMEI as unique identifier for the machine that is doing the job
  final _statusController = StreamController<JobStatus>.broadcast();
  Job(this._jobStatus, this._jobId, this._jobDescription);
  // Getters
  int get name => _jobId;
  String get description => _jobDescription;
  bool get isPending => _jobStatus == JobStatus.pending;
  bool get isAcknowledge => _jobStatus == JobStatus.acknowledge;
  bool get isInProgress => _jobStatus == JobStatus.inProgress;
  bool get isPaused => _jobStatus == JobStatus.paused;
  bool get isCompleted => _jobStatus == JobStatus.completed;
  JobStatus get jobStatus => _jobStatus;
  Stream<JobStatus> get onStatusChanged => _statusController.stream;
  // Setters
  set jobStatus(JobStatus status) {
    _jobStatus = status;
    _statusController.sink.add(status);
  }

  static bool isMapValid(Map<String, dynamic> map) {
    return map.containsKey('jobStatus') &&
        map.containsKey('jobName') &&
        map.containsKey('jobDescription');
  }

  // ToMap
  Map<String, dynamic> toMap() {
    return {
      'jobStatus': _jobStatus.index,
      'jobName': _jobId,
      'jobDescription': _jobDescription,
    };
  }

  // FromMap
  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      JobStatus.values[map['jobStatus']],
      map['jobName'],
      map['jobDescription'],
    );
  }
}
