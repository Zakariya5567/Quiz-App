import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/controller/dashboard_controller.dart';

class RecentAttempt extends StatelessWidget {
  RecentAttempt({Key key}) : super(key: key);

  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.green,Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
          ),
        ),
        title: Text(
          "Recent Attempt Quiz",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
        ),
       // backgroundColor: Colors.green.shade800,
      ),
      body: GetBuilder(
          init: DashboardController(),
          builder: (controller) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.orange.shade600,
                      Colors.orange.shade400,
                      Colors.green.shade600,
                    ])),
                child:
                dashboardController.recentSubject==null &&
                    dashboardController.totalQuestion==null&&
                    dashboardController.correctAns==null &&
                    dashboardController.total==null &&
                    dashboardController.outOf==null?
                    Center(child: Text("No Quiz Attempt recently",style: TextStyle(
                      color:Colors.white,fontSize: 22,fontWeight: FontWeight.w500
                    ),),):

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.white70, Colors.white]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/medal.png",
                              scale: 4,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              dashboardController.recentSubject,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green.shade700),
                            ),
                            Text(
                              "Total Question ${dashboardController.totalQuestion}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  height: 1.5),
                            ),
                            Text(
                              "Correct Answer ${dashboardController.correctAns}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  height: 1.5),
                            ),
                            Text(
                              "Score ${dashboardController.total}/${dashboardController.outOf}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  height: 1.5),
                            ),
                          ]),
                    ),
                  ),
                ));
          }),
    );
  }
}
