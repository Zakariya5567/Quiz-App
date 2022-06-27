import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/controller/dashboard_controller.dart';
import 'package:quiz_app/controllers/controller/question_controller.dart';
import 'package:quiz_app/screens/quiz/components/option.dart';

import 'progress_bar.dart';
class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller

    QuestionController _questionController = Get.put(QuestionController());
    DashboardController dashboardController = Get.put(DashboardController());

    return Stack(
      children: [
     //   SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        GetBuilder(
            init: DashboardController(),
            builder: (controller) {
              return SafeArea(
                child:
                // the follwing logic is used when the data is loading  indicator bar will be display
                //when the data loading will be completed the actual screeen will be display
                // when the user click on the subject quiz and no quiz avaible in the screen "no quiz " will be dispaly
                 dashboardController.isLoading == 1
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange.shade800,
                            //backgroundColor: Colors.orange.shade800
                            ),
                      )
                    : dashboardController.questionModel.questions.isEmpty?
                          Center(child: Text("No Questions",style: TextStyle(
                            color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600
                          ),),)     
                     :
                     Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                                horizontal: kDefaultPadding),
                            child: ProgressBar(),
                          ),
                          SizedBox(height: kDefaultPadding),
                       Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Obx(
                              () => Text.rich(
                                TextSpan(
                                  text:
                                      "Question ${_questionController.questionNumber.value}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(color:Colors.white),
                                  children: [
                                    TextSpan(
                                      text:
                                          "/${dashboardController.questionModel.questions.length}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(color:Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(thickness: 1.5),
                          SizedBox(height: kDefaultPadding),
                          Expanded(
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                                // Block swipe to next qn
                                physics: NeverScrollableScrollPhysics(),
                                controller: _questionController.pageController,
                                onPageChanged:
                                    _questionController.updateTheQnNum,
                                itemCount: dashboardController
                                    .questionModel.questions.length,
                                itemBuilder: (context, index) {
                                  final question=dashboardController.questionModel.questions[index];
                                  return Container(
    
                                    margin: EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding,
                                        vertical: 10),
                                    padding: EdgeInsets.all(kDefaultPadding),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          question.question,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(color: kBlackColor),
                                        ),
                                        SizedBox(height: kDefaultPadding / 2),

                                        Option(
                                          index: 1,
                                          text: question.answera,
                                              press: () => _questionController.checkAns(
                                                question.correct, 1),
                                        
                                        ),
                                          Option(
                                          index: 2,
                                          text: question.answerb,
                                                press: () => _questionController.checkAns(
                                                question.correct, 2),
                                        
                                        ),
                                          Option(
                                          index: 3,
                                          text: question.answerc,
                                                 press: () => _questionController.checkAns(
                                                question.correct, 3),
                                        
                                        ),
                                          Option(
                                          index:4,
                                          text: question.answerd,
                                               press: () => _questionController.checkAns(
                                                question.correct, 4),
                                        

                                        ),
                                        
                                        // ...List.generate(
                                        //   question.
                                        //   (index) => Option(
                                        //     index: index,
                                        //     text: question.options[index],
                                        //     press: () => _controller.checkAns(
                                        //         question, index),
                                        //   ),
                                        // ),
                                    
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
              );
            })
      ],
    );
  }
}
