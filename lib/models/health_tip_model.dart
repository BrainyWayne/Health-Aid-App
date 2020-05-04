import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_aid_app/models/metadata_model.dart';

class HEALTHTIP {
  String title;
  Timestamp timestamp;
  String url;
  String details;
  METADATA metadata;

  HEALTHTIP({
    this.title,
    this.timestamp,
    this.url,
    this.details,
    this.metadata,
  });

  factory HEALTHTIP.fromFirestore(DocumentSnapshot snap) {
    var data = snap.data;

    return HEALTHTIP(
      title: data['title'],
      timestamp: data['timestamp'],
      url: data['url'],
      details: data['details'],
      metadata: METADATA(
        exists: snap.exists,
        fromCache: snap.metadata.isFromCache,
        ref: snap.reference,
      ),
    );
  }

  toMap() => {
        'title': title,
        'timestamp': timestamp,
        'url': url,
        'details': details,
      };
}
