import 'package:flutter_map/flutter_map.dart';

LayerOptions osmLayer() => TileLayerOptions(
      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      subdomains: ['a', 'b', 'c'],
    );
