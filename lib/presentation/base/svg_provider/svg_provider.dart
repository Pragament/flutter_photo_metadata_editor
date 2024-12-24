import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SVGNotifier extends StateNotifier<List<Widget>> {
  SVGNotifier() : super([]) {
    _loadSVGThumbnails();
  }

  Future<void> _loadSVGThumbnails() async {
    final box = await Hive.openBox<String>('svgBox');
    final thumbnails = box.values.map((svgString) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide(width: 2.0,color: Colors.white),)),
          child: SvgPicture.string(
            svgString,
            // width: 100,
            // height: 100,
          ),
        ),
      );
    }).toList().reversed.toList();
    state = thumbnails;
  }

  Future<void> addSVG(String svgString) async {
    final box = await Hive.openBox<String>('svgBox');
    await box.add(svgString);
    await _loadSVGThumbnails(); // Reload thumbnails to reflect the new addition
  }
}

final svgProvider = StateNotifierProvider<SVGNotifier, List<Widget>>((ref) {
  return SVGNotifier();
});
