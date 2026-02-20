class User {
  final String uid;
  final String email;
  final String username;
  final String? displayName;
  final String? photoURL;
  final DateTime? createdAt;

  User({
    required this.uid,
    required this.email,
    required this.username,
    this.displayName,
    this.photoURL,
    this.createdAt,
  });

  // Convert User to JSON for Firebase Realtime Database
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'displayName': displayName,
      'photoURL': photoURL,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  // Create User from Firebase Realtime Database document
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] as String? ?? '',
      email: json['email'] as String? ?? '',
      username: json['username'] as String? ?? 'Unknown User',
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }
}
