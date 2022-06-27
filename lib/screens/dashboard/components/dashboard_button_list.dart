import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;
  final String buttonImage;
 // final Icon buttonIcon;
  const DashboardButton(
      {Key key, this.buttonTitle,this.onTap,this.buttonImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Material(
        color: Colors.white,
        child: InkWell(
          highlightColor: Colors.orange.shade600,
         borderRadius: BorderRadius.circular(5),
          onTap: onTap,
          child:Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.orange.shade300)
            ),

            height: 60,
            child:
                Row(
                  children: [
                    SizedBox(width: 15,),
                   // Icon(buttonIcon.icon,color: Colors.deepOrangeAccent,),
                    Container(height: 25,width: 25,
                    child:Image.asset(
                      "$buttonImage"
                    ),),
                    SizedBox(width: 15,),
                    Text("$buttonTitle",style: TextStyle(
                        color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18
                    ),),

                  ],
                )

          ),
        ),
      );
  }
}
