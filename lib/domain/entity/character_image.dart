// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CharacterImage {
  String? imageUrl;
  String? imageType;

  CharacterImage(this.imageUrl, this.imageType);

  String? get imagePath {
    if(imageType != null && imageUrl != null) {
      return '$imageUrl.$imageType';
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': imageUrl,
      'extension': imageType,
    };
  }

  factory CharacterImage.fromMap(Map<String, dynamic> map) {
    return CharacterImage(
      map['path'] != null ? map['path'] as String : null,
      map['extension'] != null ? map['extension'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterImage.fromJson(String source) => CharacterImage.fromMap(json.decode(source) as Map<String, dynamic>);
}
