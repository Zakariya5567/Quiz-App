import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/controllers/controller/dashboard_controller.dart';
import 'package:quiz_app/screens/dashboard/components/side_menu_bar.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'components/dashboard_button_list.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  DashboardController dashboardController =
      Get.put<DashboardController>(DashboardController());

BannerAd myBanner;
  BannerAd builBannerAd(){
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
       size: AdSize.largeBanner,
      // targetingInfo: MobileAdTargetingInfo(testDevices: ["58EFDCB3AE3D5038EA35A53E61496AEE"]),
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green.shade600,
    ));
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return showPopUpMessage();
        },
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            drawer: SideMenuBar(),
            body: GetBuilder(
                init: DashboardController(),
                builder: (controller) {
                  return Container(
                      child: Column(
                    children: [
                      Stack(

                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/appBar.png"))),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orange.shade600),
                                  child: Center(
                                    child: Icon(
                                      Icons.person_outline,
                                      size: 50,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    scaffoldKey.currentState.openDrawer();
                                  },
                                  icon: Icon(Icons.menu),
                                  color: Colors.white),
                              Text(
                                "Dashboard",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.headset),
                                  color: Colors.transparent),
                            ],
                          ),
                        ],
                      ),
                      dashboardController.isLoading == 1
                          ? Center(
                              child: CircularProgressIndicator(
                                  color: Colors.orange.shade500),
                            )
                          : Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: ListView.builder(

                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: dashboardController
                                            .categoriesModel.categories.length,
                                        itemBuilder: (context, index) {
                                     
                                          final categories = dashboardController
                                              .categoriesModel
                                              .categories[index];
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              DashboardButton(
                                                buttonImage:
                                                    "assets/images/book.png",
                                                buttonTitle: categories
                                                    .categoryname
                                                    .toString(),
                                                onTap: () {
                                                  print("hello");
                                                  dashboardController.setSubjectName(categories.categoryname.toString());
                                                  Get.to(QuizScreen());
                                                  dashboardController.getQuestion(categories.id);
                                                },
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.020,
                                              ),
                                          
                                            ],
                                          );
                                        })),
                              ),
                            )
                    ],
                  ));
                })),
      ),
    );
  }

  // pop up dialog
  // are you sure you want to exit
  showPopUpMessage() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            // actions: [Container(height: 200,width: 60,color: Colors.amber,)],
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              "Are you sure you want to exit",
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Yes"),
                onPressed: () {
                  SystemNavigator.pop();
                },
                color: Colors.orange,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text("No"),
                onPressed: () {
                  Get.back();
                },
                color: Colors.orange,
              )
            ],
          );
        });
  }
}
