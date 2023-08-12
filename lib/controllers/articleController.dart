import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';

import 'accountController.dart';

class Body {
  String? markdown;
  String? article;
}

class ReachMetrics {
  String? id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  int? readtime;
  int? scrollindex;
  int? totalindex;
  int? totalreadtime;
  int? readcount;
  String? article;
  Scrollpercents? scrollpercents;
  Scrollpercents? readpercents;

  ReachMetrics(
      {this.id,
      this.collectionId,
      this.collectionName,
      this.created,
      this.updated,
      this.readtime,
      this.scrollindex,
      this.totalindex,
      this.totalreadtime,
      this.readcount,
      this.article,
      this.scrollpercents,
      this.readpercents});

  ReachMetrics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    updated = json['updated'];
    readtime = json['readtime'];
    scrollindex = json['scrollindex'];
    totalindex = json['totalindex'];
    totalreadtime = json['totalreadtime'];
    readcount = json['readcount'];
    article = json['article'];
    scrollpercents = json['scrollpercents'] != null
        ? Scrollpercents.fromJson(json['scrollpercents'])
        : null;
    readpercents = json['readpercents'] != null
        ? Scrollpercents.fromJson(json['readpercents'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['updated'] = updated;
    data['readtime'] = readtime;
    data['scrollindex'] = scrollindex;
    data['totalindex'] = totalindex;
    data['totalreadtime'] = totalreadtime;
    data['readcount'] = readcount;
    data['article'] = article;
    if (scrollpercents != null) {
      data['scrollpercents'] = scrollpercents!.toJson();
    }
    if (readpercents != null) {
      data['readpercents'] = readpercents!.toJson();
    }
    return data;
  }
}

class Scrollpercents {
  Map<String, int>? percents = {};

  Scrollpercents({this.percents});

  Scrollpercents.fromJson(Map<String, dynamic> json) {
    for (var element in json.entries) {
      percents![element.key] = element.value as int;
    }
  }

  Map<String, dynamic> toJson() {
    return percents!;
  }
}

final reachprovider =
    FutureProvider.family<String, Map<String, dynamic>>((ref, body) {
  PocketBase pb = ref.read(clientprovider);
  return ArticleApi.SendReach(pb, body);
});

final reachgetprovider = FutureProvider.family<ReachMetrics, String>((ref, id) {
  PocketBase pb = ref.read(clientprovider);
  return ArticleApi.GetReach(pb, id);
});

class ArticleApi {
  static Future<ReachMetrics> GetReach(PocketBase pb, String id) async {
    final output = await pb
        .collection('reaches')
        .getFirstListItem('article="$id"', query: {'client': 'flutter'});
    return ReachMetrics.fromJson(output.toJson());
  }

  static Future<String> SendReach(
      PocketBase pb, Map<String, dynamic> body) async {
    print("Called send reach");

    ReachMetrics metrics = body['metrics'];
    print('readcount');
    metrics.readcount = (metrics.readcount!.toInt() + 1);
    print('readtime');

    metrics.readtime = (metrics.readtime! +
            (((body['time'] as int) - metrics.readtime!) / metrics.readcount!))
        .toInt();
    print('scrollindex');
    metrics.scrollindex = (metrics.scrollindex! +
            (((body['index'] as int) - metrics.scrollindex!) /
                metrics.readcount!))
        .toInt();
    print('percentscroll');
    int percentScroll =
        (((body['index'] as int) / metrics.totalindex!.toInt()) * 10).toInt();
    print('timepercent');
    int timepercent =
        (((body['time'] as int) / metrics.totalreadtime!.toInt()) * 10).toInt();
    print('assign percent scroll');
    metrics.scrollpercents!.percents![percentScroll.toString()] = percentScroll;
    print('assign percent time');
    metrics.readpercents!.percents![timepercent.toString()] = timepercent;
    print('assign body1');
    Map<String, dynamic> body1 = {
      "readtime": metrics.readtime,
      "readcount": metrics.readcount,
      "scrollindex": metrics.scrollindex,
      "scrollpercents": metrics.scrollpercents!.toJson(),
      "readpercents": metrics.readpercents!.toJson(),
    };
    print("calling update");
    print(metrics.id);
    final result = await pb
        .collection('reaches')
        .update(metrics.id!, body: body1, headers: {'client': 'flutter'});
    print(result.updated);

    return result.updated;
  }
}
