/// name : "Earth (C-137)"
/// url : "https://rickandmortyapi.com/api/location/1"

class Origin {
  Origin({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Origin.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
Origin copyWith({  String? name,
  String? url,
}) => Origin(  name: name ?? _name,
  url: url ?? _url,
);
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}