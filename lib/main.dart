import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/svg_view.dart';

///
/// A minimal sample application using `jovial_svg` with an SVG file loaded
/// as an asset. This example shows the recommended way of using the library
/// with fixed assets that are loaded before the UI is created.
///
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: AssetSample()));
}

class AssetSample extends StatelessWidget {
  const AssetSample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SVG Sample',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SVGS'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  children: [
                    const Text('Asset Svgs'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: svgAssetPaths.map(
                        (path) {
                          final size =
                              (MediaQuery.sizeOf(context).width / 2) - 16;
                          return SvgView(
                            path: path,
                            height: size,
                            width: size,
                          );
                        },
                      ).toList(),
                    ),
                    const SizedBox(height: 10),
                    const Text('HttpUrl Svgs'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: svgHttpUrlPaths.map(
                        (path) {
                          final size =
                              (MediaQuery.sizeOf(context).width / 2) - 16;
                          return SvgView(
                            path: path,
                            height: size,
                            width: size,
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
