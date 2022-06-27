import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:quiz_app/controllers/controller/dashboard_controller.dart';
import 'package:quiz_app/screens/about/about.dart';
import 'package:quiz_app/screens/attempts/all_attempts.dart';
import 'package:quiz_app/screens/attempts/recent_attempt.dart';
import 'package:quiz_app/screens/score/score_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';

class SideMenuBar extends StatelessWidget {
  SideMenuBar({Key key}) : super(key: key);

  DashboardController dashboardController=Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(bottomRight:Radius.circular(30)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ Colors.orange.shade700,Colors.orange.shade500,Colors.green.shade500,])
        ),
              child: GetBuilder(
                init:DashboardController(),
                builder: (dashboardController) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      // Icon(buttonIcon.icon,color: Colors.deepOrangeAccent,),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          
                        ),
                        child: Icon(Icons.person,color: Colors.orange.shade800,size: 39,),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        dashboardController.userName.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ],
                  );
                }
              ),
            ),

            SizedBox(
              height: 10,
            ),

            dashboardButton(Icons.quiz, "All Attempt Quiz",(){
              Get.to(AllAttempts());
            }),
            dashboardButton(Icons.history,"Recent Attempt Quiz",(){

               Get.to(RecentAttempt());

            }),

            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.orange,
            ),
            GetBuilder(
              init: DashboardController(),
              builder: (controller) {
                return dashboardButton(Icons.share, "Share",(){

                  dashboardController.share();

                });
              }
            ),

            dashboardButton(Icons.star, "Rate",(){

              LaunchReview.launch(androidAppId: "com.example.quiz_app");

            }),

            dashboardButton(Icons.error_outline, "About",(){
              print("dashboard");
              Get.to(About());
            }),

             SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.orange,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  Widget dashboardButton(IconData icon,String title,VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(top: 5,left: 20,right: 5),
      child:
      InkWell(
        highlightColor: Colors.orange.shade600,
        borderRadius: BorderRadius.circular(5),
        onTap: onTap,
        child: Container(
          height: 40,
          child: Row(
            children: [
              Icon(icon,color: Colors.orange,),
              SizedBox(
                width: 15,
              ),
              Text(
                "$title",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
