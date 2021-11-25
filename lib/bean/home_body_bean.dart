import 'dart:convert';

class HomeBodyBean{
  final List<IssueList> issueList;
  final String? nextPageUrl;
  final int? nextPublishTime;
  final String? newestIssueType;
  dynamic dialog;

  HomeBodyBean({
    required this.issueList,
    this.nextPageUrl,
    this.nextPublishTime,
    this.newestIssueType,
    this.dialog
  });

  factory HomeBodyBean.fromJson(dynamic item){
    List<IssueList> _issueList = [];
    _issueList.add(IssueList.fromJson(item['issueList'][0]));
    return HomeBodyBean(
      issueList: _issueList,
      nextPageUrl: item['nextPageUrl'],
      nextPublishTime: item['nextPublishTime'],
      newestIssueType: item['newestIssueType'],
      dialog: item['dialog'],
    );
  }
}

class IssueList{
  final int? count;
  late List<ItemList> itemList;

  IssueList({
    required this.itemList,
    this.count
  });
  factory IssueList.fromJson(dynamic item){
    List<ItemList> _itemList = [];
    item['itemList'].forEach((v){
      _itemList.add(ItemList.fromJson(v));
    });
    return IssueList(
        itemList: _itemList,
        count: item['count']
    );
  }
}

class ItemList{
  final int id;
  final String? type;
  final ItemData? data;

  ItemList({
    required this.id,
    this.type,
    this.data
  });
  factory ItemList.fromJson(dynamic item){
    ItemData _itemData = ItemData.fromJson(item["data"]);

    return ItemList(
      id: item['id'],
      type: item['type'],
      data: _itemData
    );
  }
}

class ItemData {
  final int? id;
  final Cover? cover;
  ItemData({
    required this.id,
    this.cover
  });

  factory ItemData.fromJson(dynamic item){
    Cover? _cover;
    if(item["cover"] != null){
      _cover = new Cover.fromJson(item["cover"]);
    }else{
      _cover = null;
    }
    return ItemData(id: item['id'], cover: _cover);
  }
}

class Cover{
  final String? feed;

  Cover({this.feed});

  factory Cover.fromJson(dynamic item ){
    return Cover(feed: item['feed']);
  }
}