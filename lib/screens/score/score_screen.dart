import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/controller/dashboard_controller.dart';
import 'package:quiz_app/controllers/controller/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/screens/dashboard/dashboard_screen.dart';

class ScoreScreen extends StatelessWidget {

  QuestionController _qnController = Get.put(QuestionController());

  DashboardController dashboardController=Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Get.off(DashboardScreen());
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.close,color: Colors.white,),
          onPressed: (){Get.off(DashboardScreen());},),
          title: Text("Score",style: TextStyle(fontSize: 24),),
          centerTitle: true,
          //backgroundColor: Colors.green.shade800,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green,Colors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                )
            ),
          ),
          elevation: 1,
        ),
        body:
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ Colors.orange.shade600,
                Colors.orange.shade400,
                 Colors.green.shade600,])

          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Spacer(flex: 2),
                Text(
                  "Score",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.white),
                ),
              SizedBox(height: 15,),
                Text(
                  "${_qnController.numOfCorrectAns * 10}/${ dashboardController.questionModel.questions.length * 10}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white),
                ),
               // Spacer(flex: 3),
                SizedBox(height: 150,),
                InkWell(
                  highlightColor: Colors.orange.shade700,
                  borderRadius: BorderRadius.circular(15),
                  onTap: (){Get.to(DashboardScreen());},

                  child: Container(
                    height: 45,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.green.shade600,
                          Colors.orange.shade600,
                          Colors.orange.shade600
                        ]
                      ),
                      // color: Colors.orange.shade800
                    ),

                    child: Center(child: Text("Back to dashboard",style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.w400
                    ),)),
                  ),
                )
              ],
            )
          ,
        )

      ),
    );
  }
}
