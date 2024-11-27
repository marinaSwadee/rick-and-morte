/// name : "Citadel of Ricks"
/// url : "https://rickandmortyapi.com/api/location/3"

class Location {
  Location({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Location.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
Location copyWith({  String? name,
  String? url,
}) => Location(  name: name ?? _name,
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