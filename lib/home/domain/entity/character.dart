// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:marvel/home/domain/entity/character_image.dart';

class Character {
  int id;
  String name;
  String? description;
  CharacterImage? image;

  Character(this.id, this.name, this.description, this.image);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      map['id'] as int,
      map['name'] as String,
      map['description'] == null
          ? 'No description found'
          : map['description'] == ""
              ? 'No description found'
              : map['description'] as String,
      map['thumbnail'] != null ? CharacterImage.fromMap(map['thumbnail']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) => Character.fromMap(json.decode(source) as Map<String, dynamic>);
}
