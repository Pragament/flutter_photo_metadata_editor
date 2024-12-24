import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/base/intent/intent_handler_callback.dart';
import 'package:flutter_template/presentation/base/widgets/responsive/responsive_builder.dart';
import 'package:flutter_template/presentation/destinations/weather/home/home_screen_intent.dart';

class HomePageBodyContent extends StatelessWidget {
  final List<Widget> svgThumbnails; // Changed from UIListItem to Widget
  final IntentHandlerCallback<HomeScreenIntent> intentHandler;

  const HomePageBodyContent({
    super.key,
    required this.svgThumbnails, // Changed parameter name
    required this.intentHandler,
  });

  @override
  Widget build(BuildContext context) {
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
            children: svgThumbnails, // Use svgThumbnails instead of items
          );
        },
      );
    }
  }
}
