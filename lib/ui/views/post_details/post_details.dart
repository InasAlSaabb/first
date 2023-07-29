import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:quiz/core/data/models/apis/photo_model.dart';
import 'package:quiz/core/data/models/apis/post_model.dart';
import 'package:quiz/core/data/reposotories/photo_repository.dart';
import 'package:quiz/core/data/reposotories/post_repository.dart';
import 'package:quiz/core/enums/message_type.dart';
import 'package:quiz/main.dart';
import 'package:quiz/ui/views/creat_post/create_post.dart';

class PostDeatils extends StatefulWidget {
  final PostModel posts;
  const PostDeatils({
    super.key,
    required this.posts,
  });

  @override
  State<PostDeatils> createState() => _PostDeatilsState();
}

class _PostDeatilsState extends State<PostDeatils> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  List<PostModel> SocialList = [];
    List<PhotoModel> postlList = [];
    return SafeArea(
        child: Scaffold(
            body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      children: [
        Container(
            width: size.width * 0.9,
            height: size.width * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(size.width * 0.05), // set border radius
              border: Border.all(
                  color: Color.fromRGBO(112, 112, 112, 1), width: 2.0),
            ), // set border color and width),
            //color: AppColors.mainColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        PostRepository().DeletePost(widget.posts.id!).then(
                            (value) => value.fold((l) => {},
                                (r) => {context.push(CreatePost())}));
                      },
                      child: SvgPicture.asset(
                        "images/c2.svg",
                        height: 35,
                        width: 35,
                        color: Colors.red,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.posts.title ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromRGBO(22, 177, 145, 1)),
                      ),
                      10.ph,
                      Text(
                        widget.posts.body ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            )),
        20.ph,
        Text("Album:",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromRGBO(22, 177, 145, 1))),
        20.ph,
        FutureBuilder(
          future: PhotoRepository().getAll(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              snapshot.data!.fold((l) {
                CustomToast.showMessage(
                    size: size, message: l, messageType: MessageType.REJECTED);
              }, (r) {
                postlList.clear();
                postlList.addAll(r);
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
                    itemCount: postlList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: size.width * 0.05),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(size.width * 0.03),
                                width: size.width * 0.9,
                                height: size.width * 0.5,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      size.width * 0.03), // set border radius
                                  border: Border.all(
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                      width: 2.0),
                                ), // set border color and width),
                                //color: AppColors.mainColor,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: postlList[index].url ?? "",
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )),
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
      ],
    )));
  }
}
