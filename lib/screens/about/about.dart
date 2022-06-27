import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          //backgroundColor:  Colors.orange.shade600,
          title: Text("About"),
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
        ),
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.orange.shade400,
            Colors.orange.shade400,
            Colors.green.shade600,
          ])),
      child: Stack(
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Container(
              decoration: BoxDecoration(
               // color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white70, Colors.white]),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                  child: ListTile(
                    // tileColor: Colors.green,
                    title: Text(
                      "About",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.green.shade700),
                    ),
                    subtitle: Text(
                      "A simple Quiz App that contains a set Subjects and "
                          "every subjects have its own quiz. A quiz contain questions "
                          "related to subjects "
                      "and its answers which checks for the correction of the "
                      "answer given by the user. It navigates through the "
                      "questions using dynamic programming "
                      "\n◉ Question title"
                          "\n◉ Answer options/choices "
                      "\n◉ Quiz timer."
                      "\n◉ Show quiz score as percentage."
                      "\n◉ View correct answer options."
                      "\n◉ View question results."
                      "\n◉ Randomize questions."
                          "\n \n \n",

                      style: TextStyle(color: Colors.black54, fontSize: 16,
                      height: 1.5),
                    ),
                  )),
            ),
          ),

          Positioned(
              left: 125,
              top: 20,
              child: Image.asset("assets/images/info_1.png",scale: 4.5,)
          ),
        ],
      ),
    ),
      
    );
  }
}
