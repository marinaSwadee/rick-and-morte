/// count : 826
/// pages : 42
/// next : "https://rickandmortyapi.com/api/character?page=2"
/// prev : null

class Info {
  Info({
      num? count, 
      num? pages, 
      String? next, 
      dynamic prev,}){
    _count = count;
    _pages = pages;
    _next = next;
    _prev = prev;
}

  Info.fromJson(dynamic json) {
    _count = json['count'];
    _pages = json['pages'];
    _next = json['next'];
    _prev = json['prev'];
  }
  num? _count;
  num? _pages;
  String? _next;
  dynamic _prev;
Info copyWith({  num? count,
  num? pages,
  String? next,
  dynamic prev,
}) => Info(  count: count ?? _count,
  pages: pages ?? _pages,
  next: next ?? _next,
  prev: prev ?? _prev,
);
  num? get count => _count;
  num? get pages => _pages;
  String? get next => _next;
  dynamic get prev => _prev;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['pages'] = _pages;
    map['next'] = _next;
    map['prev'] = _prev;
    return map;
  }

}