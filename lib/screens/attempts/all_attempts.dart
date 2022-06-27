import 'package:flutter/material.dart';
import 'package:quiz_app/controllers/controller/attempts_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllAttempts extends StatelessWidget {
   AllAttempts({ Key key }) : super(key: key);
  AttemptsController attemptsController=AttemptsController();

  @override
  Widget build(BuildContext context) {
    print("in screen");
 print(attemptsController.allAttempts);
    return Scaffold(
      appBar: AppBar(
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
        title: Text("All Attempt Quiz",
        style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
        //backgroundColor: Colors.green.shade800,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
                colors: [ Colors.orange.shade600,
              Colors.orange.shade400,
               Colors.green.shade600,])
        
        ),
          child:    
   
           ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
              return
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.white70, Colors.white]),
                    ),
                    child: ListTile(

                      leading: Container(
                        height: 100,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade500,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("${index+1}".toString(),style: TextStyle(
                            color: Colors.white,fontSize: 18,
                          )),
                        ),
                      ),

                      title:  Text(
                        "Maths",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.green.shade700),
                      ),
                      subtitle:   Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Total Question 5",    style: TextStyle(color: Colors.black54, fontSize: 16,
                                height: 1.5),),
                            Text("Correct Answer 2",    style: TextStyle(color: Colors.black54, fontSize: 16,
                                height: 1.5),),
                            Text("Score 20/50",    style: TextStyle(color: Colors.black54, fontSize: 16,
                                height: 1.5),),

                          ]),
                      // Text("Score: 20/40",style: TextStyle(
                      //   color: Colors.black54,fontSize: 16,
                      // ),),

                    ),
                  ),
                );

          }),


      ),
    );
  }
}