import 'package:digestdraft/controllers/accountController.dart';
import 'package:digestdraft/models/ArticleView.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final HomeDataProvider = FutureProvider((ref) {
  PocketBase pb = ref.read(clientprovider);
  return HomeApi.GetArticles(pb);
});

final BodyProvider = FutureProvider.family<Body, String>((ref, id) {
  PocketBase pb = ref.read(clientprovider);
  return HomeApi.GetBody(id, pb);
});

class HomeApi {
  static Future<ArticlesView> GetArticles(PocketBase pb) async {
    // fetch a paginated records list
    final resultList = await pb.collection('articles').getList(
      page: 1,
      perPage: 10,
      sort: '-created',
      query: {'read': '1'},
    );
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
