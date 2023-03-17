class UserDetails {
  final String displayName;
  final String userId;

  UserDetails(this.displayName, this.userId);

  UserDetails.fromJson(Map<String, Object?> json)
      : this(
          json['displayName'] as String? ?? '',
          json['userId'] as String? ?? '',
        );

  Map<String, Object?> toJson() {
    return {
      'displayName': displayName,
      'userId': userId,
    };
  }
}
