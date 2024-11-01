import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:myapp/svg_provider.dart';

class SvgView extends ConsumerWidget {
  final String path;
  final double height;
  final double width;
  const SvgView({super.key, required this.path, this.height = 100, this.width = 100});

  @override
  Widget build(BuildContext context, ref) {
    final getSvg = ref.watch(svgProvider(path));
    return SizedBox(
      height: height,
      width: width,
      child: getSvg.when(
        data: (si) => ScalableImageWidget(si: si),
        error: (e,s)=> Center(child: Text(e.toString()),),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

