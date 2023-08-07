import 'package:digestdraft/Components/HomeTile.dart';
import 'package:digestdraft/Screens/MainScreens/ArticleDetails2.dart';
import 'package:digestdraft/controllers/homeController.dart';
import 'package:digestdraft/dummy/markdowns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:digestdraft/dummy/data1.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key, required this.data});
  Data1 data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataref = ref.watch(HomeDataProvider);
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(240),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: dataref.when(
          data: (ArticlesView) {
            return ListView.builder(
              itemCount: ArticlesView.totalItems,
              itemBuilder: (context, index) {
                bool right = index.isEven ? false : true;
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ArticleDetails2(
                          data: Markdowns().data.first,
                          title: ArticlesView.items![index].heading!,
                          intro: ArticlesView.items![index].intro!,
                          url: ArticlesView.items![index].url!,
                        );
                      },
                    ));
                  },
                  child: HomeTile(
                    right: right,
                    title: ArticlesView.items![index].heading!,
                    intro: ArticlesView.items![index].intro!,
                    url: ArticlesView.items![index].url!,
                  ),
                );
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
        ),
      ),
    );
  }
}
