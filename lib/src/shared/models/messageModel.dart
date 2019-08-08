// To parse this JSON data, do
//
//     final meesageModel = meesageModelFromJson(jsonString);

import 'dart:convert';

MeesageModel meesageModelFromJson(String str) => MeesageModel.fromJson(json.decode(str));

String meesageModelToJson(MeesageModel data) => json.encode(data.toJson());

class MeesageModel {
    int mesChaId;
    String mesContent;
    DateTime mesCreatedAt;
    int mesId;
    int mesUseId;

    MeesageModel({
        this.mesChaId,
        this.mesContent,
        this.mesCreatedAt,
        this.mesId,
        this.mesUseId,
    });

    setMessage(var json){
      print(json['message']);
    }

    factory MeesageModel.fromJson(Map<String, dynamic> json) => new MeesageModel(
        mesChaId: json["mes_cha_id"],
        mesContent: json["mes_content"],
        mesCreatedAt: DateTime.parse(json["mes_created_at"]),
        mesId: json["mes_id"],
        mesUseId: json["mes_use_id"],
    );

    Map<String, dynamic> toJson() => {
        "mes_cha_id": mesChaId,
        "mes_content": mesContent,
        "mes_created_at": mesCreatedAt.toIso8601String(),
        "mes_id": mesId,
        "mes_use_id": mesUseId,
    };
}
