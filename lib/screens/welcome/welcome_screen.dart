import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/controller/dashboard_controller.dart';
import 'package:quiz_app/screens/dashboard/dashboard_screen.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {

 TextEditingController nameController=TextEditingController();

 DashboardController dashboardController=Get.put(DashboardController());
  
  @override
  Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:Colors.green.shade600,
    ));
    return 
      Scaffold(
        body: 
        Stack(
          children: [
           // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
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
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(flex: 2), //2/6
                      Text(
                        "Let's Play Quiz,",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text("Enter your informations below"),
                      Spacer(), // 1/6
                      TextField(
                        controller: nameController,
                       style: TextStyle(color: Colors. black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Full Name",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.white)
                            
                          ),
                          enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.white)
                            
                          ),
                          focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.white)
                            
                          ),
    
                          
                        ),
                      ),
                      Spacer(), // 1/6
                      InkWell(
                        onTap: (){

                          dashboardController.name(nameController.text);
                          nameController.text.isEmpty?
                          Get.snackbar("Name ", "Please Enter Your Name",backgroundColor: Colors.red):
                          Get.off(DashboardScreen());

                        },
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height*0.080,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                          decoration: BoxDecoration(
                            color: Colors.orange.shade600,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Text(
                            "Lets Start Quiz",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.white,fontSize: 18),
                          ),
                        ),
                      ),
                      Spacer(flex: 2), // it will take 2/6 spaces
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  
  }
}
