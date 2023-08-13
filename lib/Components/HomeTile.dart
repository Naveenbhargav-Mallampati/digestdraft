import 'package:cached_network_image/cached_network_image.dart';
import 'package:digestdraft/config/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTile extends ConsumerWidget {
  HomeTile(
      {super.key,
      required this.right,
      required this.title,
      required this.intro,
      required this.url});
  bool right;
  String title;
  String intro;
  String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      decoration: BoxDecoration(
          // color: Colors.white,
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            right
                ? HeadingTile(
                    heading: title,
                    intro: intro,
                    bg: ColorSchemes.backgroundWhite,
                    headingStyle: TextStyles().headingStyle,
                    introStyle: TextStyles().introStyle,
                  )
                : ImageView(url: url),
            right
                ? ImageView(url: url)
                : HeadingTile(
                    heading: title,
                    intro: intro,
                    bg: ColorSchemes.BackgroundBlack,
                    headingStyle: TextStyles().headingStyleWhite,
                    introStyle: TextStyles().introStyleWhite,
                  )
          ],
        ),
      ),
    );
  }
}

class ImageView extends StatefulWidget {
  ImageView({super.key, required this.url});
  String url;
  @override
  State<StatefulWidget> createState() {
    return ImageViewState(url: url);
  }
}

class ImageViewState extends State<ImageView> {
  ImageViewState({required this.url});
  String url;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        width: (MediaQuery.of(context).size.width / 2),
        child: CachedNetworkImage(
          imageUrl: url,
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 3,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
            );
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

class HeadingTile extends StatelessWidget {
  HeadingTile(
      {super.key,
      required this.heading,
      required this.intro,
      required this.bg,
      required this.headingStyle,
      required this.introStyle});
  String heading;
  String intro;
  Color? bg;
  TextStyle headingStyle;

  TextStyle introStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 3,
      width: (MediaQuery.of(context).size.width / 2),
      decoration: BoxDecoration(
        color: bg,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                heading,
                style: headingStyle,
                overflow: TextOverflow.fade,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(0.0),
            //   child: Text(
            //     intro,
            //     style: introStyle,
            //     overflow: TextOverflow.fade,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
