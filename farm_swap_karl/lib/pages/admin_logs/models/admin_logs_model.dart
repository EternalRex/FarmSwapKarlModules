class AdminLogsModel {
  AdminLogsModel(
      {required this.adminUserEmail,
      required this.adminUserId,
      required this.adminActivity,
      required this.adminActivityDate});

  String? adminUserEmail;
  String? adminUserId;
  String adminActivity;
  DateTime adminActivityDate;

  toJson() {
    return {
      "Admin Email": adminUserEmail,
      "Admin Id": adminUserId,
      "Admin Activity": adminActivity,
      "Activity Date": adminActivityDate,
    };
  }
}
