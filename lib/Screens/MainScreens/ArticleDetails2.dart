import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';

class ArticleDetails2 extends ConsumerWidget {
  ArticleDetails2(
      {super.key,
      required this.data,
      required this.title,
      required this.intro,
      required this.url});
  String title;
  String intro;
  String url;
  String data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleWidget(data: title),
              ImageWidget(url: url),
              IntroWidget(data: intro),
              MarkdownWidget(data: data),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  TitleWidget({super.key, required this.data});
  String data;
  TextStyle headingStyle = const TextStyle(
      color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          data,
          style: headingStyle,
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  ImageWidget({super.key, required this.url});
  String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: url,
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width - 10,
        fit: BoxFit.cover,
      ),
    );
  }
}

class IntroWidget extends StatelessWidget {
  IntroWidget({super.key, required this.data});
  String data;
  TextStyle introStyle = const TextStyle(
      color: Colors.black54, fontSize: 12.0, fontWeight: FontWeight.normal);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          data,
          style: introStyle,
        ),
      ),
    );
  }
}
