// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blog _$BlogFromJson(Map<String, dynamic> json) {
  return Blog(
    id: json['id'] as String,
    authorId: json['authorId'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    content: json['content'] as String,
    dateCreated: json['dateCreated'] == null
        ? null
        : DateTime.parse(json['dateCreated'] as String),
    dateUpdated: json['dateUpdated'] == null
        ? null
        : DateTime.parse(json['dateUpdated'] as String),
  );
}

Map<String, dynamic> _$BlogToJson(Blog instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['authorId'] = instance.authorId;
  val['title'] = instance.title;
  writeNotNull('subtitle', instance.subtitle);
  val['content'] = instance.content;
  writeNotNull('dateCreated', instance.dateCreated?.toIso8601String());
  writeNotNull('dateUpdated', instance.dateUpdated?.toIso8601String());
  return val;
}
