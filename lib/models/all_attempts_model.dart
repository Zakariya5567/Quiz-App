// To parse this JSON data, do
//
//     final allAttemptModel = allAttemptModelFromJson(jsonString);

import 'dart:convert';

List<AllAttemptModel> allAttemptModelFromJson(String str) => List<AllAttemptModel>.from(json.decode(str).map((x) => AllAttemptModel.fromJson(x)));

String allAttemptModelToJson(List<AllAttemptModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllAttemptModel {
    AllAttemptModel({
        this.subject,
        this.score,
    });

    String subject;
    String score;

    factory AllAttemptModel.fromJson(Map<String, dynamic> json) => AllAttemptModel(
        subject: json["subject"] == null ? null : json["subject"],
        score: json["score"] == null ? null : json["score"],
    );

    Map<String, dynamic> toJson() => {
        "subject": subject == null ? null : subject,
        "score": score == null ? null : score,
    };
}
