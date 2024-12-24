import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_view_model.dart';
import 'package:flutter_template/presentation/destinations/weather/home/widgets/home_page_body/home_page_body_content.dart';
import 'package:flutter_template/presentation/base/svg_provider/svg_provider.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final svgThumbnails = ref.watch(svgProvider);
    final homeViewModel = ref.watch(homeViewModelProvider.notifier);

    if (svgThumbnails.isEmpty) {
      return Center(
        child: Text("No images picked yet"),
      );
    } else {
      return HomePageBodyContent(
        svgThumbnails: svgThumbnails,
        intentHandler: homeViewModel.onIntent,
      );
    }
  }
}
