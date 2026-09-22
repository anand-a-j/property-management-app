import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

Future<void> precacheSvgImages() async {
  final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
  final assets = assetManifest.listAssets();

  final svgPaths = assets.where((path) => path.endsWith('.svg'));
  for (final svgPath in svgPaths) {
    final loader = SvgAssetLoader(svgPath);
    await svg.cache
        .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
  }
}
