class TaskDetails {
  final String taskType;
  final String taskName;
  final String taskPlace;
  final String taskTime;
  final String taskNotification;
  final String userId;
  final String taskId;
  final bool completed;

  TaskDetails(this.taskType, this.taskName, this.taskPlace, this.taskTime,
      this.taskNotification, this.userId, this.taskId, this.completed);

  TaskDetails.fromJson(Map<String, Object?> json)
      : this(
          json['taskType'] as String? ?? '',
          json['taskName'] as String? ?? '',
          json['taskPlace'] as String? ?? '',
          json['taskTime'] as String? ?? '',
          json['taskNotification'] as String? ?? '',
          json['userId'] as String? ?? '',
          json['taskId'] as String? ?? '',
          json['completed'] as bool? ?? false,
        );

  Map<String, Object?> toJson() {
    return {
      'taskType': taskType,
      'taskName': taskName,
      'taskPlace': taskPlace,
      'taskTime': taskTime,
      'taskNotification': taskNotification,
      'userId': userId,
      'taskId': taskId,
      'completed': completed
    };
  }
}
