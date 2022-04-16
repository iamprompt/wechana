import 'package:wechana_app/model/province.dart';
import 'package:wechana_app/model/region.dart';

List<Region> regions = [
  Region(slug: 'central', name: 'Central', provinces: [
    Province(slug: 'bangkok', name: 'Bangkok'),
    Province(slug: 'nakhon-pathom', name: 'Nakhon Pathom'),
    Province(slug: 'nonthaburi', name: 'Nonthaburi'),
    Province(slug: 'pathum-thani', name: 'Pathum Thani'),
    Province(
        slug: 'phra-nakhon-si-ayutthaya', name: 'Phra Nakhon Si Ayutthaya'),
    Province(slug: 'samut-sakhon', name: 'Samut Sakhon'),
    Province(slug: 'samut-prakan', name: 'Samut Prakan'),
    Province(slug: 'saraburi', name: 'Saraburi'),
    Province(slug: 'suphanburi', name: 'Suphanburi'),
  ]),
  Region(slug: 'west', name: 'West', provinces: [
    Province(slug: 'kanchanaburi', name: 'Kanchanaburi'),
    Province(slug: 'ratchaburi', name: 'Ratchaburi'),
    Province(slug: 'phetchaburi', name: 'Phetchaburi'),
  ]),
  Region(slug: 'east', name: 'East', provinces: [
    Province(slug: 'chachoengsao', name: 'Chachoengsao'),
    Province(slug: 'chon-buri', name: 'Chon Buri'),
    Province(slug: 'prachinburi', name: 'Prachinburi'),
    Province(slug: 'srakaeo', name: 'Srakaeo'),
  ]),
  Region(slug: 'north-eastern', name: 'North Eastern', provinces: []),
  Region(slug: 'north', name: 'North', provinces: []),
  Region(slug: 'south', name: 'South', provinces: []),
];
