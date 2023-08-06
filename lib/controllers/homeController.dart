import 'package:digestdraft/models/ArticleView.dart';
import 'package:pocketbase/pocketbase.dart';

class HomeApi {
  Future<ArticlesView> GetArticles(PocketBase pb) async {
    // fetch a paginated records list
    final resultList = await pb.collection('articles').getList(
          page: 1,
          perPage: 10,
          sort: '-created',
        );
    return ArticlesView.fromJson(resultList.toJson());
  }

  Future<Body> GetBody(String id, PocketBase pb) async {
    final record = await pb.collection('body').getOne(
          id,
        );
    return Body.fromJson(record.toJson());
  }
}
