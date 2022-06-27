import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AttemptsController extends GetxController{

  List allAttempts=[];

  void updateList(List l){
    print("l is : $l");
    List p=l;
   allAttempts.addAll(p);
   print("all attempts is $allAttempts");
   update();
  }


}