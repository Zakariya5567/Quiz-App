import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:quiz_app/controllers/connect/dashboard_connect.dart';
import 'package:quiz_app/models/categories_model.dart';
import 'package:quiz_app/models/question_model.dart';

class DashboardController extends GetxController{

DashboardConnect dashboardConnect=DashboardConnect();

CategoriesModel categoriesModel;

QuestionModel questionModel;

String userName;
String subjectName ;
String recentSubject;
int total;
int outOf;
int correctAns;
int totalQuestion;



void setSubjectName(String subjName){
  subjectName=subjName;
  update();
}


void name(String name){
  userName=name;
  update();
}

void setRecentSubjectName(){
  recentSubject=subjectName;
  update();
}
void setTotal(int newTotal){
  total=newTotal;
  update();
}
void setOutOf(int newOut){
  outOf=newOut;
  update();
}
void setCorrectAns(int newCorrectAns){
  correctAns=newCorrectAns;
  update();
}
void setTotalQuestion(int newTotalQuestion){
  totalQuestion=newTotalQuestion;
  update();
}



int isLoading;

  @override
  void onInit(){
    // TODO: implement onInit
    super.onInit();
   getCategories();
    update();
  }
  

// calling api to get data form database
// get categorires (subjects)

 getCategories()async{
     isLoading=1;
    print("isloading $isLoading");
  categoriesModel= await dashboardConnect.getCategoriesApi();
     isLoading=0;
       print("isloading $isLoading");
  update();

 }

// get categorires questuion

getQuestion(int id)async{
    isLoading=1;
    print("isloading $isLoading");
 questionModel = await dashboardConnect.getQuestionApi(id);
  isLoading=0;
       print("isloading $isLoading");
  update();
}

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

}