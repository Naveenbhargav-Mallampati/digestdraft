import 'package:digestdraft/Components/HomeTile.dart';
import 'package:digestdraft/Screens/MainScreens/ArticleDetails2.dart';
import 'package:digestdraft/controllers/profile/profileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedArticleScreen extends ConsumerWidget {
  SavedArticleScreen({
    super.key,
    required this.filter,
  });
  String filter;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataref = ref.watch(SavedProvider(''));
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(240),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: dataref.when(
          data: (ArticlesView) {
            return ListView.builder(
              itemCount: 10, //ArticlesView.totalItems,
              itemBuilder: (context, index) {
                bool right = index.isEven ? false : true;
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ArticleDetailScreen(
                          data: ArticlesView.items![index].body!,
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
