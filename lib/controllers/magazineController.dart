import 'package:digestdraft/controllers/accountController.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';

class Magazines {
  int? page;
  int? perPage;
  int? totalPages;
  int? totalItems;
  List<Items>? items;

  Magazines(
      {this.page, this.perPage, this.totalPages, this.totalItems, this.items});

  Magazines.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['perPage'] = perPage;
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? cover;
  String? title;
  String? mag;

  Items(
      {this.id,
      this.collectionId,
      this.collectionName,
      this.created,
      this.updated,
      this.cover,
      this.title,
      this.mag});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    updated = json['updated'];
    cover = json['cover'];
    title = json['title'];
    mag = json['mag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['updated'] = updated;
    data['cover'] = cover;
    data['title'] = title;
    data['mag'] = mag;
    return data;
  }
}

final magazinesprovider = FutureProviderFamily<Magazines, String>((ref, arg) {
  final pb = ref.read(clientprovider);
  return MagazinesApi.GetMagazines(pb);
});

class MagazinesApi {
  static Future<Magazines> GetMagazines(PocketBase pb,
      {Map<String, dynamic> queries = const {'read': '1'},
      String filter = ''}) async {
    // fetch a paginated records list
    final resultList = await pb.collection('editions').getList(
      page: 1,
      perPage: 10,
      sort: '-created',
      query: queries,
      filter: filter.isNotEmpty ? filter : null,
      headers: {'client': 'flutter'},
    );

    for (var element in resultList.items) {
      final url = pb.files.getUrl(element, element.data['cover']).toString();
      print(url);
      element.data['cover'] = url;
    }
    //print(resultList.items.first);
    return Magazines.fromJson(resultList.toJson());
  }
}
