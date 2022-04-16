import 'package:wechana_app/model/province.dart';

class Region {
  String slug, name;
  List<Province> provinces;

  Region({required this.slug, required this.name, required this.provinces});
}
