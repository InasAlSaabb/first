import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/core/enums/message_type.dart';
import 'package:quiz/app/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
 SharedPreferences ?globalSharedPreference;
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
globalSharedPreference=await SharedPreferences.getInstance();

  runApp(const MyApp());
}
extension  emptypadding on num{
  SizedBox get ph => SizedBox(height: toDouble(),);
    SizedBox get pw => SizedBox(height: toDouble(),);
}

extension ExtendedNavigator on BuildContext{
  Future<dynamic> push(Widget page)async{
    Navigator.push(this, MaterialPageRoute(builder: (_)=>page));
  }
  // Future<dynamic> pushReplacement(Widget page)async{
  //   Navigator.pushReplacement(this, MaterialPageRoute(builder: (_)=>page));
  // }
  void pop (Widget page,[result]) async{
    return Navigator.of(this).pop(result);
  }
}












class CustomToast {
  static showMessage(
 {
  required Size size,
 required String message,
 MessageType? messageType=MessageType.INFO
 }
 )
{ 
  String imageName ='info';
  Color shadowColor=Colors.blue;
  switch(messageType){
    
    case MessageType.REJECTED:
     imageName='rejected-01';
     shadowColor=Colors.blue;
      break;
    case MessageType.SUCCESS:
     imageName='approved1-01';
     shadowColor=Colors.green;
      break;
    case MessageType.WARNING:
       imageName='warning';
       shadowColor=Colors.blue;
    
      break;
    case MessageType.INFO:
      imageName='info';
     shadowColor=Colors.blue;
      break;
      default:null;
      break;
  }
  BotToast.showCustomText(
    duration:Duration(seconds: 15),
    toastBuilder:(value){
      return Container(
        width: size.width*0.75,
        height: size.width*0.75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),

            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size.width*0.06,
          ),
          SvgPicture.asset('images/$imageName.svg',
          width: size.width*0.1,
          height: size.width*0.1,
          ),
          SizedBox(height: size.width*0.06,),
          Text(message),
          SizedBox(height: size.width*0.06,)
        ],
        ),
      );
    }
  );


 }

}

