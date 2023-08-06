class ArticlesView {
  int? page;
  int? perPage;
  int? totalPages;
  int? totalItems;
  List<Items>? items;

  ArticlesView(
      {this.page, this.perPage, this.totalPages, this.totalItems, this.items});

  ArticlesView.fromJson(Map<String, dynamic> json) {
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
  String? heading;
  String? intro;
  String? url;
  String? topic;
  int? views;
  int? likes;
  int? agree;
  String? body;
  String? topics;
  String? scope;

  Items(
      {this.id,
      this.collectionId,
      this.collectionName,
      this.created,
      this.updated,
      this.heading,
      this.intro,
      this.url,
      this.topic,
      this.views,
      this.likes,
      this.agree,
      this.body,
      this.topics,
      this.scope});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    updated = json['updated'];
    heading = json['heading'];
    intro = json['intro'];
    url = json['url'];
    topic = json['topic'];
    views = json['views'];
    likes = json['likes'];
    agree = json['agree'];
    body = json['body'];
    topics = json['topics'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['updated'] = updated;
    data['heading'] = heading;
    data['intro'] = intro;
    data['url'] = url;
    data['topic'] = topic;
    data['views'] = views;
    data['likes'] = likes;
    data['agree'] = agree;
    data['body'] = body;
    data['topics'] = topics;
    data['scope'] = scope;
    return data;
  }
}

class BodyView {
  int? page;
  int? perPage;
  int? totalPages;
  int? totalItems;
  List<Body>? items;

  BodyView(
      {this.page, this.perPage, this.totalPages, this.totalItems, this.items});

  BodyView.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      items = <Body>[];
      json['items'].forEach((v) {
        items!.add(Body.fromJson(v));
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

class Body {
  String? id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? articletext;
  String? markdown;

  Body(
      {this.id,
      this.collectionId,
      this.collectionName,
      this.created,
      this.updated,
      this.articletext,
      this.markdown});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    updated = json['updated'];
    articletext = json['articletext'];
    markdown = json['markdown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['updated'] = updated;
    data['articletext'] = articletext;
    data['markdown'] = markdown;
    return data;
  }
}
