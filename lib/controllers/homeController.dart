import 'package:digestdraft/controllers/accountController.dart';
import 'package:digestdraft/models/ArticleView.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';

final HomeDataProvider = FutureProvider<ArticlesView>((ref) {
  PocketBase pb = ref.read(clientprovider);
  final filter = ref.read(queryprovider);
  if (filter.isNotEmpty) {
    return HomeApi.GetArticles(pb, filter: filter);
  }
  return HomeApi.GetArticles(pb);
});
final HomeCategoryProvider =
    FutureProvider.family<ArticlesView, String>((ref, filter) {
  PocketBase pb = ref.read(clientprovider);
  //final filter = ref.read(queryprovider);
  if (filter.isNotEmpty) {
    return HomeApi.GetArticles(pb, filter: filter);
  }
  return HomeApi.GetArticles(pb);
});
final queryprovider = StateProvider((ref) {
  String filters = '';
  return filters;
});
final BodyProvider = FutureProvider.family<Body, String>((ref, id) {
  PocketBase pb = ref.read(clientprovider);

  return HomeApi.GetBody(id, pb);
});

class HomeApi {
  static Future<ArticlesView> GetArticles(PocketBase pb,
      {Map<String, dynamic> queries = const {'read': '1'},
      String filter = ''}) async {
    // fetch a paginated records list
    final resultList = await pb.collection('articles').getList(
          page: 1,
          perPage: 10,
          sort: '-created',
          query: queries,
          filter: filter.isNotEmpty ? filter : null,
        );
    //print(resultList.items.first);
    return ArticlesView.fromJson(resultList.toJson());
  }

  static Future<Body> GetBody(String id, PocketBase pb) async {
    final record = await pb.collection('body').getOne(
      id,
      query: {'read': '1'},
    );
    return Body.fromJson(record.toJson());
  }
}
