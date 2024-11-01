import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jovial_svg/jovial_svg.dart';

final svgProvider = FutureProvider.family(
  (ref, String path) async {
    await Future.delayed(const Duration(seconds: 5));
    return path.startsWith('http')
        ? ScalableImage.fromSvgHttpUrl(Uri.parse(path))
        : ScalableImage.fromSvgAsset(
            rootBundle,
            path,
          );
  },
);
