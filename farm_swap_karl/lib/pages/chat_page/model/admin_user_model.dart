class ChatUserModel {
  ChatUserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.image,
    this.isOnline = false,
  });

  final String uid;
  final String name;
  final String email;
  final String image;
  final bool isOnline;

  factory ChatUserModel.fromJson(Map<String, dynamic> json) => ChatUserModel(
        uid: json['User Id'],
        name: json['First Name'],
        email: json['Email'],
        image: json['Profile Url'],
        isOnline: json['IsOnline'],
      );
}
