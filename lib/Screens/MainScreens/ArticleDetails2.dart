import 'package:cached_network_image/cached_network_image.dart';
import 'package:digestdraft/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ArticleDetailScreen extends ConsumerStatefulWidget {
  ArticleDetailScreen(
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
  ConsumerState<ConsumerStatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return ArticleDetails2(data: data, title: title, intro: intro, url: url);
  }
}

class ArticleDetails2 extends ConsumerState<ArticleDetailScreen> {
  ArticleDetails2(
      {required this.data,
      required this.title,
      required this.intro,
      required this.url});
  String title;
  String intro;
  String url;
  String data;

  int index = 0;

  final timer = Stopwatch();

  TocController readcontroller = TocController();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();

    itemPositionsListener.itemPositions.addListener(() {
      final position = itemPositionsListener.itemPositions.value.first;
      print(position.toString());

      ///TODO:record the index
    });
    timer.start();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print(timer.elapsed);
    timer.stop();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final markdown = ref.watch(BodyProvider(data));
    return Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: markdown.when(
              data: (data) {
                /*
                  MarkdownWidget(
                    tocController: readcontroller,
                    physics: const BouncingScrollPhysics(),
                    data: data.markdown!)
                */
                final markdownList =
                    MarkdownGenerator().buildWidgets(data.markdown!);
                print(markdownList.length);
                return ScrollablePositionedList.builder(
                  itemCount: markdownList.length,
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  itemBuilder: (context, index) {
                    return markdownList[index];
                  },
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Container(
                    child: Text(error.toString()),
                  ),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1.0,
                  ),
                );
              },
            )));
  }

  Widget BuildToc() {
    return TocWidget(controller: readcontroller);
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
