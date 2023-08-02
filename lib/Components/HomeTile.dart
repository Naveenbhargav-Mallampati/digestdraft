import 'package:cached_network_image/cached_network_image.dart';
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
      width: MediaQuery.of(context).size.width - 10,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Row(
          children: [
            right
                ? HeadingTile(heading: title, intro: intro)
                : ImageView(url: url),
            right
                ? ImageView(url: url)
                : HeadingTile(heading: title, intro: intro)
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
      borderRadius: BorderRadius.circular(20.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        width: (MediaQuery.of(context).size.width / 3) - 5,
        child: CachedNetworkImage(
          imageUrl: url,
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 4,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

class HeadingTile extends StatelessWidget {
  HeadingTile({super.key, required this.heading, required this.intro});
  String heading;
  String intro;
  TextStyle headingStyle = const TextStyle(
      color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.bold);

  TextStyle introStyle = const TextStyle(
      color: Colors.black54, fontSize: 12.0, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: (MediaQuery.of(context).size.width * (2 / 3)) - 5,
      decoration: const BoxDecoration(
        color: Colors.white60,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              heading,
              style: headingStyle,
              overflow: TextOverflow.visible,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0, left: 4.0, right: 4.0),
            child: Text(
              intro,
              style: introStyle,
              overflow: TextOverflow.visible,
            ),
          )
        ],
      ),
    );
  }
}
