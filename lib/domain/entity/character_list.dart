// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:marvel/domain/entity/character.dart';

class CharacterList extends Equatable {
  int? offset;
  int? limit;
  List<Character>? results;

  CharacterList(
    this.offset,
    this.limit,
    this.results,
  );

  factory CharacterList.fromMap(Map<String, dynamic> map) {
    var newMap = map['data'];
    return CharacterList(
      newMap['offset'] != null ? newMap['offset'] as int : null,
      newMap['limit'] != null ? newMap['limit'] as int : null,
      newMap['results'] != null
          ? List<Character>.from(
              (newMap['results']).map<Character?>(
                (x) => Character.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory CharacterList.fromJson(String source) => CharacterList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [offset, limit, results];
}
