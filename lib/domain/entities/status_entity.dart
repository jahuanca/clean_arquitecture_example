import 'package:clean_arquitecture/domain/entities/Persona.dart';

class StatusEntity{
  StatusEntity({
        this.success,
        this.title,
        this.detail,
        this.data,
    });

    bool success;
    String title;
    String detail;
    Persona data;

    factory StatusEntity.fromJson(Map<String, dynamic> json) => StatusEntity(
      success: json["success"],
      title: json["title"],
      detail: json["detail"],
      data: (json["data"] == null )
        ? null
        : Persona.fromJson(json['data'] as Map<String, dynamic>),
    );
}