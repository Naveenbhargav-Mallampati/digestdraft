import 'package:digestdraft/Components/HomeTile.dart';
import 'package:digestdraft/Screens/MainScreens/ArticleDetails2.dart';
import 'package:digestdraft/dummy/markdowns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:digestdraft/dummy/data1.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key, required this.data});
  Data1 data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(240),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: data.titles.length,
          itemBuilder: (context, index) {
            bool right = index.isEven ? false : true;
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ArticleDetails2(
                        data: Markdowns().data.first,
                        title: data.titles[index],
                        intro: data.intros[index],
                        url: data.urls[index]);
                  },
                ));
              },
              child: HomeTile(
                  right: right,
                  title: data.titles[index],
                  intro: data.intros[index],
                  url: data.urls[index]),
            );
          },
        ),
      ),
    );
  }
}
