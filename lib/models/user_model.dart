class User {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoURL;
  final DateTime? createdAt;

  User({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoURL,
    this.createdAt,
  });

  // Convert User to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'createdAt': createdAt,
    };
  }

  // Create User from Firestore document
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }
}
