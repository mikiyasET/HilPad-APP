import 'package:flutter/material.dart';

class ScheduleCourseTile extends StatelessWidget {
  const ScheduleCourseTile({Key? key,required this.time,required this.detail,required this.title,this.color = Colors.blue,this.isBreak = false}) : super(key: key);
  final String time,detail,title;
  final Color color;
  final bool isBreak;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1,child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Center(child: Text(isBreak?"":time.substring(0,4),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400))),
        )),
        Expanded(
          flex: 7,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
            padding: const EdgeInsets.only(top: 20,bottom: 10,left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                if(!isBreak)
                  ListTile(
                  dense: true,
                  title: Text(title,style: TextStyle(color: color,fontSize: 20,fontWeight: FontWeight.w600),),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,color: color,)),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(detail,style: TextStyle(color:color,fontSize: 16,fontWeight: FontWeight.w400)),
                  ),
                  leading: Icon(Icons.verified_user_rounded,size:60,color: color),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0,top:isBreak? 10 : 25,bottom: 20),
                  child: Text(time,style: TextStyle(color: isBreak? Colors.grey : color,fontSize:isBreak? 20 : 15,fontWeight: isBreak? FontWeight.w400 :FontWeight.w500)),
                ),
              ],
            ),
          ),
        ),
      ],);
  }
}
