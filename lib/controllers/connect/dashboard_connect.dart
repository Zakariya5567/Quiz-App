import 'dart:convert';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/models/categories_model.dart';
import 'package:http/http.dart'as http;
import 'package:quiz_app/models/question_model.dart';

class DashboardConnect extends GetConnect {

CategoriesModel categoriesModel=CategoriesModel();
QuestionModel questionModel=QuestionModel();

  var dio = Dio();


  Future<CategoriesModel> getCategoriesApi() async {
    String url="http://quiz.finxdigital.com/api/categories";
    print("Url: $url");
    try {
      final response = await dio.get(url);
      print("response is : $response");
      print("response data  is : ${response.data}");
      categoriesModel=CategoriesModel.fromJson(response.data);
      return categoriesModel;
    } catch (e) {
      print(e);
    }
    return categoriesModel;
  }



Future<QuestionModel> getQuestionApi(int id) async {
    String url="http://quiz.finxdigital.com/api/questions";
    print("Url: $url");
    print("category id : $id");
    try {
      final response = await dio.post(url,data:{'CategoryId':id});
      print("response is : $response");
     questionModel=QuestionModel.fromJson(response.data);
      return questionModel;
    } catch (e) {
      print(e);
    }
    return questionModel;
  }



  postDashboardConnect() async {
    try {
      final response =await dio.post('/test', data: {'id': 12, 'name': 'wendu'});
      print(response);
    } catch (e) {
      print(e);
    }
  }

}
