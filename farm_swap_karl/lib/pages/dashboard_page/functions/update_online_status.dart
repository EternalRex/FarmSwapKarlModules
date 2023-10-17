import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_karl/pages/dashboard_page/functions/online_status_querry.dart';

class UpdateOnlineStatus {
  UpdateOnlineStatusQuerry updateQuery = UpdateOnlineStatusQuerry();

  Future<void> updateOnlineStatus(String userid, bool active) async {
    await updateQuery.getDocumentId(userid);
    final document = FirebaseFirestore.instance.collection('Users').doc(updateQuery.documentId);
    final statusUpdate = {'IsOnline': active};
    document.update(statusUpdate);
  }
}
