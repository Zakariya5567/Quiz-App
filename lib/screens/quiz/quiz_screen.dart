import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/controller/dashboard_controller.dart';
import 'package:quiz_app/controllers/controller/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
    QuestionController _controller = Get.put(QuestionController());

    DashboardController dashboardController=Get.put(DashboardController());


  BannerAd myBanner;
   BannerAd builBannerAd(){
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
       size: AdSize.largeBanner,
       listener: (MobileAdEvent event){
         myBanner..show();
       }
       );
  }

       @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    myBanner=builBannerAd()..load();
  }  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        //backgroundColor: Colors.green.shade800,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.green,Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
          ),
        ),
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child:
          Text("Skip")),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
                colors: [ Colors.orange.shade600,
              Colors.orange.shade400,
               Colors.green.shade600,])
        
        ),child: Body()),
    );
  }
}
