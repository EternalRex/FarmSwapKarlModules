import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_karl/pages/admin_logs/database/admin_logs_save.dart';
import 'package:farm_swap_karl/pages/admin_logs/models/admin_logs_model.dart';

class AdminLogsInsertDataDb {
  AdminLogsSaving saving = AdminLogsSaving();

  Future<void> createAdminLogs(
      String? email, String? id, String activity, DateTime date) async {
    final adminLogs = AdminLogsModel(
      adminUserEmail: email,
      adminUserId: id,
      adminActivity: activity,
      adminActivityDate: date,
    );
    saving.createAdminLogs(adminLogs);
  }
}
