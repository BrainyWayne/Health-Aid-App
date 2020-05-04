import 'package:health_aid_app/models/doctor_model.dart';

class HOSPITAL {
  String name;
  String image;
  List<String> specialization;
  CONTACT contact;

  HOSPITAL({
    this.name,
    this.image,
    this.specialization,
    this.contact,
  });
}
