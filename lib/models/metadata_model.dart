import 'package:cloud_firestore/cloud_firestore.dart';

class METADATA {
  bool exists;
  DocumentReference ref;
  bool fromCache;

  METADATA({
    this.exists,
    this.ref,
    this.fromCache,
  });
}
