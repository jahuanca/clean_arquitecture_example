import 'package:clean_arquitecture/domain/entities/Persona.dart';
import 'package:clean_arquitecture/domain/entities/status_entity.dart';

class StatusResponse extends StatusEntity{
  StatusResponse({
        this.success,
        this.title,
        this.detail,
        this.data,
    });

    bool success;
    String title;
    String detail;
    Persona data;

    factory StatusResponse.fromJson(Map<String, dynamic> json) => StatusResponse(
      success: json["success"],
      title: json["title"],
      detail: json["detail"],
      data: json["data"].toJson(),
    );
}