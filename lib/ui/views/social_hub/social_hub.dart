import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/core/data/models/apis/post_model.dart';
import 'package:quiz/core/data/reposotories/post_repository.dart';
import 'package:quiz/core/enums/message_type.dart';
import 'package:quiz/main.dart';
import 'package:quiz/ui/views/creat_post/create_post.dart';
import 'package:quiz/ui/views/post_details/post_details.dart';


class SocialHub extends StatefulWidget {
  const SocialHub({super.key});

  @override
  State<SocialHub> createState() => _SocialHubState();
}

class _SocialHubState extends State<SocialHub> {
  
  List<PostModel> SocialList = [];
  
  @override
  Widget build(BuildContext context) {
    
final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      
      body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                
                colors: [
                  Color.fromARGB(255, 0, 157, 134).withOpacity(0.5),
                  Color.fromRGBO(255, 255, 255, 255)
                ],
               
              ),
            ),


        child: ListView(
          
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
               InkWell(
                onTap: (){
                  context.push(CreatePost());
                },
                 child: SvgPicture.asset(
                         "images/c1.svg",height: 80,
                         width: 80,
                         ),
               ),
            ],),
            Center(
              child: Container(child: 
              Image.asset("images/social.png")
              ,),
            ),
            20.ph,
       FutureBuilder(
                  future: PostRepository().getAll(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      snapshot.data!.fold((l) {
                        CustomToast.showMessage(
                            size: size,
                            message: l,
                            messageType: MessageType.REJECTED);
                      }, (r) {
                       SocialList.clear();
                       SocialList.addAll(r);
                      });
                    }
                    return snapshot.data == null
                        ? SpinKitCircle(
                            color: Colors.black,
                          )
                        : ListView.builder(
                          
                            physics: BouncingScrollPhysics(),
                            addAutomaticKeepAlives: true,
                            addRepaintBoundaries: true,
                            shrinkWrap: true,
                            itemCount: SocialList.length,
                            itemBuilder: (context, index) {
                    
                              return Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.width * 0.05),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDeatils(posts: SocialList[index],),
              ),);
                                      },
                                      child: Container(
                                          padding:
                                              EdgeInsets.all(size.width * 0.03),
                                          width: size.width * 0.9,
                                          height: size.width * 0.3,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                size.width *
                                                    0.05), // set border radius
                                            border: Border.all(
                                                color: Color.fromRGBO(112, 112, 112, 1),
                                                width: 2.0),
                                          ), // set border color and width),
                                          //color: AppColors.mainColor,
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            SocialList[index].title ??""
                                            ,
                                            style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                              color: Color.fromRGBO(22, 177, 145, 1)
                                            ),
                                          ),
                                          10.ph,
                                          Text(
                                            SocialList[index].body ??""
                                            ,style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black
                                            ),
                                            maxLines: 3,
                                          )
                                        ],
                                      )
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                  },
                ),
      
      
      
          ],
        ),
      ),
    ));
  }
}