// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
    QuestionModel({
        this.result,
        this.questions,
    });

    String result;
    List<Question> questions;

    factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        result: json["result"] == null ? null : json["result"],
        questions: json["questions"] == null ? null : List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? null : result,
        "questions": questions == null ? null : List<dynamic>.from(questions.map((x) => x.toJson())),
    };
}

class Question {
    Question({
        this.id,
        this.questionqategory,
        this.question,
        this.answera,
        this.answerb,
        this.answerc,
        this.answerd,
        this.correct,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String questionqategory;
    String question;
    String answera;
    String answerb;
    String answerc;
    String answerd;
    int correct;
    DateTime createdAt;
    DateTime updatedAt;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"] == null ? null : json["id"],
        questionqategory: json["questionqategory"] == null ? null : json["questionqategory"],
        question: json["question"] == null ? null : json["question"],
        answera: json["answera"] == null ? null : json["answera"],
        answerb: json["answerb"] == null ? null : json["answerb"],
        answerc: json["answerc"] == null ? null : json["answerc"],
        answerd: json["answerd"] == null ? null : json["answerd"],
        correct: json["correct"] == null ? null : json["correct"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "questionqategory": questionqategory == null ? null : questionqategory,
        "question": question == null ? null : question,
        "answera": answera == null ? null : answera,
        "answerb": answerb == null ? null : answerb,
        "answerc": answerc == null ? null : answerc,
        "answerd": answerd == null ? null : answerd,
        "correct": correct == null ? null : correct,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
