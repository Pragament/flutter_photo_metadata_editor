import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/presentation/base/svg_provider/svg_provider.dart';
import '../../../../../base/widgets/responsive/responsive_builder.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final svgThumbnails = ref.watch(svgProvider);
    // final homeViewModel = ref.watch(homeViewModelProvider.notifier);

    if (svgThumbnails.isEmpty) {
      return Center(
        child: Text("No images picked yet"),
      );
    } else {
      return ResponsiveBuilder(
        builder: (context, mediaQueryData, boxConstraints) {
          final columns =
          mediaQueryData.orientation == Orientation.landscape ? 2 : 1;
          return GridView.count( // Changed from UIList to GridView.count
            crossAxisCount: columns,
            children: svgThumbnails.map((svgString) {
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
            }).toList().reversed.toList(), // Use svgThumbnails instead of items
          );
    });}
  }
}
